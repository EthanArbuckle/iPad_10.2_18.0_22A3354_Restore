@implementation NSString

void __42__NSString_CLKFormatter___clkBlinkerRange__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_clkBlinkerRange_blinkerSet;
  _clkBlinkerRange_blinkerSet = v0;

}

void __59__NSString_CLKFormatter___clkBlinkerRangeByBackwardsSearch__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_clkBlinkerRangeByBackwardsSearch_blinkerSet;
  _clkBlinkerRangeByBackwardsSearch_blinkerSet = v0;

}

@end
