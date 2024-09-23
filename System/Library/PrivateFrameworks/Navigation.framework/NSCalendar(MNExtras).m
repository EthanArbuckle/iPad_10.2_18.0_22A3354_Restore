@implementation NSCalendar(MNExtras)

- (id)_navigation_offsetDate:()MNExtras toTimeZone:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a1, "componentsInTimeZone:fromDate:", a4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v9);

    objc_msgSend(a1, "dateFromComponents:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v6;
  }

  return v10;
}

- (uint64_t)_navigation_isDateInToday:()MNExtras inTimeZone:
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isDateInToday:", v2);

  return v3;
}

- (uint64_t)_navigation_isDateInTomorrow:()MNExtras inTimeZone:
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isDateInTomorrow:", v2);

  return v3;
}

- (id)_navigation_dateStringForDate:()MNExtras withStyle:useRelativeFormatting:inTimeZone:
{
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = qword_1ED0C4060;
  v11 = a6;
  v12 = a3;
  if (v10 != -1)
    dispatch_once(&qword_1ED0C4060, &__block_literal_global_35);
  objc_msgSend((id)_MergedGlobals_39, "setDateStyle:", a4);
  objc_msgSend((id)_MergedGlobals_39, "setDoesRelativeDateFormatting:", a5);
  v13 = (void *)_MergedGlobals_39;
  objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:", v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringFromDate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_navigation_relativeDateStringForDate:()MNExtras context:inTimeZone:
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = qword_1ED0C4070;
  v9 = a5;
  v10 = a3;
  if (v8 != -1)
    dispatch_once(&qword_1ED0C4070, &__block_literal_global_5);
  objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)qword_1ED0C4068, "setFormattingContext:", a4);
  objc_msgSend((id)qword_1ED0C4068, "setDoesRelativeDateFormatting:", 0);
  objc_msgSend((id)qword_1ED0C4068, "stringFromDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED0C4068, "setDoesRelativeDateFormatting:", 1);
  objc_msgSend((id)qword_1ED0C4068, "stringFromDate:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isEqualToString:", v12))
    v14 = 0;
  else
    v14 = v13;
  v15 = v14;

  return v15;
}

- (id)_navigation_transitRelativeDateStringForDate:()MNExtras context:inTimeZone:outUsedFormat:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v10 = a3;
  v11 = a5;
  objc_msgSend(a1, "_navigation_relativeDateStringForDate:context:inTimeZone:", v10, a4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "components:fromDate:", 28, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dateFromComponents:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:", 16, 5, v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_navigation_offsetDate:toTimeZone:", v10, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "components:fromDate:toDate:options:", 16, v19, v18, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "day") < 0 || objc_msgSend(v20, "day") > 5)
    {
      if (qword_1ED0C4090 != -1)
        dispatch_once(&qword_1ED0C4090, &__block_literal_global_11);
      v21 = &qword_1ED0C4088;
      if (!a6)
        goto LABEL_16;
      v22 = 2;
    }
    else
    {
      if (qword_1ED0C4080 != -1)
        dispatch_once(&qword_1ED0C4080, &__block_literal_global_7);
      v21 = &qword_1ED0C4078;
      if (!a6)
        goto LABEL_16;
      v22 = 1;
    }
    *a6 = v22;
LABEL_16:
    objc_msgSend((id)*v21, "stringFromDate:", v19);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  if (a6)
    *a6 = 0;
  v14 = v12;
LABEL_17:

  return v14;
}

@end
