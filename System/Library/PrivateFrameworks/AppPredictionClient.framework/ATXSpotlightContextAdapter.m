@implementation ATXSpotlightContextAdapter

- (ATXSpotlightContextAdapter)init
{
  void *v3;
  ATXSpotlightContextAdapter *v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXSpotlightContextAdapter initWithNowDate:](self, "initWithNowDate:", v3);

  return v4;
}

- (ATXSpotlightContextAdapter)initWithNowDate:(id)a3
{
  id v5;
  ATXSpotlightContextAdapter *v6;
  ATXSpotlightContextAdapter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSpotlightContextAdapter;
  v6 = -[ATXSpotlightContextAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nowDate, a3);

  return v7;
}

- (id)nsuaSectionIdentifier
{
  return (id)objc_msgSend(CFSTR("com.apple.spotlight.dec.zkw.actions."), "stringByAppendingString:", CFSTR("nsua"));
}

- (id)topAutoShortcutSectionIdentifier
{
  return (id)objc_msgSend(CFSTR("com.apple.spotlight.dec.zkw.actions."), "stringByAppendingString:", CFSTR("fallback.autoshortcut"));
}

- (BOOL)isSportsGameSectionIdentifier:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("sportsgame"));
}

+ (BOOL)isSpotlightRecentSectionIdentifier:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.recents"));
}

- (id)sectionIdentifierForContextCode:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  v3 = CFSTR("com.apple.spotlight.dec.zkw.recents");
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 43:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld.unsupported"), a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 18:
      v4 = CFSTR("nowplaying");
      goto LABEL_3;
    case 19:
      v4 = CFSTR("ongoingcall");
      goto LABEL_3;
    case 20:
      v4 = CFSTR("event.upcoming");
      goto LABEL_3;
    case 21:
      v4 = CFSTR("event.ongoing");
      goto LABEL_3;
    case 22:
      v4 = CFSTR("event.recent");
      goto LABEL_3;
    case 23:
      v4 = CFSTR("nearby");
      goto LABEL_3;
    case 24:
      return v3;
    case 25:
      v4 = CFSTR("clipboard");
      goto LABEL_3;
    case 26:
      v4 = CFSTR("clipboard.package");
      goto LABEL_3;
    case 27:
      v4 = CFSTR("clipboard.url");
      goto LABEL_3;
    case 28:
      v4 = CFSTR("clipboard.phone");
      goto LABEL_3;
    case 29:
      v4 = CFSTR("callonbirthday");
      goto LABEL_3;
    case 30:
      v4 = CFSTR("returncall");
      goto LABEL_3;
    case 31:
      v4 = CFSTR("flight.upcoming");
      goto LABEL_3;
    case 32:
      v4 = CFSTR("flight.ongoing");
      goto LABEL_3;
    case 33:
      v4 = CFSTR("flight.concluded");
      goto LABEL_3;
    case 34:
      v4 = CFSTR("upcomingmedia");
      goto LABEL_3;
    case 35:
      v4 = CFSTR("changeholidayalarm");
      goto LABEL_3;
    case 36:
      v4 = CFSTR("upcomingcommute.work");
      goto LABEL_3;
    case 37:
      v4 = CFSTR("upcomingcommute.home");
      goto LABEL_3;
    case 38:
      v4 = CFSTR("earlyevent");
      goto LABEL_3;
    case 39:
      v4 = CFSTR("debug");
      goto LABEL_3;
    case 40:
      v4 = CFSTR("goodmorning");
      goto LABEL_3;
    case 41:
      v4 = CFSTR("winddown");
      goto LABEL_3;
    case 42:
      v4 = CFSTR("sportsgame");
      goto LABEL_3;
    default:
      v4 = 0;
LABEL_3:
      objc_msgSend(CFSTR("com.apple.spotlight.dec.zkw.actions."), "stringByAppendingString:", v4);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v3;
  }
}

- (id)contextCodeIdentifierWithSectionBundleIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      -[ATXSpotlightContextAdapter sectionIdentifierForContextCode:](self, "sectionIdentifierForContextCode:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isEqualToString:](v6, "isEqualToString:", v4))
        break;

      if (++v5 == 43)
      {
        __atxlog_handle_zkw_hide();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v10 = 138412290;
          v11 = v4;
          _os_log_impl(&dword_1A49EF000, v6, OS_LOG_TYPE_DEFAULT, "ATXSpotlightContextAdapter contextCodeIdentifierWithSectionBundleIdentifier:%@ returns nil", (uint8_t *)&v10, 0xCu);
        }
        v7 = 0;
        goto LABEL_12;
      }
    }
    stringForATXSuggestionPredictionReasonCode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_zkw_hide();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "ATXSpotlightContextAdapter contextCodeIdentifierWithSectionBundleIdentifier:%@ returns  %@", (uint8_t *)&v10, 0x16u);
    }

