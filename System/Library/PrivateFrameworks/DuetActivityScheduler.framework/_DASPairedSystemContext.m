@implementation _DASPairedSystemContext

- (void)handleAppStateChange
{
  _BOOL4 v3;
  void *v4;
  _CDContext *context;
  void *v6;
  void *v7;
  _CDContext *v8;
  void *v9;
  void *v10;
  _CDContext *v11;
  void *v12;
  void *v13;
  _CDContext *v14;
  void *v15;
  void *v16;
  _CDContext *v17;
  void *v18;
  void *v19;
  NSMutableSet *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  NSObject *callbackQueue;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[_DASPairedSystemContext handleWatchAppBackgrounded](self, "handleWatchAppBackgrounded");
  v3 = -[_DASPairedSystemContext didHandleExclusiveAppChange](self, "didHandleExclusiveAppChange");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForForegroundApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_msgSend((id)kAlwaysAllowedPhoneApps, "containsObject:", v7) & 1) != 0)
    {
      objc_msgSend(v4, "addObject:", v7);
    }
    else
    {

      v7 = 0;
    }
  }
  v8 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceForegroundApp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "addObject:", v10);
  v11 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForServicesAppearingForeground");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    objc_msgSend(v4, "addObjectsFromArray:", v13);
  v14 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedServicesAppearingForeground");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v4, "addObjectsFromArray:", v16);
  v17 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForActiveComplications");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v4, "addObjectsFromArray:", v19);
  v20 = self->_previousForegroundApps;
  objc_sync_enter(v20);
  if (((-[NSMutableSet isEqual:](self->_previousForegroundApps, "isEqual:", v4) | v3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v19;
    v31 = v16;
    v32 = v7;
    v33 = v10;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v22 = v4;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          if ((-[NSMutableSet containsObject:](self->_previousForegroundApps, "containsObject:", v26, v30, v31, v32) & 1) == 0
            && (objc_msgSend((id)kIgnoredApps, "containsObject:", v26) & 1) == 0)
          {
            objc_msgSend(v21, "addObject:", v26);
          }
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v23);
    }

    v7 = v32;
    v10 = v33;
    v19 = v30;
    v16 = v31;
    if (objc_msgSend(v21, "count"))
    {
      v27 = (void *)objc_msgSend(v21, "copy");
      callbackQueue = self->_callbackQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47___DASPairedSystemContext_handleAppStateChange__block_invoke;
      block[3] = &unk_1E624B688;
      block[4] = self;
      v35 = v27;
      v29 = v27;
      dispatch_async(callbackQueue, block);

      v10 = v33;
    }
    -[NSMutableSet removeAllObjects](self->_previousForegroundApps, "removeAllObjects", v30, v31, v32);
    -[NSMutableSet unionSet:](self->_previousForegroundApps, "unionSet:", v22);

  }
  objc_sync_exit(v20);

}

- (void)handleWatchAppBackgrounded
{
  _CDContext *context;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *recentlyBackgroundedApps;
  NSObject *log;
  NSMutableDictionary *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  __int128 *p_buf;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceForegroundApp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_DASPairedSystemContext foregroundWatchApp](self, "foregroundWatchApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (!v5 || (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0))
  {
    v8 = self->_recentlyBackgroundedApps;
    objc_sync_enter(v8);
    if ((unint64_t)-[NSMutableDictionary count](self->_recentlyBackgroundedApps, "count") >= 0xA)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v23 = 0x3032000000;
      v24 = __Block_byref_object_copy_;
      v25 = __Block_byref_object_dispose_;
      v26 = v7;
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy_;
      v20 = __Block_byref_object_dispose_;
      v21 = 0;
      recentlyBackgroundedApps = self->_recentlyBackgroundedApps;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53___DASPairedSystemContext_handleWatchAppBackgrounded__block_invoke;
      v12[3] = &unk_1E624B660;
      v13 = v26;
      v14 = &v16;
      p_buf = &buf;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](recentlyBackgroundedApps, "enumerateKeysAndObjectsUsingBlock:", v12);
      if (v17[5])
        -[NSMutableDictionary removeObjectForKey:](self->_recentlyBackgroundedApps, "removeObjectForKey:");

      _Block_object_dispose(&v16, 8);
      _Block_object_dispose(&buf, 8);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_recentlyBackgroundedApps, "setObject:forKeyedSubscript:", v7, v6);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v11 = self->_recentlyBackgroundedApps;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_INFO, "Recently backgrounded apps: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_sync_exit(v8);

  }
  -[_DASPairedSystemContext setForegroundWatchApp:](self, "setForegroundWatchApp:", v5);

}

- (void)setForegroundWatchApp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)foregroundWatchApp
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (BOOL)didHandleExclusiveAppChange
{
  void *v3;
  _CDContext *context;
  void *v5;
  void *v6;
  _CDContext *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *callbackQueue;
  id v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  _QWORD v20[5];
  _QWORD block[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceForegroundApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedServicesAppearingForeground");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  if (v9)
    objc_msgSend(v3, "addObjectsFromArray:", v9);
  -[_DASPairedSystemContext previousExclusiveIdentifiers](self, "previousExclusiveIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v3;
  callbackQueue = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (callbackQueue)
  {
    v19 = v6;
    v13 = 0;
    v14 = *(_QWORD *)v24;
    while (2)
    {
      v15 = 0;
      v16 = v13;
      do
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend((id)kExclusiveApps, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15), v19);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 && (objc_msgSend(v10, "isEqualToArray:", v13) & 1) == 0)
        {
          callbackQueue = self->_callbackQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke;
          block[3] = &unk_1E624B688;
          block[4] = self;
          v13 = v13;
          v22 = v13;
          dispatch_async(callbackQueue, block);

          LOBYTE(callbackQueue) = 1;
          goto LABEL_16;
        }
        v15 = ((char *)v15 + 1);
        v16 = v13;
      }
      while (callbackQueue != v15);
      callbackQueue = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (callbackQueue)
        continue;
      break;
    }
LABEL_16:
    v6 = v19;
  }
  else
  {
    v13 = 0;
  }

  if (objc_msgSend(v10, "count") && !objc_msgSend(v13, "count"))
  {
    v17 = self->_callbackQueue;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54___DASPairedSystemContext_didHandleExclusiveAppChange__block_invoke_2;
    v20[3] = &unk_1E624B598;
    v20[4] = self;
    dispatch_async(v17, v20);
    LOBYTE(callbackQueue) = 1;
  }
  -[_DASPairedSystemContext setPreviousExclusiveIdentifiers:](self, "setPreviousExclusiveIdentifiers:", v13);

  return (char)callbackQueue;
}

