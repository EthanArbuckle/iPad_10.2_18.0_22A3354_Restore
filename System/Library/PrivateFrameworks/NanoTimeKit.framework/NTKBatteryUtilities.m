@implementation NTKBatteryUtilities

+ (BOOL)chargingForState:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (id)chargingStringForState:(int64_t)a3
{
  return (id)objc_msgSend(a1, "chargingStringForState:longText:", a3, 0);
}

+ (id)chargingStringForState:(int64_t)a3 longText:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  v4 = CFSTR("BATTERY_CHARGING");
  if (a4)
    v4 = CFSTR("BATTERY_CHARGING_LONG");
  v5 = CFSTR("BATTERY_REMAINING_LONG");
  if (!a4)
    v5 = CFSTR("BATTERY_BATTERY");
  v6 = CFSTR("BATTERY_CHARGED");
  if (a4)
    v6 = CFSTR("BATTERY_CHARGED_LONG");
  if (a3 == 3)
    v5 = v6;
  if (a3 == 2)
    v7 = (__CFString *)v4;
  else
    v7 = (__CFString *)v5;
  return NTKClockFaceLocalizedString(v7, CFSTR("charging"));
}

+ (id)colorForLevel:(float)a3 andState:(int64_t)a4
{
  NSObject *v7;
  objc_class *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v10 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "%@ invoking colorForLevel with level:%@ and state:%@", (uint8_t *)&v15, 0x20u);

  }
  if (objc_msgSend(a1, "chargingForState:", a4))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    if (a3 >= 0.0 && a3 <= 0.2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v13;
}

+ (id)modularRingColorForLevel:(float)a3
{
  void *v3;

  if (a3 <= 0.2)
  {
    if (a3 < 0.0)
      return 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
