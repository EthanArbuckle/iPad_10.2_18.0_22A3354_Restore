@implementation CAMLibrarySelectionController

- (CAMLibrarySelectionController)initWithLocationProvider:(id)a3
{
  id v5;
  CAMLibrarySelectionController *v6;
  void *v7;
  uint64_t v8;
  Class smartSharingMetadataProvider;
  NSMutableSet *v10;
  NSMutableSet *resultQueue_identitiesInProximity;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *resultQueue;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CAMLibrarySelectionController;
  v6 = -[CAMLibrarySelectionController init](&v16, sel_init);
  if (v6)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_locationProvider, a3);
    objc_opt_class();
    v8 = objc_claimAutoreleasedReturnValue();
    smartSharingMetadataProvider = v6->_smartSharingMetadataProvider;
    v6->_smartSharingMetadataProvider = (Class)v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    resultQueue_identitiesInProximity = v6->__resultQueue_identitiesInProximity;
    v6->__resultQueue_identitiesInProximity = v10;

    v6->__resultQueue_authorizationStatus = -1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.camera.library-selection.result-queue", v12);
    resultQueue = v6->_resultQueue;
    v6->_resultQueue = (OS_dispatch_queue *)v13;

    v6->_peopleProximityDetectionSupported = objc_msgSend(v7, "peopleProximityDetectionSupported");
    -[CAMLibrarySelectionController _newSessionWithDelegate:](v6, "_newSessionWithDelegate:", 0);

  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  -[CAMLibrarySelectionSession setDelegate:](self->_session, "setDelegate:", a3);
}

- (int64_t)sharedLibraryMode
{
  return -[CAMLibrarySelectionSession currentMode](self->_session, "currentMode");
}

- (int64_t)sharedLibraryInitialMode
{
  return -[CAMLibrarySelectionSession initialMode](self->_session, "initialMode");
}

- (int64_t)userInteractionsCount
{
  return -[CAMLibrarySelectionSession userInteractionsCount](self->_session, "userInteractionsCount");
}

- (CAMPeopleProximityControllerProtocol)proximityController
{
  -[CAMLibrarySelectionController _ensureProximityController](self, "_ensureProximityController");
  return self->_proximityController;
}

- (void)userDidPickSharedLibraryMode:(int64_t)a3
{
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3 & 0xFFFFFFFFFFFFFFFELL;
  v6 = os_log_create("com.apple.camera", "SharedLibrary");
  v7 = v6;
  if (v5 == 2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("unknown");
      if (a3 == 3)
        v8 = CFSTR("UserOff");
      if (a3 == 2)
        v8 = CFSTR("UserOn");
      v9 = v8;
      v24 = 138543362;
      v25 = v9;
      _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] userDidPickSharedLibraryMode: %{public}@", (uint8_t *)&v24, 0xCu);

    }
    -[CAMLibrarySelectionController session](self, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithMode:", a3);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSharedLibraryLastUserActionDate:", v11);

    -[CAMLibrarySelectionController acquiredSignalResults](self, "acquiredSignalResults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSharedLibraryLastUserActionLocation:", v15);

    v17 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] User overriden state: stopping signal acquisition.", (uint8_t *)&v24, 2u);
    }

    -[CAMLibrarySelectionController stopAcquiringSignals](self, "stopAcquiringSignals");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMLibrarySelectionController userDidPickSharedLibraryMode:].cold.1(a3, v7, v18, v19, v20, v21, v22, v23);

  }
}

- (void)startNewSession
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] startNewSession", v5, 2u);
  }

  -[CAMLibrarySelectionSession delegate](self->_session, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionController _newSessionWithDelegate:](self, "_newSessionWithDelegate:", v4);

  -[CAMLibrarySelectionSession notifyResetIfNeeded](self->_session, "notifyResetIfNeeded");
}

- (void)startAcquiringSignals
{
  NSObject *v3;
  NSObject *resultQueue;
  _QWORD block[4];
  id v6;
  id buf[2];

  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] startAcquiringSignals", (uint8_t *)buf, 2u);
  }

  -[CAMLibrarySelectionLocationProvider addListenerForLocationUpdates:](self->_locationProvider, "addListenerForLocationUpdates:", self);
  -[CAMLibrarySelectionController _ensureProximityController](self, "_ensureProximityController");
  objc_initWeak(buf, self);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CAMLibrarySelectionController_startAcquiringSignals__block_invoke;
  block[3] = &unk_1EA329490;
  objc_copyWeak(&v6, buf);
  dispatch_async(resultQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __54__CAMLibrarySelectionController_startAcquiringSignals__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resultQueue_startDiscovery");

}

- (void)stopAcquiringSignals
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] stopAcquiringSignals", v4, 2u);
  }

  -[CAMLibrarySelectionController _stopAcquiringSignalsAndClear:](self, "_stopAcquiringSignalsAndClear:", 0);
}

- (void)stopAndClearAcquiredSignals
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] stopAndClearAcquiredSignals", v4, 2u);
  }

  -[CAMLibrarySelectionController _stopAcquiringSignalsAndClear:](self, "_stopAcquiringSignalsAndClear:", 1);
}

