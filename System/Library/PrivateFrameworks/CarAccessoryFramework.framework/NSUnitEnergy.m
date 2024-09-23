@implementation NSUnitEnergy

void __34__NSUnitEnergy_CAFUnit__wattHours__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 3600.0);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1900]), "initWithSymbol:converter:", CFSTR("Wh"), v2);
  v1 = (void *)wattHours__wattHours;
  wattHours__wattHours = v0;

}

void __39__NSUnitEnergy_CAFUnit__milliwattHours__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 3600000.0);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1900]), "initWithSymbol:converter:", CFSTR("mWh"), v2);
  v1 = (void *)milliwattHours__wattHours;
  milliwattHours__wattHours = v0;

}

@end
