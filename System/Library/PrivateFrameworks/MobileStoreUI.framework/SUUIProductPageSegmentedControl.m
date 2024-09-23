@implementation SUUIProductPageSegmentedControl

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SUUIProductPageSegmentedControl *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  SUUIProductPageSegmentedControl *v13;
  SUUIProductPageSegmentedControl *v14;
  objc_super v16;
  CGPoint v17;
  CGRect v18;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[SUUIProductPageSegmentedControl isEnabled](self, "isEnabled")
    && !-[SUUIProductPageSegmentedControl isHidden](self, "isHidden"))
  {
    -[SUUIProductPageSegmentedControl bounds](self, "bounds");
    v18.origin.x = v9 + -10.0;
    v18.origin.y = v10 + -10.0;
    v18.size.width = v11 + 20.0;
    v18.size.height = v12 + 20.0;
    v17.x = x;
    v17.y = y;
    if (CGRectContainsPoint(v18, v17))
      v13 = self;
    else
      v13 = 0;
    v8 = v13;
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)SUUIProductPageSegmentedControl;
    -[SUUIProductPageSegmentedControl hitTest:withEvent:](&v16, sel_hitTest_withEvent_, v7, x, y);
    v8 = (SUUIProductPageSegmentedControl *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v8;

  return v14;
}

@end
