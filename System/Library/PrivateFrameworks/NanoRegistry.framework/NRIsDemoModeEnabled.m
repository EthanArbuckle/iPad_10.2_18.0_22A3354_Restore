@implementation NRIsDemoModeEnabled

uint64_t ___NRIsDemoModeEnabled_block_invoke()
{
  uint64_t result;
  int AppBooleanValue;
  uint64_t v2;
  int out_token;

  out_token = -1;
  v2 = 0;
  if (notify_register_check((const char *)objc_msgSend(CFSTR("com.apple.nanoregistry.NRDemoModeNotifyNotification"), "UTF8String"), &out_token)|| !notify_is_valid_token(out_token)|| (result = notify_get_state(out_token, &v2), (_DWORD)result))
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), 0);
    _MergedGlobals_7 = AppBooleanValue != 0;
    if (AppBooleanValue
      && CFPreferencesGetAppIntegerValue(CFSTR("FProgramNumber"), CFSTR("com.apple.demo-settings"), 0) != 5)
    {
      _MergedGlobals_7 = 0;
    }
    result = out_token;
    if (out_token != -1)
      return notify_set_state(out_token, _MergedGlobals_7);
  }
  else
  {
    _MergedGlobals_7 = v2 != 0;
  }
  return result;
}

@end