- (void)_stopAcquiringSignalsAndClear:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *resultQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  v3 = a3;
  -[CAMLibrarySelectionController _ensureProximityController](self, "_ensureProximityController");
  -[CAMLibrarySelectionLocationProvider removeListenerForLocationUpdates:](self->_locationProvider, "removeListenerForLocationUpdates:", self);
  objc_initWeak(&location, self);
  resultQueue = self->_resultQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CAMLibrarySelectionController__stopAcquiringSignalsAndClear___block_invoke;
  block[3] = &unk_1EA329808;
  objc_copyWeak(&v7, &location);
  v8 = v3;
  dispatch_async(resultQueue, block);
  if (v3)
    -[CAMLibrarySelectionController setAcquiredSignalResults:](self, "setAcquiredSignalResults:", 0);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __63__CAMLibrarySelectionController__stopAcquiringSignalsAndClear___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resultQueue_stopDiscovery");

  if (*(_BYTE *)(a1 + 40))
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_resultQueue_clearAcquiredSignals");

  }
}

- (CAMLibrarySelectionSignalResult)acquiredSignalResults
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_acquiredSignalResults;
}

- (void)didDiscoverIdentity:(id)a3
{
  NSObject *resultQueue;
  id v5;

  resultQueue = self->_resultQueue;
  v5 = a3;
  dispatch_assert_queue_V2(resultQueue);
  -[NSMutableSet addObject:](self->__resultQueue_identitiesInProximity, "addObject:", v5);

  -[CAMLibrarySelectionController _resultQueue_updateAcquiredSignalResults](self, "_resultQueue_updateAcquiredSignalResults");
  -[CAMLibrarySelectionController _ppt_callChangeHandler](self, "_ppt_callChangeHandler");
}

- (void)didLoseIdentity:(id)a3
{
  NSObject *resultQueue;
  id v5;

  resultQueue = self->_resultQueue;
  v5 = a3;
  dispatch_assert_queue_V2(resultQueue);
  -[NSMutableSet removeObject:](self->__resultQueue_identitiesInProximity, "removeObject:", v5);

  -[CAMLibrarySelectionController _resultQueue_updateAcquiredSignalResults](self, "_resultQueue_updateAcquiredSignalResults");
}

- (void)authorizationStatusUpdated:(int)a3
{
  NSObject *v5;
  CLLocation *resultQueue_currentLocation;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (self->__resultQueue_authorizationStatus != a3)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Retrieved authorization status update: %d", (uint8_t *)v7, 8u);
    }

    self->__resultQueue_authorizationStatus = a3;
    if (!CAMCanAccessLocationWithAuthorizationStatus(a3))
    {
      resultQueue_currentLocation = self->__resultQueue_currentLocation;
      self->__resultQueue_currentLocation = 0;

    }
    -[CAMLibrarySelectionController _resultQueue_updateAcquiredSignalResults](self, "_resultQueue_updateAcquiredSignalResults");
  }
}

- (void)currentLocationUpdated:(id)a3
{
  NSObject *resultQueue;
  id v5;

  resultQueue = self->_resultQueue;
  v5 = a3;
  dispatch_assert_queue_V2(resultQueue);
  if (-[CAMLibrarySelectionController _resultQueue_needsLocationShiftingForLocation:](self, "_resultQueue_needsLocationShiftingForLocation:", v5))
  {
    -[CAMLibrarySelectionController _resultQueue_shiftCoordinatesForLocation:](self, "_resultQueue_shiftCoordinatesForLocation:", v5);
  }
  else
  {
    -[CAMLibrarySelectionController _resultQueue_currentLocationUpdatedAndShiftedIfNeeded:](self, "_resultQueue_currentLocationUpdatedAndShiftedIfNeeded:", v5);
  }

}

- (void)_newSessionWithDelegate:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  CAMLibrarySelectionSession *v7;
  CAMLibrarySelectionSession *session;
  id v9;

  v9 = a3;
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sharedLibraryMode");

  v7 = -[CAMLibrarySelectionSession initWithMode:]([CAMLibrarySelectionSession alloc], "initWithMode:", v6);
  session = self->_session;
  self->_session = v7;

  if (v9)
    -[CAMLibrarySelectionSession setDelegate:](self->_session, "setDelegate:", v9);

}

- (void)_ensureProximityController
{
  CAMPeopleProximityController *v3;
  CAMPeopleProximityControllerProtocol *proximityController;

  if (self->_peopleProximityDetectionSupported && !self->_proximityController)
  {
    dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
    v3 = -[CAMPeopleProximityController initWithDelegate:delegateQueue:]([CAMPeopleProximityController alloc], "initWithDelegate:delegateQueue:", self, self->_resultQueue);
    proximityController = self->_proximityController;
    self->_proximityController = (CAMPeopleProximityControllerProtocol *)v3;

  }
}

