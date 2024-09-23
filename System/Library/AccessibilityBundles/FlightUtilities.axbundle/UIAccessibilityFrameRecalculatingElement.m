@implementation UIAccessibilityFrameRecalculatingElement

- (CGRect)accessibilityFrame
{
  double (**v2)(void);
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[UIAccessibilityFrameRecalculatingElement calculateFrame](self, "calculateFrame");
  v2 = (double (**)(void))objc_claimAutoreleasedReturnValue();
  v3 = v2[2]();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[UIAccessibilityFrameRecalculatingElement setCalculateFrame:](self, "setCalculateFrame:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIAccessibilityFrameRecalculatingElement;
  -[UIAccessibilityFrameRecalculatingElement dealloc](&v3, sel_dealloc);
}

- (id)calculateFrame
{
  return self->_calculateFrame;
}

- (void)setCalculateFrame:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_calculateFrame, 0);
}

@end
