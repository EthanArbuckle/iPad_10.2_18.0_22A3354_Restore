@implementation HDWorkoutSessionRapportSyncController

- (HDWorkoutSessionRapportSyncController)initWithRapportMessenger:(id)a3 sessionServer:(id)a4
{
  id v7;
  id v8;
  HDWorkoutSessionRapportSyncController *v9;
  HDWorkoutSessionRapportSyncController *v10;
  uint64_t v11;
  HKRateLimiter *dataRateLimiter;
  NSMutableDictionary *v13;
  NSMutableDictionary *lock_pendingTransactionsByRequest;
  void *v15;
  NSObject *v17;
  void *v18;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)HDWorkoutSessionRapportSyncController;
  v9 = -[HDWorkoutSessionRapportSyncController init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_rapportMessenger, a3);
    objc_storeWeak((id *)&v10->_sessionServer, v8);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6AB0]), "initWithLimit:timeInterval:", 102400, 10.0);
    dataRateLimiter = v10->_dataRateLimiter;
    v10->_dataRateLimiter = (HKRateLimiter *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_pendingTransactionsByRequest = v10->_lock_pendingTransactionsByRequest;
    v10->_lock_pendingTransactionsByRequest = v13;

    if (objc_msgSend(v8, "sessionType") == 1)
      -[HDWorkoutSessionRapportSyncController _scheduleReceiveHeartbeatTimeout](v10, "_scheduleReceiveHeartbeatTimeout");
    if (!objc_msgSend(v8, "sessionType") && objc_msgSend(v8, "isMirroring"))
    {
      _HKInitializeLogging();
      v15 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        v17 = v15;
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v22 = v18;
        v19 = v18;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session was previously mirroring, resume heartbeats", buf, 0xCu);

      }
      -[HDWorkoutSessionRapportSyncController _scheduleHeartbeat](v10, "_scheduleHeartbeat");
    }
  }

  return v10;
}

- (void)sendMirroringStartRequestWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[HDWorkoutSessionRapportSyncController _scheduleHeartbeat](self, "_scheduleHeartbeat");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__HDWorkoutSessionRapportSyncController_sendMirroringStartRequestWithCompletion___block_invoke;
  v5[3] = &unk_1E6CF6868;
  v5[4] = self;
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("startMirroring"), v5, v4);

}

void __81__HDWorkoutSessionRapportSyncController_sendMirroringStartRequestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v5);

  objc_msgSend(*(id *)(a1 + 32), "sessionGlobalState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalState:", v6);

}

- (id)sessionConfiguration
{
  HDCodableWorkoutSessionConfiguration *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = objc_alloc_init(HDCodableWorkoutSessionConfiguration);
  self = (HDWorkoutSessionRapportSyncController *)((char *)self + 16);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(WeakRetained, "workoutConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "codableRepresentationForSync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionConfiguration setWorkoutConfiguration:](v3, "setWorkoutConfiguration:", v6);

  v7 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v7, "taskServer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "client");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB7738]))
  {
    v11 = (id)*MEMORY[0x1E0CB75C0];

    v10 = v11;
  }
  -[HDCodableWorkoutSessionConfiguration setSourceBundleIdentifier:](v3, "setSourceBundleIdentifier:", v10);

  return v3;
}

- (id)sessionGlobalState
{
  HDCodableWorkoutSessionGlobalState *v3;
  HDWorkoutSessionServer **p_sessionServer;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  p_sessionServer = &self->_sessionServer;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  -[HDCodableWorkoutSessionGlobalState setSessionState:](v3, "setSessionState:", objc_msgSend(WeakRetained, "state"));

  v6 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_sessionServer);
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    -[HDCodableWorkoutSessionGlobalState setStartDate:](v3, "setStartDate:");

  }
  v10 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v10, "stopDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)p_sessionServer);
    objc_msgSend(v12, "stopDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    -[HDCodableWorkoutSessionGlobalState setEndDate:](v3, "setEndDate:");

  }
  v14 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v14, "currentActivity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "codableRepresentationForSync");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionGlobalState setCurrentActivity:](v3, "setCurrentActivity:", v16);

  v17 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v17, "workoutDataAccumulator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "currentEvents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "hk_map:", &__block_literal_global_86);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  -[HDCodableWorkoutSessionGlobalState setEvents:](v3, "setEvents:", v21);

  return v3;
}

uint64_t __59__HDWorkoutSessionRapportSyncController_sessionGlobalState__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableRepresentationForSync");
}

