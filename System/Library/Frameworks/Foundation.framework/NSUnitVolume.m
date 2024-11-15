@implementation NSUnitVolume

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitVolume == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitVolume liters](NSUnitVolume, "liters");
}

+ (id)icuType
{
  return CFSTR("volume");
}

+ (NSUnitVolume)megaliters
{
  return (NSUnitVolume *)&megaliters__struct_ML;
}

+ (NSUnitVolume)kiloliters
{
  return (NSUnitVolume *)&kiloliters__struct_kL;
}

+ (NSUnitVolume)liters
{
  return (NSUnitVolume *)&liters__struct_liter;
}

+ (NSUnitVolume)deciliters
{
  return (NSUnitVolume *)&deciliters__struct_dL;
}

+ (NSUnitVolume)centiliters
{
  return (NSUnitVolume *)&centiliters__struct_cL;
}

+ (NSUnitVolume)milliliters
{
  return (NSUnitVolume *)&milliliters__struct_mL;
}

+ (NSUnitVolume)cubicKilometers
{
  return (NSUnitVolume *)&cubicKilometers__struct_ckm;
}

+ (NSUnitVolume)cubicMeters
{
  return (NSUnitVolume *)&cubicMeters__struct_cm;
}

+ (NSUnitVolume)cubicDecimeters
{
  return (NSUnitVolume *)&cubicDecimeters__struct_cdm;
}

+ (NSUnitVolume)cubicCentimeters
{
  return (NSUnitVolume *)&cubicCentimeters__struct_ccm;
}

+ (NSUnitVolume)cubicMillimeters
{
  return (NSUnitVolume *)&cubicMillimeters__struct_cmm;
}

+ (NSUnitVolume)cubicInches
{
  return (NSUnitVolume *)&cubicInches__struct_cin;
}

+ (NSUnitVolume)cubicFeet
{
  return (NSUnitVolume *)&cubicFeet__struct_cft;
}

+ (NSUnitVolume)cubicYards
{
  return (NSUnitVolume *)&cubicYards__struct_cyd;
}

+ (NSUnitVolume)cubicMiles
{
  return (NSUnitVolume *)&cubicMiles__struct_cmi;
}

+ (NSUnitVolume)acreFeet
{
  return (NSUnitVolume *)&acreFeet__struct_af;
}

+ (NSUnitVolume)bushels
{
  return (NSUnitVolume *)&bushels__struct_bsh;
}

+ (NSUnitVolume)teaspoons
{
  return (NSUnitVolume *)&teaspoons__struct_tsp;
}

+ (NSUnitVolume)tablespoons
{
  return (NSUnitVolume *)&tablespoons__struct_tbsp;
}

+ (NSUnitVolume)fluidOunces
{
  return (NSUnitVolume *)&fluidOunces__struct_floz;
}

+ (NSUnitVolume)cups
{
  return (NSUnitVolume *)&cups__struct_cup;
}

+ (NSUnitVolume)pints
{
  return (NSUnitVolume *)&pints__struct_pt;
}

+ (NSUnitVolume)quarts
{
  return (NSUnitVolume *)&quarts__struct_qt;
}

+ (NSUnitVolume)gallons
{
  return (NSUnitVolume *)&gallons__struct_gal;
}

+ (NSUnitVolume)imperialTeaspoons
{
  return (NSUnitVolume *)&imperialTeaspoons__struct_itsp;
}

+ (NSUnitVolume)imperialTablespoons
{
  return (NSUnitVolume *)&imperialTablespoons__struct_itbsp;
}

+ (NSUnitVolume)imperialFluidOunces
{
  return (NSUnitVolume *)&imperialFluidOunces__struct_ifloz;
}

+ (NSUnitVolume)imperialPints
{
  return (NSUnitVolume *)&imperialPints__struct_ipt;
}

+ (NSUnitVolume)imperialQuarts
{
  return (NSUnitVolume *)&imperialQuarts__struct_iqt;
}

+ (NSUnitVolume)imperialGallons
{
  return (NSUnitVolume *)&imperialGallons__struct_igal;
}

+ (NSUnitVolume)metricCups
{
  return (NSUnitVolume *)&metricCups__struct_mcups;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v5;
  NSUnitVolume *v6;
  double v7;
  double v9;

  v4 = a3;
  if (a4 == 2)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitVolume cups](NSUnitVolume, "cups")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitVolume cups](NSUnitVolume, "cups"));
    objc_msgSend(v4, "doubleValue");
    if (v9 >= 15.0)
    {
      v6 = +[NSUnitVolume gallons](NSUnitVolume, "gallons");
      return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
    }
    if (v9 >= 8.0)
    {
      v6 = +[NSUnitVolume quarts](NSUnitVolume, "quarts");
      return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
    }
    if (v9 <= 0.5)
    {
      v6 = +[NSUnitVolume fluidOunces](NSUnitVolume, "fluidOunces");
      return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
    }
    return v4;
  }
  if (a4 == 1)
  {
    if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitVolume imperialFluidOunces](NSUnitVolume, "imperialFluidOunces")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitVolume imperialFluidOunces](NSUnitVolume, "imperialFluidOunces"));
    objc_msgSend(v4, "doubleValue");
    if (v7 >= 160.0)
    {
      v6 = +[NSUnitVolume imperialGallons](NSUnitVolume, "imperialGallons");
      return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
    }
    return v4;
  }
  if (a4)
    return v4;
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitVolume baseUnit](NSUnitVolume, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitVolume baseUnit](NSUnitVolume, "baseUnit"));
  objc_msgSend(v4, "doubleValue");
  if (v5 >= 1000.0)
  {
    v6 = +[NSUnitVolume kiloliters](NSUnitVolume, "kiloliters");
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
  }
  if (v5 > 0.001)
    return v4;
  v6 = +[NSUnitVolume centiliters](NSUnitVolume, "centiliters");
  return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
}

@end
