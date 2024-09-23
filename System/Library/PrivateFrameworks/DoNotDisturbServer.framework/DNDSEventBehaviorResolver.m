@implementation DNDSEventBehaviorResolver

- (DNDSEventBehaviorResolver)initWithModeRepository:(id)a3 contactStore:(id)a4 auxiliaryStateMonitor:(id)a5 intelligentBehaviorResolver:(id)a6 IDSLocalService:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  DNDSEventBehaviorResolver *v17;
  uint64_t v18;
  OS_dispatch_queue *queue;
  uint64_t v20;
  CNFavorites *favorites;
  NSMutableArray *v22;
  NSMutableArray *resolutionRecord;
  id v25;
  objc_super v26;

  v25 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)DNDSEventBehaviorResolver;
  v17 = -[DNDSEventBehaviorResolver init](&v26, sel_init);
  if (v17)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.EventBehaviorResolutionService"));
    v18 = objc_claimAutoreleasedReturnValue();
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v17->_modeRepository, a3);
    objc_storeStrong((id *)&v17->_contactStore, a4);
    objc_storeStrong((id *)&v17->_auxiliaryStateMonitor, a5);
    objc_storeStrong((id *)&v17->_intelligentBehaviorResolver, a6);
    objc_storeStrong((id *)&v17->_localService, a7);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C972F8]), "initWithContactStore:", v17->_contactStore);
    favorites = v17->_favorites;
    v17->_favorites = (CNFavorites *)v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resolutionRecord = v17->_resolutionRecord;
    v17->_resolutionRecord = v22;

    DNDSRegisterSysdiagnoseDataProvider(v17);
  }

  return v17;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSEventBehaviorResolver;
  -[DNDSEventBehaviorResolver dealloc](&v3, sel_dealloc);
}

- (id)resolveBehaviorForEventDetails:(id)a3 clientDetails:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __85__DNDSEventBehaviorResolver_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke;
  v20[3] = &unk_1E86A5C98;
  v24 = &v32;
  v20[4] = self;
  v14 = v10;
  v21 = v14;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  v25 = &v26;
  dispatch_sync(queue, v20);
  if (a6)
  {
    v17 = (void *)v27[5];
    if (v17)
      *a6 = objc_retainAutorelease(v17);
  }
  v18 = (id)v33[5];

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

void __85__DNDSEventBehaviorResolver_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "_queue_resolveBehaviorForEventDetails:clientDetails:date:error:", v3, v4, v5, &obj);
  v7 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  v8 = *(_QWORD *)(a1[8] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.EventBehaviorResolver");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)-[NSMutableArray copy](self->_resolutionRecord, "copy");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __61__DNDSEventBehaviorResolver_sysdiagnoseDataForDate_redacted___block_invoke;
  v14 = &unk_1E86A5CC0;
  v15 = v5;
  v7 = v5;
  objc_msgSend(v6, "bs_mapNoNulls:", &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = CFSTR("resolution-record");
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __61__DNDSEventBehaviorResolver_sysdiagnoseDataForDate_redacted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  _QWORD v16[6];
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("uuid");
  v3 = a2;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v16[1] = CFSTR("timestamp");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  v16[2] = CFSTR("local-date");
  v8 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(v3, "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromDate:dateStyle:timeStyle:", v9, 1, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v10;
  v16[3] = CFSTR("client-identifier");
  objc_msgSend(v3, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v11;
  v16[4] = CFSTR("outcome");
  DNDSResolutionOutcomeToString(objc_msgSend(v3, "outcome"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v12;
  v16[5] = CFSTR("reason");
  objc_msgSend(v3, "reason");

  DNDResolutionReasonToString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_queue_resolveBehaviorForEventDetails:(id)a3 clientDetails:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  id v37;
  _QWORD v38[4];
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSEventBehaviorResolver dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "currentStateForEventBehaviorResolver:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isActive"))
  {
    -[DNDSEventBehaviorResolver _activeModeConfigurationForBehavior:](self, "_activeModeConfigurationForBehavior:", objc_msgSend(v10, "behavior"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)DNDSLogResolver;
    if (v15)
    {
      v37 = v11;
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        objc_msgSend(v15, "mode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = (uint64_t)v19;
        _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Resolving breakthrough for active mode: %{public}@.", buf, 0xCu);

      }
      objc_msgSend(v15, "mode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "semanticType");
      objc_msgSend(v15, "configuration");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSEventBehaviorResolver _queue_resolutionForModeSemanticType:withConfiguration:eventDetails:clientDetails:state:date:error:](self, "_queue_resolutionForModeSemanticType:withConfiguration:eventDetails:clientDetails:state:date:error:", v21, v22, v10, v37, v14, v12, a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v37;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
        -[DNDSEventBehaviorResolver _queue_resolveBehaviorForEventDetails:clientDetails:date:error:].cold.1(v16, v14);
      v23 = 0;
    }

  }
  else
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5B0]), "initWithEventDetails:interruptionSuppression:intelligentBehavior:resolutionReason:activeModeUUID:", v10, 0, 0, 2, 0);
    objc_msgSend(v11, "clientIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSEventBehaviorResolution resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:](DNDSEventBehaviorResolution, "resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:", v12, v24, v25, 1, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[DNDSEventBehaviorResolver _queue_adjustEventBehaviorResolutionForAuxiliaryState:](self, "_queue_adjustEventBehaviorResolutionForAuxiliaryState:", v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = (uint64_t)v26;
      _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, "Event was resolved: resolution=%@", buf, 0xCu);
    }
    -[NSMutableArray addObject:](self->_resolutionRecord, "addObject:", v26);
    if ((unint64_t)-[NSMutableArray count](self->_resolutionRecord, "count") >= 0x15)
    {
      v28 = -[NSMutableArray count](self->_resolutionRecord, "count");
      objc_msgSend(v12, "dateByAddingTimeInterval:", -180.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x1E0CB3880];
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __92__DNDSEventBehaviorResolver__queue_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke;
      v38[3] = &unk_1E86A5CE8;
      v31 = v29;
      v39 = v31;
      objc_msgSend(v30, "predicateWithBlock:", v38);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray filterUsingPredicate:](self->_resolutionRecord, "filterUsingPredicate:", v32);
      v33 = v28 - -[NSMutableArray count](self->_resolutionRecord, "count");
      if (v33)
      {
        v34 = DNDSLogResolver;
        if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v41 = v33;
          _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_DEFAULT, "Pruned %lu resolutions from record", buf, 0xCu);
        }
      }

    }
  }
  objc_msgSend(v26, "eventBehavior");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

