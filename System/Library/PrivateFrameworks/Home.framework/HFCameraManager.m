@implementation HFCameraManager

- (NSError)cachedStreamError
{
  return self->_cachedStreamError;
}

- (HFCameraManager)initWithCameraProfile:(id)a3
{
  id v4;
  HFCameraManager *v5;
  HFCameraManager *v6;
  uint64_t v7;
  NSMapTable *snapshotRequesters;
  uint64_t v9;
  NSMapTable *streamRequesters;
  uint64_t v11;
  HFExecutionEnvironment *executionEnvironment;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraManager;
  v5 = -[HFCameraManager init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_cameraProfile, v4);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 2, 0, 0);
    snapshotRequesters = v6->_snapshotRequesters;
    v6->_snapshotRequesters = (NSMapTable *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 2, 0, 0);
    streamRequesters = v6->_streamRequesters;
    v6->_streamRequesters = (NSMapTable *)v9;

    +[HFExecutionEnvironment sharedInstance](HFExecutionEnvironment, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    executionEnvironment = v6->_executionEnvironment;
    v6->_executionEnvironment = (HFExecutionEnvironment *)v11;

  }
  return v6;
}

- (void)executionEnvironmentDidBecomeActive:(id)a3
{
  -[HFCameraManager _scheduleNextSnapshotEventWithPreviousError:](self, "_scheduleNextSnapshotEventWithPreviousError:", 0);
  -[HFCameraManager _startStreaming](self, "_startStreaming");
}

- (void)_startStreaming
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[HFCameraManager _hasStreamRequesters](self, "_hasStreamRequesters"))
  {
    -[HFCameraManager setCachedStreamError:](self, "setCachedStreamError:", 0);
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "streamControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "streamState");

    HFLogForCategory(0x1CuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraManager cameraProfile](self, "cameraProfile");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hf_prettyDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromHMCameraStreamState(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Starting stream for %@, current stream state: %@", (uint8_t *)&v12, 0x16u);

    }
    if ((unint64_t)(v5 - 3) <= 1)
    {
      -[HFCameraManager cameraProfile](self, "cameraProfile");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "streamControl");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startStream");

      -[HFCameraManager _dispatchStreamStateUpdate](self, "_dispatchStreamStateUpdate");
    }
  }
}

- (BOOL)_hasStreamRequesters
{
  void *v2;
  BOOL v3;

  -[HFCameraManager streamRequesters](self, "streamRequesters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMapTable)streamRequesters
{
  return self->_streamRequesters;
}

- (void)_beginPeriodicSnapshots
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1BuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Beginning periodic snapshots for %@", (uint8_t *)&v6, 0xCu);

  }
  -[HFCameraManager _scheduleNextSnapshotEventWithPreviousError:](self, "_scheduleNextSnapshotEventWithPreviousError:", 0);
}

- (void)cameraSnapshotControl:(id)a3 didTakeSnapshot:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a5;
  v7 = a3;
  -[HFCameraManager cameraProfile](self, "cameraProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "snapshotControl");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v7)
    -[HFCameraManager _scheduleNextSnapshotEventWithPreviousError:](self, "_scheduleNextSnapshotEventWithPreviousError:", v10);

}

void __63__HFCameraManager__scheduleNextSnapshotEventWithPreviousError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_hasSnapshotRequesters") & 1) == 0)
  {
    HFLogForCategory(0x1BuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cameraProfile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hf_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_error_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_ERROR, "Taking a snapshot for unrequested %@", (uint8_t *)&v16, 0xCu);

    }
  }
  objc_msgSend(WeakRetained, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReachable");

  if ((v5 & 1) == 0)
  {
    HFLogForCategory(0x1BuLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "cameraProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hf_prettyDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Taking a snapshot for unreachable %@", (uint8_t *)&v16, 0xCu);

    }
  }
  HFLogForCategory(0x1BuLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "cameraProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_prettyDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v9;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Taking snapshot for %@", (uint8_t *)&v16, 0xCu);

  }
  objc_msgSend(WeakRetained, "cameraProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotControl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "takeSnapshot");

}

