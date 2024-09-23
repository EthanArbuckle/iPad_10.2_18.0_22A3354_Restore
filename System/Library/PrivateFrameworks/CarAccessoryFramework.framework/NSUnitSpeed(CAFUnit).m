@implementation NSUnitSpeed(CAFUnit)

+ (id)metersPerHour
{
  if (metersPerHour_onceToken != -1)
    dispatch_once(&metersPerHour_onceToken, &__block_literal_global_120);
  return (id)metersPerHour_metersPerHour;
}

@end