BOOL __92__DNDSEventBehaviorResolver__queue_resolveBehaviorForEventDetails_clientDetails_date_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) != 1;

  return v4;
}

- (id)_queue_adjustEventBehaviorResolutionForAuxiliaryState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _DWORD v24[2];
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "eventBehavior");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "interruptionSuppression"))
    {

    }
    else
    {
      v7 = -[DNDSEventBehaviorResolver _queue_shouldAdjustEventBehaviorForMirroring](self, "_queue_shouldAdjustEventBehaviorForMirroring");

      if (v7)
      {
        v8 = -[DNDSAuxiliaryStateMonitor isScreenShared](self->_auxiliaryStateMonitor, "isScreenShared");
        v9 = -[DNDSAuxiliaryStateMonitor isScreenMirrored](self->_auxiliaryStateMonitor, "isScreenMirrored");
        v10 = -[DNDSAuxiliaryStateMonitor isPresentationModeEnabled](self->_auxiliaryStateMonitor, "isPresentationModeEnabled");
        v11 = v10;
        if (v9 || v8 || v10)
        {
          v12 = 23;
          if (!v10)
            v12 = 0;
          if (v8)
            v12 = 22;
          if (v9)
            v13 = 21;
          else
            v13 = v12;
          objc_msgSend(v5, "eventBehavior");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_alloc(MEMORY[0x1E0D1D5B0]);
          objc_msgSend(v14, "eventDetails");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "activeModeUUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v15, "initWithEventDetails:interruptionSuppression:intelligentBehavior:resolutionReason:activeModeUUID:", v16, 1, 3, v13, v17);

          objc_msgSend(v5, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "clientIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[DNDSEventBehaviorResolution resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:](DNDSEventBehaviorResolution, "resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:", v19, v18, v20, 2, v13);
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = DNDSLogResolver;
          if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
          {
            v24[0] = 67109632;
            v24[1] = v9;
            v25 = 1024;
            v26 = v8;
            v27 = 1024;
            v28 = v11;
            _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Resolution modified to accomodate auxiliary state; isScreenMirrored=%d isScreenShared=%d isPresentationModeEnabled=%d",
              (uint8_t *)v24,
              0x14u);
          }

          v5 = (void *)v21;
        }
      }
    }
  }
  return v5;
}

- (id)_activeModeConfigurationForBehavior:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[DNDSEventBehaviorResolver dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStateForEventBehaviorResolver:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activeModeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    -[DNDSEventBehaviorResolver _legacyModeConfigurationForModeConfiguration:](self, "_legacyModeConfigurationForModeConfiguration:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (id)_legacyModeConfigurationForModeConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0D1D6E0], "defaultConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v3, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "senderConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "phoneCallBypassSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPhoneCallBypassSettings:", v10);

  objc_msgSend(v5, "setSenderConfiguration:", v7);
  objc_msgSend(v5, "setMinimumBreakthroughUrgency:", 0);
  objc_msgSend(v4, "setConfiguration:", v5);

  return v4;
}

- (id)_queue_resolutionForModeSemanticType:(int64_t)a3 withConfiguration:(id)a4 eventDetails:(id)a5 clientDetails:(id)a6 state:(id)a7 date:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  DNDSIntelligentBehaviorResolver *intelligentBehaviorResolver;
  void *v32;
  _BOOL4 v33;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  __CFString *v38;
  NSObject *v39;
  const __CFString *v40;
  _BOOL4 v41;
  NSObject *v42;
  const __CFString *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint8_t buf[4];
  const __CFString *v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v59 = a6;
  v60 = a7;
  v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v16, "bundleIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sender");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "urgency");
  v19 = objc_msgSend(v16, "type");
  objc_msgSend(v16, "threadIdentifier");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterCriteria");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "behavior") == 1)
    v20 = 0;
  else
    v20 = objc_msgSend(v16, "notifyAnyway");
  v21 = objc_msgSend(v16, "platform");
  if (!v21)
    v21 = DNDPlatformForCurrentDevice();
  if (-[DNDSEventBehaviorResolver _isDisconnectedWatch:inReduceInterruptions:](self, "_isDisconnectedWatch:inReduceInterruptions:", v21, a3))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D5B0]), "initWithEventDetails:interruptionSuppression:intelligentBehavior:resolutionReason:activeModeUUID:", v16, 0, 0, 2, 0);
    v23 = v59;
    objc_msgSend(v59, "clientIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSEventBehaviorResolution resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:](DNDSEventBehaviorResolution, "resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:", v17, v22, v24, 1, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v60;
    goto LABEL_49;
  }
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v61, v21);
  +[DNDSServerDomain rootSettings](DNDSServerDomain, "rootSettings");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "forcedIntelligentBreakthrough");

  if (v28)
  {
    if (v28 == 1)
      v29 = 2;
    else
      v29 = 3;
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v30 = v60;
      if (objc_msgSend(v15, "allowIntelligentManagement") == 2
        && (intelligentBehaviorResolver = self->_intelligentBehaviorResolver) != 0)
      {
        v29 = -[DNDSIntelligentBehaviorResolver intelligentInterruptionBehaviorForClientEventDetails:](intelligentBehaviorResolver, "intelligentInterruptionBehaviorForClientEventDetails:", v16);
      }
      else
      {
        v29 = 0;
      }
      goto LABEL_18;
    }
    v29 = 0;
  }
  v30 = v60;
