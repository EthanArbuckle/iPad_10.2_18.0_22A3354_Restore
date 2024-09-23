@implementation AXDeviceHasLongPress3dTouch

void __AXDeviceHasLongPress3dTouch_block_invoke()
{
  BOOL v0;

  if ((MGGetBoolAnswer() & 1) != 0 || !MGGetBoolAnswer())
  {
    v0 = 0;
  }
  else
  {
    if (AXDeviceHasHomeButton_onceToken != -1)
      dispatch_once(&AXDeviceHasHomeButton_onceToken, &__block_literal_global_35_0);
    v0 = AXDeviceHasHomeButton_hasHomeButton == 0;
  }
  AXDeviceHasLongPress3dTouch_HasLongPress3dTouch = v0;
}

@end
