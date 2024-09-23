@implementation HDWorkoutObserverServer

- (HDWorkoutObserverServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  HDWorkoutObserverServer *v6;
  NSLock *v7;
  NSLock *lock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDWorkoutObserverServer;
  v6 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v10, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v6->_lock;
    v6->_lock = v7;

  }
  return v6;
}

- (void)dealloc
{
  NSLock *lock;
  objc_super v4;
  _QWORD v5[5];

  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HDWorkoutObserverServer_dealloc__block_invoke;
  v5[3] = &unk_1E6CE80E8;
  v5[4] = self;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)HDWorkoutObserverServer;
  -[HDWorkoutObserverServer dealloc](&v4, sel_dealloc);
}

void __34__HDWorkoutObserverServer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 40))
  {
    objc_msgSend(*(id *)(v1 + 48), "workoutDataAccumulator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeDataAccumulationObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "profile");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "workoutManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unregisterCurrentWorkoutObserver:", *(_QWORD *)(a1 + 32));

  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB74B8];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB7058], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB7058], "clientInterface");
}

- (void)remote_startTaskServerIfNeeded
{
  NSLock *lock;
  void *v4;
  void *v5;
  _QWORD v6[5];

  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__HDWorkoutObserverServer_remote_startTaskServerIfNeeded__block_invoke;
  v6[3] = &unk_1E6CE80E8;
  v6[4] = self;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v6);
  -[HDStandardTaskServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerCurrentWorkoutObserver:", self);

}

uint64_t __57__HDWorkoutObserverServer_remote_startTaskServerIfNeeded__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
    *(_BYTE *)(v1 + 40) = 1;
  return result;
}

- (void)remote_waitForAutomaticWorkoutRecoveryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performWhenPostLaunchSessionRecoveryHasCompleted:", v4);

}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  id v5;
  NSLock *lock;
  id v7;
  _QWORD v8[4];
  id v9;
  HDWorkoutObserverServer *v10;

  v5 = a4;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__HDWorkoutObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v9 = v5;
  v10 = self;
  v7 = v5;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v8);
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, v7);

}

void __66__HDWorkoutObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    if (v3)
    {
      objc_msgSend(v3, "workoutDataAccumulator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeDataAccumulationObserver:", *(_QWORD *)(a1 + 40));

      v2 = *(void **)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), v2);
  objc_msgSend(*(id *)(a1 + 32), "workoutDataAccumulator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "workoutDataAccumulator");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addDataAccumulationObserver:", *(_QWORD *)(a1 + 40));

  }
}

- (void)_sendSnapshotForWorkout:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  if (a1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__HDWorkoutObserverServer__sendSnapshotForWorkout___block_invoke;
    v6[3] = &unk_1E6CE8030;
    v6[4] = a1;
    v3 = a2;
    objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentWorkoutSnapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "clientRemote_didUpdateWorkoutSnapshot:", v5);
  }
}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5
{
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, a4);
}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didUpdateDataAccumulator:(id)a5
{
  id v7;
  NSLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  HDWorkoutObserverServer *v13;

  v7 = a5;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HDWorkoutObserverServer_workoutManager_currentWorkout_didUpdateDataAccumulator___block_invoke;
  v11[3] = &unk_1E6CE8080;
  v12 = v7;
  v13 = self;
  v10 = v7;
  v9 = a4;
  -[NSLock hk_withLock:](lock, "hk_withLock:", v11);
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, v9);

}

uint64_t __82__HDWorkoutObserverServer_workoutManager_currentWorkout_didUpdateDataAccumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addDataAccumulationObserver:", *(_QWORD *)(a1 + 40));
}

- (void)workoutDataAccumulator:(id)a3 didUpdateEvents:(id)a4
{
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, self->_currentWorkout);
}

- (void)workoutDataAccumulator:(id)a3 didUpdateStartDate:(id)a4
{
  -[HDWorkoutObserverServer _sendSnapshotForWorkout:](self, self->_currentWorkout);
}

void __51__HDWorkoutObserverServer__sendSnapshotForWorkout___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of new snapshot: %{public}@", (uint8_t *)&v6, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_currentWorkout, 0);
}

@end
