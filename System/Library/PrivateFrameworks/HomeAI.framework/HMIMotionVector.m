@implementation HMIMotionVector

- (HMIMotionVector)initWithOrigin:(CGPoint)a3 motion:(CGVector)a4
{
  CGFloat dy;
  CGFloat dx;
  CGFloat y;
  CGFloat x;
  HMIMotionVector *v8;
  HMIMotionVector *v9;
  Class eventClass;
  objc_super v12;

  dy = a4.dy;
  dx = a4.dx;
  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)HMIMotionVector;
  v8 = -[HMIMotionVector init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_origin.x = x;
    v8->_origin.y = y;
    v8->_motion.dx = dx;
    v8->_motion.dy = dy;
    eventClass = v8->_eventClass;
    v8->_eventClass = 0;

  }
  return v9;
}

- (CGPoint)target
{
  double v2;
  double v3;
  CGPoint result;

  v2 = self->_origin.x + self->_motion.dx;
  v3 = self->_origin.y + self->_motion.dy;
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)midpoint
{
  float64x2_t v7;
  double v8;
  CGPoint result;

  __asm { FMOV            V2.2D, #0.5 }
  v7 = vaddq_f64((float64x2_t)self->_origin, vmulq_f64((float64x2_t)self->_motion, _Q2));
  v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

- (double)distance
{
  return hypot(self->_motion.dx, self->_motion.dy);
}

- (CGRect)boundingBox
{
  double x;
  double y;
  double v4;
  double v5;
  CGRect v6;

  x = self->_origin.x;
  y = self->_origin.y;
  -[HMIMotionVector target](self, "target");
  v6.size.width = v4 - x;
  v6.size.height = v5 - y;
  v6.origin.x = x;
  v6.origin.y = y;
  return CGRectStandardize(v6);
}

- (CGPoint)origin
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->_origin, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGVector)motion
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGVector result;

  objc_copyStruct(v4, &self->_motion, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (Class)eventClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void)setEventClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventClass, 0);
}

@end
