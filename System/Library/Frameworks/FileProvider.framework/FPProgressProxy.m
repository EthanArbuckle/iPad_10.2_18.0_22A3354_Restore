@implementation FPProgressProxy

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A0A34000, log, OS_LOG_TYPE_FAULT, "[CRIT] Progress proxy wasn't stop properly", v1, 2u);
}

- (id)shortDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)updateWithProgress:(id)a3
{
  id v4;
  FPProgressProxy *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[FPProgressProxy setPausable:](v5, "setPausable:", objc_msgSend(v4, "isPausable"));
  v6 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__FPProgressProxy_updateWithProgress___block_invoke;
  v24[3] = &unk_1E444A308;
  v7 = v4;
  v25 = v7;
  -[FPProgressProxy setPausingHandler:](v5, "setPausingHandler:", v24);
  v22[0] = v6;
  v22[1] = 3221225472;
  v22[2] = __38__FPProgressProxy_updateWithProgress___block_invoke_2;
  v22[3] = &unk_1E444A308;
  v8 = v7;
  v23 = v8;
  -[FPProgressProxy setResumingHandler:](v5, "setResumingHandler:", v22);
  -[FPProgressProxy setCancellable:](v5, "setCancellable:", objc_msgSend(v8, "isCancellable"));
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __38__FPProgressProxy_updateWithProgress___block_invoke_3;
  v20[3] = &unk_1E444A308;
  v9 = v8;
  v21 = v9;
  -[FPProgressProxy setCancellationHandler:](v5, "setCancellationHandler:", v20);
  if (-[FPProgressProxy updateFileCount](v5, "updateFileCount"))
  {
    objc_msgSend(v9, "fileTotalCount");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy setFileTotalCount:](v5, "setFileTotalCount:", v10);

    objc_msgSend(v9, "fileCompletedCount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy setFileCompletedCount:](v5, "setFileCompletedCount:", v11);

  }
  objc_msgSend(v9, "fractionCompleted");
  v13 = v12;
  -[FPProgressProxy _setCompletedUnitCount:totalUnitCount:](v5, "_setCompletedUnitCount:totalUnitCount:", (uint64_t)(v12 * (double)objc_msgSend(v9, "totalUnitCount")), objc_msgSend(v9, "totalUnitCount"));
  objc_msgSend(v9, "userInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3060]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPProgressProxy setByteTotalCount:](v5, "setByteTotalCount:", v15);

  -[FPProgressProxy byteTotalCount](v5, "byteTotalCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[FPProgressProxy byteTotalCount](v5, "byteTotalCount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithDouble:", v13 * (double)objc_msgSend(v18, "longLongValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy setByteCompletedCount:](v5, "setByteCompletedCount:", v19);

  }
  else
  {
    -[FPProgressProxy setByteCompletedCount:](v5, "setByteCompletedCount:", 0);
  }

  objc_sync_exit(v5);
}

uint64_t __38__FPProgressProxy_updateWithProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pause");
}

uint64_t __38__FPProgressProxy_updateWithProgress___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resume");
}

uint64_t __38__FPProgressProxy_updateWithProgress___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)setCancellationHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[FPProgressProxy valueForKey:](self, "valueForKey:", CFSTR("_lock"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");
  v5 = (void *)MEMORY[0x1A1B00850](v4);

  -[FPProgressProxy setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("_cancellationHandler"));
  objc_msgSend(v6, "unlock");

}

- (void)_readPausedProgressFromDisk
{
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = a4;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a2, a3, "[DEBUG] %@: reading paused progress from disk: %g", (uint8_t *)&v4);
}