LABEL_18:
  v64 = 0;
  objc_msgSend(v30, "activeModeIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v55) = v20;
  v33 = -[DNDSEventBehaviorResolver _queue_isBreakthroughAllowedForModeIdentifier:withConfiguration:application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:](self, "_queue_isBreakthroughAllowedForModeIdentifier:withConfiguration:application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:", v32, v15, v56, v62, v18, v19, v58, v57, v55, v29, &v64);

  if (v64 != 26 && (v29 & 0xFFFFFFFFFFFFFFFELL) == 2)
    v35 = 0;
  else
    v35 = v29;
  v36 = (void *)DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    DNDIntelligentInterruptionBehaviorToString();
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v66 = v38;
    v67 = 2112;
    v68 = v16;
    _os_log_impl(&dword_1CB895000, v37, OS_LOG_TYPE_DEFAULT, "Intelligent Resolver behavior: %@ for clientEventDetails: %@", buf, 0x16u);

  }
  v39 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    if (v33)
      v40 = CFSTR("is");
    else
      v40 = CFSTR("is NOT");
    *(_DWORD *)buf = 138543874;
    v66 = v40;
    v67 = 2112;
    v68 = v15;
    v69 = 2112;
    v70 = v16;
    _os_log_impl(&dword_1CB895000, v39, OS_LOG_TYPE_DEFAULT, "Breakthrough %{public}@ allowed for configuration %@ with event details: %@.", buf, 0x20u);
  }
  v63 = 0;
  v41 = -[DNDSEventBehaviorResolver _queue_isBreakthroughAllowedForSender:eventType:clientDetails:date:reason:](self, "_queue_isBreakthroughAllowedForSender:eventType:clientDetails:date:reason:", v62, v19, v59, v17, &v63);
  v42 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v43 = CFSTR("is");
    if (!v41)
      v43 = CFSTR("is NOT");
    *(_DWORD *)buf = 138543618;
    v66 = v43;
    v67 = 2112;
    v68 = v16;
    _os_log_impl(&dword_1CB895000, v42, OS_LOG_TYPE_DEFAULT, "Breakthrough %{public}@ allowed for global settings with event details: %@.", buf, 0x16u);
  }
  v44 = v33 || v41;
  v45 = v63;
  if (!v41)
    v45 = v64;
  if (v33)
    v46 = v64;
  else
    v46 = v45;
  if (v44)
    v47 = 1;
  else
    v47 = 2;
  if ((v44 & 1) != 0)
  {
    v48 = v35;
    v49 = 0;
  }
  else
  {
    v48 = v35;
    if ((objc_msgSend(v61, "isEqualToString:", CFSTR("com.apple.cmas")) & 1) != 0)
      v49 = 1;
    else
      v49 = objc_msgSend(v15, "suppressionType");
  }
  v50 = objc_alloc(MEMORY[0x1E0D1D5B0]);
  v26 = v60;
  objc_msgSend(v60, "activeModeUUID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v50, "initWithEventDetails:interruptionSuppression:intelligentBehavior:resolutionReason:activeModeUUID:", v16, v49, v48, v46, v51);

  v23 = v59;
  objc_msgSend(v59, "clientIdentifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSEventBehaviorResolution resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:](DNDSEventBehaviorResolution, "resolutionForDate:eventBehavior:clientIdentifier:outcome:reason:", v17, v52, v53, v47, v46);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_49:
  return v25;
}

- (BOOL)_isDisconnectedWatch:(unint64_t)a3 inReduceInterruptions:(int64_t)a4
{
  BOOL result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  result = 0;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3 == 3 && a4 == 9)
  {
    -[IDSService devices](self->_localService, "devices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v12, "deviceType") == 2
            && objc_msgSend(v12, "isLocallyPaired")
            && (objc_msgSend(v12, "isNearby") & 1) == 0
            && !objc_msgSend(v12, "isConnected"))
          {
            v9 = 1;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    return v9 & 1;
  }
  return result;
}

- (unint64_t)_queue_resolveOutcomeForEventSender:(id)a3 clientDetails:(id)a4 date:(id)a5 reason:(unint64_t *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  int v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  uint64_t v24;
  int v25;
  unint64_t *v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[DNDSEventBehaviorResolver dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "eventBehaviorResolver:bypassSettingsForClientIdentifier:", self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Got bypass settings: settings=%{public}@", buf, 0xCu);
  }
  v17 = objc_msgSend(v10, "isPopulated");
  if (v15)
  {
    v18 = v17;
    objc_msgSend(v15, "immediateBypassEventSourceType");
    v27 = a6;
    v19 = DNDResolvedImmediateBypassEventSourceType();
    switch(v19)
    {
      case 1uLL:
        v20 = 1;
        v21 = 5;
        break;
      case 2uLL:
        v20 = 0;
        v21 = 6;
        break;
      case 3uLL:
        if (!v18
          || !-[DNDSEventBehaviorResolver _queue_eventSourceIsFavorite:](self, "_queue_eventSourceIsFavorite:", v10))
        {
          goto LABEL_18;
        }
        v20 = 1;
        v21 = 7;
        v19 = 1;
        break;
      case 4uLL:
        if (!v18
          || !-[DNDSEventBehaviorResolver _queue_eventSourceIsContact:](self, "_queue_eventSourceIsContact:", v10))
        {
          goto LABEL_18;
        }
        v19 = 1;
        v21 = 8;
        goto LABEL_17;
      case 5uLL:
        if (!v18)
          goto LABEL_18;
        objc_msgSend(v15, "immediateBypassCNGroupIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[DNDSEventBehaviorResolver _queue_eventSourceIsContact:inGroupWithIdentifier:](self, "_queue_eventSourceIsContact:inGroupWithIdentifier:", v10, v22);

        if (!v23)
          goto LABEL_18;
        v19 = 1;
        v21 = 9;
LABEL_17:
        v20 = 1;
        break;
      default:
LABEL_18:
        v21 = 0;
        v20 = 0;
        v19 = 0;
        break;
    }
    objc_msgSend(v15, "repeatEventSourceBehaviorEnabledSetting");
    v24 = DNDResolvedRepeatEventSourceBehaviorEnabledSetting();
    if ((v20 & 1) == 0
      && v24 == 2
      && ((v18 ^ 1) & 1) == 0
      && -[DNDSEventBehaviorResolver _queue_eventSourceIsRepeat:clientDetails:date:](self, "_queue_eventSourceIsRepeat:clientDetails:date:", v10, v11, v12))
    {
      v21 = 10;
      v19 = 1;
    }
    if (v19 == 1)
      v25 = 0;
    else
      v25 = v18;
    if (v25 == 1
      && -[DNDSEventBehaviorResolver _queue_eventSourceIsEmergencyContact:](self, "_queue_eventSourceIsEmergencyContact:", v10))
    {
      v21 = 11;
      v19 = 1;
LABEL_31:
      *v27 = v21;
      goto LABEL_32;
    }
    if (v19)
      goto LABEL_31;
  }
  else
  {
    v19 = 0;
  }
LABEL_32:

  return v19;
}

- (BOOL)_queue_eventSourceIsFavorite:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactStore *contactStore;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  int v14;
  BOOL v15;
  _QWORD v17[6];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = objc_alloc(MEMORY[0x1E0C97210]);
  v6 = *MEMORY[0x1E0C96768];
  v27[0] = *MEMORY[0x1E0C966E8];
  v27[1] = v6;
  v27[2] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v7);

  objc_msgSend(MEMORY[0x1E0C97200], "dnds_predicateForContactsMatchingEventSender:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);

  objc_msgSend(v8, "setUnifyResults:", 1);
  contactStore = self->_contactStore;
  v18 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke;
  v17[3] = &unk_1E86A5D38;
  v17[4] = self;
  v17[5] = &v19;
  v11 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v8, &v18, v17);
  v12 = v18;
  v13 = DNDSLogResolver;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *((unsigned __int8 *)v20 + 24);
      *(_DWORD *)buf = 138543618;
      v24 = v4;
      v25 = 1024;
      v26 = v14;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Checked if event source is a favorite: source=%{public}@, favorite=%{BOOL}d", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
  {
    -[DNDSEventBehaviorResolver _queue_eventSourceIsFavorite:].cold.1();
  }
  v15 = *((_BYTE *)v20 + 24) != 0;

  _Block_object_dispose(&v19, 8);
  return v15;
}

