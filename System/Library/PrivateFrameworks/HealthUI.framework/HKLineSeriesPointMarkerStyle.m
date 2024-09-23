@implementation HKLineSeriesPointMarkerStyle

- (HKLineSeriesPointMarkerStyle)initWithColor:(id)a3 radius:(double)a4 style:(int64_t)a5
{
  id v8;
  HKLineSeriesPointMarkerStyle *v9;
  HKLineSeriesPointMarkerStyle *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKLineSeriesPointMarkerStyle;
  v9 = -[HKLineSeriesPointMarkerStyle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[HKLineSeriesPointMarkerStyle setPointColor:](v9, "setPointColor:", v8);
    -[HKLineSeriesPointMarkerStyle setRadius:](v10, "setRadius:", a4);
    -[HKLineSeriesPointMarkerStyle setPointMarkerStyle:](v10, "setPointMarkerStyle:", a5);
  }

  return v10;
}

- (UIColor)pointColor
{
  return self->_pointColor;
}

- (void)setPointColor:(id)a3
{
  objc_storeStrong((id *)&self->_pointColor, a3);
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (int64_t)pointMarkerStyle
{
  return self->_pointMarkerStyle;
}

- (void)setPointMarkerStyle:(int64_t)a3
{
  self->_pointMarkerStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointColor, 0);
}

@end