- (void)setPreviousExclusiveIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSArray)previousExclusiveIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (id)onConditionsChange
{
  return self->_onConditionsChange;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (BOOL)isWatchPluggedIn
{
  _CDContext *context;
  void *v3;
  void *v4;
  char v5;

  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDevicePluginStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)handleConditionChange
{
  _CDContext *context;
  void *v4;
  void *v5;
  int v6;
  _CDContext *v7;
  void *v8;
  void *v9;
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *callbackQueue;
  uint64_t *p_block;
  char v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  _DASPairedSystemContext *v25;
  uint64_t block;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  _DASPairedSystemContext *v30;

  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForThermalPressureLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  v7 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceThermalPressureLevel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  if (v6 <= v10)
    v6 = v10;
  v11 = -[_DASPairedSystemContext isWatchPluggedIn](self, "isWatchPluggedIn");
  v12 = -[_DASPairedSystemContext watchBatteryLevel](self, "watchBatteryLevel");
  -[_DASPairedSystemContext usageThresholdForPriority:batteryLevel:isPluggedIn:](self, "usageThresholdForPriority:batteryLevel:isPluggedIn:", 50, v12, v11);
  v14 = v13;
  -[_DASPairedSystemContext usageThresholdForPriority:batteryLevel:isPluggedIn:](self, "usageThresholdForPriority:batteryLevel:isPluggedIn:", 10, v12, v11);
  v16 = v15;
  if (v6 < self->_previousMaxThermalPressure
    || v14 < self->_previousDefaultThreshold
    || v15 < self->_previousSyncThreshold)
  {
    callbackQueue = self->_callbackQueue;
    block = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __48___DASPairedSystemContext_handleConditionChange__block_invoke;
    v29 = &unk_1E624B598;
    v30 = self;
    p_block = &block;
LABEL_7:
    dispatch_async(callbackQueue, p_block);
    goto LABEL_8;
  }
  if (!self->_previousPluginStatus && v11)
  {
    callbackQueue = self->_callbackQueue;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __48___DASPairedSystemContext_handleConditionChange__block_invoke_2;
    v24 = &unk_1E624B598;
    v25 = self;
    p_block = &v21;
    goto LABEL_7;
  }
LABEL_8:
  self->_previousMaxThermalPressure = v6;
  self->_previousDefaultThreshold = v14;
  self->_previousSyncThreshold = v16;
  v19 = !v11;
  if ((int)v12 < 91)
    v19 = 1;
  if ((v19 & 1) == 0 && (!self->_previousPluginStatus || self->_previousBatteryLevel <= 90.0))
    -[_DASPairedSystemContext resetBudgetForRecentlyBackgroundedAppSyncTraffic](self, "resetBudgetForRecentlyBackgroundedAppSyncTraffic", v21, v22, v23, v24, v25, block, v27, v28, v29, v30);
  self->_previousPluginStatus = v11;
  self->_previousBatteryLevel = (double)(int)v12;
}

+ (void)initialize
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)kExclusiveApps;
  kExclusiveApps = (uint64_t)&unk_1E62595B0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6259550);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)kAlwaysAllowedPhoneApps;
  kAlwaysAllowedPhoneApps = v3;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6259568);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)kIgnoredApps;
  kIgnoredApps = v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6259580);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)kUsageIgnoredApps;
  kUsageIgnoredApps = v7;

}