- (void)_resultQueue_startDiscovery
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  CAMLibrarySelectionIdentity *v15;
  void *v16;
  CAMLibrarySelectionIdentity *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  -[CAMLibrarySelectionController _retrieveMetadata](self, "_retrieveMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.camera", "SharedLibrary");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138477827;
      v31 = v3;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Retrieved smart sharing metadata: %{private}@", buf, 0xCu);
    }

    -[CAMLibrarySelectionController set_resultQueue_smartSharingMetadata:](self, "set_resultQueue_smartSharingMetadata:", v3);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v3, "identities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v26;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v7);
          +[CAMLibrarySelectionIdentity identityWithPhotosIdentity:](CAMLibrarySelectionIdentity, "identityWithPhotosIdentity:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v8);
    }

    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "peopleProximityDetectAdditionalEmail");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length") == 0;

    if (!v14)
    {
      v15 = [CAMLibrarySelectionIdentity alloc];
      objc_msgSend(v12, "peopleProximityDetectAdditionalEmail");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CAMLibrarySelectionIdentity initWithPhoneNumber:emailAddress:contactIdentifiers:](v15, "initWithPhoneNumber:emailAddress:contactIdentifiers:", 0, v16, 0);

      objc_msgSend(v6, "addObject:", v17);
    }
    -[CAMLibrarySelectionController proximityController](self, "proximityController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDiscoveryForIdentities:", v6);

    objc_initWeak((id *)buf, self);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __60__CAMLibrarySelectionController__resultQueue_startDiscovery__block_invoke;
    v22 = &unk_1EA328F00;
    objc_copyWeak(&v24, (id *)buf);
    v4 = v6;
    v23 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], &v19);
    -[CAMLibrarySelectionController _resultQueue_updateAcquiredSignalResults](self, "_resultQueue_updateAcquiredSignalResults", v19, v20, v21, v22);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Unable to retrieve smart sharing metadata", buf, 2u);
  }

}

void __60__CAMLibrarySelectionController__resultQueue_startDiscovery__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIdentitiesToScan:", v3);

}

- (void)_resultQueue_stopDiscovery
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  -[CAMLibrarySelectionController proximityController](self, "proximityController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopDiscovery");

}

- (void)_resultQueue_clearAcquiredSignals
{
  CLLocation *resultQueue_currentLocation;
  NSNumber *resultQueue_needsLocationShifting;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  -[NSMutableSet removeAllObjects](self->__resultQueue_identitiesInProximity, "removeAllObjects");
  resultQueue_currentLocation = self->__resultQueue_currentLocation;
  self->__resultQueue_currentLocation = 0;

  resultQueue_needsLocationShifting = self->__resultQueue_needsLocationShifting;
  self->__resultQueue_needsLocationShifting = 0;

}

