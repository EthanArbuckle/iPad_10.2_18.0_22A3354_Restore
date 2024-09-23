@implementation MXUnitAveragePixelLuminance

+ (MXUnitAveragePixelLuminance)apl
{
  void *v2;
  MXUnitAveragePixelLuminance *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v3 = -[NSDimension initWithSymbol:converter:]([MXUnitAveragePixelLuminance alloc], "initWithSymbol:converter:", CFSTR("apl"), v2);

  return v3;
}

@end