- (_DASPairedSystemContext)initWithClientIdentifier:(id)a3 context:(id)a4 knowledgeStore:(id)a5 callbackQueue:(id)a6 systemConditionChangeCallback:(id)a7 trafficCancelationHander:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  os_log_t v21;
  void *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  dispatch_queue_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  dispatch_source_t v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  int *v47;
  dispatch_block_t v48;
  NSObject *v49;
  dispatch_time_t v50;
  const char *v51;
  id v53;
  id v54;
  _QWORD handler[4];
  int *v56;
  _QWORD block[4];
  int *v58;
  objc_super v59;

  v15 = a3;
  v54 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v59.receiver = self;
  v59.super_class = (Class)_DASPairedSystemContext;
  v20 = -[_DASPairedSystemContext init](&v59, sel_init);
  if (v20)
  {
    v21 = os_log_create("com.apple.dass", "pairedsystemcontext");
    v22 = (void *)*((_QWORD *)v20 + 22);
    *((_QWORD *)v20 + 22) = v21;

    objc_storeStrong((id *)v20 + 6, a3);
    objc_storeStrong((id *)v20 + 3, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("com.apple.daspairedsystemcontext.handlerQueue", v23);
    v25 = (void *)*((_QWORD *)v20 + 4);
    *((_QWORD *)v20 + 4) = v24;

    objc_storeStrong((id *)v20 + 5, a5);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v20 + 7);
    *((_QWORD *)v20 + 7) = v26;

    v53 = v15;
    if (v17)
    {
      v28 = v17;
      v29 = *((_QWORD *)v20 + 8);
      *((_QWORD *)v20 + 8) = v28;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = dispatch_queue_create("com.apple.daspairedsystemcontext.callbackQueue", v29);
      v31 = (void *)*((_QWORD *)v20 + 8);
      *((_QWORD *)v20 + 8) = v30;

    }
    v32 = MEMORY[0x1B5E11660](v18);
    v33 = (void *)*((_QWORD *)v20 + 9);
    *((_QWORD *)v20 + 9) = v32;

    v34 = MEMORY[0x1B5E11660](v19);
    v35 = (void *)*((_QWORD *)v20 + 10);
    *((_QWORD *)v20 + 10) = v34;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)*((_QWORD *)v20 + 14);
    *((_QWORD *)v20 + 14) = v36;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v20 + 16);
    *((_QWORD *)v20 + 16) = v38;

    objc_msgSend(v20, "readBudgetForRecentlyBackgroundedAppSyncTraffic");
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v20 + 18);
    *((_QWORD *)v20 + 18) = v40;

    dispatch_get_global_queue(-32768, 0);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v42);
    v44 = (void *)*((_QWORD *)v20 + 21);
    *((_QWORD *)v20 + 21) = v43;

    v45 = *((_QWORD *)v20 + 21);
    v46 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke;
    block[3] = &unk_1E624B598;
    v47 = (int *)v20;
    v58 = v47;
    v48 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_INHERIT_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v45, v48);

    v49 = *((_QWORD *)v20 + 21);
    v50 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v49, v50, 0x34630B8A000uLL, 0xD18C2E2800uLL);
    dispatch_activate(*((dispatch_object_t *)v20 + 21));
    objc_msgSend(v47, "updateAppUsageHistory");
    objc_msgSend(v47, "registerForContextChanges");
    v51 = (const char *)objc_msgSend(CFSTR("com.apple.dasd.pairedsystemcontext.deleteremoteforecast"), "UTF8String");
    handler[0] = v46;
    handler[1] = 3221225472;
    handler[2] = __144___DASPairedSystemContext_initWithClientIdentifier_context_knowledgeStore_callbackQueue_systemConditionChangeCallback_trafficCancelationHander___block_invoke_2;
    handler[3] = &unk_1E624B5C0;
    v56 = v47;
    notify_register_dispatch(v51, v47 + 5, v42, handler);

    v15 = v53;
  }

  return (_DASPairedSystemContext *)v20;
}

+ (id)contextWithClientIdentifier:(id)a3 callbackQueue:(id)a4 systemConditionChangeCallback:(id)a5 trafficCancelationHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __125___DASPairedSystemContext_contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler___block_invoke;
  block[3] = &unk_1E624B5E8;
  v25 = v13;
  v26 = a1;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v14 = contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__onceToken;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  if (v14 != -1)
    dispatch_once(&contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__onceToken, block);
  v19 = (id)contextWithClientIdentifier_callbackQueue_systemConditionChangeCallback_trafficCancelationHandler__pairedSystemContext;

  return v19;
}

+ (id)stringForPriority:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Sync");
  if (a3 > 0x31)
    v3 = CFSTR("Default");
  if (a3 <= 0x59)
    return (id)v3;
  else
    return CFSTR("Urgent");
}

+ (id)stringForThermalLevel:(int)a3
{
  __CFString *v3;

  if (a3 > 29)
  {
    switch(a3)
    {
      case 30:
        return CFSTR("Heavy");
      case 40:
        return CFSTR("Trapping");
      case 50:
        return CFSTR("Sleeping");
    }
    goto LABEL_16;
  }
  if (!a3)
    return CFSTR("Nominal");
  if (a3 == 10)
    return CFSTR("Light");
  if (a3 != 20)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v3 = CFSTR("@Moderate");
  return v3;
}

- (void)registerForContextChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *identifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[4];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForPluginStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v3;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForBatteryLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v4;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForThermalPressureLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v5;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDevicePluginStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v6;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceBatteryLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v34[4] = v7;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceThermalPressureLevel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[5] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C88], "predicateForChangeAtKeyPaths:", v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.system.pairedSystemContext"), self->_identifier);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke;
  v32[3] = &unk_1E624B610;
  v32[4] = self;
  objc_msgSend(MEMORY[0x1E0D15C68], "localNonWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v27, v28, identifier, v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext registerCallback:](self->_context, "registerCallback:", v26);
  self->_previousPluginStatus = -[_DASPairedSystemContext isWatchPluggedIn](self, "isWatchPluggedIn");
  self->_previousBatteryLevel = (double)-[_DASPairedSystemContext watchBatteryLevel](self, "watchBatteryLevel");
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceForegroundApp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v10;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForServicesAppearingForeground");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v11;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedServicesAppearingForeground");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v12;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForActiveComplications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D15C88], "predicateForChangeAtKeyPaths:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.apps.pairedSystemContext"), self->_identifier);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_identifier;
  v18 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_3;
  v31[3] = &unk_1E624B610;
  v31[4] = self;
  objc_msgSend(MEMORY[0x1E0D15C68], "localNonWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:", v16, v15, v17, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext registerCallback:](self->_context, "registerCallback:", v19);
  v20 = (void *)MEMORY[0x1E0D15C88];
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForForegroundApp");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForForegroundApp");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "predicateForKeyPath:withFormat:", v21, CFSTR("self.%@.value in %@"), v22, kAlwaysAllowedPhoneApps);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.alwaysAllowedApps.pairedsystemContext"), self->_identifier);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v18;
  v30[1] = 3221225472;
  v30[2] = __52___DASPairedSystemContext_registerForContextChanges__block_invoke_5;
  v30[3] = &unk_1E624B638;
  v30[4] = self;
  objc_msgSend(MEMORY[0x1E0D15C68], "localNonWakingRegistrationWithIdentifier:contextualPredicate:callback:", v24, v23, v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext registerCallback:](self->_context, "registerCallback:", v25);

}

