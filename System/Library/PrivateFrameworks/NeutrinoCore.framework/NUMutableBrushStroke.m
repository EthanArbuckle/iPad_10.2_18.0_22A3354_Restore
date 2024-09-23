@implementation NUMutableBrushStroke

- (NUMutableBrushStroke)initWithRadius:(float)a3 softness:(float)a4 opacity:(float)a5 clipRect:(id *)a6 pressureMode:(int64_t)a7
{
  void *v13;
  NUMutableBrushStroke *v14;
  $0AC6E346AE4835514AAA8AC86D8F4844 var1;
  double v16;
  _OWORD v18[2];
  objc_super v19[2];
  objc_super v20;

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 6000);
  v20.receiver = self;
  v20.super_class = (Class)NUMutableBrushStroke;
  v14 = -[NUMutableBrushStroke init](&v20, sel_init);
  memset(v19, 0, sizeof(v19));
  var1 = a6->var1;
  v18[0] = a6->var0;
  v18[1] = var1;
  *(float *)&var1.var0 = a4;
  *(float *)&v16 = a5;
  -[NUBrushStroke _initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:](v14, "_initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:", v19, v18, v13, a7, COERCE_DOUBLE(__PAIR64__(DWORD1(v18[0]), LODWORD(a3))), *(double *)&var1.var0, v16);

  return v14;
}

- (id)points
{
  return (id)-[NSMutableData copy](self->super._data, "copy");
}

- (void)appendPoint:(id)a3
{
  float var1;
  float var0;
  float v6;
  CGPoint origin;
  CGSize size;
  CGSize v9;
  $E2C29196C7A5C696474C6955C5A9CE06 v10;
  CGRect v11;
  CGRect v12;

  var1 = a3.var1;
  var0 = a3.var0;
  v10 = a3;
  -[NUBrushStroke radius](self, "radius");
  v12.origin.x = (float)(var0 - v6);
  v12.origin.y = (float)(var1 - v6);
  v12.size.width = (float)((float)(v6 * 2.0) + 1.0);
  v12.size.height = v12.size.width;
  NU::RectT<long>::RectT(&v11, &v12, 0);
  origin = (CGPoint)self->super._extent.origin;
  size = (CGSize)self->super._extent.size;
  v12 = v11;
  v11.origin = origin;
  v11.size = size;
  NU::RectT<long>::add((uint64_t *)&v11, (uint64_t *)&v12);
  v9 = v11.size;
  self->super._extent.origin = ($86B46DF249C2B4242DBB096758D29184)v11.origin;
  self->super._extent.size = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v9;
  -[NSMutableData appendBytes:length:](self->super._data, "appendBytes:length:", &v10, 12);
}

- (void)appendPoints:(id *)a3 pointCount:(int64_t)a4
{
  int64_t height;
  int64_t width;
  BOOL v9;
  int64_t y;
  int64_t x;
  uint64_t v12;
  uint64_t v13;
  int32x2_t v14;
  double v15;
  float32x2_t v16;
  $E2C29196C7A5C696474C6955C5A9CE06 *v17;
  int64_t v18;
  float32x2_t v19;
  int64x2_t v20;
  int64x2_t v21[2];
  CGRect v22;

  width = self->super._extent.size.width;
  height = self->super._extent.size.height;
  if (width)
    v9 = height == 0;
  else
    v9 = 1;
  if (v9)
  {
    y = 0x7FFFFFFFFFFFFFFFLL;
    v13 = 0x8000000000000000;
    v12 = 0x8000000000000000;
    x = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    x = self->super._extent.origin.x;
    y = self->super._extent.origin.y;
    v12 = width + x;
    v13 = height + y;
  }
  -[NUBrushStroke radius](self, "radius");
  if (a4 >= 1)
  {
    v15 = (float)((float)(*(float *)v14.i32 * 2.0) + 1.0);
    v16 = (float32x2_t)vdup_lane_s32(v14, 0);
    v17 = a3;
    v18 = a4;
    do
    {
      v19 = *(float32x2_t *)&v17->var0;
      ++v17;
      v22.origin = (CGPoint)vcvtq_f64_f32(vsub_f32(v19, v16));
      v22.size.width = v15;
      v22.size.height = v15;
      NU::RectT<long>::RectT(v21, &v22, 0);
      v20 = vaddq_s64(v21[1], v21[0]);
      if (v21[0].i64[0] < x)
        x = v21[0].i64[0];
      if (v12 <= v20.i64[0])
        v12 = v20.i64[0];
      if (v21[0].i64[1] < y)
        y = v21[0].i64[1];
      if (v13 <= v20.i64[1])
        v13 = v20.i64[1];
      --v18;
    }
    while (v18);
  }
  self->super._extent.origin.x = x;
  self->super._extent.origin.y = y;
  self->super._extent.size.width = v12 - x;
  self->super._extent.size.height = v13 - y;
  -[NSMutableData appendBytes:length:](self->super._data, "appendBytes:length:", a3, 12 * a4);
}

