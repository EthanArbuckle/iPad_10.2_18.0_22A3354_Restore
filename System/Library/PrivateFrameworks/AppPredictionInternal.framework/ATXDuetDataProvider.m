@implementation ATXDuetDataProvider

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 limit:(unint64_t)a6 ascending:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v23;
  void *context;
  _QWORD v25[5];
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  context = (void *)MEMORY[0x1CAA48B6C]();
  v15 = (void *)objc_opt_class();
  objc_msgSend(v15, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __93__ATXDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke;
  v25[3] = &unk_1E82E8F28;
  v25[4] = self;
  v19 = v17;
  v26 = v19;
  LOBYTE(v23) = a7;
  objc_msgSend(v18, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:batchSize:ascending:block:", v16, v12, v13, v14, a6, 800, v23, v25);

  v20 = v26;
  v21 = v19;

  objc_autoreleasePoolPop(context);
  return v21;
}

+ (id)duetHelperStreamTypeToDuetEventStream:(int64_t)a3
{
  void *v4;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;

  switch(a3)
  {
    case 0:
      goto LABEL_19;
    case 1:
      objc_msgSend(MEMORY[0x1E0D15AF8], "audioOutputRouteStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0D15AF8], "bluetoothIsConnectedStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0D15AF8], "userIsFirstBacklightOnAfterWakeup");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0D15AF8], "carPlayIsConnectedStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0D15AF8], "nowPlayingStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
    case 11:
      objc_msgSend(MEMORY[0x1E0D15AF8], "microLocationVisitStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0D15AF8], "appIntentsStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 8:
      +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "useOriginalScreenLockStateStream");

      if (v9)
        objc_msgSend(MEMORY[0x1E0D15AF8], "deviceIsLockedStream");
      else
        objc_msgSend(MEMORY[0x1E0D15AF8], "deviceIsLockedImputedStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 9:
      objc_msgSend(MEMORY[0x1E0D15AF8], "appClipUsageStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 10:
      objc_msgSend(MEMORY[0x1E0D15AF8], "deviceIsPluggedInStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 12:
      objc_msgSend(MEMORY[0x1E0D15AF8], "motionStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 13:
      __atxlog_handle_anchor();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        +[ATXDuetDataProvider duetHelperStreamTypeToDuetEventStream:].cold.1(v10);

LABEL_19:
      objc_msgSend(MEMORY[0x1E0D15AF8], "appInFocusStream");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXDuetDataProvider.m"), 199, CFSTR("Returning nil _DKEventStream for ATXDuetDataProviderStreamType %ld."), a3);

      v4 = 0;
      break;
  }
  return v4;
}

void __93__ATXDuetDataProvider_fetchEventsBetweenStartDate_andEndDate_withPredicates_limit_ascending___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA48B6C](v4);
        v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass", (_QWORD)v11)), "initWithDKEvent:", v8);
        if (v10)
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = v4;
    }
    while (v4);
  }

}

+ (Class)supportedDuetEventClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXDuetDataProvider.m"), 22, CFSTR("Should be implemented by subclasses"));

  return 0;
}

+ (int64_t)supportedCoreDuetStream
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXDuetDataProvider.m"), 28, CFSTR("Should be implemented by subclasses"));

  return 0;
}

- (id)fetchEventsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  return -[ATXDuetDataProvider fetchEventsBetweenStartDate:andEndDate:withPredicates:limit:ascending:](self, "fetchEventsBetweenStartDate:andEndDate:withPredicates:limit:ascending:", a3, a4, a5, 1000000, 1);
}

- (id)fetchEventIdentifierCountsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[5];
  id v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_class();
  objc_msgSend(v12, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __92__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates___block_invoke;
  v19[3] = &unk_1E82E8F28;
  v19[4] = self;
  v15 = v11;
  v20 = v15;
  objc_msgSend(v14, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v13, v10, v9, v8, 10000000, 1, v19);

  v16 = v20;
  v17 = v15;

  return v17;
}

void __92__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA48B6C](v4);
        v10 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass", (_QWORD)v14)), "initWithDKEvent:", v8);
        v11 = v10;
        if (v10)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v13);

        }
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v5 = v4;
    }
    while (v4);
  }

}

- (id)fetchEventIdentifierCountsBetweenStartDate:(id)a3 andEndDate:(id)a4 withPredicates:(id)a5 dateBuckets:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1E83CDD80, *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v19++));
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }

  v20 = (void *)objc_opt_class();
  objc_msgSend(v20, "duetHelperStreamTypeToDuetEventStream:", objc_msgSend((id)objc_opt_class(), "supportedCoreDuetStream"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __104__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates_dateBuckets___block_invoke;
  v28[3] = &unk_1E82E23B0;
  v28[4] = self;
  v29 = v15;
  v23 = v14;
  v30 = v23;
  v24 = v15;
  objc_msgSend(v22, "_enumerateBatchesInDuetStream:startDate:endDate:otherPredicates:limit:ascending:block:", v21, v10, v11, v12, 10000000, 1, v28);

  v25 = v30;
  v26 = v23;

  return v26;
}

void __104__ATXDuetDataProvider_fetchEventIdentifierCountsBetweenStartDate_andEndDate_withPredicates_dateBuckets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = a2;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v3);
        v5 = (void *)MEMORY[0x1CAA48B6C]();
        v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "supportedDuetEventClass")), "initWithDKEvent:", v4);
        if (v6)
        {
          v22 = v5;
          v23 = v3;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v7 = *(id *)(a1 + 40);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v25;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v25 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11);
                objc_msgSend(v6, "startDate");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "earlierDate:", v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "startDate");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                if (v14 != v15)
                {
                  v16 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v12);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v18, v12);

                }
                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v9);
          }

          v5 = v22;
          v3 = v23;
        }

        objc_autoreleasePoolPop(v5);
        ++v3;
      }
      while (v3 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v21);
  }

}

- (id)filteredEventsWithPredicate:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDuetDataProvider.m"), 133, CFSTR("Method is not yet implemented"));

  return self->_streamData;
}

- (void)tagEventsWithLocationsFromLocationVisitsArray:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDuetDataProvider.m"), 139, CFSTR("Method is not yet implemented"));

}

- (id)getUniqueValuesForPropertyKey:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXDuetDataProvider.m"), 145, CFSTR("Method is not yet implemented"));

  return (id)MEMORY[0x1E0C9AA60];
}

- (NSArray)streamData
{
  return self->_streamData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamData, 0);
}

+ (void)duetHelperStreamTypeToDuetEventStream:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Trying to access KnowledgeStore stream for None stream.", v1, 2u);
}

@end
