@implementation CKAppGrabberCloseButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  -[CKAppGrabberCloseButton bounds](self, "bounds", a4);
  v12.origin.x = v6 + -16.0;
  v12.origin.y = v7 + -16.0;
  v12.size.width = v8 + 32.0;
  v12.size.height = v9 + 32.0;
  v11.x = x;
  v11.y = y;
  return CGRectContainsPoint(v12, v11);
}

@end
