@implementation _HKLineSeriesBlockCoordinate

- (_HKLineSeriesBlockCoordinate)initWithCoordinate:(CGPoint)a3 userInfo:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _HKLineSeriesBlockCoordinate *v9;
  _HKLineSeriesBlockCoordinate *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKLineSeriesBlockCoordinate;
  v9 = -[_HKLineSeriesBlockCoordinate init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_coordinate.x = x;
    v9->_coordinate.y = y;
    objc_storeStrong((id *)&v9->_userInfo, a4);
  }

  return v10;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  float64x2_t v5;
  double v6;
  double v7;
  double v9;

  v5 = vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, self->_coordinate.y), *(float64x2_t *)&a3->a, self->_coordinate.x));
  v6 = v5.f64[1];
  if (a4)
  {
    v9 = HKUIFloorCGPointToScreenScale(v5.f64[0], v5.f64[1]);
    v6 = v7;
  }
  else
  {
    v9 = v5.f64[0];
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCoordinate:userInfo:", self->_userInfo, v9, v6);
}

- (double)minYValue
{
  return self->_coordinate.y;
}

- (double)maxYValue
{
  return self->_coordinate.y;
}

- (double)startXValue
{
  return self->_coordinate.x;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_HKLineSeriesBlockCoordinate;
  -[_HKLineSeriesBlockCoordinate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_coordinate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CGPoint)coordinate
{
  double x;
  double y;
  CGPoint result;

  x = self->_coordinate.x;
  y = self->_coordinate.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
