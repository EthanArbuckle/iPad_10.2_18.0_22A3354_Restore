@implementation CAMTimelapseBackendController

- (CAMTimelapseBackendController)initWithPersistenceController:(id)a3 keepAliveController:(id)a4
{
  CAMTimelapseBackendController *v7;
  NSObject *v8;
  uint64_t v9;
  NSMutableArray *sessionContexts;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CAMNebulaKeepAliveController *keepAliveController;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *transactionForPersistenceUUID;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD handler[4];
  id v33;
  id buf[2];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CAMTimelapseBackendController;
  v7 = -[CAMTimelapseBackendController init](&v39, sel_init);
  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "CAMTimelapseBackendController initialized", (uint8_t *)buf, 2u);
    }

    objc_storeStrong((id *)&v7->__persistenceController, a3);
    objc_storeStrong((id *)&v7->__keepAliveController, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v28);
    v9 = objc_claimAutoreleasedReturnValue();
    sessionContexts = v7->__sessionContexts;
    v7->__sessionContexts = (NSMutableArray *)v9;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.camera.timelapse.backend.work", v11);
    workQueue = v7->__workQueue;
    v7->__workQueue = (OS_dispatch_queue *)v12;

    +[CAMTimelapseDiskUtilities readSortedStatesFromDiskMergeSecondaryState:](CAMTimelapseDiskUtilities, "readSortedStatesFromDiskMergeSecondaryState:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTimelapseBackendController _setCurrentState:](v7, "_setCurrentState:", v15);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v36;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v16);
          keepAliveController = v7->__keepAliveController;
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v19), "timelapseUUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMNebulaKeepAliveController startKeepAliveForIdentifier:](keepAliveController, "startKeepAliveForIdentifier:", v21);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v17);
    }

    objc_initWeak(buf, v7);
    -[CAMTimelapseBackendController _workQueue](v7, "_workQueue");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke;
    handler[3] = &unk_1EA329270;
    objc_copyWeak(&v33, buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.suspend", &v7->__notifyRegisterTokenSuspendIO, v22, handler);

    -[CAMTimelapseBackendController _workQueue](v7, "_workQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    v30[0] = v23;
    v30[1] = 3221225472;
    v30[2] = __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke_5;
    v30[3] = &unk_1EA329270;
    objc_copyWeak(&v31, buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.resume", &v7->__notifyRegisterTokenResumeIO, v24, v30);

    v7->__oldMovieWriterEnabled = CFPreferencesGetAppBooleanValue(CFSTR("CAMTimelapseOldMovieWriterEnabled"), CFSTR("com.apple.camera"), 0) != 0;
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transactionForPersistenceUUID = v7->__transactionForPersistenceUUID;
    v7->__transactionForPersistenceUUID = v25;

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(buf);

  }
  return v7;
}

void __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_movieWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Suspending timelapse IO work for Camera", v4, 2u);
    }

    objc_msgSend(v2, "setSuspended:", 1);
    objc_msgSend(WeakRetained, "_workQueue_setupCameraProcessMonitoringIfNecessary");
  }

}

void __83__CAMTimelapseBackendController_initWithPersistenceController_keepAliveController___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_movieWriter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "Resuming timelapse IO work", v4, 2u);
    }

    objc_msgSend(v2, "setSuspended:", 0);
  }

}

- (CAMTimelapseBackendController)init
{
  -[CAMTimelapseBackendController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMTimelapseBackendController initWithPersistenceController:keepAliveController:](self, "initWithPersistenceController:keepAliveController:", 0, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  notify_cancel(self->__notifyRegisterTokenSuspendIO);
  notify_cancel(self->__notifyRegisterTokenResumeIO);
  -[CAMTimelapseBackendController _workQueue](self, "_workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CAMTimelapseBackendController_dealloc__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)CAMTimelapseBackendController;
  -[CAMTimelapseBackendController dealloc](&v4, sel_dealloc);
}

uint64_t __40__CAMTimelapseBackendController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_destroyApplicationStateMonitor");
}

- (void)_setCurrentState:(id)a3
{
  CAMTimelapseState *v5;
  CAMTimelapseState *v6;

  v5 = (CAMTimelapseState *)a3;
  if (self->__currentState != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__currentState, a3);
    -[CAMTimelapseBackendController _setCapturing:](self, "_setCapturing:", -[CAMTimelapseState canContinueCapture](self->__currentState, "canContinueCapture"));
    v5 = v6;
  }

}

- (void)_setCapturing:(BOOL)a3
{
  NSObject *v4;
  _BOOL4 capturing;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->__capturing != a3)
  {
    self->__capturing = a3;
    v4 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      capturing = self->__capturing;
      v6[0] = 67109120;
      v6[1] = capturing;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Capturing=%d", (uint8_t *)v6, 8u);
    }

  }
}

- (void)_dispatchToWorkQueueWithBlock:(id)a3
{
  id v4;
  void *v5;
  NSObject *workQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)os_transaction_create();
  workQueue = self->__workQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__CAMTimelapseBackendController__dispatchToWorkQueueWithBlock___block_invoke;
  v9[3] = &unk_1EA329298;
  v10 = v5;
  v11 = v4;
  v7 = v5;
  v8 = v4;
  dispatch_async(workQueue, v9);

}

void __63__CAMTimelapseBackendController__dispatchToWorkQueueWithBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0B55E8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_dispatchToWorkQueueAfterDelay:(double)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *workQueue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a4;
  v7 = (void *)os_transaction_create();
  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  workQueue = self->__workQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__CAMTimelapseBackendController__dispatchToWorkQueueAfterDelay_withBlock___block_invoke;
  v12[3] = &unk_1EA329298;
  v13 = v7;
  v14 = v6;
  v10 = v7;
  v11 = v6;
  dispatch_after(v8, workQueue, v12);

}

