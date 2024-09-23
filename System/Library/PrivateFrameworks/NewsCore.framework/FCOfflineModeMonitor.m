@implementation FCOfflineModeMonitor

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__FCOfflineModeMonitor_addObserver___block_invoke_2;
    v6[3] = &unk_1E463AD10;
    v6[4] = self;
    v7 = v4;
    FCPerformBlockOnMainThread(v6);

  }
}

void __36__FCOfflineModeMonitor_addObserver___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (FCOfflineModeMonitor)initWithNetworkReachability:(id)a3 onlineTransitionMonitor:(id)a4 offlineTransitionMonitor:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCOfflineModeMonitor *v12;
  uint64_t v13;
  NSHashTable *observers;
  void *v15;
  uint64_t v16;
  FCOfflineModeMonitor *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  FCOfflineModeMonitor *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id *v57;
  id v58;
  void *v59;
  void *v60;
  _QWORD v61[4];
  id *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  FCOfflineModeMonitor *v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  FCOfflineModeMonitor *v70;
  objc_super v71;
  uint8_t buf[4];
  const char *v73;
  __int16 v74;
  char *v75;
  __int16 v76;
  int v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkReachability");
    *(_DWORD *)buf = 136315906;
    v73 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]";
    v74 = 2080;
    v75 = "FCOfflineModeMonitor.m";
    v76 = 1024;
    v77 = 97;
    v78 = 2114;
    v79 = v50;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "onlineTransitionMonitor");
    *(_DWORD *)buf = 136315906;
    v73 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]";
    v74 = 2080;
    v75 = "FCOfflineModeMonitor.m";
    v76 = 1024;
    v77 = 98;
    v78 = 2114;
    v79 = v51;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "offlineTransitionMonitor");
    *(_DWORD *)buf = 136315906;
    v73 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]";
    v74 = 2080;
    v75 = "FCOfflineModeMonitor.m";
    v76 = 1024;
    v77 = 99;
    v78 = 2114;
    v79 = v52;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v71.receiver = self;
  v71.super_class = (Class)FCOfflineModeMonitor;
  v12 = -[FCOfflineModeMonitor init](&v71, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v13 = objc_claimAutoreleasedReturnValue();
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v13;

    objc_storeStrong((id *)&v12->_networkReachability, a3);
    objc_msgSend(v9, "addObserver:", v12);
    objc_storeStrong((id *)&v12->_onlineTransitionMonitor, a4);
    objc_storeStrong((id *)&v12->_offlineTransitionMonitor, a5);
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60B10]), "initWithName:", CFSTR("initial"));
    v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60B10]), "initWithName:", CFSTR("inactiveOffline"));
    objc_msgSend(v59, "onWillEnter:", &__block_literal_global_27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_37;
    v69[3] = &unk_1E463E170;
    v17 = v12;
    v70 = v17;
    objc_msgSend(v15, "onDidEnter:", v69);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "onWillExit:", &__block_literal_global_45_2);

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60B10]), "initWithName:", CFSTR("online"));
    v67[0] = v16;
    v67[1] = 3221225472;
    v67[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_46;
    v67[3] = &unk_1E463E198;
    v58 = v11;
    v68 = v11;
    objc_msgSend(v20, "onWillEnter:", v67);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v16;
    v65[1] = 3221225472;
    v65[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2;
    v65[3] = &unk_1E463E170;
    v22 = v17;
    v66 = v22;
    objc_msgSend(v21, "onDidEnter:", v65);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)objc_msgSend(v23, "onWillExit:", &__block_literal_global_49_0);

    v25 = v9;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60B10]), "initWithName:", CFSTR("activeOffline"));
    v63[0] = v16;
    v63[1] = 3221225472;
    v63[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_51;
    v63[3] = &unk_1E463E198;
    v64 = v10;
    objc_msgSend(v26, "onWillEnter:", v63);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v16;
    v61[1] = 3221225472;
    v61[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2_53;
    v61[3] = &unk_1E463E170;
    v57 = v22;
    v62 = v57;
    objc_msgSend(v27, "onDidEnter:", v61);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (id)objc_msgSend(v28, "onWillExit:", &__block_literal_global_55);

    v30 = objc_msgSend(v25, "offlineReason");
    if (v30)
    {
      v31 = v30;
      v32 = v59;
      v33 = v59;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v31);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = v20;
      v56 = 0;
      v32 = v59;
    }
    v54 = v33;
    v34 = objc_alloc(MEMORY[0x1E0D60B08]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v60);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v34, "initWithName:transitionFromStates:toState:", CFSTR("transitionToFirstState"), v35, v33);

    v36 = objc_alloc(MEMORY[0x1E0D60B08]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v20, v26, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v36, "initWithName:transitionFromStates:toState:", CFSTR("reachabilityWentOffline"), v37, v32);

    v38 = objc_alloc(MEMORY[0x1E0D60B08]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v32, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v38, "initWithName:transitionFromStates:toState:", CFSTR("reachabilityCameOnline"), v39, v26);

    v41 = objc_alloc(MEMORY[0x1E0D60B08]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v26);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v41, "initWithName:transitionFromStates:toState:", CFSTR("onlineTransitionDetected"), v42, v20);

    v44 = objc_alloc(MEMORY[0x1E0D60B08]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v20);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v44, "initWithName:transitionFromStates:toState:", CFSTR("offlineTransitionDetected"), v45, v26);

    v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D60B00]), "initWithState:withOwner:", v60, v57);
    objc_msgSend(v47, "addState:", v32);
    objc_msgSend(v47, "addState:", v20);
    objc_msgSend(v47, "addState:", v26);
    objc_msgSend(v47, "addEvent:", v55);
    objc_msgSend(v47, "addEvent:", v53);
    objc_msgSend(v47, "addEvent:", v40);
    objc_msgSend(v47, "addEvent:", v43);
    objc_msgSend(v47, "addEvent:", v46);
    objc_msgSend(v47, "activate");
    objc_storeStrong(v57 + 3, v47);
    v48 = (id)objc_msgSend(v47, "fireEventWithName:withContext:", CFSTR("transitionToFirstState"), v56);

    v9 = v25;
    v11 = v58;
  }

  return v12;
}

