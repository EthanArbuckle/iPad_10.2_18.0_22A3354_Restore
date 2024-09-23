@implementation CAMNebulaIrisBackendController

- (CAMNebulaIrisBackendController)initWithPersistenceController:(id)a3 keepAliveController:(id)a4
{
  id v7;
  id v8;
  CAMNebulaIrisBackendController *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *coordinationQueue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *linkWorkQueue;
  NSMutableDictionary *v17;
  NSMutableDictionary *pendingOrInFlightJobsByUniqueIdentifier;
  NSMutableArray *v19;
  NSMutableArray *pendingExportVideoJobs;
  NSMutableDictionary *v21;
  NSMutableDictionary *bundleIdentifiersByVideoPersistenceUUID;
  uint64_t v23;
  NSHashTable *clientConnections;
  NSMutableDictionary *v25;
  NSMutableDictionary *transactionForPersistenceUUID;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  _QWORD block[4];
  CAMNebulaIrisBackendController *v33;
  _QWORD v34[4];
  id v35;
  _QWORD handler[4];
  id v37;
  id buf;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)CAMNebulaIrisBackendController;
  v9 = -[CAMNebulaIrisBackendController init](&v39, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "CAMNebulaIrisBackendController initialized", (uint8_t *)&buf, 2u);
    }

    objc_storeStrong((id *)&v9->__persistenceController, a3);
    objc_storeStrong((id *)&v9->__keepAliveController, a4);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.camera.nebula.iris.coordination", v11);
    coordinationQueue = v9->__coordinationQueue;
    v9->__coordinationQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.camera.nebula.iris.link-work", v14);
    linkWorkQueue = v9->__linkWorkQueue;
    v9->__linkWorkQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingOrInFlightJobsByUniqueIdentifier = v9->__pendingOrInFlightJobsByUniqueIdentifier;
    v9->__pendingOrInFlightJobsByUniqueIdentifier = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingExportVideoJobs = v9->__pendingExportVideoJobs;
    v9->__pendingExportVideoJobs = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundleIdentifiersByVideoPersistenceUUID = v9->__bundleIdentifiersByVideoPersistenceUUID;
    v9->__bundleIdentifiersByVideoPersistenceUUID = v21;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    clientConnections = v9->__clientConnections;
    v9->__clientConnections = (NSHashTable *)v23;

    v9->__shouldCheckMarkerFileForIOWorkSuspension = 1;
    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    transactionForPersistenceUUID = v9->__transactionForPersistenceUUID;
    v9->__transactionForPersistenceUUID = v25;

    objc_initWeak(&buf, v9);
    -[CAMNebulaIrisBackendController _coordinationQueue](v9, "_coordinationQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke;
    handler[3] = &unk_1EA329270;
    objc_copyWeak(&v37, &buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.suspend", &v9->__notifyRegisterTokenSuspendIO, v27, handler);

    -[CAMNebulaIrisBackendController _coordinationQueue](v9, "_coordinationQueue");
    v29 = objc_claimAutoreleasedReturnValue();
    v34[0] = v28;
    v34[1] = 3221225472;
    v34[2] = __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_2;
    v34[3] = &unk_1EA329270;
    objc_copyWeak(&v35, &buf);
    notify_register_dispatch("com.apple.camera.nebulad.io.resume", &v9->__notifyRegisterTokenResumeIO, v29, v34);

    if (+[CAMIrisDiskUtilities hasPendingWork](CAMIrisDiskUtilities, "hasPendingWork"))
    {
      -[CAMNebulaIrisBackendController _coordinationQueue](v9, "_coordinationQueue");
      v30 = objc_claimAutoreleasedReturnValue();
      block[0] = v28;
      block[1] = 3221225472;
      block[2] = __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_3;
      block[3] = &unk_1EA328868;
      v33 = v9;
      dispatch_sync(v30, block);

    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
    objc_destroyWeak(&buf);

  }
  return v9;
}

void __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coordinationQueue_setIOWorkSuspended:", 1);
  objc_msgSend(WeakRetained, "_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:", 0);

}

void __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coordinationQueue_setIOWorkSuspended:", 0);
  objc_msgSend(WeakRetained, "_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:", 0);

}

uint64_t __84__CAMNebulaIrisBackendController_initWithPersistenceController_keepAliveController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setCrashRecoveryNeeded:", 1);
}

- (CAMNebulaIrisBackendController)init
{
  -[CAMNebulaIrisBackendController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMNebulaIrisBackendController initWithPersistenceController:keepAliveController:](self, "initWithPersistenceController:keepAliveController:", 0, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  notify_cancel(self->__notifyRegisterTokenSuspendIO);
  notify_cancel(self->__notifyRegisterTokenResumeIO);
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__CAMNebulaIrisBackendController_dealloc__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)CAMNebulaIrisBackendController;
  -[CAMNebulaIrisBackendController dealloc](&v4, sel_dealloc);
}

uint64_t __41__CAMNebulaIrisBackendController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_destroyApplicationStateMonitor");
}

- (void)_dispatchToQueue:(id)a3 withBlock:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v7 = (void *)os_transaction_create();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CAMNebulaIrisBackendController__dispatchToQueue_withBlock___block_invoke;
  v10[3] = &unk_1EA329298;
  v11 = v7;
  v12 = v5;
  v8 = v7;
  v9 = v5;
  dispatch_async(v6, v10);

}

void __61__CAMNebulaIrisBackendController__dispatchToQueue_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0B55E8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_dispatchToQueue:(id)a3 afterDelay:(double)a4 withBlock:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v7 = a5;
  v8 = a3;
  v9 = (void *)os_transaction_create();
  v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__CAMNebulaIrisBackendController__dispatchToQueue_afterDelay_withBlock___block_invoke;
  v13[3] = &unk_1EA329298;
  v14 = v9;
  v15 = v7;
  v11 = v9;
  v12 = v7;
  dispatch_after(v10, v8, v13);

}

void __72__CAMNebulaIrisBackendController__dispatchToQueue_afterDelay_withBlock___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1DF0B55E8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)_dispatchToMainQueueWithBlock:(id)a3
{
  -[CAMNebulaIrisBackendController _dispatchToQueue:withBlock:](self, "_dispatchToQueue:withBlock:", MEMORY[0x1E0C80D38], a3);
}

- (void)_dispatchToCoordinationQueueWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _dispatchToQueue:withBlock:](self, "_dispatchToQueue:withBlock:", v5, v4);

}

- (void)_dispatchToCoordinationQueueAfterDelay:(double)a3 withBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _dispatchToQueue:afterDelay:withBlock:](self, "_dispatchToQueue:afterDelay:withBlock:", v7, v6, a3);

}

- (void)_dispatchToLinkWorkQueueWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAMNebulaIrisBackendController _linkWorkQueue](self, "_linkWorkQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _dispatchToQueue:withBlock:](self, "_dispatchToQueue:withBlock:", v5, v4);

}

- (void)_dispatchToLinkWorkQueueAfterDelay:(double)a3 withBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[CAMNebulaIrisBackendController _linkWorkQueue](self, "_linkWorkQueue");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _dispatchToQueue:afterDelay:withBlock:](self, "_dispatchToQueue:afterDelay:withBlock:", v7, v6, a3);

}

- (void)handleClientConnection:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, a3);
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v4);

  -[CAMNebulaIrisBackendController _clientConnections](self, "_clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(&location);
  objc_msgSend(v6, "addObject:", v7);

  objc_destroyWeak(&location);
}

- (void)handleClientDisconnection:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  id location;

  objc_initWeak(&location, a3);
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v4);

  -[CAMNebulaIrisBackendController _clientConnections](self, "_clientConnections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(&location);
  objc_msgSend(v6, "removeObject:", v7);

  objc_destroyWeak(&location);
}

- (void)performIrisCrashRecoveryForceFileSystemCheck:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__CAMNebulaIrisBackendController_performIrisCrashRecoveryForceFileSystemCheck___block_invoke;
  v5[3] = &unk_1EA328908;
  v6 = a3;
  v5[4] = self;
  -[CAMNebulaIrisBackendController _dispatchToCoordinationQueueWithBlock:](self, "_dispatchToCoordinationQueueWithBlock:", v5);
}

uint64_t __79__CAMNebulaIrisBackendController_performIrisCrashRecoveryForceFileSystemCheck___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setCrashRecoveryNeeded:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_createJobsForCrashRecoveryIfNeeded");
}

- (void)performIrisCrashRecovery
{
  -[CAMNebulaIrisBackendController performIrisCrashRecoveryForceFileSystemCheck:](self, "performIrisCrashRecoveryForceFileSystemCheck:", 1);
}

- (BOOL)_coordinationQueue_isIOWorkSuspended
{
  if (-[CAMNebulaIrisBackendController _coordinationQueue_shouldCheckMarkerFileForIOWorkSuspension](self, "_coordinationQueue_shouldCheckMarkerFileForIOWorkSuspension"))
  {
    if (+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity](CAMProtectionController, "isCameraPerformingHighPriorityDiskActivity"))
    {
      -[CAMNebulaIrisBackendController _coordinationQueue_setIOWorkSuspended:](self, "_coordinationQueue_setIOWorkSuspended:", 1);
    }
    -[CAMNebulaIrisBackendController _coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:](self, "_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:", 0);
  }
  return self->__IOWorkSuspended;
}

- (void)_coordinationQueue_setIOWorkSuspended:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;

  v3 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->__IOWorkSuspended != v3)
  {
    self->__IOWorkSuspended = v3;
    -[CAMNebulaIrisBackendController _linkWorkQueue](self, "_linkWorkQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v3)
    {
      dispatch_suspend(v6);

      -[CAMNebulaIrisBackendController _activeExportSession](self, "_activeExportSession");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v8, "cancelExport");
      -[CAMNebulaIrisBackendController _coordinationQueue_setupCameraProcessingMonitoringIfNecessary](self, "_coordinationQueue_setupCameraProcessingMonitoringIfNecessary");

    }
    else
    {
      dispatch_resume(v6);

      -[CAMNebulaIrisBackendController _coordinationQueue_enqueuePendingExportJobIfPossible](self, "_coordinationQueue_enqueuePendingExportJobIfPossible");
      -[CAMNebulaIrisBackendController _coordinationQueue_createJobsForCrashRecoveryIfNeeded](self, "_coordinationQueue_createJobsForCrashRecoveryIfNeeded");
    }
  }
}

- (void)_coordinationQueue_setShouldCheckMarkerFileForIOWorkSuspension:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;

  v3 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->__shouldCheckMarkerFileForIOWorkSuspension != v3)
    self->__shouldCheckMarkerFileForIOWorkSuspension = v3;
}

- (void)enqueueIrisVideoJobs:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__CAMNebulaIrisBackendController_enqueueIrisVideoJobs___block_invoke;
  v6[3] = &unk_1EA328A40;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaIrisBackendController _dispatchToCoordinationQueueWithBlock:](self, "_dispatchToCoordinationQueueWithBlock:", v6);

}

uint64_t __55__CAMNebulaIrisBackendController_enqueueIrisVideoJobs___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_enqueueJobs:", *(_QWORD *)(a1 + 40));
}

- (void)_coordinationQueue_enqueueJobs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[CAMNebulaIrisBackendController _coordinationQueue_enqueueAndTrackNewJob:](self, "_coordinationQueue_enqueueAndTrackNewJob:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[CAMNebulaIrisBackendController _coordinationQueue_enqueuePendingExportJobIfPossible](self, "_coordinationQueue_enqueuePendingExportJobIfPossible");
}

- (void)_coordinationQueue_enqueueAndTrackNewJob:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "filteredVideoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _uniqueIdentifierForJob:](self, "_uniqueIdentifierForJob:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _pendingOrInFlightJobsByUniqueIdentifier](self, "_pendingOrInFlightJobsByUniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring incoming job because we already have one in-flight for %{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v8);
    -[CAMNebulaKeepAliveController startKeepAliveForIdentifier:](self->__keepAliveController, "startKeepAliveForIdentifier:", v8);
    if (!v7 || v6)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __75__CAMNebulaIrisBackendController__coordinationQueue_enqueueAndTrackNewJob___block_invoke;
      v12[3] = &unk_1EA328A40;
      v12[4] = self;
      v13 = v4;
      -[CAMNebulaIrisBackendController _dispatchToLinkWorkQueueWithBlock:](self, "_dispatchToLinkWorkQueueWithBlock:", v12);

      goto LABEL_8;
    }
    -[CAMNebulaIrisBackendController _pendingExportVideoJobs](self, "_pendingExportVideoJobs");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v11, "addObject:", v4);
  }

LABEL_8:
}

uint64_t __75__CAMNebulaIrisBackendController__coordinationQueue_enqueueAndTrackNewJob___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_linkWorkQueue_linkAndPersistSelfContainedVideo:", *(_QWORD *)(a1 + 40));
}

- (void)_coordinationQueue_didPermanentlyFinishJob:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CAMNebulaIrisBackendController _uniqueIdentifierForJob:](self, "_uniqueIdentifierForJob:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CAMNebulaIrisBackendController _pendingOrInFlightJobsByUniqueIdentifier](self, "_pendingOrInFlightJobsByUniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);
  -[CAMNebulaKeepAliveController stopKeepAliveForIdentifier:](self->__keepAliveController, "stopKeepAliveForIdentifier:", v7);
  -[CAMNebulaIrisBackendController _coordinationQueue_createJobsForCrashRecoveryIfNeeded](self, "_coordinationQueue_createJobsForCrashRecoveryIfNeeded");

}

