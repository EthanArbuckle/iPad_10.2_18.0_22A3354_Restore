@implementation HUQuickControlStepperSeparatorView

- (HUQuickControlStepperSeparatorView)initWithFrame:(CGRect)a3
{
  HUQuickControlStepperSeparatorView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUQuickControlStepperSeparatorView;
  v3 = -[HUQuickControlStepperSeparatorView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperSeparatorView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlStepperSeparatorView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v6);

  }
  return v3;
}

@end
