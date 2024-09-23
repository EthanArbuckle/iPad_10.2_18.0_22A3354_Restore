@implementation PHTransformableView

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;
  CGAffineTransform v7;

  y = a3.y;
  x = a3.x;
  -[PHTransformableView transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v7))
  {
    v6.receiver = self;
    v6.super_class = (Class)PHTransformableView;
    -[PHTransformableView setCenter:](&v6, "setCenter:", x, y);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGAffineTransform v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PHTransformableView transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v9))
  {
    v8.receiver = self;
    v8.super_class = (Class)PHTransformableView;
    -[PHTransformableView setFrame:](&v8, "setFrame:", x, y, width, height);
  }
}

@end