- (id)_uniqueIdentifierForJob:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "videoURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredVideoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5;
  else
    v6 = v4;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_linkWorkQueue_linkAndPersistSelfContainedVideo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  int v20;
  id v21;
  uint64_t v22;
  CAMMutableStillImageCaptureRequest *v23;
  void *v24;
  CAMVideoCaptureResult *v25;
  CAMVideoCaptureResult *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  char v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  char v56;
  char v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[5];
  id v61;
  id v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  id v67;
  id v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;

  v4 = a3;
  -[CAMNebulaIrisBackendController _linkWorkQueue](self, "_linkWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "videoURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredVideoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stillImagePersistenceUUID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPersistenceUUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "irisIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "captureDevice");
  v71 = 0uLL;
  v72 = 0;
  v44 = (void *)v8;
  v38 = objc_msgSend(v4, "captureOrientation");
  if (v4)
  {
    objc_msgSend(v4, "duration");
    v69 = 0uLL;
    v70 = 0;
    objc_msgSend(v4, "stillImageDisplayTime");
  }
  else
  {
    v69 = 0uLL;
    v70 = 0;
  }
  objc_msgSend(v4, "captureTime");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMPersistenceController uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:](CAMPersistenceController, "uniquePathForAssetWithUUID:captureTime:extension:usingIncomingDirectory:", v46, CFSTR("MOV"), +[CAMCaptureRequest shouldPersistToIncomingDirectoryWithPersistenceOptions:temporaryPersistenceOptions:](CAMCaptureRequest, "shouldPersistToIncomingDirectoryWithPersistenceOptions:temporaryPersistenceOptions:", objc_msgSend(v4, "persistenceOptions"), objc_msgSend(v4, "temporaryPersistenceOptions")), v11);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v42 = (void *)v13;
  v43 = v12;
  if (v7)
  {
    v16 = (void *)v14;
    objc_msgSend(MEMORY[0x1E0D73148], "filteredVideoPathForRecordedLivePhotoVideoPath:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v68 = 0;
    v19 = objc_msgSend(v12, "linkItemAtURL:toURL:error:", v7, v18, &v68);
    v41 = v68;

    if (!v19)
    {
      v35 = 0;
      v21 = 0;
      v34 = 1;
      goto LABEL_17;
    }
    v12 = v43;
    v15 = v16;
  }
  else
  {
    v41 = 0;
    v18 = 0;
  }
  v67 = 0;
  v16 = v15;
  v20 = objc_msgSend(v12, "linkItemAtURL:toURL:error:", v6, v15, &v67);
  v21 = v67;
  if (!v20)
  {
    v34 = 0;
    v35 = 1;
LABEL_17:
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_3;
    v47[3] = &unk_1EA32D190;
    v47[4] = self;
    v48 = v16;
    v18 = v18;
    v49 = v18;
    v50 = v6;
    v31 = v43;
    v51 = v43;
    v56 = v35;
    v21 = v21;
    v52 = v21;
    v57 = v34;
    v53 = v7;
    v33 = v41;
    v54 = v33;
    v55 = v4;
    -[CAMNebulaIrisBackendController _dispatchToCoordinationQueueWithBlock:](self, "_dispatchToCoordinationQueueWithBlock:", v47);

    v30 = v44;
    v32 = v42;
    goto LABEL_18;
  }
  v37 = v6;
  -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:](self, "_removeItemAtURL:maxAttempts:", v6, 3);
  if (v7)
    -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:](self, "_removeItemAtURL:maxAttempts:", v7, 3);
  if (objc_msgSend(v4, "isCTMVideo"))
    v22 = 2;
  else
    v22 = 0;
  v23 = objc_alloc_init(CAMMutableStillImageCaptureRequest);
  -[CAMMutableStillImageCaptureRequest setCaptureOrientation:](v23, "setCaptureOrientation:", v38);
  -[CAMMutableStillImageCaptureRequest setCaptureDevice:](v23, "setCaptureDevice:", v9);
  -[CAMMutableStillImageCaptureRequest setPersistenceUUID:](v23, "setPersistenceUUID:", v45);
  -[CAMMutableStillImageCaptureRequest setVideoPersistenceUUID:](v23, "setVideoPersistenceUUID:", v46);
  -[CAMMutableStillImageCaptureRequest setIrisIdentifier:](v23, "setIrisIdentifier:", v44);
  -[CAMMutableStillImageCaptureRequest setPersistenceOptions:](v23, "setPersistenceOptions:", objc_msgSend(v4, "persistenceOptions"));
  -[CAMMutableStillImageCaptureRequest setTemporaryPersistenceOptions:](v23, "setTemporaryPersistenceOptions:", objc_msgSend(v4, "temporaryPersistenceOptions"));
  -[CAMMutableStillImageCaptureRequest setCtmCaptureType:](v23, "setCtmCaptureType:", v22);
  v39 = (void *)os_transaction_create();
  -[CAMNebulaIrisBackendController _transactionForPersistenceUUID](self, "_transactionForPersistenceUUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v39, v46);

  -[CAMMutableStillImageCaptureRequest setDelegate:](v23, "setDelegate:", self);
  v25 = [CAMVideoCaptureResult alloc];
  v65 = v71;
  v66 = v72;
  v63 = v69;
  v64 = v70;
  LOBYTE(v36) = 0;
  v40 = v7;
  v26 = -[CAMVideoCaptureResult initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:](v25, "initWithURL:filteredLocalDestinationURL:duration:stillDisplayTime:dimensions:metadata:videoZoomFactor:reason:videoPreviewPixelBuffer:coordinationInfo:error:slowWriterFrameDrops:", v16, v18, &v65, &v63, 0, 0, 1.0, 0, 0, 0, 0, v36);
  -[CAMNebulaIrisBackendController _keepAliveController](self, "_keepAliveController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "startKeepAliveForIdentifier:", v46);
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke;
  v60[3] = &unk_1EA329360;
  v60[4] = self;
  v61 = v46;
  v28 = v4;
  v62 = v28;
  -[CAMNebulaIrisBackendController _dispatchToMainQueueWithBlock:](self, "_dispatchToMainQueueWithBlock:", v60);
  -[CAMNebulaIrisBackendController _persistenceController](self, "_persistenceController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stillImageRequest:didCompleteVideoCaptureWithResult:", v23, v26);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_2;
  v58[3] = &unk_1EA328A40;
  v58[4] = self;
  v59 = v28;
  -[CAMNebulaIrisBackendController _dispatchToCoordinationQueueWithBlock:](self, "_dispatchToCoordinationQueueWithBlock:", v58);

  v30 = v44;
  v7 = v40;

  v6 = v37;
  v32 = v42;
  v31 = v43;
  v33 = v41;
LABEL_18:

}

void __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifiersByVideoPersistenceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

}