void __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(v5, "isUnified") & 1) != 0)
  {
    objc_msgSend(v5, "linkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke_2;
  v8[3] = &unk_1E86A5D10;
  v8[4] = *(_QWORD *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", v8);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

BOOL __58__DNDSEventBehaviorResolver__queue_eventSourceIsFavorite___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "entriesForContact:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_queue_eventSourceIsContact:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CNContactStore *contactStore;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  int v13;
  BOOL v14;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = objc_alloc(MEMORY[0x1E0C97210]);
  v26[0] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v6);

  objc_msgSend(MEMORY[0x1E0C97200], "dnds_predicateForContactsMatchingEventSender:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  objc_msgSend(v7, "setUnifyResults:", 0);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  contactStore = self->_contactStore;
  v16[4] = &v18;
  v17 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__DNDSEventBehaviorResolver__queue_eventSourceIsContact___block_invoke;
  v16[3] = &unk_1E86A5D60;
  v10 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v17, v16);
  v11 = v17;
  v12 = DNDSLogResolver;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *((unsigned __int8 *)v19 + 24);
      *(_DWORD *)buf = 138543618;
      v23 = v4;
      v24 = 1024;
      v25 = v13;
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Checked if event source is a contact: source=%{public}@, contact=%{BOOL}d", buf, 0x12u);
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
  {
    -[DNDSEventBehaviorResolver _queue_eventSourceIsContact:].cold.1();
  }
  v14 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __57__DNDSEventBehaviorResolver__queue_eventSourceIsContact___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (BOOL)_queue_eventSourceIsContact:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v6;
  id v7;
  CNContactStore *contactStore;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CNContactStore *v21;
  id v22;
  _BOOL4 v23;
  id v24;
  NSObject *v25;
  int v26;
  BOOL v27;
  _QWORD v29[4];
  id v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  int v40;
  _QWORD v41[2];
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v6, "isPopulated"))
  {
    contactStore = self->_contactStore;
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsInGroupWithIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C96768];
    v42[0] = *MEMORY[0x1E0C966E8];
    v10 = v42[0];
    v42[1] = v11;
    v43 = *MEMORY[0x1E0C967C0];
    v12 = v43;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v9, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "bs_mapNoNulls:", &__block_literal_global_2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_flatten");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc(MEMORY[0x1E0C97210]);
    v41[0] = v10;
    v41[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithKeysToFetch:", v18);

    objc_msgSend(MEMORY[0x1E0C97200], "dnds_predicateForContactsMatchingEventSender:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPredicate:", v20);

    objc_msgSend(v19, "setUnifyResults:", 0);
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v21 = self->_contactStore;
    v31 = &v33;
    v32 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_2;
    v29[3] = &unk_1E86A5D38;
    v22 = v16;
    v30 = v22;
    v23 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](v21, "enumerateContactsWithFetchRequest:error:usingBlock:", v19, &v32, v29);
    v24 = v32;
    v25 = DNDSLogResolver;
    if (v23)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      {
        v26 = *((unsigned __int8 *)v34 + 24);
        *(_DWORD *)buf = 138543618;
        v38 = v6;
        v39 = 1024;
        v40 = v26;
        _os_log_impl(&dword_1CB895000, v25, OS_LOG_TYPE_DEFAULT, "Checked if event source is a group contact: source=%{public}@, contact=%{BOOL}d", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
    {
      -[DNDSEventBehaviorResolver _queue_eventSourceIsContact:inGroupWithIdentifier:].cold.1();
    }
    v27 = *((_BYTE *)v34 + 24) != 0;

    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

id __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if ((objc_msgSend(v2, "isUnified") & 1) != 0)
  {
    objc_msgSend(v2, "linkedContacts");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

void __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_3;
  v8[3] = &unk_1E86A5D10;
  v9 = v5;
  v7 = v5;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", v8);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

uint64_t __79__DNDSEventBehaviorResolver__queue_eventSourceIsContact_inGroupWithIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)_queue_eventSourceIsRepeat:(id)a3 clientDetails:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSMutableArray *resolutionRecord;
  id v13;
  id v14;
  int v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v8, "isPopulated"))
  {
    objc_msgSend(v10, "dateByAddingTimeInterval:", -180.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    resolutionRecord = self->_resolutionRecord;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__DNDSEventBehaviorResolver__queue_eventSourceIsRepeat_clientDetails_date___block_invoke;
    v18[3] = &unk_1E86A5DC8;
    v13 = v11;
    v19 = v13;
    v20 = v9;
    v14 = v8;
    v21 = v14;
    v15 = -[NSMutableArray bs_containsObjectPassingTest:](resolutionRecord, "bs_containsObjectPassingTest:", v18);
    v16 = DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      v24 = 1024;
      v25 = v15;
      _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Checked if event source is a repeat: source=%{public}@, repeat=%{BOOL}d", buf, 0x12u);
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

uint64_t __75__DNDSEventBehaviorResolver__queue_eventSourceIsRepeat_clientDetails_date___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  int v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "compare:", v5);

  objc_msgSend(v4, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  objc_msgSend(v4, "eventBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "eventDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 48));

  if (v6 == 1)
    v14 = 0;
  else
    v14 = v9;
  return v14 & v13;
}

