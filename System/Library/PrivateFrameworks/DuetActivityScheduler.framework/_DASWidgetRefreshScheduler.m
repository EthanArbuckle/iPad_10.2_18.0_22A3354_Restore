@implementation _DASWidgetRefreshScheduler

+ (id)sharedScheduler
{
  if (sharedScheduler_onceToken != -1)
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global);
  return (id)sharedScheduler_widgetScheduler;
}

- (_DASWidgetRefreshScheduler)init
{
  _DASWidgetRefreshScheduler *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  os_log_t v7;
  OS_os_log *log;
  uint64_t v9;
  _DASScheduler *dasScheduler;
  uint64_t v11;
  _DKKnowledgeSaving *store;
  uint64_t v13;
  _CDLocalContext *context;
  uint64_t v15;
  _CDContextualKeyPath *widgetOverrideKeypath;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_DASWidgetRefreshScheduler;
  v2 = -[_DASWidgetRefreshScheduler init](&v18, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.das.widgetRefreshScheduler", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = os_log_create("com.apple.duetactivityscheduler", "widgetRefreshScheduler");
    log = v2->_log;
    v2->_log = (OS_os_log *)v7;

    +[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler");
    v9 = objc_claimAutoreleasedReturnValue();
    dasScheduler = v2->_dasScheduler;
    v2->_dasScheduler = (_DASScheduler *)v9;

    objc_msgSend(MEMORY[0x1E0D15A58], "knowledgeStoreWithDirectReadWriteAccess");
    v11 = objc_claimAutoreleasedReturnValue();
    store = v2->_store;
    v2->_store = (_DKKnowledgeSaving *)v11;

    objc_msgSend(MEMORY[0x1E0D15C48], "userContext");
    v13 = objc_claimAutoreleasedReturnValue();
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v13;

    objc_msgSend(MEMORY[0x1E0D15C78], "keyPathWithKey:", CFSTR("/dasd/widgetOverride"));
    v15 = objc_claimAutoreleasedReturnValue();
    widgetOverrideKeypath = v2->_widgetOverrideKeypath;
    v2->_widgetOverrideKeypath = (_CDContextualKeyPath *)v15;

  }
  return v2;
}

- (void)recordWidgetViews:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  const __CFString *v24;
  void *v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  OS_dispatch_queue *queue;
  id obj;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[10];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  _QWORD v48[4];
  uint8_t v49[4];
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v3;
  v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v41)
  {
    v40 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v44 != v40)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v5, "budgetID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          -[_DASWidgetRefreshScheduler log](self, "log");
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            -[_DASWidgetRefreshScheduler recordWidgetViews:].cold.1(v49, v5, &v50, v7);

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "viewID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("viewID"));

          objc_msgSend(v5, "extensionBundleID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("extensionBundle"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "pageID"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("pageID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "inStack"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("inStack"));

          v13 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "timeUntilContentExpiration");
          LODWORD(v15) = llround(v14);
          objc_msgSend(v13, "numberWithInt:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("expirationDelta"));

          v17 = (void *)MEMORY[0x1E0D15A00];
          objc_msgSend(MEMORY[0x1E0D15A10], "eventStreamWithName:", CFSTR("/dasd/widgetView"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "startDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "endDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "budgetID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v18, v19, v20, v21, v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v39, "addObject:", v22);
          objc_msgSend(v5, "timeUntilContentExpiration");
          v24 = CFSTR("viewed_fresh");
          if ((llround(v23) & 0x80000000) != 0)
            v24 = CFSTR("viewed_stale");
          v48[0] = v24;
          v47[0] = CFSTR("metricKey");
          v47[1] = CFSTR("metricValue");
          v25 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v5, "timeUntilContentExpiration");
          LODWORD(v27) = llround(v26);
          objc_msgSend(v25, "numberWithInt:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v48[1] = v28;
          v47[2] = CFSTR("widgetID");
          v29 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "budgetID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "stringWithFormat:", CFSTR("%lul"), objc_msgSend(v30, "hash"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v48[2] = v31;
          v47[3] = CFSTR("page");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "pageID"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v48[3] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v42[5] = MEMORY[0x1E0C809B0];
          v42[6] = 3221225472;
          v42[7] = __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke;
          v42[8] = &unk_1E624B770;
          v42[9] = v33;
          v34 = v33;
          AnalyticsSendEventLazy();

        }
      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v41);
  }

  -[_DASWidgetRefreshScheduler store](self, "store");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2;
  v42[3] = &unk_1E624B798;
  v42[4] = self;
  objc_msgSend(v35, "saveObjects:responseQueue:withCompletion:", v39, queue, v42);

}

