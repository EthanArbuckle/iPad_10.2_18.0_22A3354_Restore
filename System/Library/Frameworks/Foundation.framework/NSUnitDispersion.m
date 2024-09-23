@implementation NSUnitDispersion

+ (NSUnitDispersion)partsPerMillion
{
  return (NSUnitDispersion *)&partsPerMillion__struct_ppm;
}

+ (void)initialize
{
  if (NSUnitDispersion == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitDispersion partsPerMillion](NSUnitDispersion, "partsPerMillion");
}

+ (id)icuType
{
  return CFSTR("concentr");
}

@end
