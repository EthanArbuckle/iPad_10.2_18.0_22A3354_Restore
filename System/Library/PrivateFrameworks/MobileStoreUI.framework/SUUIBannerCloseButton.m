@implementation SUUIBannerCloseButton

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  v3 = a3;
  -[SUUIBannerCloseButton imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0.5;
  if (v3)
    v7 = 1.0;
  objc_msgSend(v5, "setAlpha:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SUUIBannerCloseButton;
  -[SUUIBannerCloseButton setHighlighted:](&v8, sel_setHighlighted_, v3);
}

- (void)layoutSubviews
{
  void *v3;
  int v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIBannerCloseButton;
  -[SUUIBannerCloseButton layoutSubviews](&v6, sel_layoutSubviews);
  -[SUUIBannerCloseButton imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SUUIBannerCloseButton isHighlighted](self, "isHighlighted");
  v5 = 0.5;
  if (v4)
    v5 = 1.0;
  objc_msgSend(v3, "setAlpha:", v5);

}

@end