- (BOOL)allowsSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 isReunionOrInitialSync:(BOOL)a5 responseValidityDuration:(double *)a6
{
  _BOOL4 v7;
  id v10;
  BOOL v11;
  BOOL v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NSObject *log;
  BOOL v20;
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v7 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (a6)
    *a6 = 900.0;
  if (a4 > 0x59 || v7)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v14 = log;
      +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v10;
      v25 = 2112;
      v26 = v15;
      v27 = 1024;
      v28 = v7;
      v16 = "ALLOWED: %@, Priority=%@, Is Reunion/Initial Sync: %u";
      v17 = v14;
      v18 = 28;
      goto LABEL_13;
    }
LABEL_14:
    v20 = 1;
    goto LABEL_17;
  }
  v22 = 0;
  v11 = -[_DASPairedSystemContext foregroundApplicationsAllowSendingTrafficForServiceIdentifiers:atPriorityLevel:furtherChecksNecessary:](self, "foregroundApplicationsAllowSendingTrafficForServiceIdentifiers:atPriorityLevel:furtherChecksNecessary:", v10, a4, &v22);
  if (!v22)
  {
    v20 = v11;
    goto LABEL_17;
  }
  if (!-[_DASPairedSystemContext thermalLevelsAllowSendingTrafficeForServiceIdentifiers:atPriorityLevel:](self, "thermalLevelsAllowSendingTrafficeForServiceIdentifiers:atPriorityLevel:", v10, a4))
  {
LABEL_15:
    v20 = 0;
    goto LABEL_17;
  }
  v12 = -[_DASPairedSystemContext thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:atPriorityLevel:furtherChecksNecessary:](self, "thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:atPriorityLevel:furtherChecksNecessary:", v10, a4, &v22);
  if (v22)
  {
    if (-[_DASPairedSystemContext batteryLevelsAllowSendingTrafficeForServiceIdentifiers:atPriorityLevel:](self, "batteryLevelsAllowSendingTrafficeForServiceIdentifiers:atPriorityLevel:", v10, a4))
    {
      v13 = self->_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v10;
        v25 = 2112;
        v26 = v15;
        v16 = "ALLOWED: %@, Priority=%@";
        v17 = v14;
        v18 = 22;
LABEL_13:
        _os_log_impl(&dword_1B0DF4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);

        goto LABEL_14;
      }
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v20 = v12;
  if (a6)
    *a6 = 120.0;
LABEL_17:

  return v20;
}

- (BOOL)foregroundApplicationsAllowSendingTrafficForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 furtherChecksNecessary:(BOOL *)a5
{
  id v7;
  void *v8;
  _CDContext *context;
  void *v10;
  void *v11;
  _CDContext *v12;
  void *v13;
  void *v14;
  _CDContext *v15;
  void *v16;
  void *v17;
  void *v18;
  _CDContext *v19;
  void *v20;
  void *v21;
  NSObject *log;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  BOOL v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _CDContext *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  BOOL *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v48 = a5;
  *a5 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceForegroundApp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForForegroundApp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend(v8, "addObject:", v11);
  if (v14)
  {
    if (objc_msgSend((id)kAlwaysAllowedPhoneApps, "containsObject:", v14))
    {
      objc_msgSend(v8, "addObject:", v14);
    }
    else
    {

      v14 = 0;
    }
  }
  v15 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForServicesAppearingForeground");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D20], "array:withItemsIn:", v17, kAlwaysAllowedPhoneApps);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v8, "addObjectsFromArray:", v18);
  v19 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedServicesAppearingForeground");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v8, "addObjectsFromArray:", v21);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v23 = log;
    +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v58 = v7;
    v59 = 2112;
    v60 = v24;
    v61 = 2112;
    v62 = v14;
    v63 = 2112;
    v64 = v11;
    v65 = 2112;
    v66 = v18;
    v67 = 2112;
    v68 = v21;
    _os_log_impl(&dword_1B0DF4000, v23, OS_LOG_TYPE_DEFAULT, "CHECKING: %@, Priority=%@, Phone Foreground: %@, Watch Foreground: %@, Foreground Services: %@, Remote Foreground Services: %@", buf, 0x3Eu);

  }
  if (a4 >= 0x32
    && ((objc_msgSend(v7, "containsObject:", v14) & 1) != 0
     || v18 && objc_msgSend(v18, "anyItemsIntersectArray:", v7)))
  {
    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = v25;
      +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
      v27 = v11;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v58 = v7;
      v59 = 2112;
      v60 = v28;
      v61 = 2112;
      v62 = v14;
      v63 = 2112;
      v64 = v18;
      v65 = 2112;
      v66 = v21;
      _os_log_impl(&dword_1B0DF4000, v26, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Phone Foreground: %@, Foreground Services: %@, Remote Foreground Services: %@", buf, 0x34u);

      v11 = v27;
    }
    v29 = 1;
  }
  else
  {
    v49 = v11;
    v50 = v8;
    v51 = v7;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v30 = v8;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v54;
LABEL_22:
      v34 = 0;
      while (1)
      {
        if (*(_QWORD *)v54 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend((id)kExclusiveApps, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * v34));
        v35 = objc_claimAutoreleasedReturnValue();
        if (v35)
          break;
        if (v32 == ++v34)
        {
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
          if (v32)
            goto LABEL_22;
          goto LABEL_28;
        }
      }
      v38 = (void *)v35;

      v7 = v51;
      if (a4 >= 0x32 && objc_msgSend(v51, "anyItemsIntersectArray:", v38))
      {
        v42 = self->_log;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v42;
          +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v58 = v51;
          v59 = 2112;
          v60 = v43;
          v61 = 2112;
          v62 = v14;
          v63 = 2112;
          v64 = v49;
          v65 = 2112;
          v66 = v18;
          _os_log_impl(&dword_1B0DF4000, v40, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Phone Foreground: %@, Watch Foreground: %@, Foreground Services: %@", buf, 0x34u);

          v11 = v49;
          goto LABEL_37;
        }
        v29 = 1;
      }
      else
      {
        v44 = self->_log;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = v44;
          +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v58 = v51;
          v59 = 2112;
          v60 = v46;
          v61 = 2112;
          v62 = v14;
          v63 = 2112;
          v64 = v49;
          v65 = 2112;
          v66 = v18;
          _os_log_impl(&dword_1B0DF4000, v45, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Phone Foreground: %@, Watch Foreground: %@, Foreground Services: %@", buf, 0x34u);

          v11 = v49;
          v29 = 0;
          goto LABEL_45;
        }
        v29 = 0;
      }
      v11 = v49;
    }
    else
    {
LABEL_28:

      v36 = self->_context;
      objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForActiveComplications");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CDContext objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
        objc_msgSend(v30, "addObjectsFromArray:", v38);
      v7 = v51;
      v11 = v49;
      if (objc_msgSend(v51, "anyItemsIntersectArray:", v30))
      {
        v39 = self->_log;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = v39;
          +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413826;
          v58 = v51;
          v59 = 2112;
          v60 = v41;
          v61 = 2112;
          v62 = v49;
          v63 = 2112;
          v64 = v14;
          v65 = 2112;
          v66 = v38;
          v67 = 2112;
          v68 = v18;
          v69 = 2112;
          v70 = v21;
          _os_log_impl(&dword_1B0DF4000, v40, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Watch Focal Application: %@, Phone Focal Application: %@, Active Complications: %@, Foreground Services: %@, Remote Services: %@,", buf, 0x48u);

          v7 = v51;
LABEL_37:

        }
        v29 = 1;
      }
      else
      {
        v29 = 1;
        *v48 = 1;
      }
    }
