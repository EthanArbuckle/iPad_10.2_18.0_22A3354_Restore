@implementation NSDate(NSSAdditions)

+ (id)_todayStringDateFormatterForThread
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "threadDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("kCurrentThreadTodayStringFormatterKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(v2, "setTimeStyle:", 0);
    objc_msgSend(v2, "setDateStyle:", 4);
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v2, CFSTR("kCurrentThreadTodayStringFormatterKey"));

  }
  return v2;
}

- (void)nss_gregorianDescriptionWithFlags:()NSSAdditions options:completion:
{
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  float v24;
  float v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  float v43;
  void *v44;
  uint64_t v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void (**v56)(id, id, void *, void *);

  v56 = a5;
  objc_msgSend(a1, "timeIntervalSinceNow");
  v9 = v8;
  v10 = -v8;
  if (v9 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("NSDateCurrentThreadNSDateComponentsFormatterKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setUnitsStyle:", 5);
    objc_msgSend(v14, "setAllowedUnits:", 124);
    objc_msgSend(v14, "setFormattingContext:", 2);
    objc_msgSend(v14, "setMaximumUnitCount:", 1);
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "threadDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("NSDateCurrentThreadNSDateComponentsFormatterKey"));

  }
  if (v9 >= 0.0 || v11 < 60.0)
  {
    NSSBundleInternal();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("now"), &stru_1E9BDD2E8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
LABEL_12:
    v18 = v21;
    v22 = v18;
    v23 = v18;
    goto LABEL_60;
  }
  if (v11 < 3600.0)
  {
    if ((a3 & 1) != 0)
    {
      objc_msgSend(v14, "stringFromTimeInterval:", v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v17 = v11 / 60.0;
    v31 = floorf(v17);
    if ((a3 & 2) == 0)
    {
      v22 = 0;
      if ((a3 & 4) == 0)
        goto LABEL_56;
      goto LABEL_26;
    }
    v33 = (void *)MEMORY[0x1E0CB3940];
    NSSBundleInternal();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("%d minute/minutes ago medium"), &stru_1E9BDD2E8, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringWithFormat:", v35, (int)v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if ((a3 & 4) != 0)
    {
LABEL_26:
      v36 = (void *)MEMORY[0x1E0CB3940];
      NSSBundleInternal();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      v39 = CFSTR("%d minute/minutes ago long");
LABEL_58:
      objc_msgSend(v37, "localizedStringForKey:value:table:", v39, &stru_1E9BDD2E8, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (int)v31;
      goto LABEL_59;
    }
LABEL_56:
    v23 = 0;
    goto LABEL_60;
  }
  if (v11 >= 86400.0)
  {
    if (v11 >= 604800.0)
    {
      if (v11 >= 31449600.0)
      {
        if ((a3 & 1) != 0)
        {
          objc_msgSend(v14, "stringFromTimeInterval:", v11);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v46 = v11 / 31449600.0;
        v31 = floorf(v46);
        if ((a3 & 2) != 0)
        {
          v53 = (void *)MEMORY[0x1E0CB3940];
          NSSBundleInternal();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("%d year/years ago medium"), &stru_1E9BDD2E8, 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "localizedStringWithFormat:", v55, (int)v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }
        if ((a3 & 4) == 0)
          goto LABEL_56;
        v36 = (void *)MEMORY[0x1E0CB3940];
        NSSBundleInternal();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        v39 = CFSTR("%d year/years ago long");
      }
      else
      {
        if ((a3 & 1) != 0)
        {
          objc_msgSend(v14, "stringFromTimeInterval:", v11);
          v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = 0;
        }
        v43 = v11 / 604800.0;
        v31 = floorf(v43);
        if ((a3 & 2) != 0)
        {
          v50 = (void *)MEMORY[0x1E0CB3940];
          NSSBundleInternal();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("%d week/weeks ago medium"), &stru_1E9BDD2E8, 0);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "localizedStringWithFormat:", v52, (int)v31);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v22 = 0;
        }
        if ((a3 & 4) == 0)
          goto LABEL_56;
        v36 = (void *)MEMORY[0x1E0CB3940];
        NSSBundleInternal();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        v39 = CFSTR("%d week/weeks ago long");
      }
      goto LABEL_58;
    }
    if ((a3 & 1) != 0)
    {
      objc_msgSend(v14, "stringFromTimeInterval:", v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v32 = v11 / 86400.0;
    v31 = floorf(v32);
    if ((a3 & 2) != 0)
    {
      v47 = (void *)MEMORY[0x1E0CB3940];
      NSSBundleInternal();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("%d day/days ago medium"), &stru_1E9BDD2E8, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringWithFormat:", v49, (int)v31);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a3 & 4) == 0)
        goto LABEL_56;
    }
    else
    {
      v22 = 0;
      if ((a3 & 4) == 0)
        goto LABEL_56;
    }
    v36 = (void *)MEMORY[0x1E0CB3940];
    NSSBundleInternal();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v39 = CFSTR("%d day/days ago long");
    goto LABEL_58;
  }
  v24 = v11 / 3600.0;
  v25 = floorf(v24);
  if ((a4 & 1) != 0 && v25 > 6.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isDateInToday:", a1);

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "_todayStringDateFormatterForThread");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringFromDate:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = v30;
      goto LABEL_12;
    }
  }
  if ((a3 & 1) != 0)
  {
    objc_msgSend(v14, "stringFromTimeInterval:", v11);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if ((a3 & 2) != 0)
    {
LABEL_29:
      v40 = (void *)MEMORY[0x1E0CB3940];
      NSSBundleInternal();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("%d hour/hours ago medium"), &stru_1E9BDD2E8, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringWithFormat:", v42, (int)v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if ((a3 & 4) == 0)
        goto LABEL_56;
      goto LABEL_36;
    }
  }
  else
  {
    v18 = 0;
    if ((a3 & 2) != 0)
      goto LABEL_29;
  }
  v22 = 0;
  if ((a3 & 4) == 0)
    goto LABEL_56;
LABEL_36:
  v36 = (void *)MEMORY[0x1E0CB3940];
  NSSBundleInternal();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("%d hour/hours ago long"), &stru_1E9BDD2E8, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (int)v25;
LABEL_59:
  objc_msgSend(v36, "localizedStringWithFormat:", v44, v45);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_60:
  if (v56)
    v56[2](v56, v18, v22, v23);

}

@end
