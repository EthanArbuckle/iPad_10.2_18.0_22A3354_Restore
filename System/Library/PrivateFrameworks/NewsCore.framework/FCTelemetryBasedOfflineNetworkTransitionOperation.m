@implementation FCTelemetryBasedOfflineNetworkTransitionOperation

- (void)logNetworkEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[6];
  _QWORD v37[6];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v4, "startTime");
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    -[FCTelemetryBasedOfflineNetworkTransitionOperation monitoringStartDate](self, "monitoringStartDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "fc_isLaterThan:", v10) & 1) == 0)
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_3;
      v36[3] = &unk_1E463AD10;
      v36[4] = v6;
      v36[5] = v10;
      __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_3((uint64_t)v36);
LABEL_10:

      goto LABEL_11;
    }
    v35 = 0;
    if (!objc_msgSend(v9, "fc_isOfflineErrorOfflineReason:", &v35) || v35 == 2)
      goto LABEL_10;
    if (objc_msgSend(v9, "fc_failedDueToTaskConstraints"))
    {
      v11 = FCReachabilityLog;
      if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "disregarding event, since it failed due to task constraints", buf, 2u);
      }
      goto LABEL_10;
    }
    objc_msgSend(v4, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0CB32F0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCTelemetryBasedOfflineNetworkTransitionOperation ignoredHosts](self, "ignoredHosts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v15);

      v18 = FCReachabilityLog;
      v19 = os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138543362;
          v39 = v15;
          _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "host %{public}@ will be ignored", buf, 0xCu);
        }
        goto LABEL_35;
      }
      if (v19)
      {
        *(_DWORD *)buf = 138543362;
        v39 = v15;
        _os_log_impl(&dword_1A1B90000, v18, OS_LOG_TYPE_DEFAULT, "host %{public}@ will not be ignored", buf, 0xCu);
      }

    }
    else
    {
      v20 = FCReachabilityLog;
      if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1B90000, v20, OS_LOG_TYPE_DEFAULT, "no failing URL was obtained, so treating error as counting towards offline", buf, 2u);
      }
    }
    -[FCTelemetryBasedOfflineNetworkTransitionOperation appActivationMonitor](self, "appActivationMonitor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastActivationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCTelemetryBasedOfflineNetworkTransitionOperation appActivationMonitor](self, "appActivationMonitor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastBackgroundDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      if (v23 && objc_msgSend(v23, "fc_isLaterThan:", v15))
      {
        v24 = FCReachabilityLog;
        if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v39 = v23;
          v40 = 2114;
          v41 = v15;
          v25 = "disregarding error, since app is currently in the background, with last activation date of %{public}@ an"
                "d last background date of %{public}@ ";
LABEL_29:
          v26 = v24;
          v27 = 22;
LABEL_32:
          _os_log_impl(&dword_1A1B90000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
      }
      else
      {
        if (!objc_msgSend(v6, "fc_isEarlierThan:", v15))
        {
          -[FCTelemetryBasedOfflineNetworkTransitionOperation lock](self, "lock");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_20;
          v30[3] = &unk_1E463C840;
          v30[4] = self;
          v31 = v4;
          v32 = v6;
          v33 = v15;
          v34 = v23;
          objc_msgSend(v29, "performWithLockSync:", v30);

          goto LABEL_34;
        }
        v24 = FCReachabilityLog;
        if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v39 = v6;
          v40 = 2114;
          v41 = v15;
          v25 = "disregarding error, since network event started at %{public}@ relative to last activation date of %{public}@";
          goto LABEL_29;
        }
      }
    }
    else
    {
      v28 = FCReachabilityLog;
      if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "disregarding error, since app has not yet become active";
        v26 = v28;
        v27 = 2;
        goto LABEL_32;
      }
    }
LABEL_34:

LABEL_35:
    goto LABEL_10;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke;
  v37[3] = &unk_1E463AD10;
  v37[4] = self;
  v37[5] = v6;
  __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke((uint64_t)v37);
LABEL_11:

}

- (void)performOperation
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCTelemetryBasedOfflineNetworkTransitionOperation setMonitoringStartDate:](self, "setMonitoringStartDate:", v3);

  -[FCTelemetryBasedOfflineNetworkTransitionOperation networkBehaviorMonitor](self, "networkBehaviorMonitor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addMonitor:", self);

}

