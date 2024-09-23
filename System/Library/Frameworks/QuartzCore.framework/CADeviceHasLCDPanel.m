@implementation CADeviceHasLCDPanel

void __CADeviceHasLCDPanel_block_invoke()
{
  char v0;

  if (CADeviceHasBacklight::once != -1)
    dispatch_once(&CADeviceHasBacklight::once, &__block_literal_global_85);
  if (CADeviceHasBacklight::has_backlight == 1)
    v0 = MGGetBoolAnswer() ^ 1;
  else
    v0 = 0;
  CADeviceHasLCDPanel::has_lcd = v0;
}

@end
