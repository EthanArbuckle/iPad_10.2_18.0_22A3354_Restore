@implementation NSUnitSpeed

+ (NSUnitSpeed)kilometersPerHour
{
  return (NSUnitSpeed *)&kilometersPerHour__struct_kph;
}

+ (NSUnitSpeed)metersPerSecond
{
  return (NSUnitSpeed *)&metersPerSecond__struct_mps;
}

+ (NSUnitSpeed)milesPerHour
{
  return (NSUnitSpeed *)&milesPerHour__struct_mph;
}

+ (id)baseUnit
{
  return +[NSUnitSpeed metersPerSecond](NSUnitSpeed, "metersPerSecond");
}

+ (id)icuType
{
  return CFSTR("speed");
}

+ (void)initialize
{
  if (NSUnitSpeed == a1)
    objc_opt_class();
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (NSUnitSpeed)knots
{
  return (NSUnitSpeed *)&knots__struct_kn;
}

@end
