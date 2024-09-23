@implementation NSDateFormatter(MKReviewDateFormatting)

- (__CFString)_mapkit_roundedPastUnitsStringFromDate:()MKReviewDateFormatting
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  __CFString *v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "earlierDate:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 28, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components:fromDate:", 28, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "year");
    v10 = v9 - objc_msgSend(v7, "year");
    v11 = objc_msgSend(v8, "month");
    v12 = objc_msgSend(v7, "month");
    v13 = objc_msgSend(v8, "day");
    v14 = objc_msgSend(v7, "day");
    if ((int)v10 >= 1)
    {
      if ((_DWORD)v10 != 1)
      {
        _MKLocalizedStringFromThisBundle(CFSTR("N_YEARS_AGO_FORMAT_KEY"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v18, v10);
LABEL_18:
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      v15 = CFSTR("LAST_YEAR_KEY");
LABEL_15:
      _MKLocalizedStringFromThisBundle(v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    v17 = (v11 - v12);
    if ((int)v17 < 1)
    {
      v17 = (v13 - v14);
      if (!(_DWORD)v17)
      {
        v15 = CFSTR("TODAY_KEY");
        goto LABEL_15;
      }
      if ((_DWORD)v17 == 1)
      {
        v15 = CFSTR("YESTERDAY_KEY");
        goto LABEL_15;
      }
      v19 = CFSTR("N_DAYS_AGO_FORMAT_KEY");
    }
    else
    {
      if ((_DWORD)v17 == 1)
      {
        v15 = CFSTR("LAST_MONTH_KEY");
        goto LABEL_15;
      }
      v19 = CFSTR("N_MONTHS_AGO_FORMAT_KEY");
    }
    _MKLocalizedStringFromThisBundle(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v18, v17);
    goto LABEL_18;
  }
  v16 = &stru_1E20DFC00;
LABEL_20:

  return v16;
}

@end
