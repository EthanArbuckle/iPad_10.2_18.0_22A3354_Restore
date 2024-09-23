@implementation HKStackedCategoryValueSeriesCoordinate

- (HKStackedCategoryValueSeriesCoordinate)initWithStart:(CGPoint)a3 end:(CGPoint)a4 pointStyle:(int64_t)a5 userInfo:(id)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  id v13;
  HKStackedCategoryValueSeriesCoordinate *v14;
  HKStackedCategoryValueSeriesCoordinate *v15;
  objc_super v17;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HKStackedCategoryValueSeriesCoordinate;
  v14 = -[HKStackedCategoryValueSeriesCoordinate init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_start.x = v11;
    v14->_start.y = v10;
    v14->_end.x = x;
    v14->_end.y = y;
    v14->_pointStyle = a5;
    objc_storeStrong((id *)&v14->_userInfo, a6);
  }

  return v15;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double x;
  double y;
  double c;
  double tx;
  double v9;
  double v10;
  double v11;
  double v12;
  double ty;
  double b;
  double d;
  double v16;

  x = self->_start.x;
  y = self->_start.y;
  c = a3->c;
  tx = a3->tx;
  v9 = tx + y * c + a3->a * x;
  v10 = self->_end.x;
  v11 = self->_end.y;
  v12 = tx + v11 * c + a3->a * v10;
  if (a4)
  {
    ty = a3->ty;
    b = a3->b;
    d = a3->d;
    v16 = ty + v11 * d + b * v10;
    v9 = HKUIFloorCGPointToScreenScale(v9, ty + y * d + b * x);
    v12 = HKUIFloorCGPointToScreenScale(v12, v16);
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithStart:end:pointStyle:userInfo:", self->_pointStyle, self->_userInfo, v9, y, v12, v11);
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
  v9.super_class = (Class)HKStackedCategoryValueSeriesCoordinate;
  -[HKStackedCategoryValueSeriesCoordinate description](&v9, sel_description);
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

- (int64_t)pointStyle
{
  return self->_pointStyle;
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
