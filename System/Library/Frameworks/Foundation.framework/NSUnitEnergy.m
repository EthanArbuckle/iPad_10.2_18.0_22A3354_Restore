@implementation NSUnitEnergy

+ (BOOL)supportsRegionalPreference
{
  return 1;
}

+ (void)initialize
{
  if (NSUnitEnergy == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitEnergy joules](NSUnitEnergy, "joules");
}

+ (id)icuType
{
  return CFSTR("energy");
}

+ (NSUnitEnergy)kilojoules
{
  return (NSUnitEnergy *)&kilojoules__struct_kJ;
}

+ (NSUnitEnergy)joules
{
  return (NSUnitEnergy *)&joules__struct_joule;
}

+ (NSUnitEnergy)kilocalories
{
  return (NSUnitEnergy *)&kilocalories__struct_kCal;
}

+ (id)foodcalories
{
  return &foodcalories__struct_c;
}

+ (NSUnitEnergy)calories
{
  return (NSUnitEnergy *)&calories__struct_cal;
}

+ (NSUnitEnergy)kilowattHours
{
  return (NSUnitEnergy *)&kilowattHours__struct_kWh;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v5;
  NSUnitEnergy *v6;
  double v7;

  v4 = a3;
  if (a4 - 1 >= 2)
  {
    if (!a4)
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitEnergy baseUnit](NSUnitEnergy, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitEnergy baseUnit](NSUnitEnergy, "baseUnit"));
      objc_msgSend(v4, "doubleValue");
      if (v7 >= 1000.0)
      {
        v6 = +[NSUnitEnergy kilojoules](NSUnitEnergy, "kilojoules");
        return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
      }
    }
    return v4;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitEnergy calories](NSUnitEnergy, "calories")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitEnergy calories](NSUnitEnergy, "calories"));
  objc_msgSend(v4, "doubleValue");
  if (v5 < 1000.0)
    return v4;
  v6 = +[NSUnitEnergy kilocalories](NSUnitEnergy, "kilocalories");
  return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v6);
}

@end