void __74__CAMTimelapseBackendController__dispatchToWorkQueueAfterDelay_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0B55E8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_dispatchToMainQueueWithBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = (void *)os_transaction_create();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CAMTimelapseBackendController__dispatchToMainQueueWithBlock___block_invoke;
  v7[3] = &unk_1EA329298;
  v8 = v4;
  v9 = v3;
  v5 = v4;
  v6 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __63__CAMTimelapseBackendController__dispatchToMainQueueWithBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0B55E8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)startTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[CAMNebulaKeepAliveController startKeepAliveForIdentifier:](self->__keepAliveController, "startKeepAliveForIdentifier:", v4);
  +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:mergeSecondaryState:](CAMTimelapseDiskUtilities, "readStateForTimelapseUUID:mergeSecondaryState:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMTimelapseBackendController _setCurrentState:](self, "_setCurrentState:", v5);
}

- (void)resumeTimelapseWithUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:mergeSecondaryState:](CAMTimelapseDiskUtilities, "readStateForTimelapseUUID:mergeSecondaryState:", v4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMTimelapseBackendController _setCurrentState:](self, "_setCurrentState:", v5);
}

- (void)updateTimelapseWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:mergeSecondaryState:](CAMTimelapseDiskUtilities, "readStateForTimelapseUUID:mergeSecondaryState:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMTimelapseBackendController _setCurrentState:](self, "_setCurrentState:", v5);
  v6 = (void *)-[CAMTimelapseState copy](self->__currentState, "copy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__CAMTimelapseBackendController_updateTimelapseWithUUID___block_invoke;
  v9[3] = &unk_1EA329360;
  v9[4] = self;
  v10 = v4;
  v11 = v6;
  v7 = v6;
  v8 = v4;
  -[CAMTimelapseBackendController _dispatchToWorkQueueWithBlock:](self, "_dispatchToWorkQueueWithBlock:", v9);

}

void __57__CAMTimelapseBackendController_updateTimelapseWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_getOrCreateSessionContextForTimelapseUUID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateSessionContext:withState:", v2, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_performPendingWork");

}

- (void)finishCaptureForTimelapseWithUUID:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
}

- (void)stopTimelapseWithUUID:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
}

- (void)updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__CAMTimelapseBackendController_updatePendingWorkFromDiskForceEndLastSession___block_invoke;
  v3[3] = &unk_1EA328908;
  v3[4] = self;
  v4 = a3;
  -[CAMTimelapseBackendController _dispatchToWorkQueueWithBlock:](self, "_dispatchToWorkQueueWithBlock:", v3);
}

uint64_t __78__CAMTimelapseBackendController_updatePendingWorkFromDiskForceEndLastSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePendingWorkFromDiskForceEndLastSession:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_updatePendingWorkFromDiskForceEndLastSession:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[6];
  BOOL v15;
  _QWORD v16[5];
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[8];
  uint8_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v3;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "CAMTimelapseBackendController _updatePendingWorkFromDiskForceEndLastSession:%d", buf, 8u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  +[CAMTimelapseDiskUtilities timelapseUUIDsOnDisk](CAMTimelapseDiskUtilities, "timelapseUUIDsOnDisk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities readSortedStatesFromDiskMergeSecondaryState:](CAMTimelapseDiskUtilities, "readSortedStatesFromDiskMergeSecondaryState:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke;
  v18[3] = &unk_1EA330060;
  v11 = v8;
  v19 = v11;
  v12 = v9;
  v20 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_58);
  *(_QWORD *)buf = 0;
  v22 = buf;
  v23 = 0x2020000000;
  v24 = 0;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3;
  v17[3] = &unk_1EA3300C8;
  v17[4] = self;
  v17[5] = buf;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
  if (v22[24])
  {
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_20;
    v16[3] = &unk_1EA328868;
    v16[4] = self;
    -[CAMTimelapseBackendController _dispatchToWorkQueueAfterDelay:withBlock:](self, "_dispatchToWorkQueueAfterDelay:withBlock:", v16, 5.0);
  }
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_2_21;
  v14[3] = &unk_1EA3300F0;
  v15 = v3;
  v14[4] = self;
  v14[5] = objc_msgSend(v7, "count") - 1;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v14);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_23;
  v13[3] = &unk_1EA330118;
  v13[4] = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
  -[CAMTimelapseBackendController _performPendingWork](self, "_performPendingWork");
  _Block_object_dispose(buf, 8);

}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "timelapseUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v4, "timelapseUUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "removeObject:", v7);
}

id __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[CAMTimelapseDiskUtilities updateSecondaryStateForTimelapseUUID:forStateReadSuccessfully:](CAMTimelapseDiskUtilities, "updateSecondaryStateForTimelapseUUID:forStateReadSuccessfully:", a2, 1);
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[CAMTimelapseDiskUtilities updateSecondaryStateForTimelapseUUID:forStateReadSuccessfully:](CAMTimelapseDiskUtilities, "updateSecondaryStateForTimelapseUUID:forStateReadSuccessfully:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "failedStateReadAttemptsCount");
  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "maxFailedStateReadAttempts");

  v8 = os_log_create("com.apple.camera", "Nebula");
  v9 = v8;
  if (v5 >= v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_permanentlyFailTimelapseUUID:withState:", v3, 0);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v3;
      v12 = 2048;
      v13 = v5;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "No state found for directory %{public}@ after %ld attempts. Will retry...", (uint8_t *)&v10, 0x16u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

uint64_t __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePendingWorkFromDiskForceEndLastSession:", 0);
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_2_21(uint64_t a1, void *a2, uint64_t a3)
{
  int v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = objc_msgSend(v13, "canContinueCapture");
  v6 = v13;
  if (v5)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      v7 = 128;
LABEL_8:
      v9 = v13;
      goto LABEL_9;
    }
    if (*(_QWORD *)(a1 + 40) != a3)
    {
      v7 = 16;
      goto LABEL_8;
    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "_isCameraRunning");
    v6 = v13;
    if ((v8 & 1) == 0)
    {
      v7 = 64;
      v9 = v13;
LABEL_9:
      objc_msgSend(v9, "timelapseUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAMTimelapseDiskUtilities updateSecondaryStateForTimelapseUUID:withStopReasons:stopTime:](CAMTimelapseDiskUtilities, "updateSecondaryStateForTimelapseUUID:withStopReasons:stopTime:", v10, v7, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "mergeSecondaryState:", v12);
      objc_msgSend(v13, "forceCompleted");
      +[CAMTimelapseDiskUtilities writeStateToDisk:createDirectoryIfNeeded:](CAMTimelapseDiskUtilities, "writeStateToDisk:createDirectoryIfNeeded:", v13, 0);

      v6 = v13;
    }
  }

}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "timelapseUUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_getOrCreateSessionContextForTimelapseUUID:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateSessionContext:withState:", v4, v3);

}