- (BOOL)isLowDataModeEnabled
{
  void *v2;
  char v3;

  -[FCOfflineModeMonitor networkReachability](self, "networkReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLowDataModeEnabled");

  return v3;
}

- (BOOL)isNetworkReachable
{
  return -[FCOfflineModeMonitor offlineReason](self, "offlineReason") == 0;
}

- (BOOL)isCloudKitReachable
{
  void *v4;
  char v5;

  if (-[FCOfflineModeMonitor offlineReason](self, "offlineReason"))
    return 0;
  -[FCOfflineModeMonitor networkReachability](self, "networkReachability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCloudKitAccessAllowed");

  return v5;
}

- (FCNetworkReachability)networkReachability
{
  return self->_networkReachability;
}

- (NFStateMachine)stateMachine
{
  return self->_stateMachine;
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "entering active offline state", buf, 2u);
  }
  objc_msgSend(v6, "onlineTransitionOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "owner.onlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v17 = 2080;
    v18 = "FCOfflineModeMonitor.m";
    v19 = 1024;
    v20 = 154;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_52;
  v13[3] = &unk_1E463AB18;
  v14 = v5;
  v10 = v5;
  objc_msgSend(v9, "notifyWhenTransitionOccursOnQueue:withBlock:", MEMORY[0x1E0C80D38], v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnlineTransitionOperation:", v11);

}

- (void)setOfflineTransitionOperation:(id)a3
{
  objc_storeStrong((id *)&self->_offlineTransitionOperation, a3);
}

- (FCOperationCanceling)offlineTransitionOperation
{
  return self->_offlineTransitionOperation;
}

- (FCOfflineModeMonitor)initWithAppActivationMonitor:(id)a3 configurationManager:(id)a4 networkBehaviorMonitor:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  FCPingBasedOnlineNetworkTransitionMonitor *v13;
  FCTelemetryBasedOfflineNetworkTransitionMonitor *v14;
  void *v15;
  FCOfflineModeMonitor *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appActivationMonitor");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCOfflineModeMonitor initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:]";
    v22 = 2080;
    v23 = "FCOfflineModeMonitor.m";
    v24 = 1024;
    v25 = 69;
    v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkBehaviorMonitor");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCOfflineModeMonitor initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:]";
    v22 = 2080;
    v23 = "FCOfflineModeMonitor.m";
    v24 = 1024;
    v25 = 70;
    v26 = 2114;
    v27 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v11 = FCCurrentContextEnvironment();
  FCOfflineModePingHostName(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCPingBasedOnlineNetworkTransitionMonitor initWithConfigurationManager:hostName:port:]([FCPingBasedOnlineNetworkTransitionMonitor alloc], "initWithConfigurationManager:hostName:port:", v9, v12, 443);
  v14 = -[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:onlineTransitionMonitor:]([FCTelemetryBasedOfflineNetworkTransitionMonitor alloc], "initWithAppActivationMonitor:configurationManager:networkBehaviorMonitor:onlineTransitionMonitor:", v8, v9, v10, v13);
  +[FCNetworkReachability sharedNetworkReachability](FCNetworkReachability, "sharedNetworkReachability");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:](self, "initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:", v15, v13, v14);

  return v16;
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "entering inactive offline", buf, 2u);
  }
  objc_msgSend(v5, "offlineTransitionOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "owner.offlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v13 = 2080;
    v14 = "FCOfflineModeMonitor.m";
    v15 = 1024;
    v16 = 116;
    v17 = 2114;
    v18 = v9;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v5, "onlineTransitionOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "owner.onlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v12 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v13 = 2080;
    v14 = "FCOfflineModeMonitor.m";
    v15 = 1024;
    v16 = 117;
    v17 = 2114;
    v18 = v10;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

id __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "context");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v11 = 2080;
    v12 = "FCOfflineModeMonitor.m";
    v13 = 1024;
    v14 = 121;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = (objc_class *)objc_opt_class();
  FCCheckedDynamicCast(v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_transitionToOfflineReason:", objc_msgSend(v5, "integerValue"));
  objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_44()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A1B90000, v0, OS_LOG_TYPE_DEFAULT, "exiting inactive offline", v1, 2u);
  }
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_DEFAULT, "entering online state", buf, 2u);
  }
  objc_msgSend(v6, "offlineTransitionOperation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("expected nil value for '%s'"), "owner.offlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v16 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v17 = 2080;
    v18 = "FCOfflineModeMonitor.m";
    v19 = 1024;
    v20 = 135;
    v21 = 2114;
    v22 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v9 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_47;
  v13[3] = &unk_1E463AB18;
  v14 = v5;
  v10 = v5;
  objc_msgSend(v9, "notifyWhenTransitionOccursOnQueue:withBlock:", MEMORY[0x1E0C80D38], v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOfflineTransitionOperation:", v11);

}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_47(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "fireEventWithName:withContext:", CFSTR("offlineTransitionDetected"), 0);

}