- (void)sendMirroringStopRequestWithCompletion:(id)a3
{
  id v4;

  v4 = a3;
  -[HDWorkoutSessionRapportSyncController _cancelSendHeartbeat](self, "_cancelSendHeartbeat");
  -[HDWorkoutSessionRapportSyncController _cancelSendHeartbeatTimeout](self, "_cancelSendHeartbeatTimeout");
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("stopMirroring"), 0, v4);

}

- (void)receivedMirroringStopRequestWithCompletion:(id)a3
{
  id WeakRetained;
  void (**v5)(id, uint64_t, _QWORD);

  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[HDWorkoutSessionRapportSyncController _cancelReceiveHeartbeatTimeout](self, "_cancelReceiveHeartbeatTimeout");
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  objc_msgSend(WeakRetained, "didDisconnectFromRemoteWithError:", 0);

  v5[2](v5, 1, 0);
}

- (void)receivedRecoveryRequestWithResponseHandler:(id)a3
{
  id v4;
  HDWorkoutSessionServer **p_sessionServer;
  id WeakRetained;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  id v11;
  HDCodableWorkoutSessionSyncTransaction *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  int v24;
  HDWorkoutSessionRapportSyncController *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_sessionServer = &self->_sessionServer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  if ((objc_msgSend(WeakRetained, "isMirroring") & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCompanionCapable");

  if ((v8 & 1) != 0)
  {
LABEL_7:
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = objc_loadWeakRetained((id *)&self->_sessionServer);
    v24 = 138543618;
    v25 = self;
    v26 = 2114;
    v27 = v11;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@ Active mirroring session. Replying to recover request with workout %{public}@", (uint8_t *)&v24, 0x16u);

  }
  v12 = objc_alloc_init(HDCodableWorkoutSessionSyncTransaction);
  v13 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_dataForUUIDBytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionSyncTransaction setSessionUUID:](v12, "setSessionUUID:", v15);

  v16 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v16, "syncController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sessionConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionSyncTransaction setConfiguration:](v12, "setConfiguration:", v18);

  v19 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v19, "syncController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sessionGlobalState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionSyncTransaction setGlobalState:](v12, "setGlobalState:", v21);

  -[HDCodableWorkoutSessionSyncTransaction data](v12, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v22, 0);

  v23 = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(v23, "remoteSessionDidRecover");

LABEL_8:
}

- (double)heartbeatInterval
{
  double result;

  result = 0.5;
  if (!_HDIsUnitTesting)
    return 5.0;
  return result;
}

- (void)_scheduleHeartbeat
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *heartbeatSource;
  NSObject *v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutSessionRapportSyncController _lock_cancelSendHeartbeatTimeout](self, "_lock_cancelSendHeartbeatTimeout");
  -[HDWorkoutSessionRapportSyncController _lock_cancelSendHeartbeat](self, "_lock_cancelSendHeartbeat");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  heartbeatSource = self->_heartbeatSource;
  self->_heartbeatSource = v5;

  v7 = self->_heartbeatSource;
  -[HDWorkoutSessionRapportSyncController heartbeatInterval](self, "heartbeatInterval");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v10 = self->_heartbeatSource;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HDWorkoutSessionRapportSyncController__scheduleHeartbeat__block_invoke;
  v11[3] = &unk_1E6CECE78;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_heartbeatSource);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__HDWorkoutSessionRapportSyncController__scheduleHeartbeat__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_sendHeartbeat");

}

- (void)_sendHeartbeat
{
  id WeakRetained;
  int v4;
  NSDate *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  v4 = objc_msgSend(WeakRetained, "isMirroring");

  if (v4)
  {
    -[HDWorkoutSessionRapportSyncController _sendPendingTransactions](self, "_sendPendingTransactions");
    os_unfair_lock_lock(&self->_lock);
    v5 = self->_lock_lastPingDate;
    os_unfair_lock_unlock(&self->_lock);
    if (v5
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "timeIntervalSinceDate:", v5),
          v8 = v7,
          v6,
          -[HDWorkoutSessionRapportSyncController heartbeatInterval](self, "heartbeatInterval"),
          v8 < v9))
    {
      -[HDWorkoutSessionRapportSyncController _scheduleHeartbeat](self, "_scheduleHeartbeat");
    }
    else
    {
      -[HDWorkoutSessionRapportSyncController _scheduleSendHeartbeatTimeout](self, "_scheduleSendHeartbeatTimeout");
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __55__HDWorkoutSessionRapportSyncController__sendHeartbeat__block_invoke;
      v10[3] = &unk_1E6CE77C8;
      v10[4] = self;
      -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("heartbeat"), 0, v10);
    }

  }
}

