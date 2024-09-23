@implementation CKSupportsAdvancedHaptics

uint64_t __CKSupportsAdvancedHaptics_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  CKSupportsAdvancedHaptics_supportsAdvancedHaptics = result;
  return result;
}

@end
