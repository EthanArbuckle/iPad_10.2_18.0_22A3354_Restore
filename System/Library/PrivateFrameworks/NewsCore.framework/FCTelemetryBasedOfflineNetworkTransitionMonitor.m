@implementation FCTelemetryBasedOfflineNetworkTransitionMonitor

- (id)notifyWhenTransitionOccursOnQueue:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  FCTelemetryBasedOfflineNetworkTransitionOperation *v15;
  void *v16;
  void *v17;
  FCTelemetryBasedOfflineNetworkTransitionOperation *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  FCTelemetryBasedOfflineNetworkTransitionMonitor *v26;
  id v27;

  v6 = a3;
  v7 = a4;
  -[FCTelemetryBasedOfflineNetworkTransitionMonitor configurationManager](self, "configurationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "possiblyUnfetchedAppConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v9, "offlineModeDetectionIgnoredHosts");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = v11;
  else
    v13 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v10, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [FCTelemetryBasedOfflineNetworkTransitionOperation alloc];
  -[FCTelemetryBasedOfflineNetworkTransitionMonitor appActivationMonitor](self, "appActivationMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTelemetryBasedOfflineNetworkTransitionMonitor networkBehaviorMonitor](self, "networkBehaviorMonitor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:](v15, "initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:", v16, v14, v17);

  -[FCTelemetryBasedOfflineNetworkTransitionMonitor onlineTransitionMonitor](self, "onlineTransitionMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dateOfLastTransition");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTelemetryBasedOfflineNetworkTransitionOperation setDateOfLastSuccess:](v18, "setDateOfLastSuccess:", v20);

  objc_msgSend(v9, "offlineModeMinimumSecondsSinceSuccessToOffline");
  -[FCTelemetryBasedOfflineNetworkTransitionOperation setMinimumSecondsSinceSuccessToOffline:](v18, "setMinimumSecondsSinceSuccessToOffline:");
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke;
  v24[3] = &unk_1E463DB98;
  v26 = self;
  v27 = v7;
  v25 = v6;
  v21 = v7;
  v22 = v6;
  -[FCTelemetryBasedOfflineNetworkTransitionOperation setTransitionBlock:](v18, "setTransitionBlock:", v24);
  -[FCOperation start](v18, "start");

  return v18;
}

- (FCMultiNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (FCTelemetryBasedOfflineNetworkTransitionMonitor)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor init]";
    v9 = 2080;
    v10 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    v11 = 1024;
    v12 = 33;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTelemetryBasedOfflineNetworkTransitionMonitor init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTelemetryBasedOfflineNetworkTransitionMonitor)initWithAppActivationMonitor:(id)a3 configurationManager:(id)a4 networkBehaviorMonitor:(id)a5 onlineTransitionMonitor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  FCTelemetryBasedOfflineNetworkTransitionMonitor *v15;
  FCTelemetryBasedOfflineNetworkTransitionMonitor *v16;
  uint64_t v17;
  NFUnfairLock *dateOfLastTransitionLock;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appActivationMonitor");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    v29 = 1024;
    v30 = 41;
    v31 = 2114;
    v32 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v12)
      goto LABEL_6;
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "configurationManager");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    v29 = 1024;
    v30 = 42;
    v31 = 2114;
    v32 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkBehaviorMonitor");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    v29 = 1024;
    v30 = 43;
    v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v14)
      goto LABEL_11;
  }
  else if (v14)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "onlineTransitionMonitor");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCTelemetryBasedOfflineNetworkTransitionMonitor initWithAppActivationMonitor:configurationManager:networkBeh"
          "aviorMonitor:onlineTransitionMonitor:]";
    v27 = 2080;
    v28 = "FCTelemetryBasedOfflineNetworkTransitionMonitor.m";
    v29 = 1024;
    v30 = 44;
    v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:
  v24.receiver = self;
  v24.super_class = (Class)FCTelemetryBasedOfflineNetworkTransitionMonitor;
  v15 = -[FCTelemetryBasedOfflineNetworkTransitionMonitor init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_appActivationMonitor, a3);
    objc_storeStrong((id *)&v16->_configurationManager, a4);
    objc_storeStrong((id *)&v16->_networkBehaviorMonitor, a5);
    objc_storeStrong((id *)&v16->_onlineTransitionMonitor, a6);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    dateOfLastTransitionLock = v16->_dateOfLastTransitionLock;
    v16->_dateOfLastTransitionLock = (NFUnfairLock *)v17;

  }
  return v16;
}

void __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "dateOfLastTransitionLock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke_2;
  v3[3] = &unk_1E463AB18;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "performWithLockSync:", v3);

}

void __95__FCTelemetryBasedOfflineNetworkTransitionMonitor_notifyWhenTransitionOccursOnQueue_withBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "dateOfLastTransition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_laterDateAllowingNilWithDate:andDate:", v5, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDateOfLastTransition:", v4);

}

- (NSDate)dateOfLastTransition
{
  return self->_dateOfLastTransition;
}

- (void)setDateOfLastTransition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FCAppActivationMonitorType)appActivationMonitor
{
  return self->_appActivationMonitor;
}

- (FCNewsAppConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCNetworkTransitionMonitor)onlineTransitionMonitor
{
  return self->_onlineTransitionMonitor;
}

- (NFUnfairLock)dateOfLastTransitionLock
{
  return self->_dateOfLastTransitionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastTransitionLock, 0);
  objc_storeStrong((id *)&self->_onlineTransitionMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_appActivationMonitor, 0);
  objc_storeStrong((id *)&self->_dateOfLastTransition, 0);
}

@end