- (void)_resultQueue_updateAcquiredSignalResults
{
  void *v3;
  uint64_t resultQueue_authorizationStatus;
  CLLocation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  -[NSMutableSet allObjects](self->__resultQueue_identitiesInProximity, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  resultQueue_authorizationStatus = self->__resultQueue_authorizationStatus;
  v5 = self->__resultQueue_currentLocation;
  -[CAMLibrarySelectionController _resultQueue_smartSharingMetadata](self, "_resultQueue_smartSharingMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMLibrarySelectionController _resultQueue_smartSharingMetadata](self, "_resultQueue_smartSharingMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frequentLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CAMLibrarySelectionSignalResult librarySelectionSignalResultWithIdentitiesInProximity:currentLocation:locationAuthorizationStatus:homeLocations:frequentLocations:](CAMLibrarySelectionSignalResult, "librarySelectionSignalResultWithIdentitiesInProximity:currentLocation:locationAuthorizationStatus:homeLocations:frequentLocations:", v3, v5, resultQueue_authorizationStatus, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__CAMLibrarySelectionController__resultQueue_updateAcquiredSignalResults__block_invoke;
  block[3] = &unk_1EA328F00;
  objc_copyWeak(&v14, &location);
  v13 = v10;
  v11 = v10;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __73__CAMLibrarySelectionController__resultQueue_updateAcquiredSignalResults__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAcquiredSignalResults:", v1);

}

- (void)_resultQueue_currentLocationUpdatedAndShiftedIfNeeded:(id)a3
{
  id v5;
  CLLocation *resultQueue_currentLocation;
  CLLocation **p_resultQueue_currentLocation;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  p_resultQueue_currentLocation = &self->__resultQueue_currentLocation;
  resultQueue_currentLocation = self->__resultQueue_currentLocation;
  if (!resultQueue_currentLocation)
    goto LABEL_9;
  -[CLLocation coordinate](resultQueue_currentLocation, "coordinate");
  v9 = v8;
  objc_msgSend(v5, "coordinate");
  v11 = v9 - v10;
  if (v11 < 0.0)
    goto LABEL_9;
  if (v11 > 0.0)
    goto LABEL_9;
  -[CLLocation coordinate](*p_resultQueue_currentLocation, "coordinate");
  v13 = v12;
  objc_msgSend(v5, "coordinate");
  if (v13 - v14 < 0.0)
    goto LABEL_9;
  if (v13 - v14 > 0.0)
    goto LABEL_9;
  -[CLLocation horizontalAccuracy](*p_resultQueue_currentLocation, "horizontalAccuracy", v13 - v14);
  v16 = v15;
  objc_msgSend(v5, "horizontalAccuracy");
  v18 = v16 - v17;
  if (v18 < 0.0
    || v18 > 0.0
    || (-[CLLocation timestamp](*p_resultQueue_currentLocation, "timestamp"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v19, "timeIntervalSinceNow"),
        v21 = v20,
        v19,
        v21 >= 5.0))
  {
LABEL_9:
    v22 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138477827;
      v24 = v5;
      _os_log_impl(&dword_1DB760000, v22, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Retrieved current location update: %{private}@", (uint8_t *)&v23, 0xCu);
    }

    objc_storeStrong((id *)&self->__resultQueue_currentLocation, a3);
    -[CAMLibrarySelectionController _resultQueue_updateAcquiredSignalResults](self, "_resultQueue_updateAcquiredSignalResults");
  }

}

- (BOOL)_resultQueue_needsLocationShiftingForLocation:(id)a3
{
  id v4;
  NSNumber *resultQueue_needsLocationShifting;
  uint64_t (**v6)(void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSNumber *v13;
  NSNumber *v14;
  NSObject *v15;
  NSNumber *v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  CAMLibrarySelectionController *v23;
  id v24;
  uint8_t buf[4];
  NSNumber *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  resultQueue_needsLocationShifting = self->__resultQueue_needsLocationShifting;
  if (!resultQueue_needsLocationShifting)
  {
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __79__CAMLibrarySelectionController__resultQueue_needsLocationShiftingForLocation___block_invoke;
    v22 = &unk_1EA329830;
    v23 = self;
    v24 = v4;
    v6 = (uint64_t (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(&v19);
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v12 = v6[2](v6, v8, v9, v10, v11);
    objc_msgSend(v7, "numberWithBool:", v12, v19, v20, v21, v22, v23);
    v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = self->__resultQueue_needsLocationShifting;
    self->__resultQueue_needsLocationShifting = v13;

    v15 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->__resultQueue_needsLocationShifting;
      *(_DWORD *)buf = 138543362;
      v26 = v16;
      _os_log_impl(&dword_1DB760000, v15, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Needs location shifting resolved to: %{public}@", buf, 0xCu);
    }

    resultQueue_needsLocationShifting = self->__resultQueue_needsLocationShifting;
  }
  v17 = -[NSNumber BOOLValue](resultQueue_needsLocationShifting, "BOOLValue");

  return v17;
}

uint64_t __79__CAMLibrarySelectionController__resultQueue_needsLocationShiftingForLocation___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  double v6;
  double v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "librarySelectionMockLocationShiftingEnabled");

  if (v3)
  {
    v4 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] librarySelectionMockLocationShiftingEnabled: YES", buf, 2u);
    }

    return 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0
         && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "locationShiftingRequired") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    return objc_msgSend(MEMORY[0x1E0D27178], "isLocationShiftRequiredForCoordinate:", v7);
  }
  else
  {
    v8 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1DB760000, v8, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] locationShiftingRequiredFromCache: NO", v9, 2u);
    }

    return 0;
  }
}

- (void)_resultQueue_shiftCoordinatesForLocation:(id)a3
{
  id v4;
  GEOLocationShifter *v5;
  GEOLocationShifter *resultQueue_locationShifter;
  double v7;
  double v8;
  double v9;
  double v10;
  GEOLocationShifter *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_resultQueue);
  if (!self->__resultQueue_locationShifter)
  {
    v5 = (GEOLocationShifter *)objc_alloc_init(MEMORY[0x1E0D27178]);
    resultQueue_locationShifter = self->__resultQueue_locationShifter;
    self->__resultQueue_locationShifter = v5;

  }
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  objc_msgSend(v4, "coordinate");
  v10 = v9;
  objc_initWeak(&location, self);
  v11 = self->__resultQueue_locationShifter;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke;
  v13[3] = &unk_1EA329858;
  v12 = v4;
  v14 = v12;
  objc_copyWeak(&v15, &location);
  -[GEOLocationShifter shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v11, "shiftCoordinate:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v13, 0, &__block_literal_global_6, self->_resultQueue, v8, v10, 0.0);
  objc_destroyWeak(&v15);

  objc_destroyWeak(&location);
}

void __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke(uint64_t a1, CLLocationDegrees a2, CLLocationDegrees a3, double a4)
{
  CLLocationCoordinate2D v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = CLLocationCoordinate2DMake(a2, a3);
  v7 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "verticalAccuracy");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v7, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v12, v6.latitude, v6.longitude, v9, a4, v11);

  v14 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138477827;
    v17 = v13;
    _os_log_impl(&dword_1DB760000, v14, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Successfully shifted current location update: %{private}@", (uint8_t *)&v16, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_resultQueue_currentLocationUpdatedAndShiftedIfNeeded:", v13);

}

