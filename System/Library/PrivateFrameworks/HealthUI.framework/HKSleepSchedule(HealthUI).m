@implementation HKSleepSchedule(HealthUI)

- (id)hk_localizedWeekdaysList
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setFormattingContext:", 2);
  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setFormattingContext:", 5);
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hk_localizedWeekdaysListWithGregorianCalendar:standaloneFormatter:listItemFormatter:", v4, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hk_localizedWeekdaysListWithGregorianCalendar:()HealthUI standaloneFormatter:listItemFormatter:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(a1, "weekdays"))
  {
    objc_msgSend(a1, "overrideDayIndex");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _OverrideStringForCalendar(v8, v14);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v18 = (void *)v16;

    goto LABEL_11;
  }
  v11 = objc_msgSend(a1, "weekdays");
  v12 = *MEMORY[0x1E0CB5F08];
  if (v11 == *MEMORY[0x1E0CB5F08])
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("SLEEP_SCHEDULE_EVERY_DAY");
LABEL_9:
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v17 = _WeekendDaysInCalendar(v8);
  if (objc_msgSend(a1, "weekdays") == v17)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("SLEEP_SCHEDULE_WEEKENDS");
    goto LABEL_9;
  }
  if (objc_msgSend(a1, "weekdays") == (v12 & ~v17))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    v15 = CFSTR("SLEEP_SCHEDULE_WEEKDAYS");
    goto LABEL_9;
  }
  objc_msgSend(a1, "weekdays");
  if (HKSleepScheduleWeekdaysIsSingleDay()
    && (objc_msgSend(a1, "weekdays"), v20 = NSWeekdayComponentFromHKSleepScheduleWeekday(), v21 = v20 - 1, v20 >= 1))
  {
    objc_msgSend(v9, "standaloneWeekdaySymbols");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = v9;
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    _OrderedCalendarWeekdayComponents(v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v29, "integerValue");
          v30 = HKSleepScheduleWeekdayFromWeekdayComponent();
          if ((objc_msgSend(a1, "weekdays") & v30) != 0)
          {
            objc_msgSend(v10, "shortStandaloneWeekdaySymbols");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", objc_msgSend(v29, "integerValue") - 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v32);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v26);
    }

    objc_msgSend(MEMORY[0x1E0CB3738], "localizedStringByJoiningStrings:", v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "hk_localizedFirstWordCapitalizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v34;
  }
LABEL_11:

  return v18;
}

- (id)hk_localizedScheduledSleepDuration
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "bedTimeComponents");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(a1, "wakeTimeComponents"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(MEMORY[0x1E0CB3590], "hk_hourMinuteOnlyDateIntervalFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "bedTimeComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "wakeTimeComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringFromDate:toDate:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SLEEP_SCHEDULE_NO_TIMES_TEXT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)hk_localizedBedtime
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "bedTimeComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _TimeStringForDateComponents(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hk_localizedWakeTime
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "wakeTimeComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  _TimeStringForDateComponents(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
