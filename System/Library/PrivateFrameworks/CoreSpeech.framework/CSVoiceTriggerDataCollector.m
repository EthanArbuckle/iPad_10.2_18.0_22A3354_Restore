@implementation CSVoiceTriggerDataCollector

- (CSVoiceTriggerDataCollector)init
{
  CSVoiceTriggerDataCollector *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableArray *vteiList;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDate *lastVTEnableDate;
  NSDate *lastVTDisableDate;
  void *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CSVoiceTriggerDataCollector;
  v2 = -[CSVoiceTriggerDataCollector init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVoiceTriggerDataCollector", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
    vteiList = v2->_vteiList;
    v2->_vteiList = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0D191F0], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerObserver:", v2);

    objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", v2);

    objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEnabled") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = objc_claimAutoreleasedReturnValue();
      lastVTEnableDate = v2->_lastVTEnableDate;
      v2->_lastVTEnableDate = (NSDate *)v10;
    }
    else
    {
      lastVTEnableDate = v2->_lastVTEnableDate;
      v2->_lastVTEnableDate = 0;
    }

    lastVTDisableDate = v2->_lastVTDisableDate;
    v2->_lastVTDisableDate = 0;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *MEMORY[0x1E0D195D8], *MEMORY[0x1E0D195C0], *MEMORY[0x1E0D19708], *MEMORY[0x1E0D19778], *MEMORY[0x1E0D19698], 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_privacyApprovedFields, v13);
    v14 = *MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[CSVoiceTriggerDataCollector init]";
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_DEFAULT, "%s Created CSVoiceTriggerDataCollector", buf, 0xCu);
    }

  }
  return v2;
}

- (id)fetchVoiceTriggerHeartBeatMetrics
{
  NSObject *queue;
  id v3;
  _QWORD block[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10101;
  v10 = __Block_byref_object_dispose__10102;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSVoiceTriggerDataCollector_fetchVoiceTriggerHeartBeatMetrics__block_invoke;
  block[3] = &unk_1E7C287B8;
  block[4] = &v6;
  dispatch_sync(queue, block);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)addVTRejectEntry:(id)a3 truncateData:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  CSVoiceTriggerDataCollector *v11;
  BOOL v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSVoiceTriggerDataCollector_addVTRejectEntry_truncateData___block_invoke;
  block[3] = &unk_1E7C28888;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)addVTAcceptEntryAndSubmit:(id)a3
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
  v7[2] = __57__CSVoiceTriggerDataCollector_addVTAcceptEntryAndSubmit___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_filteredVTEIArray
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  os_log_t v16;
  NSObject *v17;
  const char *v18;
  os_log_t v19;
  void *v20;
  __int128 v22;
  void *v23;
  NSMutableArray *obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_vteiList;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (!v4)
    goto LABEL_14;
  v6 = v4;
  v7 = *(_QWORD *)v26;
  v8 = (os_log_t *)MEMORY[0x1E0D18F58];
  *(_QWORD *)&v5 = 136315650;
  v22 = v5;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v26 != v7)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("dcTriggerEndMachTime"), v22);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToTimeInterval:", v3 - v12);
      v14 = v13;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", CFSTR("dcTriggerEndMachTime"));
      if (v14 <= 30.0)
      {
        objc_msgSend(v23, "addObject:", v15);
        v19 = *v8;
        if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        *(_DWORD *)buf = v22;
        v30 = "-[CSVoiceTriggerDataCollector _filteredVTEIArray]";
        v31 = 2048;
        v32 = v12;
        v33 = 2048;
        v34 = v14;
        v17 = v19;
        v18 = "%s Collecting VT/PHS reject event from time: %llu, delta %f secs";
      }
      else
      {
        v16 = *v8;
        if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        *(_DWORD *)buf = v22;
        v30 = "-[CSVoiceTriggerDataCollector _filteredVTEIArray]";
        v31 = 2048;
        v32 = v12;
        v33 = 2048;
        v34 = v14;
        v17 = v16;
        v18 = "%s Rejecting VT/PHS reject event from time: %llu, delta %f secs";
      }
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x20u);
LABEL_12:

    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  }
  while (v6);
LABEL_14:

  if (objc_msgSend(v23, "count"))
    v20 = (void *)objc_msgSend(v23, "copy");
  else
    v20 = 0;

  return v20;
}