uint64_t __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_transitionToOfflineReason:", 0);
  return objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "exiting online state", buf, 2u);
  }
  objc_msgSend(v5, "offlineTransitionOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "offlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v11 = 2080;
    v12 = "FCOfflineModeMonitor.m";
    v13 = 1024;
    v14 = 145;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v7, "cancel");
  objc_msgSend(v5, "setOfflineTransitionOperation:", 0);

}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_52(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "fireEventWithName:withContext:", CFSTR("onlineTransitionDetected"), 0);

}

uint64_t __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_2_53(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_transitionToOfflineReason:", 2);
  return objc_msgSend(MEMORY[0x1E0D60AF0], "asVoid");
}

void __101__FCOfflineModeMonitor_initWithNetworkReachability_onlineTransitionMonitor_offlineTransitionMonitor___block_invoke_3_54(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "leaving active offline state", buf, 2u);
  }
  objc_msgSend(v5, "onlineTransitionOperation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "onlineTransitionOperation");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCOfflineModeMonitor initWithNetworkReachability:onlineTransitionMonitor:offlineTransitionMonitor:]_block_invoke";
    v11 = 2080;
    v12 = "FCOfflineModeMonitor.m";
    v13 = 1024;
    v14 = 164;
    v15 = 2114;
    v16 = v8;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(v7, "cancel");
  objc_msgSend(v5, "setOnlineTransitionOperation:", 0);

}

