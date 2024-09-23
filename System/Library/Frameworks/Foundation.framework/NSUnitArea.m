@implementation NSUnitArea

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitArea == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitArea squareMeters](NSUnitArea, "squareMeters");
}

+ (id)icuType
{
  return CFSTR("area");
}

+ (NSUnitArea)squareMegameters
{
  return (NSUnitArea *)&squareMegameters__struct_sqMm;
}

+ (NSUnitArea)squareKilometers
{
  return (NSUnitArea *)&squareKilometers__struct_sqkm;
}

+ (NSUnitArea)squareMeters
{
  return (NSUnitArea *)&squareMeters__struct_sqm;
}

+ (NSUnitArea)squareCentimeters
{
  return (NSUnitArea *)&squareCentimeters__struct_sqcm;
}

+ (NSUnitArea)squareMillimeters
{
  return (NSUnitArea *)&squareMillimeters__struct_sqmm;
}

+ (NSUnitArea)squareMicrometers
{
  return (NSUnitArea *)&squareMicrometers__struct_sqMicrom;
}

+ (NSUnitArea)squareNanometers
{
  return (NSUnitArea *)&squareNanometers__struct_sqnm;
}

+ (NSUnitArea)squareInches
{
  return (NSUnitArea *)&squareInches__struct_sqin;
}

+ (NSUnitArea)squareFeet
{
  return (NSUnitArea *)&squareFeet__struct_sqft;
}

+ (NSUnitArea)squareYards
{
  return (NSUnitArea *)&squareYards__struct_sqyd;
}

+ (NSUnitArea)squareMiles
{
  return (NSUnitArea *)&squareMiles__struct_sqmi;
}

+ (NSUnitArea)acres
{
  return (NSUnitArea *)&acres__struct_ac;
}

+ (NSUnitArea)ares
{
  return (NSUnitArea *)&ares__struct_are;
}

+ (NSUnitArea)hectares
{
  return (NSUnitArea *)&hectares__struct_ha;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v5;
  NSUnitArea *v6;
  double v7;

  v4 = a3;
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitArea baseUnit](NSUnitArea, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitArea baseUnit](NSUnitArea, "baseUnit"));
      objc_msgSend(v4, "doubleValue");
      if (v7 >= 1000.0)
      {
        v6 = +[NSUnitArea squareKilometers](NSUnitArea, "squareKilometers");
        return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
      }
      if (v7 <= 0.001)
      {
        v6 = +[NSUnitArea squareCentimeters](NSUnitArea, "squareCentimeters");
        return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
      }
    }
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitArea squareFeet](NSUnitArea, "squareFeet")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitArea squareFeet](NSUnitArea, "squareFeet"));
  objc_msgSend(v4, "doubleValue");
  if (v5 >= 27880000.0)
  {
    v6 = +[NSUnitArea squareMiles](NSUnitArea, "squareMiles");
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
  }
  if (v5 >= 900.0)
  {
    v6 = +[NSUnitArea squareYards](NSUnitArea, "squareYards");
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
  }
  if (v5 > 0.5)
    return v4;
  v6 = +[NSUnitArea squareInches](NSUnitArea, "squareInches");
  return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
}

@end