- (void)recordWidgetRefreshes:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  OS_dispatch_queue *queue;
  id obj;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[10];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v3;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v5, "budgetID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "extensionBundleID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("extensionBundle"));

          objc_msgSend(v5, "refreshReason");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("refreshReason"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isDASInitiated"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("isDASInitiated"));

          v11 = (void *)MEMORY[0x1E0D15A00];
          objc_msgSend(MEMORY[0x1E0D15A10], "eventStreamWithName:", CFSTR("/dasd/widgetRefresh"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "refreshDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "refreshDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "budgetID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v12, v13, v14, v15, v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v34, "addObject:", v16);
          v17 = CFSTR("refreshed_notDAS");
          if (objc_msgSend(v5, "isDASInitiated"))
          {
            -[_DASWidgetRefreshScheduler context](self, "context");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", self->_widgetOverrideKeypath);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "budgetID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = CFSTR("refreshed_DAS_override");
            if ((objc_msgSend(v19, "containsObject:", v20) & 1) == 0)
            {
              -[_DASWidgetRefreshScheduler context](self, "context");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForPluginStatus");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "BOOLValue");

              if (v24)
                v17 = CFSTR("refreshed_DAS_pluggedIn");
              else
                v17 = CFSTR("refreshed_DAS");
            }

          }
          v42[0] = CFSTR("metricKey");
          v42[1] = CFSTR("metricValue");
          v43[0] = v17;
          v43[1] = &unk_1E6259628;
          v42[2] = CFSTR("widgetID");
          v25 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "budgetID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v26, "hash"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v42[3] = CFSTR("page");
          v43[2] = v27;
          v43[3] = &unk_1E6259640;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v37[5] = MEMORY[0x1E0C809B0];
          v37[6] = 3221225472;
          v37[7] = __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke;
          v37[8] = &unk_1E624B770;
          v37[9] = v28;
          v29 = v28;
          AnalyticsSendEventLazy();

        }
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v36);
  }

  -[_DASWidgetRefreshScheduler store](self, "store");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2;
  v37[3] = &unk_1E624B798;
  v37[4] = self;
  objc_msgSend(v30, "saveObjects:responseQueue:withCompletion:", v34, queue, v37);

}

