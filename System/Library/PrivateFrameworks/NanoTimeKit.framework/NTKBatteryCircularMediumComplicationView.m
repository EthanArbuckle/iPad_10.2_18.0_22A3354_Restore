@implementation NTKBatteryCircularMediumComplicationView

- (BOOL)usesMediumLayout
{
  return 1;
}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "isCompatibleWithFamily:", *MEMORY[0x1E0C93E90]);
  else
    v4 = 0;

  return v4;
}

@end
