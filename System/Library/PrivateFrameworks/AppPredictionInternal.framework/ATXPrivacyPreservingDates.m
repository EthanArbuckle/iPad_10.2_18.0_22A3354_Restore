@implementation ATXPrivacyPreservingDates

- (double)convertDate:(id)a3 toDeltaFromSkyUpdateDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v6 = a4;
  -[ATXPrivacyPreservingDates _reduceGranularityToDayOfYear:](self, "_reduceGranularityToDayOfYear:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPrivacyPreservingDates _reduceGranularityToDayOfYear:](self, "_reduceGranularityToDayOfYear:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  return v10;
}

- (id)reduceGranularityToWeekOfYear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 540, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setDay:", -objc_msgSend(v6, "weekday"));
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v7, v4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXPrivacyPreservingDates _reduceGranularityToDayOfYear:](self, "_reduceGranularityToDayOfYear:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __atxlog_handle_metrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "ATXPrivacyPreservingDates: nil date passed into reduceGranularityToWeekOfYear", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_reduceGranularityToDayOfYear:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 28, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