LABEL_45:

    v8 = v50;
  }

  return v29;
}

- (int)watchBatteryLevel
{
  _CDContext *context;
  void *v3;
  void *v4;
  int v5;

  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceBatteryLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "intValue");
  else
    v5 = 100;

  return v5;
}

- (BOOL)thermalLevelsAllowSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4
{
  id v6;
  _CDContext *context;
  void *v8;
  void *v9;
  uint64_t v10;
  _CDContext *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  unsigned int v19;
  NSObject *log;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v32;
  unint64_t v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  _BOOL4 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForThermalPressureLevel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](context, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  v11 = self->_context;
  objc_msgSend(MEMORY[0x1E0D15C50], "keyPathForDefaultPairedDeviceThermalPressureLevel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDContext objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "unsignedIntValue");

  if (v10 <= v14)
    v15 = v14;
  else
    v15 = v10;
  v16 = -[_DASPairedSystemContext isWatchPluggedIn](self, "isWatchPluggedIn");
  v17 = v16;
  v33 = a4;
  if (a4 > 0x31 || v16)
    v19 = 30;
  else
    v19 = 20;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v21 = log;
    +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DASPairedSystemContext stringForThermalLevel:](_DASPairedSystemContext, "stringForThermalLevel:", v10);
    v32 = v15;
    v23 = v6;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[_DASPairedSystemContext stringForThermalLevel:](_DASPairedSystemContext, "stringForThermalLevel:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v35 = v23;
    v36 = 2112;
    v37 = v22;
    v38 = 2112;
    v39 = v24;
    v40 = 2112;
    v41 = v25;
    v42 = 1024;
    v43 = v17;
    _os_log_impl(&dword_1B0DF4000, v21, OS_LOG_TYPE_DEFAULT, "CHECKING: %@, Priority=%@, Local Thermals: %@, Paired Thermals: %@, Watch Plugged In: %u", buf, 0x30u);

    v6 = v23;
    v15 = v32;

  }
  if (v15 >= v19)
  {
    v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASPairedSystemContext stringForThermalLevel:](_DASPairedSystemContext, "stringForThermalLevel:", v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[_DASPairedSystemContext stringForThermalLevel:](_DASPairedSystemContext, "stringForThermalLevel:", v14);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v35 = v6;
      v36 = 2112;
      v37 = v28;
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = v30;
      v42 = 1024;
      v43 = v17;
      _os_log_impl(&dword_1B0DF4000, v27, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Local Thermals: %@, Paired Thermals: %@, Watch Plugged In: %u", buf, 0x30u);

    }
  }

  return v15 < v19;
}

- (void)readBudgetForRecentlyBackgroundedAppSyncTraffic
{
  void *v3;
  int v4;
  NSUserDefaults *obj;

  obj = self->_persistence;
  objc_sync_enter(obj);
  -[NSUserDefaults valueForKey:](self->_persistence, "valueForKey:", CFSTR("das.recentSyncBudget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[NSUserDefaults integerForKey:](self->_persistence, "integerForKey:", CFSTR("das.recentSyncBudget"));
  else
    v4 = 25;
  self->_recentTrafficSyncRequests = v4;
  objc_sync_exit(obj);

}

- (void)resetBudgetForRecentlyBackgroundedAppSyncTraffic
{
  NSUserDefaults *obj;

  obj = self->_persistence;
  objc_sync_enter(obj);
  if (self->_recentTrafficSyncRequests <= 24)
  {
    self->_recentTrafficSyncRequests = 25;
    -[NSUserDefaults setInteger:forKey:](self->_persistence, "setInteger:forKey:", 25, CFSTR("das.recentSyncBudget"));
  }
  objc_sync_exit(obj);

}

- (BOOL)allowSyncTrafficForRecentlyBackgroundedApp
{
  NSUserDefaults *v3;
  int recentTrafficSyncRequests;
  NSObject *log;
  int v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = self->_persistence;
  objc_sync_enter(v3);
  recentTrafficSyncRequests = self->_recentTrafficSyncRequests;
  if (recentTrafficSyncRequests >= 1)
  {
    -[NSUserDefaults setInteger:forKey:](self->_persistence, "setInteger:forKey:", (recentTrafficSyncRequests - 1), CFSTR("das.recentSyncBudget"));
    --self->_recentTrafficSyncRequests;
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_recentTrafficSyncRequests;
      v8[0] = 67109120;
      v8[1] = v6;
      _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, "%d more background sync requests allowed", (uint8_t *)v8, 8u);
    }
  }
  objc_sync_exit(v3);

  return recentTrafficSyncRequests > 0;
}

