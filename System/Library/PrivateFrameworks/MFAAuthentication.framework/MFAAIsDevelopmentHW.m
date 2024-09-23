@implementation MFAAIsDevelopmentHW

uint64_t __MFAAIsDevelopmentHW_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  gbIsDevelopmentHW = result ^ 1;
  return result;
}

@end
