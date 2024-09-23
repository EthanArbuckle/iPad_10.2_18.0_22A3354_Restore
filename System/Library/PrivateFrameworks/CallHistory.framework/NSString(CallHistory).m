@implementation NSString(CallHistory)

+ (id)ch_localizedNameOfTimeIntervalType:()CallHistory
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (a3 == 2)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    +[CHLocalization localizedStringForKey:](CHLocalization, "localizedStringForKey:", CFSTR("TIME_INTERVAL_DAYS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 30;
LABEL_7:
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if (a3 == 1)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    +[CHLocalization localizedStringForKey:](CHLocalization, "localizedStringForKey:", CFSTR("TIME_INTERVAL_YEARS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    goto LABEL_7;
  }
  if (a3)
  {
    v3 = 0;
  }
  else
  {
    +[CHLocalization localizedStringForKey:](CHLocalization, "localizedStringForKey:", CFSTR("TIME_INTERVAL_FOREVER"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
