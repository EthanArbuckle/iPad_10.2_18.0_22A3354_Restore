@implementation HFScheduleValidator

+ (BOOL)isValid:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (v4 && (objc_msgSend(a1, "containsUnsupportedRules:", v4) & 1) == 0)
    v5 = objc_msgSend(a1, "containsInvalidRules:", v4) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

+ (BOOL)containsInvalidRules:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "rules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_125);

  return v4;
}

BOOL __44__HFScheduleValidator_containsInvalidRules___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isWeekDayRule"))
  {
    objc_msgSend(v2, "weekDayRule");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "daysOfTheWeek") == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)containsUnsupportedRules:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  int v10;

  v3 = a3;
  objc_msgSend(v3, "rules");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 >= objc_msgSend(v3, "minNumberOfRules")
    && (v6 = objc_msgSend(v4, "count"), v6 <= objc_msgSend(v3, "maxNumberOfRules"))
    && ((v7 = objc_msgSend(v4, "na_any:", &__block_literal_global_1), (objc_msgSend(v3, "supportsWeekDayRules") & 1) != 0)
     || !v7))
  {
    v10 = objc_msgSend(v4, "na_any:", &__block_literal_global_2_17);
    v8 = v10 & ~objc_msgSend(v3, "supportsYearDayRules");
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

uint64_t __48__HFScheduleValidator_containsUnsupportedRules___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWeekDayRule");
}

uint64_t __48__HFScheduleValidator_containsUnsupportedRules___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isYearDayRule");
}

@end