- (void)setBudget:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  _DASWidgetRefreshScheduler *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40___DASWidgetRefreshScheduler_setBudget___block_invoke;
  v7[3] = &unk_1E624B688;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)setOverridesForWidgetBudgetIDs:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___DASWidgetRefreshScheduler_setOverridesForWidgetBudgetIDs___block_invoke;
  v7[3] = &unk_1E624B688;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)decrementBudgetForWidgetID:(id)a3 by:(double)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  _DASWigetBudgetDecrementRequestResult *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  _DASWidgetRefreshScheduler *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  double v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_DASScheduler allBudgets](self->_dasScheduler, "allBudgets");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v8)
  {
    v9 = v8;
    v25 = self;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("balance"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;

        if (objc_msgSend(v13, "containsString:", v6))
        {
          v17 = objc_alloc_init(_DASWigetBudgetDecrementRequestResult);
          -[_DASWigetBudgetDecrementRequestResult setWidgetBudgetID:](v17, "setWidgetBudgetID:", v6);
          if (v16 <= 0.0)
          {
            v21 = (void *)MEMORY[0x1E0CB37E8];
            v22 = v16;
          }
          else
          {
            -[_DASScheduler decrementBy:forBudgetWithName:](v25->_dasScheduler, "decrementBy:forBudgetWithName:", v13, a4);
            -[_DASWidgetRefreshScheduler log](v25, "log");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("capacity"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("balance"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v31 = v13;
              v32 = 2112;
              v33 = v19;
              v34 = 2112;
              v35 = v20;
              v36 = 2048;
              v37 = a4;
              _os_log_impl(&dword_1B0DF4000, v18, OS_LOG_TYPE_DEFAULT, "Decremented budget %@ with capacity %@ and balance %@ by %f", buf, 0x2Au);

            }
            v21 = (void *)MEMORY[0x1E0CB37E8];
            v22 = v16 - a4;
          }
          objc_msgSend(v21, "numberWithDouble:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[_DASWigetBudgetDecrementRequestResult setBalance:](v17, "setBalance:", v23);

          -[_DASWigetBudgetDecrementRequestResult setSuccessful:](v17, "setSuccessful:", v16 > 0.0);
          goto LABEL_16;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
      if (v9)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_16:

  return v17;
}

- (void)setSystemAddedWidgetBudgetIDs:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___DASWidgetRefreshScheduler_setSystemAddedWidgetBudgetIDs___block_invoke;
  v7[3] = &unk_1E624B688;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)createRefreshActivityForWidgetBudgetID:(id)a3 containingAppID:(id)a4 refreshAfter:(id)a5 refreshBefore:(id)a6 widgetInfo:(id)a7 refreshHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  objc_msgSend(v16, "dateByAddingTimeInterval:", 900.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "laterDate:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.widget.%@"), v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v20, _DASSchedulingPriorityUtility, _DASActivityDurationShort, v16, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "setWidgetBudgetID:", v13);
  v31[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRelatedApplications:", v22);

  v23 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke;
  v28[3] = &unk_1E624B7C0;
  v29 = v13;
  v30 = v14;
  v28[4] = self;
  v24 = v13;
  v25 = v14;
  objc_msgSend(v21, "setStartHandler:", v28);
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_258;
  v27[3] = &unk_1E624B7E8;
  v27[4] = self;
  objc_msgSend(v21, "setSuspendHandler:", v27);

  return v21;
}

- (id)createRefreshActivityWithRateLimitConfigurationName:(id)a3 forWidgetBudgetID:(id)a4 withRemoteDeviceID:(id)a5 containingAppID:(id)a6 refreshAfter:(id)a7 refreshBefore:(id)a8 widgetInfo:(id)a9 refreshHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  if (v16 || v17 || v18)
  {
    v42 = v19;
    objc_msgSend(v20, "dateByAddingTimeInterval:", 900.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v21;
    objc_msgSend(v21, "laterDate:", v32);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple."));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v18)
      v35 = CFSTR("remotewidget");
    else
      v35 = CFSTR("widget");
    objc_msgSend(v33, "appendString:", v35);
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "appendString:", v36);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v37, _DASSchedulingPriorityUtility, _DASActivityDurationShort, v20, v23);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v31, "setRateLimitConfigurationName:", v16);
    if (v17)
      objc_msgSend(v31, "setWidgetBudgetID:", v17);
    if (v18)
    {
      objc_msgSend(v31, "setRemoteDevice:", v18);
      objc_msgSend(v31, "setTargetDevice:", 3);
    }
    v48[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setRelatedApplications:", v38);

    v39 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke;
    v44[3] = &unk_1E624B810;
    v44[4] = self;
    v45 = v17;
    v46 = v16;
    v47 = v22;
    objc_msgSend(v31, "setStartHandler:", v44);
    v43[0] = v39;
    v19 = v42;
    v43[1] = 3221225472;
    v43[2] = __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_270;
    v43[3] = &unk_1E624B7E8;
    v43[4] = self;
    objc_msgSend(v31, "setSuspendHandler:", v43);

    v21 = v41;
  }
  else
  {
    -[_DASWidgetRefreshScheduler log](self, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[_DASWidgetRefreshScheduler createRefreshActivityWithRateLimitConfigurationName:forWidgetBudgetID:withRemoteDeviceID:containingAppID:refreshAfter:refreshBefore:widgetInfo:refreshHandler:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    v31 = 0;
  }

  return v31;
}

- (id)createRefreshActivityWithWidgetParameters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
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
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "widgetBudgetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 || (objc_msgSend(v4, "remoteDeviceIdentifier"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    objc_msgSend(v4, "refreshBeforeDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshAfterDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", 900.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "laterDate:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("com.apple."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteDeviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      v12 = CFSTR("remotewidget");
    else
      v12 = CFSTR("widget");
    objc_msgSend(v10, "appendString:", v12);
    objc_msgSend(v4, "ratelimitConfigurationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v10, "appendString:", CFSTR(".ratelimited"));
    objc_msgSend(v4, "widgetIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetBudgetIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "widgetBudgetIdentifier");
      v16 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v16;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(".%@"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v17);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _DASSchedulingPriorityUtility;
    v20 = _DASActivityDurationShort;
    objc_msgSend(v4, "refreshAfterDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DASActivity activityWithName:priority:duration:startingAfter:startingBefore:](_DASActivity, "activityWithName:priority:duration:startingAfter:startingBefore:", v18, v19, v20, v21, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setWidgetID:", v14);
    objc_msgSend(v4, "ratelimitConfigurationName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v4, "ratelimitConfigurationName");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRateLimitConfigurationName:", v24);

    }
    objc_msgSend(v4, "widgetBudgetIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v4, "widgetBudgetIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setWidgetBudgetID:", v26);

    }
    objc_msgSend(v4, "remoteDeviceIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v4, "remoteDeviceIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setRemoteDevice:", v28);
      objc_msgSend(v22, "setTargetDevice:", 3);

    }
    objc_msgSend(v4, "appIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRelatedApplications:", v30);

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __72___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters___block_invoke;
    v40[3] = &unk_1E624B7E8;
    v40[4] = self;
    objc_msgSend(v22, "setSuspendHandler:", v40);

    goto LABEL_18;
  }
  objc_msgSend(v4, "ratelimitConfigurationName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
    goto LABEL_4;
  -[_DASWidgetRefreshScheduler log](self, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[_DASWidgetRefreshScheduler createRefreshActivityWithRateLimitConfigurationName:forWidgetBudgetID:withRemoteDeviceID:containingAppID:refreshAfter:refreshBefore:widgetInfo:refreshHandler:].cold.1(v9, v33, v34, v35, v36, v37, v38, v39);
  v22 = 0;
LABEL_18:

  return v22;
}

- (id)createRefreshActivityWithWidgetParameters:(id)a3 refreshHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[_DASWidgetRefreshScheduler createRefreshActivityWithWidgetParameters:](self, "createRefreshActivityWithWidgetParameters:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __87___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_refreshHandler___block_invoke;
  v12[3] = &unk_1E624B7C0;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "setStartHandler:", v12);

  return v8;
}

- (id)createRefreshActivityWithWidgetParameters:(id)a3 withRefreshHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  -[_DASWidgetRefreshScheduler createRefreshActivityWithWidgetParameters:](self, "createRefreshActivityWithWidgetParameters:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __91___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_withRefreshHandler___block_invoke;
  v10[3] = &unk_1E624B838;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v7, "setStartHandler:", v10);

  return v7;
}

- (void)submitRefreshActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_DASWidgetRefreshScheduler dasScheduler](self, "dasScheduler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitActivity:", v4);

}

