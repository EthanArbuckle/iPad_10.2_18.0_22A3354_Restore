@implementation NSDate(CalDateLocalization)

- (id)localizedStringWithFormat:()CalDateLocalization
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[CalChronometry activeTimeZone](CalChronometry, "activeTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringWithFormat:timeZone:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (__CFString)localizedStringWithFormat:()CalDateLocalization timeZone:
{
  id v6;
  id v7;
  void *v8;
  __CFDateFormatter *v9;
  __CFDateFormatter *v10;
  const __CFString *v11;
  CFTypeRef v12;
  __CFString *StringWithDate;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  +[CalDateLocalization initializeFormatters](CalDateLocalization, "initializeFormatters");
  v9 = +[CalDateLocalization _dateFormatterForKey:](CalDateLocalization, "_dateFormatterForKey:", v6);
  v10 = v9;
  if (v9)
  {
    v11 = (const __CFString *)*MEMORY[0x1E0C9AF68];
    v12 = CFDateFormatterCopyProperty(v9, (CFDateFormatterKey)*MEMORY[0x1E0C9AF68]);
    if (v7 && (objc_msgSend(v7, "isEqualToTimeZone:", v12) & 1) == 0)
      CFDateFormatterSetProperty(v10, v11, v7);
    if (v12)
      CFRelease(v12);
    StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v10, a1);
  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NSDate(CalDateLocalization) localizedStringWithFormat:timeZone:].cold.1((uint64_t)v6, v14);

    StringWithDate = &stru_1E2A86598;
  }
  objc_sync_exit(v8);

  return StringWithDate;
}

- (void)localizedStringWithFormat:()CalDateLocalization timeZone:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[NSDate(CalDateLocalization) localizedStringWithFormat:timeZone:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "%s ERROR: unable to localize date because no formatter exists for \"%@\", (uint8_t *)&v2, 0x16u);
}

@end
