@implementation NSUnitFuelEfficiency

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitFuelEfficiency == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitFuelEfficiency litersPer100Kilometers](NSUnitFuelEfficiency, "litersPer100Kilometers");
}

+ (id)icuType
{
  return CFSTR("consumption");
}

+ (NSUnitFuelEfficiency)milesPerImperialGallon
{
  if (qword_1EDC54E68 != -1)
    dispatch_once(&qword_1EDC54E68, &__block_literal_global_14);
  return (NSUnitFuelEfficiency *)_MergedGlobals_49;
}

NSUnitFuelEfficiency *__46__NSUnitFuelEfficiency_milesPerImperialGallon__block_invoke()
{
  NSUnitFuelEfficiency *result;

  result = -[NSDimension initWithSpecifier:symbol:converter:]([NSUnitFuelEfficiency alloc], "initWithSpecifier:symbol:converter:", 3331, CFSTR("mpg"), -[NSUnitConverterReciprocal initWithReciprocalValue:]([NSUnitConverterReciprocal alloc], "initWithReciprocalValue:", 282.481));
  _MergedGlobals_49 = (uint64_t)result;
  return result;
}

+ (NSUnitFuelEfficiency)milesPerGallon
{
  if (qword_1EDC54E78 != -1)
    dispatch_once(&qword_1EDC54E78, &__block_literal_global_579);
  return (NSUnitFuelEfficiency *)qword_1EDC54E70;
}

NSUnitFuelEfficiency *__38__NSUnitFuelEfficiency_milesPerGallon__block_invoke()
{
  NSUnitFuelEfficiency *result;

  result = -[NSDimension initWithSpecifier:symbol:converter:]([NSUnitFuelEfficiency alloc], "initWithSpecifier:symbol:converter:", 3329, CFSTR("mpg"), -[NSUnitConverterReciprocal initWithReciprocalValue:]([NSUnitConverterReciprocal alloc], "initWithReciprocalValue:", 235.215));
  qword_1EDC54E70 = (uint64_t)result;
  return result;
}

+ (NSUnitFuelEfficiency)litersPer100Kilometers
{
  return (NSUnitFuelEfficiency *)&litersPer100Kilometers__struct_lpkm;
}

@end