- (void)_scheduleNextSnapshotEventWithPreviousError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  _BYTE v42[10];
  void *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    HFLogForCategory(0x20uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[HFCameraManager cameraProfile](self, "cameraProfile");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hf_prettyDescription");
      v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v7;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling snapshot for %@ because demo mode is enabled", buf, 0xCu);

    }
  }
  else
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraManager setSnapshotErrorDate:](self, "setSnapshotErrorDate:", v8);

      -[HFCameraManager setSnapshotErrorCount:](self, "setSnapshotErrorCount:", -[HFCameraManager snapshotErrorCount](self, "snapshotErrorCount") + 1);
      HFLogForCategory(0x1BuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[HFCameraManager cameraProfile](self, "cameraProfile");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "hf_prettyDescription");
        v34 = objc_claimAutoreleasedReturnValue();
        -[HFCameraManager snapshotErrorDate](self, "snapshotErrorDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCameraManager snapshotErrorCount](self, "snapshotErrorCount"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v40 = v34;
        v41 = 2112;
        *(_QWORD *)v42 = v4;
        *(_WORD *)&v42[8] = 2112;
        v43 = v35;
        v44 = 2112;
        v45 = v36;
        _os_log_error_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_ERROR, "Snapshot failed for %@; error: %@; snapshotErrorDate: %@; snapshotErrorCount: %@",
          buf,
          0x2Au);

      }
    }
    else
    {
      -[HFCameraManager setSnapshotErrorDate:](self, "setSnapshotErrorDate:", 0);
      -[HFCameraManager setSnapshotErrorCount:](self, "setSnapshotErrorCount:", 0);
    }
    if (-[HFCameraManager _hasSnapshotRequesters](self, "_hasSnapshotRequesters")
      && (-[HFCameraManager cameraProfile](self, "cameraProfile"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "accessory"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isReachable"),
          v11,
          v10,
          (v12 & 1) != 0))
    {
      -[HFCameraManager _nextSnapshotDate](self, "_nextSnapshotDate");
      v5 = objc_claimAutoreleasedReturnValue();
      HFLogForCategory(0x1BuLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCameraManager cameraProfile](self, "cameraProfile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hf_prettyDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x1E0CB37E8];
        -[HFCameraManager cameraProfile](self, "cameraProfile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "accessory");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInteger:", objc_msgSend(v18, "reachableTransports"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v5;
        v41 = 2112;
        *(_QWORD *)v42 = v15;
        *(_WORD *)&v42[8] = 2112;
        v43 = v19;
        _os_log_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEFAULT, "Scheduling next snapshot at %@ for %@ (reachable transports: %@)", buf, 0x20u);

      }
      -[HFCameraManager nextSnapshotEvent](self, "nextSnapshotEvent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cancel");

      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject timeIntervalSinceNow](v5, "timeIntervalSinceNow");
      v23 = v22;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __63__HFCameraManager__scheduleNextSnapshotEventWithPreviousError___block_invoke;
      v37[3] = &unk_1EA728AE8;
      objc_copyWeak(&v38, (id *)buf);
      objc_msgSend(v21, "afterDelay:performBlock:", v37, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCameraManager setNextSnapshotEvent:](self, "setNextSnapshotEvent:", v24);

      objc_destroyWeak(&v38);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      HFLogForCategory(0x1BuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        -[HFCameraManager cameraProfile](self, "cameraProfile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "hf_prettyDescription");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = -[HFCameraManager _hasSnapshotRequesters](self, "_hasSnapshotRequesters");
        -[HFCameraManager cameraProfile](self, "cameraProfile");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "accessory");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isReachable");
        -[HFCameraManager executionEnvironment](self, "executionEnvironment");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isActive");
        *(_DWORD *)buf = 138413058;
        v40 = v26;
        v41 = 1024;
        *(_DWORD *)v42 = v27;
        *(_WORD *)&v42[4] = 1024;
        *(_DWORD *)&v42[6] = v30;
        LOWORD(v43) = 1024;
        *(_DWORD *)((char *)&v43 + 2) = v32;
        _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Not scheduling another snapshot for %@ (has requesters: %d, reachable: %d, execution active: %d", buf, 0x1Eu);

      }
    }
  }

}

