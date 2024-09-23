@implementation _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate

- (_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 userInfo:(id)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  id v11;
  _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate *v12;
  _HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate *v13;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate;
  v12 = -[_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_start.x = v9;
    v12->_start.y = v8;
    v12->_end.x = x;
    v12->_end.y = y;
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v13;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double x;
  double y;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  x = self->_start.x;
  y = self->_start.y;
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v12 = tx + y * c + a3->a * x;
  v13 = ty + y * d + b * x;
  v14 = self->_end.x;
  v15 = self->_end.y;
  v16 = tx + c * v15 + a3->a * v14;
  v17 = ty + d * v15 + b * v14;
  if (a4)
  {
    v12 = HKUIFloorCGPointToScreenScale(v12, v13);
    v13 = v18;
    v16 = HKUIFloorCGPointToScreenScale(v16, v17);
    v17 = v19;
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStart:end:userInfo:", self->_userInfo, v12, v13, v16, v17);
}

- (double)startXValue
{
  return self->_start.x;
}

- (double)endXValue
{
  return self->_end.x;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate;
  -[_HKJulianIndexedSevenDayQuantitySeriesBlockCoordinate description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_start);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_end);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CGPoint)start
{
  double x;
  double y;
  CGPoint result;

  x = self->_start.x;
  y = self->_start.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)end
{
  double x;
  double y;
  CGPoint result;

  x = self->_end.x;
  y = self->_end.y;
  result.y = y;
  result.x = x;
  return result;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