- (void)_updateSessionContext:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  char v27;
  uint8_t buf[4];
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  objc_msgSend(v6, "setState:", v7);
  objc_msgSend(v6, "timelapseUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities readFrameFilePathsForTimelapseUUID:](CAMTimelapseDiskUtilities, "readFrameFilePathsForTimelapseUUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = objc_msgSend(v7, "frameIndexStride");
    v11 = objc_msgSend(v7, "isReadyForWritingMovie");
    v12 = objc_msgSend(v7, "canContinueCapture");
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke;
    v23[3] = &unk_1EA330140;
    v26 = v10;
    v15 = v13;
    v24 = v15;
    v27 = v12;
    v16 = v14;
    v25 = v16;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v23);
    if ((v12 & 1) == 0 && (v11 & 1) == 0)
    {
      +[CAMTimelapseState maxTimeToWaitForWrittenFrameAfterStop](CAMTimelapseState, "maxTimeToWaitForWrittenFrameAfterStop");
      v18 = v17;
      v19 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v29 = v18;
        _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "Timelapse stopped but we are still waiting for the last frames to be written before we can write the movie. Will check again in %f seconds in case we are never notified of the final frames", buf, 0xCu);
      }

      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke_26;
      v22[3] = &unk_1EA328868;
      v22[4] = self;
      -[CAMTimelapseBackendController _dispatchToWorkQueueAfterDelay:withBlock:](self, "_dispatchToWorkQueueAfterDelay:withBlock:", v22, v18);
    }
    +[CAMTimelapseDiskUtilities sortedArrayFromFilePathDictionary:reverse:](CAMTimelapseDiskUtilities, "sortedArrayFromFilePathDictionary:reverse:", v15, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMTimelapseDiskUtilities sortedArrayFromFilePathDictionary:reverse:](CAMTimelapseDiskUtilities, "sortedArrayFromFilePathDictionary:reverse:", v16, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
    v20 = 0;
  }
  objc_msgSend(v6, "setFilesToDelete:", v20);
  objc_msgSend(v6, "setFilesToWrite:", v21);

}

void __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(uint64_t *)(a1 + 48) >= 2 && objc_msgSend(v7, "integerValue") % *(_QWORD *)(a1 + 48))
  {
    v6 = (id *)(a1 + 32);
LABEL_6:
    objc_msgSend(*v6, "setObject:forKey:", v5, v7);
    goto LABEL_7;
  }
  if (!*(_BYTE *)(a1 + 56))
  {
    v6 = (id *)(a1 + 40);
    goto LABEL_6;
  }
LABEL_7:

}

uint64_t __65__CAMTimelapseBackendController__updateSessionContext_withState___block_invoke_26(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Checking if there is work to do after delay", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updatePendingWorkFromDiskForceEndLastSession:", 0);
}

- (id)_getOrCreateSessionContextForTimelapseUUID:(id)a3
{
  id v4;
  NSMutableArray *sessionContexts;
  id v6;
  void *v7;
  CAMTimelapseBackendSessionContext *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__32;
  v23 = __Block_byref_object_dispose__32;
  v24 = 0;
  sessionContexts = self->__sessionContexts;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __76__CAMTimelapseBackendController__getOrCreateSessionContextForTimelapseUUID___block_invoke;
  v16 = &unk_1EA330168;
  v6 = v4;
  v17 = v6;
  v18 = &v19;
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionContexts, "enumerateObjectsUsingBlock:", &v13);
  v7 = (void *)v20[5];
  if (!v7)
  {
    v8 = [CAMTimelapseBackendSessionContext alloc];
    v9 = -[CAMTimelapseBackendSessionContext initWithTimelapseUUID:](v8, "initWithTimelapseUUID:", v6, v13, v14, v15, v16);
    v10 = (void *)v20[5];
    v20[5] = v9;

    -[NSMutableArray addObject:](self->__sessionContexts, "addObject:", v20[5]);
    v7 = (void *)v20[5];
  }
  v11 = v7;

  _Block_object_dispose(&v19, 8);
  return v11;
}

