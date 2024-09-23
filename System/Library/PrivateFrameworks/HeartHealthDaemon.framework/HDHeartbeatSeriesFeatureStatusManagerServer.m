@implementation HDHeartbeatSeriesFeatureStatusManagerServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDHeartbeatSeriesFeatureStatusManagerServer *v17;
  id v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x1E0D2FB48]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDHeartbeatSeriesFeatureStatusManagerServer initWithUUID:configuration:client:delegate:]([HDHeartbeatSeriesFeatureStatusManagerServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

- (HDHeartbeatSeriesFeatureStatusManagerServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDHeartbeatSeriesFeatureStatusManagerServer *v11;
  HDHeartbeatSeriesFeatureStatusManager *v12;
  HDHeartbeatSeriesFeatureStatusManager *manager;
  objc_super v15;

  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDHeartbeatSeriesFeatureStatusManagerServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    v12 = -[HDHeartbeatSeriesFeatureStatusManager initWithClient:]([HDHeartbeatSeriesFeatureStatusManager alloc], "initWithClient:", v10);
    manager = v11->_manager;
    v11->_manager = v12;

  }
  return v11;
}

- (void)remote_startObservingChangesWithCompletion:(id)a3
{
  HDHeartbeatSeriesFeatureStatusManager *manager;
  id v5;

  manager = self->_manager;
  v5 = a3;
  -[HDHeartbeatSeriesFeatureStatusManager startObservingChangesWithDelegate:](manager, "startObservingChangesWithDelegate:", self);
  -[HDHeartbeatSeriesFeatureStatusManager getPredominantFeatureWithCompletion:](self->_manager, "getPredominantFeatureWithCompletion:", v5);

}

- (void)remote_stopObservingChanges
{
  -[HDHeartbeatSeriesFeatureStatusManager stopObservingChanges](self->_manager, "stopObservingChanges");
}

- (void)remote_updateAndNotifyAllObservers
{
  -[HDHeartbeatSeriesFeatureStatusManager notifyDelegateOfCurrentState](self->_manager, "notifyDelegateOfCurrentState");
}

- (void)heartbeatSeriesFeatureStatusManager:(id)a3 didUpdatePredominantFeature:(int64_t)a4
{
  void *v6;
  void *v7;

  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
    -[HDHeartbeatSeriesFeatureStatusManagerServer heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:].cold.1(v6);
  -[HDHeartbeatSeriesFeatureStatusManagerServer _clientRemoteObjectProxy](self, "_clientRemoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_heartbeatSeriesFeatureStatusManagerDidUpdatePredominantFeature:", a4);

}

- (void)heartbeatSeriesFeatureStatusManager:(id)a3 didFailToUpdateWithError:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEBUG))
    -[HDHeartbeatSeriesFeatureStatusManagerServer heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:].cold.1(v6, (uint64_t)self, (uint64_t)v5);
  -[HDHeartbeatSeriesFeatureStatusManagerServer _clientRemoteObjectProxy](self, "_clientRemoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "client_heartbeatSeriesFeatureStatusManagerDidFailToUpdateWithError:", v5);

}

- (id)_clientRemoteObjectProxy
{
  void *v2;
  void *v3;
  void *v4;

  -[HDStandardTaskServer client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)requiredEntitlements
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB51B0];
  v4[0] = *MEMORY[0x1E0CB5140];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0D2FC20], "taskIdentifier");
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

- (void)heartbeatSeriesFeatureStatusManager:(void *)a1 didUpdatePredominantFeature:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_class();
  v3 = v2;
  NSStringFromHKHeartbeatSeriesFeature();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v2;
  v9 = 2114;
  v10 = v5;
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, v1, v6, "[%{public}@] Received notification of predominant feature update: %{public}@", (uint8_t *)&v7);

}

- (void)heartbeatSeriesFeatureStatusManager:(uint64_t)a3 didFailToUpdateWithError:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v7 = 138543618;
  v8 = (id)objc_opt_class();
  v9 = 2114;
  v10 = a3;
  v5 = v8;
  OUTLINED_FUNCTION_0_3(&dword_1CC29C000, v4, v6, "[%{public}@] Received notification of update error: %{public}@", (uint8_t *)&v7);

}

@end