uint64_t __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didPermanentlyFinishJob:", *(_QWORD *)(a1 + 40));
}

void __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_removeItemAtURL:maxAttempts:", *(_QWORD *)(a1 + 40), 3);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    objc_msgSend(*(id *)(a1 + 32), "_removeItemAtURL:maxAttempts:", v2, 3);
  v3 = objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_failureCountForVideoURL:", *(_QWORD *)(a1 + 56)) + 1;
  if (v3 <= 3
    && (v4 = *(void **)(a1 + 64),
        objc_msgSend(*(id *)(a1 + 56), "path"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = objc_msgSend(v4, "fileExistsAtPath:", v5),
        v5,
        (_DWORD)v4))
  {
    if (*(_BYTE *)(a1 + 104))
    {
      v6 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v18 = *(_QWORD *)(a1 + 56);
        v19 = *(_QWORD *)(a1 + 40);
        v20 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 138544130;
        v27 = v18;
        v28 = 2114;
        v29 = v19;
        v30 = 2048;
        v31 = v3;
        v32 = 2114;
        v33 = v20;
        _os_log_error_impl(&dword_1DB760000, v6, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@ (%lu attempts): %{public}@ (rescheduling)", buf, 0x2Au);
      }

    }
    if (*(_BYTE *)(a1 + 105))
    {
      v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v21 = *(_QWORD *)(a1 + 48);
        v22 = *(_QWORD *)(a1 + 80);
        v23 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 138544130;
        v27 = v22;
        v28 = 2114;
        v29 = v21;
        v30 = 2048;
        v31 = v3;
        v32 = 2114;
        v33 = v23;
        _os_log_error_impl(&dword_1DB760000, v7, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ to %{public}@ (%lu attempts): %{public}@ (rescheduling)", buf, 0x2Au);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setFailureCount:forVideoURL:", v3, *(_QWORD *)(a1 + 56));
    v8 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_23;
    v24[3] = &unk_1EA328A40;
    v24[4] = v8;
    v25 = *(id *)(a1 + 96);
    objc_msgSend(v8, "_dispatchToLinkWorkQueueAfterDelay:withBlock:", v24, 0.1);

  }
  else
  {
    if (*(_BYTE *)(a1 + 104))
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 56);
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 134218754;
        v27 = v3;
        v28 = 2114;
        v29 = v10;
        v30 = 2114;
        v31 = v11;
        v32 = 2114;
        v33 = v12;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Deleting video after %lu attempts to link %{public}@ to %{public}@: %{public}@", buf, 0x2Au);
      }

    }
    if (*(_BYTE *)(a1 + 105))
    {
      v13 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 48);
        v15 = *(_QWORD *)(a1 + 80);
        v16 = *(_QWORD *)(a1 + 88);
        *(_DWORD *)buf = 134218754;
        v27 = v3;
        v28 = 2114;
        v29 = v15;
        v30 = 2114;
        v31 = v14;
        v32 = 2114;
        v33 = v16;
        _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Deleting video after %lu attempts to link %{public}@ to %{public}@: %{public}@", buf, 0x2Au);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_removeItemAtURL:maxAttempts:", *(_QWORD *)(a1 + 56), 3);
    v17 = *(_QWORD *)(a1 + 80);
    if (v17)
      objc_msgSend(*(id *)(a1 + 32), "_removeItemAtURL:maxAttempts:", v17, 3);
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didPermanentlyFinishJob:", *(_QWORD *)(a1 + 96));
  }
}

uint64_t __82__CAMNebulaIrisBackendController__linkWorkQueue_linkAndPersistSelfContainedVideo___block_invoke_23(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_linkWorkQueue_linkAndPersistSelfContainedVideo:", *(_QWORD *)(a1 + 40));
}

- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  CAMNebulaIrisBackendController *v14;
  id v15;

  v8 = a4;
  v9 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __124__CAMNebulaIrisBackendController_persistenceController_didGenerateVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
  v12[3] = &unk_1EA329360;
  v13 = v9;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v9;
  -[CAMNebulaIrisBackendController _dispatchToMainQueueWithBlock:](self, "_dispatchToMainQueueWithBlock:", v12);

}

void __124__CAMNebulaIrisBackendController_persistenceController_didGenerateVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "videoPersistenceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_bundleIdentifiersByVideoPersistenceUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_bundleIdentifiersByVideoPersistenceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v3);

  objc_msgSend(*(id *)(a1 + 40), "_clientConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqualToString:", v5))
          objc_msgSend(v12, "nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:", *(_QWORD *)(a1 + 48));

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)stillImageRequestDidCompleteVideoRemotePersistence:(id)a3 withResponse:(id)a4 error:(id)a5
{
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "videoPersistenceUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _keepAliveController](self, "_keepAliveController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopKeepAliveForIdentifier:", v8);
  -[CAMNebulaIrisBackendController _transactionForPersistenceUUID](self, "_transactionForPersistenceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void)_coordinationQueue_enqueuePendingExportJobIfPossible
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Attempt to create a filter with name %{public}@ failed! Proceeding with export without filtering", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didPermanentlyFinishJob:", *(_QWORD *)(a1 + 40));
}

void __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "sourceImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, *MEMORY[0x1E0C9E1F8]);
  objc_msgSend(*(id *)(a1 + 32), "outputImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithImage:context:", v4, 0);

}

void __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_33(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_2;
  v2[3] = &unk_1EA328A40;
  v1 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v1;
  objc_msgSend(v3, "_dispatchToCoordinationQueueWithBlock:", v2);

}

uint64_t __86__CAMNebulaIrisBackendController__coordinationQueue_enqueuePendingExportJobIfPossible__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_didCompleteExportJob:", *(_QWORD *)(a1 + 40));
}