- (FCMultiNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (void)setTransitionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (FCTelemetryBasedOfflineNetworkTransitionOperation)init
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
    v8 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation init]";
    v9 = 2080;
    v10 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    v11 = 1024;
    v12 = 31;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCTelemetryBasedOfflineNetworkTransitionOperation init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCTelemetryBasedOfflineNetworkTransitionOperation)initWithAppActivationMonitor:(id)a3 ignoredHosts:(id)a4 networkBehaviorMonitor:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCTelemetryBasedOfflineNetworkTransitionOperation *v12;
  FCTelemetryBasedOfflineNetworkTransitionOperation *v13;
  uint64_t v14;
  NSSet *ignoredHosts;
  uint64_t v16;
  NFUnfairLock *lock;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "appActivationMonitor");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:]";
    v25 = 2080;
    v26 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    v27 = 1024;
    v28 = 38;
    v29 = 2114;
    v30 = v19;
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
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "ignoredHosts");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:]";
    v25 = 2080;
    v26 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    v27 = 1024;
    v28 = 39;
    v29 = 2114;
    v30 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  if (!v11 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "networkBehaviorMonitor");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCTelemetryBasedOfflineNetworkTransitionOperation initWithAppActivationMonitor:ignoredHosts:networkBehaviorMonitor:]";
    v25 = 2080;
    v26 = "FCTelemetryBasedOfflineNetworkTransitionOperation.m";
    v27 = 1024;
    v28 = 40;
    v29 = 2114;
    v30 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v22.receiver = self;
  v22.super_class = (Class)FCTelemetryBasedOfflineNetworkTransitionOperation;
  v12 = -[FCOperation init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appActivationMonitor, a3);
    v14 = objc_msgSend(v10, "copy");
    ignoredHosts = v13->_ignoredHosts;
    v13->_ignoredHosts = (NSSet *)v14;

    objc_storeStrong((id *)&v13->_networkBehaviorMonitor, a5);
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    lock = v13->_lock;
    v13->_lock = (NFUnfairLock *)v16;

  }
  return v13;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;

  -[FCTelemetryBasedOfflineNetworkTransitionOperation networkBehaviorMonitor](self, "networkBehaviorMonitor", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeMonitor:", self);

}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_2;
  v4[3] = &unk_1E463AD10;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "performWithLockSync:", v4);

}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(*(id *)(a1 + 32), "dateOfLastSuccess");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_laterDateAllowingNilWithDate:andDate:", v4, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDateOfLastSuccess:", v3);

}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_DEFAULT, "disregarding event, since it started at %{public}@ relative to offline monitoring start date of %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void __69__FCTelemetryBasedOfflineNetworkTransitionOperation_logNetworkEvent___block_invoke_20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(void);
  NSObject *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dateOfLastSuccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "minimumSecondsSinceSuccessToOffline");
  objc_msgSend(v2, "dateByAddingTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fc_isLaterThan:", v3);

  if ((v5 & 1) != 0)
  {

LABEL_4:
    v6 = (void *)FCReachabilityLog;
    if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      objc_msgSend(v7, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(_QWORD *)(a1 + 56);
      v12 = *(_QWORD *)(a1 + 64);
      v15 = 138544386;
      v16 = v9;
      v17 = 2114;
      v18 = v10;
      v19 = 2114;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v2;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "transitioning offline after receiving event with error %{public}@, starting at %{public}@ relative to last activation date of %{public}@, last background date of %{public}@, and last success date of %{public}@", (uint8_t *)&v15, 0x34u);

    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "transitionBlock");
      v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v13[2]();

      objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
    }
    goto LABEL_11;
  }
  v14 = FCReachabilityLog;
  if (os_log_type_enabled((os_log_t)FCReachabilityLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = v3;
    _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "disregarding error, since earliest failure date is %{public}@", (uint8_t *)&v15, 0xCu);
  }

LABEL_11:
}

- (NSDate)dateOfLastSuccess
{
  return self->_dateOfLastSuccess;
}

- (void)setDateOfLastSuccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (double)minimumSecondsSinceSuccessToOffline
{
  return self->_minimumSecondsSinceSuccessToOffline;
}

- (void)setMinimumSecondsSinceSuccessToOffline:(double)a3
{
  self->_minimumSecondsSinceSuccessToOffline = a3;
}

- (id)transitionBlock
{
  return self->_transitionBlock;
}

- (FCAppActivationMonitorType)appActivationMonitor
{
  return self->_appActivationMonitor;
}

- (NSSet)ignoredHosts
{
  return self->_ignoredHosts;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (NSDate)monitoringStartDate
{
  return self->_monitoringStartDate;
}

- (void)setMonitoringStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringStartDate, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_ignoredHosts, 0);
  objc_storeStrong((id *)&self->_appActivationMonitor, 0);
  objc_storeStrong(&self->_transitionBlock, 0);
  objc_storeStrong((id *)&self->_dateOfLastSuccess, 0);
}

@end