LABEL_12:
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contextTitleWithSuggestion:(id)a3 eventTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "uiSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  objc_msgSend(v7, "predictionReasons");
  v11 = v7;
  v12 = v5;
  v13 = v6;
  v14 = v8;
  ATXSuggestionPredictionReasonEnumerateReasonCodes();
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;

  switch(a2)
  {
    case 22:
      objc_msgSend(*(id *)(a1 + 32), "contextEndDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        return;
      objc_msgSend(*(id *)(a1 + 32), "contextEndDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      v14 = v13;
      v15 = -v13;

      if (v14 < 0.0)
      {
        v7 = *(void **)(a1 + 40);
        if (v14 >= -3600.0)
        {
          objc_msgSend(v7, "_stringWithInterval:", v15);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = *(void **)(a1 + 64);
          v10 = CFSTR("CONTEXT_RECENT_EVENT_RELATIVE");
          goto LABEL_25;
        }
LABEL_15:
        objc_msgSend(v7, "_absoluteDateContextTitleWithSuggestion:eventTitle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

        return;
      }
      __atxlog_handle_blending();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke_cold_3((id *)(a1 + 32));
      goto LABEL_22;
    case 21:
      objc_msgSend(*(id *)(a1 + 32), "contextStartDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        return;
      objc_msgSend(*(id *)(a1 + 32), "contextStartDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      v19 = v18;
      v20 = -v18;

      if (v19 < 0.0)
      {
        v7 = *(void **)(a1 + 40);
        if (v19 >= -3600.0)
        {
          objc_msgSend(v7, "_stringWithInterval:", v20);
          v32 = (id)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0CB3940];
          v9 = *(void **)(a1 + 64);
          v10 = CFSTR("CONTEXT_ONGOING_EVENT_RELATIVE");
          goto LABEL_25;
        }
        goto LABEL_15;
      }
      __atxlog_handle_blending();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke_cold_2((id *)(a1 + 32));
      goto LABEL_22;
    case 20:
      objc_msgSend(*(id *)(a1 + 32), "contextStartDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        objc_msgSend(*(id *)(a1 + 32), "contextStartDate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
        v6 = v5;

        if (v6 > 0.0)
        {
          v7 = *(void **)(a1 + 40);
          if (v6 <= 3600.0)
          {
            objc_msgSend(v7, "_stringWithInterval:", v6);
            v32 = (id)objc_claimAutoreleasedReturnValue();
            v8 = (void *)MEMORY[0x1E0CB3940];
            v9 = *(void **)(a1 + 64);
            v10 = CFSTR("CONTEXT_UPCOMING_EVENT_RELATIVE");
LABEL_25:
            objc_msgSend(v9, "localizedStringForKey:value:table:", v10, &stru_1E4D5DB30, 0);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "localizedStringWithFormat:", v28, *(_QWORD *)(a1 + 56), v32);
            v29 = objc_claimAutoreleasedReturnValue();
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v31 = *(void **)(v30 + 40);
            *(_QWORD *)(v30 + 40) = v29;

            return;
          }
          goto LABEL_15;
        }
        __atxlog_handle_blending();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke_cold_1((id *)(a1 + 32));
LABEL_22:

        objc_msgSend(*(id *)(a1 + 40), "_absoluteDateContextTitleWithSuggestion:eventTitle:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

      }
      break;
  }
}

- (id)_stringWithInterval:(double)a3
{
  void *v4;
  double v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setUnitsStyle:", 2);
  objc_msgSend(v4, "setAllowedUnits:", 64);
  v5 = 60.0;
  if (a3 > 60.0)
    v5 = a3;
  objc_msgSend(v4, "stringFromTimeInterval:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_absoluteDateContextTitleWithSuggestion:(id)a3 eventTitle:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "uiSpecification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "predictionReasons");
  objc_msgSend(v7, "contextStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v23 = "-[ATXSpotlightContextAdapter _absoluteDateContextTitleWithSuggestion:eventTitle:]";
    v24 = 2048;
    v25 = objc_msgSend(v6, "hash");
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_1A49EF000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s eventTitle.hash:%lu starts at:%@ ends at: %@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v8 & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v9, 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ATXSpotlightContextAdapter _hourIsOneWithDate:](self, "_hourIsOneWithDate:", v9);
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = CFSTR("CONTEXT_UPCOMING_EVENT");
    v18 = CFSTR("CONTEXT_UPCOMING_EVENT_(hour is 1)");
  }
  else if ((v8 & 0x200000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v9, 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ATXSpotlightContextAdapter _hourIsOneWithDate:](self, "_hourIsOneWithDate:", v9);
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = CFSTR("CONTEXT_ONGOING_EVENT");
    v18 = CFSTR("CONTEXT_ONGOING_EVENT_(hour is 1)");
  }
  else
  {
    if ((v8 & 0x400000) == 0)
    {
      v13 = v6;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v10, 0, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[ATXSpotlightContextAdapter _hourIsOneWithDate:](self, "_hourIsOneWithDate:", v10);
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = CFSTR("CONTEXT_RECENT_EVENT");
    v18 = CFSTR("CONTEXT_RECENT_EVENT_(hour is 1)");
  }
  if (v15)
    v19 = v18;
  else
    v19 = v17;
  objc_msgSend(v12, "localizedStringForKey:value:table:", v19, &stru_1E4D5DB30, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringWithFormat:", v20, v6, v14);
  v13 = (id)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v13;
}

- (BOOL)_hourIsOneWithDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  BOOL v9;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  v8 = objc_msgSend(MEMORY[0x1E0C99DC8], "atx_usesTwelveHourClock");
  if (v7 == 13)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowDate, 0);
}

void __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "contextStartDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "ATXSpotlightContextAdapter contextTitleWithSuggestion: interval to start date from now = %fs. Using absolute start date %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

void __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke_cold_2(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "contextStartDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "ATXSpotlightContextAdapter contextTitleWithSuggestion: interval since start date to now = %fs. Using absolute start date %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

void __68__ATXSpotlightContextAdapter_contextTitleWithSuggestion_eventTitle___block_invoke_cold_3(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "contextEndDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v2, v3, "ATXSpotlightContextAdapter contextTitleWithSuggestion: interval since end date to now = %fs. Using absolute end date %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_6();
}

@end
