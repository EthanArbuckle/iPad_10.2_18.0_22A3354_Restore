@implementation NDOUtilities

+ (BOOL)isInternal
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sf_isInternalInstall");

  return v3;
}

+ (id)dateWithEpochNumber:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
    v5 = v4 / 0x3E8;
    if (v4 <= 0x2540BE400)
      v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unsigned)daysFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("OneDayInterval"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  if (v8 <= 0.0)
    v9 = 86400.0;
  else
    v9 = v8;
  objc_msgSend(v4, "timeIntervalSinceNow");
  v11 = v10;

  return vcvtpd_u64_f64(v11 / v9);
}

@end