void __55__HDWorkoutSessionRapportSyncController__sendHeartbeat__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      *(_DWORD *)v9 = 138543618;
      *(_QWORD *)&v9[4] = objc_opt_class();
      *(_WORD *)&v9[12] = 2114;
      *(_QWORD *)&v9[14] = v5;
      v8 = *(id *)&v9[4];
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Heartbeat failed with error %{public}@", v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_scheduleHeartbeat", *(_OWORD *)v9, *(_QWORD *)&v9[16], v10);

}

- (void)_scheduleSendHeartbeatTimeout
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *sendHeartbeatTimeoutSource;
  NSObject *v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD handler[5];
  id v12;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutSessionRapportSyncController _lock_cancelSendHeartbeatTimeout](self, "_lock_cancelSendHeartbeatTimeout");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  sendHeartbeatTimeoutSource = self->_sendHeartbeatTimeoutSource;
  self->_sendHeartbeatTimeoutSource = v5;

  v7 = self->_sendHeartbeatTimeoutSource;
  -[HDWorkoutSessionRapportSyncController heartbeatInterval](self, "heartbeatInterval");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v10 = self->_sendHeartbeatTimeoutSource;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __70__HDWorkoutSessionRapportSyncController__scheduleSendHeartbeatTimeout__block_invoke;
  handler[3] = &unk_1E6CED848;
  handler[4] = self;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v10, handler);
  dispatch_resume((dispatch_object_t)self->_sendHeartbeatTimeoutSource);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__HDWorkoutSessionRapportSyncController__scheduleSendHeartbeatTimeout__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = v2;
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Heartbeat timed out. Retrying now.", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "recordHeartbeatFailure");

  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v4, "_sendHeartbeat");

}

- (void)_cancelSendHeartbeat
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutSessionRapportSyncController _lock_cancelSendHeartbeat](self, "_lock_cancelSendHeartbeat");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelSendHeartbeat
{
  NSObject *heartbeatSource;
  OS_dispatch_source *v4;

  heartbeatSource = self->_heartbeatSource;
  if (heartbeatSource)
  {
    dispatch_source_cancel(heartbeatSource);
    v4 = self->_heartbeatSource;
    self->_heartbeatSource = 0;

  }
}

- (void)_cancelSendHeartbeatTimeout
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutSessionRapportSyncController _lock_cancelSendHeartbeatTimeout](self, "_lock_cancelSendHeartbeatTimeout");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelSendHeartbeatTimeout
{
  NSObject *sendHeartbeatTimeoutSource;
  OS_dispatch_source *v4;

  sendHeartbeatTimeoutSource = self->_sendHeartbeatTimeoutSource;
  if (sendHeartbeatTimeoutSource)
  {
    dispatch_source_cancel(sendHeartbeatTimeoutSource);
    v4 = self->_sendHeartbeatTimeoutSource;
    self->_sendHeartbeatTimeoutSource = 0;

  }
}

- (double)heartbeatReceiveTimeout
{
  double result;

  result = 1.5;
  if (!_HDIsUnitTesting)
    return 30.0;
  return result;
}

- (void)receivedHeartbeatWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[HDWorkoutSessionRapportSyncController _scheduleReceiveHeartbeatTimeout](self, "_scheduleReceiveHeartbeatTimeout");
  v4[2](v4, 1, 0);

}

- (void)_scheduleReceiveHeartbeatTimeout
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *receiveHeartbeatTimeoutSource;
  NSObject *v7;
  double v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutSessionRapportSyncController _lock_cancelReceiveHeartbeatTimeout](self, "_lock_cancelReceiveHeartbeatTimeout");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
  receiveHeartbeatTimeoutSource = self->_receiveHeartbeatTimeoutSource;
  self->_receiveHeartbeatTimeoutSource = v5;

  v7 = self->_receiveHeartbeatTimeoutSource;
  -[HDWorkoutSessionRapportSyncController heartbeatReceiveTimeout](self, "heartbeatReceiveTimeout");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  dispatch_source_set_timer(v7, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v10 = self->_receiveHeartbeatTimeoutSource;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__HDWorkoutSessionRapportSyncController__scheduleReceiveHeartbeatTimeout__block_invoke;
  v11[3] = &unk_1E6CECE78;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v10, v11);
  dispatch_resume((dispatch_object_t)self->_receiveHeartbeatTimeoutSource);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __73__HDWorkoutSessionRapportSyncController__scheduleReceiveHeartbeatTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_receiveHeartbeatDidTimeout");

}

