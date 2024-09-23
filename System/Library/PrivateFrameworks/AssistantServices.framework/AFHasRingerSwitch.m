@implementation AFHasRingerSwitch

uint64_t __AFHasRingerSwitch_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  AFHasRingerSwitch_hasRingerSwitch = result;
  return result;
}

@end