void __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke_163(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = os_log_create("com.apple.camera", "SharedLibrary");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke_163_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)setAcquiredSignalResults:(id)a3
{
  id v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_storeStrong((id *)&self->_acquiredSignalResults, a3);
  if (v5)
  {
    v6 = objc_msgSend(v5, "suggestsSharing");
    -[CAMLibrarySelectionSession updateWithResult:](self->_session, "updateWithResult:", v5);
    if (v6)
    {
      v7 = os_log_create("com.apple.camera", "SharedLibrary");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] Acquired signal results are inferring sharing: stopping signal acquisition.", v14, 2u);
      }

      -[CAMLibrarySelectionController stopAcquiringSignals](self, "stopAcquiringSignals");
    }
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSharedLibraryLastDiscoveryDate:", v9);

    }
    if (objc_msgSend(v5, "cameraHasAccessToLocation"))
    {
      objc_msgSend(v5, "currentLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(v8, "setSharedLibraryLastLocation:", v12);

        objc_msgSend(v8, "setSharedLibraryLastLocationAcquiredDuringTrip:", objc_msgSend(v5, "isOnTrip"));
        if (v6)
        {
          v13 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v8, "setSharedLibraryLastDiscoveryLocation:", v13);

        }
      }

    }
    else if (!CAMLocationAccessPendingOrNotDeterminedWithAuthorizationStatus(objc_msgSend(v5, "locationAuthorizationStatus")))
    {
      objc_msgSend(v8, "setSharedLibraryLastLocation:", 0);
      objc_msgSend(v8, "setSharedLibraryLastUserActionLocation:", 0);
      objc_msgSend(v8, "setSharedLibraryLastDiscoveryLocation:", 0);
      objc_msgSend(v8, "setSharedLibraryLastLocationAcquiredDuringTrip:", 0);
    }

  }
}

- (id)_retrieveMetadata
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  CLLocationCoordinate2D v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v17[8];
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "librarySelectionMockAutomationModeEnabled");

  if (v4)
  {
    v5 = os_log_create("com.apple.camera", "SharedLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "[CAMLibrarySelectionController] mockAutomationMode is enabled, providing mock PHCameraSmartSharingMetadata", v17, 2u);
    }

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1490]), "initWithPhoneNumber:emailAddress:contactIdentifiers:", 0, CFSTR("mockAutomationMode@example.com"), 0);
    v7 = objc_alloc(MEMORY[0x1E0C9E368]);
    v8 = CLLocationCoordinate2DMake(1.0, 2.0);
    v9 = (void *)objc_msgSend(v7, "initWithCenter:radius:identifier:", CFSTR("mockAutomationModeHome"), v8.latitude, v8.longitude, 3.0);
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "librarySelectionMockLocationShiftingEnabled");

    v12 = objc_alloc(MEMORY[0x1E0CD1498]);
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithLibraryScopeIdentifier:identities:homeLocations:frequentLocations:locationShiftingRequired:", CFSTR("mockAutomationModeLibraryScopeIdentifier"), v13, v14, 0, v11);

  }
  else
  {
    -[CAMLibrarySelectionController smartSharingMetadataProvider](self, "smartSharingMetadataProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retrieveMetadataForPhotoLibrary:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)ppt_installChangeHandler:(id)a3
{
  -[CAMLibrarySelectionController setPpt_changeHandler:](self, "setPpt_changeHandler:", a3);
  -[CAMLibrarySelectionController _ppt_callChangeHandler](self, "_ppt_callChangeHandler");
}

- (void)_ppt_callChangeHandler
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[CAMLibrarySelectionController ppt_changeHandler](self, "ppt_changeHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__CAMLibrarySelectionController__ppt_callChangeHandler__block_invoke;
    v5[3] = &unk_1EA329298;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __55__CAMLibrarySelectionController__ppt_callChangeHandler__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)resultQueue
{
  return self->_resultQueue;
}

- (void)setResultQueue:(id)a3
{
  objc_storeStrong((id *)&self->_resultQueue, a3);
}

- (NSMutableSet)_resultQueue_identitiesInProximity
{
  return self->__resultQueue_identitiesInProximity;
}

- (void)set_resultQueue_identitiesInProximity:(id)a3
{
  objc_storeStrong((id *)&self->__resultQueue_identitiesInProximity, a3);
}

- (CLLocation)_resultQueue_currentLocation
{
  return self->__resultQueue_currentLocation;
}

- (void)set_resultQueue_currentLocation:(id)a3
{
  objc_storeStrong((id *)&self->__resultQueue_currentLocation, a3);
}

- (int)_resultQueue_authorizationStatus
{
  return self->__resultQueue_authorizationStatus;
}

- (void)set_resultQueue_authorizationStatus:(int)a3
{
  self->__resultQueue_authorizationStatus = a3;
}

- (PHCameraSmartSharingMetadata)_resultQueue_smartSharingMetadata
{
  return self->__resultQueue_smartSharingMetadata;
}

- (void)set_resultQueue_smartSharingMetadata:(id)a3
{
  objc_storeStrong((id *)&self->__resultQueue_smartSharingMetadata, a3);
}

- (NSNumber)_resultQueue_needsLocationShifting
{
  return self->__resultQueue_needsLocationShifting;
}

- (void)set_resultQueue_needsLocationShifting:(id)a3
{
  objc_storeStrong((id *)&self->__resultQueue_needsLocationShifting, a3);
}

- (GEOLocationShifter)_resultQueue_locationShifter
{
  return self->__resultQueue_locationShifter;
}

- (void)set_resultQueue_locationShifter:(id)a3
{
  objc_storeStrong((id *)&self->__resultQueue_locationShifter, a3);
}

- (CAMLibrarySelectionLocationProvider)locationProvider
{
  return self->_locationProvider;
}

- (void)setLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_locationProvider, a3);
}

