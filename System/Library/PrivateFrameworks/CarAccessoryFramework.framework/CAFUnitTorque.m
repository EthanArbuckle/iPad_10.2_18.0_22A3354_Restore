@implementation CAFUnitTorque

+ (id)baseUnit
{
  return +[CAFUnitTorque newtonMeter](CAFUnitTorque, "newtonMeter");
}

+ (CAFUnitTorque)newtonMeter
{
  if (newtonMeter_onceToken != -1)
    dispatch_once(&newtonMeter_onceToken, &__block_literal_global_128);
  return (CAFUnitTorque *)(id)newtonMeter_newtonMeter;
}

void __28__CAFUnitTorque_newtonMeter__block_invoke()
{
  CAFUnitTorque *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitTorque alloc], "initWithSymbol:converter:", CFSTR("Nm"), v2);
  v1 = (void *)newtonMeter_newtonMeter;
  newtonMeter_newtonMeter = (uint64_t)v0;

}

+ (CAFUnitTorque)footPound
{
  if (footPound_onceToken != -1)
    dispatch_once(&footPound_onceToken, &__block_literal_global_131);
  return (CAFUnitTorque *)(id)footPound_footPound;
}

void __26__CAFUnitTorque_footPound__block_invoke()
{
  CAFUnitTorque *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.35581795);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitTorque alloc], "initWithSymbol:converter:", CFSTR("ft-lb"), v2);
  v1 = (void *)footPound_footPound;
  footPound_footPound = (uint64_t)v0;

}

@end
