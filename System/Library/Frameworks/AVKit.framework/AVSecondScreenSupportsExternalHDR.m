@implementation AVSecondScreenSupportsExternalHDR

uint64_t __AVSecondScreenSupportsExternalHDR_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AVSecondScreenSupportsExternalHDR_AVSecondScreenSupportsExternalHDR = result;
  return result;
}

@end