- (BOOL)isNetworkUsageInexpensive
{
  void *v2;
  char v3;

  -[FCOfflineModeMonitor networkReachability](self, "networkReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkUsageExpensive");

  return v3;
}

- (BOOL)isNetworkReachableViaWiFi
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[FCOfflineModeMonitor isNetworkReachable](self, "isNetworkReachable");
  if (v3)
  {
    -[FCOfflineModeMonitor networkReachability](self, "networkReachability");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNetworkReachableViaWiFi");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)cellularRadioAccessTechnology
{
  void *v2;
  int64_t v3;

  -[FCOfflineModeMonitor networkReachability](self, "networkReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cellularRadioAccessTechnology");

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__FCOfflineModeMonitor_removeObserver___block_invoke_2;
    v6[3] = &unk_1E463AD10;
    v6[4] = self;
    v7 = v4;
    FCPerformBlockOnMainThread(v6);

  }
}

void __39__FCOfflineModeMonitor_removeObserver___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is not an observer"), *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v7 = "-[FCOfflineModeMonitor removeObserver:]_block_invoke_2";
    v8 = 2080;
    v9 = "FCOfflineModeMonitor.m";
    v10 = 1024;
    v11 = 270;
    v12 = 2114;
    v13 = v5;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

}

- (void)networkReachabilityDidChange:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  id v7;
  id v8;

  v4 = objc_msgSend(a3, "offlineReason");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = CFSTR("reachabilityWentOffline");
  }
  else
  {
    v8 = 0;
    v5 = CFSTR("reachabilityCameOnline");
  }
  -[FCOfflineModeMonitor stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "fireEventWithName:withContext:", v5, v8);

}

- (void)wifiReachabilityDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[FCOfflineModeMonitor observers](self, "observers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "wifiReachabilityDidChange:", self, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_transitionToOfflineReason:(int64_t)a3
{
  int64_t v5;
  int64_t v6;

  v5 = -[FCOfflineModeMonitor offlineReason](self, "offlineReason");
  if (v5 != a3)
  {
    v6 = v5;
    -[FCOfflineModeMonitor setOfflineReason:](self, "setOfflineReason:", a3);
    -[FCOfflineModeMonitor _notifyNetworkReachabilityDidChange](self, "_notifyNetworkReachabilityDidChange");
    if (!a3 || !v6)
      -[FCOfflineModeMonitor _notifyNetworkReachabilityConnectivityDidChange](self, "_notifyNetworkReachabilityConnectivityDidChange");
  }
}

- (void)_notifyNetworkReachabilityDidChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FCOfflineModeMonitor observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "networkReachabilityDidChange:", self, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyNetworkReachabilityConnectivityDidChange
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[FCOfflineModeMonitor observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "networkReachabilityConnectivityDidChange:", self, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (int64_t)offlineReason
{
  return self->_offlineReason;
}

- (void)setOfflineReason:(int64_t)a3
{
  self->_offlineReason = a3;
}

- (void)setStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_stateMachine, a3);
}

- (FCNetworkTransitionMonitor)onlineTransitionMonitor
{
  return self->_onlineTransitionMonitor;
}

- (FCNetworkTransitionMonitor)offlineTransitionMonitor
{
  return self->_offlineTransitionMonitor;
}

- (FCOperationCanceling)onlineTransitionOperation
{
  return self->_onlineTransitionOperation;
}

- (void)setOnlineTransitionOperation:(id)a3
{
  objc_storeStrong((id *)&self->_onlineTransitionOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onlineTransitionOperation, 0);
  objc_storeStrong((id *)&self->_offlineTransitionOperation, 0);
  objc_storeStrong((id *)&self->_offlineTransitionMonitor, 0);
  objc_storeStrong((id *)&self->_onlineTransitionMonitor, 0);
  objc_storeStrong((id *)&self->_networkReachability, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
