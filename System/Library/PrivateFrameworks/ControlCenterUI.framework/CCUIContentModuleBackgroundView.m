@implementation CCUIContentModuleBackgroundView

- (CCUIContentModuleBackgroundView)initWithFrame:(CGRect)a3
{
  CCUIContentModuleBackgroundView *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUIContentModuleBackgroundView;
  v3 = -[CCUIContentModuleBackgroundView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIContentModuleBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CCUIContentModuleBackgroundView setAlpha:](v3, "setAlpha:", 0.0);
    -[CCUIContentModuleBackgroundView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHitTestsAsOpaque:", 1);

  }
  return v3;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CCUIContentModuleBackgroundView;
  -[CCUIContentModuleBackgroundView setUserInteractionEnabled:](&v6, sel_setUserInteractionEnabled_);
  -[CCUIContentModuleBackgroundView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHitTestsAsOpaque:", !v3);

}

@end
