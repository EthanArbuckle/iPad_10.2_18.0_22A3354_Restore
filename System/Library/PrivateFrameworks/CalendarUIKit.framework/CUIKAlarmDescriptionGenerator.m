@implementation CUIKAlarmDescriptionGenerator

+ (id)descriptionForAbsoluteDate:(id)a3 longVersion:(BOOL)a4
{
  if (a4)
    CUIKLongStringForDateAndTime(a3);
  else
    CUIKStringForDateAndTime(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)descriptionForRelativeOffset:(double)a3 isAllDay:(BOOL)a4 isRelativeToTravelStart:(BOOL)a5 isDefault:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  const void *v9;
  uint64_t GregorianDate;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  v6 = a6;
  v7 = a5;
  if (a4)
  {
    v9 = (const void *)CalTimeZoneCopyCFTimeZone();
    GregorianDate = CalDateTimeGetGregorianDate();
    v11 = (void *)MEMORY[0x1E0C99D68];
    MEMORY[0x1BCCB7070](GregorianDate);
    objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
    v13 = a3 > 0.0;
    if (a3 >= 86400.0)
      v13 = 0;
    if (a3 == 0.0 || v13)
    {
      CUIKBundle();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("On day of event (%@)"), &stru_1E6EBAE30, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = (void *)MEMORY[0x1E0CB3940];
      CUIKStringForGMTTime(v12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringWithFormat:", v15, v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (a3 == -572400.0)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("%@ before"), &stru_1E6EBAE30, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("interval_weeks"), &stru_1E6EBAE30, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v19, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringWithFormat:", v16, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      CUIKBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (a3 >= 0.0 || a3 < -21600.0)
      {
        if (a3 >= 0.0)
        {
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("%@ after"), &stru_1E6EBAE30, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = floor(a3 / 86400.0);
        }
        else
        {
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("%@ before"), &stru_1E6EBAE30, 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = ceil(fabs(a3) / 86400.0);
        }
        v36 = (uint64_t)v35;
        v37 = (void *)MEMORY[0x1E0CB3940];
        CUIKBundle();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("interval_days_long"), &stru_1E6EBAE30, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringWithFormat:", v39, v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v15, CFSTR("%@"), 0, v16);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x1E0CB3940];
        CUIKBundle();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("All-day alarm format"), CFSTR("%@ (%@)"), 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKStringForGMTTime(v12, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "localizedStringWithFormat:", v41, v33, v42);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("At time of event"), &stru_1E6EBAE30, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        CUIKDurationStringForTimeInterval(1, v31, 0, v7, 1, a3);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        CUIKStringForGMTTime(v12, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0CB3940];
        CUIKBundle();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("All-day alarm format"), CFSTR("%@ (%@)"), 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "localizedStringWithFormat:", v34, v15, v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
  }
  else if (a3 == -604800.0)
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("%@ before"), &stru_1E6EBAE30, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("interval_weeks"), &stru_1E6EBAE30, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringWithFormat:", v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v15, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CUIKBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("At time of event"), &stru_1E6EBAE30, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKDurationStringForTimeInterval(1, v15, 0, v7, 1, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v6)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    CUIKBundle();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Default (%@)"), &stru_1E6EBAE30, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v45, CFSTR("%@"), 0, v21);
    v46 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v46;
  }
  return v21;
}

@end
