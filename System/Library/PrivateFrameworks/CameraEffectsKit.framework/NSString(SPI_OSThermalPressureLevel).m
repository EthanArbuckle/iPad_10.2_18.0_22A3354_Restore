@implementation NSString(SPI_OSThermalPressureLevel)

+ (const)stringFromOSThermalPressureLevel:()SPI_OSThermalPressureLevel
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("heavy");
  v4 = CFSTR("trapping");
  v5 = CFSTR("sleeping");
  if (a3 != 50)
    v5 = 0;
  if (a3 != 40)
    v4 = v5;
  if (a3 != 30)
    v3 = v4;
  v6 = CFSTR("moderate");
  if (a3 != 20)
    v6 = 0;
  if (a3 == 10)
    v6 = CFSTR("light");
  if (!a3)
    v6 = CFSTR("nominal");
  if (a3 <= 29)
    return v6;
  else
    return v3;
}

@end
