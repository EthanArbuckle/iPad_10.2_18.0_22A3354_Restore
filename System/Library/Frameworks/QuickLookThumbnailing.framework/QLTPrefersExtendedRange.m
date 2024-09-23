@implementation QLTPrefersExtendedRange

uint64_t __QLTPrefersExtendedRange_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  QLTPrefersExtendedRange_supportsDeepColor = result;
  return result;
}

@end
