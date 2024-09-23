@implementation ATXTVWidgetLogHarvester

- (ATXTVWidgetLogHarvester)init
{
  ATXTVWidgetLogHarvester *v2;
  uint64_t v3;
  NSMutableDictionary *tvWidgetMetrics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXTVWidgetLogHarvester;
  v2 = -[ATXTVWidgetLogHarvester init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    tvWidgetMetrics = v2->_tvWidgetMetrics;
    v2->_tvWidgetMetrics = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)generateTVWidgetMetrics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  if (!objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
    return;
  v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v23 = (id)objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CF9588]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXTVWidgetLogHarvester shouldSuggestTVWidgetWithDefaults:](self, "shouldSuggestTVWidgetWithDefaults:", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v7 = CFSTR("eligibilityUnknown");
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v7 = CFSTR("ineligible");
LABEL_7:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tvWidgetMetrics, "setObject:forKeyedSubscript:", v7, CFSTR("suggestionStatus"));
  }
  if (objc_msgSend(v6, "BOOLValue"))
    v8 = v4 == 0;
  else
    v8 = 1;
  if (!v8)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tvWidgetMetrics, "setObject:forKeyedSubscript:", CFSTR("eligibleButNotSuggested"), CFSTR("suggestionStatus"));
    v9 = objc_msgSend(v23, "integerForKey:", *MEMORY[0x1E0CF9438]);
    if (v9 <= 0)
    {
      v12 = (void *)objc_opt_new();
    }
    else
    {
      v10 = v9;
      objc_msgSend((id)objc_opt_class(), "_stringForWidgetSuggestionEventType:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tvWidgetMetrics, "setObject:forKeyedSubscript:", v11, CFSTR("suggestionStatus"));

      v12 = (void *)objc_opt_new();
      if (v10 == 1)
      {
        v13 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CF9428]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v14, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "convertDate:toDeltaFromSkyUpdateDate:", v15, v4);
        objc_msgSend(v16, "numberWithDouble:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tvWidgetMetrics, "setObject:forKeyedSubscript:", v17, CFSTR("acceptedDate"));

      }
    }
    objc_msgSend(v23, "objectForKey:", *MEMORY[0x1E0CF9430]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v18, "integerValue"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v12, "convertDate:toDeltaFromSkyUpdateDate:", v20, v4);
      objc_msgSend(v21, "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tvWidgetMetrics, "setObject:forKeyedSubscript:", v22, CFSTR("removedDate"));

    }
  }

}

- (id)shouldSuggestTVWidgetWithDefaults:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CF93F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CF9400]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CF9408]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v5 == 0)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CF93F8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v10;
    else
      v18 = 0;

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = (void *)MEMORY[0x1E0CF8D90];
    objc_msgSend(v4, "doubleValue");
    v14 = v13;
    objc_msgSend(v5, "doubleValue");
    v16 = v15;
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v11, "numberWithBool:", objc_msgSend(v12, "shouldSuggestTVWithAppLaunchCount:intentDonationCount:upcomingMediaCount:", v14, v16, v17));
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (void)sendToCoreAnalytics
{
  AnalyticsSendEvent();
}

- (id)dryRunResult
{
  return self->_tvWidgetMetrics;
}

+ (id)_stringForWidgetSuggestionEventType:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return &stru_1E82FDC98;
  else
    return off_1E82E7CF8[a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvWidgetMetrics, 0);
}

@end
