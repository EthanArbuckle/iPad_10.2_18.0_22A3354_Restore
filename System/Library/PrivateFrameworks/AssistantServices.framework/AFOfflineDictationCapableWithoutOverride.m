@implementation AFOfflineDictationCapableWithoutOverride

uint64_t __AFOfflineDictationCapableWithoutOverride_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFOfflineDictationCapableWithoutOverride_isCapable = result;
  return result;
}

@end