void __76__CAMTimelapseBackendController__getOrCreateSessionContextForTimelapseUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "timelapseUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_performPendingWork
{
  NSMutableArray *sessionContexts;
  uint64_t v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSMutableArray *v10;
  _QWORD v11[5];
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  sessionContexts = self->__sessionContexts;
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke;
  v20[3] = &unk_1EA330168;
  v20[4] = self;
  v20[5] = &v21;
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionContexts, "enumerateObjectsUsingBlock:", v20);
  if (*((_BYTE *)v22 + 24))
    goto LABEL_7;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__32;
  v18 = __Block_byref_object_dispose__32;
  v19 = 0;
  v5 = self->__sessionContexts;
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2;
  v13[3] = &unk_1EA330168;
  v13[4] = self;
  v13[5] = &v14;
  -[NSMutableArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", v13);
  v6 = (void *)v15[5];
  if (v6)
  {
    objc_msgSend(v6, "timelapseUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15[5], "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v7;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Deleting timelapse session that completed with zero frames: %{public}@", buf, 0xCu);
    }

    -[CAMTimelapseBackendController _permanentlyFailTimelapseUUID:withState:](self, "_permanentlyFailTimelapseUUID:withState:", v7, v8);
    *((_BYTE *)v22 + 24) = 1;

  }
  _Block_object_dispose(&v14, 8);

  if (*((_BYTE *)v22 + 24))
    goto LABEL_7;
  if (!self->__writingMovie)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__32;
    v18 = __Block_byref_object_dispose__32;
    v19 = 0;
    v10 = self->__sessionContexts;
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_35;
    v12[3] = &unk_1EA330168;
    v12[4] = self;
    v12[5] = &v14;
    -[NSMutableArray enumerateObjectsUsingBlock:](v10, "enumerateObjectsUsingBlock:", v12);
    if (v15[5])
    {
      -[CAMTimelapseBackendController _writeMovieForSessionContext:](self, "_writeMovieForSessionContext:");
      *((_BYTE *)v22 + 24) = 1;
    }
    _Block_object_dispose(&v14, 8);

    if (*((_BYTE *)v22 + 24))
    {
LABEL_7:
      v11[0] = v4;
      v11[1] = 3221225472;
      v11[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2_36;
      v11[3] = &unk_1EA328868;
      v11[4] = self;
      -[CAMTimelapseBackendController _dispatchToWorkQueueWithBlock:](self, "_dispatchToWorkQueueWithBlock:", v11);
    }
  }
  _Block_object_dispose(&v21, 8);
}

void __52__CAMTimelapseBackendController__performPendingWork__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "filesToDelete");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
      objc_msgSend(*(id *)(a1 + 32), "_deleteItemAtPath:", v7);
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("DBG"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if (v11)
      objc_msgSend(*(id *)(a1 + 32), "_deleteItemAtPath:", v9);
    objc_msgSend(v7, "stringByDeletingPathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("tvis"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

    if (v15)
      objc_msgSend(*(id *)(a1 + 32), "_deleteItemAtPath:", v13);
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v6, "subarrayWithRange:", 0, objc_msgSend(v6, "count") - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v17, "setFilesToDelete:", v16);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;

  }
}

void __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReadyForWritingMovie");
  objc_msgSend(v7, "filesToWrite");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 && !v11)
  {
    objc_msgSend(v7, "timelapseUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMTimelapseDiskUtilities readFrameFilePathsForTimelapseUUID:](CAMTimelapseDiskUtilities, "readFrameFilePathsForTimelapseUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count"))
    {
      v14 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "fullDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "Timelapse session thought it had no files to write but frames found on disk for: %{public}@", buf, 0xCu);

      }
      v16 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __52__CAMTimelapseBackendController__performPendingWork__block_invoke_34;
      v17[3] = &unk_1EA328868;
      v17[4] = v16;
      objc_msgSend(v16, "_dispatchToWorkQueueAfterDelay:withBlock:", v17, 2.0);
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }

  }
}

uint64_t __52__CAMTimelapseBackendController__performPendingWork__block_invoke_34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePendingWorkFromDiskForceEndLastSession:", 0);
}

void __52__CAMTimelapseBackendController__performPendingWork__block_invoke_35(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filesToWrite");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v7, "isReadyForWritingMovie"))
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v11, "timelapseUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v9) = objc_msgSend(v9, "_scheduleDelayedMovieWriteIfNeededForTimelapseUUID:", v10);

      if ((v9 & 1) == 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *a4 = 1;
      }
    }
  }

}

uint64_t __52__CAMTimelapseBackendController__performPendingWork__block_invoke_2_36(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPendingWork");
}

- (void)_permanentlyFailTimelapseUUID:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *sessionContexts;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseBackendController _permanentlyFailTimelapseUUID:withState:].cold.1(v7, v8);

  }
  +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMTimelapseBackendController _shouldSaveLastTimelapseDataForDebugging](self, "_shouldSaveLastTimelapseDataForDebugging"))
  {
    -[CAMTimelapseBackendController _saveTimelapseDirectoryForDebuggingTimelapseUUID:](self, "_saveTimelapseDirectoryForDebuggingTimelapseUUID:", v6);
  }
  else
  {
    -[CAMTimelapseBackendController _deleteItemAtPath:](self, "_deleteItemAtPath:", v9);
  }
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__32;
  v22 = __Block_byref_object_dispose__32;
  v23 = 0;
  sessionContexts = self->__sessionContexts;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __73__CAMTimelapseBackendController__permanentlyFailTimelapseUUID_withState___block_invoke;
  v15 = &unk_1EA330168;
  v11 = v6;
  v16 = v11;
  v17 = &v18;
  -[NSMutableArray enumerateObjectsUsingBlock:](sessionContexts, "enumerateObjectsUsingBlock:", &v12);
  if (v19[5])
    -[NSMutableArray removeObject:](self->__sessionContexts, "removeObject:", v12, v13, v14, v15);
  -[CAMNebulaKeepAliveController stopKeepAliveForIdentifier:](self->__keepAliveController, "stopKeepAliveForIdentifier:", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v18, 8);
}

void __73__CAMTimelapseBackendController__permanentlyFailTimelapseUUID_withState___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timelapseUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_scheduleDelayedMovieWriteIfNeededForTimelapseUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  NSObject *v17;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CAMTimelapseDiskUtilities readSecondaryStateForTimelapseUUID:](CAMTimelapseDiskUtilities, "readSecondaryStateForTimelapseUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "movieWriteAttemptsCount");
  if (v6 < 1)
  {
    v16 = 0;
  }
  else
  {
    v7 = v6;
    objc_msgSend(v5, "lastMovieWriteAttemptTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v11 = v10;

    +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "waitTimeBeforeNextWriteForNumberOfPreviousAttempts:", v7);
    v14 = v13;

    v15 = v14 - v11;
    v16 = v15 > 0.0;
    if (v15 > 0.0)
    {
      v17 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v21 = v4;
        v22 = 2048;
        v23 = v15;
        _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Not ready to write movie for timelapse %{public}@. Delaying %.2f seconds", buf, 0x16u);
      }

      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __84__CAMTimelapseBackendController__scheduleDelayedMovieWriteIfNeededForTimelapseUUID___block_invoke;
      v19[3] = &unk_1EA328868;
      v19[4] = self;
      -[CAMTimelapseBackendController _dispatchToWorkQueueAfterDelay:withBlock:](self, "_dispatchToWorkQueueAfterDelay:withBlock:", v19, v15);
    }

  }
  return v16;
}

