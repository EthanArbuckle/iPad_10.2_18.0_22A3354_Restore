@implementation NSString(CLKFormatter)

- (uint64_t)_clkBlinkerRange
{
  if (_clkBlinkerRange_onceToken != -1)
    dispatch_once(&_clkBlinkerRange_onceToken, &__block_literal_global_16);
  return objc_msgSend(a1, "rangeOfCharacterFromSet:", _clkBlinkerRange_blinkerSet);
}

- (uint64_t)_clkBlinkerRangeByBackwardsSearch
{
  if (_clkBlinkerRangeByBackwardsSearch_onceToken != -1)
    dispatch_once(&_clkBlinkerRangeByBackwardsSearch_onceToken, &__block_literal_global_222);
  return objc_msgSend(a1, "rangeOfCharacterFromSet:options:", _clkBlinkerRangeByBackwardsSearch_blinkerSet, 4);
}

@end
