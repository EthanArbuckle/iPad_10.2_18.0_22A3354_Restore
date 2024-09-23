@implementation CADeviceHasNotch

void __CADeviceHasNotch_block_invoke()
{
  BOOL v0;

  if (MGGetBoolAnswer())
  {
    if (CADeviceIsPhone::once[0] != -1)
      dispatch_once(CADeviceIsPhone::once, &__block_literal_global_134);
    v0 = CADeviceIsPhone::phone != 0;
  }
  else
  {
    v0 = 0;
  }
  CADeviceHasNotch::has_notch = v0;
}

@end
