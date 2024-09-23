@implementation SSSUnitRectCoordinateSpace

- (SSSUnitRectCoordinateSpace)initWithView:(id)a3
{
  UIView *v4;
  SSSUnitRectCoordinateSpace *v5;
  UIView *view;
  objc_super v8;

  v4 = (UIView *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSSUnitRectCoordinateSpace;
  v5 = -[SSSUnitRectCoordinateSpace init](&v8, "init");
  view = v5->_view;
  v5->_view = v4;

  return v5;
}

- (CGRect)_unitRectOfRectInViewSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self->_view, "bounds");
  v9 = (x - v7) / v8;
  v12 = (y - v10) / v11;
  v13 = width / v8;
  v14 = height / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v9;
  return result;
}

- (CGRect)_rectInViewSpaceForUnitRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self->_view, "bounds");
  v9 = v7 + x * v8;
  v12 = v10 + y * v11;
  v13 = width * v8;
  v14 = height * v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v9;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  objc_msgSend(a4, "convertRect:fromCoordinateSpace:", self, a3.x, a3.y, 1.0, 1.0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromCoordinateSpace:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[SSSUnitRectCoordinateSpace convertRect:fromCoordinateSpace:](self, "convertRect:fromCoordinateSpace:", a4, a3.x, a3.y, 1.0, 1.0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[SSSUnitRectCoordinateSpace _rectInViewSpaceForUnitRect:](self, "_rectInViewSpaceForUnitRect:", x, y, width, height);
  objc_msgSend(v9, "convertRect:fromCoordinateSpace:", self->_view);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[UIView convertRect:fromCoordinateSpace:](self->_view, "convertRect:fromCoordinateSpace:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SSSUnitRectCoordinateSpace _unitRectOfRectInViewSpace:](self, "_unitRectOfRectInViewSpace:");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 1.0;
  v5 = 1.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
