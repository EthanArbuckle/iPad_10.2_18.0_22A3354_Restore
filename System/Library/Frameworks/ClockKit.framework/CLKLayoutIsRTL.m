@implementation CLKLayoutIsRTL

void __CLKLayoutIsRTL_block_invoke()
{
  +[CLKCurrentLocaleSentinel shared](CLKCurrentLocaleSentinel, "shared");

  _CLKUpdateIsLayoutRTL();
}

@end
