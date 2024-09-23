@implementation NSUnitFuelEfficiency

void __60__NSUnitFuelEfficiency_CAFUnit__millilitersPer100Kilometers__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.001);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1910]), "initWithSymbol:converter:", CFSTR("mL/100km"), v2);
  v1 = (void *)millilitersPer100Kilometers__millilitersPer100Kilometers;
  millilitersPer100Kilometers__millilitersPer100Kilometers = v0;

}

@end
