@implementation NSUnitFuelEfficiency(CAFUnit)

+ (id)millilitersPer100Kilometers
{
  if (millilitersPer100Kilometers_onceToken != -1)
    dispatch_once(&millilitersPer100Kilometers_onceToken, &__block_literal_global_94);
  return (id)millilitersPer100Kilometers__millilitersPer100Kilometers;
}

@end
