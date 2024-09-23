@implementation DDTelephonyWillPrompt

BOOL __DDTelephonyWillPrompt_block_invoke()
{
  _BOOL8 result;

  result = _get_BOOL_entitlement(CFSTR("com.apple.springboard.allowallcallurls"), 0);
  DDTelephonyWillPrompt_sandbox_result = !result;
  return result;
}

@end
