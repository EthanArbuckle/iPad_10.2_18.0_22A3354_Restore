@implementation _PKStrokeClipPlane

- (_PKStrokeClipPlane)initWithOrigin:(CGPoint)a3 normal:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  _PKStrokeClipPlane *result;
  objc_super v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_PKStrokeClipPlane;
  result = -[_PKStrokeClipPlane init](&v9, sel_init);
  if (result)
  {
    result->_origin.x = v7;
    result->_origin.y = v6;
    result->_normal.x = x;
    result->_normal.y = y;
  }
  return result;
}

- (double)distanceToPoint:(CGPoint)a3
{
  return (a3.y - self->_origin.y) * self->_normal.y + (a3.x - self->_origin.x) * self->_normal.x;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_PKStrokeClipPlane isEqualToClipPlane:](self, "isEqualToClipPlane:", v4);

  return v5;
}

- (BOOL)isEqualToClipPlane:(id)a3
{
  char *v4;
  float64x2_t v5;
  int32x2_t v6;
  int32x2_t v7;
  char v8;

  v4 = (char *)a3;
  if (v4
    && (v5 = (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL),
        v6 = vmovn_s64(vcgtq_f64(v5, vabdq_f64((float64x2_t)self->_origin, *(float64x2_t *)(v4 + 8)))),
        (v6.i32[0] & v6.i32[1] & 1) != 0))
  {
    v7 = vmovn_s64(vcgtq_f64(v5, vabdq_f64((float64x2_t)self->_normal, *(float64x2_t *)(v4 + 24))));
    v8 = v7.i8[0] & v7.i8[4];
  }
  else
  {
    v8 = 0;
  }

  return v8 & 1;
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)normal
{
  double x;
  double y;
  CGPoint result;

  x = self->_normal.x;
  y = self->_normal.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
