@implementation FigIsAirplaydEnabled

void __FigIsAirplaydEnabled_block_invoke()
{
  const void *v0;

  v0 = (const void *)MGGetStringAnswer();
  if (FigCFEqual(v0, CFSTR("AudioAccessory5,1"))
    || CFPreferencesGetAppBooleanValue(CFSTR("simulate_b520_for_airplayd_check"), CFSTR("com.apple.coremedia"), 0))
  {
    CFPreferencesGetAppBooleanValue(CFSTR("force_airplayd_hp_delayed_check"), CFSTR("com.apple.coremedia"), 0);
  }
  FigIsAirplaydEnabled_result = _os_feature_enabled_impl();
  if (v0)
    CFRelease(v0);
}

@end