uint64_t __84__CAMTimelapseBackendController__scheduleDelayedMovieWriteIfNeededForTimelapseUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPendingWork");
}

- (BOOL)_deleteItemAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v9);
    v6 = v9;

    if ((v5 & 1) == 0)
    {
      v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CAMTimelapseBackendController _deleteItemAtPath:].cold.1();

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_writeMovieForSessionContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  CAMTimelapseBackendController *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  double v25;
  double v26;
  char v27;
  void *v28;
  CAMTimelapseMovieWriterProtocol *v29;
  CAMTimelapseMovieWriterProtocol *movieWriter;
  NSObject *v31;
  CAMTimelapseMovieWriterProtocol *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  CAMTimelapseBackendController *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t v51[16];
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  char v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[32];
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  objc_msgSend(v4, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timelapseUUID");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.camera", "Nebula");
  v50 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v5, "stopReasons");
    objc_msgSend(v50, "fullDescription");
    v9 = self;
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    v5 = v50;
    *(_WORD *)&buf[22] = 2114;
    *(_QWORD *)&buf[24] = v10;
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "Starting to write timelapse movie for %{public}@ (stopReasons = %ld) %{public}@", buf, 0x20u);

    self = v9;
  }

  +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "stringByAppendingPathComponent:", CFSTR("MOVIE.MOV"));
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "fileExistsAtPath:", v11))
    -[CAMTimelapseBackendController _deleteItemAtPath:](self, "_deleteItemAtPath:", v11);
  v43 = (void *)v11;
  +[CAMTimelapseDiskUtilities removeDummyFileForTimelapseUUID:](CAMTimelapseDiskUtilities, "removeDummyFileForTimelapseUUID:", v6);
  v46 = (void *)v6;
  +[CAMTimelapseDiskUtilities updateSecondaryStateForMovieWriteAttemptForTimelapseUUID:](CAMTimelapseDiskUtilities, "updateSecondaryStateForMovieWriteAttemptForTimelapseUUID:", v6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = self;
  -[CAMTimelapseBackendController _createPlaceholderAssetForState:](self, "_createPlaceholderAssetForState:", v5);
  v49 = v4;
  objc_msgSend(v4, "filesToWrite");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");

  v40 = objc_msgSend(v13, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v63;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "stringByDeletingPathExtension");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("tvis"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "fileExistsAtPath:", v21);

        if ((v23 & 1) == 0)
        {

          goto LABEL_15;
        }
        objc_msgSend(v14, "addObject:", v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      if (v17)
        continue;
      break;
    }
  }
LABEL_15:

  +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "outputFPSForFrameCount:", v40);
  v26 = v25;

  v67 = 0u;
  memset(buf, 0, sizeof(buf));
  -[CAMTimelapseBackendController _frameTransformForState:](v44, "_frameTransformForState:", v50);
  objc_msgSend(v50, "startTime");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "startLocation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v50, "preferHEVC");
  v28 = (void *)os_transaction_create();
  v44->__writingMovie = 1;
  objc_msgSend(v14, "count");
  v29 = (CAMTimelapseMovieWriterProtocol *)objc_alloc_init((Class)objc_opt_class());
  movieWriter = v44->__movieWriter;
  v44->__movieWriter = v29;

  if (+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity](CAMProtectionController, "isCameraPerformingHighPriorityDiskActivity"))
  {
    v31 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_1DB760000, v31, OS_LOG_TYPE_DEFAULT, "Starting timelapse movie writer suspended for Camera", v51, 2u);
    }

    -[CAMTimelapseBackendController _workQueue_setupCameraProcessMonitoringIfNecessary](v44, "_workQueue_setupCameraProcessMonitoringIfNecessary");
    -[CAMTimelapseMovieWriterProtocol setSuspended:](v44->__movieWriter, "setSuspended:", -[CAMTimelapseBackendController _isCameraRunning](v44, "_isCameraRunning"));
  }
  v32 = v44->__movieWriter;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke;
  v54[3] = &unk_1EA3301B8;
  v54[4] = v44;
  v55 = v43;
  v56 = v50;
  v57 = v42;
  v58 = v46;
  v59 = v15;
  v61 = v27;
  v60 = v28;
  *(_OWORD *)v51 = *(_OWORD *)buf;
  v52 = *(_OWORD *)&buf[16];
  v53 = v67;
  v45 = v28;
  v33 = v15;
  v34 = v46;
  v35 = v42;
  v36 = v50;
  v37 = v43;
  LOBYTE(v38) = v27;
  -[CAMTimelapseMovieWriterProtocol writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:](v32, "writeMovieFromImageFiles:visMetadataFiles:startDate:location:outputPath:transform:framesPerSecond:preferHEVC:completionHandler:", v33, v14, v41, v39, v37, v51, (uint64_t)v26, v38, v54);

}

void __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke(uint64_t a1, char a2, __int128 *a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  char v23;

  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2;
  v11[3] = &unk_1EA330190;
  v22 = a2;
  v8 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v9 = v8;
  v20 = *a3;
  v21 = *((_QWORD *)a3 + 2);
  v13 = v9;
  v14 = v7;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 72);
  v23 = *(_BYTE *)(a1 + 88);
  v19 = *(id *)(a1 + 80);
  v10 = v7;
  objc_msgSend(v12, "_dispatchToWorkQueueWithBlock:", v11);

}

