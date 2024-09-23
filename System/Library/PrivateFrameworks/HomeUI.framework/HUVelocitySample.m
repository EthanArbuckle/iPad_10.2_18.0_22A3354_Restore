@implementation HUVelocitySample

+ (id)sampleWithStart:(CGPoint)a3 end:(CGPoint)a4 startTime:(double)a5 endTime:(double)a6
{
  double y;
  double x;
  double v10;
  double v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setStart:", v11, v10);
  objc_msgSend(v12, "setEnd:", x, y);
  objc_msgSend(v12, "setStartTime:", a5);
  objc_msgSend(v12, "setEndTime:", a6);
  return v12;
}

- (CGVector)translation
{
  double v2;
  double v3;
  CGVector result;

  v2 = self->_end.x - self->_start.x;
  v3 = self->_end.y - self->_start.y;
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (double)dt
{
  return self->_endTime - self->_startTime;
}

- (CGVector)velocity
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGVector result;

  -[HUVelocitySample dt](self, "dt");
  v3 = 0.0;
  v4 = 0.0;
  if (v5 >= 0.00000011920929)
  {
    -[HUVelocitySample translation](self, "translation");
    v7 = v6;
    -[HUVelocitySample dt](self, "dt");
    v3 = v7 / v8;
    -[HUVelocitySample translation](self, "translation");
    v10 = v9;
    -[HUVelocitySample dt](self, "dt");
    v4 = v10 / v11;
  }
  v12 = v3;
  result.dy = v4;
  result.dx = v12;
  return result;
}

- (BOOL)isSampleDistinctFromPoint:(CGPoint)a3
{
  BOOL v3;

  v3 = vabdd_f64(a3.x, self->_end.x) >= 5.0;
  return vabdd_f64(a3.y, self->_end.y) >= 5.0 || v3;
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

- (void)setStart:(CGPoint)a3
{
  self->_start = a3;
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

- (void)setEnd:(CGPoint)a3
{
  self->_end = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
}

@end
