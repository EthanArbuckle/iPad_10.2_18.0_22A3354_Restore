@implementation NSCalendar(HKAdditions)

- (id)hk_startOfTomorrowForDate:()HKAdditions
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 1, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hk_yesterdayAtNoonForDate:()HKAdditions
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, -1, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startOfDayForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dateBySettingUnit:value:ofDate:options:", 32, 12, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hk_disambiguatedDSTDatesForComponents:()HKAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void **v17;
  void *v18;
  uint64_t v19;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setEra:", objc_msgSend(v5, "era"));
  objc_msgSend(v6, "setYear:", objc_msgSend(v5, "year"));
  objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "month"));
  objc_msgSend(v6, "setDay:", objc_msgSend(v5, "day"));
  objc_msgSend(v6, "setHour:", 12);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v8);

  objc_msgSend(a1, "dateFromComponents:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:", objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"), objc_msgSend(v5, "second"), v9, 4096);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "hour");
  v12 = objc_msgSend(v5, "minute");
  v13 = objc_msgSend(v5, "second");

  objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:", v11, v12, v13, v9, 0x2000);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v10)
  {
    if (v14)
    {
      if (!objc_msgSend(v10, "isEqualToDate:", v14))
      {
        v21[0] = v10;
        v21[1] = v15;
        v16 = (void *)MEMORY[0x1E0C99D20];
        v17 = (void **)v21;
        v19 = 2;
        goto LABEL_9;
      }
      v22 = v10;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = &v22;
    }
    else
    {
      v23[0] = v10;
      v16 = (void *)MEMORY[0x1E0C99D20];
      v17 = (void **)v23;
    }
    v19 = 1;
LABEL_9:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v18 = (void *)MEMORY[0x1E0C9AA60];
LABEL_10:

  return v18;
}

@end