- (HMCameraProfile)cameraProfile
{
  return (HMCameraProfile *)objc_loadWeakRetained((id *)&self->_cameraProfile);
}

- (unint64_t)snapshotErrorCount
{
  return self->_snapshotErrorCount;
}

- (void)setSnapshotErrorDate:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotErrorDate, a3);
}

- (void)setSnapshotErrorCount:(unint64_t)a3
{
  self->_snapshotErrorCount = a3;
}

- (void)setNextSnapshotEvent:(id)a3
{
  objc_storeStrong((id *)&self->_nextSnapshotEvent, a3);
}

- (NACancelable)nextSnapshotEvent
{
  return self->_nextSnapshotEvent;
}

- (id)_nextSnapshotDate
{
  void *v3;
  void *v4;
  NSObject *v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];

  -[HFCameraManager snapshotErrorDate](self, "snapshotErrorDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFCameraManager snapshotErrorDate](self, "snapshotErrorDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[HFCameraManager snapshotErrorCount](self, "snapshotErrorCount"))
    {
      HFLogForCategory(0x1BuLL);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Handling a snapshot error with no count", v16, 2u);
      }

    }
    -[HFCameraManager _snapshotTimeInterval](self, "_snapshotTimeInterval");
    v7 = v6;
    v8 = -[HFCameraManager snapshotErrorCount](self, "snapshotErrorCount");
    v9 = 10;
    if (v8 < 0xA)
      v9 = v8;
    v10 = v7 * (double)v9;
  }
  else
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "snapshotControl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mostRecentSnapshot");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "captureDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFCameraManager _snapshotTimeInterval](self, "_snapshotTimeInterval");
  }
  objc_msgSend(v4, "dateByAddingTimeInterval:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSDate)snapshotErrorDate
{
  return self->_snapshotErrorDate;
}

- (double)_snapshotTimeInterval
{
  return 10.0;
}

- (void)beginPeriodicSnapshotsWithRequester:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x1E0D51998]);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __55__HFCameraManager_beginPeriodicSnapshotsWithRequester___block_invoke;
    v15 = &unk_1EA73AD38;
    objc_copyWeak(&v16, &location);
    v8 = (void *)objc_msgSend(v7, "initWithTargetObject:finalizer:", v4, &v12);
    -[HFCameraManager snapshotRequesters](self, "snapshotRequesters", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

    -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 1)
    {
      -[HFCameraManager _beginPeriodicSnapshots](self, "_beginPeriodicSnapshots");
      -[HFCameraManager _updateEventRegistration](self, "_updateEventRegistration");
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

- (BOOL)_hasSnapshotRequesters
{
  void *v2;
  BOOL v3;

  -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSMapTable)snapshotRequesters
{
  return self->_snapshotRequesters;
}

- (void)setIsRegisteredForEvents:(BOOL)a3
{
  self->_isRegisteredForEvents = a3;
}

- (void)_updateEventRegistration
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (-[HFCameraManager _hasSnapshotRequesters](self, "_hasSnapshotRequesters")
    || -[HFCameraManager _hasStreamRequesters](self, "_hasStreamRequesters"))
  {
    if (-[HFCameraManager isRegisteredForEvents](self, "isRegisteredForEvents"))
      return;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCameraObserver:", self);

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addAccessoryObserver:", self);

    -[HFCameraManager executionEnvironment](self, "executionEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:", self);
    v6 = 1;
  }
  else
  {
    if (!-[HFCameraManager isRegisteredForEvents](self, "isRegisteredForEvents"))
      return;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeCameraObserver:", self);

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAccessoryObserver:", self);

    -[HFCameraManager executionEnvironment](self, "executionEnvironment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);
    v6 = 0;
  }

  -[HFCameraManager setIsRegisteredForEvents:](self, "setIsRegisteredForEvents:", v6);
}

- (BOOL)isRegisteredForEvents
{
  return self->_isRegisteredForEvents;
}

- (HFExecutionEnvironment)executionEnvironment
{
  return self->_executionEnvironment;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[HFCameraManager nextSnapshotEvent](self, "nextSnapshotEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)HFCameraManager;
  -[HFCameraManager dealloc](&v4, sel_dealloc);
}

void __55__HFCameraManager_beginPeriodicSnapshotsWithRequester___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endPeriodicSnapshotsWithRequester:", a2);

}

- (void)endPeriodicSnapshotsWithRequester:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v9);

    -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      -[HFCameraManager _endPeriodicSnapshots](self, "_endPeriodicSnapshots");
      -[HFCameraManager _updateEventRegistration](self, "_updateEventRegistration");
    }
  }

}

