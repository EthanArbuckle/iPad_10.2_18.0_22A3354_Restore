@implementation MXUnitSignalBars

+ (MXUnitSignalBars)bars
{
  void *v2;
  MXUnitSignalBars *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v3 = -[NSDimension initWithSymbol:converter:]([MXUnitSignalBars alloc], "initWithSymbol:converter:", CFSTR("bars"), v2);

  return v3;
}

@end