- (void)_coordinationQueue_didCompleteExportJob:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  CAMIrisVideoJob *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  CAMIrisVideoJob *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[3];
  _QWORD v44[3];
  uint8_t buf[4];
  unint64_t v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CAMNebulaIrisBackendController _activeExportSession](self, "_activeExportSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMNebulaIrisBackendController _setActiveExportSession:](self, "_setActiveExportSession:", 0);
  v7 = objc_msgSend(v6, "status");
  objc_msgSend(v6, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputURL");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  switch(v7)
  {
    case 0:
    case 1:
    case 2:
      v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        v46 = v7;
        v47 = 2114;
        v48 = v6;
        v49 = 2114;
        v50 = v9;
        _os_log_error_impl(&dword_1DB760000, v12, OS_LOG_TYPE_ERROR, "Unhandled status case %ld for completed exportSession %{public}@ (%{public}@)", buf, 0x20u);
      }
      goto LABEL_4;
    case 3:
      v37 = (void *)v10;
      v39 = v8;
      -[CAMNebulaIrisBackendController _coordinationQueue_setFailureCount:forVideoURL:](self, "_coordinationQueue_setFailureCount:forVideoURL:", 0, v9);
      v18 = [CAMIrisVideoJob alloc];
      objc_msgSend(v4, "stillImagePersistenceUUID");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "videoPersistenceUUID");
      v20 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "irisIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v4, "captureDevice");
      v40 = (void *)v19;
      v38 = (void *)v20;
      v36 = objc_msgSend(v4, "captureOrientation");
      if (v4)
      {
        objc_msgSend(v4, "duration");
        objc_msgSend(v4, "stillImageDisplayTime");
      }
      else
      {
        memset(v44, 0, sizeof(v44));
        memset(v43, 0, sizeof(v43));
      }
      objc_msgSend(v4, "captureTime");
      v30 = v29;
      objc_msgSend(v4, "filterName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v4, "persistenceOptions");
      v32 = objc_msgSend(v4, "temporaryPersistenceOptions");
      objc_msgSend(v4, "bundleIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = -[CAMIrisVideoJob initWithVideoURL:stillImagePersistenceUUID:videoPersistenceUUID:irisIdentifier:captureDevice:captureOrientation:duration:stillImageDisplayTime:captureTime:captureError:filterName:filteredVideoURL:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:](v18, "initWithVideoURL:stillImagePersistenceUUID:videoPersistenceUUID:irisIdentifier:captureDevice:captureOrientation:duration:stillImageDisplayTime:captureTime:captureError:filterName:filteredVideoURL:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:", v9, v40, v38, v21, v22, v36, v30, v44, v43, 0, v35, v37, v31, v32, v33);

      v11 = v37;
      -[CAMNebulaIrisBackendController _coordinationQueue_enqueueAndTrackNewJob:](self, "_coordinationQueue_enqueueAndTrackNewJob:", v34);
      -[CAMNebulaIrisBackendController _coordinationQueue_didPermanentlyFinishJob:](self, "_coordinationQueue_didPermanentlyFinishJob:", v4);

      v8 = v39;
      goto LABEL_23;
    case 4:
      v23 = objc_msgSend(v8, "code");
      v12 = os_log_create("com.apple.camera", "Nebula");
      v24 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v23 == -11847)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138543618;
          v46 = (unint64_t)v9;
          v47 = 2114;
          v48 = v8;
          v25 = "Export of %{public}@ was interrupted (%{public}@).";
          v26 = v12;
          v27 = 22;
LABEL_17:
          _os_log_impl(&dword_1DB760000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
        }
LABEL_18:

        -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:](self, "_removeItemAtURL:maxAttempts:", v11, 3);
        -[CAMNebulaIrisBackendController _pendingExportVideoJobs](self, "_pendingExportVideoJobs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v4);

      }
      else
      {
        if (v24)
        {
          *(_DWORD *)buf = 138543874;
          v46 = (unint64_t)v9;
          v47 = 2114;
          v48 = v11;
          v49 = 2114;
          v50 = v8;
          _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Export of %{public}@ to %{public}@ failed (%{public}@).", buf, 0x20u);
        }
LABEL_4:

        -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:](self, "_removeItemAtURL:maxAttempts:", v11, 3);
        v13 = -[CAMNebulaIrisBackendController _coordinationQueue_failureCountForVideoURL:](self, "_coordinationQueue_failureCountForVideoURL:", v9)+ 1;
        if (v13 <= 3
          && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "path"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v16 = objc_msgSend(v14, "fileExistsAtPath:", v15),
              v15,
              v14,
              v16))
        {
          -[CAMNebulaIrisBackendController _coordinationQueue_setFailureCount:forVideoURL:](self, "_coordinationQueue_setFailureCount:forVideoURL:", v13, v9);
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __74__CAMNebulaIrisBackendController__coordinationQueue_didCompleteExportJob___block_invoke;
          v41[3] = &unk_1EA328A40;
          v41[4] = self;
          v42 = v4;
          -[CAMNebulaIrisBackendController _dispatchToCoordinationQueueAfterDelay:withBlock:](self, "_dispatchToCoordinationQueueAfterDelay:withBlock:", v41, 0.1);

        }
        else
        {
          v17 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218498;
            v46 = v13;
            v47 = 2114;
            v48 = v9;
            v49 = 2114;
            v50 = v11;
            _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Deleting video after %lu attempts to export %{public}@ to %{public}@", buf, 0x20u);
          }

          -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:](self, "_removeItemAtURL:maxAttempts:", v9, 3);
          -[CAMNebulaIrisBackendController _coordinationQueue_didPermanentlyFinishJob:](self, "_coordinationQueue_didPermanentlyFinishJob:", v4);
        }
      }
LABEL_23:
      -[CAMNebulaIrisBackendController _coordinationQueue_enqueuePendingExportJobIfPossible](self, "_coordinationQueue_enqueuePendingExportJobIfPossible");

      return;
    case 5:
      v12 = os_log_create("com.apple.camera", "Nebula");
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 138543362;
      v46 = (unint64_t)v9;
      v25 = "Cancelled export session for %{public}@";
      v26 = v12;
      v27 = 12;
      goto LABEL_17;
    default:
      goto LABEL_23;
  }
}

void __74__CAMNebulaIrisBackendController__coordinationQueue_didCompleteExportJob___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_pendingExportVideoJobs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_enqueuePendingExportJobIfPossible");

}

- (void)_coordinationQueue_setCrashRecoveryNeeded:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  CAMNebulaKeepAliveController *keepAliveController;

  v3 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (self->__crashRecoveryNeeded != v3)
  {
    self->__crashRecoveryNeeded = v3;
    keepAliveController = self->__keepAliveController;
    if (v3)
      -[CAMNebulaKeepAliveController startKeepAliveForIdentifier:](keepAliveController, "startKeepAliveForIdentifier:", CFSTR("CAMNebulaIrisBackendControllerPendingCrashRecovery"));
    else
      -[CAMNebulaKeepAliveController stopKeepAliveForIdentifier:](keepAliveController, "stopKeepAliveForIdentifier:", CFSTR("CAMNebulaIrisBackendControllerPendingCrashRecovery"));
  }
}

