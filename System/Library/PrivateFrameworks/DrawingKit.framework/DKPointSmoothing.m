@implementation DKPointSmoothing

- (DKPointSmoothing)initWithWidth:(unint64_t)a3 spacing:(float)a4
{
  DKPointSmoothing *v6;
  DKPointSmoothing *v7;
  uint64_t v8;
  UIQuadCurvePointFIFO *interpolatingFIFO;
  id v10;
  double v11;
  uint64_t v12;
  UIBoxcarFilterPointFIFO *boxcarFIFO;
  uint64_t v14;
  UIPointFIFO *strokeFIFO;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)DKPointSmoothing;
  v6 = -[DKPointSmoothing init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_width = a3;
    v6->_spacing = a4;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBB538]), "initWithFIFO:", 0);
    interpolatingFIFO = v7->_interpolatingFIFO;
    v7->_interpolatingFIFO = (UIQuadCurvePointFIFO *)v8;

    -[UIQuadCurvePointFIFO setEmitInterpolatedPoints:](v7->_interpolatingFIFO, "setEmitInterpolatedPoints:", 1);
    v10 = objc_alloc(MEMORY[0x24BEBB518]);
    *(float *)&v11 = v7->_spacing;
    v12 = objc_msgSend(v10, "initWithFIFO:width:spacing:", v7->_interpolatingFIFO, v7->_width, v11);
    boxcarFIFO = v7->_boxcarFIFO;
    v7->_boxcarFIFO = (UIBoxcarFilterPointFIFO *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BEBB530]), "initWithFIFO:", v7->_boxcarFIFO);
    strokeFIFO = v7->_strokeFIFO;
    v7->_strokeFIFO = (UIPointFIFO *)v14;

  }
  return v7;
}

- (DKPointSmoothing)init
{
  double v2;

  LODWORD(v2) = 1.0;
  return -[DKPointSmoothing initWithWidth:spacing:](self, "initWithWidth:spacing:", 1, v2);
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
  -[UIBoxcarFilterPointFIFO setWidth:](self->_boxcarFIFO, "setWidth:");
}

- (void)setSpacing:(float)a3
{
  self->_spacing = a3;
  -[UIBoxcarFilterPointFIFO setSpacing:](self->_boxcarFIFO, "setSpacing:");
}

- (void)setUnitScale:(float)a3
{
  self->_unitScale = a3;
  -[UIQuadCurvePointFIFO setUnitScale:](self->_interpolatingFIFO, "setUnitScale:");
}

- (void)setEmitInterpolatedPoints:(BOOL)a3
{
  self->_emitInterpolatedPoints = a3;
  -[UIQuadCurvePointFIFO setEmitInterpolatedPoints:](self->_interpolatingFIFO, "setEmitInterpolatedPoints:");
}

- (void)setEmissionHandler:(id)a3
{
  -[UIQuadCurvePointFIFO setEmissionHandler:](self->_interpolatingFIFO, "setEmissionHandler:", a3);
}

- (id)emissionHandler
{
  return (id)-[UIQuadCurvePointFIFO emissionHandler](self->_interpolatingFIFO, "emissionHandler");
}

- (void)addPoint:(DKPointSmoothing *)self
{
  -[UIPointFIFO addPoint:](self->_strokeFIFO, "addPoint:");
}

- (void)emitPoint:(DKPointSmoothing *)self
{
  -[UIPointFIFO emitPoint:](self->_strokeFIFO, "emitPoint:");
}

- (void)flush
{
  -[UIPointFIFO flush](self->_strokeFIFO, "flush");
}

- (void)clear
{
  -[UIPointFIFO clear](self->_strokeFIFO, "clear");
}

+ (uint64_t)interpolateFromPoint:toPoint:controlPoint:time:
{
  return objc_msgSend(MEMORY[0x24BEBB538], "interpolateFromPoint:toPoint:controlPoint:time:");
}

+ (void)_interpolateFromPoint:(float)a3 toPoint:(id)a4 withControlPoint:atUnitScale:emissionHandler:
{
  float32x4_t v4;
  float32x4_t v5;
  float v6;
  float v7;
  void (**v8)(void);
  float32x4_t v9;
  float32x4_t v10;
  float v11;
  unint64_t v12;
  _OWORD *v13;
  double v14;
  double v15;
  _OWORD *v16;
  double v17;
  double v18;
  uint64_t v19;
  __int128 v20;
  void (*v21)(void);
  void (**v22)(void);
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;

  v7 = v6;
  v23 = v5;
  v24 = v4;
  v25 = *(float32x4_t *)&a3;
  v8 = (void (**)(void))a4;
  v9 = vsubq_f32(v25, v23);
  v10 = vsubq_f32(v23, v24);
  v11 = (float)(sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v9, v9)))
              + sqrtf(vaddv_f32((float32x2_t)*(_OWORD *)&vmulq_f32(v10, v10))))
      / v7;
  v12 = vcvtps_u32_f32(v11);
  v22 = v8;
  if (v12)
  {
    if (!(v12 >> 60))
    {
      v13 = malloc_type_malloc(16 * v12, 0x55B83351uLL);
      v15 = *(double *)v24.i64;
      v16 = v13;
      v8 = v22;
      if (v16)
      {
        v17 = *(double *)v25.i64;
        v18 = *(double *)v23.i64;
        if ((int)v12 >= 1)
        {
          v19 = 0;
          do
          {
            *(float *)&v14 = (float)(int)v19 / v11;
            +[DKPointSmoothing interpolateFromPoint:toPoint:controlPoint:time:](DKPointSmoothing, "interpolateFromPoint:toPoint:controlPoint:time:", v17, v15, v18, v14);
            v18 = *(double *)v23.i64;
            v15 = *(double *)v24.i64;
            v17 = *(double *)v25.i64;
            v16[v19++] = v20;
          }
          while (v12 != v19);
        }
        if (!v22)
          goto LABEL_13;
        v21 = v22[2];
        goto LABEL_12;
      }
    }
  }
  else
  {
    v16 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
    v8 = v22;
    if (v16)
    {
      *v16 = v25;
      if (!v22)
      {
LABEL_13:
        free(v16);
        v8 = v22;
        goto LABEL_14;
      }
      v21 = v22[2];
LABEL_12:
      v21();
      goto LABEL_13;
    }
  }
LABEL_14:

}

- (unint64_t)width
{
  return self->_width;
}

- (float)spacing
{
  return self->_spacing;
}

- (float)unitScale
{
  return self->_unitScale;
}

- (BOOL)emitInterpolatedPoints
{
  return self->_emitInterpolatedPoints;
}

- (UIPointFIFO)strokeFIFO
{
  return self->_strokeFIFO;
}

- (void)setStrokeFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_strokeFIFO, a3);
}

- (UIBoxcarFilterPointFIFO)boxcarFIFO
{
  return self->_boxcarFIFO;
}

- (void)setBoxcarFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_boxcarFIFO, a3);
}

- (UIQuadCurvePointFIFO)interpolatingFIFO
{
  return self->_interpolatingFIFO;
}

- (void)setInterpolatingFIFO:(id)a3
{
  objc_storeStrong((id *)&self->_interpolatingFIFO, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpolatingFIFO, 0);
  objc_storeStrong((id *)&self->_boxcarFIFO, 0);
  objc_storeStrong((id *)&self->_strokeFIFO, 0);
}

@end
