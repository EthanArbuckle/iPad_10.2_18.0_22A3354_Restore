@implementation NSUnitAngle

+ (NSUnitAngle)degrees
{
  return (NSUnitAngle *)&degrees__struct_deg;
}

+ (void)initialize
{
  if (NSUnitAngle == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitAngle degrees](NSUnitAngle, "degrees");
}

+ (id)icuType
{
  return CFSTR("angle");
}

+ (NSUnitAngle)arcMinutes
{
  return (NSUnitAngle *)&arcMinutes__struct_arcMin;
}

+ (NSUnitAngle)arcSeconds
{
  return (NSUnitAngle *)&arcSeconds__struct_arcSec;
}

+ (NSUnitAngle)radians
{
  return (NSUnitAngle *)&radians__struct_rad;
}

+ (NSUnitAngle)gradians
{
  return (NSUnitAngle *)&gradians__struct_grad;
}

+ (NSUnitAngle)revolutions
{
  return (NSUnitAngle *)&revolutions__struct_rev;
}

@end
