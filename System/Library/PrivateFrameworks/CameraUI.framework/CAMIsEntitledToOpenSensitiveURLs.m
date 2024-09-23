@implementation CAMIsEntitledToOpenSensitiveURLs

BOOL __CAMIsEntitledToOpenSensitiveURLs_block_invoke()
{
  _BOOL8 result;

  result = CAMProcessHasEntitlement((uint64_t)CFSTR("com.apple.springboard.opensensitiveurl"));
  CAMIsEntitledToOpenSensitiveURLs_isEntitledToOpenSensitiveURLs = result;
  return result;
}

@end
