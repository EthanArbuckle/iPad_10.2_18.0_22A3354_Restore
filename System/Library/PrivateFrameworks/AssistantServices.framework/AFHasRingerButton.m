@implementation AFHasRingerButton

uint64_t __AFHasRingerButton_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFHasRingerButton_hasRingerButton = result;
  return result;
}

@end
