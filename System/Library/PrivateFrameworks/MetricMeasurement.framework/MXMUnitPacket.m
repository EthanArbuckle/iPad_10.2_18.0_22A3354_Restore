@implementation MXMUnitPacket

+ (MXMUnitPacket)baseUnit
{
  MXMUnitPacket *v2;
  void *v3;
  MXMUnitPacket *v4;

  v2 = [MXMUnitPacket alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("p"), v3);

  return v4;
}

@end