- (void)_createAndSubmitRejectLoggingDictWithSource:(id)a3 withPHSAcceptInfo:(id)a4
{
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *vteiList;
  NSObject *v16;
  NSMutableArray *v17;
  NSMutableArray *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v7 = a4;
  -[CSVoiceTriggerDataCollector _filteredVTEIArray](self, "_filteredVTEIArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("unkown");
    if (v6)
      v10 = v6;
    v11 = v10;
    objc_msgSend(v9, "setObject:forKey:", v11, *MEMORY[0x1E0D19578]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, *MEMORY[0x1E0D19728]);

    objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x1E0D194E0]);
    if (v7)
      objc_msgSend(v9, "setObject:forKey:", v7, *MEMORY[0x1E0D194D8]);
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEventWithType:context:", 4709, v9);

    v14 = (void *)*MEMORY[0x1E0D18F58];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
    {
      vteiList = self->_vteiList;
      v16 = v14;
      v19 = 136315650;
      v20 = "-[CSVoiceTriggerDataCollector _createAndSubmitRejectLoggingDictWithSource:withPHSAcceptInfo:]";
      v21 = 2048;
      v22 = -[NSMutableArray count](vteiList, "count");
      v23 = 2112;
      v24 = v6;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Submitting %lu VT/PHS reject logs for siri record type %@", (uint8_t *)&v19, 0x20u);

    }
  }
  v17 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  v18 = self->_vteiList;
  self->_vteiList = v17;

}

- (void)_submitToggleReport
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *vteiList;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "getPHSRejectCount");

  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getVTRejectCount");

  vteiList = self->_vteiList;
  v8 = (_QWORD *)MEMORY[0x1E0D196A8];
  if (vteiList
    && (-[NSMutableArray lastObject](vteiList, "lastObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    -[NSMutableArray lastObject](self->_vteiList, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntegerValue");

  }
  else
  {
    v12 = 0;
  }
  v23[0] = *v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v23[1] = *MEMORY[0x1E0D194B8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v14;
  v23[2] = *MEMORY[0x1E0D194B0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315394;
    v20 = "-[CSVoiceTriggerDataCollector _submitToggleReport]";
    v21 = 2112;
    v22 = v16;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s Submitting VT toggle analytics: %@", (uint8_t *)&v19, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "logEventWithType:context:", 4708, v16);

}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  id v9;
  NSObject *queue;
  id v11;
  _QWORD block[4];
  id v13;
  CSVoiceTriggerDataCollector *v14;
  BOOL v15;

  v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __117__CSVoiceTriggerDataCollector_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke;
  block[3] = &unk_1E7C28888;
  v15 = a5;
  v13 = v9;
  v14 = self;
  v11 = v9;
  dispatch_async(queue, block);

}

- (void)CSVoiceTriggerEnabledMonitor:(id)a3 didReceiveEnabled:(BOOL)a4
{
  NSObject *queue;
  _QWORD v5[5];
  BOOL v6;

  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__CSVoiceTriggerDataCollector_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke;
  v5[3] = &unk_1E7C28480;
  v6 = a4;
  v5[4] = self;
  dispatch_async(queue, v5);
}

- (NSMutableArray)vteiList
{
  return self->_vteiList;
}

- (void)setVteiList:(id)a3
{
  objc_storeStrong((id *)&self->_vteiList, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDate)lastVTEnableDate
{
  return self->_lastVTEnableDate;
}

- (void)setLastVTEnableDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastVTEnableDate, a3);
}

- (NSDate)lastVTDisableDate
{
  return self->_lastVTDisableDate;
}

- (void)setLastVTDisableDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastVTDisableDate, a3);
}

- (NSArray)privacyApprovedFields
{
  return self->_privacyApprovedFields;
}

- (void)setPrivacyApprovedFields:(id)a3
{
  objc_storeStrong((id *)&self->_privacyApprovedFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyApprovedFields, 0);
  objc_storeStrong((id *)&self->_lastVTDisableDate, 0);
  objc_storeStrong((id *)&self->_lastVTEnableDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vteiList, 0);
}

