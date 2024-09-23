@implementation CAFUnitAirQuality

+ (id)baseUnit
{
  return +[CAFUnitAirQuality aqi](CAFUnitAirQuality, "aqi");
}

+ (CAFUnitAirQuality)aqi
{
  if (aqi_onceToken != -1)
    dispatch_once(&aqi_onceToken, &__block_literal_global_40);
  return (CAFUnitAirQuality *)(id)aqi__airQualityIndex;
}

void __24__CAFUnitAirQuality_aqi__block_invoke()
{
  CAFUnitAirQuality *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:constant:", 1.0, 273.15);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitAirQuality alloc], "initWithSymbol:converter:", CFSTR("AQI"), v2);
  v1 = (void *)aqi__airQualityIndex;
  aqi__airQualityIndex = (uint64_t)v0;

}

@end
