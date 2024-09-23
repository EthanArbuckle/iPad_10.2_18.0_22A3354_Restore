@implementation CAMPeopleProximityController

- (CAMPeopleProximityController)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  CAMPeopleProximityController *v8;
  CAMPeopleProximityController *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CAMPeopleProximityController;
  v8 = -[CAMPeopleProximityController init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_USER_INITIATED, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = dispatch_queue_create("com.apple.camera.people-proximity.acquisition-queue", v11);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v12;

  }
  return v9;
}

- (void)startDiscoveryForIdentities:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__CAMPeopleProximityController_startDiscoveryForIdentities___block_invoke;
  v7[3] = &unk_1EA328A40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __60__CAMPeopleProximityController_startDiscoveryForIdentities___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startDiscoveryForIdentities:", *(_QWORD *)(a1 + 40));
}

- (void)stopDiscovery
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CAMPeopleProximityController_stopDiscovery__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __45__CAMPeopleProximityController_stopDiscovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopDiscovery");
}

- (Class)proximityScannerClass
{
  void *proximityScannerClass;
  void *v3;

  proximityScannerClass = self->_proximityScannerClass;
  if (!proximityScannerClass)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "peopleProximityUsesDeviceDiscovery");

    proximityScannerClass = (void *)objc_opt_class();
  }
  return (Class)proximityScannerClass;
}

- (void)_queue_startDiscoveryForIdentities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  double v22;
  NSObject *v23;
  double v24;
  NSObject *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  int v32;
  const __CFString *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "peopleProximityDetectionSupported") & 1) == 0)
  {
    v14 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CAMPeopleProximityController _queue_startDiscoveryForIdentities:].cold.1(v14);
    goto LABEL_28;
  }
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAMPeopleProximityController queue_identities](self, "queue_identities");
    v7 = objc_claimAutoreleasedReturnValue();
    if ((id)v7 == v4)
    {

      goto LABEL_29;
    }
    v8 = (void *)v7;
    -[CAMPeopleProximityController queue_identities](self, "queue_identities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToSet:", v4);

    if ((v10 & 1) != 0)
      goto LABEL_29;
    v11 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32) = 0;
      _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] filter contactIDs changed, restarting.", (uint8_t *)&v32, 2u);
    }

    -[CAMPeopleProximityController stopDiscovery](self, "stopDiscovery");
  }
  v12 = -[CAMPeopleProximityController queue_discoveryState](self, "queue_discoveryState");
  if (v12)
  {
    if (v12 != 2)
      goto LABEL_29;
    v13 = 3;
  }
  else
  {
    v13 = 1;
  }
  -[CAMPeopleProximityController setQueue_discoveryState:](self, "setQueue_discoveryState:", v13);
  if (objc_msgSend(v4, "count"))
  {
    -[CAMPeopleProximityController setQueue_identities:](self, "setQueue_identities:", v4);
    v15 = objc_alloc(-[CAMPeopleProximityController proximityScannerClass](self, "proximityScannerClass"));
    -[CAMPeopleProximityController queue](self, "queue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithQueue:delegate:", v16, self);
    -[CAMPeopleProximityController setQueue_proximityScanner:](self, "setQueue_proximityScanner:", v17);

    v18 = -[CAMPeopleProximityController queue_discoveryState](self, "queue_discoveryState");
    if (v18 == 1)
    {
      -[CAMPeopleProximityController setQueue_hasDiscoveredFirstPerson:](self, "setQueue_hasDiscoveredFirstPerson:", 0);
      -[CAMPeopleProximityController setQueue_hasDiscoveredFirstPersonNearby:](self, "setQueue_hasDiscoveredFirstPersonNearby:", 0);
      -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CAMSignpostsDiscoverPersonBegin();

      -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CAMSignpostsDiscoverPersonNearbyBegin();

      v21 = objc_msgSend(v5, "peopleProximityInitialScanRate");
      objc_msgSend(v5, "peopleProximityInitialScanDuration");
    }
    else
    {
      v21 = objc_msgSend(v5, "peopleProximitySubsequentScanRate");
      objc_msgSend(v5, "peopleProximitySubsequentScanDuration");
    }
    v24 = v22;
    v25 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      if (v18 == 1)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v27 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsJoinedByString:", CFSTR(", "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138544643;
      v33 = v26;
      v34 = 2048;
      v35 = v21;
      v36 = 2048;
      v37 = v24;
      v38 = 2048;
      v39 = v27;
      v40 = 2113;
      v41 = v29;
      v42 = 2114;
      v43 = v31;
      _os_log_impl(&dword_1DB760000, v25, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] People discovery start initialScan:%{public}@ scanRate:%lu timeout:%.0fs, scanning for %ld identities:[%{private}@] with %{public}@", (uint8_t *)&v32, 0x3Eu);

    }
    -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject startDiscoveryWithScanRate:timeout:](v14, "startDiscoveryWithScanRate:timeout:", v21, v24);