- (BOOL)arePeriodicSnapshotsEnabled
{
  void *v2;
  BOOL v3;

  -[HFCameraManager snapshotRequesters](self, "snapshotRequesters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)beginContinuousStreamingWithRequester:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  id location;

  v4 = a3;
  -[HFCameraManager streamRequesters](self, "streamRequesters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x1E0D51998]);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __57__HFCameraManager_beginContinuousStreamingWithRequester___block_invoke;
    v15 = &unk_1EA73AD38;
    objc_copyWeak(&v16, &location);
    v8 = (void *)objc_msgSend(v7, "initWithTargetObject:finalizer:", v4, &v12);
    -[HFCameraManager streamRequesters](self, "streamRequesters", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

    -[HFCameraManager streamRequesters](self, "streamRequesters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 == 1)
    {
      -[HFCameraManager _beginContinuousStreaming](self, "_beginContinuousStreaming");
      -[HFCameraManager _updateEventRegistration](self, "_updateEventRegistration");
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

}

void __57__HFCameraManager_beginContinuousStreamingWithRequester___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "endContinuousStreamingWithRequester:", a2);

}

- (void)endContinuousStreamingWithRequester:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[HFCameraManager streamRequesters](self, "streamRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFCameraManager streamRequesters](self, "streamRequesters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v9);

    -[HFCameraManager streamRequesters](self, "streamRequesters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (!v8)
    {
      -[HFCameraManager _endContinuousStreaming](self, "_endContinuousStreaming");
      -[HFCameraManager _updateEventRegistration](self, "_updateEventRegistration");
    }
  }

}

- (BOOL)isContinuousStreamingEnabled
{
  void *v2;
  BOOL v3;

  -[HFCameraManager streamRequesters](self, "streamRequesters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_endPeriodicSnapshots
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1BuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Ending periodic snapshots for %@", (uint8_t *)&v6, 0xCu);

  }
  -[HFCameraManager _cancelNextSnapshotEvent](self, "_cancelNextSnapshotEvent");
}

- (void)_cancelNextSnapshotEvent
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1BuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Cancelling next snapshot event for %@", (uint8_t *)&v7, 0xCu);

  }
  -[HFCameraManager nextSnapshotEvent](self, "nextSnapshotEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[HFCameraManager setNextSnapshotEvent:](self, "setNextSnapshotEvent:", 0);
}

- (void)cameraSnapshotControlDidUpdateMostRecentSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HFCameraManager cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HFCameraManager _scheduleNextSnapshotEventWithPreviousError:](self, "_scheduleNextSnapshotEventWithPreviousError:", 0);
}

- (void)_beginContinuousStreaming
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1CuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Beginning continuous streaming for %@", (uint8_t *)&v6, 0xCu);

  }
  -[HFCameraManager _startStreaming](self, "_startStreaming");
}

- (void)_endContinuousStreaming
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1CuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Ending continuous streaming for %@", (uint8_t *)&v6, 0xCu);

  }
  -[HFCameraManager _stopStreaming](self, "_stopStreaming");
}

- (void)_stopStreaming
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HFCameraManager cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "streamControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "streamState");

  HFLogForCategory(0x1CuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHMCameraStreamState(v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Stopping stream for %@, current stream state: %@", (uint8_t *)&v12, 0x16u);

  }
  if ((unint64_t)(v5 - 1) <= 1)
  {
    -[HFCameraManager cameraProfile](self, "cameraProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "streamControl");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopStream");

    -[HFCameraManager _dispatchStreamStateUpdate](self, "_dispatchStreamStateUpdate");
  }
}

