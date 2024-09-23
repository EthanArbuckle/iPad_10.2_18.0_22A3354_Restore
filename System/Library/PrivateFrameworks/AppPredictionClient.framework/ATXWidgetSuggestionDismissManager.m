@implementation ATXWidgetSuggestionDismissManager

- (ATXWidgetSuggestionDismissManager)init
{
  void *v3;
  ATXWidgetSuggestionDismissManager *v4;
  NSObject *v5;

  +[ATXInformationStore sharedInstance](ATXInformationStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[ATXWidgetSuggestionDismissManager initWithStore:](self, "initWithStore:", v3);
    v4 = self;
  }
  else
  {
    __atxlog_handle_home_screen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXWidgetSuggestionDismissManager init].cold.1(v5);

    v4 = 0;
  }

  return v4;
}

- (ATXWidgetSuggestionDismissManager)initWithStore:(id)a3
{
  id v5;
  ATXWidgetSuggestionDismissManager *v6;
  ATXWidgetSuggestionDismissManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXWidgetSuggestionDismissManager;
  v6 = -[ATXWidgetSuggestionDismissManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

- (void)userDidDismissSuggestionForWidget:(id)a3 kind:(id)a4 intent:(id)a5 atDate:(id)a6 duration:(double)a7
{
  -[ATXInformationStore recordUserRemovalOfSuggestedWidget:kind:intent:atDate:duration:](self->_store, "recordUserRemovalOfSuggestedWidget:kind:intent:atDate:duration:", a3, a4, a5, a6, a7);
}

- (BOOL)shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:(id)a3 kind:(id)a4 intent:(id)a5
{
  ATXWidgetSuggestionDismissManager *v5;
  void *v6;

  v5 = self;
  -[ATXInformationStore dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:](self->_store, "dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[ATXWidgetSuggestionDismissManager _shouldBlockSuggestionByRelatedDismissDates:](v5, "_shouldBlockSuggestionByRelatedDismissDates:", v6);

  return (char)v5;
}

- (BOOL)shouldBlockSuggestionWithIntent:(id)a3
{
  ATXWidgetSuggestionDismissManager *v3;
  void *v4;

  v3 = self;
  -[ATXInformationStore dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent:](self->_store, "dateIntervalsOfUserRemovalOfSuggestedWidgetWithIntent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[ATXWidgetSuggestionDismissManager _shouldBlockSuggestionByRelatedDismissDates:](v3, "_shouldBlockSuggestionByRelatedDismissDates:", v4);

  return (char)v3;
}

- (BOOL)_shouldBlockSuggestionByRelatedDismissDates:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((unint64_t)objc_msgSend(v3, "count") <= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "startDateOfDismissHistoryConsidered");
      v22 = v4;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = 0;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v14, "startDate", v22);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "endDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "timeIntervalSinceNow");
            if (v17 >= 0.0)
            {
              objc_msgSend(v15, "laterDate:", v6);
              v18 = (void *)objc_claimAutoreleasedReturnValue();

              if (v18 == v15)
              {
                ++v11;
                ++v10;
              }
              else
              {
                objc_msgSend(v15, "laterDate:", v23);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19 == v15)
                  ++v10;
              }
            }

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v9);
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }

      if (v11)
        v20 = 1;
      else
        v20 = v10 > 2;
      v5 = v20;

      v4 = v22;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)userDismissCountForWidgetSuggestionWithBundleId:(id)a3
{
  void *v3;
  unint64_t v4;

  -[ATXInformationStore dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:](self->_store, "dateIntervalsOfUserRemovalOfSuggestedWidgetWithExtensionBundleId:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

+ (id)startDateOfDismissHistoryConsidered
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -5184000.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXWidgetSuggestionDismissManager: couldn't initialize with nil store.", v1, 2u);
}

@end
