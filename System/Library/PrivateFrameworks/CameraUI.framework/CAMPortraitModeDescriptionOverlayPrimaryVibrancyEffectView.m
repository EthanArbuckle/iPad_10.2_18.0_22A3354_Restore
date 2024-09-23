@implementation CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView

- (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView)initWithFrame:(CGRect)a3
{
  CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *v3;
  id v4;
  uint64_t v5;
  UIView *contentView;
  void *v7;
  void *v8;
  CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView;
  v3 = -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    contentView = v3->_contentView;
    v3->_contentView = (UIView *)v5;

    -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView addSubview:](v3, "addSubview:", v3->_contentView);
    -[UIView layer](v3->_contentView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", *MEMORY[0x1E0CD2E00]);

    -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    v9 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView;
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView layoutSubviews](&v12, sel_layoutSubviews);
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

+ (id)defaultContentColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.72);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
