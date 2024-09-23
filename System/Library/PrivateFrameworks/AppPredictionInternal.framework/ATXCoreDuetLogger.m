@implementation ATXCoreDuetLogger

- (ATXCoreDuetLogger)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXCoreDuetLogger *v8;

  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = -[ATXCoreDuetLogger initWithDataStore:intentStream:activityStream:currentDate:tracker:](self, "initWithDataStore:intentStream:activityStream:currentDate:tracker:", v3, v4, v5, v6, v7);

  return v8;
}

- (ATXCoreDuetLogger)initWithDataStore:(id)a3 intentStream:(id)a4 activityStream:(id)a5 currentDate:(id)a6 tracker:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXCoreDuetLogger *v17;
  ATXCoreDuetLogger *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXCoreDuetLogger;
  v17 = -[ATXCoreDuetLogger init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dataStore, a3);
    objc_storeStrong((id *)&v18->_intentStream, a4);
    objc_storeStrong((id *)&v18->_activityStream, a5);
    objc_storeStrong((id *)&v18->_currentDate, a6);
    objc_storeStrong((id *)&v18->_tracker, a7);
  }

  return v18;
}

- (void)logCoreDuetActionLogDonationMetrics
{
  void *v3;
  NSDate *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _ATXDataStore *dataStore;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  v4 = self->_currentDate;
  -[NSDate dateByAddingTimeInterval:](v4, "dateByAddingTimeInterval:", -86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = -[ATXIntentStream numberOfIntentEventsBetweenStartDate:endDate:](self->_intentStream, "numberOfIntentEventsBetweenStartDate:endDate:", v5, v4);
  v7 = -[ATXUserActivityStream numberOfActivityEventsBetweenStartDate:endDate:](self->_activityStream, "numberOfActivityEventsBetweenStartDate:endDate:", v5, v4);
  dataStore = self->_dataStore;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__ATXCoreDuetLogger_logCoreDuetActionLogDonationMetrics__block_invoke;
  v14[3] = &unk_1E82DDCE0;
  v14[4] = self;
  v14[5] = &v15;
  v14[6] = &v19;
  -[_ATXDataStore enumerateActionTypesOlderThan:block:](dataStore, "enumerateActionTypesOlderThan:block:", v5, v14);
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20[3];
    v13 = v16[3];
    *(_DWORD *)buf = 138413314;
    v24 = v11;
    v25 = 2048;
    v26 = v6;
    v27 = 2048;
    v28 = v7;
    v29 = 2048;
    v30 = v12;
    v31 = 2048;
    v32 = v13;
    _os_log_debug_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEBUG, "%@ - has duetIntentCount: %lu duetActivityCount: %lu alogIntentCount: %lu alogActivityCount: %lu", buf, 0x34u);

  }
  -[ATXCoreDuetLogger logDonationCountWithAlogEventCount:forIntents:](self, "logDonationCountWithAlogEventCount:forIntents:", v20[3], 1);
  -[ATXCoreDuetLogger logDonationCountWithAlogEventCount:forIntents:](self, "logDonationCountWithAlogEventCount:forIntents:", v16[3], 0);
  -[ATXCoreDuetLogger logDonationRatioWithDuetEventCount:alogEventCount:forIntents:](self, "logDonationRatioWithDuetEventCount:alogEventCount:forIntents:", v6, v20[3], 1);
  -[ATXCoreDuetLogger logDonationRatioWithDuetEventCount:alogEventCount:forIntents:](self, "logDonationRatioWithDuetEventCount:alogEventCount:forIntents:", v7, v16[3], 0);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

}

uint64_t __56__ATXCoreDuetLogger_logCoreDuetActionLogDonationMetrics__block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (objc_msgSend(*(id *)(a1 + 32), "actionTypeIsActivity:"))
    v2 = *(_QWORD *)(a1 + 40);
  else
    v2 = *(_QWORD *)(a1 + 48);
  ++*(_QWORD *)(*(_QWORD *)(v2 + 8) + 24);
  return 1;
}

- (void)logDonationRatioWithDuetEventCount:(unint64_t)a3 alogEventCount:(unint64_t)a4 forIntents:(BOOL)a5
{
  _BOOL8 v5;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
    v7 = (double)a4 / (double)a3;
  else
    v7 = 0.0;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setActionType:", v5);
  -[ATXCoreDuetLogger abGroup](self, "abGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAbGroup:", v9);

  -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v8, v7);
  __atxlog_handle_metrics();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "actionType");
    if ((_DWORD)v13)
    {
      if ((_DWORD)v13 == 1)
      {
        v14 = CFSTR("Intent");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = CFSTR("NSUA");
    }
    objc_msgSend(v8, "abGroup");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v17 = v12;
    v18 = 2112;
    v19 = v14;
    v20 = 2048;
    v21 = v7;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBDonationRatioTracker with type: %@ ratio: %f abGroup: %@", buf, 0x2Au);

  }
}

- (void)logDonationCountWithAlogEventCount:(unint64_t)a3 forIntents:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setActionType:", v4);
  -[ATXCoreDuetLogger abGroup](self, "abGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAbGroup:", v8);

  -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v7, (double)a3);
  __atxlog_handle_metrics();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "actionType");
    if ((_DWORD)v12)
    {
      if ((_DWORD)v12 == 1)
      {
        v13 = CFSTR("Intent");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = CFSTR("NSUA");
    }
    objc_msgSend(v7, "abGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v11;
    v17 = 2112;
    v18 = v13;
    v19 = 2048;
    v20 = a3;
    v21 = 2112;
    v22 = v14;
    _os_log_debug_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMDonationCountTracker with type: %@ count: %lu abGroup: %@", buf, 0x2Au);

  }
}

- (id)abGroup
{
  NSString *abGroup;
  void *v4;
  NSString *v5;
  NSString *v6;

  abGroup = self->_abGroup;
  if (!abGroup)
  {
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "abGroupIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_abGroup;
    self->_abGroup = v5;

    abGroup = self->_abGroup;
  }
  return abGroup;
}

- (void)setabGroup:(id)a3
{
  objc_storeStrong((id *)&self->_abGroup, a3);
}

- (BOOL)actionTypeIsActivity:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("NSUA_"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abGroup, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);
  objc_storeStrong((id *)&self->_activityStream, 0);
  objc_storeStrong((id *)&self->_intentStream, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end
