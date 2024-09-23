@implementation NSUnitIlluminance

+ (void)initialize
{
  if (NSUnitIlluminance == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitIlluminance lux](NSUnitIlluminance, "lux");
}

+ (id)icuType
{
  return CFSTR("light");
}

+ (NSUnitIlluminance)lux
{
  return (NSUnitIlluminance *)&lux__struct_lx;
}

@end