- (void)_cancelReceiveHeartbeatTimeout
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[HDWorkoutSessionRapportSyncController _lock_cancelReceiveHeartbeatTimeout](self, "_lock_cancelReceiveHeartbeatTimeout");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_cancelReceiveHeartbeatTimeout
{
  NSObject *receiveHeartbeatTimeoutSource;
  OS_dispatch_source *v4;

  receiveHeartbeatTimeoutSource = self->_receiveHeartbeatTimeoutSource;
  if (receiveHeartbeatTimeoutSource)
  {
    dispatch_source_cancel(receiveHeartbeatTimeoutSource);
    v4 = self->_receiveHeartbeatTimeoutSource;
    self->_receiveHeartbeatTimeoutSource = 0;

  }
}

- (void)_receiveHeartbeatDidTimeout
{
  void *v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  HDWorkoutSessionRapportSyncController *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v6 = v3;
    -[HDWorkoutSessionRapportSyncController heartbeatReceiveTimeout](self, "heartbeatReceiveTimeout");
    v8 = 138543618;
    v9 = self;
    v10 = 2048;
    v11 = v7;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: No heartbeat received in the last %f seconds, marking session as disconnected.", (uint8_t *)&v8, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 554, CFSTR("Primary session is unreachable."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "didDisconnectFromRemoteWithError:", v5);

}

- (void)sendDataToRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  HKRateLimiter *dataRateLimiter;
  id v10;
  void *v11;
  _QWORD v12[4];
  HDWorkoutSessionRapportSyncController *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (-[HDWorkoutSessionRapportSyncController _isDataRateLimiterDisabledByUserDefaults](self, "_isDataRateLimiterDisabledByUserDefaults"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke;
    v16[3] = &unk_1E6CF6868;
    v17 = v6;
    -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("arbitraryData"), v16, v7);
    v8 = v17;
  }
  else
  {
    dataRateLimiter = self->_dataRateLimiter;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_2;
    v12[3] = &unk_1E6CEA160;
    v13 = self;
    v14 = v6;
    v10 = v7;
    v15 = v10;
    if ((-[HKRateLimiter perform:cost:](dataRateLimiter, "perform:cost:", v12, objc_msgSend(v14, "length", v12[0], 3221225472, __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_2, &unk_1E6CEA160, v13)) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 13, CFSTR("Data sent over the past 10 seconds exceeded the 100 KB size limit"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v11);

    }
    v8 = v14;
  }

}

uint64_t __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setArbitraryData:", *(_QWORD *)(a1 + 32));
}

void __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_3;
  v3[3] = &unk_1E6CF6868;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "sendRequest:transaction:completion:", CFSTR("arbitraryData"), v3, *(_QWORD *)(a1 + 48));

}

uint64_t __83__HDWorkoutSessionRapportSyncController_sendDataToRemoteWorkoutSession_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setArbitraryData:", *(_QWORD *)(a1 + 32));
}

- (void)receivedDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  HDWorkoutSessionServer **p_sessionServer;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  p_sessionServer = &self->_sessionServer;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "didReceiveDataFromRemoteWorkoutSession:completion:", v9, v6);
}

- (void)sendStateEvent:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int64_t v12;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__HDWorkoutSessionRapportSyncController_sendStateEvent_date_completion___block_invoke;
  v10[3] = &unk_1E6CF68D0;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("stateEvent"), v10, a5);

}

void __72__HDWorkoutSessionRapportSyncController_sendStateEvent_date_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "globalState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionStateEvent:", v3);

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v4, "globalState");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setSessionStateEventDate:", v7);
}

- (void)receivedStateEvent:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  int v12;
  HDWorkoutSessionRapportSyncController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if ((objc_msgSend(v6, "hasSessionStateEventDate") & 1) != 0)
  {
    objc_msgSend(v6, "sessionStateEventDate");
    HDDecodeDateForValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
    objc_msgSend(WeakRetained, "syncSessionEvent:date:", objc_msgSend(v6, "sessionStateEvent"), v8);

    v7[2](v7, 1, 0);
  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session event does not have an associated date", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Session event does not have an associated date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v11);

  }
}