- (void)_coordinationQueue_createJobsForCrashRecoveryIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t n;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id obj;
  id obja;
  void *v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint8_t v98[128];
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  id v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[CAMNebulaIrisBackendController _coordinationQueue_isCrashRecoveryNeeded](self, "_coordinationQueue_isCrashRecoveryNeeded"))
  {
    -[CAMNebulaIrisBackendController _pendingOrInFlightJobsByUniqueIdentifier](self, "_pendingOrInFlightJobsByUniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count")
      && !-[CAMNebulaIrisBackendController _coordinationQueue_isIOWorkSuspended](self, "_coordinationQueue_isIOWorkSuspended")&& !+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity](CAMProtectionController, "isCameraPerformingHighPriorityDiskActivity"))
    {
      +[CAMIrisDiskUtilities irisVideoDirectoryPathCreateIfNeeded:](CAMIrisDiskUtilities, "irisVideoDirectoryPathCreateIfNeeded:", 0);
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
      v69 = (void *)v5;
      objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v5, &v93);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v93;

      if (v8)
      {
        v9 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v100 = v69;
          v101 = 2114;
          v102 = v8;
          _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get contents of %{public}@: %{public}@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v69, &v92);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v92;

        if (v12)
        {
          v13 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v100 = v69;
            v101 = 2114;
            v102 = v12;
            _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Failed second attempt to get contents of %{public}@: %{public}@", buf, 0x16u);
          }

        }
      }
      else
      {
        v12 = 0;
        v11 = v7;
      }
      if (objc_msgSend(v11, "count"))
      {
        v60 = v12;
        v62 = v4;
        v65 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v71 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        +[CAMIrisDiskUtilities videoPathExtension](CAMIrisDiskUtilities, "videoPathExtension");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 0u;
        v89 = 0u;
        v90 = 0u;
        v91 = 0u;
        v61 = v11;
        obj = v11;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
        if (!v14)
          goto LABEL_28;
        v15 = v14;
        v16 = *(_QWORD *)v89;
        while (1)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v89 != v16)
              objc_enumerationMutation(obj);
            objc_msgSend(v69, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "pathExtension");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "URLByDeletingPathExtension");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "pathExtension");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v22, "isEqualToString:", CFSTR("FILTERED")))
            {
              v23 = os_log_create("com.apple.camera", "Nebula");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v100 = v19;
                _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "Found a filtered video during crash recovery. Deleting and re-creating from the recorded %{public}@", buf, 0xCu);
              }

              v24 = v71;
LABEL_25:
              objc_msgSend(v24, "addObject:", v19);
              goto LABEL_26;
            }
            if (objc_msgSend(v20, "isEqualToString:", v64))
            {
              v25 = +[CAMIrisDiskUtilities isValidVideoDestinationPath:](CAMIrisDiskUtilities, "isValidVideoDestinationPath:", v18);
              v24 = v70;
              if (v25)
                goto LABEL_25;
            }
LABEL_26:

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
          if (!v15)
          {
LABEL_28:

            v84 = 0u;
            v85 = 0u;
            v86 = 0u;
            v87 = 0u;
            obja = (id)objc_msgSend(v65, "copy");
            v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v85;
              do
              {
                for (j = 0; j != v27; ++j)
                {
                  if (*(_QWORD *)v85 != v28)
                    objc_enumerationMutation(obja);
                  v30 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
                  objc_msgSend(v30, "URLByDeletingPathExtension");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v70, "containsObject:", v31))
                  {
                    v32 = os_log_create("com.apple.camera", "Nebula");
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v100 = v31;
                      _os_log_impl(&dword_1DB760000, v32, OS_LOG_TYPE_DEFAULT, "Found both an exported video and recorded video during crash recovery. Deleting the exported one and proceeding with the recorded video at %{public}@", buf, 0xCu);
                    }

                    objc_msgSend(v71, "addObject:", v30);
                    objc_msgSend(v65, "removeObject:", v30);
                  }

                }
                v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
              }
              while (v27);
            }

            v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            v83 = 0u;
            v34 = v65;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v81;
              do
              {
                for (k = 0; k != v36; ++k)
                {
                  if (*(_QWORD *)v81 != v37)
                    objc_enumerationMutation(v34);
                  v39 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
                  -[CAMNebulaIrisBackendController _videoJobFromURL:](self, "_videoJobFromURL:", v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    v41 = v33;
                    v42 = v40;
                  }
                  else
                  {
                    v41 = v71;
                    v42 = v39;
                  }
                  objc_msgSend(v41, "addObject:", v42);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
              }
              while (v36);
            }

            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            v43 = v70;
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v77;
              do
              {
                for (m = 0; m != v45; ++m)
                {
                  if (*(_QWORD *)v77 != v46)
                    objc_enumerationMutation(v43);
                  v48 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * m);
                  -[CAMNebulaIrisBackendController _videoJobFromURL:](self, "_videoJobFromURL:", v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v49)
                  {
                    v50 = v33;
                    v51 = v49;
                  }
                  else
                  {
                    v50 = v71;
                    v51 = v48;
                  }
                  objc_msgSend(v50, "addObject:", v51);

                }
                v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v76, v95, 16);
              }
              while (v45);
            }

            if (!+[CAMProtectionController isCameraPerformingHighPriorityDiskActivity](CAMProtectionController, "isCameraPerformingHighPriorityDiskActivity"))
            {
              v63 = v43;
              v66 = v34;
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v52 = v71;
              v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
              if (v53)
              {
                v54 = v53;
                v55 = *(_QWORD *)v73;
                do
                {
                  for (n = 0; n != v54; ++n)
                  {
                    if (*(_QWORD *)v73 != v55)
                      objc_enumerationMutation(v52);
                    v57 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * n);
                    v58 = os_log_create("com.apple.camera", "Nebula");
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138543362;
                      v100 = v57;
                      _os_log_error_impl(&dword_1DB760000, v58, OS_LOG_TYPE_ERROR, "Crash recovery: deleting file that cannot be processed (invalid or no pending work) %{public}@", buf, 0xCu);
                    }

                    -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:](self, "_removeItemAtURL:maxAttempts:", v57, 3);
                  }
                  v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v72, v94, 16);
                }
                while (v54);
              }

              -[CAMNebulaIrisBackendController _coordinationQueue_enqueueJobs:](self, "_coordinationQueue_enqueueJobs:", v33);
              -[CAMNebulaIrisBackendController _coordinationQueue_setCrashRecoveryNeeded:](self, "_coordinationQueue_setCrashRecoveryNeeded:", 0);
              v34 = v66;
              v43 = v63;
            }

            v11 = v61;
            v4 = v62;
            v12 = v60;
            goto LABEL_74;
          }
        }
      }
      v59 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB760000, v59, OS_LOG_TYPE_DEFAULT, "Found no work to do in crash recovery pass", buf, 2u);
      }

      -[CAMNebulaIrisBackendController _coordinationQueue_setCrashRecoveryNeeded:](self, "_coordinationQueue_setCrashRecoveryNeeded:", 0);
