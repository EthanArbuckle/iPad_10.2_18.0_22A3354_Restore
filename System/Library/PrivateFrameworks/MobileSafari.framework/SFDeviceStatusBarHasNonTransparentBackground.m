@implementation SFDeviceStatusBarHasNonTransparentBackground

void ___SFDeviceStatusBarHasNonTransparentBackground_block_invoke()
{
  char v0;

  if (_SFDeviceHasHomeButton::onceToken != -1)
    dispatch_once(&_SFDeviceHasHomeButton::onceToken, &__block_literal_global_16);
  v0 = _SFDeviceHasHomeButton::hasHomeButton;
  if (_SFDeviceHasHomeButton::hasHomeButton)
  {
    if (_SFDeviceIsPad::onceToken != -1)
      dispatch_once(&_SFDeviceIsPad::onceToken, &__block_literal_global_22);
    v0 = _SFDeviceIsPad::isPad == 0;
  }
  _SFDeviceStatusBarHasNonTransparentBackground::canHaveBackground = v0;
}

@end