- (BOOL)peopleProximityDetectionSupported
{
  return self->_peopleProximityDetectionSupported;
}

- (void)setPeopleProximityDetectionSupported:(BOOL)a3
{
  self->_peopleProximityDetectionSupported = a3;
}

- (id)ppt_changeHandler
{
  return self->_ppt_changeHandler;
}

- (void)setPpt_changeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setProximityController:(id)a3
{
  objc_storeStrong((id *)&self->_proximityController, a3);
}

- (Class)smartSharingMetadataProvider
{
  return self->_smartSharingMetadataProvider;
}

- (void)setSmartSharingMetadataProvider:(Class)a3
{
  objc_storeStrong((id *)&self->_smartSharingMetadataProvider, a3);
}

- (CAMLibrarySelectionSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSArray)identitiesToScan
{
  return self->_identitiesToScan;
}

- (void)setIdentitiesToScan:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identitiesToScan, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_smartSharingMetadataProvider, 0);
  objc_storeStrong((id *)&self->_proximityController, 0);
  objc_storeStrong(&self->_ppt_changeHandler, 0);
  objc_storeStrong((id *)&self->_locationProvider, 0);
  objc_storeStrong((id *)&self->__resultQueue_locationShifter, 0);
  objc_storeStrong((id *)&self->__resultQueue_needsLocationShifting, 0);
  objc_storeStrong((id *)&self->__resultQueue_smartSharingMetadata, 0);
  objc_storeStrong((id *)&self->__resultQueue_currentLocation, 0);
  objc_storeStrong((id *)&self->__resultQueue_identitiesInProximity, 0);
  objc_storeStrong((id *)&self->_resultQueue, 0);
  objc_storeStrong((id *)&self->_acquiredSignalResults, 0);
}