- (void)cancelActivity:(id)a3
{
  -[_DASScheduler activityCanceled:](self->_dasScheduler, "activityCanceled:", a3);
}

- (void)createRateLimitConfigurationWithName:(id)a3 rateLimits:(id)a4
{
  void *v5;
  id v6;

  +[_DASActivityRateLimitConfiguration rateLimitConfigurationWithName:andLimits:](_DASActivityRateLimitConfiguration, "rateLimitConfigurationWithName:andLimits:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_DASWidgetRefreshScheduler dasScheduler](self, "dasScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "submitRateLimitConfiguration:", v6);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (_DASScheduler)dasScheduler
{
  return self->_dasScheduler;
}

- (void)setDasScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_dasScheduler, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_DKKnowledgeSaving)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (_CDContextualKeyPath)widgetOverrideKeypath
{
  return self->_widgetOverrideKeypath;
}

- (void)setWidgetOverrideKeypath:(id)a3
{
  objc_storeStrong((id *)&self->_widgetOverrideKeypath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetOverrideKeypath, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_dasScheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)recordWidgetViews:(_QWORD *)a3 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "budgetID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1B0DF4000, a4, OS_LOG_TYPE_DEBUG, "Recording widget view: %@", a1, 0xCu);

}

- (void)createRefreshActivityWithRateLimitConfigurationName:(NSObject *)a1 forWidgetBudgetID:(uint64_t)a2 withRemoteDeviceID:(uint64_t)a3 containingAppID:(uint64_t)a4 refreshAfter:(uint64_t)a5 refreshBefore:(uint64_t)a6 widgetInfo:(uint64_t)a7 refreshHandler:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1B0DF4000, a1, a3, "No widget budget id, no remote device id, no rate config name", a5, a6, a7, a8, 0);
}

@end
