@implementation SFDeviceAlertStyle

void ___SFDeviceAlertStyle_block_invoke()
{
  if (_SFDeviceIsPad::onceToken != -1)
    dispatch_once(&_SFDeviceIsPad::onceToken, &__block_literal_global_22);
  _SFDeviceAlertStyle::style = _SFDeviceIsPad::isPad;
}

@end
