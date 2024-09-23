@implementation AXDeviceHas3DTouch

void __AXDeviceHas3DTouch_block_invoke()
{
  BOOL v0;

  if ((MGGetBoolAnswer() & 1) != 0)
  {
    v0 = 1;
  }
  else if (MGGetBoolAnswer())
  {
    if (AXDeviceHasHomeButton_onceToken != -1)
      dispatch_once(&AXDeviceHasHomeButton_onceToken, &__block_literal_global_35_0);
    v0 = AXDeviceHasHomeButton_hasHomeButton == 0;
  }
  else
  {
    v0 = 0;
  }
  AXDeviceHas3DTouch_Has3DTouch = v0;
}

@end
