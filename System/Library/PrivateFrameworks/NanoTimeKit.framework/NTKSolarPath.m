@implementation NTKSolarPath

- (NTKSolarPath)initWithBounds:(CGRect)a3 solarTimeModel:(id)a4 verticallyFitsPathToBounds:(BOOL)a5 usePlaceholderData:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  NTKSolarPath *v15;
  NTKSolarPath *v16;
  uint64_t v17;
  UIBezierPath *bezierPath;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKSolarPath;
  v15 = -[NTKSolarPath init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_bounds.origin.x = x;
    v15->_bounds.origin.y = y;
    v15->_bounds.size.width = width;
    v15->_bounds.size.height = height;
    objc_storeStrong((id *)&v15->_solarTimeModel, a4);
    v16->_verticallyFitsPathToBounds = a5;
    v16->_usePlaceholderData = a6;
    -[NTKSolarPath _computeSolarPath](v16, "_computeSolarPath");
    v17 = objc_claimAutoreleasedReturnValue();
    bezierPath = v16->_bezierPath;
    v16->_bezierPath = (UIBezierPath *)v17;

  }
  return v16;
}

- (id)_computeSolarPath
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  double v21;
  double v22;
  UIBezierPath *v23;
  uint64_t v24;
  double v25;
  void *v26;
  uint64_t v27;
  CGPoint *v28;
  double v35;
  double v36;
  float64x2_t v37;

  -[NTKSolarTimeModel effectiveSolarDayLength](self->_solarTimeModel, "effectiveSolarDayLength");
  v4 = v3;
  -[NTKSolarTimeModel localSolarMidnightDate](self->_solarTimeModel, "localSolarMidnightDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSolarTimeModel referenceLocation](self->_solarTimeModel, "referenceLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coordinate");
  v36 = v7;
  objc_msgSend(v6, "coordinate");
  v35 = v8;
  v9 = 0;
  width = self->_bounds.size.width;
  v11 = self->_bounds.size.height * 0.5;
  v12 = -v11;
  v13 = 1.17549435e-38;
  v14 = 3.40282347e38;
  v15 = 8;
  do
  {
    v16 = (double)((int)v9 - 3) / 24.0;
    objc_msgSend(v5, "dateByAddingTimeInterval:", v4 * v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_usePlaceholderData)
    {
      v18 = v16 * 6.28318531 + -1.57079633;
      v19 = sinf(v18);
      *(double *)&(&self->_bezierPath)[v15] = v11 + v12 * v19;
      self->_altitude[v9] = (float)(v19 * 30.0);
    }
    else
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D270E0]), "initWithLocation:date:body:", v17, 0, v36, v35);
      objc_msgSend(v20, "altitude");
      *(float *)&v21 = v21 * 0.0174532924;
      *(double *)&(&self->_bezierPath)[v15] = v11 + v12 * sinf(*(float *)&v21);
      objc_msgSend(v20, "altitude");
      self->_altitude[v9] = v22;

    }
    *(double *)((char *)&self->super.isa + v15 * 8) = width * v16;
    v23 = (&self->_bezierPath)[v15];
    if (v14 > *(double *)&v23)
      v14 = *(double *)&(&self->_bezierPath)[v15];
    if (v13 < *(double *)&v23)
      v13 = *(double *)&(&self->_bezierPath)[v15];

    ++v9;
    v15 += 2;
  }
  while (v9 != 29);
  if (self->_verticallyFitsPathToBounds)
  {
    v24 = 0;
    v25 = self->_bounds.size.height / (v13 - v14);
    do
    {
      self->_points[v24].y = v25 * (self->_points[v24].y - v14);
      ++v24;
    }
    while (v24 != 29);
  }
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "moveToPoint:", self->_points[3].x, self->_points[3].y);
  v27 = 0;
  v28 = &self->_points[5];
  __asm { FMOV            V0.2D, #6.0 }
  v37 = _Q0;
  do
  {
    objc_msgSend(v26, "addCurveToPoint:controlPoint1:controlPoint2:", v28[v27 - 1].x, v28[v27 - 1].y, vaddq_f64((float64x2_t)v28[v27 - 2], vdivq_f64(vsubq_f64((float64x2_t)v28[v27 - 1], (float64x2_t)v28[v27 - 3]), v37)), vaddq_f64((float64x2_t)v28[v27 - 1], vdivq_f64(vsubq_f64((float64x2_t)v28[v27 - 2], (float64x2_t)v28[v27]), v37)));
    ++v27;
  }
  while (v27 != 24);

  return v26;
}

- (double)altitudeAtPercentage:(double)a3
{
  double result;

  -[NTKSolarPath altitudeAtX:](self, "altitudeAtX:", self->_bounds.size.width * a3);
  return result;
}

- (double)altitudeAtX:(double)a3
{
  uint64_t v3;
  CGPoint *points;
  double *altitude;
  double x;
  double v7;
  double result;

  v3 = 0;
  points = self->_points;
  altitude = self->_altitude;
  while (v3 != 28)
  {
    x = points[v3].x;
    v7 = points[v3 + 1].x;
    ++altitude;
    ++v3;
    if (x <= a3 && v7 >= a3)
    {
      CLKInterpolateBetweenFloatsClipped();
      return result;
    }
  }
  return 0.0;
}

- (UIBezierPath)bezierPath
{
  return self->_bezierPath;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NTKSolarTimeModel)solarTimeModel
{
  return self->_solarTimeModel;
}

- (BOOL)verticallyFitsPathToBounds
{
  return self->_verticallyFitsPathToBounds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);
}

@end