- (void)setWatchKitStatus:(BOOL)a3 forApplication:(id)a4
{
  _BOOL8 v4;
  NSMutableDictionary *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v6 = self->_watchKitAppStatus;
  objc_sync_enter(v6);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchKitAppStatus, "setObject:forKeyedSubscript:", v7, v8);

  objc_sync_exit(v6);
}

- (BOOL)isAnyThirdPartyApp:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  dispatch_semaphore_t v13;
  void *v14;
  NSObject *v15;
  dispatch_time_t v16;
  BOOL v17;
  char v18;
  NSObject *v19;
  const __CFString *v20;
  BOOL v21;
  _QWORD v23[5];
  NSObject *v24;
  uint64_t v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = a3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = self->_watchKitAppStatus;
        objc_sync_enter(v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_watchKitAppStatus, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_exit(v10);

        if (v11)
        {
          v18 = objc_msgSend(v11, "BOOLValue");
          *((_BYTE *)v32 + 24) = v18;
          -[_DASPairedSystemContext log](self, "log");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            if (*((_BYTE *)v32 + 24))
              v20 = &stru_1E624C4F8;
            else
              v20 = CFSTR(" NOT");
            *(_DWORD *)buf = 138412546;
            v36 = v9;
            v37 = 2112;
            v38 = v20;
            _os_log_impl(&dword_1B0DF4000, v19, OS_LOG_TYPE_INFO, "%@ is%@ a WatchKit app", buf, 0x16u);
          }

LABEL_19:
          goto LABEL_20;
        }
        if (!v5)
        {
          objc_msgSend(MEMORY[0x1E0D51840], "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "getActivePairedDevice");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v13 = dispatch_semaphore_create(0);
        objc_msgSend(MEMORY[0x1E0CF8850], "sharedDeviceConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __46___DASPairedSystemContext_isAnyThirdPartyApp___block_invoke;
        v23[3] = &unk_1E624B6B0;
        v23[4] = self;
        v15 = v13;
        v24 = v15;
        v25 = v9;
        v26 = &v31;
        objc_msgSend(v14, "fetchInfoForApplicationWithBundleID:forPairedDevice:completion:", v9, v5, v23);

        v16 = dispatch_time(0, 1000000000);
        dispatch_semaphore_wait(v15, v16);
        v17 = *((_BYTE *)v32 + 24) == 0;

        if (!v17)
          goto LABEL_19;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_20:

  v21 = *((_BYTE *)v32 + 24) != 0;
  _Block_object_dispose(&v31, 8);

  return v21;
}

- (BOOL)thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4 furtherChecksNecessary:(BOOL *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  NSObject *v17;
  BOOL v18;
  _BOOL4 v19;
  NSObject *log;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  int recentTrafficSyncRequests;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  int v30;
  NSMutableDictionary *obj;
  unint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  int v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = v8;
  if (!-[_DASPairedSystemContext isWatchPluggedIn](self, "isWatchPluggedIn")
    && -[_DASPairedSystemContext isAnyThirdPartyApp:](self, "isAnyThirdPartyApp:", v8))
  {
    v33 = a4;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    obj = self->_recentlyBackgroundedApps;
    objc_sync_enter(obj);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v8;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_recentlyBackgroundedApps, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "timeIntervalSinceDate:", v15);
            if (v16 < 120.0)
            {
              v11 = v14;
              goto LABEL_18;
            }
            -[NSMutableDictionary removeObjectForKey:](self->_recentlyBackgroundedApps, "removeObjectForKey:", v14);

          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
        if (v11)
          continue;
        break;
      }
    }
    v15 = 0;
LABEL_18:

    objc_sync_exit(obj);
    if (v15)
    {
      *a5 = 0;
      if (v33 > 0x31)
      {
LABEL_23:
        v18 = 1;
        goto LABEL_31;
      }
      v19 = -[_DASPairedSystemContext allowSyncTrafficForRecentlyBackgroundedApp](self, "allowSyncTrafficForRecentlyBackgroundedApp");
      log = self->_log;
      v21 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v21)
        {
          v22 = log;
          +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", v33);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          recentTrafficSyncRequests = self->_recentTrafficSyncRequests;
          *(_DWORD *)buf = 138413314;
          v40 = v10;
          v41 = 2112;
          v42 = v23;
          v43 = 2112;
          v44 = v11;
          v45 = 2112;
          v46 = v15;
          v47 = 1024;
          v48 = recentTrafficSyncRequests;
          _os_log_impl(&dword_1B0DF4000, v22, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, %@ backgrounded at: %@, Syncs Remaining: %d", buf, 0x30u);

        }
        goto LABEL_23;
      }
      if (v21)
      {
        v28 = log;
        +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = self->_recentTrafficSyncRequests;
        *(_DWORD *)buf = 138413314;
        v40 = v10;
        v41 = 2112;
        v42 = v29;
        v43 = 2112;
        v44 = v11;
        v45 = 2112;
        v46 = v15;
        v47 = 1024;
        v48 = v30;
        _os_log_impl(&dword_1B0DF4000, v28, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, %@ backgrounded at: %@, Syncs Remaining: %d", buf, 0x30u);

      }
    }
    else
    {
      if (v33 > 0x31)
      {
        v18 = 1;
        *a5 = 1;
        goto LABEL_31;
      }
      *a5 = 0;
      v25 = self->_log;
      v18 = 0;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        goto LABEL_32;
      }
      v26 = v25;
      +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v10;
      v41 = 2112;
      v42 = v27;
      _os_log_impl(&dword_1B0DF4000, v26, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, No app backgrounded recently", buf, 0x16u);

    }
    v18 = 0;
    goto LABEL_31;
  }
  v17 = self->_log;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[_DASPairedSystemContext thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:atPriorityLevel:furtherChecksNecessary:].cold.1(v17);
  v18 = 1;
  *a5 = 1;
