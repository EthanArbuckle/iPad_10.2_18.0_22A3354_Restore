@implementation HFScheduleUtilities

+ (id)localizedStringFromScheduleType:(unint64_t)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v8;
  void *v9;

  if (a3 == 2)
  {
    v4 = CFSTR("HFScheduleType_Custom");
  }
  else if (a3 == 1)
  {
    v4 = CFSTR("HFScheduleType_SpecificDates");
  }
  else
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFScheduleUtilities.m"), 26, CFSTR("Unknown schedule type [%@]"), v9);

      v5 = CFSTR("Unknown");
      return v5;
    }
    v4 = CFSTR("HFScheduleType_Always");
  }
  _HFLocalizedStringWithDefaultValue(v4, v4, 1);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

+ (id)localizedStringForSchedule:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  unint64_t v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "rules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isYearDayRule");
    objc_msgSend(v6, "rules");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 < 2)
    {
      objc_msgSend(a1, "localizedStringForRule:", v8);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v9 & 1) != 0)
        v12 = CFSTR("HFSchedule_MultipleDates");
      else
        v12 = CFSTR("HFSchedule_MultipleTimes");
      _HFLocalizedStringWithDefaultValue(v12, v12, 1);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v16;

  }
  else
  {
    HFLogForCategory(0x45uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = a1;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "%@: %@ No schedule provided. Returning default string with assumption that access is always allowed.", (uint8_t *)&v18, 0x16u);

    }
    objc_msgSend(a1, "localizedStringForRule:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

+ (id)localizedStringForRule:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  __CFString *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    HFLogForCategory(0x45uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v22 = a1;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "%@: %@ No rule provided. Returning default string with assumption that access is always allowed.", buf, 0x16u);

    }
    v7 = a1;
    v8 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isYearDayRule"))
  {
    v7 = a1;
    v8 = v6;
LABEL_7:
    objc_msgSend(v7, "localizedMainStringForRule:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isWeekDayRule"))
  {
    objc_msgSend(a1, "localizedMainStringForRule:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "localizedDetailedStringForRule:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HFLocalizedStringWithFormat(CFSTR("HFScheduleRuleTimeInterval_FormatString"), CFSTR("%@%@"), v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = &stru_1EA741FF8;
  }
LABEL_8:

  return v11;
}

+ (id)localizedMainStringForRule:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isYearDayRule"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v7, "setDateStyle:", 2);
      objc_msgSend(v7, "setTimeStyle:", 0);
      objc_msgSend(v6, "yearDayRule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "validFrom");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "yearDayRule");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "validUntil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isDateInToday:", v9);

      if ((v13 & 1) != 0)
        _HFLocalizedStringWithDefaultValue(CFSTR("HFScheduleRuleDate_Today"), CFSTR("HFScheduleRuleDate_Today"), 1);
      else
        objc_msgSend(v7, "stringFromDate:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToDate:", v11);

      if ((v20 & 1) != 0)
        _HFLocalizedStringWithDefaultValue(CFSTR("HFScheduleRuleDate_Never"), CFSTR("HFScheduleRuleDate_Never"), 1);
      else
        objc_msgSend(v7, "stringFromDate:", v11);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      HFLocalizedStringWithFormat(CFSTR("HFScheduleRuleDateInterval_FormatString"), CFSTR("%@%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v18);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    if (!objc_msgSend(v6, "isWeekDayRule"))
    {
      v17 = &stru_1EA741FF8;
      goto LABEL_19;
    }
    if (!objc_msgSend(v6, "isAllDayWeekDayRule"))
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB3590]);
      objc_msgSend(v7, "setDateStyle:", 0);
      objc_msgSend(v7, "setTimeStyle:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "weekDayRule");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "startTime");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dateFromComponents:", v30);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "weekDayRule");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "endTime");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dateFromComponents:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringFromDate:toDate:", v9, v34);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    v16 = CFSTR("HFScheduleRuleTime_AllDay");
  }
  else
  {
    HFLogForCategory(0x45uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = a1;
      v38 = 2112;
      v39 = v15;
      _os_log_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEFAULT, "%@: %@ No rule provided. Returning default main string with assumption that access is always allowed.", buf, 0x16u);

    }
    v16 = CFSTR("HFScheduleType_Always");
  }
  _HFLocalizedStringWithDefaultValue(v16, v16, 1);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v17;
}

+ (id)localizedDetailedStringForRule:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isYearDayRule"))
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFScheduleRuleTime_AllDay"), CFSTR("HFScheduleRuleTime_AllDay"), 1);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v6, "isWeekDayRule"))
    {
      objc_msgSend(v6, "weekDayRule");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "daysOfTheWeek");
      HMDaysOfTheWeekToDateComponents();
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CBA910], "hf_recurrenceNaturalLanguageStringWithRecurrences:isEditor:", v12, 0);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = &stru_1EA741FF8;
    }
    v10 = v7;
  }
  else
  {
    HFLogForCategory(0x45uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = a1;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ No rule provided. Returning empty detailed string.", (uint8_t *)&v14, 0x16u);

    }
    v10 = &stru_1EA741FF8;
  }

  return v10;
}

+ (id)sortedScheduleRules:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sortComparatorForScheduleRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sortComparatorForScheduleRules
{
  return &__block_literal_global_147;
}

uint64_t __53__HFScheduleUtilities_sortComparatorForScheduleRules__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (!(v8 | v11))
  {
    objc_opt_class();
    v12 = v6;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    objc_opt_class();
    v15 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v14, "rule");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "rule");
    v11 = objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend((id)v8, "isYearDayRule") && objc_msgSend((id)v11, "isYearDayRule"))
  {
    objc_msgSend((id)v8, "yearDayRule");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "yearDayRule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "validFrom");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "validFrom");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "compare:", v21);

    if (v22)
    {
LABEL_26:

      goto LABEL_27;
    }
    objc_msgSend(v18, "validUntil");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "validUntil");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "compare:", v24);
    goto LABEL_22;
  }
  if (objc_msgSend((id)v8, "isWeekDayRule") && objc_msgSend((id)v11, "isWeekDayRule"))
  {
    objc_msgSend((id)v8, "weekDayRule");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "weekDayRule");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateFromComponents:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "startTime");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dateFromComponents:", v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v28;
    v25 = objc_msgSend(v28, "compare:", v24);
    if (!v25)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "endTime");
      v38 = v28;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dateFromComponents:", v32);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "hf_sharedCalendar");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "endTime");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "dateFromComponents:", v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = v38;
      v22 = objc_msgSend(v37, "compare:", v36);

      goto LABEL_25;
    }
LABEL_22:
    v22 = v25;
LABEL_25:

    goto LABEL_26;
  }
  v22 = 1;
LABEL_27:

  return v22;
}

@end