- (void)startTrackingFileURL:(id)a3 kind:(id)a4 allowReadPausedProgressFromDisk:(BOOL)a5
{
  _BOOL4 v5;
  id v10;
  id v11;
  id v12;
  FPProgressProxy *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  id subscriber;
  id v21;
  id *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  FPProgressProxy *v27;
  id v28;
  BOOL v29;
  id location[5];

  v5 = a5;
  location[4] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  location[0] = 0;
  objc_initWeak(location, self);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke;
  v24[3] = &unk_1E444C460;
  v22 = &v28;
  objc_copyWeak(&v28, location);
  v21 = v11;
  v25 = v21;
  v12 = v10;
  v29 = v5;
  v26 = v12;
  v27 = self;
  v23 = (void *)MEMORY[0x1A1B00850](v24);
  v13 = self;
  objc_sync_enter(v13);
  v13->_isInSetup = 1;
  if (v13->_subscriber)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy shortDescription](v13, "shortDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("FPProgressProxy.m"), 192, CFSTR("%@: startTracking/stopTracking not properly balanced"), v15, v21, &v28);

    if (v13->_subscriber)
      -[FPProgressProxy stopTrackingIfStarted](v13, "stopTrackingIfStarted");
  }
  if (v13->_fileURL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy shortDescription](v13, "shortDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("FPProgressProxy.m"), 197, CFSTR("%@: startTracking/stopTracking not properly balanced"), v17);

  }
  v13->_shouldStopAccessingURL = objc_msgSend(v12, "startAccessingSecurityScopedResource");
  objc_storeStrong((id *)&v13->_fileURL, a3);
  -[FPProgressProxy setTotalUnitCount:](v13, "setTotalUnitCount:", -1);
  -[FPProgressProxy setCancellable:](v13, "setCancellable:", 0);
  if (v5)
    -[FPProgressProxy _readPausedProgressFromDisk](v13, "_readPausedProgressFromDisk");
  fp_current_or_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[FPProgressProxy shortDescription](v13, "shortDescription");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fp_shortDescription");
    objc_claimAutoreleasedReturnValue();
    -[FPProgressProxy startTrackingFileURL:kind:allowReadPausedProgressFromDisk:].cold.1();
  }

  objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForFileURL:withPublishingHandler:", v12, v23);
  v19 = objc_claimAutoreleasedReturnValue();
  subscriber = v13->_subscriber;
  v13->_subscriber = (id)v19;

  v13->_isInSetup = 0;
  objc_sync_exit(v13);

  objc_destroyWeak(v22);
  objc_destroyWeak(location);

}

id __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ((objc_msgSend(v3, "fp_isOfFileOperationKind:strict:", *(_QWORD *)(a1 + 32), 0) & 1) != 0)
    {
      objc_msgSend(v3, "fileURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "fp_relationshipToItemAtURL:", *(_QWORD *)(a1 + 40));

      if (v6 == 1)
      {
        v7 = (id *)WeakRetained;
        objc_sync_enter(v7);
        if (v7[19])
        {
          fp_current_or_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "shortDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v37 = v25;
            v38 = 2112;
            v39 = v26;
            v40 = 2112;
            v41 = v3;
            _os_log_debug_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: replace observer for %@, newProgress %@", buf, 0x20u);

          }
          objc_msgSend(v7[19], "finishObserving");
          v9 = v7[19];
          v7[19] = 0;
        }
        else
        {
          fp_current_or_default_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v7, "shortDescription");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v37 = v27;
            v38 = 2112;
            v39 = v28;
            v40 = 2112;
            v41 = v3;
            _os_log_debug_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: add observer to %@, newProgress %@", buf, 0x20u);

          }
        }

        objc_msgSend(v7, "updateWithProgress:", v3);
        objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v3, "fractionCompleted");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_14;
        v33[3] = &unk_1E444C410;
        objc_copyWeak(&v35, (id *)(a1 + 56));
        v34 = v3;
        objc_msgSend(v13, "addObserverBlock:", v33);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = v7[19];
        v7[19] = (id)v15;

        objc_destroyWeak(&v35);
        objc_sync_exit(v7);

        v29[0] = v14;
        v29[1] = 3221225472;
        v29[2] = __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_16;
        v29[3] = &unk_1E444C438;
        v29[4] = v7;
        v17 = *(id *)(a1 + 40);
        v32 = *(_BYTE *)(a1 + 64);
        v18 = *(_QWORD *)(a1 + 48);
        v30 = v17;
        v31 = v18;
        v19 = (void *)MEMORY[0x1A1B00850](v29);
        v10 = (void *)MEMORY[0x1A1B00850](v19, v20, v21, v22, v23);

      }
      else
      {
        fp_current_or_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_1(WeakRetained, v3, v12);

        v10 = &__block_literal_global_11;
      }
    }
    else
    {
      fp_current_or_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_2(WeakRetained, (uint64_t)v3, v11);

      v10 = &__block_literal_global_9;
    }
  }
  else
  {
    v10 = &__block_literal_global_17;
  }

  return v10;
}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_14(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateWithProgress:", *(_QWORD *)(a1 + 32));

}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_16(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152))
  {
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "shortDescription");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      objc_claimAutoreleasedReturnValue();
      __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_16_cold_1();
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "finishObserving");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = 0;

  }
  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 48), "_readPausedProgressFromDisk");
  objc_sync_exit(v2);

}

