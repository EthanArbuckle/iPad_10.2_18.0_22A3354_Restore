@implementation _MKJunctionElement

- (CGPoint)leftEdgePointAtDistanceFromBase:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __double2 v10;
  double v11;
  double v12;
  CGPoint result;

  -[_MKJunctionElement leftBasePoint](self, "leftBasePoint");
  v6 = v5;
  v8 = v7;
  -[_MKJunctionElement angle](self, "angle");
  v10 = __sincos_stret(v9);
  v11 = v8 + a3 * v10.__sinval;
  v12 = v6 + a3 * v10.__cosval;
  result.y = v11;
  result.x = v12;
  return result;
}

- (CGPoint)rightEdgePointAtDistanceFromBase:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __double2 v10;
  double v11;
  double v12;
  CGPoint result;

  -[_MKJunctionElement rightBasePoint](self, "rightBasePoint");
  v6 = v5;
  v8 = v7;
  -[_MKJunctionElement angle](self, "angle");
  v10 = __sincos_stret(v9);
  v11 = v8 + a3 * v10.__sinval;
  v12 = v6 + a3 * v10.__cosval;
  result.y = v11;
  result.x = v12;
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), *(_QWORD *)&self->_leftBasePoint.x, *(_QWORD *)&self->_leftBasePoint.y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGPoint(self->_rightBasePoint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, leftBase: %@, rightBase: %@, angle: %f>"), v5, self, v6, v7, *(_QWORD *)&self->_angle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGPoint)leftBasePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_leftBasePoint.x;
  y = self->_leftBasePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLeftBasePoint:(CGPoint)a3
{
  self->_leftBasePoint = a3;
}

- (CGPoint)rightBasePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_rightBasePoint.x;
  y = self->_rightBasePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setRightBasePoint:(CGPoint)a3
{
  self->_rightBasePoint = a3;
}

- (double)angle
{
  return self->_angle;
}

- (void)setAngle:(double)a3
{
  self->_angle = a3;
}

@end
