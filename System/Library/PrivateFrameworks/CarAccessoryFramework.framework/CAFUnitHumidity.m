@implementation CAFUnitHumidity

+ (id)baseUnit
{
  return +[CAFUnitHumidity absoluteHumidity](CAFUnitHumidity, "absoluteHumidity");
}

+ (CAFUnitHumidity)absoluteHumidity
{
  if (absoluteHumidity_onceToken != -1)
    dispatch_once(&absoluteHumidity_onceToken, &__block_literal_global_4);
  return (CAFUnitHumidity *)(id)absoluteHumidity__absoluteHumidity;
}

void __35__CAFUnitHumidity_absoluteHumidity__block_invoke()
{
  CAFUnitHumidity *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:constant:", 1.0, 273.15);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitHumidity alloc], "initWithSymbol:converter:", CFSTR("mg/L"), v2);
  v1 = (void *)absoluteHumidity__absoluteHumidity;
  absoluteHumidity__absoluteHumidity = (uint64_t)v0;

}

+ (CAFUnitHumidity)percent
{
  if (percent_onceToken != -1)
    dispatch_once(&percent_onceToken, &__block_literal_global_17);
  return (CAFUnitHumidity *)(id)percent__relativeHumidity;
}

void __26__CAFUnitHumidity_percent__block_invoke()
{
  CAFUnitHumidity *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:constant:", 1.0, 273.15);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitHumidity alloc], "initWithSymbol:converter:", CFSTR("%"), v2);
  v1 = (void *)percent__relativeHumidity;
  percent__relativeHumidity = (uint64_t)v0;

}

+ (CAFUnitHumidity)specificHumidity
{
  if (specificHumidity_onceToken != -1)
    dispatch_once(&specificHumidity_onceToken, &__block_literal_global_20);
  return (CAFUnitHumidity *)(id)specificHumidity__specificHumidity;
}

void __35__CAFUnitHumidity_specificHumidity__block_invoke()
{
  CAFUnitHumidity *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:constant:", 1.0, 273.15);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitHumidity alloc], "initWithSymbol:converter:", CFSTR("g/kg"), v2);
  v1 = (void *)specificHumidity__specificHumidity;
  specificHumidity__specificHumidity = (uint64_t)v0;

}

+ (CAFUnitHumidity)dewPointCelcius
{
  if (dewPointCelcius_onceToken != -1)
    dispatch_once(&dewPointCelcius_onceToken, &__block_literal_global_23);
  return (CAFUnitHumidity *)(id)dewPointCelcius__dewPoint;
}

void __34__CAFUnitHumidity_dewPointCelcius__block_invoke()
{
  CAFUnitHumidity *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:constant:", 1.0, 273.15);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitHumidity alloc], "initWithSymbol:converter:", CFSTR("°C"), v2);
  v1 = (void *)dewPointCelcius__dewPoint;
  dewPointCelcius__dewPoint = (uint64_t)v0;

}

+ (CAFUnitHumidity)dewPointFahrenheit
{
  if (dewPointFahrenheit_onceToken != -1)
    dispatch_once(&dewPointFahrenheit_onceToken, &__block_literal_global_26);
  return (CAFUnitHumidity *)(id)dewPointFahrenheit__dewPoint;
}

void __37__CAFUnitHumidity_dewPointFahrenheit__block_invoke()
{
  CAFUnitHumidity *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:constant:", 1.0, 273.15);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitHumidity alloc], "initWithSymbol:converter:", CFSTR("°F"), v2);
  v1 = (void *)dewPointFahrenheit__dewPoint;
  dewPointFahrenheit__dewPoint = (uint64_t)v0;

}

@end
