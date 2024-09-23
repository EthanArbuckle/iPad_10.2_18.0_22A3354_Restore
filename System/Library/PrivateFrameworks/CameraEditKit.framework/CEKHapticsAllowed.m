@implementation CEKHapticsAllowed

uint64_t __CEKHapticsAllowed_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CEKHapticsAllowed_allowsHaptics = result;
  return result;
}

@end