- (BOOL)_queue_eventSourceIsEmergencyContact:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CNContactStore *contactStore;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  int v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  int v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (objc_msgSend(v4, "isPopulated"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C97210]);
    v6 = *MEMORY[0x1E0C96768];
    v28[0] = *MEMORY[0x1E0C966E8];
    v28[1] = v6;
    v7 = *MEMORY[0x1E0C967C0];
    v28[2] = *MEMORY[0x1E0C96680];
    v28[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKeysToFetch:", v8);

    objc_msgSend(MEMORY[0x1E0C97200], "dnds_predicateForContactsMatchingEventSender:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    objc_msgSend(v9, "setUnifyResults:", 1);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    contactStore = self->_contactStore;
    v18[4] = &v20;
    v19 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __66__DNDSEventBehaviorResolver__queue_eventSourceIsEmergencyContact___block_invoke;
    v18[3] = &unk_1E86A5D60;
    v12 = -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, &v19, v18);
    v13 = v19;
    v14 = DNDSLogResolver;
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *((unsigned __int8 *)v21 + 24);
        *(_DWORD *)buf = 138543618;
        v25 = v4;
        v26 = 1024;
        v27 = v15;
        _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Checked if event source is an emergency contact: source=%{public}@, emergencyContact=%{BOOL}d", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
    {
      -[DNDSEventBehaviorResolver _queue_eventSourceIsEmergencyContact:].cold.1();
    }
    v16 = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __66__DNDSEventBehaviorResolver__queue_eventSourceIsEmergencyContact___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(v5, "isUnified") & 1) != 0)
  {
    objc_msgSend(v5, "linkedContacts");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "bs_containsObjectPassingTest:", &__block_literal_global_56);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

uint64_t __66__DNDSEventBehaviorResolver__queue_eventSourceIsEmergencyContact___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "callAlert");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreMute");

  return v3;
}

- (BOOL)_queue_isBreakthroughAllowedForModeIdentifier:(id)a3 withConfiguration:(id)a4 application:(id)a5 sender:(id)a6 urgency:(unint64_t)a7 eventType:(unint64_t)a8 threadIdentifier:(id)a9 filterCriteria:(id)a10 notifyAnyway:(BOOL)a11 intelligentBehavior:(int64_t)a12 reason:(unint64_t *)a13
{
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  DNDSApplicationIdentifierMapper *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint64_t v31;
  _BOOL4 v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  unint64_t v40;
  _BOOL4 v41;
  int v42;
  NSObject *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  int v59;
  unint64_t v60;
  _BOOL4 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  int v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  int v76;
  int v77;
  int v78;
  uint64_t v79;
  BOOL v80;
  int v81;
  int v82;
  BOOL v83;
  unint64_t v84;
  int v85;
  int v86;
  char v87;
  id v88;
  int v89;
  id v90;
  id v91;
  NSObject *v92;
  uint64_t v93;
  id v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  id v100;
  void *v101;
  unsigned __int8 v102;
  void *v103;
  id v105;
  id v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t buf[4];
  id v126;
  __int16 v127;
  id v128;
  __int16 v129;
  id v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  id v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v105 = a3;
  v111 = a4;
  v18 = a5;
  v19 = a6;
  v107 = a9;
  v106 = a10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v20 = objc_msgSend(v18, "platform");
  if (v20 != DNDPlatformForCurrentDevice())
  {
    v21 = (void *)MEMORY[0x1D17A0B90]();
    v22 = objc_alloc_init(DNDSApplicationIdentifierMapper);
    -[DNDSApplicationIdentifierMapper applicationIdentifierForTargetPlatform:withSourceApplicationIdentifier:](v22, "applicationIdentifierForTargetPlatform:withSourceApplicationIdentifier:", DNDPlatformForCurrentDevice(), v18);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v21);
    v18 = (id)v23;
  }
  objc_msgSend(v18, "bundleID");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSEventBehaviorResolver dataSource](self, "dataSource");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v109, "eventBehaviorResolver:isAvailabilityActiveForBundleIdentifier:", self, v110);
  if (!v19)
  {
    v24 = 0;
    goto LABEL_16;
  }
  v24 = (void *)objc_msgSend(v19, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C97200], "dnds_predicateForContactsMatchingEventSender:", v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSEventBehaviorResolver _queue_firstContactForPredicate:](self, "_queue_firstContactForPredicate:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "identifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "contactIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v31 = DNDSLogResolver;
    if (!os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_DWORD *)buf = 138543618;
    v126 = v27;
    v127 = 2112;
    v128 = v19;
    v33 = "Filled out missing contact identifier: %{public}@ from sender: %@ to determine breakthrough.";
LABEL_13:
    v34 = v31;
    v35 = 22;
    goto LABEL_14;
  }
  objc_msgSend(v19, "contactIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isEqualToString:", v27);

  v31 = DNDSLogResolver;
  v32 = os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT);
  if ((v30 & 1) == 0)
  {
    if (!v32)
      goto LABEL_15;
    *(_DWORD *)buf = 138543618;
    v126 = v27;
    v127 = 2112;
    v128 = v19;
    v33 = "Updated contact identifier to %{public}@ from sender: %@ to determine breakthrough.";
    goto LABEL_13;
  }
  if (v32)
  {
    *(_DWORD *)buf = 138412290;
    v126 = v19;
    v33 = "No change to contact identifier from sender: %@ to determine breakthrough.";
    v34 = v31;
    v35 = 12;
LABEL_14:
    _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
  }
