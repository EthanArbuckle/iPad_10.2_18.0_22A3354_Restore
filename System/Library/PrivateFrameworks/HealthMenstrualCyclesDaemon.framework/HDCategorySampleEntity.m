@implementation HDCategorySampleEntity

uint64_t __115__HDCategorySampleEntity_HKMenstrualCycles__hdmc_ongoingFactorsOnDayIndex_factorTypes_profile_calendarCache_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  objc_msgSend(v3, "_timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarForTimeZone:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "hk_dayIndexRangeWithCalendar:", v6);
  v9 = v8;

  v10 = a1[6];
  if (v7 < v10 && (v9 < 1 || v7 + v9 > v10))
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v3);

  return 1;
}

uint64_t __115__HDCategorySampleEntity_HKMenstrualCycles__hdmc_ongoingFactorsOnDayIndex_factorTypes_profile_calendarCache_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  objc_msgSend(v7, "_timeZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "calendarForTimeZone:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v8, "hk_dayIndexWithCalendar:", v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *(void **)(a1 + 32);
  objc_msgSend(v6, "_timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "calendarForTimeZone:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "hk_dayIndexWithCalendar:", v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v12, "compare:", v18);

  return v19;
}

@end
