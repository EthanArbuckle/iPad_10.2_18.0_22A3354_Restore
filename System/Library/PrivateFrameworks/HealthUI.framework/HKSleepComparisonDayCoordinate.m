@implementation HKSleepComparisonDayCoordinate

- (HKSleepComparisonDayCoordinate)initWithXValueStart:(double)a3 xValueEnd:(double)a4 sleepValue:(int64_t)a5 userInfo:(id)a6
{
  id v11;
  HKSleepComparisonDayCoordinate *v12;
  HKSleepComparisonDayCoordinate *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HKSleepComparisonDayCoordinate;
  v12 = -[HKSleepComparisonDayCoordinate init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_xValueStart = a3;
    v12->_xValueEnd = a4;
    v12->_sleepValue = a5;
    objc_storeStrong((id *)&v12->_userInfo, a6);
  }

  return v13;
}

- (double)startXValue
{
  return self->_xValueStart;
}

- (double)endXValue
{
  return self->_xValueEnd;
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  double xValueStart;
  double xValueEnd;
  double tx;
  CGFloat v8;
  double v9;
  double v10;
  double ty;
  double b;
  CGFloat v13;
  double v14;

  xValueStart = self->_xValueStart;
  xValueEnd = self->_xValueEnd;
  tx = a3->tx;
  v8 = a3->c * 0.0;
  v9 = tx + v8 + a3->a * xValueStart;
  v10 = tx + v8 + a3->a * xValueEnd;
  if (a4)
  {
    ty = a3->ty;
    b = a3->b;
    v13 = a3->d * 0.0;
    v14 = ty + v13 + b * xValueEnd;
    v9 = HKUIFloorCGPointToScreenScale(v9, ty + v13 + b * xValueStart);
    v10 = HKUIFloorCGPointToScreenScale(v10, v14);
  }
  return -[HKSleepComparisonDayCoordinate initWithXValueStart:xValueEnd:sleepValue:userInfo:]([HKSleepComparisonDayCoordinate alloc], "initWithXValueStart:xValueEnd:sleepValue:userInfo:", self->_sleepValue, self->_userInfo, v9, v10);
}

- (double)xValueStart
{
  return self->_xValueStart;
}

- (double)xValueEnd
{
  return self->_xValueEnd;
}

- (int64_t)sleepValue
{
  return self->_sleepValue;
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
