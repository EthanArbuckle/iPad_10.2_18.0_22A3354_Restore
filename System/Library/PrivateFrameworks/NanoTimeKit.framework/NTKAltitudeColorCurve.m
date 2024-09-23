@implementation NTKAltitudeColorCurve

- (id)colorForAltitude:(id)a3
{
  float var1;
  void *v5;
  double v6;
  void *v7;
  void *v8;

  var1 = a3.var1;
  -[NTKCubicColorCurve colorForFraction:](self, "colorForFraction:", *(double *)&a3.var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = var1;
  -[NTKCubicColorCurve colorForFraction:](self, "colorForFraction:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIInterpolateBetweenColors();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)rgbfColorForAltitude:(float)a3
{
  float32x4_t v6;
  float32x4_t v7;
  double result;
  float32x4_t v9;

  objc_msgSend(a1, "rgbfColorForFraction:", a2);
  v9 = v6;
  objc_msgSend(a1, "rgbfColorForFraction:", a3);
  *(_QWORD *)&result = vmlaq_n_f32(v9, vsubq_f32(v7, v9), a4).u64[0];
  return result;
}

@end
