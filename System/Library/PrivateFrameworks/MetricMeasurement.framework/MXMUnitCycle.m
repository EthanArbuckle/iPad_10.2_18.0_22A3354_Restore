@implementation MXMUnitCycle

+ (MXMUnitCycle)baseUnit
{
  MXMUnitCycle *v2;
  void *v3;
  MXMUnitCycle *v4;

  v2 = [MXMUnitCycle alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("C"), v3);

  return v4;
}

+ (MXMUnitCycle)kiloCycles
{
  MXMUnitCycle *v2;
  void *v3;
  MXMUnitCycle *v4;

  v2 = [MXMUnitCycle alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("kC"), v3);

  return v4;
}

+ (MXMUnitCycle)megaCycles
{
  MXMUnitCycle *v2;
  void *v3;
  MXMUnitCycle *v4;

  v2 = [MXMUnitCycle alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("mC"), v3);

  return v4;
}

+ (MXMUnitCycle)gigaCycles
{
  MXMUnitCycle *v2;
  void *v3;
  MXMUnitCycle *v4;

  v2 = [MXMUnitCycle alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("gC"), v3);

  return v4;
}

@end