- (void)stopTrackingIfStarted
{
  FPProgressProxy *obj;

  obj = self;
  objc_sync_enter(obj);
  -[FPProgressProxy stopTrackingIfStartedNotSynchronized](obj, "stopTrackingIfStartedNotSynchronized");
  objc_sync_exit(obj);

}

- (void)stopTrackingIfStartedNotSynchronized
{
  id subscriber;
  NSObservation *totalUnitCountObservation;
  NSObservation *v5;
  NSObservation *fractionCompletedObservation;
  NSObservation *v7;
  NSURL *fileURL;

  if (self->_subscriber)
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "_removeSubscriber:");
    subscriber = self->_subscriber;
    self->_subscriber = 0;

  }
  if (self->_shouldStopAccessingURL)
    -[NSURL stopAccessingSecurityScopedResource](self->_fileURL, "stopAccessingSecurityScopedResource");
  totalUnitCountObservation = self->_totalUnitCountObservation;
  if (totalUnitCountObservation)
  {
    -[NSObservation finishObserving](totalUnitCountObservation, "finishObserving");
    v5 = self->_totalUnitCountObservation;
    self->_totalUnitCountObservation = 0;

  }
  fractionCompletedObservation = self->_fractionCompletedObservation;
  if (fractionCompletedObservation)
  {
    -[NSObservation finishObserving](fractionCompletedObservation, "finishObserving");
    v7 = self->_fractionCompletedObservation;
    self->_fractionCompletedObservation = 0;

  }
  fileURL = self->_fileURL;
  self->_fileURL = 0;

}

- (void)setProgressDidSetupHandler:(id)a3
{
  id v4;
  FPProgressProxy *v5;
  NSObservation *totalUnitCountObservation;
  NSObservation *v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObservation *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  totalUnitCountObservation = v5->_totalUnitCountObservation;
  if (totalUnitCountObservation)
  {
    -[NSObservation finishObserving](totalUnitCountObservation, "finishObserving");
    v7 = v5->_totalUnitCountObservation;
    v5->_totalUnitCountObservation = 0;

  }
  location = 0;
  objc_initWeak(&location, v5);
  objc_msgSend(MEMORY[0x1E0CB3800], "keyPathWithRootObject:path:", v5, "totalUnitCount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke;
  v12[3] = &unk_1E444C488;
  objc_copyWeak(&v14, &location);
  v9 = v4;
  v13 = v9;
  objc_msgSend(v8, "addObserverBlock:", v12);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v5->_totalUnitCountObservation;
  v5->_totalUnitCountObservation = (NSObservation *)v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  objc_sync_exit(v5);

}

void __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id *v6;
  NSObject *v7;
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (id *)WeakRetained;
    objc_sync_enter(v6);
    if (!*((_BYTE *)v6 + 160) && objc_msgSend(v6, "totalUnitCount") >= 1)
    {
      fp_current_or_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke_cold_1((uint64_t)v6, v7);

      *((_BYTE *)v6 + 160) = 1;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      objc_msgSend(v6[18], "finishObserving");
      v8 = v6[18];
      v6[18] = 0;

    }
    objc_sync_exit(v6);

  }
}

- (BOOL)updateFileCount
{
  return self->_updateFileCount;
}

- (void)setUpdateFileCount:(BOOL)a3
{
  self->_updateFileCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fractionCompletedObservation, 0);
  objc_storeStrong((id *)&self->_totalUnitCountObservation, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong(&self->_subscriber, 0);
}

- (void)startTrackingFileURL:kind:allowReadPausedProgressFromDisk:.cold.1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_16_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v7, v5, "[DEBUG] %@: Trying to listen to %@", v6);

}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fp_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = a2;
  _os_log_debug_impl(&dword_1A0A34000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: ignoring published progress of a different URL (%@) %@", (uint8_t *)&v8, 0x20u);

}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_11(&dword_1A0A34000, a3, v6, "[DEBUG] %@: ignoring published progress of a different kind %@", (uint8_t *)&v7);

}

void __77__FPProgressProxy_startTrackingFileURL_kind_allowReadPausedProgressFromDisk___block_invoke_2_16_cold_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_16_0(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_11(&dword_1A0A34000, v7, v5, "[DEBUG] %@: remove observer for %@", v6);

}

void __46__FPProgressProxy_setProgressDidSetupHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] FPProgressProxy: calling parent setup handler for: %@", (uint8_t *)&v2, 0xCu);
}

@end
