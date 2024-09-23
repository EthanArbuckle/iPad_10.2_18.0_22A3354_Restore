@implementation NSDate(AssistantAdditions)

- (BOOL)_af_isSameDayAsDate:()AssistantAdditions
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 30, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 30, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "era");
  if (v9 == objc_msgSend(v8, "era")
    && (v10 = objc_msgSend(v7, "year"), v10 == objc_msgSend(v8, "year"))
    && (v11 = objc_msgSend(v7, "month"), v11 == objc_msgSend(v8, "month")))
  {
    v12 = objc_msgSend(v7, "day");
    v13 = v12 == objc_msgSend(v8, "day");
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)af_isToday
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_af_isSameDayAsDate:", v2);

  return v3;
}

- (uint64_t)af_isTomorrow
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 1);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingComponents:toDate:options:", v2, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(a1, "_af_isSameDayAsDate:", v5);
  return v6;
}

@end
