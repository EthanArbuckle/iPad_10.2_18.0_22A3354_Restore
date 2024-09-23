@implementation NSUnitPressure

+ (NSUnitPressure)inchesOfMercury
{
  return (NSUnitPressure *)&inchesOfMercury__struct_inHg;
}

+ (NSUnitPressure)newtonsPerMetersSquared
{
  return (NSUnitPressure *)&newtonsPerMetersSquared__struct_nms;
}

+ (id)baseUnit
{
  return +[NSUnitPressure newtonsPerMetersSquared](NSUnitPressure, "newtonsPerMetersSquared");
}

+ (id)icuType
{
  return CFSTR("pressure");
}

+ (NSUnitPressure)millibars
{
  return (NSUnitPressure *)&millibars__struct_mbar;
}

+ (NSUnitPressure)megapascals
{
  return (NSUnitPressure *)&megapascals__struct_MPa;
}

+ (NSUnitPressure)kilopascals
{
  return (NSUnitPressure *)&kilopascals__struct_kPa;
}

+ (NSUnitPressure)hectopascals
{
  return (NSUnitPressure *)&hectopascals__struct_hPa;
}

+ (NSUnitPressure)gigapascals
{
  return (NSUnitPressure *)&gigapascals__struct_GPa;
}

+ (NSUnitPressure)millimetersOfMercury
{
  return (NSUnitPressure *)&millimetersOfMercury__struct_mmHg;
}

+ (NSUnitPressure)bars
{
  return (NSUnitPressure *)&bars__struct_bar;
}

+ (void)initialize
{
  if (NSUnitPressure == a1)
    objc_opt_class();
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (NSUnitPressure)poundsForcePerSquareInch
{
  return (NSUnitPressure *)&poundsForcePerSquareInch__struct_psi;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v5;

  v4 = a3;
  if (a4)
    return v4;
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitPressure baseUnit](NSUnitPressure, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitPressure baseUnit](NSUnitPressure, "baseUnit"));
  objc_msgSend(v4, "doubleValue");
  if (v5 < 1000.0)
    return v4;
  else
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitPressure kilopascals](NSUnitPressure, "kilopascals"));
}

@end
