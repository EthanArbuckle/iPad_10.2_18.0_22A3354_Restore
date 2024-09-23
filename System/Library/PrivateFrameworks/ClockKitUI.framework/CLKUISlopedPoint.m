@implementation CLKUISlopedPoint

- (CGPoint)point
{
  double v2;
  double v3;
  CGPoint result;

  v2 = sub_1CB9D2148((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CLKUISlopedPoint_point);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  sub_1CB9D21E0((uint64_t)self, a3.x, a3.y, (uint64_t)a2, &OBJC_IVAR___CLKUISlopedPoint_point);
}

- (CGVector)tangent
{
  double v2;
  double v3;
  CGVector result;

  v2 = sub_1CB9D2148((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CLKUISlopedPoint_tangent);
  result.dy = v3;
  result.dx = v2;
  return result;
}

- (void)setTangent:(CGVector)a3
{
  sub_1CB9D21E0((uint64_t)self, a3.dx, a3.dy, (uint64_t)a2, &OBJC_IVAR___CLKUISlopedPoint_tangent);
}

- (CLKUISlopedPoint)initWithPoint:(CGPoint)a3 tangent:(CGVector)a4
{
  CGFloat dy;
  CGFloat dx;
  CGFloat y;
  CGFloat x;
  objc_class *ObjectType;
  CGFloat *v10;
  CGFloat *v11;
  objc_super v13;

  dy = a4.dy;
  dx = a4.dx;
  y = a3.y;
  x = a3.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v10 = (CGFloat *)((char *)self + OBJC_IVAR___CLKUISlopedPoint_point);
  *v10 = x;
  v10[1] = y;
  v11 = (CGFloat *)((char *)self + OBJC_IVAR___CLKUISlopedPoint_tangent);
  *v11 = dx;
  v11[1] = dy;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[CLKUISlopedPoint init](&v13, sel_init);
}

- (CLKUISlopedPoint)init
{
  CLKUISlopedPoint *result;

  result = (CLKUISlopedPoint *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
