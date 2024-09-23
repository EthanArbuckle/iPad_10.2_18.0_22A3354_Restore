@implementation MXMUnitInstruction

+ (MXMUnitInstruction)baseUnit
{
  MXMUnitInstruction *v2;
  void *v3;
  MXMUnitInstruction *v4;

  v2 = [MXMUnitInstruction alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("I"), v3);

  return v4;
}

+ (MXMUnitInstruction)kiloInstructions
{
  MXMUnitInstruction *v2;
  void *v3;
  MXMUnitInstruction *v4;

  v2 = [MXMUnitInstruction alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("kI"), v3);

  return v4;
}

+ (MXMUnitInstruction)megaInstructions
{
  MXMUnitInstruction *v2;
  void *v3;
  MXMUnitInstruction *v4;

  v2 = [MXMUnitInstruction alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("mI"), v3);

  return v4;
}

+ (MXMUnitInstruction)gigaInstructions
{
  MXMUnitInstruction *v2;
  void *v3;
  MXMUnitInstruction *v4;

  v2 = [MXMUnitInstruction alloc];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1000000000.0);
  v4 = -[NSDimension initWithSymbol:converter:](v2, "initWithSymbol:converter:", CFSTR("gI"), v3);

  return v4;
}

@end
