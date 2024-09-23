@implementation CAFUnitEnergyEfficiency

+ (id)baseUnit
{
  return +[CAFUnitEnergyEfficiency wattHoursPerKilometer](CAFUnitEnergyEfficiency, "wattHoursPerKilometer");
}

+ (CAFUnitEnergyEfficiency)wattHoursPerKilometer
{
  if (wattHoursPerKilometer_onceToken != -1)
    dispatch_once(&wattHoursPerKilometer_onceToken, &__block_literal_global_61);
  return (CAFUnitEnergyEfficiency *)(id)wattHoursPerKilometer__wattHoursPerKilometer;
}

void __48__CAFUnitEnergyEfficiency_wattHoursPerKilometer__block_invoke()
{
  CAFUnitEnergyEfficiency *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 1.0);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitEnergyEfficiency alloc], "initWithSymbol:converter:", CFSTR("Wh/km"), v2);
  v1 = (void *)wattHoursPerKilometer__wattHoursPerKilometer;
  wattHoursPerKilometer__wattHoursPerKilometer = (uint64_t)v0;

}

+ (CAFUnitEnergyEfficiency)milliwattHoursPerKilometer
{
  if (milliwattHoursPerKilometer_onceToken != -1)
    dispatch_once(&milliwattHoursPerKilometer_onceToken, &__block_literal_global_64);
  return (CAFUnitEnergyEfficiency *)(id)milliwattHoursPerKilometer__milliwattHoursPerKilometer;
}

void __53__CAFUnitEnergyEfficiency_milliwattHoursPerKilometer__block_invoke()
{
  CAFUnitEnergyEfficiency *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.001);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitEnergyEfficiency alloc], "initWithSymbol:converter:", CFSTR("mWh/km"), v2);
  v1 = (void *)milliwattHoursPerKilometer__milliwattHoursPerKilometer;
  milliwattHoursPerKilometer__milliwattHoursPerKilometer = (uint64_t)v0;

}

+ (NSUnitFuelEfficiency)kilowattHoursPer100Kilometers
{
  if (kilowattHoursPer100Kilometers_onceToken != -1)
    dispatch_once(&kilowattHoursPer100Kilometers_onceToken, &__block_literal_global_67);
  return (NSUnitFuelEfficiency *)(id)kilowattHoursPer100Kilometers__kilowattHoursPer100Kilometers;
}

void __56__CAFUnitEnergyEfficiency_kilowattHoursPer100Kilometers__block_invoke()
{
  CAFUnitEnergyEfficiency *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 10.0);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitEnergyEfficiency alloc], "initWithSymbol:converter:", CFSTR("kWh/100km"), v2);
  v1 = (void *)kilowattHoursPer100Kilometers__kilowattHoursPer100Kilometers;
  kilowattHoursPer100Kilometers__kilowattHoursPer100Kilometers = (uint64_t)v0;

}

+ (NSUnitFuelEfficiency)kilowattHoursPer100Miles
{
  if (kilowattHoursPer100Miles_onceToken != -1)
    dispatch_once(&kilowattHoursPer100Miles_onceToken, &__block_literal_global_70);
  return (NSUnitFuelEfficiency *)(id)kilowattHoursPer100Miles__kilowattHoursPer100Miles;
}

void __51__CAFUnitEnergyEfficiency_kilowattHoursPer100Miles__block_invoke()
{
  CAFUnitEnergyEfficiency *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 6.21371192);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitEnergyEfficiency alloc], "initWithSymbol:converter:", CFSTR("kWh/100mi"), v2);
  v1 = (void *)kilowattHoursPer100Miles__kilowattHoursPer100Miles;
  kilowattHoursPer100Miles__kilowattHoursPer100Miles = (uint64_t)v0;

}

+ (NSUnitFuelEfficiency)wattHoursPerMile
{
  if (wattHoursPerMile_onceToken != -1)
    dispatch_once(&wattHoursPerMile_onceToken, &__block_literal_global_73);
  return (NSUnitFuelEfficiency *)(id)wattHoursPerMile__wattHoursPerMile;
}

void __43__CAFUnitEnergyEfficiency_wattHoursPerMile__block_invoke()
{
  CAFUnitEnergyEfficiency *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 0.621371192);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitEnergyEfficiency alloc], "initWithSymbol:converter:", CFSTR("Wh/mi"), v2);
  v1 = (void *)wattHoursPerMile__wattHoursPerMile;
  wattHoursPerMile__wattHoursPerMile = (uint64_t)v0;

}

+ (NSUnitFuelEfficiency)milesPerKilowattHour
{
  if (milesPerKilowattHour_onceToken != -1)
    dispatch_once(&milesPerKilowattHour_onceToken, &__block_literal_global_76);
  return (NSUnitFuelEfficiency *)(id)milesPerKilowattHour__milesPerKilowattHour;
}

void __47__CAFUnitEnergyEfficiency_milesPerKilowattHour__block_invoke()
{
  CAFUnitEnergyEfficiency *v0;
  void *v1;
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD18C8]), "initWithCoefficient:", 621.371192);
  v0 = -[NSDimension initWithSymbol:converter:]([CAFUnitEnergyEfficiency alloc], "initWithSymbol:converter:", CFSTR("mi/kWh"), v2);
  v1 = (void *)milesPerKilowattHour__milesPerKilowattHour;
  milesPerKilowattHour__milesPerKilowattHour = (uint64_t)v0;

}

@end