- (id)librarySelectionDiagnostics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v83;
  const __CFString *v84;
  void *v85;
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[6];
  _QWORD v89[6];
  _QWORD v90[8];
  _QWORD v91[8];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[9];
  _QWORD v95[11];

  v95[9] = *MEMORY[0x1E0C80C00];
  v83 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[CAMLibrarySelectionController acquiredSignalResults](self, "acquiredSignalResults");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "resultDiagnostics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v3, CFSTR("acquiredSignalResults"));

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v94[0] = CFSTR("librarySelectionSupported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "librarySelectionSupported"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v95[0] = v78;
  v94[1] = CFSTR("librarySelectionAutoOnResetTimeout");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "librarySelectionAutoOnResetTimeout");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v95[1] = v6;
  v94[2] = CFSTR("librarySelectionUserChoiceResetTimeout");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "librarySelectionUserChoiceResetTimeout");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v95[2] = v8;
  v94[3] = CFSTR("librarySelectionTripResetTimeout");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "librarySelectionTripResetTimeout");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v95[3] = v10;
  v94[4] = CFSTR("librarySelectionSameLocationResetTimeout");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "librarySelectionSameLocationResetTimeout");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v95[4] = v12;
  v94[5] = CFSTR("deviceProximityDetectionSupported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "peopleProximityDetectionSupported"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v95[5] = v13;
  v94[6] = CFSTR("deviceProximityPersistenceSupported");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "peopleProximityPersistenceSupported"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v95[6] = v14;
  v94[7] = CFSTR("deviceProximityUsesDeviceDiscovery");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "peopleProximityUsesDeviceDiscovery"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v95[7] = v15;
  v94[8] = CFSTR("deviceProximityDetectAdditionalEmail");
  v80 = v4;
  objc_msgSend(v4, "peopleProximityDetectAdditionalEmail");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");
  v18 = CFSTR("yes");
  if (!v17)
    v18 = CFSTR("no");
  v95[8] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v19, CFSTR("capabilitiesDiagnostics"));

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = CFSTR("sharedLibraryEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "sharedLibraryEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v21;
  v92[1] = CFSTR("sharedLibrarySwitchEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "sharedLibrarySwitchEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v22;
  v92[2] = CFSTR("sharedLibraryAutoBehaviorEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "sharedLibraryAutoBehaviorEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v23;
  v92[3] = CFSTR("defaultToSharedLibraryEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "defaultToSharedLibraryEnabled"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v24;
  v92[4] = CFSTR("shareWhenAtHomeEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "shareWhenAtHomeEnabled"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v93[4] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v26, CFSTR("preferencesDiagnostics"));

  -[CAMLibrarySelectionController acquiredSignalResults](self, "acquiredSignalResults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentLocation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    v30 = v28;
  }
  else
  {
    objc_msgSend(v20, "sharedLibraryLastLocation");
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v30;

  v90[0] = CFSTR("sharedLibraryLastLocation");
  objc_msgSend(v20, "sharedLibraryLastLocation");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionController _diagnosticsForLocation:currentLocation:](self, "_diagnosticsForLocation:currentLocation:", v77, v31);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v76;
  v90[1] = CFSTR("sharedLibraryLastLocationAcquiredDuringTrip");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "sharedLibraryLastLocationAcquiredDuringTrip"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v75;
  v90[2] = CFSTR("sharedLibraryLastDiscoveryDate");
  objc_msgSend(v20, "sharedLibraryLastDiscoveryDate");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "description");
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v32;
  if (v32)
    v34 = (const __CFString *)v32;
  else
    v34 = CFSTR("none");
  v91[2] = v34;
  v90[3] = CFSTR("sharedLibraryLastDiscoveryTimeInterval");
  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v20, "sharedLibraryLastDiscoveryDate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "timeIntervalSinceNow");
  objc_msgSend(v35, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v72;
  v90[4] = CFSTR("sharedLibraryLastDiscoveryLocation");
  objc_msgSend(v20, "sharedLibraryLastDiscoveryLocation");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v31;
  v79 = v31;
  -[CAMLibrarySelectionController _diagnosticsForLocation:currentLocation:](self, "_diagnosticsForLocation:currentLocation:", v71, v31);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v91[4] = v37;
  v90[5] = CFSTR("sharedLibraryLastUserActionDate");
  objc_msgSend(v20, "sharedLibraryLastUserActionDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "description");
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (v39)
    v41 = (const __CFString *)v39;
  else
    v41 = CFSTR("none");
  v91[5] = v41;
  v90[6] = CFSTR("sharedLibraryLastUserActionTimeInterval");
  v42 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v20, "sharedLibraryLastUserActionDate");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "timeIntervalSinceNow");
  objc_msgSend(v42, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v91[6] = v44;
  v90[7] = CFSTR("sharedLibraryLastUserActionLocation");
  objc_msgSend(v20, "sharedLibraryLastUserActionLocation");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionController _diagnosticsForLocation:currentLocation:](self, "_diagnosticsForLocation:currentLocation:", v45, v36);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[7] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 8);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v47, CFSTR("preferencesAlgorithmsDiagnostics"));

  -[CAMLibrarySelectionController session](self, "session");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = &unk_1EA3B0A90;
  v88[0] = CFSTR("algorithmVersion");
  v88[1] = CFSTR("initialMode");
  CAMSharedLibraryModeDescription(objc_msgSend(v48, "initialMode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v49;
  v88[2] = CFSTR("currentMode");
  CAMSharedLibraryModeDescription(objc_msgSend(v48, "currentMode"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v50;
  v88[3] = CFSTR("overriddenByUser");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v48, "overriddenByUser"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v89[3] = v51;
  v88[4] = CFSTR("userWasPreviouslyOnTrip");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v48, "userWasPreviouslyOnTrip"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v89[4] = v52;
  v88[5] = CFSTR("canResetToDefaultMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v48, "canResetToDefaultMode"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v89[5] = v53;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 6);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v54, CFSTR("sessionDiagnostics"));

  v86[0] = CFSTR("timeToDetectDevicesInProximity");
  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v48, "timeToDetectDevicesInProximity");
  objc_msgSend(v55, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v56;
  v86[1] = CFSTR("timeToAcquireFirstLocation");
  v57 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v48, "timeToAcquireFirstLocation");
  objc_msgSend(v57, "numberWithDouble:");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v58;
  v86[2] = CFSTR("timeToAcquireFirstPreciseLocation");
  v59 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v48, "timeToAcquireFirstPreciseLocation");
  objc_msgSend(v59, "numberWithDouble:");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v60;
  v86[3] = CFSTR("timeForSmartSharingAutoDecision");
  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v48, "timeForSmartSharingAutoDecision");
  objc_msgSend(v61, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v62;
  v86[4] = CFSTR("timeForUserManualOverride");
  v63 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v48, "timeForUserManualOverride");
  objc_msgSend(v63, "numberWithDouble:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v64;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v65, CFSTR("sessionPerformance"));

  v84 = CFSTR("countOfIdentities");
  v66 = (void *)MEMORY[0x1E0CB37E8];
  -[CAMLibrarySelectionController identitiesToScan](self, "identitiesToScan");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "numberWithUnsignedInteger:", objc_msgSend(v67, "count"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setObject:forKeyedSubscript:", v69, CFSTR("scannerDiagnostics"));

  return v83;
}

- (id)_diagnosticsForLocation:(id)a3 currentLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];
  CLLocationCoordinate2D v19;

  v18[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      objc_msgSend(v6, "distanceFromLocation:", v5);
      v9 = v8;
    }
    else
    {
      v9 = *MEMORY[0x1E0C9E318];
    }
    v17[0] = CFSTR("coordinateIsValid");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "coordinate");
    objc_msgSend(v11, "numberWithBool:", CLLocationCoordinate2DIsValid(v19));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v17[1] = CFSTR("distanceFromCurrentLocation");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    v17[2] = CFSTR("horizontalAccuracy");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "horizontalAccuracy");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &unk_1EA3B2E08;
  }

  return v10;
}

