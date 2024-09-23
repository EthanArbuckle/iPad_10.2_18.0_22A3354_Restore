@implementation NSUnitEnergy(CAFUnit)

+ (id)wattHours
{
  if (wattHours_onceToken != -1)
    dispatch_once(&wattHours_onceToken, &__block_literal_global_47);
  return (id)wattHours__wattHours;
}

+ (id)milliwattHours
{
  if (milliwattHours_onceToken != -1)
    dispatch_once(&milliwattHours_onceToken, &__block_literal_global_51);
  return (id)milliwattHours__wattHours;
}

@end