LABEL_74:

    }
  }
}

- (id)_videoJobFromURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  id v14;
  CAMIrisVideoJob *v15;
  void *v16;
  void *v17;
  CAMIrisVideoJob *v18;
  NSObject *v19;
  int v20;
  id v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  char v32;
  _BOOL4 v33;
  NSObject *v34;
  CAMIrisVideoJob *v35;
  id v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint8_t buf[16];
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1DF0B55E8]();
  v57 = 0;
  v58 = 0;
  v56 = 0.0;
  v54 = *MEMORY[0x1E0CA2E18];
  v55 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v52 = v54;
  v53 = v55;
  v50 = 0;
  v51 = 0;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v49 = 0;
  v46 = 0;
  v47 = 0;
  v7 = +[CAMIrisDiskUtilities parseVideoDestinationPath:forStillImagePersistenceUUID:videoPersistenceUUID:captureDevice:captureOrientation:captureTime:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:filterName:](CAMIrisDiskUtilities, "parseVideoDestinationPath:forStillImagePersistenceUUID:videoPersistenceUUID:captureDevice:captureOrientation:captureTime:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:filterName:", v6, &v49, &v48, &v58, &v57, &v56, &v51, &v50, &v47, &v46);
  v8 = v49;
  v9 = v48;
  v10 = v47;
  v39 = v9;
  v40 = v46;
  if (v7)
  {
    v38 = v5;
    objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      -[NSObject duration](v11, "duration");
      v45 = 0;
      v13 = -[CAMNebulaIrisBackendController _extractIrisPropertiesFromAVAsset:stillImageDisplayTime:irisIdentifier:](self, "_extractIrisPropertiesFromAVAsset:stillImageDisplayTime:irisIdentifier:", v12, &v52, &v45);
      v14 = v45;
      if (v13)
      {
LABEL_4:
        v15 = [CAMIrisVideoJob alloc];
        *(_OWORD *)buf = v54;
        v60 = v55;
        v41 = v52;
        v42 = v53;
        v16 = v10;
        v37 = v10;
        v17 = v8;
        v18 = -[CAMIrisVideoJob initWithVideoURL:stillImagePersistenceUUID:videoPersistenceUUID:irisIdentifier:captureDevice:captureOrientation:duration:stillImageDisplayTime:captureTime:captureError:filterName:filteredVideoURL:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:](v15, "initWithVideoURL:stillImagePersistenceUUID:videoPersistenceUUID:irisIdentifier:captureDevice:captureOrientation:duration:stillImageDisplayTime:captureTime:captureError:filterName:filteredVideoURL:persistenceOptions:temporaryPersistenceOptions:bundleIdentifier:", v4, v8, v9, v14, v58, v57, v56, buf, &v41, 0, v40, 0, v51, v50, v37);
        v19 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v18;
          _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "Crash recovery created job: %{public}@", buf, 0xCu);
        }
        v20 = 0;
        goto LABEL_25;
      }
      v31 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v4;
        _os_log_impl(&dword_1DB760000, v31, OS_LOG_TYPE_DEFAULT, "Attempting to consolidate video at %{public}@", buf, 0xCu);
      }

      v44 = 0;
      v32 = objc_msgSend(MEMORY[0x1E0C8B0D0], "consolidateMovieFragmentsInFile:error:", v4, &v44);
      v19 = v44;
      if ((v32 & 1) != 0)
      {
        v43 = v14;
        v33 = -[CAMNebulaIrisBackendController _extractIrisPropertiesFromAVAsset:stillImageDisplayTime:irisIdentifier:](self, "_extractIrisPropertiesFromAVAsset:stillImageDisplayTime:irisIdentifier:", v12, &v52, &v43);
        v21 = v43;

        if (!v33)
        {
          v16 = v10;
          v17 = v8;
          v18 = 0;
          v20 = 1;
          goto LABEL_26;
        }
        v14 = v21;
        v9 = v39;
        goto LABEL_4;
      }
      v16 = v10;
      v17 = v8;
      v34 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CAMNebulaIrisBackendController _videoJobFromURL:].cold.3();

    }
    else
    {
      v16 = v10;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = objc_claimAutoreleasedReturnValue();
      v22 = -[NSObject fileExistsAtPath:](v19, "fileExistsAtPath:", v6);
      v23 = os_log_create("com.apple.camera", "Nebula");
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      v17 = v8;
      if (v22)
      {
        if (v24)
          -[CAMNebulaIrisBackendController _videoJobFromURL:].cold.1((uint64_t)v4, v23, v25, v26, v27, v28, v29, v30);
      }
      else if (v24)
      {
        -[CAMNebulaIrisBackendController _videoJobFromURL:].cold.2((uint64_t)v4, v23, v25, v26, v27, v28, v29, v30);
      }

      v14 = 0;
    }
    v18 = 0;
    v20 = 1;
LABEL_25:

    v21 = v14;
LABEL_26:
    v5 = v38;
    goto LABEL_27;
  }
  v16 = v10;
  v17 = v8;
  v12 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "Could not extract the needed information from %{public}@", buf, 0xCu);
  }
  v21 = 0;
  v18 = 0;
  v20 = 1;
LABEL_27:

  objc_autoreleasePoolPop(v5);
  if (v20)
    v35 = 0;
  else
    v35 = v18;

  return v35;
}

- (BOOL)_extractIrisPropertiesFromAVAsset:(id)a3 stillImageDisplayTime:(id *)a4 irisIdentifier:(id *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __int128 v13;
  int64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0CA2E18];
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  objc_msgSend(a3, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PFReadImageDisplayTimeFromVideoFileAtPath();
  PFReadPairingIdentifierFromVideoAtPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (a4)
    {
      *(_OWORD *)&a4->var0 = v13;
      a4->var3 = v14;
    }
    if (a5)
      *a5 = objc_retainAutorelease(v9);
  }
  else
  {
    v11 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "Failed to retrieve irisIdentifier for %{public}@", buf, 0xCu);
    }

  }
  return v10 != 0;
}

- (void)_coordinationQueue_setFailureCount:(unint64_t)a3 forVideoURL:(id)a4
{
  unsigned __int16 v4;
  id v6;
  NSObject *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setUInt16:forKey:", v4, CFSTR("com.apple.assetsd.nebulad.failureCount"));
  objc_msgSend(v8, "persist");

}

- (unint64_t)_coordinationQueue_failureCountForVideoURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  unsigned __int16 v9;

  v4 = a3;
  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  if (objc_msgSend(v6, "getUInt16:forKey:", &v9, CFSTR("com.apple.assetsd.nebulad.failureCount")))
    v7 = v9;
  else
    v7 = 0;

  return v7;
}

