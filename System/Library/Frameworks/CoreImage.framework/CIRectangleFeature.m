@implementation CIRectangleFeature

- (id)type
{
  return CFSTR("Rectangle");
}

- (CIRectangleFeature)initWithBounds:(CGRect)a3 topLeft:(CGPoint)a4 topRight:(CGPoint)a5 bottomLeft:(CGPoint)a6 bottomRight:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  CIRectangleFeature *result;
  objc_super v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  v13 = a3.origin.y;
  v14 = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CIRectangleFeature;
  result = -[CIFeature init](&v16, sel_init, *(_QWORD *)&a6.x, *(_QWORD *)&a6.y, *(_QWORD *)&a7.x, *(_QWORD *)&a7.y);
  if (result)
  {
    result->bounds.origin.x = v14;
    result->bounds.origin.y = v13;
    result->bounds.size.width = width;
    result->bounds.size.height = height;
    result->topLeft.x = v10;
    result->topLeft.y = v9;
    result->topRight.x = x;
    result->topRight.y = y;
    result->bottomLeft.x = v17;
    result->bottomLeft.y = v18;
    result->bottomRight.x = v19;
    result->bottomRight.y = v20;
  }
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->bounds, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->topLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->topRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->bottomLeft, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  _QWORD v4[2];
  CGPoint result;

  objc_copyStruct(v4, &self->bottomRight, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.y = v3;
  result.x = v2;
  return result;
}

@end