- (void)sendStateUpdate:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  HDCodableWorkoutSessionGlobalState *v10;
  void *v11;
  HDCodableWorkoutSessionGlobalState *v12;
  _QWORD v13[4];
  HDCodableWorkoutSessionGlobalState *v14;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  -[HDCodableWorkoutSessionGlobalState setSessionState:](v10, "setSessionState:", a3);
  v11 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  -[HDCodableWorkoutSessionGlobalState setSessionStateChangeDate:](v10, "setSessionStateChangeDate:");
  if (!v8)

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__HDWorkoutSessionRapportSyncController_sendStateUpdate_date_completion___block_invoke;
  v13[3] = &unk_1E6CF6868;
  v14 = v10;
  v12 = v10;
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("stateUpdate"), v13, v9);

}

uint64_t __73__HDWorkoutSessionRapportSyncController_sendStateUpdate_date_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGlobalState:", *(_QWORD *)(a1 + 32));
}

- (void)receivedStateUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  int v12;
  HDWorkoutSessionRapportSyncController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "hasSessionStateChangeDate") & 1) != 0)
  {
    objc_msgSend(v6, "sessionStateChangeDate");
    HDDecodeDateForValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
    objc_msgSend(WeakRetained, "syncTransitionToState:date:completion:", objc_msgSend(v6, "sessionState"), v8, v7);

  }
  else
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v12 = 138543362;
      v13 = self;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Session state does not have an associated date", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("Session state does not have an associated date"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

- (void)sendEventUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDCodableWorkoutSessionGlobalState *v8;
  void *v9;
  void *v10;
  void *v11;
  HDCodableWorkoutSessionGlobalState *v12;
  _QWORD v13[4];
  HDCodableWorkoutSessionGlobalState *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  objc_msgSend(v7, "codableRepresentationForSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[HDCodableWorkoutSessionGlobalState setEvents:](v8, "setEvents:", v11);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__HDWorkoutSessionRapportSyncController_sendEventUpdate_completion___block_invoke;
  v13[3] = &unk_1E6CF6868;
  v14 = v8;
  v12 = v8;
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("eventUpdate"), v13, v6);

}

uint64_t __68__HDWorkoutSessionRapportSyncController_sendEventUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGlobalState:", *(_QWORD *)(a1 + 32));
}

- (void)receivedEventUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "hk_map:", &__block_literal_global_222_0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  objc_msgSend(WeakRetained, "syncWorkoutEvents:completion:", v8, v6);

}

uint64_t __72__HDWorkoutSessionRapportSyncController_receivedEventUpdate_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6E50], "createWithCodable:", a2);
}

- (void)sendBackgroundRuntimeRequestWithCompletion:(id)a3
{
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("backgroundRuntime"), 0, a3);
}

- (void)receivedBackgroundRuntimeRequestWithCompletion:(id)a3
{
  HDWorkoutSessionServer **p_sessionServer;
  id v4;
  id WeakRetained;

  p_sessionServer = &self->_sessionServer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(WeakRetained, "receivedBackgroundRuntimeRequestWithCompletion:", v4);

}

- (void)sendCurrentActivityUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HDCodableWorkoutSessionGlobalState *v8;
  void *v9;
  HDCodableWorkoutSessionGlobalState *v10;
  _QWORD v11[4];
  HDCodableWorkoutSessionGlobalState *v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
  objc_msgSend(v7, "codableRepresentationForSync");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCodableWorkoutSessionGlobalState setCurrentActivity:](v8, "setCurrentActivity:", v9);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__HDWorkoutSessionRapportSyncController_sendCurrentActivityUpdate_completion___block_invoke;
  v11[3] = &unk_1E6CF6868;
  v12 = v8;
  v10 = v8;
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:completion:](self, "sendRequest:transaction:completion:", CFSTR("activityUpdate"), v11, v6);

}

uint64_t __78__HDWorkoutSessionRapportSyncController_sendCurrentActivityUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setGlobalState:", *(_QWORD *)(a1 + 32));
}

- (void)receivedCurrentActivityUpdate:(id)a3 completion:(id)a4
{
  HDWorkoutSessionServer **p_sessionServer;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  p_sessionServer = &self->_sessionServer;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sessionServer);
  objc_msgSend(MEMORY[0x1E0CB6DD8], "createWithCodable:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "syncCurrentActivity:completion:", v8, v6);
}

