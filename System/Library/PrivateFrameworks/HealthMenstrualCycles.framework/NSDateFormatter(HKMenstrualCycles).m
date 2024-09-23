@implementation NSDateFormatter(HKMenstrualCycles)

+ (id)hkmc_longRelativeDateFormatter
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v0, "setTimeStyle:", 0);
  objc_msgSend(v0, "setDateStyle:", 4);
  objc_msgSend(v0, "setFormattingContext:", 5);
  objc_msgSend(v0, "setDoesRelativeDateFormatting:", 1);
  return v0;
}

+ (id)hkmc_longNonRelativeDateFormatter
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v0, "setTimeStyle:", 0);
  objc_msgSend(v0, "setDateStyle:", 4);
  objc_msgSend(v0, "setFormattingContext:", 5);
  objc_msgSend(v0, "setDoesRelativeDateFormatting:", 0);
  return v0;
}

+ (id)hkmc_nonRelativeDateWithoutDayFormatter
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v0, "setTimeStyle:", 0);
  objc_msgSend(v0, "setDateStyle:", 3);
  objc_msgSend(v0, "setFormattingContext:", 5);
  objc_msgSend(v0, "setDoesRelativeDateFormatting:", 0);
  return v0;
}

+ (uint64_t)hkmc_shouldUseRelativeFormatForFertileWindowEndDate:()HKMenstrualCycles gregorianCalendar:dateFormatArgumentOut:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1500], "hkmc_longRelativeDateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1500], "hkmc_longNonRelativeDateFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isEqualToString:", v10);
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD1500], "localizedKeyDayNameFromDate:gregorianCalendar:", v7, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_WILL_END_ON_%@"), v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HKMCLocalizedString(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1500], "hkmc_nonRelativeDateWithoutDayFormatter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringFromDate:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    HKMCLocalizedString(CFSTR("NOTIFICATION_UPDATE_FERTILE_WINDOW_BODY_FULL_FORMAT_%@_%@"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a5)
      *a5 = objc_retainAutorelease(v19);

  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease(v10);
  }

  return v13 ^ 1u;
}

+ (uint64_t)localizedKeyDayNameFromDate:()HKMenstrualCycles gregorianCalendar:
{
  return objc_msgSend(&unk_24D9AA4D8, "objectAtIndexedSubscript:", objc_msgSend(a4, "component:fromDate:", 512, a3) - 1);
}

@end