LABEL_28:

    goto LABEL_29;
  }
  v23 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v32) = 0;
    _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] No identities to scan for, cannot start device discovery", (uint8_t *)&v32, 2u);
  }

  -[CAMPeopleProximityController setQueue_discoveryState:](self, "setQueue_discoveryState:", 0);
LABEL_29:

}

- (void)_queue_stopDiscovery
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CAMPeopleProximityController setQueue_discoveryState:](self, "setQueue_discoveryState:", 0);
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Person discovery stop", v7, 2u);
    }

    -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CAMPeopleProximityController setQueue_proximityScanner:](self, "setQueue_proximityScanner:", 0);
      -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stopDiscovery");

    }
  }
}

- (void)_queue_handleScannerDidStop
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMPeopleProximityController queue_discoveryState](self, "queue_discoveryState");
  if (v4 == 1)
  {
LABEL_4:
    -[CAMPeopleProximityController setQueue_discoveryState:](self, "setQueue_discoveryState:", 2);
    objc_msgSend(v3, "peopleProximityScanWaitInterval");
    v6 = v5;
    -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    -[CAMPeopleProximityController queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__CAMPeopleProximityController__queue_handleScannerDidStop__block_invoke;
    block[3] = &unk_1EA328F00;
    objc_copyWeak(&v13, &location);
    v12 = v7;
    v10 = v7;
    dispatch_after(v8, v9, block);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    goto LABEL_6;
  }
  if (v4 == 3)
  {
    if ((objc_msgSend(v3, "peopleProximityScanIndefinitely") & 1) == 0)
    {
      -[CAMPeopleProximityController setQueue_discoveryState:](self, "setQueue_discoveryState:", 0);
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

}

void __59__CAMPeopleProximityController__queue_handleScannerDidStop__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_queue_handleFinishedWaitingForScanner:", *(_QWORD *)(a1 + 32));

}

- (void)_queue_handleFinishedWaitingForScanner:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4 && -[CAMPeopleProximityController queue_discoveryState](self, "queue_discoveryState") == 2)
  {
    v6 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v4;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Finished waiting for scanner, restarting:%{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[CAMPeopleProximityController setQueue_proximityScanner:](self, "setQueue_proximityScanner:", 0);
    -[CAMPeopleProximityController queue_identities](self, "queue_identities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPeopleProximityController _queue_startDiscoveryForIdentities:](self, "_queue_startDiscoveryForIdentities:", v7);

  }
}

- (void)setQueue_discoveryState:(unint64_t)a3
{
  NSObject *v4;
  __CFString *v5;
  void *v6;
  int v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_queue_discoveryState != a3)
  {
    self->_queue_discoveryState = a3;
    v4 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (a3 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "description");
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = off_1EA328F20[a3];
      }
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] setDiscoveryState: %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (BOOL)peopleProximityScanner:(id)a3 shouldDiscoverIdentity:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  void *v15;
  char v16;
  BOOL v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v6)
  {
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CAMPeopleProximityController queue_identities](self, "queue_identities", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        if ((CAMLibrarySelectionIdentityMatch(*(void **)(*((_QWORD *)&v20 + 1) + 8 * i), v7) & 1) != 0)
        {
          v14 = 1;
          goto LABEL_12;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_12:

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "librarySelectionMockAutomationModeEnabled");

  v17 = 1;
  if ((v14 & 1) == 0 && (v16 & 1) == 0)
  {
    v18 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[CAMPeopleProximityController peopleProximityScanner:shouldDiscoverIdentity:].cold.1((uint64_t)v7, v18);

    goto LABEL_17;
  }
LABEL_18:

  return v17;
}

- (void)peopleProximityScanner:(id)a3 didDiscoverIdentity:(id)a4 distance:(unint64_t)a5 rssi:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *delegateQueue;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 != v10)
    goto LABEL_22;
  v13 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if ((uint64_t)a5 > 19)
    {
      if (a5 == 20)
      {
        v14 = CFSTR("Near");
        goto LABEL_11;
      }
      if (a5 == 30)
      {
        v14 = CFSTR("Far");
        goto LABEL_11;
      }
    }
    else if (a5 == 10)
    {
      v14 = CFSTR("Immediate");
LABEL_11:
      *(_DWORD *)buf = 138478339;
      v22 = v11;
      v23 = 2114;
      v24 = v14;
      v25 = 2048;
      v26 = a6;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Found %{private}@, distance: %{public}@, rssi:%ld", buf, 0x20u);
      goto LABEL_12;
    }
    v14 = CFSTR("Unknown");
    goto LABEL_11;
  }