uint64_t __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  __int128 v17;
  uint64_t v18;

  if (*(_BYTE *)(a1 + 120))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 56);
    v17 = *(_OWORD *)(a1 + 96);
    v18 = *(_QWORD *)(a1 + 112);
    objc_msgSend(v2, "_movieWrittenToFilePath:duration:metadata:state:", v3, &v17, v4, v5);
  }
  else
  {
    v6 = objc_msgSend(*(id *)(a1 + 64), "movieWriteAttemptsCount");
    +[CAMTimelapseSettings sharedInstance](CAMTimelapseSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maxMovieWriteAttempts");

    v9 = os_log_create("com.apple.camera", "Nebula");
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v6 >= v8)
    {
      if (v10)
        __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_2();

      objc_msgSend(*(id *)(a1 + 32), "_permanentlyFailTimelapseUUID:withState:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (v10)
        __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_1();

      objc_msgSend(*(id *)(a1 + 80), "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_reserveDummyFileForTimelapseUUID:firstImageFilePath:useHEVC:", *(_QWORD *)(a1 + 72), v11, *(unsigned __int8 *)(a1 + 121));

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setSuspended:", 0);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_workQueue_destroyApplicationStateMonitor");
  v14 = *(void **)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_43;
  v16[3] = &unk_1EA328868;
  v16[4] = v14;
  return objc_msgSend(v14, "_dispatchToWorkQueueWithBlock:", v16);
}

uint64_t __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_43(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPendingWork");
}

- (void)_reserveDummyFileForTimelapseUUID:(id)a3 firstImageFilePath:(id)a4 useHEVC:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  __CVBuffer *v8;
  size_t Width;
  size_t Height;
  id v11;

  v5 = a5;
  v7 = a3;
  v11 = +[CAMTimelapseJPEGReader newDataFromFilePath:](CAMTimelapseJPEGReader, "newDataFromFilePath:", a4);
  v8 = +[CAMTimelapseJPEGReader createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:](CAMTimelapseJPEGReader, "createPixelBufferFromData:applyTransform:maxPixelSize:useBGRA:", v11, 1, 0, 0);
  Width = CVPixelBufferGetWidth(v8);
  Height = CVPixelBufferGetHeight(v8);
  CVPixelBufferRelease(v8);
  +[CAMTimelapseDiskUtilities reserveDummyFileForTimelapseUUID:width:height:useHEVC:](CAMTimelapseDiskUtilities, "reserveDummyFileForTimelapseUUID:width:height:useHEVC:", v7, Width, Height, v5);

}

- (void)_createPlaceholderAssetForState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  +[CAMTimelapseController createPlaceholderResultForTimelapseState:](CAMTimelapseController, "createPlaceholderResultForTimelapseState:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)os_transaction_create();
    -[CAMTimelapseBackendController _persistenceController](self, "_persistenceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__CAMTimelapseBackendController__createPlaceholderAssetForState___block_invoke;
    v8[3] = &unk_1EA32E720;
    v9 = v5;
    v7 = v5;
    objc_msgSend(v6, "persistPlaceholderTimelapseVideoWithResult:completionHandler:", v4, v8);

  }
}

- (void)_movieWrittenToFilePath:(id)a3 duration:(id *)a4 metadata:(id)a5 state:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[16];
  int64_t var3;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->__workQueue);
  v13 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "timelapseUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v14;
    _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Finished writing timelapse movie for %{public}@", buf, 0xCu);

  }
  v15 = (void *)MEMORY[0x1E0D73148];
  objc_msgSend(v12, "timelapseUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "uniqueIncomingPathForAssetWithUUID:andExtension:isPhotoStream:", v16, CFSTR("MOV"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v19 = objc_msgSend(v18, "linkItemAtPath:toPath:error:", v10, v17, &v27);
  v20 = v27;
  if (v19)
  {
    v21 = -[CAMTimelapseBackendController _shouldSaveLastTimelapseDataForDebugging](self, "_shouldSaveLastTimelapseDataForDebugging");
    if (!v21)
      -[CAMTimelapseBackendController _deleteItemAtPath:](self, "_deleteItemAtPath:", v10);
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[CAMTimelapseBackendController _notifyAssetsdOfIncomingMovieAtPath:duration:metadata:state:](self, "_notifyAssetsdOfIncomingMovieAtPath:duration:metadata:state:", v17, buf, v11, v12);
    objc_msgSend(v12, "timelapseUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v12, "timelapseUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMTimelapseBackendController _saveTimelapseDirectoryForDebuggingTimelapseUUID:](self, "_saveTimelapseDirectoryForDebuggingTimelapseUUID:", v24);

    }
    else
    {
      -[CAMTimelapseBackendController _deleteItemAtPath:](self, "_deleteItemAtPath:", v23);
    }
    objc_msgSend(v12, "timelapseUUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMTimelapseBackendController _getOrCreateSessionContextForTimelapseUUID:](self, "_getOrCreateSessionContextForTimelapseUUID:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObject:](self->__sessionContexts, "removeObject:", v26);
  }
  else
  {
    v23 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CAMTimelapseBackendController _movieWrittenToFilePath:duration:metadata:state:].cold.1();
  }

}

- (BOOL)_shouldSaveLastTimelapseDataForDebugging
{
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesAppSynchronize(CFSTR("com.apple.camera"));
  keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(CFSTR("CAMSaveLastTimelapseData"), CFSTR("com.apple.camera"), &keyExistsAndHasValidFormat) != 0;
}

