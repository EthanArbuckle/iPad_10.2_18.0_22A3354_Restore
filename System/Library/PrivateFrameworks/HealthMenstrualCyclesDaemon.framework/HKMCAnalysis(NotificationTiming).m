@implementation HKMCAnalysis(NotificationTiming)

- (id)_hdmc_firstPeriodStartProjection
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "menstruationProjections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_4;
  if (!objc_msgSend(v3, "isPartiallyLogged"))
  {
LABEL_6:
    v6 = v3;
    v3 = v6;
    goto LABEL_7;
  }
  objc_msgSend(a1, "menstruationProjections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    objc_msgSend(a1, "menstruationProjections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
    goto LABEL_6;
  }
LABEL_4:
  v6 = 0;
LABEL_7:

  return v6;
}

- (HDMCNotification)hdmc_beforePeriodStartNotification
{
  void *v1;
  void *v2;
  uint64_t v3;
  HDMCNotification *v4;
  void *v5;
  HDMCNotification *v6;

  objc_msgSend(a1, "_hdmc_firstPeriodStartProjection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "startDayRange");
    v4 = [HDMCNotification alloc];
    HKMCNotificationCategoryBeforePeriodStartForDays();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HDMCNotification initWithFireOnDayIndex:category:](v4, "initWithFireOnDayIndex:category:", v3 - 1, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HDMCNotification)hdmc_afterPeriodStartNotification
{
  void *v1;
  void *v2;
  uint64_t v3;
  HDMCNotification *v4;
  HDMCNotification *v5;

  objc_msgSend(a1, "_hdmc_firstPeriodStartProjection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "mostLikelyDays") + 4;
    v4 = [HDMCNotification alloc];
    v5 = -[HDMCNotification initWithFireOnDayIndex:category:](v4, "initWithFireOnDayIndex:category:", v3, *MEMORY[0x24BE46A28]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HDMCNotification)hdmc_afterPeriodEndNotification
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HDMCNotification *v14;
  int v15;
  id *v16;
  id v17;

  objc_msgSend(a1, "menstruationProjections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_6;
  if (objc_msgSend(v3, "isPartiallyLogged"))
  {
    objc_msgSend(a1, "statistics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cycleLengthMedian");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(a1, "lastMenstrualFlowDayIndex");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(a1, "lastMenstrualFlowDayIndex");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "integerValue");
        v10 = v9 - objc_msgSend(v3, "mostLikelyDays") + 1;

        objc_msgSend(a1, "statistics");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "menstruationLengthMedian");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "integerValue") - 1;

        if (v10 >= v13)
        {
LABEL_6:
          v14 = 0;
          goto LABEL_11;
        }
      }
    }
    else
    {

    }
  }
  v15 = objc_msgSend(v3, "isPartiallyLogged");
  v16 = (id *)MEMORY[0x24BE46A20];
  if (!v15)
    v16 = (id *)MEMORY[0x24BE46A30];
  v17 = *v16;
  v14 = -[HDMCNotification initWithFireOnDayIndex:category:]([HDMCNotification alloc], "initWithFireOnDayIndex:category:", objc_msgSend(v3, "dayIndexFromEndWithCoefficient:", 2.2), v17);

LABEL_11:
  return v14;
}

- (HDMCNotification)hdmc_beforeFertileWindowStartNotification
{
  void *v1;
  void *v2;
  HDMCNotification *v3;
  uint64_t v4;
  HDMCNotification *v5;

  objc_msgSend(a1, "fertileWindowProjections");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = [HDMCNotification alloc];
    v4 = objc_msgSend(v2, "allDays");
    v5 = -[HDMCNotification initWithFireOnDayIndex:category:](v3, "initWithFireOnDayIndex:category:", v4 - 3, *MEMORY[0x24BE46A38]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (HDMCNotification)hdmc_fertileWindowDidUpdateDueToSensorDataNotificationForNotificationFireDate:()NotificationTiming lastFiredDate:fertileWindowNotificationTimeOfDay:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HDMCNotification *v29;
  HDMCNotification *v30;
  void *v31;
  void *v32;
  id v33;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "fertileWindowProjections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && objc_msgSend(v12, "daysOffsetFromCalendarMethod")
    && (!objc_msgSend(v12, "daysOffsetFromCalendarMethod") || objc_msgSend(v12, "predictionPrimarySource") == 2))
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hkmc_nextDateAfterDate:matchingHourComponents:", v8, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v16 = v15;
        *(_DWORD *)buf = 138543362;
        v37 = (id)objc_opt_class();
        v17 = v37;
        _os_log_impl(&dword_21961B000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Our next date to fire a notification is nil, defaulting back to today as our next fire date", buf, 0xCu);

      }
      v14 = v8;
    }
    v18 = objc_msgSend(v14, "hk_dayIndexWithCalendar:", v13);
    if (v9 && v18 - objc_msgSend(v9, "hk_dayIndexWithCalendar:", v13) <= 9)
    {
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v31;
        v32 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v37 = v32;
        v33 = v32;
        _os_log_impl(&dword_21961B000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] We have already fired our update fertile window notification within the past 10 days, we are going to skip scheduling another one.", buf, 0xCu);

        goto LABEL_18;
      }
    }
    else
    {
      v19 = objc_msgSend(v12, "allDays");
      objc_msgSend(v12, "allDays");
      v21 = v19 + v20 - 1;
      v22 = v21 - v18;
      if ((unint64_t)(v21 - v18) < 4)
      {
        v30 = [HDMCNotification alloc];
        v29 = -[HDMCNotification initWithFireOnDayIndex:category:fertileWindowEndDayIndex:daysShifted:](v30, "initWithFireOnDayIndex:category:fertileWindowEndDayIndex:daysShifted:", v18, *MEMORY[0x24BE46A68], v21, objc_msgSend(v12, "daysOffsetFromCalendarMethod"));
LABEL_20:

        goto LABEL_21;
      }
      _HKInitializeLogging();
      v23 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v24 = v23;
        v25 = (void *)objc_opt_class();
        v26 = (void *)MEMORY[0x24BDD16E0];
        v35 = v25;
        objc_msgSend(v26, "numberWithInteger:", v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        HKSensitiveLogItem();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v25;
        v38 = 2112;
        v39 = v28;
        _os_log_impl(&dword_21961B000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] The remaining days in our fertile window are: %@, so we will skip scheduling an update fertile window notification", buf, 0x16u);

LABEL_18:
      }
    }
    v29 = 0;
    goto LABEL_20;
  }
  v29 = 0;
LABEL_21:

  return v29;
}

- (BOOL)isEarliestNotificationScheduledAfterDate:()NotificationTiming gregorianCalendar:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "menstruationProjections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_msgSend(v9, "startDayRange") - 1;
    v11 = objc_msgSend(v6, "hk_dayIndexWithCalendar:", v7) < v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