LABEL_15:
  objc_msgSend(v24, "setContactIdentifier:", v27);

LABEL_16:
  v36 = (void *)DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v37 = v36;
    DNDStringFromClientEventUrgency();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    DNDStringFromClientEventType();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v126 = v111;
    v127 = 2114;
    v128 = v110;
    v129 = 2112;
    v130 = v24;
    v131 = 2114;
    v132 = v38;
    v133 = 2114;
    v134 = v39;
    v135 = 2114;
    v136 = v107;
    _os_log_impl(&dword_1CB895000, v37, OS_LOG_TYPE_DEFAULT, "Resolving breakthrough through for configuration: %@ with event details application: %{public}@, sender: %@, urgency: %{public}@, eventType: %{public}@, threadIdentifier: %{public}@", buf, 0x3Eu);

  }
  v40 = a8 - 1;
  v41 = a8 - 1 < 4;
  v42 = objc_msgSend(v24, "isPopulated");
  if (a8 - 1 < 4)
  {
    if (v107)
      v41 = 1;
    else
      v41 = v42;
  }
  if (objc_msgSend(v111, "suppressionMode") == 2
    && objc_msgSend(v109, "currentUILockStateForEventBehaviorResolver:", self) == 1)
  {
    v43 = DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v43, OS_LOG_TYPE_INFO, "Allowing breakthrough because the device is unlocked", buf, 2u);
    }
    *a13 = 3;
    v44 = 1;
    goto LABEL_159;
  }
  objc_msgSend(v18, "bundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
    goto LABEL_31;
  objc_msgSend(v109, "eventBehaviorResolver:appPredicateForApplicationIdentifier:modeIdentifier:", self, v18, v105);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v108)
  {
    if (objc_msgSend(v18, "platform") == 3)
    {
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:platform:", v110, 1);
      objc_msgSend(v109, "eventBehaviorResolver:appPredicateForApplicationIdentifier:modeIdentifier:", self, v46, v105);
      v108 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_32;
    }
LABEL_31:
    v108 = 0;
  }
LABEL_32:
  v47 = (void *)MEMORY[0x1D17A0B90]();
  v122 = 0;
  v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v110, 1, &v122);
  v49 = v122;
  if (v49)
  {
    v50 = (void *)DNDSLogResolver;
    if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
      -[DNDSEventBehaviorResolver _queue_isBreakthroughAllowedForModeIdentifier:withConfiguration:application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:].cold.2((uint64_t)v110, v50, v49);
  }
  if (v48 && objc_msgSend(v48, "isWebApp"))
  {
    objc_msgSend(v48, "localizedName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "infoDictionary");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "objectForKey:ofClass:", CFSTR("WKPushBundleMetadata"), objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "objectForKey:", CFSTR("manifestId"));
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)v54;
    v103 = 0;
    if (v51 && v54)
      v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D770]), "initWithWebIdentifier:givenName:", v54, v51);

  }
  else
  {
    v103 = 0;
  }

  objc_autoreleasePoolPop(v47);
  if (v41)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", MEMORY[0x1E0C9AA60]);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40 >= 4)
    {
      v100 = v101;
    }
    else
    {
      objc_msgSend(v111, "contactsWithExceptions");
      v100 = (id)objc_claimAutoreleasedReturnValue();
    }
    v62 = objc_msgSend(v111, "applicationConfigurationType");
    v63 = objc_msgSend(v111, "senderConfigurationType");
    if (v62)
    {
      if (v62 != 2)
      {
        if (v62 != 1)
        {
          v97 = 0;
          v98 = 0;
          v96 = 0;
          v99 = 0;
          goto LABEL_75;
        }
        if (objc_msgSend(v111, "exceptionForApplicationIdentifier:", v18) == 1)
        {
          v99 = 0;
          v97 = 0x100000000;
          v98 = 13;
          v96 = 1;
LABEL_75:
          v65 = objc_msgSend(v111, "senderConfigurationType");
          if (v65)
          {
            if (v65 == 2)
            {
              v76 = 0;
              LODWORD(v67) = 0;
              v77 = 0;
              v71 = 1;
              v69 = 12;
            }
            else if (v65 == 1)
            {
              v120 = 0u;
              v121 = 0u;
              v118 = 0u;
              v119 = 0u;
              v66 = v100;
              v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
              if (v67)
              {
                v68 = *(_QWORD *)v119;
                v69 = 18;
                while (2)
                {
                  for (i = 0; i != v67; ++i)
                  {
                    if (*(_QWORD *)v119 != v68)
                      objc_enumerationMutation(v66);
                    if ((objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * i), "matchesContactHandle:", v24) & 1) != 0)
                    {
                      v71 = 0;
                      LODWORD(v67) = 1;
                      goto LABEL_99;
                    }
                  }
                  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v118, v124, 16);
                  if (v67)
                    continue;
                  break;
                }
              }
              v71 = 1;
              v69 = 12;
LABEL_99:

              v76 = 0;
              v77 = v67;
            }
            else
            {
              v76 = 0;
              LODWORD(v67) = 0;
              v77 = 0;
              v71 = 0;
              v69 = 0;
            }
          }
          else
          {
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            v72 = v100;
            v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
            if (v73)
            {
              v74 = *(_QWORD *)v115;
              v69 = 18;
              while (2)
              {
                for (j = 0; j != v73; ++j)
                {
                  if (*(_QWORD *)v115 != v74)
                    objc_enumerationMutation(v72);
                  if ((objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * j), "matchesContactHandle:", v24) & 1) != 0)
                  {
                    v76 = 1;
                    goto LABEL_101;
                  }
                }
                v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
                if (v73)
                  continue;
                break;
              }
            }
            v76 = 0;
            v69 = 12;
