@implementation CalTimeIntervalLocalization

+ (id)localizedStringForInterval:(double)a3 withOptions:(unint64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (fabs(a3) >= 2.22044605e-16 || (a4 & 1) == 0)
  {
    if ((a4 & 0x20) != 0)
    {
      objc_msgSend(a1, "_localizedTimeStringForAllDayEventDuration:includeAlert:", (a4 >> 3) & 1, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(a1, "_localizedTimeStringForTimedEventDuration:abbreviate:", (a4 >> 1) & 1, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_localizedStringWithTimeString:rawDuration:options:", v8, a4, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("%d minutes"), &stru_1E2A86598, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)_localizedTimeStringForTimedEventDuration:(double)a3 abbreviate:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  void *v9;

  v4 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_calculateDurations:timeUnits:forDuration:allDay:abbreviate:", v7, v8, 0, v4, a3);
  objc_msgSend(a1, "_stringWithDurations:timeUnits:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)_calculateDurations:(id)a3 timeUnits:(id)a4 forDuration:(double)a5 allDay:(BOOL)a6 abbreviate:(BOOL)a7
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;

  v13 = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  LOBYTE(v9) = a7;
  objc_msgSend(a1, "_calculateDurations:timeUnits:forDuration:allDay:dayDuration:hourDuration:minuteDuration:secondDuration:abbreviate:", a3, a4, a6, &v13, &v12, &v11, a5, &v10, v9);
  v7 = v13;
  v8 = v12;

}

+ (id)_stringWithDurations:(id)a3 timeUnits:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("duration and unit one group"), CFSTR("%ld %@"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(v5, "objectAtIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%ld %@, %ld %@"), &stru_1E2A86598, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v11, v15, v12, v17, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v5, "count") == 3)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v20, "integerValue");

    objc_msgSend(v5, "objectAtIndex:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "integerValue");

    objc_msgSend(v5, "objectAtIndex:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "integerValue");

    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%ld %@, %ld %@, %ld %@"), &stru_1E2A86598, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringWithFormat:", v11, v40, v12, v22, v26, v24, v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v5, "count") != 4)
    {
      v13 = 0;
      goto LABEL_10;
    }
    objc_msgSend(v5, "objectAtIndex:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v28, "integerValue");

    objc_msgSend(v5, "objectAtIndex:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v29, "integerValue");

    objc_msgSend(v5, "objectAtIndex:", 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v30, "integerValue");

    objc_msgSend(v5, "objectAtIndex:", 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "integerValue");

    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%ld %@, %ld %@, %ld %@, %ld %@"), &stru_1E2A86598, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 3);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringWithFormat:", v11, v41, v12, v39, v34, v38, v35, v32, v36);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v13;
}

+ (id)_localizedStringWithTimeString:(id)a3 rawDuration:(double)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v5 = a5;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 8) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    if ((v5 & 0x10) != 0)
    {
      if (a4 < 0.0)
        v12 = CFSTR("Alert %@ before travel");
      else
        v12 = CFSTR("Alert %@ after travel");
    }
    else if (a4 < 0.0)
    {
      v12 = CFSTR("Alert %@ before start");
    }
    else
    {
      v12 = CFSTR("Alert %@ after start");
    }
    goto LABEL_14;
  }
  if ((v5 & 4) != 0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (a4 >= 0.0)
      v12 = CFSTR("%@ after");
    else
      v12 = CFSTR("%@ before");
LABEL_14:
    objc_msgSend(v8, "localizedStringForKey:value:table:", v12, &stru_1E2A86598, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v13, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v10 = v7;
LABEL_15:

  return v10;
}

+ (id)_localizedTimeStringForAllDayEventDuration:(double)a3 includeAlert:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0;
  v46 = 0;
  v43 = 0;
  v44 = 0;
  LOBYTE(v36) = 0;
  objc_msgSend(a1, "_calculateDurations:timeUnits:forDuration:allDay:dayDuration:hourDuration:minuteDuration:secondDuration:abbreviate:", v8, v9, 1, &v46, &v45, &v44, a3, &v43, v36);
  v42 = v46;
  v10 = v45;
  v11 = v44;
  v12 = v43;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianGMTCalendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v13;
  objc_msgSend(v14, "components:fromDate:", 28, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = v10;
  objc_msgSend(v15, "setHour:", objc_msgSend(v10, "integerValue"));
  v40 = v11;
  v16 = objc_msgSend(v11, "integerValue");

  objc_msgSend(v15, "setMinute:", v16);
  objc_msgSend(MEMORY[0x1E0C99D48], "sharedAutoupdatingCurrentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateFromComponents:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "timeStringAlwaysIncludeMinutes:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  objc_msgSend(v9, "objectAtIndex:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (v21 == 7)
    {
      if (a3 < 0.0)
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        v27 = CFSTR("%d week before");
        v23 = v7;
        goto LABEL_17;
      }
    }
    else
    {
      if (!v21)
      {
        v23 = v7;
        v24 = (void *)MEMORY[0x1E0CB3940];
        if (a3 < 0.0)
        {
          v25 = CFSTR("%d day before (%@)");
          goto LABEL_10;
        }
        v32 = CFSTR("On day of event (%@)");
LABEL_26:
        objc_msgSend(v23, "localizedStringForKey:value:table:", v32, &stru_1E2A86598, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (uint64_t)v19;
        goto LABEL_27;
      }
      if (a3 < 0.0)
      {
        v29 = (void *)MEMORY[0x1E0CB3940];
        v30 = CFSTR("%ld %@ before (%@)");
LABEL_23:
        objc_msgSend(v7, "localizedStringForKey:value:table:", v30, &stru_1E2A86598, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v29;
        v23 = v7;
        objc_msgSend(v31, "localizedStringWithFormat:", v26, v21, v22, v19);
        goto LABEL_28;
      }
    }
    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = CFSTR("%ld %@ after (%@)");
    goto LABEL_23;
  }
  if (v21 == 7)
  {
    if (a3 >= 0.0)
    {
LABEL_21:
      v29 = (void *)MEMORY[0x1E0CB3940];
      v30 = CFSTR("Alert %ld %@ after at %@");
      goto LABEL_23;
    }
    v23 = v7;
    v24 = (void *)MEMORY[0x1E0CB3940];
    v27 = CFSTR("Alert %d week before");
LABEL_17:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v27, &stru_1E2A86598, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v23 = v7;
  if (!v21)
  {
    v24 = (void *)MEMORY[0x1E0CB3940];
    if (a3 < 0.0)
    {
      v25 = CFSTR("Alert %d day before at %@");
LABEL_10:
      objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_1E2A86598, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = v19;
LABEL_18:
      v35 = 1;
LABEL_27:
      objc_msgSend(v24, "localizedStringWithFormat:", v26, v35, v37, v38);
      goto LABEL_28;
    }
    v32 = CFSTR("Alert on day of event at %@");
    goto LABEL_26;
  }
  if (a3 >= 0.0)
    goto LABEL_21;
  v28 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Alert %ld %@ before at %@"), &stru_1E2A86598, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringWithFormat:", v26, v21, v22, v19);
LABEL_28:
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (void)_calculateDurations:(id)a3 timeUnits:(id)a4 forDuration:(double)a5 allDay:(BOOL)a6 dayDuration:(id *)a7 hourDuration:(id *)a8 minuteDuration:(id *)a9 secondDuration:(id *)a10 abbreviate:(BOOL)a11
{
  _BOOL4 v14;
  id v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  double v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  unint64_t v38;
  const __CFString *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  id v47;
  const __CFString *v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  id *v57;
  uint64_t v58;
  unint64_t v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  id *v68;
  id v69;

  v14 = a6;
  v68 = a10;
  v69 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CalendarFoundation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -a5;
  if (a5 >= 0.0)
    v20 = a5;
  else
    v20 = -a5;
  if (v20 < 86400.0)
    goto LABEL_24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(a5 / 86400.0));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  *a7 = v21;
  v22 = (double)(86400 * objc_msgSend(v21, "integerValue"));
  v23 = *a7;
  if (a5 < 0.0 && v14)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "integerValue") - 1);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    *a7 = v23;
  }
  a5 = a5 - v22;
  v24 = objc_msgSend(v23, "integerValue", a10);
  if (v24 >= 0)
    v25 = v24;
  else
    v25 = -v24;
  if (v25 < 2)
  {
    if (a11)
    {
      v26 = CFSTR("shortened day");
      v27 = CFSTR("day");
      goto LABEL_16;
    }
    v26 = CFSTR("day");
LABEL_19:
    v28 = v18;
    v27 = v26;
    goto LABEL_20;
  }
  if (!a11)
  {
    v26 = CFSTR("days");
    goto LABEL_19;
  }
  v26 = CFSTR("shortened days");
  v27 = CFSTR("days");
LABEL_16:
  v28 = v18;
LABEL_20:
  objc_msgSend(v28, "localizedStringForKey:value:table:", v26, v27, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB37E8];
  v31 = objc_msgSend(*a7, "integerValue");
  if (v31 >= 0)
    v32 = v31;
  else
    v32 = -v31;
  objc_msgSend(v30, "numberWithInteger:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "addObject:", v33);

  objc_msgSend(v17, "addObject:", v29);
  v19 = -a5;
LABEL_24:
  if (a5 >= 0.0)
    v34 = a5;
  else
    v34 = v19;
  if (v34 >= 3600.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(a5 / 3600.0));
    v35 = (id)objc_claimAutoreleasedReturnValue();
    *a8 = v35;
    a5 = a5 - (double)(3600 * objc_msgSend(v35, "integerValue"));
    v36 = objc_msgSend(*a8, "integerValue");
    v37 = CFSTR("hours");
    if (v36 >= 0)
      v38 = v36;
    else
      v38 = -v36;
    if (a11)
      v37 = CFSTR("hrs");
    v39 = CFSTR("hr");
    if (!a11)
      v39 = CFSTR("hour");
    if (v38 <= 1)
      v40 = v39;
    else
      v40 = v37;
    objc_msgSend(v18, "localizedStringForKey:value:table:", v40, &stru_1E2A86598, 0, v68);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x1E0CB37E8];
    v43 = objc_msgSend(*a8, "integerValue");
    if (v43 >= 0)
      v44 = v43;
    else
      v44 = -v43;
    objc_msgSend(v42, "numberWithInteger:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v45);

    objc_msgSend(v17, "addObject:", v41);
    v19 = -a5;
  }
  if (a5 >= 0.0)
    v46 = a5;
  else
    v46 = v19;
  if (v46 >= 60.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(a5 / 60.0));
    v47 = (id)objc_claimAutoreleasedReturnValue();
    *a9 = v47;
    a5 = a5 - (double)(60 * objc_msgSend(v47, "integerValue"));
    if (a11)
    {
      v48 = CFSTR("min");
    }
    else
    {
      v49 = objc_msgSend(*a9, "integerValue");
      if (v49 >= 0)
        v50 = v49;
      else
        v50 = -v49;
      if (v50 <= 1)
        v48 = CFSTR("minute");
      else
        v48 = CFSTR("minutes");
    }
    objc_msgSend(v18, "localizedStringForKey:value:table:", v48, &stru_1E2A86598, 0, v68);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)MEMORY[0x1E0CB37E8];
    v53 = objc_msgSend(*a9, "integerValue");
    if (v53 >= 0)
      v54 = v53;
    else
      v54 = -v53;
    objc_msgSend(v52, "numberWithInteger:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v55);

    objc_msgSend(v17, "addObject:", v51);
    v19 = -a5;
  }
  if (a5 >= 0.0)
    v19 = a5;
  if (v19 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)a5);
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v57 = v68;
    *v68 = v56;
    v58 = objc_msgSend(v56, "integerValue");
    if (v58 >= 0)
      v59 = v58;
    else
      v59 = -v58;
    if (v59 <= 1)
      v60 = CFSTR("second");
    else
      v60 = CFSTR("seconds");
    objc_msgSend(v18, "localizedStringForKey:value:table:", v60, &stru_1E2A86598, 0, v68);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (void *)MEMORY[0x1E0CB37E8];
    v63 = objc_msgSend(*v57, "integerValue");
    if (v63 >= 0)
      v64 = v63;
    else
      v64 = -v63;
    objc_msgSend(v62, "numberWithInteger:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "addObject:", v65);

    objc_msgSend(v17, "addObject:", v61);
  }
  if (v14 && !*a7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0);
    v66 = (id)objc_claimAutoreleasedReturnValue();
    *a7 = v66;
    objc_msgSend(v69, "insertObject:atIndex:", v66, 0);
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("day"), CFSTR("day"), 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "insertObject:atIndex:", v67, 0);

  }
}

@end
