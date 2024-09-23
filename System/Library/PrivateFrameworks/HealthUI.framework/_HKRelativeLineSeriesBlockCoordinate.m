@implementation _HKRelativeLineSeriesBlockCoordinate

- (_HKRelativeLineSeriesBlockCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 userInfo:(id)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  _HKRelativeLineSeriesBlockCoordinate *result;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v7 = a3.y;
  v8 = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)_HKRelativeLineSeriesBlockCoordinate;
  result = -[_HKLineSeriesBlockCoordinate initWithCoordinate:userInfo:](&v10, sel_initWithCoordinate_userInfo_, a5);
  if (result)
  {
    result->_start.x = v8;
    result->_start.y = v7;
    result->_end.x = x;
    result->_end.y = y;
  }
  return result;
}

- (CGPoint)midpoint
{
  double v2;
  double v3;
  CGPoint result;

  UIMidPointBetweenPoints();
  result.y = v3;
  result.x = v2;
  return result;
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
  id v20;
  void *v21;
  void *v22;

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
  v20 = objc_alloc((Class)objc_opt_class());
  -[_HKLineSeriesBlockCoordinate userInfo](self, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithStart:end:userInfo:", v21, v12, v13, v16, v17);

  return v22;
}

- (double)startXValue
{
  return self->_start.x;
}

- (double)endXValue
{
  return self->_end.x;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)_HKRelativeLineSeriesBlockCoordinate;
  -[_HKLineSeriesBlockCoordinate description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_start);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_end);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

@end