- (void)_saveTimelapseDirectoryForDebuggingTimelapseUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:](CAMTimelapseDiskUtilities, "directoryPathForTimelapseUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities removeDummyFileForTimelapseUUID:](CAMTimelapseDiskUtilities, "removeDummyFileForTimelapseUUID:", v4);

  +[CAMTimelapseDiskUtilities timelapseDirectoryPath](CAMTimelapseDiskUtilities, "timelapseDirectoryPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("LastTimelapse"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
    -[CAMTimelapseBackendController _deleteItemAtPath:](self, "_deleteItemAtPath:", v8);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = objc_msgSend(v11, "moveItemAtPath:toPath:error:", v5, v8, &v16);
  v13 = v16;

  v14 = os_log_create("com.apple.camera", "Nebula");
  v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "Copied timelapse directory from %{public}@ to %{public}@ for debugging", buf, 0x16u);
    }

  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v18 = v5;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v13;
      _os_log_error_impl(&dword_1DB760000, v15, OS_LOG_TYPE_ERROR, "Deleting directory after failing to move %{public}@ to %{public}@: %{public}@", buf, 0x20u);
    }

    -[CAMTimelapseBackendController _deleteItemAtPath:](self, "_deleteItemAtPath:", v5);
  }

}

- (void)_notifyAssetsdOfIncomingMovieAtPath:(id)a3 duration:(id *)a4 metadata:(id)a5 state:(id)a6
{
  NSObject *workQueue;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  CAMMutableVideoCaptureRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  CAMVideoCaptureResult *v22;
  CAMVideoCaptureResult *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v28;

  workQueue = self->__workQueue;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  dispatch_assert_queue_V2(workQueue);
  v14 = objc_msgSend(v11, "captureOrientation");
  v15 = objc_msgSend(v11, "captureDevice");
  objc_msgSend(v11, "startLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timelapseUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc_init(CAMMutableVideoCaptureRequest);
  -[CAMMutableVideoCaptureRequest setTorchMode:](v18, "setTorchMode:", 0);
  -[CAMMutableVideoCaptureRequest setCaptureOrientation:](v18, "setCaptureOrientation:", v14);
  -[CAMMutableVideoCaptureRequest setCaptureMirrored:](v18, "setCaptureMirrored:", objc_msgSend(v11, "isCaptureMirrored"));
  -[CAMMutableVideoCaptureRequest setCaptureDevice:](v18, "setCaptureDevice:", v15);
  -[CAMMutableVideoCaptureRequest setLocation:](v18, "setLocation:", v16);
  -[CAMMutableVideoCaptureRequest setPersistenceUUID:](v18, "setPersistenceUUID:", v17);
  -[CAMMutableVideoCaptureRequest setTimelapse:](v18, "setTimelapse:", 1);
  LODWORD(v14) = objc_msgSend(v11, "preferHEVC");

  -[CAMMutableVideoCaptureRequest setVideoEncodingBehavior:](v18, "setVideoEncodingBehavior:", v14);
  -[CAMMutableVideoCaptureRequest setDelegate:](v18, "setDelegate:", self);
  v19 = (void *)os_transaction_create();
  -[CAMTimelapseBackendController _transactionForPersistenceUUID](self, "_transactionForPersistenceUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v17);

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [CAMVideoCaptureResult alloc];
  v28 = *a4;
  v26 = *MEMORY[0x1E0CA2E18];
  v27 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  LOBYTE(v25) = 0;
  v23 = -[CAMVideoCaptureResult initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:](v22, "initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:", v21, 0, &v28, &v26, 0, v12, 1.0, 0, 0, 0, 0, v25);

  -[CAMTimelapseBackendController _persistenceController](self, "_persistenceController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "videoRequest:didCompleteCaptureWithResult:", v18, v23);

}

- (void)videoRequestDidCompleteRemotePersistence:(id)a3 withResponse:(id)a4 error:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a3;
  -[CAMTimelapseBackendController _transactionForPersistenceUUID](self, "_transactionForPersistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistenceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  objc_msgSend(v6, "persistenceUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMNebulaKeepAliveController stopKeepAliveForIdentifier:](self->__keepAliveController, "stopKeepAliveForIdentifier:", v9);
}

- (CGAffineTransform)_frameTransformForState:(SEL)a3
{
  uint64_t v5;
  __int128 v6;
  id v7;
  int v8;
  int v9;
  unint64_t v10;
  CGAffineTransform *result;
  unsigned int v12;
  int v13;
  unsigned int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CGAffineTransform v20;
  CGAffineTransform t1;
  CGAffineTransform v22;

  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  v7 = a4;
  v8 = objc_msgSend(v7, "captureOrientation");
  v9 = objc_msgSend(v7, "isCaptureMirrored");
  v10 = objc_msgSend(v7, "captureDevice");

  v12 = (v10 < 0xC) & (0xF02u >> v10);
  switch(v8)
  {
    case 1:
      v13 = 90;
      break;
    case 2:
      v13 = 270;
      break;
    case 3:
      if (v12)
        v13 = 180;
      else
        v13 = 0;
      break;
    case 4:
      if (v12)
        v13 = 0;
      else
        v13 = 180;
      break;
    default:
      v13 = 0;
      break;
  }
  if (_frameTransformForState__onceToken != -1)
    dispatch_once(&_frameTransformForState__onceToken, &__block_literal_global_60_0);
  if (_frameTransformForState__frontCameraRotation)
    v14 = (v10 < 0xC) & (0xF02u >> v10);
  else
    v14 = 0;
  if (v14 == 1)
  {
    v15 = _frameTransformForState__frontCameraRotation + v13;
    if (_frameTransformForState__frontCameraRotation + v13 > 359)
      v15 -= 360;
    if (v15 >= 0)
      v13 = v15;
    else
      v13 = v15 + 360;
  }
  if (v13)
  {
    CGAffineTransformMakeRotation(retstr, (double)v13 * 3.14159265 / 180.0);
    v16 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = (CGAffineTransform *)UIIntegralTransform();
    v17 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v17;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  if (v9)
  {
    v20.a = -1.0;
    v20.b = 0.0;
    v20.c = 0.0;
    v20.d = 1.0;
    v20.tx = 0.0;
    v20.ty = 0.0;
    v18 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v18;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v22, &t1, &v20);
    v19 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v19;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
  }
  return result;
}

uint64_t __57__CAMTimelapseBackendController__frameTransformForState___block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _frameTransformForState__frontCameraRotation = result;
  return result;
}

- (void)handleClientConnection:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  id v7;

  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v4);

  -[CAMTimelapseState timelapseUUID](self->__currentState, "timelapseUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTimelapseDiskUtilities readStateForTimelapseUUID:mergeSecondaryState:](CAMTimelapseDiskUtilities, "readStateForTimelapseUUID:mergeSecondaryState:", v6, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMTimelapseBackendController _setCurrentState:](self, "_setCurrentState:", v7);
}

