@implementation NSDateInterval(HealthHearingDaemon)

+ (id)hd_hearingSevenDayLimitIntervalWithStartDate:()HealthHearingDaemon earliestStartDate:boundedInterval:
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v18;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateInterval+HealthHearingDaemon.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

  }
  if (objc_msgSend(v10, "hk_isAfterDate:", v9))
    v11 = v10;
  else
    v11 = v9;
  v12 = v11;
  if ((a5 & 1) != 0)
    objc_msgSend(v9, "dateByAddingTimeInterval:", 608400.0);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "hk_isAfterDate:", v13))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x24BDD3000];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3000], OS_LOG_TYPE_FAULT))
      +[NSDateInterval(HealthHearingDaemon) hd_hearingSevenDayLimitIntervalWithStartDate:earliestStartDate:boundedInterval:].cold.1((uint64_t)v10, (uint64_t)v9, v14);
    v15 = objc_msgSend([a1 alloc], "initWithStartDate:duration:", v9, 608400.0);
  }
  else
  {
    v15 = objc_msgSend([a1 alloc], "initWithStartDate:endDate:", v12, v13);
  }
  v16 = (void *)v15;

  return v16;
}

+ (id)hd_hearingSevenDayLimitIntervalWithEndDate:()HealthHearingDaemon
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateInterval+HealthHearingDaemon.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

  }
  objc_msgSend(v5, "dateByAddingTimeInterval:", -604800.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend([a1 alloc], "initWithStartDate:endDate:", v6, v5);

  return v7;
}

+ (id)hd_hearingSevenDayDoseLimitIntervalForNowDate:()HealthHearingDaemon
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v11;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateInterval+HealthHearingDaemon.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nowDate"));

  }
  objc_msgSend(v5, "dateByAddingTimeInterval:", 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -604800.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend([a1 alloc], "initWithStartDate:endDate:", v7, v6);
  objc_msgSend(v8, "duration");
  if (v9 != 608400.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDateInterval+HealthHearingDaemon.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dateInterval.duration == HDHeadphoneExposureSevenDayDoseInterval"));

  }
  return v8;
}

+ (void)hd_hearingSevenDayLimitIntervalWithStartDate:()HealthHearingDaemon earliestStartDate:boundedInterval:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_21A0AA000, log, OS_LOG_TYPE_FAULT, "earliestStartDate (%@) is more than 169 hours past startDate (%@)", (uint8_t *)&v3, 0x16u);
}

@end
