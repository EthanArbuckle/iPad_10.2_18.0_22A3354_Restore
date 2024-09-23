@implementation NSUnitDuration

+ (NSUnitDuration)seconds
{
  return (NSUnitDuration *)&seconds__struct_sec;
}

+ (id)baseUnit
{
  return +[NSUnitDuration seconds](NSUnitDuration, "seconds");
}

+ (id)icuType
{
  return CFSTR("duration");
}

+ (void)initialize
{
  if (NSUnitDuration == a1)
    objc_opt_class();
}

+ (NSUnitDuration)nanoseconds
{
  return (NSUnitDuration *)&nanoseconds__struct_nanoseconds;
}

+ (NSUnitDuration)milliseconds
{
  return (NSUnitDuration *)&milliseconds__struct_milliseconds;
}

+ (NSUnitDuration)hours
{
  return (NSUnitDuration *)&hours__struct_hour;
}

+ (NSUnitDuration)minutes
{
  return (NSUnitDuration *)&minutes__struct_min;
}

+ (NSUnitDuration)microseconds
{
  return (NSUnitDuration *)&microseconds__struct_microseconds;
}

+ (NSUnitDuration)picoseconds
{
  return (NSUnitDuration *)&picoseconds__struct_picoseconds;
}

+ (id)_measurementWithNaturalScale:(id)a3 system:(unint64_t)a4
{
  id v4;
  double v5;
  NSUnitDuration *v8;

  v4 = a3;
  if (a4 != 3)
    return v4;
  if ((objc_msgSend((id)objc_msgSend(a3, "unit"), "isEqual:", +[NSUnitDuration baseUnit](NSUnitDuration, "baseUnit")) & 1) == 0)v4 = (id)objc_msgSend(v4, "measurementByConvertingToUnit:", +[NSUnitDuration baseUnit](NSUnitDuration, "baseUnit"));
  objc_msgSend(v4, "doubleValue");
  if (v5 >= 3600.0)
  {
    v8 = +[NSUnitDuration hours](NSUnitDuration, "hours");
    return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v8);
  }
  if (v5 > 3600.0 || v5 < 60.0)
    return v4;
  v8 = +[NSUnitDuration minutes](NSUnitDuration, "minutes");
  return (id)objc_msgSend(v4, "measurementByConvertingToUnit:", v8);
}

@end