- (void)handleClientDisconnection
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
}

- (int)_pidForApplication:(id)a3
{
  id v3;
  int v4;
  dispatch_semaphore_t v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v3 = a3;
  v4 = -1;
  if (v3)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = -1;
    v5 = dispatch_semaphore_create(0);
    v6 = objc_alloc_init(MEMORY[0x1E0CFE2F0]);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __52__CAMTimelapseBackendController__pidForApplication___block_invoke;
    v13 = &unk_1EA330200;
    v15 = &v16;
    v7 = v5;
    v14 = v7;
    objc_msgSend(v6, "applicationInfoForApplication:completion:", v3, &v10);
    v8 = dispatch_time(0, 10000000000);
    dispatch_semaphore_wait(v7, v8);
    objc_msgSend(v6, "invalidate", v10, v11, v12, v13);
    v4 = *((_DWORD *)v17 + 6);

    _Block_object_dispose(&v16, 8);
  }

  return v4;
}

void __52__CAMTimelapseBackendController__pidForApplication___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C8]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "intValue");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_isCameraRunning
{
  return -[CAMTimelapseBackendController _pidForApplication:](self, "_pidForApplication:", CFSTR("com.apple.camera")) != 0;
}

- (void)_workQueue_setupCameraProcessMonitoringIfNecessary
{
  NSObject *v3;
  BKSApplicationStateMonitor *v4;
  BKSApplicationStateMonitor *applicationStateMonitor;
  BKSApplicationStateMonitor *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[CAMTimelapseBackendController _workQueue](self, "_workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->__applicationStateMonitor)
  {
    objc_initWeak(&location, self);
    v4 = (BKSApplicationStateMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE2F0]), "initWithBundleIDs:states:", &unk_1EA3B3B30, 1);
    applicationStateMonitor = self->__applicationStateMonitor;
    self->__applicationStateMonitor = v4;

    v6 = self->__applicationStateMonitor;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke;
    v7[3] = &unk_1EA32D1E0;
    objc_copyWeak(&v8, &location);
    -[BKSApplicationStateMonitor setHandler:](v6, "setHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v5, "integerValue") == 1)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke_2;
    v6[3] = &unk_1EA328868;
    v7 = WeakRetained;
    objc_msgSend(v7, "_dispatchToWorkQueueWithBlock:", v6);

  }
}

void __83__CAMTimelapseBackendController__workQueue_setupCameraProcessMonitoringIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Resuming timelapse IO work because Camera has died", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_movieWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSuspended:", 0);

}

- (void)_workQueue_destroyApplicationStateMonitor
{
  NSObject *v3;
  BKSApplicationStateMonitor *applicationStateMonitor;

  -[CAMTimelapseBackendController _workQueue](self, "_workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[BKSApplicationStateMonitor invalidate](self->__applicationStateMonitor, "invalidate");
  applicationStateMonitor = self->__applicationStateMonitor;
  self->__applicationStateMonitor = 0;

}

- (NSMutableArray)_sessionContexts
{
  return self->__sessionContexts;
}

- (OS_dispatch_queue)_workQueue
{
  return self->__workQueue;
}

- (BOOL)_writingMovie
{
  return self->__writingMovie;
}

- (CAMTimelapseMovieWriterProtocol)_movieWriter
{
  return self->__movieWriter;
}

- (CAMTimelapseState)_currentState
{
  return self->__currentState;
}

- (BOOL)_isCapturing
{
  return self->__capturing;
}

- (CAMNebulaKeepAliveController)_keepAliveController
{
  return self->__keepAliveController;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (BOOL)_oldMovieWriterEnabled
{
  return self->__oldMovieWriterEnabled;
}

- (NSMutableDictionary)_transactionForPersistenceUUID
{
  return self->__transactionForPersistenceUUID;
}

- (int)_notifyRegisterTokenSuspendIO
{
  return self->__notifyRegisterTokenSuspendIO;
}

- (int)_notifyRegisterTokenResumeIO
{
  return self->__notifyRegisterTokenResumeIO;
}

- (BKSApplicationStateMonitor)_applicationStateMonitor
{
  return self->__applicationStateMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->__transactionForPersistenceUUID, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__keepAliveController, 0);
  objc_storeStrong((id *)&self->__currentState, 0);
  objc_storeStrong((id *)&self->__movieWriter, 0);
  objc_storeStrong((id *)&self->__workQueue, 0);
  objc_storeStrong((id *)&self->__sessionContexts, 0);
}

void __79__CAMTimelapseBackendController__updatePendingWorkFromDiskForceEndLastSession___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "No state found for directory %{public}@ after %ld attempts. Deleting directory.");
  OUTLINED_FUNCTION_1_0();
}

- (void)_permanentlyFailTimelapseUUID:(void *)a1 withState:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fullDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, a2, v4, "Permanently deleting timelapse with state: %{public}@", v5);

}

- (void)_deleteItemAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to remove %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

void __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Error: failed to write movie %ld times for timelapse %{public}@. Will retry.");
  OUTLINED_FUNCTION_1_0();
}

void __62__CAMTimelapseBackendController__writeMovieForSessionContext___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Error: failed to write movie %ld times for timelapse %{public}@. Failing permanently.");
  OUTLINED_FUNCTION_1_0();
}

- (void)_movieWrittenToFilePath:duration:metadata:state:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1DB760000, v0, v1, "Error linking movie: %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