LABEL_101:

            LODWORD(v67) = 0;
            v77 = v76;
            v71 = v76;
          }
          if (v62 == 2)
            v78 = 1;
          else
            v78 = v99;
          v79 = 12;
          if (v63 != 2 || v62 != 2)
            v79 = v98;
          v80 = v63 == 2;
          if (v63 == 2)
            v60 = v79;
          else
            v60 = v69;
          if (v63 == 2)
            v59 = v78;
          else
            v59 = v71;
          if (!v80)
          {
            v81 = v96 | v77;
            v82 = v77 | v96 ^ 1;
            v83 = v82 == 0;
            v84 = v82 ? v69 : v98;
            v85 = v83 ? v99 : v71;
            if (v81 == 1)
            {
              v86 = v85;
            }
            else
            {
              v84 = v69;
              v86 = v71;
            }
            if (v62 != 2)
            {
              v60 = v84;
              v59 = v86;
            }
          }

          if (v76)
            LOBYTE(v61) = 1;
          else
            LOBYTE(v61) = v97;
          if ((_DWORD)v67)
            v58 = 1;
          else
            v58 = BYTE4(v97);
          goto LABEL_131;
        }
      }
      v97 = 0;
      v96 = 0;
      v99 = 1;
    }
    else
    {
      if (!objc_msgSend(v111, "exceptionForApplicationIdentifier:", v18))
      {
        v97 = 1;
        v98 = 13;
        v96 = 1;
        v99 = 1;
        goto LABEL_75;
      }
      v97 = 0;
      v96 = 0;
      v99 = 0;
    }
    v98 = 12;
    goto LABEL_75;
  }
  v56 = objc_msgSend(v111, "applicationConfigurationType");
  if (v56)
  {
    if (v56 == 2)
    {
      LOBYTE(v61) = 0;
      v58 = 0;
      v59 = 1;
      v60 = 12;
    }
    else if (v56 == 1)
    {
      v57 = objc_msgSend(v111, "exceptionForApplicationIdentifier:", v18);
      v58 = v57 == 1;
      v59 = v57 != 1;
      if (v57 == 1)
        v60 = 13;
      else
        v60 = 12;
      if (v103 && objc_msgSend(v111, "exceptionForWebApplicationIdentifier:") == 1)
      {
        LOBYTE(v61) = 0;
        v59 = 0;
        v58 = 1;
        v60 = 13;
      }
      else
      {
        LOBYTE(v61) = 0;
      }
    }
    else
    {
      LOBYTE(v61) = 0;
      v58 = 0;
      v60 = 0;
      v59 = 0;
    }
  }
  else
  {
    v64 = objc_msgSend(v111, "exceptionForApplicationIdentifier:", v18);
    v61 = v64 == 0;
    if (v64)
      v60 = 12;
    else
      v60 = 13;
    if (v103 && !objc_msgSend(v111, "exceptionForWebApplicationIdentifier:"))
    {
      v58 = 0;
      LOBYTE(v61) = 1;
      v60 = 13;
      v59 = 1;
    }
    else
    {
      v58 = 0;
      v59 = v61;
    }
  }
LABEL_131:
  if ((unint64_t)a12 >= 2)
  {
    v87 = a12 == 2 ? v58 : 0;
    if ((v87 & 1) == 0 && (a12 != 3 || !v61))
    {
      v60 = 26;
      v59 = a12 == 2;
    }
  }
  if (v106 && v59 && v108)
  {
    v88 = objc_alloc_init(MEMORY[0x1E0D1D730]);
    v112 = 0;
    v113 = 0;
    v89 = objc_msgSend(v88, "validatePredicate:compileTimeIssues:runTimeIssues:", v108, &v113, &v112);
    v90 = v113;
    v91 = v112;
    if (v89)
    {
      v59 = objc_msgSend(v108, "evaluateWithObject:", v106);
      if (!v59)
        v60 = 25;
    }
    else
    {
      v92 = DNDSLogResolver;
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
      {
        if (v90)
          v95 = v90;
        else
          v95 = v91;
        *(_DWORD *)buf = 138543874;
        v126 = v95;
        v127 = 2112;
        v128 = v110;
        v129 = 2112;
        v130 = v105;
        _os_log_error_impl(&dword_1CB895000, v92, OS_LOG_TYPE_ERROR, "Notification filter predicate from App Context did not validate, issues=%{public}@ bundleIdentifier=%@ modeIdentifier=%@", buf, 0x20u);
      }
      LOBYTE(v59) = 1;
    }

  }
  if ((a11 & v102) != 0)
    v60 = 20;
  v44 = a11 & v102 | v59;
  if (a7 == 1)
  {
    v93 = objc_msgSend(v111, "minimumBreakthroughUrgency");
    if (v93)
      v60 = 19;
    v44 |= v93 != 0;
  }
  else if (a7 == 2)
  {
    objc_msgSend(v111, "minimumBreakthroughUrgency");
    v44 = 1;
    v60 = 19;
  }
  if (a13)
    *a13 = v60;

