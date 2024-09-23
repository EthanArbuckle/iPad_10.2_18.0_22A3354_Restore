@implementation UIVisualEffectView

void __89__UIVisualEffectView_MobileSafariFrameworkExtras__safari_statusBarGradientBlurEffectView__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0DC3510];
  objc_msgSend(MEMORY[0x1E0DC3870], "sf_imageNamed:", CFSTR("status_bar_blur_mask"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "effectWithVariableBlurRadius:imageMask:", v3, 3.0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)safari_statusBarGradientBlurEffectView_gradientBlur;
  safari_statusBarGradientBlurEffectView_gradientBlur = v1;

}

@end
