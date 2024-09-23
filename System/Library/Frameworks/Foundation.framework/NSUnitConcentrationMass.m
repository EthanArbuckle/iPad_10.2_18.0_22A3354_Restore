@implementation NSUnitConcentrationMass

+ (void)initialize
{
  if (NSUnitConcentrationMass == a1)
    objc_opt_class();
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (id)baseUnit
{
  return +[NSUnitConcentrationMass gramsPerLiter](NSUnitConcentrationMass, "gramsPerLiter");
}

+ (id)icuType
{
  return CFSTR("concentr");
}

+ (NSUnitConcentrationMass)gramsPerLiter
{
  return (NSUnitConcentrationMass *)&gramsPerLiter__struct_gpl;
}

+ (NSUnitConcentrationMass)milligramsPerDeciliter
{
  return (NSUnitConcentrationMass *)&milligramsPerDeciliter__struct_mgpd;
}

+ (NSUnitConcentrationMass)millimolesPerLiterWithGramsPerMole:(double)gramsPerMole
{
  return -[NSDimension initWithSpecifier:symbol:converter:]([NSUnitConcentrationMass alloc], "initWithSpecifier:symbol:converter:", 4610, CFSTR("mmol/L"), -[NSUnitConverterLinear initWithCoefficient:]([NSUnitConverterLinear alloc], "initWithCoefficient:", gramsPerMole * 0.001));
}

@end
