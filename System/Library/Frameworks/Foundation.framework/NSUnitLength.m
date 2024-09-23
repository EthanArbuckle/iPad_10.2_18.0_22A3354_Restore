@implementation NSUnitLength

+ (NSUnitLength)millimeters
{
  return (NSUnitLength *)&millimeters__struct_mm;
}

+ (NSUnitLength)meters
{
  return (NSUnitLength *)&meters__struct_meter;
}

+ (id)baseUnit
{
  return +[NSUnitLength meters](NSUnitLength, "meters");
}

+ (NSUnitLength)inches
{
  return (NSUnitLength *)&inches__struct_in;
}

+ (NSUnitLength)miles
{
  return (NSUnitLength *)&miles__struct_mi;
}

+ (id)icuType
{
  return CFSTR("length");
}

+ (NSUnitLength)centimeters
{
  return (NSUnitLength *)&centimeters__struct_cm;
}

+ (NSUnitLength)kilometers
{
  return (NSUnitLength *)&kilometers__struct_km;
}

+ (NSUnitLength)picometers
{
  return (NSUnitLength *)&picometers__struct_pm;
}

+ (NSUnitLength)nanometers
{
  return (NSUnitLength *)&nanometers__struct_nm;
}

+ (NSUnitLength)micrometers
{
  return (NSUnitLength *)&micrometers__struct_microm;
}

+ (NSUnitLength)megameters
{
  return (NSUnitLength *)&megameters__struct_Mm;
}

+ (NSUnitLength)hectometers
{
  return (NSUnitLength *)&hectometers__struct_hm;
}

+ (NSUnitLength)decimeters
{
  return (NSUnitLength *)&decimeters__struct_dm;
}

+ (NSUnitLength)decameters
{
  return (NSUnitLength *)&decameters__struct_dam;
}

+ (NSUnitLength)parsecs
{
  return (NSUnitLength *)&parsecs__struct_pc;
}

+ (NSUnitLength)lightyears
{
  return (NSUnitLength *)&lightyears__struct_ly;
}

+ (NSUnitLength)astronomicalUnits
{
  return (NSUnitLength *)&astronomicalUnits__struct_ua;
}

+ (NSUnitLength)yards
{
  return (NSUnitLength *)&yards__struct_yd;
}

+ (NSUnitLength)feet
{
  return (NSUnitLength *)&feet__struct_ft;
}

+ (void)initialize
{
  if (NSUnitLength == a1)
    objc_opt_class();
}

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (NSUnitLength)scandinavianMiles
{
  return (NSUnitLength *)&scandinavianMiles__struct_smi;
}

+ (NSUnitLength)nauticalMiles
{
  return (NSUnitLength *)&nauticalMiles__struct_NM;
}

+ (NSUnitLength)fathoms
{
  return (NSUnitLength *)&fathoms__struct_ftm;
}

+ (NSUnitLength)furlongs
{
  return (NSUnitLength *)&furlongs__struct_fur;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v5;
  NSUnitLength *v6;
  double v7;

  v4 = a3;
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitLength baseUnit](NSUnitLength, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitLength baseUnit](NSUnitLength, "baseUnit"));
      objc_msgSend(v4, "doubleValue");
      if (v7 >= 1000.0)
      {
        v6 = +[NSUnitLength kilometers](NSUnitLength, "kilometers");
        return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
      }
      if (v7 <= 0.001)
      {
        v6 = +[NSUnitLength millimeters](NSUnitLength, "millimeters");
        return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
      }
    }
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitLength feet](NSUnitLength, "feet")) & 1) == 0)
    v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitLength feet](NSUnitLength, "feet"));
  objc_msgSend(v4, "doubleValue");
  if (v5 >= 2640.0)
  {
    v6 = +[NSUnitLength miles](NSUnitLength, "miles");
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
  }
  if (v5 >= 900.0)
  {
    v6 = +[NSUnitLength yards](NSUnitLength, "yards");
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
  }
  if (v5 > 6.5)
    return v4;
  v6 = +[NSUnitLength inches](NSUnitLength, "inches");
  return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
}

@end
