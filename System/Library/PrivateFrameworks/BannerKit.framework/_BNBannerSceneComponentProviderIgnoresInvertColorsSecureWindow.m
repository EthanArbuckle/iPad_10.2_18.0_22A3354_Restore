@implementation _BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  return 0;
}

- (void)accessibilityApplyInvertFilter
{
  objc_super v3;

  if ((-[_BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow accessibilityIgnoresInvertColors](self, "accessibilityIgnoresInvertColors") & 1) == 0)
  {
    v3.receiver = self;
    v3.super_class = (Class)_BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow;
    -[_BNBannerSceneComponentProviderIgnoresInvertColorsSecureWindow accessibilityApplyInvertFilter](&v3, sel_accessibilityApplyInvertFilter);
  }
}

@end