- (void)_coordinationQueue_setupCameraProcessingMonitoringIfNecessary
{
  NSObject *v3;
  BKSApplicationStateMonitor *v4;
  BKSApplicationStateMonitor *applicationStateMonitor;
  BKSApplicationStateMonitor *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!self->__applicationStateMonitor)
  {
    objc_initWeak(&location, self);
    v4 = (BKSApplicationStateMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE2F0]), "initWithBundleIDs:states:", &unk_1EA3B3578, 1);
    applicationStateMonitor = self->__applicationStateMonitor;
    self->__applicationStateMonitor = v4;

    v6 = self->__applicationStateMonitor;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke;
    v7[3] = &unk_1EA32D1E0;
    objc_copyWeak(&v8, &location);
    -[BKSApplicationStateMonitor setHandler:](v6, "setHandler:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CFE2C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "integerValue") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_2;
    v7[3] = &unk_1EA328868;
    v8 = WeakRetained;
    v6 = WeakRetained;
    objc_msgSend(v6, "_dispatchToCoordinationQueueWithBlock:", v7);

  }
}

void __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_isIOWorkSuspended"))
  {
    v2 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Resuming IO work because Camera has died", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setIOWorkSuspended:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_setCrashRecoveryNeeded:", 1);
    v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_46;
    v4[3] = &unk_1EA328868;
    v5 = v3;
    objc_msgSend(v5, "_dispatchToCoordinationQueueAfterDelay:withBlock:", v4, 1.0);

  }
}

uint64_t __95__CAMNebulaIrisBackendController__coordinationQueue_setupCameraProcessingMonitoringIfNecessary__block_invoke_46(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_coordinationQueue_createJobsForCrashRecoveryIfNeeded");
}

- (void)_coordinationQueue_destroyApplicationStateMonitor
{
  NSObject *v3;
  BKSApplicationStateMonitor *applicationStateMonitor;

  -[CAMNebulaIrisBackendController _coordinationQueue](self, "_coordinationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[BKSApplicationStateMonitor invalidate](self->__applicationStateMonitor, "invalidate");
  applicationStateMonitor = self->__applicationStateMonitor;
  self->__applicationStateMonitor = 0;

}

- (BOOL)_removeItemAtURL:(id)a3 maxAttempts:(int64_t)a4
{
  id v6;
  BOOL v7;
  int64_t v8;
  BOOL v9;
  char v11;
  NSObject *v12;

  v6 = a3;
  v7 = 0;
  if (v6 && a4 >= 1)
  {
    v8 = 1;
    do
    {
      v9 = -[CAMNebulaIrisBackendController _removeItemAtURL:](self, "_removeItemAtURL:", v6);
      v7 = v9;
      if (v9)
        break;
    }
    while (v8++ < a4);
    v11 = a4 < 2 || v9;
    if ((v11 & 1) == 0)
    {
      v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[CAMNebulaIrisBackendController _removeItemAtURL:maxAttempts:].cold.1((uint64_t)v6, a4, v12);

      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)_removeItemAtURL:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  BOOL v10;
  id v12;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v5 = objc_msgSend(v4, "removeItemAtURL:error:", v3, &v12);
    v6 = v12;
    if ((v5 & 1) != 0
      || (objc_msgSend(v3, "path"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v4, "fileExistsAtPath:", v7),
          v7,
          !v8))
    {
      v10 = 1;
    }
    else
    {
      v9 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CAMNebulaIrisBackendController _removeItemAtURL:].cold.1();

      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (OS_dispatch_queue)_coordinationQueue
{
  return self->__coordinationQueue;
}

- (OS_dispatch_queue)_linkWorkQueue
{
  return self->__linkWorkQueue;
}

- (CAMPersistenceController)_persistenceController
{
  return self->__persistenceController;
}

- (CAMNebulaKeepAliveController)_keepAliveController
{
  return self->__keepAliveController;
}

- (int)_notifyRegisterTokenSuspendIO
{
  return self->__notifyRegisterTokenSuspendIO;
}

- (int)_notifyRegisterTokenResumeIO
{
  return self->__notifyRegisterTokenResumeIO;
}

- (BOOL)_coordinationQueue_shouldCheckMarkerFileForIOWorkSuspension
{
  return self->__shouldCheckMarkerFileForIOWorkSuspension;
}

- (NSMutableDictionary)_transactionForPersistenceUUID
{
  return self->__transactionForPersistenceUUID;
}

- (NSMutableDictionary)_pendingOrInFlightJobsByUniqueIdentifier
{
  return self->__pendingOrInFlightJobsByUniqueIdentifier;
}

- (NSMutableArray)_pendingExportVideoJobs
{
  return self->__pendingExportVideoJobs;
}

- (AVAssetExportSession)_activeExportSession
{
  return self->__activeExportSession;
}

- (void)_setActiveExportSession:(id)a3
{
  objc_storeStrong((id *)&self->__activeExportSession, a3);
}

- (NSMutableDictionary)_bundleIdentifiersByVideoPersistenceUUID
{
  return self->__bundleIdentifiersByVideoPersistenceUUID;
}

- (BOOL)_coordinationQueue_isCrashRecoveryNeeded
{
  return self->__crashRecoveryNeeded;
}

- (BKSApplicationStateMonitor)_applicationStateMonitor
{
  return self->__applicationStateMonitor;
}

- (NSHashTable)_clientConnections
{
  return self->__clientConnections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__clientConnections, 0);
  objc_storeStrong((id *)&self->__applicationStateMonitor, 0);
  objc_storeStrong((id *)&self->__bundleIdentifiersByVideoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->__activeExportSession, 0);
  objc_storeStrong((id *)&self->__pendingExportVideoJobs, 0);
  objc_storeStrong((id *)&self->__pendingOrInFlightJobsByUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->__transactionForPersistenceUUID, 0);
  objc_storeStrong((id *)&self->__keepAliveController, 0);
  objc_storeStrong((id *)&self->__persistenceController, 0);
  objc_storeStrong((id *)&self->__linkWorkQueue, 0);
  objc_storeStrong((id *)&self->__coordinationQueue, 0);
}

- (void)_videoJobFromURL:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Failed to create AVAsset from existing file %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_videoJobFromURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "File went missing from %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_videoJobFromURL:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to consolidate video at %{public}@: %{public}@.");
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeItemAtURL:(NSObject *)a3 maxAttempts:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_7(&dword_1DB760000, a2, a3, "Giving up after %ld attempts to delete %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeItemAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7(&dword_1DB760000, v0, v1, "Failed to remove %{public}@: %{public}@");
  OUTLINED_FUNCTION_1_0();
}

@end
