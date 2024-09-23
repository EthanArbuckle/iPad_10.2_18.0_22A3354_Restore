@implementation NSUnitElectricCharge

+ (void)initialize
{
  if (NSUnitElectricCharge == a1)
    objc_opt_class();
}

+ (id)baseUnit
{
  return +[NSUnitElectricCharge coulombs](NSUnitElectricCharge, "coulombs");
}

+ (id)icuType
{
  return CFSTR("electric");
}

+ (NSUnitElectricCharge)coulombs
{
  return (NSUnitElectricCharge *)&coulombs__struct_coul;
}

+ (NSUnitElectricCharge)megaampereHours
{
  return (NSUnitElectricCharge *)&megaampereHours__struct_MAh;
}

+ (NSUnitElectricCharge)kiloampereHours
{
  return (NSUnitElectricCharge *)&kiloampereHours__struct_kAh;
}

+ (NSUnitElectricCharge)ampereHours
{
  return (NSUnitElectricCharge *)&ampereHours__struct_Ah;
}

+ (NSUnitElectricCharge)milliampereHours
{
  return (NSUnitElectricCharge *)&milliampereHours__struct_mAh;
}

+ (NSUnitElectricCharge)microampereHours
{
  return (NSUnitElectricCharge *)&microampereHours__struct_microAh;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v6;
  NSUnitElectricCharge *v7;

  v4 = a3;
  if (a4)
    return v4;
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitElectricCharge baseUnit](NSUnitElectricCharge, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitElectricCharge baseUnit](NSUnitElectricCharge, "baseUnit"));
  objc_msgSend(v4, "doubleValue");
  if (v6 >= 1000.0)
  {
    v7 = +[NSUnitElectricCharge kiloampereHours](NSUnitElectricCharge, "kiloampereHours");
  }
  else
  {
    if (v6 > 0.001)
      return v4;
    v7 = +[NSUnitElectricCharge milliampereHours](NSUnitElectricCharge, "milliampereHours");
  }
  return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v7);
}

@end