- (void)rapportMessenger:(id)a3 didReceiveRequest:(id)a4 data:(id)a5 responseHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  HDWorkoutSessionServer **p_sessionServer;
  id WeakRetained;
  void *v21;
  void (**v22)(id, _QWORD, id);
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  int v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  void *v54;
  _QWORD aBlock[4];
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, id))a6;
  -[HDWorkoutSessionRapportSyncController _resetHeartbeat](self, "_resetHeartbeat");
  objc_msgSend(v9, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("recoverSession"));

  if (!v13)
  {
    v57 = 0;
    objc_msgSend((id)objc_opt_class(), "_decodedTransactionWithData:error:", v10, &v57);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v57;
    if (!v14)
    {
      v11[2](v11, 0, v15);
LABEL_27:

      goto LABEL_28;
    }
    v16 = (void *)MEMORY[0x1E0CB3A28];
    objc_msgSend(v14, "sessionUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_UUIDWithData:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    p_sessionServer = &self->_sessionServer;
    WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
    objc_msgSend(WeakRetained, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)v18;
    LOBYTE(v18) = objc_msgSend((id)v18, "isEqual:", v21);

    if ((v18 & 1) == 0)
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = (void *)objc_opt_class();
        v31 = v30;
        v32 = objc_loadWeakRetained((id *)p_sessionServer);
        objc_msgSend(v32, "identifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v59 = v30;
        v60 = 2114;
        v61 = v9;
        v62 = 2114;
        v63 = v54;
        v64 = 2114;
        v65 = v33;
        _os_log_impl(&dword_1B7802000, v29, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Ignoring incoming request %{public}@ because session UUID is different. Request UUID: %{public}@, local UUID: %{public}@", buf, 0x2Au);

      }
      goto LABEL_26;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__HDWorkoutSessionRapportSyncController_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke;
    aBlock[3] = &unk_1E6CE77F0;
    v22 = v11;
    v56 = v22;
    v23 = _Block_copy(aBlock);
    objc_msgSend(v9, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("startMirroring"));

    if ((v25 & 1) != 0)
    {
LABEL_25:

LABEL_26:
      goto LABEL_27;
    }
    objc_msgSend(v9, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("heartbeat"));

    if (v27)
    {
      -[HDWorkoutSessionRapportSyncController receivedHeartbeatWithCompletion:](self, "receivedHeartbeatWithCompletion:", v23);
      goto LABEL_25;
    }
    objc_msgSend(v9, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("stopMirroring"));

    if (v35)
    {
      -[HDWorkoutSessionRapportSyncController receivedMirroringStopRequestWithCompletion:](self, "receivedMirroringStopRequestWithCompletion:", v23);
      goto LABEL_25;
    }
    objc_msgSend(v9, "name");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("arbitraryData"));

    if (v37)
    {
      objc_msgSend(v14, "arbitraryData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDWorkoutSessionRapportSyncController receivedDataFromRemoteWorkoutSession:completion:](self, "receivedDataFromRemoteWorkoutSession:completion:", v38, v23);
    }
    else
    {
      objc_msgSend(v9, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("stateUpdate"));

      if (v40)
      {
        objc_msgSend(v14, "globalState");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDWorkoutSessionRapportSyncController receivedStateUpdate:completion:](self, "receivedStateUpdate:completion:", v38, v23);
      }
      else
      {
        objc_msgSend(v9, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("stateEvent"));

        if (v42)
        {
          objc_msgSend(v14, "globalState");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDWorkoutSessionRapportSyncController receivedStateEvent:completion:](self, "receivedStateEvent:completion:", v38, v23);
        }
        else
        {
          objc_msgSend(v9, "name");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("activityUpdate"));

          if (v44)
          {
            objc_msgSend(v14, "globalState");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "currentActivity");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDWorkoutSessionRapportSyncController receivedCurrentActivityUpdate:completion:](self, "receivedCurrentActivityUpdate:completion:", v45, v23);
          }
          else
          {
            objc_msgSend(v9, "name");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "isEqualToString:", CFSTR("eventUpdate"));

            if (!v47)
            {
              objc_msgSend(v9, "name");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("backgroundRuntime"));

              if (v49)
              {
                -[HDWorkoutSessionRapportSyncController receivedBackgroundRuntimeRequestWithCompletion:](self, "receivedBackgroundRuntimeRequestWithCompletion:", v23);
                goto LABEL_25;
              }
              _HKInitializeLogging();
              v50 = (void *)*MEMORY[0x1E0CB5380];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
              {
                v51 = v50;
                v52 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543618;
                v59 = v52;
                v60 = 2114;
                v61 = v9;
                v53 = v52;
                _os_log_error_impl(&dword_1B7802000, v51, OS_LOG_TYPE_ERROR, " [mirroring] %{public}@: No handler available for request %{public}@", buf, 0x16u);

              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, CFSTR("Unknown request"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v22[2](v22, 0, v38);
              goto LABEL_24;
            }
            objc_msgSend(v14, "globalState");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "events");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[HDWorkoutSessionRapportSyncController receivedEventUpdate:completion:](self, "receivedEventUpdate:completion:", v45, v23);
          }

        }
      }
    }
