@implementation HUQuickControlFaucetValveItemLayoutOptions

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___HUQuickControlFaucetValveItemLayoutOptions;
  objc_msgSendSuper2(&v5, sel_defaultOptionsForViewSize_, a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreferredLayoutStyle:", 0);
  objc_msgSend(v3, "setTitlePosition:", 1);
  objc_msgSend(v3, "setInteritemSpacingForSmallControlSize:", 36.0);
  objc_msgSend(v3, "setInteritemSpacingForRegularControlSize:", 48.0);
  return v3;
}

@end