LABEL_159:
  return v44 & 1;
}

- (BOOL)_queue_isBreakthroughAllowedForSender:(id)a3 eventType:(unint64_t)a4 clientDetails:(id)a5 date:(id)a6 reason:(unint64_t *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  uint8_t v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v18 = 138412290;
    *(_QWORD *)&v18[4] = v12;
    _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Resolving global breakthrough for sender: %@", v18, 0xCu);
  }
  v16 = 0;
  if (v12)
  {
    if (a4 == 1)
    {
      *(_QWORD *)v18 = 0;
      v16 = -[DNDSEventBehaviorResolver _queue_resolveOutcomeForEventSender:clientDetails:date:reason:](self, "_queue_resolveOutcomeForEventSender:clientDetails:date:reason:", v12, v13, v14, v18) == 1;
      if (a7)
        *a7 = *(_QWORD *)v18;
    }
  }

  return v16;
}

- (id)_queue_firstContactForPredicate:(id)a3
{
  id v4;
  CNContactStore *contactStore;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    contactStore = self->_contactStore;
    v6 = *MEMORY[0x1E0C967C0];
    v13[0] = *MEMORY[0x1E0C966E8];
    v13[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v4, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;

    if (v9)
    {
      if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
        -[DNDSEventBehaviorResolver _queue_firstContactForPredicate:].cold.1();
    }
    else if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v10 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)_queue_shouldAdjustEventBehaviorForMirroring
{
  NSObject *v2;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = 0;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Determined whether sharing / mirroring preferences should adjust event behavior; shouldAdjust=%d",
      (uint8_t *)v4,
      8u);
  }
  return 0;
}

- (DNDSEventBehaviorResolverDataSource)dataSource
{
  return (DNDSEventBehaviorResolverDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_resolutionRecord, 0);
  objc_storeStrong((id *)&self->_favorites, 0);
  objc_storeStrong((id *)&self->_localService, 0);
  objc_storeStrong((id *)&self->_intelligentBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_auxiliaryStateMonitor, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_modeRepository, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)resolutionForConfiguration:(id)a3 eventDetails:(id)a4 clientDetails:(id)a5 date:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__2;
  v41 = __Block_byref_object_dispose__2;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2;
  v35 = __Block_byref_object_dispose__2;
  v36 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__DNDSEventBehaviorResolver_Testing__resolutionForConfiguration_eventDetails_clientDetails_date_error___block_invoke;
  block[3] = &unk_1E86A5E30;
  v29 = &v37;
  block[4] = self;
  v17 = v12;
  v25 = v17;
  v18 = v13;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  v30 = &v31;
  dispatch_sync(queue, block);
  if (a7)
  {
    v21 = (void *)v32[5];
    if (v21)
      *a7 = objc_retainAutorelease(v21);
  }
  v22 = (id)v38[5];

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v22;
}

void __103__DNDSEventBehaviorResolver_Testing__resolutionForConfiguration_eventDetails_clientDetails_date_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = *(_QWORD *)(a1[10] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v2, "_queue_resolutionForModeSemanticType:withConfiguration:eventDetails:clientDetails:state:date:error:", 0, v3, v4, v5, 0, v6, &obj);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v7 + 40), obj);
  v9 = *(_QWORD *)(a1[9] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)_queue_resolveBehaviorForEventDetails:(void *)a1 clientDetails:(void *)a2 date:error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "activeModeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1CB895000, v3, OS_LOG_TYPE_ERROR, "Couldn't find mode configuration for active mode: %{public}@.", v5, 0xCu);

}

- (void)_queue_eventSourceIsFavorite:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error looking up favorite contacts: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_eventSourceIsContact:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error looking up contacts: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_eventSourceIsContact:inGroupWithIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error looking up group contacts: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_eventSourceIsEmergencyContact:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error looking up emergency contacts: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_isBreakthroughAllowedForModeIdentifier:(uint64_t)a3 withConfiguration:(uint64_t)a4 application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:.cold.1(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = objc_begin_catch(a1);
  v7 = DNDSLogResolver;
  if (os_log_type_enabled((os_log_t)DNDSLogResolver, OS_LOG_TYPE_ERROR))
  {
    v8 = 138543874;
    v9 = v6;
    v10 = 2112;
    v11 = a3;
    v12 = 2112;
    v13 = a4;
    _os_log_error_impl(&dword_1CB895000, v7, OS_LOG_TYPE_ERROR, "Notification filter predicate from App Context threw during evaluation, exception=%{public}@ bundleIdentifier=%@ modeIdentifier=%@", (uint8_t *)&v8, 0x20u);
  }

  objc_end_catch();
}

- (void)_queue_isBreakthroughAllowedForModeIdentifier:(void *)a3 withConfiguration:application:sender:urgency:eventType:threadIdentifier:filterCriteria:notifyAnyway:intelligentBehavior:reason:.cold.2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v5, v7, "Failed to retrieve an LSApplicationRecord for bundleIdentifier:%@; error=%@",
    (uint8_t *)&v8);

}

- (void)_queue_firstContactForPredicate:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v1, (uint64_t)v1, "Failed to lookup contact in address book. predicate=%{public}@, error=%{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
