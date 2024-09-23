@implementation HKMinMaxCoordinate

- (HKMinMaxCoordinate)initWithMin:(CGPoint)a3 max:(CGPoint)a4 userInfo:(id)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  id v11;
  HKMinMaxCoordinate *v12;
  HKMinMaxCoordinate *v13;
  objc_super v15;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMinMaxCoordinate;
  v12 = -[HKMinMaxCoordinate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_min.x = v9;
    v12->_min.y = v8;
    v12->_max.x = x;
    v12->_max.y = y;
    objc_storeStrong((id *)&v12->_userInfo, a5);
  }

  return v13;
}

- (HKMinMaxCoordinate)initWithChartPoint:(id)a3 xAxisTransform:(id)a4 yAxisTransform:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  HKMinMaxCoordinate *v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "xValueAsGenericType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinateForValue:", v11);
  v13 = v12;

  objc_msgSend(v10, "minYValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinateForValue:", v14);
  v16 = v15;

  objc_msgSend(v10, "maxYValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinateForValue:", v17);
  v19 = v18;

  objc_msgSend(v10, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = -[HKMinMaxCoordinate initWithMin:max:userInfo:](self, "initWithMin:max:userInfo:", v20, v13, v16, v13, v19);
  return v21;
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

  x = self->_min.x;
  y = self->_min.y;
  b = a3->b;
  c = a3->c;
  d = a3->d;
  tx = a3->tx;
  ty = a3->ty;
  v12 = tx + y * c + a3->a * x;
  v13 = ty + y * d + b * x;
  v14 = self->_max.x;
  v15 = self->_max.y;
  v16 = tx + c * v15 + a3->a * v14;
  v17 = ty + d * v15 + b * v14;
  if (a4)
  {
    v12 = HKUIFloorCGPointToScreenScale(v12, v13);
    v13 = v18;
    v16 = HKUIFloorCGPointToScreenScale(v16, v17);
    v17 = v19;
  }
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMin:max:userInfo:", self->_userInfo, v12, v13, v16, v17);
}

- (double)startXValue
{
  return self->_min.x;
}

- (double)distanceToPoint:(CGPoint)a3
{
  double v4;
  double v5;
  double result;

  -[HKMinMaxCoordinate min](self, "min");
  UIDistanceBetweenPoints();
  v5 = v4;
  -[HKMinMaxCoordinate max](self, "max");
  UIDistanceBetweenPoints();
  if (v5 < result)
    return v5;
  return result;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  double v7;
  double v8;
  double result;

  y = a3.y;
  -[HKMinMaxCoordinate min](self, "min", a3.x);
  v6 = v5;
  v7 = v5 - y;
  -[HKMinMaxCoordinate max](self, "max");
  result = v8 - y;
  if (vabdd_f64(v8, y) >= vabdd_f64(v6, y))
    return v7;
  return result;
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
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HKMinMaxCoordinate;
  -[HKMinMaxCoordinate description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_min);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_max);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { min(%@), max(%@} }"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isVisibleInChartRect:(CGRect)a3
{
  CGRect v4;

  v4.origin.x = self->_min.x;
  v4.origin.y = self->_min.y;
  v4.size.height = self->_max.y - v4.origin.y;
  v4.size.width = 1.0;
  return CGRectIntersectsRect(v4, a3);
}

- (CGPoint)min
{
  double x;
  double y;
  CGPoint result;

  x = self->_min.x;
  y = self->_min.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)max
{
  double x;
  double y;
  CGPoint result;

  x = self->_max.x;
  y = self->_max.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
