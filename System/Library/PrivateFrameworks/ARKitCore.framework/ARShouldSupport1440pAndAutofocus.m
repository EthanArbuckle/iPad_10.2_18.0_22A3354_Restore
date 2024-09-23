@implementation ARShouldSupport1440pAndAutofocus

void __ARShouldSupport1440pAndAutofocus_block_invoke()
{
  BOOL v0;

  if ((dyld_program_sdk_at_least() & 1) != 0)
  {
    v0 = 1;
  }
  else
  {
    if (ARDeviceSupportsJasper_onceToken != -1)
      dispatch_once(&ARDeviceSupportsJasper_onceToken, &__block_literal_global_76);
    v0 = s_deviceSupportsJasper != 0;
  }
  ARShouldSupport1440pAndAutofocus_cachedReturn = v0;
}

@end