LABEL_24:

    goto LABEL_25;
  }
  -[HDWorkoutSessionRapportSyncController receivedRecoveryRequestWithResponseHandler:](self, "receivedRecoveryRequestWithResponseHandler:", v11);
LABEL_28:

}

uint64_t __97__HDWorkoutSessionRapportSyncController_rapportMessenger_didReceiveRequest_data_responseHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendRequest:(id)a3 transaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__HDWorkoutSessionRapportSyncController_sendRequest_transaction_completion___block_invoke;
  v10[3] = &unk_1E6CF6938;
  v11 = v8;
  v9 = v8;
  -[HDWorkoutSessionRapportSyncController sendRequest:transaction:responseHandler:](self, "sendRequest:transaction:responseHandler:", a3, a4, v10);

}

uint64_t __76__HDWorkoutSessionRapportSyncController_sendRequest_transaction_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3 == 0);
}

- (void)sendRequest:(id)a3 transaction:(id)a4 responseHandler:(id)a5
{
  id v8;
  void (**v9)(id, HDCodableWorkoutSessionSyncTransaction *);
  id v10;
  HDCodableWorkoutSessionSyncTransaction *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  HDCodableWorkoutSessionGlobalState *v15;
  NSDate *v16;
  NSDate *lock_lastPingDate;
  void *v18;
  HDRapportRequestIdentifier *v19;
  HDRapportMessenger *rapportMessenger;
  void *v21;
  _QWORD v22[5];
  HDCodableWorkoutSessionSyncTransaction *v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = (void (**)(id, HDCodableWorkoutSessionSyncTransaction *))a4;
  v10 = a5;
  v11 = objc_alloc_init(HDCodableWorkoutSessionSyncTransaction);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  objc_msgSend(WeakRetained, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_dataForUUIDBytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionSyncTransaction setSessionUUID:](v11, "setSessionUUID:", v14);

  if (v9)
  {
    v15 = objc_alloc_init(HDCodableWorkoutSessionGlobalState);
    -[HDCodableWorkoutSessionSyncTransaction setGlobalState:](v11, "setGlobalState:", v15);

    v9[2](v9, v11);
  }
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_lastPingDate = self->_lock_lastPingDate;
  self->_lock_lastPingDate = v16;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_pendingTransactionsByRequest, "objectForKeyedSubscript:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  if (v18)
  {
    -[HDWorkoutSessionRapportSyncController _enqueueTransaction:requestName:](self, "_enqueueTransaction:requestName:", v11, v8);
  }
  else
  {
    v19 = -[HDRapportRequestIdentifier initWithSchemaIdentifier:name:]([HDRapportRequestIdentifier alloc], "initWithSchemaIdentifier:name:", 0, v8);
    rapportMessenger = self->_rapportMessenger;
    -[HDCodableWorkoutSessionSyncTransaction data](v11, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81__HDWorkoutSessionRapportSyncController_sendRequest_transaction_responseHandler___block_invoke;
    v22[3] = &unk_1E6CF6960;
    v22[4] = self;
    v23 = v11;
    v24 = v8;
    v25 = v10;
    -[HDRapportMessenger sendRequest:data:completion:](rapportMessenger, "sendRequest:data:completion:", v19, v21, v22);

  }
}

void __81__HDWorkoutSessionRapportSyncController_sendRequest_transaction_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_resetHeartbeat");
    if (v5)
      goto LABEL_6;
    goto LABEL_8;
  }
  if (!objc_msgSend(v6, "hk_isObjectNotFoundError")
    || (WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16)),
        v9 = objc_msgSend(WeakRetained, "sessionType"),
        WeakRetained,
        v9 != 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "_enqueueTransaction:requestName:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    if (v5)
    {
LABEL_6:
      v13 = 0;
      objc_msgSend((id)objc_opt_class(), "_decodedTransactionWithData:error:", v5, &v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v13;
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

      goto LABEL_9;
    }
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "_cancelReceiveHeartbeatTimeout");
  v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v10, "didDisconnectFromRemoteWithError:", 0);

