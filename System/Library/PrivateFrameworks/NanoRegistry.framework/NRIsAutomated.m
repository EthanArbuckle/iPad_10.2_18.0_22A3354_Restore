@implementation NRIsAutomated

uint64_t ___NRIsAutomated_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("_ShowInternalAutomationUI"), CFSTR("com.apple.nanobuddy.automationhelper"), 0);
  if ((_DWORD)result)
    byte_1ECE237DA = 1;
  return result;
}

@end
