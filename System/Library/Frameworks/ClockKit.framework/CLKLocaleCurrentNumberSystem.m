@implementation CLKLocaleCurrentNumberSystem

void __CLKLocaleCurrentNumberSystem_block_invoke()
{
  +[CLKCurrentLocaleSentinel shared](CLKCurrentLocaleSentinel, "shared");

  _CLKUpdateNumberSystem();
}

@end