LABEL_9:
}

+ (id)_decodedTransactionWithData:(id)a3 error:(id *)a4
{
  id v5;
  HDCodableWorkoutSessionSyncTransaction *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[HDCodableWorkoutSessionSyncTransaction initWithData:]([HDCodableWorkoutSessionSyncTransaction alloc], "initWithData:", v5);
  if (!v6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)v12 = 138543618;
      *(_QWORD *)&v12[4] = objc_opt_class();
      *(_WORD *)&v12[12] = 2114;
      *(_QWORD *)&v12[14] = v5;
      v9 = *(id *)&v12[4];
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Unable to decode incoming request transaction with data: %{public}@", v12, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to decode incoming request."), *(_OWORD *)v12, *(_QWORD *)&v12[16], v13);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

  }
  return v6;
}

- (void)_resetHeartbeat
{
  os_unfair_lock_s *p_lock;
  NSDate *v4;
  NSDate *lock_lastPingDate;
  id WeakRetained;
  uint64_t v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lock_lastPingDate = self->_lock_lastPingDate;
  self->_lock_lastPingDate = v4;

  os_unfair_lock_unlock(p_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  v7 = objc_msgSend(WeakRetained, "sessionType");

  if (v7 == 1)
    -[HDWorkoutSessionRapportSyncController _scheduleReceiveHeartbeatTimeout](self, "_scheduleReceiveHeartbeatTimeout");
}

- (BOOL)_isDataRateLimiterDisabledByUserDefaults
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WorkoutSessionDataRateLimiterDisabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)_enqueueTransaction:(id)a3 requestName:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BYTE v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  v9 = objc_msgSend(WeakRetained, "sessionType");

  if (!v9
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("heartbeat")) & 1) == 0
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("arbitraryData")) & 1) == 0)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      *(_DWORD *)v20 = 138543618;
      *(_QWORD *)&v20[4] = objc_opt_class();
      *(_WORD *)&v20[12] = 2114;
      *(_QWORD *)&v20[14] = v6;
      v12 = *(id *)&v20[4];
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will enqueue failed transaction: %{public}@", v20, 0x16u);

    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("eventUpdate"))
      && (-[NSMutableDictionary objectForKeyedSubscript:](self->_lock_pendingTransactionsByRequest, "objectForKeyedSubscript:", v7), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = v14;
      objc_msgSend(v14, "globalState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "events");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "globalState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "events");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObjectsFromArray:", v19);

      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_pendingTransactionsByRequest, "setObject:forKeyedSubscript:", v6, v7, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21);
      os_unfair_lock_unlock(&self->_lock);
    }
  }

}

- (void)_sendPendingTransactions
{
  id WeakRetained;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_sessionServer);
  v4 = objc_msgSend(WeakRetained, "sessionType");

  if (!v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = (id)-[NSMutableDictionary copy](self->_lock_pendingTransactionsByRequest, "copy");
    -[NSMutableDictionary removeAllObjects](self->_lock_pendingTransactionsByRequest, "removeAllObjects");
    os_unfair_lock_unlock(&self->_lock);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke;
    v6[3] = &unk_1E6CF69A8;
    v6[4] = self;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

void __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)buf = 138543618;
    v15 = (id)objc_opt_class();
    v16 = 2114;
    v17 = v5;
    v9 = v15;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will send pending transaction: %{public}@", buf, 0x16u);

  }
  v10 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke_234;
  v12[3] = &unk_1E6CF6868;
  v13 = v5;
  v11 = v5;
  objc_msgSend(v10, "sendRequest:transaction:completion:", v6, v12, &__block_literal_global_235_0);

}

void __65__HDWorkoutSessionRapportSyncController__sendPendingTransactions__block_invoke_234(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConfiguration:", v5);

  objc_msgSend(*(id *)(a1 + 32), "globalState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalState:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_lastPingDate, 0);
  objc_storeStrong((id *)&self->_lock_pendingTransactionsByRequest, 0);
  objc_storeStrong((id *)&self->_receiveHeartbeatTimeoutSource, 0);
  objc_storeStrong((id *)&self->_sendHeartbeatTimeoutSource, 0);
  objc_storeStrong((id *)&self->_heartbeatSource, 0);
  objc_storeStrong((id *)&self->_dataRateLimiter, 0);
  objc_destroyWeak((id *)&self->_sessionServer);
  objc_storeStrong((id *)&self->_rapportMessenger, 0);
}

@end
