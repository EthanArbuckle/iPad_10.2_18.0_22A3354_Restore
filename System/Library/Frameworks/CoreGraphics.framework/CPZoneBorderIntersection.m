@implementation CPZoneBorderIntersection

- (id)initSuper
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPZoneBorderIntersection;
  return -[CPZoneBorderIntersection init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)CPCopyObject(self, a3);
}

- (void)setIntersectionRect:(CGRect)a3
{
  self->intersectionRect = a3;
}

- (CGRect)intersectionRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->intersectionRect.origin.x;
  y = self->intersectionRect.origin.y;
  width = self->intersectionRect.size.width;
  height = self->intersectionRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setIntersectingBorder:(id)a3
{
  self->intersectingBorder = (CPZoneBorder *)a3;
}

- (id)intersectingBorder
{
  return self->intersectingBorder;
}

- (void)setForwardVector:(BOOL)a3
{
  self->forwardVector = a3;
}

- (BOOL)forwardVector
{
  return self->forwardVector;
}

- (void)setBackwardVector:(BOOL)a3
{
  self->backwardVector = a3;
}

- (BOOL)backwardVector
{
  return self->backwardVector;
}

- (int64_t)comparePositionLengthwise:(id)a3
{
  double x;
  double v6;
  double v7;
  double y;
  double v9;
  BOOL v10;

  x = self->intersectionRect.origin.x;
  objc_msgSend(a3, "intersectionRect");
  v7 = v6;
  y = self->intersectionRect.origin.y;
  objc_msgSend(a3, "intersectionRect");
  if (vabdd_f64(v7, x) < vabdd_f64(v9, y))
  {
    v10 = y == v9;
    if (y >= v9)
      return !v10;
    return -1;
  }
  v10 = x == v7;
  if (x < v7)
    return -1;
  return !v10;
}

@end
