@implementation SFVibrantSeparatorView

- (SFVibrantSeparatorView)initWithFrame:(CGRect)a3
{
  SFVibrantSeparatorView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SFVibrantSeparatorView *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SFVibrantSeparatorView;
  v3 = -[SFVibrantSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVibrantSeparatorView contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    v6 = (void *)MEMORY[0x1E0DC3F08];
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "effectForBlurEffect:style:", v7, 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFVibrantSeparatorView setEffect:](v3, "setEffect:", v8);

    v9 = v3;
  }

  return v3;
}

@end