LABEL_12:

  if (!-[CAMPeopleProximityController queue_hasDiscoveredFirstPerson](self, "queue_hasDiscoveredFirstPerson"))
  {
    CAMSignpostsDiscoverPersonEnd((uint64_t)v10, a5, a6);
    -[CAMPeopleProximityController setQueue_hasDiscoveredFirstPerson:](self, "setQueue_hasDiscoveredFirstPerson:", 1);
  }
  if (a5 == 20 || a5 == 10)
  {
    if (!-[CAMPeopleProximityController queue_hasDiscoveredFirstPersonNearby](self, "queue_hasDiscoveredFirstPersonNearby"))
    {
      CAMSignpostsDiscoverPersonNearbyEnd((uint64_t)v10, a5, a6);
      -[CAMPeopleProximityController setQueue_hasDiscoveredFirstPersonNearby:](self, "setQueue_hasDiscoveredFirstPersonNearby:", 1);
    }
  }
  else
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "peopleProximityIgnoreNearbyRequirements");

    if (!v16)
      goto LABEL_22;
  }
  v17 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v22 = v11;
    _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Found identity: %{private}@", buf, 0xCu);
  }

  delegateQueue = self->_delegateQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__CAMPeopleProximityController_peopleProximityScanner_didDiscoverIdentity_distance_rssi___block_invoke;
  v19[3] = &unk_1EA328A40;
  v19[4] = self;
  v20 = v11;
  dispatch_sync(delegateQueue, v19);

LABEL_22:
}

void __89__CAMPeopleProximityController_peopleProximityScanner_didDiscoverIdentity_distance_rssi___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDiscoverIdentity:", *(_QWORD *)(a1 + 40));

}

- (void)peopleProximityScanner:(id)a3 didLoseIdentity:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *delegateQueue;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  queue = self->_queue;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    v10 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v15 = v6;
      _os_log_impl(&dword_1DB760000, v10, OS_LOG_TYPE_DEFAULT, "[CAMPeopleProximityController] Lost: %{private}@", buf, 0xCu);
    }

    delegateQueue = self->_delegateQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__CAMPeopleProximityController_peopleProximityScanner_didLoseIdentity___block_invoke;
    v12[3] = &unk_1EA328A40;
    v12[4] = self;
    v13 = v6;
    dispatch_sync(delegateQueue, v12);

  }
}

void __71__CAMPeopleProximityController_peopleProximityScanner_didLoseIdentity___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didLoseIdentity:", *(_QWORD *)(a1 + 40));

}

- (void)peopleProximityScannerDidStopDiscovery:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[CAMPeopleProximityController queue_proximityScanner](self, "queue_proximityScanner");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[CAMPeopleProximityController _queue_handleScannerDidStop](self, "_queue_handleScannerDidStop");
}

- (void)setProximityScannerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_proximityScannerClass, a3);
}

- (CAMPeopleProximityDelegate)delegate
{
  return (CAMPeopleProximityDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)queue_discoveryState
{
  return self->_queue_discoveryState;
}

- (NSSet)queue_identities
{
  return self->_queue_identities;
}

- (void)setQueue_identities:(id)a3
{
  objc_storeStrong((id *)&self->_queue_identities, a3);
}

- (CNContactStore)queue_contactStore
{
  return self->_queue_contactStore;
}

- (void)setQueue_contactStore:(id)a3
{
  objc_storeStrong((id *)&self->_queue_contactStore, a3);
}

- (BOOL)queue_hasDiscoveredFirstPerson
{
  return self->_queue_hasDiscoveredFirstPerson;
}

- (void)setQueue_hasDiscoveredFirstPerson:(BOOL)a3
{
  self->_queue_hasDiscoveredFirstPerson = a3;
}

- (BOOL)queue_hasDiscoveredFirstPersonNearby
{
  return self->_queue_hasDiscoveredFirstPersonNearby;
}

- (void)setQueue_hasDiscoveredFirstPersonNearby:(BOOL)a3
{
  self->_queue_hasDiscoveredFirstPersonNearby = a3;
}

- (CAMPeopleProximityScanner)queue_proximityScanner
{
  return self->_queue_proximityScanner;
}

- (void)setQueue_proximityScanner:(id)a3
{
  objc_storeStrong((id *)&self->_queue_proximityScanner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_proximityScanner, 0);
  objc_storeStrong((id *)&self->_queue_contactStore, 0);
  objc_storeStrong((id *)&self->_queue_identities, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_proximityScannerClass, 0);
}

- (void)_queue_startDiscoveryForIdentities:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "[CAMPeopleProximityController] Not starting, device proximity not supported", v1, 2u);
}

- (void)peopleProximityScanner:(uint64_t)a1 shouldDiscoverIdentity:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_1DB760000, a2, OS_LOG_TYPE_DEBUG, "[CAMPeopleProximityController] Ignoring identity %{private}@, not part of allow-list.", (uint8_t *)&v2, 0xCu);
}

@end