- (void)_dispatchStreamStateUpdate
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD block[4];
  void (**v5)(_QWORD);
  _QWORD aBlock[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke;
  aBlock[3] = &unk_1EA728AE8;
  objc_copyWeak(&v7, &location);
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (+[HFUtilities isInternalTest](HFUtilities, "isInternalTest"))
  {
    v3[2](v3);
  }
  else
  {
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_3;
    block[3] = &unk_1EA73AD88;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke(id *a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[4];
  id v5;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_2;
  v4[3] = &unk_1EA73AD60;
  a1 += 4;
  objc_copyWeak(&v5, a1);
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(v2, "dispatchCameraObserverMessage:sender:", v4, WeakRetained);

  objc_destroyWeak(&v5);
}

void __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "cameraProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "streamControl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraStreamControlDidUpdateStreamState:", v5);

  }
}

uint64_t __45__HFCameraManager__dispatchStreamStateUpdate__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cameraStreamControlDidStartStream:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HFCameraManager cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamControl");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    -[HFCameraManager setCachedStreamError:](self, "setCachedStreamError:", 0);
    -[HFCameraManager _dispatchStreamStateUpdate](self, "_dispatchStreamStateUpdate");
  }
}

- (void)cameraStreamControl:(id)a3 didStopStreamWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a4;
  v7 = a3;
  v8 = v6;
  if (+[HFExecutionEnvironment isHomeNotification](HFExecutionEnvironment, "isHomeNotification"))
  {
    v8 = v6;
    if (objc_msgSend(v6, "code") == 23)
    {

      v8 = 0;
    }
  }
  -[HFCameraManager cameraProfile](self, "cameraProfile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "streamControl");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v7)
  {
    if (!v8)
    {
      HFLogForCategory(0x1CuLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "HFCameraManager restarting streaming after didStopStreamWithError nil", v12, 2u);
      }

      -[HFCameraManager _startStreaming](self, "_startStreaming");
    }
    -[HFCameraManager setCachedStreamError:](self, "setCachedStreamError:", v8);
    -[HFCameraManager _dispatchStreamStateUpdate](self, "_dispatchStreamStateUpdate");
  }

}

- (void)accessoryDidUpdateReachability:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HFCameraManager cameraProfile](self, "cameraProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    if (objc_msgSend(v7, "isReachable"))
    {
      -[HFCameraManager _scheduleNextSnapshotEventWithPreviousError:](self, "_scheduleNextSnapshotEventWithPreviousError:", 0);
      -[HFCameraManager _startStreaming](self, "_startStreaming");
    }
    else
    {
      -[HFCameraManager _cancelNextSnapshotEvent](self, "_cancelNextSnapshotEvent");
    }
    v6 = v7;
  }

}

- (void)setCachedStreamError:(id)a3
{
  NSError *v5;
  _QWORD block[5];

  v5 = (NSError *)a3;
  if (self->_cachedStreamError != v5)
  {
    objc_storeStrong((id *)&self->_cachedStreamError, a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__HFCameraManager_setCachedStreamError___block_invoke;
    block[3] = &unk_1EA727DD8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __40__HFCameraManager_setCachedStreamError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__HFCameraManager_setCachedStreamError___block_invoke_2;
  v3[3] = &unk_1EA73ADB0;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dispatchCameraObserverMessage:sender:", v3);

}

void __40__HFCameraManager_setCachedStreamError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraProfile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "streamControl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cameraStreamControlDidUpdateManagerState:", v4);

  }
}

- (void)setExecutionEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_executionEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionEnvironment, 0);
  objc_storeStrong((id *)&self->_snapshotErrorDate, 0);
  objc_storeStrong((id *)&self->_nextSnapshotEvent, 0);
  objc_storeStrong((id *)&self->_streamRequesters, 0);
  objc_storeStrong((id *)&self->_snapshotRequesters, 0);
  objc_destroyWeak((id *)&self->_cameraProfile);
  objc_storeStrong((id *)&self->_cachedStreamError, 0);
}

@end
