@implementation BoundsChangeAwareView

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[BoundsChangeAwareView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)BoundsChangeAwareView;
  -[BoundsChangeAwareView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (width != v9 || height != v11)
    -[BoundsChangeAwareView setNeedsLayout](self, "setNeedsLayout");
}

@end