- (id)tapToRadarAlertController
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  CAMLibrarySelectionController *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = -[CAMLibrarySelectionController sharedLibraryMode](self, "sharedLibraryMode");
  v5 = v4;
  if (v4 > 5)
    v6 = 0;
  else
    v6 = off_1EA32C568[v4];
  if (CAMSharedLibraryModeIsOn(v4))
  {
    objc_msgSend(v3, "addObject:", CFSTR("I am not near a participant"));
    v7 = CFSTR("I am not interested to share in this context");
    v8 = CFSTR("I am at home and do not want to share");
  }
  else
  {
    v7 = CFSTR("I am at home and would like to share");
    v8 = CFSTR("I am near a participant");
  }
  objc_msgSend(v3, "addObject:", v8);
  objc_msgSend(v3, "addObject:", v7);
  v9 = CFSTR("I am in a context interesting to share");
  if (v5 && v5 != 3)
  {
    if (v5 != 5)
      goto LABEL_12;
    v9 = CFSTR("I am in a context still interesting to share");
  }
  objc_msgSend(v3, "addObject:", v9);
LABEL_12:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[Goldilocks] [Live-on Feedback] Unexpected state while '%@'"), v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMLibrarySelectionController librarySelectionDiagnostics](self, "librarySelectionDiagnostics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAMTapToRadarUtilities writeDictionary:toPlistFileWithName:](CAMTapToRadarUtilities, "writeDictionary:toPlistFileWithName:");
  v10 = objc_claimAutoreleasedReturnValue();
  v28 = self;
  v26 = (void *)v10;
  if (v10)
  {
    v41[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v6, CFSTR("If you expect to be in another mode, please select an option below to file a radar:"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v37 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        v19 = (void *)MEMORY[0x1E0DC3448];
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke;
        v32[3] = &unk_1EA32C548;
        v33 = v29;
        v34 = v18;
        v35 = v11;
        objc_msgSend(v19, "actionWithTitle:style:handler:", v18, 0, v32);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAction:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v15);
  }

  v21 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_2;
  v31[3] = &unk_1EA3299C8;
  v31[4] = v28;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Reset to default (personal)"), 2, v31);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v22);

  v30[0] = v21;
  v30[1] = 3221225472;
  v30[2] = __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_3;
  v30[3] = &unk_1EA3299C8;
  v30[4] = v28;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Reset and rescan"), 2, v30);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v23);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v24);

  return v12;
}

void __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\nReason:\n%@\n\nDetails:\n..."), a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v2) = 0;
  LOWORD(v2) = 257;
  +[CAMTapToRadarUtilities fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:](CAMTapToRadarUtilities, "fileRadarWithTitle:description:classification:reproducibility:componentID:componentName:componentVersion:keywordIdsString:attachmentURLs:includeSysDiagnose:includePhotosDiagnose:includeHIDContinuousRecordings:", a1[4], v3, CFSTR("Other Bug"), CFSTR("Not Applicable"), CFSTR("1393606"), CFSTR("Photos Shared Library Algorithms"), CFSTR("all"), CFSTR("1510028"), a1[6], v2);

}

uint64_t __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_2(uint64_t a1)
{
  void *v2;

  +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences](CAMUserPreferences, "removeSharedLibraryAlgorithmsPreferences");
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetSharedLibraryAlgorithmsPreferences");

  return objc_msgSend(*(id *)(a1 + 32), "startNewSession");
}

uint64_t __70__CAMLibrarySelectionController_TapToRadar__tapToRadarAlertController__block_invoke_3(uint64_t a1)
{
  void *v2;

  +[CAMUserPreferences removeSharedLibraryAlgorithmsPreferences](CAMUserPreferences, "removeSharedLibraryAlgorithmsPreferences");
  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetSharedLibraryAlgorithmsPreferences");

  objc_msgSend(*(id *)(a1 + 32), "stopAndClearAcquiredSignals");
  objc_msgSend(*(id *)(a1 + 32), "startNewSession");
  return objc_msgSend(*(id *)(a1 + 32), "startAcquiringSignals");
}

- (void)userDidPickSharedLibraryMode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "[CAMLibrarySelectionController] userDidPickSharedLibraryMode invalid mode: %{public}@", a5, a6, a7, a8, 2u);
}

void __74__CAMLibrarySelectionController__resultQueue_shiftCoordinatesForLocation___block_invoke_163_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "[CAMLibrarySelectionController] Failed to shift coordinate with error: %{public}@. Ignoring location update.", a5, a6, a7, a8, 2u);
}

@end