void __78__CSVoiceTriggerDataCollector_CSVoiceTriggerEnabledMonitor_didReceiveEnabled___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  double v12;
  _QWORD *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v3 = (void *)*MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 40))
      v4 = CFSTR("enable");
    else
      v4 = CFSTR("disable");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v6 = v3;
    objc_msgSend(v2, "stringFromDate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "-[CSVoiceTriggerDataCollector CSVoiceTriggerEnabledMonitor:didReceiveEnabled:]_block_invoke";
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Got VT event with status %@, last VT enable time: %@, last VT disable time %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD **)(a1 + 32);
  v11 = (void *)v10[4];
  if (*(_BYTE *)(a1 + 40))
  {
    if (v11)
    {
      if (v10[3])
      {
        objc_msgSend(v9, "timeIntervalSinceDate:");
        v10 = *(_QWORD **)(a1 + 32);
        if (v12 <= 86400.0)
        {
          objc_msgSend(v10, "_submitToggleReport");
          v10 = *(_QWORD **)(a1 + 32);
        }
      }
    }
    v14 = (void *)v10[3];
    v13 = v10 + 3;
    v11 = v14;
  }
  else
  {
    v13 = v10 + 4;
  }
  *v13 = v9;

}

void __117__CSVoiceTriggerDataCollector_siriClientBehaviorMonitor_didStartStreamWithContext_successfully_option_withEventUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 48))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "type") != 6)
    {
      v2 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0D19008], "recordTypeString:", objc_msgSend(*(id *)(a1 + 32), "type"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "_createAndSubmitRejectLoggingDictWithSource:withPHSAcceptInfo:", v3, 0);

    }
  }
}

void __57__CSVoiceTriggerDataCollector_addVTAcceptEntryAndSubmit___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D19008], "recordTypeString:", 6);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_createAndSubmitRejectLoggingDictWithSource:withPHSAcceptInfo:", v3, *(_QWORD *)(a1 + 40));

}

void __61__CSVoiceTriggerDataCollector_addVTRejectEntry_truncateData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D19728];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D19728]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count") >= 6)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectAtIndex:", 0);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __61__CSVoiceTriggerDataCollector_addVTRejectEntry_truncateData___block_invoke_2;
    v16 = &unk_1E7C25658;
    v17 = v7;
    v9 = v6;
    v18 = v9;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v13);
    v10 = v9;

    v5 = v10;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v2, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("dcTriggerEndMachTime"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v5);
  v12 = *MEMORY[0x1E0D18F58];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F58], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CSVoiceTriggerDataCollector addVTRejectEntry:truncateData:]_block_invoke";
    v21 = 2048;
    v22 = v4;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Received VT/PHS reject event at time: %llu", buf, 0x16u);
  }

}

void __61__CSVoiceTriggerDataCollector_addVTRejectEntry_truncateData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v7;
    if (v4)
    {
      v5 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v6, v7);

      v3 = v7;
    }
  }

}

void __64__CSVoiceTriggerDataCollector_fetchVoiceTriggerHeartBeatMetrics__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
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
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0DA8C70];
  objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getVoiceProfileAnalyticsForAppDomain:withLocale:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0DA8D00];
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8D00]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v26, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("numImplicitUtt"));

  }
  v10 = *MEMORY[0x1E0DA8CF8];
  objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0DA8CF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v26, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v12, CFSTR("numExplicitUtt"));

  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v14, "firstPassTriggerCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v15, CFSTR("numFirstPassTriggersPerDay"));

  if (CSIsHorseman())
  {
    +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getVoiceTriggerStatistics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "getVoiceTriggerDailyMetadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKey:", v17, CFSTR("vtStatistics"));
    objc_msgSend(v6, "setObject:forKey:", v19, CFSTR("firstPassDailyMetadata"));
    +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "resetVTEstimationStatistics");

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D19260], "supportMph"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v21, CFSTR("isJSEnabled"));

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v6;
  v24 = v6;

  +[CSVoiceTriggerStatistics sharedInstance](CSVoiceTriggerStatistics, "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "clearFirstPassTriggerCount");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10115 != -1)
    dispatch_once(&sharedInstance_onceToken_10115, &__block_literal_global_10116);
  return (id)sharedInstance_sharedDataCollectorInstance;
}

void __45__CSVoiceTriggerDataCollector_sharedInstance__block_invoke()
{
  CSVoiceTriggerDataCollector *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerDataCollector);
  v1 = (void *)sharedInstance_sharedDataCollectorInstance;
  sharedInstance_sharedDataCollectorInstance = (uint64_t)v0;

}

@end
