@implementation CAFUnitRotationalSpeed

+ (id)baseUnit
{
  return +[CAFUnitRotationalSpeed revolutionsPerMinute](CAFUnitRotationalSpeed, "revolutionsPerMinute");
}

+ (CAFUnitRotationalSpeed)revolutionsPerMinute
{
  if (revolutionsPerMinute_onceToken != -1)
    dispatch_once(&revolutionsPerMinute_onceToken, &__block_literal_global_103);
  return (CAFUnitRotationalSpeed *)(id)revolutionsPerMinute__revolutionsPerMinute;
}

void __46__CAFUnitRotationalSpeed_revolutionsPerMinute__block_invoke()
{
  CAFUnitRotationalSpeed *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitRotationalSpeed alloc], "initWithSymbol:converter:", CFSTR("rpm"), v2);
  v1 = (void *)revolutionsPerMinute__revolutionsPerMinute;
  revolutionsPerMinute__revolutionsPerMinute = (uint64_t)v0;

}

+ (CAFUnitRotationalSpeed)degreesPerSecond
{
  if (degreesPerSecond_onceToken != -1)
    dispatch_once(&degreesPerSecond_onceToken, &__block_literal_global_106);
  return (CAFUnitRotationalSpeed *)(id)degreesPerSecond__degreesPerSecond;
}

void __42__CAFUnitRotationalSpeed_degreesPerSecond__block_invoke()
{
  CAFUnitRotationalSpeed *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.166666667);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitRotationalSpeed alloc], "initWithSymbol:converter:", CFSTR("deg/s"), v2);
  v1 = (void *)degreesPerSecond__degreesPerSecond;
  degreesPerSecond__degreesPerSecond = (uint64_t)v0;

}

@end