- (void)applyTransform:(CGAffineTransform *)a3
{
  uint64_t v5;
  float64x2_t v6;
  double v7;
  float v8;
  uint64_t v9;
  double v10;
  float *v11;
  float *v12;
  int64x2_t v13;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v14;
  float64x2_t v15;
  CGSize v16;
  CGPoint v17;
  _OWORD v18[2];
  CGRect v19;

  v5 = -[NUBrushStroke pointCount](self, "pointCount");
  v6 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->super._radius), *(float64x2_t *)&a3->a, self->super._radius);
  v7 = v6.f64[1];
  if (v6.f64[0] >= v6.f64[1])
    v7 = v6.f64[0];
  v8 = v7;
  self->super._radius = v8;
  if (v5 >= 1)
  {
    v9 = v5;
    v10 = v8 * 2.0 + 1.0;
    v11 = -[NSMutableData mutableBytes](self->super._data, "mutableBytes");
    v12 = &v11[3 * v9];
    v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v14 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)0;
    do
    {
      v16 = (CGSize)v14;
      v17 = (CGPoint)v13;
      v15 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v11[1]), *(float64x2_t *)&a3->a, *v11));
      *(float32x2_t *)v11 = vcvt_f32_f64(v15);
      v11 += 3;
      v19.origin = (CGPoint)vsubq_f64(v15, (float64x2_t)vdupq_lane_s64(COERCE__INT64(self->super._radius), 0));
      v19.size.width = v10;
      v19.size.height = v10;
      NU::RectT<long>::RectT(v18, &v19, 0);
      v19.origin = v17;
      v19.size = v16;
      NU::RectT<long>::add((uint64_t *)v18, (uint64_t *)&v19);
      v13 = (int64x2_t)v18[0];
      v14 = ($5BB7312FFE32F1AB3F1F5957C99A58B3)v18[1];
    }
    while (v11 != v12);
    self->super._extent.origin = ($86B46DF249C2B4242DBB096758D29184)v18[0];
    self->super._extent.size = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  NUBrushStroke *v6;
  double v7;
  double v8;
  double v9;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 size;
  $5BB7312FFE32F1AB3F1F5957C99A58B3 v11;
  _OWORD v13[2];
  _OWORD v14[2];

  v5 = (void *)-[NSMutableData mutableCopy](self->super._data, "mutableCopy");
  v6 = -[NUBrushStroke init](+[NUBrushStroke allocWithZone:](NUBrushStroke, "allocWithZone:", a3), "init");
  *(float *)&v7 = self->super._radius;
  *(float *)&v8 = self->super._softness;
  *(float *)&v9 = self->super._opacity;
  size = self->super._extent.size;
  v14[0] = self->super._extent.origin;
  v14[1] = size;
  v11 = self->super._clipRect.size;
  v13[0] = self->super._clipRect.origin;
  v13[1] = v11;
  -[NUBrushStroke _initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:](v6, "_initializeWithRadius:softness:opacity:extent:clipRect:data:pressureMode:", v14, v13, v5, self->super._pressureMode, v7, v8, v9);
  if ((!self->super._extent.size.width || !self->super._extent.size.height)
    && -[NUBrushStroke pointCount](v6, "pointCount") >= 1)
  {
    -[NUBrushStroke _updateExtent](v6, "_updateExtent");
  }

  return v6;
}

- (void)setRadius:(float)a3
{
  self->super._radius = a3;
  -[NUBrushStroke _updateExtent](self, "_updateExtent");
}

@end