LABEL_32:

  return v18;
}

- (void)deleteRemoteHistogram
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1B5E114F8](self, a2));
}

- (id)pairedDeviceStream
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15A10];
  objc_msgSend(MEMORY[0x1E0D15988], "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStreamWithName:valueType:", CFSTR("PairedDeviceForecast"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)updateAppUsageHistory
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v13;
  id v14;
  NSObject *log;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1B5E114F8](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  v8 = (void *)MEMORY[0x1E0D15A30];
  -[_DASPairedSystemContext pairedDeviceStream](self, "pairedDeviceStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "histogramQueryForStream:interval:withPredicate:", v9, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIncludeLocalResults:", 0);
  objc_msgSend(v11, "setIncludeRemoteResults:", 1);
  knowledgeStore = self->_knowledgeStore;
  v20 = 0;
  -[_DKKnowledgeQuerying executeQuery:error:](knowledgeStore, "executeQuery:error:", v11, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (v14)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v14;
      _os_log_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEFAULT, "Error obtaining results for app usage history: %@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v13, "countDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_DASPairedSystemContext setRemoteAppLaunchCount:](self, "setRemoteAppLaunchCount:", v16);

    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      -[_DASPairedSystemContext remoteAppLaunchCount](self, "remoteAppLaunchCount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v22 = v19;
      _os_log_impl(&dword_1B0DF4000, v18, OS_LOG_TYPE_DEFAULT, "Obtained results for histogram: %@", buf, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v3);
}

- (double)usageThresholdForPriority:(unint64_t)a3 batteryLevel:(int)a4 isPluggedIn:(BOOL)a5
{
  double result;
  double v6;
  BOOL v7;
  double v8;

  result = 10.0;
  v6 = 0.0;
  v7 = a4 >= 0x28 || a3 >= 0x32;
  v8 = 2.22507386e-308;
  if (!v7)
    v8 = 10.0;
  if (a5)
    v8 = 0.0;
  if (a4 <= 0x5E)
    v6 = v8;
  if (a4 >= 10)
    return v6;
  return result;
}

- (double)usageLikelihoodForApplication:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[_DASPairedSystemContext remoteAppLaunchCount](self, "remoteAppLaunchCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_DASPairedSystemContext remoteAppLaunchCount](self, "remoteAppLaunchCount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8 / 100.0;

    v10 = fmin(v9, 1.0);
  }
  else
  {
    v10 = 1.0;
  }

  return v10;
}

- (BOOL)shouldBypassApplicationUsage:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend((id)kUsageIgnoredApps, "containsObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)batteryLevelsAllowSendingTrafficeForServiceIdentifiers:(id)a3 atPriorityLevel:(unint64_t)a4
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  NSObject *log;
  BOOL v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  double v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  _BYTE v45[10];
  _BYTE v46[10];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[_DASPairedSystemContext isWatchPluggedIn](self, "isWatchPluggedIn");
  v8 = -[_DASPairedSystemContext watchBatteryLevel](self, "watchBatteryLevel");
  if (!v7 && objc_msgSend(v6, "containsObject:", CFSTR("com.apple.private.alloy.sensorkit")))
  {
    log = self->_log;
    v10 = 0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v11 = log;
      +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v41 = v6;
      v42 = 2112;
      v43 = v12;
      v44 = 1024;
      *(_DWORD *)v45 = v8;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = 0;
      _os_log_impl(&dword_1B0DF4000, v11, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Watch Battery Level: %d, Watch Plugin Status: %u", buf, 0x22u);

LABEL_27:
      v10 = 0;
      goto LABEL_28;
    }
    goto LABEL_28;
  }
  -[_DASPairedSystemContext usageThresholdForPriority:batteryLevel:isPluggedIn:](self, "usageThresholdForPriority:batteryLevel:isPluggedIn:", a4, v8, v7);
  v14 = v13;
  if (v13 < 2.22507386e-308)
  {
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v41 = v6;
      v42 = 2112;
      v43 = v17;
      v44 = 1024;
      *(_DWORD *)v45 = v8;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v7;
      *(_WORD *)v46 = 2048;
      *(double *)&v46[2] = v14;
      _os_log_impl(&dword_1B0DF4000, v16, OS_LOG_TYPE_DEFAULT, "ALLOWED: %@, Priority=%@, Watch Battery Level: %d, Watch Plugin Status: %u, Usage Threshold: %lf", buf, 0x2Cu);

    }
    goto LABEL_24;
  }
  if (v13 <= 1.0)
  {
    if (!-[_DASPairedSystemContext shouldBypassApplicationUsage:](self, "shouldBypassApplicationUsage:", v6))
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v21 = v6;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        v25 = 0.0;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(v21);
            -[_DASPairedSystemContext usageLikelihoodForApplication:](self, "usageLikelihoodForApplication:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i), (_QWORD)v35);
            v25 = v25 + v27;
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        }
        while (v23);
      }
      else
      {
        v25 = 0.0;
      }

      v28 = self->_log;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v41 = v21;
        v42 = 2112;
        v43 = v30;
        v44 = 2048;
        *(double *)v45 = v25;
        *(_WORD *)&v45[8] = 1024;
        *(_DWORD *)v46 = v8;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v7;
        _os_log_impl(&dword_1B0DF4000, v29, OS_LOG_TYPE_DEFAULT, "CHECKING: %@, Priority=%@, App Usage: %lf, Watch Battery Level: %d, Watch Plugin Status: %u", buf, 0x2Cu);

      }
      if (v25 < v14)
      {
        v31 = self->_log;
        v10 = 0;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = v31;
          +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v41 = v21;
          v42 = 2112;
          v43 = v33;
          v44 = 2048;
          *(double *)v45 = v25;
          *(_WORD *)&v45[8] = 1024;
          *(_DWORD *)v46 = v8;
          *(_WORD *)&v46[4] = 1024;
          *(_DWORD *)&v46[6] = v7;
          _os_log_impl(&dword_1B0DF4000, v32, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, App Usage: %lf, Watch Battery Level: %d, Watch Plugin Status: %u", buf, 0x2Cu);

          goto LABEL_27;
        }
        goto LABEL_28;
      }
    }
LABEL_24:
    v10 = 1;
    goto LABEL_28;
  }
  v18 = self->_log;
  v10 = 0;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    +[_DASPairedSystemContext stringForPriority:](_DASPairedSystemContext, "stringForPriority:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v41 = v6;
    v42 = 2112;
    v43 = v20;
    v44 = 1024;
    *(_DWORD *)v45 = v8;
    *(_WORD *)&v45[4] = 1024;
    *(_DWORD *)&v45[6] = v7;
    *(_WORD *)v46 = 2048;
    *(double *)&v46[2] = v14;
    _os_log_impl(&dword_1B0DF4000, v19, OS_LOG_TYPE_DEFAULT, "DENIED: %@, Priority=%@, Watch Battery Level: %d, Watch Plugin Status: %u, Usage Threshold: %lf", buf, 0x2Cu);

    goto LABEL_27;
  }
LABEL_28:

  return v10;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_handlerQueue, a3);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSUserDefaults)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void)setOnConditionsChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)onApplicationStateChange
{
  return self->_onApplicationStateChange;
}

- (void)setOnApplicationStateChange:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (int)previousMaxThermalPressure
{
  return self->_previousMaxThermalPressure;
}

- (void)setPreviousMaxThermalPressure:(int)a3
{
  self->_previousMaxThermalPressure = a3;
}

- (double)previousDefaultThreshold
{
  return self->_previousDefaultThreshold;
}

- (void)setPreviousDefaultThreshold:(double)a3
{
  self->_previousDefaultThreshold = a3;
}

- (double)previousSyncThreshold
{
  return self->_previousSyncThreshold;
}

- (void)setPreviousSyncThreshold:(double)a3
{
  self->_previousSyncThreshold = a3;
}

- (double)previousBatteryLevel
{
  return self->_previousBatteryLevel;
}

- (void)setPreviousBatteryLevel:(double)a3
{
  self->_previousBatteryLevel = a3;
}

- (BOOL)previousPluginStatus
{
  return self->_previousPluginStatus;
}

- (void)setPreviousPluginStatus:(BOOL)a3
{
  self->_previousPluginStatus = a3;
}

- (NSMutableDictionary)watchKitAppStatus
{
  return self->_watchKitAppStatus;
}

- (void)setWatchKitAppStatus:(id)a3
{
  objc_storeStrong((id *)&self->_watchKitAppStatus, a3);
}

- (int)recentTrafficSyncRequests
{
  return self->_recentTrafficSyncRequests;
}

- (void)setRecentTrafficSyncRequests:(int)a3
{
  self->_recentTrafficSyncRequests = a3;
}

- (NSMutableDictionary)recentlyBackgroundedApps
{
  return self->_recentlyBackgroundedApps;
}

- (void)setRecentlyBackgroundedApps:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyBackgroundedApps, a3);
}

- (NSMutableSet)previousForegroundApps
{
  return self->_previousForegroundApps;
}

- (void)setPreviousForegroundApps:(id)a3
{
  objc_storeStrong((id *)&self->_previousForegroundApps, a3);
}

- (NSDictionary)remoteAppLaunchCount
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRemoteAppLaunchCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSMutableDictionary)launchedAppCount
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLaunchedAppCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (OS_dispatch_source)appUsageRefreshTimer
{
  return self->_appUsageRefreshTimer;
}

- (void)setAppUsageRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_appUsageRefreshTimer, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (int)remoteForecastDeletionToken
{
  return self->_remoteForecastDeletionToken;
}

- (void)setRemoteForecastDeletionToken:(int)a3
{
  self->_remoteForecastDeletionToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_appUsageRefreshTimer, 0);
  objc_storeStrong((id *)&self->_launchedAppCount, 0);
  objc_storeStrong((id *)&self->_remoteAppLaunchCount, 0);
  objc_storeStrong((id *)&self->_previousForegroundApps, 0);
  objc_storeStrong((id *)&self->_previousExclusiveIdentifiers, 0);
  objc_storeStrong((id *)&self->_recentlyBackgroundedApps, 0);
  objc_storeStrong((id *)&self->_foregroundWatchApp, 0);
  objc_storeStrong((id *)&self->_watchKitAppStatus, 0);
  objc_storeStrong(&self->_onApplicationStateChange, 0);
  objc_storeStrong(&self->_onConditionsChange, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)thirdPartyAppPolicyAllowsSendingTrafficForServiceIdentifiers:(os_log_t)log atPriorityLevel:furtherChecksNecessary:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0DF4000, log, OS_LOG_TYPE_DEBUG, "Watch is plugged in or no app is third-party app", v1, 2u);
}

@end
