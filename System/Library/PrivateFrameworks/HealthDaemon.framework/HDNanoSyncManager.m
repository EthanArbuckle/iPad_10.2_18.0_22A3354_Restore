@implementation HDNanoSyncManager

void __61__HDNanoSyncManager__queue_startPeriodicSyncTimerIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_queue_t v2;
  dispatch_queue_t *WeakRetained;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[7]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = WeakRetained[18];
    WeakRetained[18] = (dispatch_queue_t)v1;

    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:]((uint64_t)WeakRetained, CFSTR("periodic sync timer fired"), 0, 0, 0);
  }

}

- (uint64_t)_queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:(uint64_t)a1
{
  unsigned __int8 v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (!a1)
    return 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (!*(_BYTE *)(a1 + 24))
    return 1;
  v4 = atomic_load((unsigned __int8 *)(a1 + 9));
  if ((v4 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 100, CFSTR("%@ invalidated"), objc_opt_class());
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "contentProtectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceUnlockedSinceBoot");

  if ((v8 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 8))
    {
      v9 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v9, "database");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addProtectedDataObserver:queue:", a1, *(_QWORD *)(a1 + 56));

    }
    *(_BYTE *)(a1 + 24) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v12, "daemon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nanoPairedDeviceRegistry");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObserver:selector:name:object:", a1, sel__deviceDidPair_, *MEMORY[0x1E0D517E0], v14);
    objc_msgSend(v11, "addObserver:selector:name:object:", a1, sel__deviceDidUnpair_, *MEMORY[0x1E0D517D0], v14);
    objc_msgSend(v11, "addObserver:selector:name:object:", a1, sel__deviceDidBecomeActive_, *MEMORY[0x1E0D517A8], v14);
    v15 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v15, "daemon");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "processStateManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "registerForegroundClientProcessObserver:", a1);

    -[HDNanoSyncManager _queue_setUpMessageCentersIfNecessary](a1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", a1, sel__userCharacteristicsDidChange_, CFSTR("HDUserCharacteristicsShouldSyncNotification"), 0);
    objc_msgSend(v18, "addObserver:selector:name:object:", a1, sel__userPreferencesDidChange_, CFSTR("HDHealthStoreServerUserPreferencesDidChangeNotification"), 0);

    v19 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    -[HDNanoSyncManager _queue_updateSyncStores](a1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_databaseInaccessibleBeforeFirstUnlockError");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v20;
    if (v20)
    {
      if (a2)
      {
        v14 = objc_retainAutorelease(v20);
        *a2 = v14;
      }
      else
      {
        _HKLogDroppedError();
      }
      v11 = v14;
    }
    else
    {
      v11 = 0;
    }
  }

  return v8;
}

- (void)_queue_updateSyncStores
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id WeakRetained;
  uint64_t v22;
  BOOL v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  SEL v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  dispatch_source_t v34;
  void *v35;
  NSObject *v36;
  dispatch_time_t v37;
  NSObject *v38;
  NSObject *v39;
  const void *v40;
  const __CFString *v41;
  const __CFString *v42;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  void *v49;
  uint64_t v50;
  id v51;
  _QWORD v52[5];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id location;
  _BYTE v62[128];
  uint8_t v63[128];
  __int128 buf;
  void (*v65)(uint64_t);
  void *v66;
  id v67[4];

  v67[1] = *(id *)MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (*(_BYTE *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_updateSyncStores, a1, CFSTR("HDNanoSyncManager.m"), 1498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_waitingForFirstUnlock == NO"));

  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  v2 = *(id *)(a1 + 120);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 120);
  *(_QWORD *)(a1 + 120) = v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v50 = a1;
  objc_msgSend(*(id *)(a1 + 72), "nanoSyncDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v58 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
        if (objc_msgSend(v11, "isLocallyPaired"))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
    }
    while (v8);
  }

  v12 = v50;
  v47 = v5;
  objc_storeStrong((id *)(v50 + 128), v5);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = *(id *)(v50 + 128);
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  if (!v13)
  {
    v51 = 0;
    goto LABEL_40;
  }
  v14 = v13;
  v51 = 0;
  v15 = *(_QWORD *)v54;
  do
  {
    for (j = 0; j != v14; ++j)
    {
      if (*(_QWORD *)v54 != v15)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
      objc_msgSend(v17, "hd_deviceIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isActive");
      if (v20 != objc_msgSend(v17, "isActive"))
        objc_msgSend(v19, "invalidate");
      if (v19 && !objc_msgSend(v19, "isInvalidated"))
      {
        v12 = v50;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(v50 + 48));
        v12 = v50;
        +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v17, v50, 0);
        v22 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v22;
        if (!v22)
          goto LABEL_36;
      }
      if (objc_msgSend(v19, "isActive"))
        v23 = v51 == 0;
      else
        v23 = 1;
      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_updateSyncStores, v12, CFSTR("HDNanoSyncManager.m"), 1536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![syncStore isActive] || (activeSyncStore == nil)"));

      }
      if (objc_msgSend(v19, "isActive"))
      {
        if (v51)
        {
          _HKInitializeLogging();
          v24 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v25 = *(_QWORD *)(v50 + 128);
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v25;
            _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "multiple active sync stores for IDS devices: %@", (uint8_t *)&buf, 0xCu);
          }
        }
        else
        {
          v51 = v19;
        }
      }
      objc_msgSend(*(id *)(v12 + 120), "setObject:forKeyedSubscript:", v19, v18);
      objc_msgSend(v19, "deviceInfo");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "addObject:", v26);

LABEL_36:
    }
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v62, 16);
  }
  while (v14);
LABEL_40:

  v28 = *(id *)(v12 + 40);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6918]), "initWithPairedDeviceInfos:", v49);
  objc_setProperty_atomic((id)v12, v30, v29, 40);
  v31 = MEMORY[0x1E0C809B0];
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __44__HDNanoSyncManager__queue_updateSyncStores__block_invoke;
  v52[3] = &unk_1E6CED538;
  v52[4] = v12;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v52);

  v32 = v47;
  if (*(id *)(v12 + 96) != v51)
  {
    _HKInitializeLogging();
    v33 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "got new active paired device %{public}@", (uint8_t *)&buf, 0xCu);
    }
    objc_storeStrong((id *)(v12 + 96), v51);
    if (v51)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
      if (!*(_QWORD *)(v12 + 136) && objc_msgSend((id)v12, "enablePeriodicSyncTimer"))
      {
        v34 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v12 + 56));
        v35 = *(void **)(v12 + 136);
        *(_QWORD *)(v12 + 136) = v34;

        v36 = *(NSObject **)(v12 + 136);
        v37 = dispatch_walltime(0, 0);
        dispatch_source_set_timer(v36, v37, 0x1A3185C5000uLL, 0x45D964B800uLL);
        objc_initWeak(&location, (id)v12);
        v38 = *(NSObject **)(v12 + 136);
        *(_QWORD *)&buf = v31;
        *((_QWORD *)&buf + 1) = 3221225472;
        v65 = __61__HDNanoSyncManager__queue_startPeriodicSyncTimerIfNecessary__block_invoke;
        v66 = &unk_1E6CECE78;
        objc_copyWeak(v67, &location);
        dispatch_source_set_event_handler(v38, &buf);
        dispatch_resume(*(dispatch_object_t *)(v50 + 136));
        v12 = v50;
        objc_destroyWeak(v67);
        objc_destroyWeak(&location);
      }
      if (!CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), CFSTR("com.apple.Fitness"), 0)
        || !CFPreferencesGetAppBooleanValue(CFSTR("SBIconVisibility"), CFSTR("com.apple.Fitness.activity-widget"), 0))
      {
        _HKInitializeLogging();
        v39 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_DEFAULT, "Showing fitness app. Setting defaults and notifying Springboard.", (uint8_t *)&buf, 2u);
        }
        v40 = (const void *)*MEMORY[0x1E0C9AE50];
        v41 = (const __CFString *)*MEMORY[0x1E0C9B260];
        v42 = (const __CFString *)*MEMORY[0x1E0C9B230];
        CFPreferencesSetValue(CFSTR("SBIconVisibility"), (CFPropertyListRef)*MEMORY[0x1E0C9AE50], CFSTR("com.apple.Fitness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
        CFPreferencesSetValue(CFSTR("SBIconVisibility"), v40, CFSTR("com.apple.Fitness.activity-widget"), v41, v42);
        CFPreferencesSynchronize(CFSTR("com.apple.Fitness"), v41, v42);
        CFPreferencesSynchronize(CFSTR("com.apple.Fitness.activity-widget"), v41, v42);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, 0, 1u);
        v12 = v50;
        v32 = v47;
      }
      -[HDNanoSyncManager _queue_updateDeviceNameIfNecessaryWithSyncStore:](v12, v51);
    }
    else
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
      v44 = *(NSObject **)(v12 + 136);
      if (v44)
      {
        dispatch_source_cancel(v44);
        v45 = *(void **)(v12 + 136);
        *(_QWORD *)(v12 + 136) = 0;

      }
    }
    -[HDNanoSyncManager _queue_generateWatchActivationSamples](v12);
  }
  if (!v28 || (objc_msgSend(v29, "isEqual:", v28) & 1) == 0)
    -[HDNanoSyncManager _notifyObserversPairedDevicesChanged:](v12, v29);

}

void __44__HDNanoSyncManager__queue_updateSyncStores__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 != v7)
  {
    objc_msgSend(v7, "invalidate");
    v6 = v7;
  }

}

- (void)syncSession:(id)a3 didFinishSuccessfully:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HDIDSMessageCenter *messageCenter;
  void *v15;
  id v16;

  v6 = a4;
  v16 = a3;
  v8 = a5;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "behavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAppleWatch");

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v16, "syncStore");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      messageCenter = self->_messageCenter;
      objc_msgSend(v13, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDIDSMessageCenter cancelPendingRequestsWithMessageID:device:](messageCenter, "cancelPendingRequestsWithMessageID:device:", 7, v15);

    }
  }
  if (objc_msgSend(v16, "isPullRequest"))
    -[HDNanoSyncManager _sendFinalStatusMessageForSyncSession:didFinishSuccessfully:error:]((uint64_t)self, v16, v6, v8);
  else
    -[HDNanoSyncManager _sendFinalMessageForSyncSession:status:success:error:]((uint64_t)self, v16, 0, v6, v8);

}

- (void)_sendFinalMessageForSyncSession:(void *)a3 status:(uint64_t)a4 success:(void *)a5 error:
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    if (objc_msgSend(v9, "messageCount")
      || (objc_msgSend(v9, "isPullRequest") & 1) != 0
      || (objc_msgSend(v9, "isRequestedByRemote") & 1) != 0)
    {
      v12 = *(NSObject **)(a1 + 56);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke;
      block[3] = &unk_1E6CEDBD8;
      v18 = a4;
      v14 = v9;
      v15 = v11;
      v16 = a1;
      v17 = v10;
      dispatch_async(v12, block);

    }
    else
    {
      objc_msgSend(v9, "invokeCompletionWithSuccess:error:", a4, v11);
    }
  }

}

- (HKNanoSyncPairedDevicesSnapshot)pairedDevicesSnapshot
{
  return (HKNanoSyncPairedDevicesSnapshot *)objc_getProperty(self, a2, 40, 1);
}

- (void)syncSession:(id)a3 sendChanges:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "changeSetWithChanges:statusCode:error:", a4, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HDNanoSyncManager_syncSession_sendChanges_completion___block_invoke;
  v15[3] = &unk_1E6CE7E08;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __56__HDNanoSyncManager_syncSession_sendChanges_completion___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_sendChangeSet:status:session:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0, *(void **)(a1 + 48), *(void **)(a1 + 56));
}

- (void)_queue_sendChangeSet:(void *)a3 status:(void *)a4 session:(void *)a5 completion:
{
  unint64_t v9;
  unint64_t v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  int v14;
  id v15;
  unsigned int v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  id v20;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    objc_msgSend(v11, "syncStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v14 = -[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](a1, v13, (uint64_t)&v20);
    v15 = v20;
    if (v14)
    {
      v16 = v9 | v10;
      if (v9 | v10)
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        +[HDIDSOutgoingRequest changeRequestWithChangeSet:status:syncStore:profile:](HDIDSOutgoingRequest, "changeRequestWithChangeSet:status:syncStore:profile:", v9, v10, v13, WeakRetained);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isLastChance"))
          objc_msgSend(v18, "setPriority:", 1);
        if (objc_msgSend((id)v10, "statusCode") == 1)
          objc_msgSend(v18, "setNonWaking:", 1);
        -[HDNanoSyncManager _queue_sendRequest:syncStore:](a1, v18, (uint64_t)v13);
        objc_msgSend(v11, "incrementMessageCount");

        v16 = 1;
      }
    }
    else
    {
      v16 = 0;
    }
    if (v12)
    {
      v19 = v16;
      if ((v16 & 1) == 0 && !v15)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Failed to send change set without reporting an error."));
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12[2](v12, v19, v15);
    }

  }
}

- (uint64_t)_queue_isRestoreCompleteForSyncStore:(uint64_t)a3 error:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (!*(_BYTE *)(a1 + 24))
  {
    if (v5)
      goto LABEL_3;
LABEL_9:
    v7 = CFSTR("missing sync store");
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_isRestoreCompleteForSyncStore_error_, a1, CFSTR("HDNanoSyncManager.m"), 2801, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_waitingForFirstUnlock == NO"));

  if (!v5)
    goto LABEL_9;
LABEL_3:
  v6 = objc_msgSend(v5, "restoreState");
  if ((unint64_t)(v6 - 1) < 2)
  {
    v7 = CFSTR("restore is incomplete");
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 100, v7);
    v8 = 0;
    goto LABEL_11;
  }
  if (v6 != 3)
  {
    v7 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void)_queue_sendRequest:(uint64_t)a3 syncStore:
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    v5 = v8;
    if (v8)
    {
      if (a3)
      {
LABEL_4:
        objc_msgSend(*(id *)(a1 + 72), "sendRequest:", v5);
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_sendRequest_syncStore_, a1, CFSTR("HDNanoSyncManager.m"), 989, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

      v5 = 0;
      if (a3)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_sendRequest_syncStore_, a1, CFSTR("HDNanoSyncManager.m"), 990, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    v5 = v8;
    goto LABEL_4;
  }
LABEL_5:

}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForRequest:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "toParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "nanoSyncDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "resolved %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

void __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  if (*(_BYTE *)(a1 + 64))
    v2 = 2;
  else
    v2 = 3;
  objc_msgSend(*(id *)(a1 + 32), "changeSetWithChanges:statusCode:error:", 0, v2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke_2;
  v7[3] = &unk_1E6CEDBB0;
  v8 = v6;
  v10 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 40);
  -[HDNanoSyncManager _queue_sendChangeSet:status:session:completion:](v4, v3, v5, v8, v7);

}

- (void)messageCenterDidReceiveChangesResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HDNanoSyncManager_messageCenterDidReceiveChangesResponse___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);

}

- (void)_handleIncomingResponse:(void *)a3 usingBlock:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
LABEL_4:
        -[HDNanoSyncManager _logIncomingRequest:](a1, v5);
        v8 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__HDNanoSyncManager__handleIncomingResponse_usingBlock___block_invoke;
        block[3] = &unk_1E6CEA160;
        block[4] = a1;
        v12 = v5;
        v13 = v7;
        dispatch_async(v8, block);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleIncomingResponse_usingBlock_, a1, CFSTR("HDNanoSyncManager.m"), 1090, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleIncomingResponse_usingBlock_, a1, CFSTR("HDNanoSyncManager.m"), 1091, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    goto LABEL_4;
  }
LABEL_5:

}

- (void)_logIncomingRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "fromParticipant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v4, "nanoSyncDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "received %{public}@ from %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

void __56__HDNanoSyncManager__handleIncomingResponse_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoSyncManager _queue_syncStoreForIDSDevice:updateIfNecessary:](v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      objc_msgSend(v7, "fromParticipant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "unable to find sync store for response from device %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (id)_queue_syncStoreForIDSDevice:(uint64_t)a1 updateIfNecessary:(void *)a2
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1 && (dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56)), v3))
  {
    objc_msgSend(v3, "hd_deviceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 120), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[HDNanoSyncManager _queue_updateSyncStores](a1);
      objc_msgSend(*(id *)(a1 + 120), "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __60__HDNanoSyncManager_messageCenterDidReceiveChangesResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  void *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *WeakRetained;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  _BYTE buf[24];
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  v6 = v5;
  if (!v3)
  {
    v12 = v5;
    goto LABEL_22;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (v4)
  {
    if (v6)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveChangeResponse_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 2710, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

    if (v6)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveChangeResponse_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 2711, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

LABEL_4:
  objc_msgSend(v4, "pbResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "status");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "statusCode");
  -[HDNanoSyncManager persistChildIdentityFromCodable:](v3, v7);
  objc_msgSend(v4, "fromParticipant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v3, v6, v11, v7, (uint64_t)&v38);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v38;

  if (!v12)
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v4, "idsIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "ignoring change response %{public}@: %{public}@", buf, 0x16u);

    }
    goto LABEL_21;
  }
  v37 = v13;
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", v3, CFSTR("ReceiveChangeResponse"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = v12;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  *(_QWORD *)buf = 0;
  v16 = -[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](v3, v15, (uint64_t)buf);
  v17 = *(id *)buf;
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    if (objc_msgSend(v14, "hasStatus"))
    {
      switch((int)v9)
      {
        case 0:
        case 4:
        case 5:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unhandled status code %d"), v9);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_13;
          goto LABEL_15;
        case 1:
        case 2:
          if ((objc_msgSend(v15, "validatePairingUUIDsWithIncomingMessage:", v14) & 1) != 0)
          {

            v27 = *(NSObject **)(v3 + 64);
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __60__HDNanoSyncManager__queue_receiveChangeResponse_syncStore___block_invoke;
            v40 = &unk_1E6CED7D0;
            v45 = v9;
            v41 = v3;
            v42 = v8;
            v43 = v15;
            v24 = v36;
            v44 = v36;
            dispatch_async(v27, buf);

            v25 = 0;
            v13 = v37;
            goto LABEL_20;
          }
          v19 = CFSTR("invalid pairing UUIDs");
          goto LABEL_15;
        case 3:

          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Remote requested reactivation"));
          WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
          -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](v3, v15, WeakRetained);
          goto LABEL_33;
        case 6:
          if (*(_BYTE *)(v3 + 8))
          {
            v19 = CFSTR("illegal obliteration request");
            goto LABEL_15;
          }

          _HKInitializeLogging();
          v31 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v32 = v31;
            objc_msgSend(v4, "idsIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v33;
            _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "Obliterating in response to request %{public}@", buf, 0xCu);

          }
          WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
          objc_msgSend(WeakRetained, "obliterateAndTerminateWithOptions:reason:completion:", 1, CFSTR("Requested by NanoSync remote"), 0);
LABEL_33:

          v25 = 0;
          v24 = v36;
          v13 = v37;
          break;
        default:

          v23 = 0;
          goto LABEL_17;
      }
      goto LABEL_19;
    }
    v19 = CFSTR("missing status content");
  }
  else
  {
    objc_msgSend(v17, "description");
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
LABEL_13:
      v23 = 0;
      goto LABEL_16;
    }
  }
LABEL_15:
  v23 = objc_retainAutorelease(v19);
LABEL_16:

LABEL_17:
  v24 = v36;
  v25 = v23;
  _HKInitializeLogging();
  v26 = (void *)*MEMORY[0x1E0CB5370];
  v13 = v37;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v28 = v26;
    objc_msgSend(v4, "idsIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v25;
    _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "ignoring status response %{public}@: %{public}@", buf, 0x16u);

  }
LABEL_19:
  objc_msgSend(v24, "invalidate");
LABEL_20:

LABEL_21:
LABEL_22:

}

void __60__HDNanoSyncManager__queue_receiveChangeResponse_syncStore___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 64) == 2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = 0;
  v7 = objc_msgSend(v4, "applyAcknowledgedAnchorMap:forStore:resetNext:resetInvalid:error:", v5, v6, v2, 1, &v10);
  v8 = v10;

  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "failed to apply received anchors: %{public}@", buf, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "invalidate");

}

- (void)messageCenterDidReceiveChangesRequest:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  dispatch_semaphore_t v8;
  NSObject *queue;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD block[5];
  id v16;
  dispatch_semaphore_t v17;
  id v18;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__HDNanoSyncManager_messageCenterDidReceiveChangesRequest___block_invoke;
  v13[3] = &unk_1E6CED510;
  v13[4] = self;
  v14 = v4;
  v6 = v4;
  v7 = v13;
  if (self)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncronouslyHandleIncomingRequest_usingBlock_, self, CFSTR("HDNanoSyncManager.m"), 1107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    }
    -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v6);
    v8 = dispatch_semaphore_create(0);
    queue = self->_queue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke;
    block[3] = &unk_1E6CED498;
    block[4] = self;
    v16 = v6;
    v10 = v7;
    v17 = v8;
    v18 = v10;
    v11 = v8;
    dispatch_sync(queue, block);
    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

  }
}

- (void)_handleIncomingRequest:(void *)a3 usingBlock:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
LABEL_4:
        -[HDNanoSyncManager _logIncomingRequest:](a1, v5);
        v8 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__HDNanoSyncManager__handleIncomingRequest_usingBlock___block_invoke;
        block[3] = &unk_1E6CEA160;
        block[4] = a1;
        v12 = v5;
        v13 = v7;
        dispatch_async(v8, block);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleIncomingRequest_usingBlock_, a1, CFSTR("HDNanoSyncManager.m"), 1072, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleIncomingRequest_usingBlock_, a1, CFSTR("HDNanoSyncManager.m"), 1073, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    goto LABEL_4;
  }
LABEL_5:

}

void __55__HDNanoSyncManager__handleIncomingRequest_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoSyncManager _queue_syncStoreForIDSDevice:updateIfNecessary:](v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      objc_msgSend(v7, "fromParticipant");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "unable to find sync store for request from device %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

void __59__HDNanoSyncManager_messageCenterDidReceiveChangesRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void (**v27)(void);
  void *v28;
  _QWORD v29[3];
  id v30;
  _BYTE buf[12];
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = a2;
  v27 = a3;
  if (!v5)
  {
    v11 = v7;
    goto LABEL_16;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveChangeRequest_syncStore_completion_, v5, CFSTR("HDNanoSyncManager.m"), 2470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    if (v7)
      goto LABEL_4;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveChangeRequest_syncStore_completion_, v5, CFSTR("HDNanoSyncManager.m"), 2471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    goto LABEL_4;
  }
  if (!v7)
    goto LABEL_22;
LABEL_4:
  HDSetHealthInUseDefaultWithReason(CFSTR("Received sync data."));
  objc_msgSend(v6, "pbRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "changeSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "status");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "statusCode");
  -[HDNanoSyncManager persistChildIdentityFromCodable:](v5, v8);
  objc_msgSend(v6, "fromParticipant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v5, v7, v10, v8, (uint64_t)&v30);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v30;

  if (v11)
  {
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", v5, CFSTR("ReceiveChangeRequest"));
    objc_claimAutoreleasedReturnValue();
    v12 = v8;
    v26 = v11;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
    objc_msgSend(v12, "decodedHealthPairingUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    if (-[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](v5, v26, (uint64_t)buf))
    {
      if ((objc_msgSend(v12, "hasChangeSet") & 1) == 0 && !objc_msgSend(v12, "hasStatus"))
      {
        v17 = 0;
        v16 = CFSTR("missing changeset and status content");
LABEL_15:

        v21 = v16;
        v29[0] = 0;
        v29[1] = v29;
        v29[2] = 0x2020000000;
        __asm { BR              X10 ; loc_1B783EB60 loc_1B783EB68 loc_1B783EB88 loc_1B783EB8C }
      }
      objc_msgSend(v26, "obliteratedDatabaseUUIDs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "containsObject:", v13);

      if ((v15 & 1) != 0)
      {
        v16 = CFSTR("remote requires obliteration");
        v17 = 3u;
        goto LABEL_15;
      }
      if ((objc_msgSend(v26, "validatePairingUUIDsWithIncomingMessage:", v12) & 1) != 0)
      {
        v16 = 0;
        v17 = 1u;
        goto LABEL_15;
      }
      v16 = CFSTR("invalid pairing UUIDs");
    }
    else
    {
      v16 = CFSTR("restore incomplete");
    }
    v17 = 2u;
    goto LABEL_15;
  }
  _HKInitializeLogging();
  v18 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    objc_msgSend(v6, "idsIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v20;
    v32 = 2114;
    v33 = v24;
    _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "ignoring change request %{public}@: %{public}@", buf, 0x16u);

  }
  v27[2]();

LABEL_16:
}

- (id)_queue_eligibleInactiveSyncStores
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -604800.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 120), "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isActive") & 1) == 0)
        {
          if (objc_msgSend(v10, "isRestoreComplete"))
          {
            objc_msgSend(v10, "lastInactiveDate");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "hk_isAfterDate:", v3);

            if (v12)
              objc_msgSend(v4, "addObject:", v10);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_queue_sendResponse:(void *)a3 syncStore:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (!a1)
    goto LABEL_7;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_sendResponse_syncStore_, a1, CFSTR("HDNanoSyncManager.m"), 997, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

    if (v5)
      goto LABEL_4;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_sendResponse_syncStore_, a1, CFSTR("HDNanoSyncManager.m"), 998, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    goto LABEL_4;
  }
  if (!v5)
    goto LABEL_9;
LABEL_4:
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hd_isEquivalentToDevice:", v8);

  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_sendResponse_syncStore_, a1, CFSTR("HDNanoSyncManager.m"), 1001, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[syncStore device] hd_isEquivalentToDevice:[response.toParticipant device]]"));

  }
  objc_msgSend(v5, "configureOutgoingResponse:", v13);
  objc_msgSend(v13, "send");
LABEL_7:

}

- (void)_queue_setUpMessageCentersIfNecessary
{
  unsigned __int8 v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDIDSMessageCenter *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint8_t buf[16];

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    v2 = atomic_load((unsigned __int8 *)(a1 + 9));
    if ((v2 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      if (WeakRetained && !*(_QWORD *)(a1 + 72))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.private.alloy.health.sync.db"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "directoryURL");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("NanoSync"), 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v4, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDIDSMessageCenter createPersistentDictionaryWithURL:](HDIDSMessageCenter, "createPersistentDictionaryWithURL:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        HKCreateSerialDispatchQueue();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v32 = v7;
          v10 = v6;
          v11 = v9;
          v12 = [HDIDSMessageCenter alloc];
          v13 = objc_loadWeakRetained((id *)(a1 + 48));
          objc_msgSend(v13, "daemon");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[HDIDSMessageCenter initWithIDSServiceIdentifier:persistentDictionary:queue:daemon:](v12, "initWithIDSServiceIdentifier:persistentDictionary:queue:daemon:", CFSTR("com.apple.private.alloy.health.sync.classc"), v8, v11, v14);
          v16 = *(void **)(a1 + 72);
          *(_QWORD *)(a1 + 72) = v15;

          v17 = *(id *)(a1 + 72);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveRestoreRequest_, 1);
          objc_msgSend(v17, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveRestoreResponse_, 1);
          objc_msgSend(v17, "addErrorHandler:forMessageID:", sel_messageCenterRestoreError_, 1);
          v18 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v18, objc_opt_class(), 1);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveChangesRequest_, 2);
          objc_msgSend(v17, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveChangesResponse_, 2);
          objc_msgSend(v17, "addErrorHandler:forMessageID:", sel_messageCenterChangesError_, 2);
          v33 = v4;
          v19 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v19, objc_opt_class(), 2);
          objc_msgSend(v17, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveAuthorizationResponse_, 3);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveAuthorizationRequest_, 3);
          objc_msgSend(v17, "addErrorHandler:forMessageID:", sel_messageCenterDidReceiveAuthorizationError_, 3);
          v20 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v20, objc_opt_class(), 3);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveAuthorizationCompleteRequest_, 4);
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", objc_opt_class(), 0, 4);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveRoutineRequest_, 5);
          v21 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v21, objc_opt_class(), 5);
          v9 = v11;
          v6 = v10;
          v7 = v32;
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveChangesRequest_, 7);
          objc_msgSend(v17, "addErrorHandler:forMessageID:", sel_messageCenterChangesError_, 7);
          v22 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v22, objc_opt_class(), 7);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveStartWorkoutAppRequest_, 8);
          objc_msgSend(v17, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveStartWorkoutAppResponse_, 8);
          objc_msgSend(v17, "addErrorHandler:forMessageID:", sel_messageCenterDidReceiveStartWorkoutAppError_, 8);
          v23 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v23, objc_opt_class(), 8);
          objc_msgSend(v17, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveCompanionUserNotificationRequest_, 9);
          objc_msgSend(v17, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveCompanionUserNotificationResponse_, 9);
          objc_msgSend(v17, "addErrorHandler:forMessageID:", sel_messageCenterDidReceiveCompanionUserNotificationError_, 9);
          v24 = objc_opt_class();
          objc_msgSend(v17, "mapPBRequest:toResponse:messageID:", v24, objc_opt_class(), 9);

          v25 = *(id *)(a1 + 72);
          objc_msgSend(v25, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveTinkerOptInRequest_, 11);
          objc_msgSend(v25, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveTinkerOptInResponse_, 11);
          objc_msgSend(v25, "addErrorHandler:forMessageID:", sel_messageCenterDidReceiveTinkerOptInError_, 11);
          v26 = objc_opt_class();
          objc_msgSend(v25, "mapPBRequest:toResponse:messageID:", v26, objc_opt_class(), 11);
          objc_msgSend(v25, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveTinkerPairingRequest_, 10);
          objc_msgSend(v25, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveTinkerPairingResponse_, 10);
          objc_msgSend(v25, "addErrorHandler:forMessageID:", sel_messageCenterDidReceiveTinkerPairingError_, 10);
          v27 = objc_opt_class();
          objc_msgSend(v25, "mapPBRequest:toResponse:messageID:", v27, objc_opt_class(), 10);
          objc_msgSend(v25, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveTinkerEndToEndCloudSyncRequest_, 12);
          objc_msgSend(v25, "addResponseHandler:forMessageID:", sel_messageCenterDidReceiveTinkerEndToEndCloudSyncResponse_, 12);
          objc_msgSend(v25, "addErrorHandler:forMessageID:", sel_messageCenterDidReceiveTinkerEndToEndCloudSyncError_, 12);
          v28 = objc_opt_class();
          v29 = objc_opt_class();
          v30 = v28;
          v4 = v33;
          objc_msgSend(v25, "mapPBRequest:toResponse:messageID:", v30, v29, 12);
          objc_msgSend(v25, "addRequestHandler:forMessageID:", sel_messageCenterDidReceiveNotificationInstructionRequest_, 13);
          objc_msgSend(v25, "mapPBRequest:toResponse:messageID:", objc_opt_class(), 0, 13);

          objc_msgSend(*(id *)(a1 + 72), "setDelegate:", a1);
          objc_msgSend(*(id *)(a1 + 72), "resume");
        }
        else
        {
          _HKInitializeLogging();
          v31 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "failed to create persistent dictionary", buf, 2u);
          }
        }

      }
    }
  }
}

- (void)addObserver:(id)a3
{
  -[HKObserverSet registerObserver:](self->_observers, "registerObserver:", a3);
}

- (BOOL)isMaster
{
  return self->_isMaster;
}

- (BOOL)enablePeriodicSyncTimer
{
  return self->_enablePeriodicSyncTimer;
}

- (void)_queue_updateDeviceNameIfNecessaryWithSyncStore:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    objc_msgSend(v3, "sourceBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceName");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v4 && v5)
    {
      v7 = v4;
      v8 = v3;
      v9 = v6;
      HKDispatchAsyncOnGlobalConcurrentQueue();

    }
  }

}

- (void)_queue_generateWatchActivationSamples
{
  void *v2;
  HDKeyValueDomain *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  NSObject *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 *p_buf;
  int v33;
  id v34;
  uint8_t v35[4];
  id v36;
  __int128 buf;
  uint64_t v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (*(_BYTE *)(a1 + 8))
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
      v2 = *(void **)(a1 + 88);
      if (!v2)
      {
        v3 = [HDKeyValueDomain alloc];
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        v5 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v3, "initWithCategory:domainName:profile:", 0, CFSTR("NanoSync"), WeakRetained);
        v6 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = v5;

        v2 = *(void **)(a1 + 88);
      }
      v7 = v2;
      v34 = 0;
      objc_msgSend(v7, "numberForKey:error:", CFSTR("WatchSwitchIndex"), &v34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v34;
      v10 = v9;
      if (v8 || !v9)
      {
        v12 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v12, "daemon");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "nanoPairedDeviceRegistry");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v8, "unsignedIntValue");
        v16 = objc_msgSend(v14, "switchIndex");
        if (v15 > v16)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 67109376;
            DWORD1(buf) = v15;
            WORD4(buf) = 1024;
            *(_DWORD *)((char *)&buf + 10) = v16;
            _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "current switch index %u is greater than %u", (uint8_t *)&buf, 0xEu);
          }
        }
        if (v15 >= v16)
        {
          v23 = v10;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB6380], "watchActivationType");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf = 0;
          *((_QWORD *)&buf + 1) = &buf;
          v38 = 0x2020000000;
          v20 = MEMORY[0x1E0C809B0];
          v39 = v15;
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke;
          v29[3] = &unk_1E6CED600;
          v33 = v15;
          v21 = v18;
          v30 = v21;
          v22 = v19;
          v31 = v22;
          p_buf = &buf;
          objc_msgSend(v14, "getSwitchEventsFromIndex:inlineCallback:", v15, v29);
          v28[0] = v20;
          v28[1] = 3221225472;
          v28[2] = __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke_398;
          v28[3] = &unk_1E6CED628;
          v28[4] = a1;
          objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v28);
          if (*(_DWORD *)(*((_QWORD *)&buf + 1) + 24) == (_DWORD)v15)
          {
            v23 = v10;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v10;
            v25 = objc_msgSend(v7, "setNumber:forKey:error:", v24, CFSTR("WatchSwitchIndex"), &v27);
            v23 = v27;

            if ((v25 & 1) == 0)
            {
              _HKInitializeLogging();
              v26 = *MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v35 = 138543362;
                v36 = v23;
                _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "failed to set switch index: %{public}@", v35, 0xCu);
              }
            }
          }

          _Block_object_dispose(&buf, 8);
        }

        v10 = v23;
      }
      else
      {
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(_QWORD *)((char *)&buf + 4) = v10;
          _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "failed to get switch index: %{public}@", (uint8_t *)&buf, 0xCu);
        }
      }

    }
  }
}

- (void)_notifyObserversPairedDevicesChanged:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 80);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __58__HDNanoSyncManager__notifyObserversPairedDevicesChanged___block_invoke;
    v6[3] = &unk_1E6CEDC00;
    v6[4] = a1;
    v7 = v3;
    objc_msgSend(v5, "notifyObservers:", v6);

  }
}

uint64_t __58__HDNanoSyncManager__notifyObserversPairedDevicesChanged___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nanoSyncManager:pairedDevicesChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)syncHealthDataWithOptions:(unint64_t)a3 reason:(id)a4 completion:(id)a5
{
  -[HDNanoSyncManager syncHealthDataWithOptions:reason:accessibilityAssertion:completion:](self, "syncHealthDataWithOptions:reason:accessibilityAssertion:completion:", a3, a4, 0, a5);
}

- (void)messageCenter:(id)a3 didResolveIDSIdentifierForResponse:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(v4, "toParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v4, "nanoSyncDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "resolved %{public}@ to %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_workoutSamplesWereAssociated:(id)a3
{
  if (self)
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, CFSTR("workout samples were associated"), 0);
}

- (void)_syncImmediatelyWithReason:(uint64_t)a3 options:
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  uint64_t v10;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__HDNanoSyncManager__syncImmediatelyWithReason_options___block_invoke;
    block[3] = &unk_1E6CE9C58;
    block[4] = a1;
    v9 = v5;
    v10 = a3;
    dispatch_async(v7, block);

  }
}

void __56__HDNanoSyncManager__syncImmediatelyWithReason_options___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);
}

- (HDNanoSyncManager)initWithProfile:(id)a3 isMaster:(BOOL)a4
{
  id v6;
  HDNanoSyncManager *v7;
  HDNanoSyncManager *v8;
  uint64_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  OS_dispatch_queue *syncQueue;
  id v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  HKObserverSet *observers;
  HDPairedSyncManager *v18;
  HDPairedSyncManager *pairedSyncManager;
  uint64_t v20;
  NSMutableDictionary *syncStoresByDeviceIdentifier;
  uint64_t v22;
  _CDLocalContext *context;
  void *v24;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)HDNanoSyncManager;
  v7 = -[HDNanoSyncManager init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_profile, v6);
    HKCreateSerialDispatchQueue();
    v9 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    syncQueue = v8->_syncQueue;
    v8->_syncQueue = (OS_dispatch_queue *)v11;

    v8->_isMaster = a4;
    v8->_waitingForFirstUnlock = 1;
    atomic_store(0, (unsigned __int8 *)&v8->_invalidated);
    v13 = objc_alloc(MEMORY[0x1E0CB6988]);
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithName:loggingCategory:", v15, *MEMORY[0x1E0CB5370]);
    observers = v8->_observers;
    v8->_observers = (HKObserverSet *)v16;

    v18 = -[HDPairedSyncManager initWithProfile:queue:]([HDPairedSyncManager alloc], "initWithProfile:queue:", v6, v8->_queue);
    pairedSyncManager = v8->_pairedSyncManager;
    v8->_pairedSyncManager = v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    syncStoresByDeviceIdentifier = v8->_syncStoresByDeviceIdentifier;
    v8->_syncStoresByDeviceIdentifier = (NSMutableDictionary *)v20;

    v8->_restoreTimeout = 60.0;
    v8->_enablePeriodicSyncTimer = 1;
    objc_msgSend(MEMORY[0x1E0D15C40], "userContext");
    v22 = objc_claimAutoreleasedReturnValue();
    context = v8->_context;
    v8->_context = (_CDLocalContext *)v22;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v8);

    objc_msgSend(v6, "registerProfileReadyObserver:queue:", v8, 0);
  }

  return v8;
}

- (void)invalidateAndWait
{
  NSObject *queue;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HDNanoSyncManager_invalidateAndWait__block_invoke;
  block[3] = &unk_1E6CE8110;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v9 + 24))
  {
    -[HDIDSMessageCenter invalidate](self->_messageCenter, "invalidate");
    v5 = self->_queue;
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __38__HDNanoSyncManager_invalidateAndWait__block_invoke_2;
    v6[3] = &unk_1E6CE80E8;
    v6[4] = self;
    dispatch_sync(v5, v6);
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __38__HDNanoSyncManager_invalidateAndWait__block_invoke(uint64_t result)
{
  unsigned __int8 *v1;
  unsigned __int8 v2;

  v1 = (unsigned __int8 *)(*(_QWORD *)(result + 32) + 9);
  do
    v2 = __ldaxr(v1);
  while (__stlxr(1u, v1));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2 & 1;
  return result;
}

void __38__HDNanoSyncManager_invalidateAndWait__block_invoke_2(uint64_t a1)
{
  -[HDNanoSyncManager _invalidate](*(_QWORD *)(a1 + 32));
}

- (void)_invalidate
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
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
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 136);
    if (v2)
    {
      dispatch_source_cancel(v2);
      v3 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = 0;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("HDUserCharacteristicsShouldSyncNotification"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", a1, CFSTR("HDHealthStoreServerUserPreferencesDidChangeNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0D517E0], 0);
    objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0D517D0], 0);
    objc_msgSend(v5, "removeObserver:name:object:", a1, *MEMORY[0x1E0D517A8], 0);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 120), "allValues", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "invalidate");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)obliterateWithOptions:(unint64_t)a3 reason:(id)a4
{
  char v4;
  id v6;
  char v7;
  BOOL v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  char v13;
  BOOL v14;

  v4 = a3;
  v6 = a4;
  v7 = v4 & 1;
  v8 = (v4 & 2) != 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__HDNanoSyncManager_obliterateWithOptions_reason___block_invoke;
  block[3] = &unk_1E6CED368;
  v13 = v7;
  block[4] = self;
  v12 = v6;
  v14 = v8;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __50__HDNanoSyncManager_obliterateWithOptions_reason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8) && *(_BYTE *)(a1 + 48))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(v2 + 120), "allValues", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "prepareForObliteration");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 72), "obliterateWithReason:preserveCopy:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 49));
}

- (void)initializeMessageCenterIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HDNanoSyncManager_initializeMessageCenterIfNeeded__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __52__HDNanoSyncManager_initializeMessageCenterIfNeeded__block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_setUpMessageCentersIfNecessary](*(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  BOOL *p_invalidated;
  unsigned __int8 v4;
  objc_super v5;

  p_invalidated = &self->_invalidated;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalidated);
  while (__stlxr(1u, (unsigned __int8 *)p_invalidated));
  if ((v4 & 1) == 0)
  {
    -[HDIDSMessageCenter invalidate](self->_messageCenter, "invalidate");
    -[HDNanoSyncManager _invalidate]((uint64_t)self);
  }
  v5.receiver = self;
  v5.super_class = (Class)HDNanoSyncManager;
  -[HDNanoSyncManager dealloc](&v5, sel_dealloc);
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained;
  void *v5;
  OS_dispatch_queue *queue;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HDNanoSyncManager_profileDidBecomeReady___block_invoke;
  v7[3] = &unk_1E6CE80E8;
  v7[4] = self;
  objc_msgSend(v5, "performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:block:", queue, v7);

}

void __43__HDNanoSyncManager_profileDidBecomeReady___block_invoke(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5370];
  v3 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEBUG, "data protected by first unlock available", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v5 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v4, &v8);
  v6 = v8;
  if ((v5 & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "failed to initialize NanoSync after first unlock: %{public}@", buf, 0xCu);
    }
  }

}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HDNanoSyncStore needsSyncOnUnlock](self->_activeSyncStore, "needsSyncOnUnlock"))
  {
    -[HDNanoSyncStore setNeedsSyncOnUnlock:](self->_activeSyncStore, "setNeedsSyncOnUnlock:", 0);
    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:]((uint64_t)self, CFSTR("syncing after unlock"), 1, 0, &__block_literal_global_38);
  }
}

void __62__HDNanoSyncManager_database_protectedDataDidBecomeAvailable___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if ((a2 & 1) == 0 && (objc_msgSend(v4, "hk_isDatabaseAccessibilityError") & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "post-unlock sync failed: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)_queue_syncImmediatelyWithReason:(uint64_t)a3 options:(void *)a4 accessibilityAssertion:(void *)a5 completion:
{
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  HDKeyValueDomain *v16;
  id *v17;
  id WeakRetained;
  HDKeyValueDomain *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t i;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  id v40;
  const __CFString *v41;
  void *v42;
  BOOL v43;
  NSObject *v44;
  CFAbsoluteTime Current;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  __int128 v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  HDKeyValueDomain *v61;
  _QWORD aBlock[5];
  id v63;
  id v64;
  CFAbsoluteTime v65;
  uint64_t v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  uint8_t v74[4];
  uint64_t v75;
  __int16 v76;
  id v77;
  uint8_t buf[4];
  uint64_t v79;
  __int16 v80;
  id v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  v11 = a5;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    v67 = 0;
    v59 = a1;
    v12 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](a1, &v67);
    v13 = v67;
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    v15 = *MEMORY[0x1E0CB5370];
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v48 = v14;
        _StringFromSyncOptions(a3);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v79 = (uint64_t)v9;
        v80 = 2112;
        v81 = v49;
        _os_log_debug_impl(&dword_1B7802000, v48, OS_LOG_TYPE_DEBUG, "syncing immediately with reason \"%@\" options:'%@'", buf, 0x16u);

      }
      v57 = a3;
      v16 = [HDKeyValueDomain alloc];
      v17 = (id *)(a1 + 48);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      v19 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v16, "initWithCategory:domainName:profile:", 0, CFSTR("CloudSync"), WeakRetained);

      v20 = *MEMORY[0x1E0CB7618];
      v73 = 0;
      v60 = v20;
      v61 = v19;
      -[HDKeyValueDomain numberForKey:error:](v19, "numberForKey:error:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v73;
      v23 = v22;
      if (v21 || !v22)
      {
        if ((objc_msgSend(v21, "BOOLValue") & 1) == 0)
        {
          v52 = v21;
          v53 = v13;
          v54 = v11;
          v55 = v10;
          v56 = v9;
          v25 = objc_loadWeakRetained(v17);
          objc_msgSend(v25, "daemon");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "nanoPairedDeviceRegistry");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v51 = v27;
          objc_msgSend(v27, "getPairedDevices");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v29 = v28;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
          if (v30)
          {
            v32 = v30;
            v33 = *(_QWORD *)v70;
            v34 = CFSTR("21R0");
            *(_QWORD *)&v31 = 138543618;
            v50 = v31;
            v58 = v29;
            while (2)
            {
              for (i = 0; i != v32; ++i)
              {
                if (*(_QWORD *)v70 != v33)
                  objc_enumerationMutation(v29);
                v36 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
                objc_msgSend(v36, "hd_productType", v50);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = objc_msgSend(v37, "hasPrefix:", CFSTR("Watch"));

                if (v38)
                {
                  objc_msgSend(v36, "hd_systemBuildVersion");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v39, "hk_compareBuildVersionWithString:", v34) == -1)
                  {
                    v41 = v34;
                    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
                    v68 = v23;
                    v43 = -[HDKeyValueDomain setNumber:forKey:error:](v61, "setNumber:forKey:error:", v42, v60, &v68);
                    v40 = v68;

                    if (v43)
                    {

                      v23 = v40;
                      v29 = v58;
                      goto LABEL_33;
                    }
                    _HKInitializeLogging();
                    v44 = *MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v74 = v50;
                      v75 = v59;
                      v76 = 2114;
                      v77 = v40;
                      _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to set flag for old watch paired to Dawn+ phone %{public}@.", v74, 0x16u);
                    }
                    v34 = v41;
                    v29 = v58;
                  }
                  else
                  {
                    v40 = v23;
                  }

                  v23 = v40;
                }
              }
              v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v69, buf, 16);
              if (v32)
                continue;
              break;
            }
          }
LABEL_33:

          v10 = v55;
          v9 = v56;
          v13 = v53;
          v11 = v54;
          v21 = v52;
        }
      }
      else
      {
        _HKInitializeLogging();
        v24 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v79 = v59;
          v80 = 2114;
          v81 = v23;
          _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@: Could not read key for whether device was ever paired to old watch %{public}@.", buf, 0x16u);
        }
      }

      Current = CFAbsoluteTimeGetCurrent();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __96__HDNanoSyncManager__queue_syncImmediatelyWithReason_options_accessibilityAssertion_completion___block_invoke;
      aBlock[3] = &unk_1E6CED7F8;
      v65 = Current;
      aBlock[4] = v59;
      v46 = v9;
      v63 = v46;
      v66 = v57;
      v64 = v11;
      v47 = _Block_copy(aBlock);
      -[HDNanoSyncManager _queue_synchronizeWithOptions:restoreMessagesSentHandler:targetSyncStore:reason:accessibilityAssertion:completion:](v59, v57, 0, *(void **)(v59 + 96), v46, v10, v47);

    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v79 = (uint64_t)v9;
        v80 = 2114;
        v81 = v13;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "failed to sync immediately for reason \"%{public}@\": %{public}@", buf, 0x16u);
      }
      if (v11)
      {
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Sync failed without reporting an error."));
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v13);
      }
    }

  }
}

- (void)removeObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)pairedSyncDidBeginForDevice:(id)a3 messagesSentHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HDNanoSyncManager_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke;
  v15[3] = &unk_1E6CED3D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __80__HDNanoSyncManager_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _QWORD aBlock[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v29 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v29);
  v4 = v29;
  if (v3)
  {
    v6 = a1[4];
    v5 = (void *)a1[5];
    v7 = (void *)a1[6];
    v8 = (void *)a1[7];
    v9 = v5;
    v10 = v7;
    v11 = v8;
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
      v12 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke;
      aBlock[3] = &unk_1E6CE77F0;
      v31 = v11;
      v11 = _Block_copy(aBlock);
      if (v9)
      {
        -[HDNanoSyncManager _queue_updateSyncStores](v6);
        v28 = v9;
        objc_msgSend(v9, "hd_pairingID");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        objc_msgSend(*(id *)(v6 + 120), "allValues");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v15)
        {
          v26 = v10;
          v27 = v4;
          v16 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v15; i = (char *)i + 1)
            {
              if (*(_QWORD *)v33 != v16)
                objc_enumerationMutation(v14);
              v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v18, "nanoRegistryUUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isEqual:", v13);

              if ((v20 & 1) != 0)
              {
                v15 = v18;
                goto LABEL_16;
              }
            }
            v15 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v15)
              continue;
            break;
          }
LABEL_16:
          v10 = v26;
          v4 = v27;
          v12 = MEMORY[0x1E0C809B0];
        }

        if (v15)
        {
          v36[0] = v12;
          v36[1] = 3221225472;
          v36[2] = __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke_2;
          v36[3] = &unk_1E6CE7868;
          v9 = v28;
          v37 = v28;
          v22 = v15;
          v38 = v22;
          v39 = v11;
          -[HDNanoSyncManager _queue_synchronizeWithOptions:restoreMessagesSentHandler:targetSyncStore:reason:accessibilityAssertion:completion:](v6, 0, v10, v22, CFSTR("PairedSync session began"), 0, v36);

          v23 = v37;
        }
        else
        {
          v24 = (void *)MEMORY[0x1E0CB35C8];
          v9 = v28;
          objc_msgSend(v28, "hd_shortDescription");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "hk_error:format:", 100, CFSTR("failed to find sync store for device %@"), v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v25);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("no device specified"));
        v15 = (id)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v15);
      }

    }
  }
  else
  {
    v21 = a1[7];
    if (v21)
      (*(void (**)(uint64_t, _QWORD, id))(v21 + 16))(v21, 0, v4);
  }

}

- (void)syncHealthDataWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HDNanoSyncManager syncHealthDataWithOptions:reason:completion:](self, "syncHealthDataWithOptions:reason:completion:", a3, v8, v7);

}

- (void)syncHealthDataWithOptions:(unint64_t)a3 reason:(id)a4 accessibilityAssertion:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  NSObject *queue;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  _QWORD aBlock[4];
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  HDNanoSyncManager *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  if (a5)
  {
    v12 = a5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v14, "cloneAccessibilityAssertion:ownerIdentifier:error:", v12, v16, &v35);
    a5 = (id)objc_claimAutoreleasedReturnValue();

    v17 = v35;
    if (!a5)
    {
      _HKInitializeLogging();
      v18 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v37 = self;
        v38 = 2114;
        v39 = v17;
        _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Unable to clone assertion error: %{public}@", buf, 0x16u);
      }
    }

  }
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke;
  aBlock[3] = &unk_1E6CED3F8;
  v20 = a5;
  v33 = v20;
  v34 = v11;
  v21 = v11;
  v22 = _Block_copy(aBlock);
  queue = self->_queue;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke_2;
  v27[3] = &unk_1E6CED420;
  v27[4] = self;
  v28 = v10;
  v30 = v22;
  v31 = a3;
  v29 = v20;
  v24 = v22;
  v25 = v20;
  v26 = v10;
  dispatch_async(queue, v27);

}

void __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

void __88__HDNanoSyncManager_syncHealthDataWithOptions_reason_accessibilityAssertion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v5);
  v4 = v5;
  if (v3)
    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 64), *(void **)(a1 + 48), *(void **)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (void)waitForLastChanceSyncWithDevicePairingID:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__HDNanoSyncManager_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke;
  v13[3] = &unk_1E6CED448;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __81__HDNanoSyncManager_waitForLastChanceSyncWithDevicePairingID_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  double v6;
  void *v7;
  id v8;
  void (**v9)(id, _QWORD, void *);
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  HDNanoSyncSession *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v2 = *(_QWORD *)(a1 + 32);
  v24 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v24);
  v4 = v24;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(double *)(a1 + 56);
    v7 = *(void **)(a1 + 48);
    v8 = *(id *)(a1 + 40);
    v9 = v7;
    if (v5)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      if (v9)
      {
        if (v8)
        {
          v10 = *(void **)(v5 + 96);
          if (v10
            && (objc_msgSend(v10, "nanoRegistryUUID"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                v12 = objc_msgSend(v8, "isEqual:", v11),
                v11,
                (v12 & 1) != 0))
          {
            objc_initWeak(&location, *(id *)(v5 + 96));
            v13 = *(id *)(v5 + 56);
            v14 = *(void **)(v5 + 96);
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke;
            v25[3] = &unk_1E6CED848;
            v15 = v13;
            v26 = v15;
            objc_copyWeak(&v27, &location);
            objc_msgSend(v14, "addIncomingSyncObserverWithTimeout:timeoutHandler:completion:", v25, v9, v6);
            v16 = -[HDNanoSyncSession initWithSyncStore:options:reason:delegate:completion:]([HDNanoSyncSession alloc], "initWithSyncStore:options:reason:delegate:completion:", *(_QWORD *)(v5 + 96), 3, CFSTR("Last chance sync request"), v5, &__block_literal_global_555);
            -[HDNanoSyncManager _sendFinalStatusMessageForSyncSession:didFinishSuccessfully:error:](v5, v16, 1, 0);

            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
          }
          else
          {
            v18 = (void *)MEMORY[0x1E0CB35C8];
            v19 = objc_opt_class();
            objc_msgSend(v8, "UUIDString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v19, sel__queue_waitForLastChanceSyncWithPairingID_timeout_completion_, CFSTR("Device with pairing ID \"%@\" is not active"), v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v9[2](v9, 0, v21);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), sel__queue_waitForLastChanceSyncWithPairingID_timeout_completion_, CFSTR("pairingID cannot be nil"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, 0, v22);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_waitForLastChanceSyncWithPairingID_timeout_completion_, v5, CFSTR("HDNanoSyncManager.m"), 3117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != NULL"));

      }
    }

  }
  else
  {
    v17 = *(_QWORD *)(a1 + 48);
    if (v17)
      (*(void (**)(uint64_t, _QWORD, id))(v17 + 16))(v17, 0, v4);
  }

}

- (void)resetSyncWithCompletion:(id)a3
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
  v7[2] = __45__HDNanoSyncManager_resetSyncWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__HDNanoSyncManager_resetSyncWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v15);
  v4 = v15;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void (**)(id, uint64_t, _QWORD))*(id *)(a1 + 40);
    if (v5)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      if (*(_BYTE *)(v5 + 24))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_resetSyncWithCompletion_, v5, CFSTR("HDNanoSyncManager.m"), 1779, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_waitingForFirstUnlock == NO"));

      }
      v7 = *(void **)(v5 + 96);
      if (v7)
      {
        if (objc_msgSend(v7, "restoreState") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Restore cancelled by reset"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](v5, *(void **)(v5 + 96), v8);

        }
        WeakRetained = objc_loadWeakRetained((id *)(v5 + 48));
        objc_msgSend(WeakRetained, "syncEngine");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resetStore:", *(_QWORD *)(v5 + 96));

        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v12 = *(_QWORD *)(v5 + 96);
          *(_DWORD *)buf = 138543362;
          v17 = v12;
          _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "resetting sync store %{public}@", buf, 0xCu);
        }
      }
      if (v6)
        v6[2](v6, 1, 0);
    }

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v4);
  }

}

- (void)updatePairedDevicesWithCompletion:(id)a3
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
  v7[2] = __55__HDNanoSyncManager_updatePairedDevicesWithCompletion___block_invoke;
  v7[3] = &unk_1E6CE9C08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __55__HDNanoSyncManager_updatePairedDevicesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v6);
  v4 = v6;
  if (v3)
  {
    -[HDNanoSyncManager _queue_updateSyncStoresWithCompletion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v4);
  }

}

- (void)_queue_updateSyncStoresWithCompletion:(uint64_t)a1
{
  id v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = v3;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    -[HDNanoSyncManager _queue_updateSyncStores](a1);
    v3 = v4;
    if (v4)
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(a1 + 40), 0);
      v3 = v4;
    }
  }

}

- (void)unitTest_performWithActiveSyncStore:(id)a3
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
  v7[2] = __57__HDNanoSyncManager_unitTest_performWithActiveSyncStore___block_invoke;
  v7[3] = &unk_1E6CE8C48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __57__HDNanoSyncManager_unitTest_performWithActiveSyncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)requestAuthorizationForRequestRecord:(id)a3 requestSentHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__HDNanoSyncManager_requestAuthorizationForRequestRecord_requestSentHandler_completion___block_invoke;
  v15[3] = &unk_1E6CED3D0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __88__HDNanoSyncManager_requestAuthorizationForRequestRecord_requestSentHandler_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HDRemoteAuthorizationRequestContext *v19;
  HDRemoteAuthorizationRequestContext *v20;
  SEL v21;
  SEL v22;
  void *v23;
  id v24;
  const __CFString *v25;
  uint8_t buf[8];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v24 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v24);
  v4 = v24;
  if (v3)
  {
    v6 = a1[4];
    v5 = (void *)a1[5];
    v7 = *(void **)(v6 + 96);
    v8 = (void *)a1[6];
    v9 = (void *)a1[7];
    v10 = v5;
    v11 = v7;
    v12 = v8;
    v13 = v9;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "Requesting authorization from companion.", buf, 2u);
    }
    objc_msgSend(v11, "createRequestWithMessageID:", 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCodableAuthorizationRequestMessage codableAuthorizationRequestWithRecord:](HDCodableAuthorizationRequestMessage, "codableAuthorizationRequestWithRecord:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPbRequest:", v16);

    v25 = CFSTR("auth-identifier");
    objc_msgSend(v10, "sessionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPersistentUserInfo:", v18);

    -[HDNanoSyncManager _queue_sendRequest:syncStore:](v6, v15, (uint64_t)v11);
    v19 = objc_alloc_init(HDRemoteAuthorizationRequestContext);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_requestRecord, v5);
      objc_setProperty_nonatomic_copy(v20, v21, v12, 16);
      objc_setProperty_nonatomic_copy(v20, v22, v13, 24);
    }
    objc_msgSend(v10, "sessionIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addPendingRequestContext:forUUID:", v20, v23);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

- (void)sendStartWorkoutAppRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HDNanoSyncManager_sendStartWorkoutAppRequest_completion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __59__HDNanoSyncManager_sendStartWorkoutAppRequest_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  HDRemoteStartWorkoutAppRequestContext *v17;
  void *v18;
  SEL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v25 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v25);
  v4 = v25;
  if (v3)
  {
    v5 = a1[4];
    v6 = *(void **)(v5 + 96);
    if (v6)
    {
      v8 = (void *)a1[5];
      v7 = (void *)a1[6];
      v9 = v8;
      v10 = v6;
      v11 = v7;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      objc_msgSend(v10, "createRequestWithMessageID:", 8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPbRequest:", v9);
      v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v9, "requestIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);

      if (v15)
      {
        v26 = CFSTR("workout-launch");
        v27[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPersistentUserInfo:", v16);

        objc_msgSend(v12, "setPriority:", 1);
        -[HDNanoSyncManager _queue_sendRequest:syncStore:](v5, v12, (uint64_t)v10);
        v17 = objc_alloc_init(HDRemoteStartWorkoutAppRequestContext);
        v18 = v17;
        if (v17)
        {
          objc_storeStrong((id *)&v17->_request, v8);
          objc_setProperty_nonatomic_copy(v18, v19, v11, 16);
        }
        objc_msgSend(v10, "addPendingRequestContext:forUUID:", v18, v15);
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB35C8];
        v23 = objc_opt_class();
        objc_msgSend(v9, "requestIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v23, sel__queue_sendStartWorkoutAppRequest_syncStore_completion_, CFSTR("Invalid request identifier %@"), v18);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 550, CFSTR("Unable to launch watch app"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[6] + 16))();

    }
  }
  else
  {
    v20 = a1[6];
    if (v20)
      (*(void (**)(uint64_t, _QWORD, id))(v20 + 16))(v20, 0, v4);
  }

}

- (void)sendCompanionUserNotificationRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HDNanoSyncManager_sendCompanionUserNotificationRequest_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __69__HDNanoSyncManager_sendCompanionUserNotificationRequest_completion___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HDRemoteCompanionUserNotificationRequestContext *v18;
  void *v19;
  SEL v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v24 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v24);
  v4 = v24;
  if (v3)
  {
    v6 = a1[4];
    v5 = (void *)a1[5];
    v7 = *(void **)(v6 + 96);
    v8 = (void *)a1[6];
    v9 = v5;
    v10 = v7;
    v11 = v8;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
    objc_msgSend(v10, "createRequestWithMessageID:", 9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPbRequest:", v9);
    objc_msgSend(v9, "requestIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = objc_alloc(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v9, "requestIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithUUIDString:", v15);

      v25 = CFSTR("companion-user-notification");
      v26[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPersistentUserInfo:", v17);

      objc_msgSend(v12, "setPriority:", 1);
      -[HDNanoSyncManager _queue_sendRequest:syncStore:](v6, v12, (uint64_t)v10);
      v11[2](v11, 1, 0);
      v18 = objc_alloc_init(HDRemoteCompanionUserNotificationRequestContext);
      v19 = v18;
      if (v18)
      {
        objc_storeStrong((id *)&v18->_request, v5);
        objc_setProperty_nonatomic_copy(v19, v20, &__block_literal_global_581, 16);
      }
      objc_msgSend(v10, "addPendingRequestContext:forUUID:", v19, v16);
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = objc_opt_class();
      objc_msgSend(v9, "requestIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v23, sel__queue_sendCompanionUserNotificationRequest_syncStore_completion_, CFSTR("Invalid request identifier %@"), v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v19);
    }

  }
  else
  {
    v21 = a1[6];
    if (v21)
      (*(void (**)(uint64_t, _QWORD, id))(v21 + 16))(v21, 0, v4);
  }

}

- (void)sendNotificationInstructionMessageRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HDNanoSyncManager_sendNotificationInstructionMessageRequest_completion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __74__HDNanoSyncManager_sendNotificationInstructionMessageRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v2 = *(_QWORD *)(a1 + 32);
  v19 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v19);
  v4 = v19;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 96);
    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      v8 = *(id *)(a1 + 40);
      v9 = v6;
      v10 = v7;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v5 + 56));
      objc_msgSend(v9, "createRequestWithMessageID:", 13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPbRequest:", v8);
      objc_msgSend(v8, "requestIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v11, "setPriority:", 1);
        -[HDNanoSyncManager _queue_sendRequest:syncStore:](v5, v11, (uint64_t)v9);
        v10[2](v10, 1, 0);
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0CB35C8];
        v16 = objc_opt_class();
        objc_msgSend(v8, "requestIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v16, sel__queue_sendNotificationInstructionRequest_syncStore_completion_, CFSTR("Invalid request identifier %@"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v18);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 110, CFSTR("Cannot send a message without an active sync store. There is likely not a paired watch."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v4);
  }

}

- (void)sendTinkerSharingOptInRequest:(id)a3 forNRDeviceUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__HDNanoSyncManager_sendTinkerSharingOptInRequest_forNRDeviceUUID_completion___block_invoke;
  v15[3] = &unk_1E6CED470;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __78__HDNanoSyncManager_sendTinkerSharingOptInRequest_forNRDeviceUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  HDRemoteTinkerOptInRequestContext *v23;
  void *v24;
  SEL v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  const __CFString *v32;
  _BYTE buf[12];
  __int16 v34;
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v31 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v31);
  v4 = v31;
  if ((v3 & 1) != 0)
  {
    -[HDNanoSyncManager _queue_updateTinkerSyncStore](a1[4]);
    v5 = *(void **)(a1[4] + 104);
    if (v5)
    {
      objc_msgSend(v5, "nanoRegistryUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", a1[5]) & 1) != 0)
      {
        v7 = a1[4];
        v8 = *(void **)(v7 + 104);
        v10 = (void *)a1[6];
        v9 = (void *)a1[7];
        v11 = v10;
        v12 = v8;
        v13 = v9;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          objc_msgSend(v11, "requestIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v7;
          v34 = 2114;
          v35 = v16;
          v36 = 2114;
          v37 = v12;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker opt in request %{public}@, syncStore %{public}@ (#t0)", buf, 0x20u);

        }
        objc_msgSend(v12, "createRequestWithMessageID:", 11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPbRequest:", v11);
        objc_msgSend(v11, "requestIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v11, "requestIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)objc_msgSend(v19, "initWithUUIDString:", v20);

          v32 = CFSTR("tinker-optin");
          *(_QWORD *)buf = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v32, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setPersistentUserInfo:", v22);

          objc_msgSend(v17, "setPriority:", 1);
          -[HDNanoSyncManager _queue_sendRequest:syncStore:](v7, v17, (uint64_t)v12);
          v23 = objc_alloc_init(HDRemoteTinkerOptInRequestContext);
          v24 = v23;
          if (v23)
          {
            objc_storeStrong((id *)&v23->_request, v10);
            objc_setProperty_nonatomic_copy(v24, v25, v13, 16);
          }
          objc_msgSend(v12, "addPendingRequestContext:forUUID:", v24, v21);
        }
        else
        {
          v29 = (void *)MEMORY[0x1E0CB35C8];
          v30 = objc_opt_class();
          objc_msgSend(v11, "requestIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v30, sel__queue_sendTinkerOptInRequest_syncStore_completion_, CFSTR("Invalid request identifier %@"), v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v24);
        }

      }
      else
      {
        v28 = a1[7];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Active device (%@) is not same as the device we want to pair to (%@)."), v6, a1[5]);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, id))(v28 + 16))(v28, 0, v11);
      }

    }
    else
    {
      v26 = a1[7];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to complete Tinker health sharing opt in because active sync store is nil"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v26 + 16))(v26, 0, v27);

    }
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

- (void)_queue_updateTinkerSyncStore
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_updateTinkerSyncStore, a1, CFSTR("HDNanoSyncManager.m"), 758, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_waitingForFirstUnlock == NO"));

    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "daemon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nanoPairedDeviceRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D51838], "activeDeviceSelectorBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getAllDevicesWithArchivedAltAccountDevicesMatching:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 72), "idsService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "linkedDevicesWithRelationship:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "deviceForNRDevice:fromIDSDevices:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v11 = (os_log_t *)MEMORY[0x1E0CB5370];
    v12 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v7, "hd_pairingID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hd_deviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = a1;
      v24 = 2112;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%@ Active tinker NR device %@, IDS device %@ (#t0)", buf, 0x20u);

    }
    v16 = objc_loadWeakRetained((id *)(a1 + 48));
    +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", v16, v10, a1, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "hd_deviceIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 120), "setObject:forKeyedSubscript:", v17, v18);
    objc_msgSend(*(id *)(a1 + 104), "invalidate");
    objc_storeStrong((id *)(a1 + 104), v17);
    _HKInitializeLogging();
    v19 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(a1 + 104);
      *(_DWORD *)buf = 138543618;
      v23 = a1;
      v24 = 2114;
      v25 = v20;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Active tinker store %{public}@ (#t0)", buf, 0x16u);
    }

  }
}

- (void)sendTinkerWatchPairingRequest:(id)a3 forNRDeviceUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__HDNanoSyncManager_sendTinkerWatchPairingRequest_forNRDeviceUUID_completion___block_invoke;
  v15[3] = &unk_1E6CED470;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __78__HDNanoSyncManager_sendTinkerWatchPairingRequest_forNRDeviceUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HDRemoteTinkerPairingRequestContext *v21;
  void *v22;
  SEL v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  const __CFString *v28;
  uint8_t buf[8];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v27 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v27);
  v4 = v27;
  if ((v3 & 1) != 0)
  {
    -[HDNanoSyncManager _queue_updateTinkerSyncStore](a1[4]);
    v5 = *(void **)(a1[4] + 104);
    if (v5)
    {
      objc_msgSend(v5, "nanoRegistryUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", a1[5]) & 1) != 0)
      {
        v7 = a1[4];
        v8 = *(void **)(v7 + 104);
        v10 = (void *)a1[6];
        v9 = (void *)a1[7];
        v11 = v10;
        v12 = v8;
        v13 = v9;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
        _HKInitializeLogging();
        v14 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Guardian requesting health sharing with Tinker watch. (#t0)", buf, 2u);
        }
        objc_msgSend(v12, "createRequestWithMessageID:", 10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setPbRequest:", v11);
        objc_msgSend(v11, "requestIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = objc_alloc(MEMORY[0x1E0CB3A28]);
          objc_msgSend(v11, "requestIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithUUIDString:", v18);

          v28 = CFSTR("tinker-pairing");
          *(_QWORD *)buf = v19;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v28, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setPersistentUserInfo:", v20);

          objc_msgSend(v15, "setPriority:", 1);
          -[HDNanoSyncManager _queue_sendRequest:syncStore:](v7, v15, (uint64_t)v12);
          v21 = objc_alloc_init(HDRemoteTinkerPairingRequestContext);
          v22 = v21;
          if (v21)
          {
            objc_storeStrong((id *)&v21->_request, v10);
            objc_setProperty_nonatomic_copy(v22, v23, v13, 16);
          }
          objc_msgSend(v12, "addPendingRequestContext:forUUID:", v22, v19);
        }
        else
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = objc_opt_class();
          objc_msgSend(v11, "requestIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v26, sel__queue_sendTinkerPairingRequest_syncStore_completion_, CFSTR("Invalid request identifier %@"), v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v22);
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Active device (%@) is not same as the device we want to pair to (%@)."), v6, a1[5]);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(a1[7] + 16))();

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to complete Tinker health sharing because active sync store is nil"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[7] + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

- (void)sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HDNanoSyncManager_sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID_completion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __82__HDNanoSyncManager_sendTinkerEndToEndCloudSyncRequestForNRDeviceUUID_completion___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  HDCodableTinkerEndToEndCloudSyncRequest *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HDRemoteTinkerEndToEndCloudSyncRequestContext *v19;
  void *v20;
  SEL v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v29 = 0;
  v3 = -[HDNanoSyncManager _queue_finishInitializationAfterFirstUnlockIfNecessaryWithError:](v2, &v29);
  v4 = v29;
  if ((v3 & 1) != 0)
  {
    -[HDNanoSyncManager _queue_updateTinkerSyncStore](a1[4]);
    v5 = *(void **)(a1[4] + 104);
    if (v5)
    {
      objc_msgSend(v5, "nanoRegistryUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", a1[5]) & 1) != 0)
      {
        v7 = a1[4];
        v8 = (void *)a1[6];
        v9 = *(id *)(v7 + 104);
        v10 = v8;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v7 + 56));
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(HDCodableTinkerEndToEndCloudSyncRequest);
        objc_msgSend(v11, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableTinkerEndToEndCloudSyncRequest setRequestIdentifier:](v12, "setRequestIdentifier:", v13);

        _HKInitializeLogging();
        v14 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v15 = v14;
          -[HDCodableTinkerEndToEndCloudSyncRequest requestIdentifier](v12, "requestIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v31 = v7;
          v32 = 2114;
          v33 = v16;
          v34 = 2114;
          v35 = v9;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker end to end Cloud Sync request %{public}@, syncStore %{public}@ (#t0)", buf, 0x20u);

        }
        objc_msgSend(v9, "createRequestWithMessageID:", 12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setPbRequest:", v12);
        -[HDCodableTinkerEndToEndCloudSyncRequest requestIdentifier](v12, "requestIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = objc_alloc_init(HDRemoteTinkerEndToEndCloudSyncRequestContext);
          v20 = v19;
          if (v19)
          {
            objc_storeStrong((id *)&v19->_request, v12);
            objc_setProperty_nonatomic_copy(v20, v21, v10, 16);
          }
          objc_msgSend(v9, "addPendingRequestContext:forUUID:", v20, v11);
          objc_msgSend(v17, "setPriority:", 1);
          -[HDNanoSyncManager _queue_sendRequest:syncStore:](v7, v17, (uint64_t)v9);
        }
        else
        {
          v28 = v11;
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = objc_opt_class();
          -[HDCodableTinkerEndToEndCloudSyncRequest requestIdentifier](v12, "requestIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v26, sel__queue_sendTinkerEndToEndCloudSyncRequestWithSyncStore_completion_, CFSTR("Invalid request identifier %@"), v20);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v27);

          v11 = v28;
        }

      }
      else
      {
        v24 = a1[6];
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Active device (%@) is not same as the device we want to pair to (%@)."), v6, a1[5]);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, id))(v24 + 16))(v24, 0, v9);
      }

    }
    else
    {
      v22 = a1[6];
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Unable to complete Tinker end to end Cloud Sync because active sync store is nil"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v22 + 16))(v22, 0, v23);

    }
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (id)_queue_validatedSyncStore:(void *)a3 device:(void *)a4 message:(uint64_t)a5 error:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if ((objc_msgSend(v11, "hasVersion") & 1) == 0)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("Incoming message has no sync version information.");
LABEL_11:
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, v16, v22, v23, v24);
    v14 = 0;
    goto LABEL_12;
  }
  v12 = objc_msgSend(v11, "version");
  v13 = objc_msgSend(v9, "protocolVersion");
  if ((_DWORD)v12 == (_DWORD)v13)
  {
    v14 = v9;
    goto LABEL_12;
  }
  v17 = v13;
  if ((int)v12 > 16 || (int)v12 <= (int)v13)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v23 = v17;
    v24 = 16;
    v22 = v12;
    v16 = CFSTR("Incoming message has unexpected version %d (expected %d, current is %d).");
    goto LABEL_11;
  }
  _HKInitializeLogging();
  v18 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v26 = a1;
    v27 = 1024;
    v28 = v12;
    v29 = 1024;
    v30 = v17;
    v31 = 1024;
    v32 = v12;
    _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Incoming message has sync protocol version %d, but we were only expecting %d. Adjusting expected version to %d", buf, 0x1Eu);
  }
  objc_msgSend(v9, "nanoSyncStoreForProtocolVersion:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");
  v19 = *(void **)(a1 + 120);
  objc_msgSend(v10, "hd_deviceIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, v20);

LABEL_12:
  return v14;
}

void __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDNanoSyncManager _queue_syncStoreForIDSDevice:updateIfNecessary:](v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke_2;
    v13[3] = &unk_1E6CE80E8;
    v6 = *(_QWORD *)(a1 + 56);
    v14 = *(id *)(a1 + 48);
    (*(void (**)(uint64_t, void *, _QWORD *))(v6 + 16))(v6, v5, v13);

  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v9 = v7;
      objc_msgSend(v8, "fromParticipant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "unable to find sync store for request from device %{public}@", buf, 0xCu);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

intptr_t __67__HDNanoSyncManager__syncronouslyHandleIncomingRequest_usingBlock___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_handleOutgoingMessageError:(void *)a3 usingBlock:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    if (v5)
    {
      if (v6)
      {
LABEL_4:
        -[HDNanoSyncManager _logOutgoingMessageError:](a1, v5);
        v8 = *(NSObject **)(a1 + 56);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __60__HDNanoSyncManager__handleOutgoingMessageError_usingBlock___block_invoke;
        block[3] = &unk_1E6CEA160;
        block[4] = a1;
        v12 = v5;
        v13 = v7;
        dispatch_async(v8, block);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleOutgoingMessageError_usingBlock_, a1, CFSTR("HDNanoSyncManager.m"), 1143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

      if (v7)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel__handleOutgoingMessageError_usingBlock_, a1, CFSTR("HDNanoSyncManager.m"), 1144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != NULL"));

    goto LABEL_4;
  }
LABEL_5:

}

- (void)_logOutgoingMessageError:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "hd_messageID");
    v6 = objc_msgSend(v4, "hd_isFromRequest");
    objc_msgSend(v4, "hd_messageIDSIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hd_messageIDSDeviceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v9 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = v9;
      HDNanoSyncMessageIDString(v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 2080;
      v12 = "response";
      v13 = 138544386;
      v14 = v11;
      if (v6)
        v12 = "request";
      v16 = v12;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v4;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@ %s %{public}@ to device %{public}@ error: %{public}@", (uint8_t *)&v13, 0x34u);

    }
  }

}

void __60__HDNanoSyncManager__handleOutgoingMessageError_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = v3;
  if (v2)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_syncStoreForMessageCenterError_, v2, CFSTR("HDNanoSyncManager.m"), 1131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
    objc_msgSend(v4, "hd_messageIDSDeviceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(v2 + 120), "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      goto LABEL_13;
    }
  }
  else
  {

  }
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(void **)(a1 + 40);
    v10 = v8;
    objc_msgSend(v9, "hd_messageIDSIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "unable to find sync store for error from message %{public}@ to device %{public}@", buf, 0x16u);

  }
  v6 = 0;
LABEL_13:

}

- (void)messageCenter:(id)a3 activeDeviceDidChange:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *queue;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  HDNanoSyncManager *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isActive") & 1) == 0)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v16 = v11;
      objc_msgSend(v9, "hd_shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v17;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "IDS bug: active device isActive=NO %{public}@", buf, 0xCu);

    }
  }
  queue = self->_queue;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke;
  v18[3] = &unk_1E6CED498;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v10;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  dispatch_async(queue, v18);

}

void __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v2 + 72))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke_2;
    v5[3] = &unk_1E6CED4C0;
    v3 = *(id *)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = v3;
    v7 = v4;
    v8 = *(id *)(a1 + 56);
    -[HDNanoSyncManager _queue_updateSyncStoresWithCompletion:](v2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __80__HDNanoSyncManager_messageCenter_activeDeviceDidChange_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "hd_deviceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hd_deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v4 && (!v4 || (objc_msgSend(v2, "isEqualToString:", v4) & 1) == 0))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v6;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "unexpected active store %{public}@ after switch to device %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)messageCenterDidReceiveRestoreRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HDNanoSyncManager_messageCenterDidReceiveRestoreRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __59__HDNanoSyncManager_messageCenterDidReceiveRestoreRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  os_signpost_id_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char log;
  NSObject *loga;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id obj;
  _QWORD v54[5];
  id v55;
  id v56;
  _BYTE buf[24];
  void *v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  os_signpost_id_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  v6 = v5;
  if (!v3)
  {

    goto LABEL_34;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (v4)
  {
    if (v6)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_handleRestoreRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 2120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    if (v6)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_handleRestoreRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 2121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

LABEL_4:
  objc_msgSend(v4, "pbRequest");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "activationRestore");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "decodedRestoreUUID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v52, "sequenceNumber");
  objc_msgSend(v4, "fromParticipant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v3, v6, v8, v51, (uint64_t)&v56);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v56;

  if (!v50)
  {
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v4, "idsIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v47;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "ignoring restore request %{public}@: %{public}@", buf, 0x16u);

    }
    goto LABEL_33;
  }
  v9 = _HKLogSignpostIDGenerate();
  _HKInitializeLogging();
  v10 = (void *)*MEMORY[0x1E0CB5370];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5370]))
  {
    v11 = v10;
    v12 = v11;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      objc_msgSend(v4, "idsIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v13;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "nano-sync-restore-request", "request %{public}@", buf, 0xCu);

    }
  }
  +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", v3, CFSTR("ReceiveRestoreRequest"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__31;
  v54[4] = __Block_byref_object_dispose__31;
  v55 = 0;
  obj = 0;
  v15 = v4;
  v16 = v50;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (!*(_BYTE *)(v3 + 8))
  {
    objc_msgSend(v15, "pbRequest");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "decodedPersistentPairingUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "decodedHealthPairingUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (v46)
      {
        objc_msgSend(v21, "activationRestore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v23;
        if (v23)
        {
          if (objc_msgSend(v23, "hasRequiredFields"))
          {
            if (objc_msgSend(v45, "sequenceNumber") == 1)
            {
              if (objc_msgSend(v45, "statusCode") == 3)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &obj, 100, CFSTR("remote requested abort"));
                v24 = v22;
                v17 = 2;
              }
              else
              {
                objc_msgSend(v16, "persistentUUID");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "healthUUID");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (v44
                  && (objc_msgSend(v45, "decodedObliteratedHealthPairingUUIDs"),
                      v32 = (void *)objc_claimAutoreleasedReturnValue(),
                      log = objc_msgSend(v32, "containsObject:", v44),
                      v33 = v32,
                      v24 = v22,
                      v33,
                      (log & 1) != 0))
                {
                  v17 = 4;
                }
                else if (v43 && !objc_msgSend(v43, "isEqual:", v22)
                       || v44 && (objc_msgSend(v44, "isEqual:", v46) & 1) == 0)
                {
                  _HKInitializeLogging();
                  v34 = (void *)*MEMORY[0x1E0CB5370];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
                  {
                    loga = v34;
                    objc_msgSend(v15, "idsIdentifier");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "UUIDString");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "UUIDString");
                    v35 = objc_claimAutoreleasedReturnValue();
                    v24 = v22;
                    *(_DWORD *)buf = 138543874;
                    *(_QWORD *)&buf[4] = v40;
                    *(_WORD *)&buf[12] = 2114;
                    *(_QWORD *)&buf[14] = v39;
                    *(_WORD *)&buf[22] = 2114;
                    v58 = (void *)v35;
                    v38 = (void *)v35;
                    _os_log_impl(&dword_1B7802000, loga, OS_LOG_TYPE_DEFAULT, "received restore message %{public}@ with unknown persistent pairing UUID %{public}@ (expected %{public}@)", buf, 0x20u);

                  }
                  else
                  {
                    v24 = v22;
                  }
                  v17 = 3;
                }
                else
                {
                  v24 = v22;
                  v17 = 1;
                }

              }
              goto LABEL_28;
            }
            v26 = CFSTR("restore request has invalid sequence number");
          }
          else
          {
            v26 = CFSTR("restore request missing required fields");
          }
        }
        else
        {
          v26 = CFSTR("missing restore request content");
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &obj, 100, v26);
        v24 = v22;
        v17 = 0;
LABEL_28:

        goto LABEL_29;
      }
      v25 = CFSTR("missing health UUID");
    }
    else
    {
      v25 = CFSTR("missing persistent UUID");
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &obj, 100, v25);
    v24 = v22;
    v17 = 0;
LABEL_29:

    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &obj, 100, CFSTR("unexpected restore request on master device"));
  v17 = 0;
LABEL_30:

  objc_storeStrong(&v55, obj);
  objc_msgSend(v16, "restoreSession");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == 1)
  {
    objc_msgSend(v16, "beginRestoreSessionWithUUID:timeout:timeoutHandler:", v49, 0, 0.0);
    v28 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v28;
  }
  objc_msgSend(v27, "setSequenceNumber:", v48);
  v29 = *(NSObject **)(v3 + 64);
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke;
  v58 = &unk_1E6CED6E0;
  v59 = v16;
  v30 = v51;
  v67 = v17;
  v60 = v30;
  v61 = v3;
  v62 = v52;
  v63 = v15;
  v66 = v54;
  v64 = v49;
  v65 = v14;
  v68 = v48;
  v69 = v9;
  v31 = v14;
  dispatch_async(v29, buf);

  _Block_object_dispose(v54, 8);
LABEL_33:

LABEL_34:
}

- (void)messageCenterDidReceiveRestoreResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HDNanoSyncManager_messageCenterDidReceiveRestoreResponse___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);

}

void __60__HDNanoSyncManager_messageCenterDidReceiveRestoreResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void (**v18)(void);
  void (**v19)(void);
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void (*v32)(void);
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  __CFString *v45;
  _BYTE aBlock[24];
  void *v47;
  id v48;
  uint64_t v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  v6 = v5;
  if (!v3)
  {
    v13 = v5;
    goto LABEL_34;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (v4)
  {
    if (v6)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_handleRestoreResponse_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 2215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

    if (v6)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_handleRestoreResponse_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 2216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

LABEL_4:
  objc_msgSend(v4, "pbResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activationRestore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodedRestoreUUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sequenceNumber");
  v10 = objc_msgSend(v8, "statusCode");
  objc_msgSend(v6, "restoreSession");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fromParticipant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  -[HDNanoSyncManager _queue_validatedSyncStore:device:message:error:](v3, v6, v12, v7, (uint64_t)&v41);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v41;

  if (v13)
  {
    if (*(_BYTE *)(v3 + 8))
    {
      v14 = v39;
      if (v8)
      {
        if (objc_msgSend(v13, "validatePairingUUIDsWithIncomingMessage:", v7))
        {
          if (objc_msgSend(v8, "hasRequiredFields"))
          {
            if (v40)
            {
              objc_msgSend(v40, "sessionUUID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v39, "isEqual:", v15);

              if ((v16 & 1) != 0)
              {
                *(_QWORD *)aBlock = MEMORY[0x1E0C809B0];
                *(_QWORD *)&aBlock[8] = 3221225472;
                *(_QWORD *)&aBlock[16] = __60__HDNanoSyncManager__queue_handleRestoreResponse_syncStore___block_invoke;
                v47 = &unk_1E6CED708;
                v17 = v4;
                v50 = v10;
                v48 = v17;
                v49 = v9;
                v18 = (void (**)(void))_Block_copy(aBlock);
                v19 = v18;
                switch(v10)
                {
                  case 1:
                    v32 = v18[2];
                    break;
                  case 3:
                    ((void (*)(void (**)(void), uint64_t, const __CFString *))v18[2])(v18, 16, CFSTR("aborting restore"));
                    v24 = CFSTR("abort requested by remote");
LABEL_36:

                    _HKInitializeLogging();
                    v33 = (void *)*MEMORY[0x1E0CB5370];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                    {
                      v36 = v33;
                      objc_msgSend(v17, "idsIdentifier");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v43 = v37;
                      v44 = 2114;
                      v45 = v24;
                      _os_log_error_impl(&dword_1B7802000, v36, OS_LOG_TYPE_ERROR, "aborted restore with message %{public}@: %{public}@", buf, 0x16u);

                    }
                    v23 = v38;
                    v14 = v39;
                    if (!v38)
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, v24);
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                    }
                    -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](v3, v13, v23);
LABEL_26:

                    goto LABEL_33;
                  case 2:
                    ((void (*)(void (**)(void), _QWORD, const __CFString *))v18[2])(v18, 0, CFSTR("finishing restore"));
                    if (v9 == objc_msgSend(v40, "sequenceNumber"))
                    {
                      -[HDNanoSyncManager _queue_transitionToRestoreCompleteWithSyncStore:](v3, v13);
LABEL_31:

                      goto LABEL_32;
                    }
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unxpected finish sequence number %lld (expected %lld)"), v9, objc_msgSend(v40, "sequenceNumber"));
                    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_36;
                  default:
                    v32 = v18[2];
                    break;
                }
                v32();
                goto LABEL_31;
              }
              v25 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v39, "UUIDString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "sessionUUID");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "UUIDString");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "stringWithFormat:", CFSTR("unexpected restore UUID %@ (expected %@)"), v26, v28);
              v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v24 = CFSTR("no active restore session");
            }
          }
          else
          {
            v24 = CFSTR("restore response missing required fields");
          }
        }
        else
        {
          v24 = CFSTR("invalid pairing UUIDs");
        }
      }
      else
      {
        v24 = CFSTR("missing restore response content");
      }
    }
    else
    {
      v24 = CFSTR("unexpected restore response on slave");
      v14 = v39;
    }
    _HKInitializeLogging();
    v29 = (void *)*MEMORY[0x1E0CB5370];
    v23 = v38;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      objc_msgSend(v4, "idsIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)aBlock = 138543618;
      *(_QWORD *)&aBlock[4] = v31;
      *(_WORD *)&aBlock[12] = 2114;
      *(_QWORD *)&aBlock[14] = v24;
      _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "ignoring restore response %{public}@: %{public}@", aBlock, 0x16u);

    }
    goto LABEL_26;
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB5370];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
LABEL_32:
    v23 = v38;
    v14 = v39;
    goto LABEL_33;
  }
  v21 = v20;
  objc_msgSend(v4, "idsIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)aBlock = 138543618;
  *(_QWORD *)&aBlock[4] = v22;
  *(_WORD *)&aBlock[12] = 2114;
  v23 = v38;
  *(_QWORD *)&aBlock[14] = v38;
  _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "ignoring restore response %{public}@: %{public}@", aBlock, 0x16u);

  v14 = v39;
LABEL_33:

LABEL_34:
}

- (void)messageCenterRestoreError:(id)a3
{
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, a3);
}

- (void)messageCenterChangesError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HDNanoSyncManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HDNanoSyncManager_messageCenterChangesError___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);

}

void __47__HDNanoSyncManager_messageCenterChangesError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  os_log_t *v14;
  os_log_t v15;
  NSObject *v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  _BYTE buf[24];
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v29 = a2;
  v4 = objc_msgSend(v3, "hd_isFromRequest");
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v7 = v5;
    v8 = v29;
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
      if (!objc_msgSend(v7, "hd_isResponseTimeout"))
      {
        objc_msgSend(v7, "hd_persistentMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v24 = (void *)*MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
        {
          v25 = v24;
          objc_msgSend(v7, "hd_messageIDSIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "nanoSyncDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v26;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v27;
          _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "resetting anchors for failed change request %{public}@: %{public}@", buf, 0x16u);

        }
        v28 = *(NSObject **)(v6 + 64);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __74__HDNanoSyncManager__queue_changeRequestDidFailToSendWithError_syncStore___block_invoke;
        v31 = &unk_1E6CE7FB8;
        v32 = v6;
        v33 = v23;
        v34 = v8;
        v10 = v23;
        dispatch_async(v28, buf);

        goto LABEL_19;
      }
      _HKInitializeLogging();
      v9 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        objc_msgSend(v7, "hd_messageIDSIdentifier");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v11;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "timeout waiting for response to change request %{public}@", buf, 0xCu);
LABEL_15:

LABEL_19:
      }
    }
  }
  else
  {
    v7 = v5;
    v8 = v29;
    if (v6)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v6 + 56));
      objc_msgSend(v7, "hd_persistentMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "status");
      v10 = objc_claimAutoreleasedReturnValue();
      v13 = -[NSObject statusCode](v10, "statusCode");
      v14 = (os_log_t *)MEMORY[0x1E0CB5370];
      if (v13 == 2 && (objc_msgSend(v8, "needsSyncOnUnlock") & 1) == 0)
      {
        _HKInitializeLogging();
        v15 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          objc_msgSend(v7, "hd_messageIDSIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v17;
          _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "failed to send Resend response %{public}@; will attempt to send at next unlock",
            buf,
            0xCu);

        }
        objc_msgSend(v8, "setNeedsSyncOnUnlock:", 1);
      }
      _HKInitializeLogging();
      v18 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        objc_msgSend(v7, "hd_messageIDSIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "nanoSyncDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v21;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "resetting anchors for failed change request %{public}@: %{public}@", buf, 0x16u);

      }
      v22 = *(NSObject **)(v6 + 64);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __75__HDNanoSyncManager__queue_changeResponseDidFailToSendWithError_syncStore___block_invoke;
      v31 = &unk_1E6CE7FB8;
      v32 = v6;
      v33 = v12;
      v34 = v8;
      v11 = v12;
      dispatch_async(v22, buf);

      goto LABEL_15;
    }
  }

}

- (void)messageCenterDidReceiveAuthorizationRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HDNanoSyncManager_messageCenterDidReceiveAuthorizationRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __65__HDNanoSyncManager_messageCenterDidReceiveAuthorizationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  char *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  _QWORD aBlock[5];
  id v43;
  id v44;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  if (!v3)
    goto LABEL_8;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveAuthorizationRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 4160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    if (v5)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveAuthorizationRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 4161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    goto LABEL_4;
  }
  if (!v5)
    goto LABEL_10;
LABEL_4:
  objc_msgSend(v4, "pbRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke;
  aBlock[3] = &unk_1E6CEDAB0;
  aBlock[4] = v3;
  v8 = v6;
  v43 = v8;
  v9 = v5;
  v44 = v9;
  v10 = _Block_copy(aBlock);
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2;
  v37[3] = &unk_1E6CEDAD8;
  v38 = v4;
  v11 = v8;
  v39 = v11;
  v40 = v3;
  v41 = v9;
  v12 = _Block_copy(v37);
  objc_msgSend(v11, "appBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v31[0] = v7;
    v31[1] = 3221225472;
    v31[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2_678;
    v31[3] = &unk_1E6CEDB00;
    v30 = v4;
    v15 = v13;
    v32 = v15;
    v33 = v3;
    v16 = v10;
    v34 = v16;
    v35 = v12;
    v36 = sel__queue_receiveAuthorizationRequest_syncStore_;
    v28 = v14;
    v17 = _Block_copy(v31);
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    objc_msgSend(WeakRetained, "authorizationManager");
    v29 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "decodedWriteTypes");
    v20 = v12;
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "decodedReadTypes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v15;
    v4 = v30;
    v25 = (id)objc_msgSend(v19, "enqueueAuthorizationRequestForBundleIdentifier:writeTypes:readTypes:authorizationNeededHandler:completion:", v24, v22, v23, v17, v16);

    v10 = v21;
    v12 = v20;

    v5 = v29;
    v14 = v28;

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 0, 0, 0);
  }

LABEL_8:
}

- (void)messageCenterDidReceiveAuthorizationResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HDNanoSyncManager_messageCenterDidReceiveAuthorizationResponse___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);

}

void __66__HDNanoSyncManager_messageCenterDidReceiveAuthorizationResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE buf[32];
  _QWORD *v18;
  id v19;
  id v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    if (v4)
    {
      if (v5)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveAuthorizationResponse_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 4264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

      if (v5)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveAuthorizationResponse_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 4265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

LABEL_4:
    objc_msgSend(v4, "requestPersistentUserInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("auth-identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v5, "pendingRequestContextForUUID:", v7);
    v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v4, "pbResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldPrompt");
    objc_msgSend(v9, "errorDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hostAppName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      *(_WORD *)&buf[18] = 2114;
      *(_QWORD *)&buf[20] = v11;
      _os_log_debug_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEBUG, "Received response to authorization request; host app is %@ and should prompt is %d; error: %{public}@",
        buf,
        0x1Cu);
      if (v11)
        goto LABEL_8;
    }
    else if (v11)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 5, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
      if (v8[2])
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __67__HDNanoSyncManager__queue_receiveAuthorizationResponse_syncStore___block_invoke;
        *(_QWORD *)&buf[24] = &unk_1E6CEDB28;
        v18 = v8;
        v21 = v10;
        v19 = v12;
        v20 = v14;
        HKDispatchAsyncOnGlobalConcurrentQueue();

      }
      goto LABEL_14;
    }
    v14 = 0;
    goto LABEL_11;
  }
LABEL_16:

}

- (void)messageCenterDidReceiveAuthorizationError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HDNanoSyncManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HDNanoSyncManager_messageCenterDidReceiveAuthorizationError___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);

}

void __63__HDNanoSyncManager_messageCenterDidReceiveAuthorizationError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  id v13;
  __int128 buf;
  uint64_t (*v15)(uint64_t);
  void *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hd_isFromRequest"))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v11;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Error sending authorization request: %{public}@", (uint8_t *)&buf, 0xCu);
      }
      objc_msgSend(v4, "hd_persistentUserInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("auth-identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "pendingRequestContextForUUID:", v8);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          if (v9[2])
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v15 = __81__HDNanoSyncManager__queue_authorizationRequestDidFailToSendWithError_syncStore___block_invoke;
            v16 = &unk_1E6CE8080;
            v17 = v9;
            v18 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          if (v10[3])
          {
            v12 = v10;
            v13 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          objc_msgSend(v5, "removePendingRequestContextForUUID:", v8);
        }

      }
    }

  }
}

- (void)messageCenterDidReceiveAuthorizationCompleteRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__HDNanoSyncManager_messageCenterDidReceiveAuthorizationCompleteRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __73__HDNanoSyncManager_messageCenterDidReceiveAuthorizationCompleteRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BYTE buf[24];
  void *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  if (!v3)
    goto LABEL_20;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveAuthorizationCompleteRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 4328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    if (v5)
      goto LABEL_4;
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveAuthorizationCompleteRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 4329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    goto LABEL_4;
  }
  if (!v5)
    goto LABEL_22;
LABEL_4:
  objc_msgSend(v4, "pbRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v6, "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_UUIDWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pendingRequestContextForUUID:", v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "errorDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 5, v11),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v11;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Received authorization error from companion for request UUID: %@; error: %{public}@",
          buf,
          0x16u);
      }
    }
    else
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_debug_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEBUG, "Received authorization complete from companion for request UUID: %@", buf, 0xCu);
      }
      v13 = 0;
    }
    if (v10[3])
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __74__HDNanoSyncManager__queue_receiveAuthorizationCompleteRequest_syncStore___block_invoke;
      v21 = &unk_1E6CE8080;
      v22 = v10;
      v23 = v13;
      HKDispatchAsyncOnGlobalConcurrentQueue();

    }
    else
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5280];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEBUG, "No completion handler found for authorization complete message; dropping.",
          buf,
          2u);
      }
    }
    objc_msgSend(v5, "removePendingRequestContextForUUID:", v9);

  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_debug_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEBUG, "Received authorization complete from companion for request UUID: %@, but no request context was found; dropping",
        buf,
        0xCu);
    }
  }

LABEL_20:
}

- (void)messageCenterDidReceiveRoutineRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HDNanoSyncManager_messageCenterDidReceiveRoutineRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __59__HDNanoSyncManager_messageCenterDidReceiveRoutineRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  id v7;
  HDCodableRoutineResponseMessage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  if (v3)
  {
    v4 = *(NSObject **)(v3 + 56);
    v5 = a2;
    dispatch_assert_queue_V2(v4);
    v6 = v14;
    if (v14)
    {
      if (v5)
      {
LABEL_4:
        v7 = v6;
        v8 = objc_alloc_init(HDCodableRoutineResponseMessage);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("request not supported"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableRoutineResponseMessage setErrorDescription:](v8, "setErrorDescription:", v10);

        objc_msgSend(v7, "response");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setPbResponse:", v8);
        -[HDNanoSyncManager _queue_sendResponse:syncStore:](v3, v11, v5);

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveRoutineRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 3164, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

      v6 = 0;
      if (v5)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveRoutineRequest_syncStore_, v3, CFSTR("HDNanoSyncManager.m"), 3165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    v6 = v14;
    goto LABEL_4;
  }
LABEL_5:

}

- (void)messageCenterDidReceiveStartWorkoutAppRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __67__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  __int128 aBlock;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    objc_msgSend(v4, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
    {
      v13 = v7;
      objc_msgSend(v6, "requestIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(aBlock) = 138412290;
      *(_QWORD *)((char *)&aBlock + 4) = v14;
      _os_log_debug_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEBUG, "Received start workout app request %@", (uint8_t *)&aBlock, 0xCu);

    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__31;
    v15[4] = __Block_byref_object_dispose__31;
    v8 = v4;
    v16 = v8;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 3221225472;
    v18 = __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke;
    v19 = &unk_1E6CED8B8;
    v9 = v6;
    v20 = v9;
    v21 = v8;
    v22 = v3;
    v23 = v5;
    v24 = v15;
    v10 = _Block_copy(&aBlock);
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    objc_msgSend(WeakRetained, "workoutManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "receivedStartWorkoutAppRequest:completion:", v9, v10);

    _Block_object_dispose(v15, 8);
  }

}

- (void)messageCenterDidReceiveStartWorkoutAppResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppResponse___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);

}

void __68__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BYTE v23[24];
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  if (v2)
  {
    v5 = *(NSObject **)(v2 + 56);
    v6 = v3;
    dispatch_assert_queue_V2(v5);
    objc_msgSend(v6, "requestPersistentUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "hasLaunchError"))
    {
      objc_msgSend(v8, "launchError");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorWithCodableError:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    _HKInitializeLogging();
    v11 = (os_log_t *)MEMORY[0x1E0CB5380];
    v12 = (void *)*MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
    {
      v21 = v12;
      objc_msgSend(v8, "requestIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412546;
      *(_QWORD *)&v23[4] = v22;
      *(_WORD *)&v23[12] = 2114;
      *(_QWORD *)&v23[14] = v10;
      _os_log_debug_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEBUG, "Received response to start workout app request %@, error: %{public}@", v23, 0x16u);

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("workout-launch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "pendingRequestContextForUUID:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = *(id *)(v14 + 16);
        v17 = v16;
        if (v16)
        {
          *(_QWORD *)v23 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v23[8] = 3221225472;
          *(_QWORD *)&v23[16] = __69__HDNanoSyncManager__queue_recieveStartWorkoutAppResponse_syncStore___block_invoke;
          v24 = &unk_1E6CEBCA0;
          v27 = v16;
          v25 = v8;
          v26 = v10;
          HKDispatchAsyncOnGlobalConcurrentQueue();

        }
      }
      else
      {
        _HKInitializeLogging();
        v19 = *v11;
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
LABEL_16:

          goto LABEL_17;
        }
        v17 = v19;
        objc_msgSend(v13, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v23 = 138412290;
        *(_QWORD *)&v23[4] = v20;
        _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "Ignoring response: no context for %@", v23, 0xCu);

      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = *v11;
      if (!os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      v15 = v18;
      objc_msgSend(v8, "requestIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)&v23[4] = v17;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_INFO, "Ignoring response: no request identifier for %@", v23, 0xCu);
    }

    goto LABEL_16;
  }
LABEL_18:

}

- (void)messageCenterDidReceiveStartWorkoutAppError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HDNanoSyncManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppError___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);

}

void __65__HDNanoSyncManager_messageCenterDidReceiveStartWorkoutAppError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  __int128 buf;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hd_isFromRequest"))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v14;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
      objc_msgSend(v4, "hd_persistentUserInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("workout-launch"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "pendingRequestContextForUUID:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
        {
          v10 = *(id *)(v8 + 16);
          v11 = v10;
          if (v10)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v16 = __83__HDNanoSyncManager__queue_startWorkoutAppRequestDidFailToSendWithError_syncStore___block_invoke;
            v17 = &unk_1E6CE8C48;
            v19 = v10;
            v18 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          objc_msgSend(v5, "removePendingRequestContextForUUID:", v7);

        }
        else
        {
          _HKInitializeLogging();
          v13 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "Ignoring error: no context for %@", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      else
      {
        _HKInitializeLogging();
        v12 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "Ignoring error: no request identifier", (uint8_t *)&buf, 2u);
        }
      }

    }
  }

}

- (void)messageCenterDidReceiveCompanionUserNotificationRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __77__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  __int128 aBlock;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = a2;
  if (v3)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
    objc_msgSend(v4, "pbRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEBUG))
    {
      v13 = v7;
      objc_msgSend(v6, "requestIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(aBlock) = 138412290;
      *(_QWORD *)((char *)&aBlock + 4) = v14;
      _os_log_debug_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEBUG, "Received display notification request %@", (uint8_t *)&aBlock, 0xCu);

    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__31;
    v15[4] = __Block_byref_object_dispose__31;
    v8 = v4;
    v16 = v8;
    *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
    *((_QWORD *)&aBlock + 1) = 3221225472;
    v18 = __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke;
    v19 = &unk_1E6CED920;
    v9 = v6;
    v20 = v9;
    v21 = v8;
    v22 = v3;
    v23 = v5;
    v24 = v15;
    v10 = _Block_copy(&aBlock);
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 48));
    objc_msgSend(WeakRetained, "notificationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "receivedCompanionUserNotificationRequest:completion:", v9, v10);

    _Block_object_dispose(v15, 8);
  }

}

- (void)messageCenterDidReceiveCompanionUserNotificationResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationResponse___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingResponse:usingBlock:]((uint64_t)self, v5, v6);

}

void __78__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  os_log_t *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  _BYTE v23[24];
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  if (v2)
  {
    v5 = *(NSObject **)(v2 + 56);
    v6 = v3;
    dispatch_assert_queue_V2(v5);
    objc_msgSend(v6, "requestPersistentUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbResponse");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "hasError"))
    {
      objc_msgSend(v8, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorWithCodableError:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    _HKInitializeLogging();
    v11 = (os_log_t *)MEMORY[0x1E0CB5330];
    v12 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEBUG))
    {
      v21 = v12;
      objc_msgSend(v8, "requestIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412546;
      *(_QWORD *)&v23[4] = v22;
      *(_WORD *)&v23[12] = 2112;
      *(_QWORD *)&v23[14] = v10;
      _os_log_debug_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEBUG, "Received response to display notification request %@, error: %@", v23, 0x16u);

    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("companion-user-notification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v4, "pendingRequestContextForUUID:", v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = *(id *)(v14 + 16);
        v17 = v16;
        if (v16)
        {
          *(_QWORD *)v23 = MEMORY[0x1E0C809B0];
          *(_QWORD *)&v23[8] = 3221225472;
          *(_QWORD *)&v23[16] = __79__HDNanoSyncManager__queue_recieveCompanionUserNotificationResponse_syncStore___block_invoke;
          v24 = &unk_1E6CEBCA0;
          v27 = v16;
          v25 = v8;
          v26 = v10;
          HKDispatchAsyncOnGlobalConcurrentQueue();

        }
      }
      else
      {
        _HKInitializeLogging();
        v19 = *v11;
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
LABEL_16:

          goto LABEL_17;
        }
        v17 = v19;
        objc_msgSend(v13, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v23 = 138412290;
        *(_QWORD *)&v23[4] = v20;
        _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_INFO, "Ignoring response: no context for %@", v23, 0xCu);

      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = *v11;
      if (!os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
      {
LABEL_17:

        goto LABEL_18;
      }
      v15 = v18;
      objc_msgSend(v8, "requestIdentifier");
      v17 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v23 = 138412290;
      *(_QWORD *)&v23[4] = v17;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_INFO, "Ignoring response: no request identifier for %@", v23, 0xCu);
    }

    goto LABEL_16;
  }
LABEL_18:

}

- (void)messageCenterDidReceiveCompanionUserNotificationError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HDNanoSyncManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationError___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HDNanoSyncManager _handleOutgoingMessageError:usingBlock:]((uint64_t)self, v5, v6);

}

void __75__HDNanoSyncManager_messageCenterDidReceiveCompanionUserNotificationError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  __int128 buf;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hd_isFromRequest"))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v14;
    if (v3)
    {
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 56));
      objc_msgSend(v4, "hd_persistentUserInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("companion-user-notification"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "pendingRequestContextForUUID:", v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = (void *)v8;
        if (v8)
        {
          v10 = *(id *)(v8 + 16);
          v11 = v10;
          if (v10)
          {
            *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
            *((_QWORD *)&buf + 1) = 3221225472;
            v16 = __93__HDNanoSyncManager__queue_companionUserNotificationRequestDidFailToSendWithError_syncStore___block_invoke;
            v17 = &unk_1E6CE8C48;
            v19 = v10;
            v18 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          objc_msgSend(v5, "removePendingRequestContextForUUID:", v7);

        }
        else
        {
          _HKInitializeLogging();
          v13 = *MEMORY[0x1E0CB5330];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_INFO, "Ignoring error: no context for %@", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      else
      {
        _HKInitializeLogging();
        v12 = *MEMORY[0x1E0CB5330];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "Ignoring error: no request identifier", (uint8_t *)&buf, 2u);
        }
      }

    }
  }

}

- (void)messageCenterDidReceiveNotificationInstructionRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__HDNanoSyncManager_messageCenterDidReceiveNotificationInstructionRequest___block_invoke;
  v6[3] = &unk_1E6CED4E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDNanoSyncManager _handleIncomingRequest:usingBlock:]((uint64_t)self, v5, v6);

}

void __75__HDNanoSyncManager_messageCenterDidReceiveNotificationInstructionRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  id WeakRetained;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  _BYTE v22[24];
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 56));
    objc_msgSend(v2, "pbRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5330];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEBUG))
    {
      v18 = v4;
      v19 = (void *)objc_opt_class();
      v20 = v19;
      objc_msgSend(v3, "requestIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138543618;
      *(_QWORD *)&v22[4] = v19;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v21;
      _os_log_debug_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEBUG, "[%{public}@] Received notification instruction request %@", v22, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fromParticipant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hd_shortDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v2, "fromParticipant");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "deviceIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("Unknown fromParticipant");
      if (v12)
        v14 = (__CFString *)v12;
      v10 = v14;

    }
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
    objc_msgSend(WeakRetained, "notificationSyncManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v22 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v22[8] = 3221225472;
    *(_QWORD *)&v22[16] = __76__HDNanoSyncManager__queue_receiveNotificationInstructionRequest_syncStore___block_invoke;
    v23 = &unk_1E6CEB718;
    v24 = v1;
    v25 = v3;
    v17 = v3;
    objc_msgSend(v16, "nanoSyncManagerDidReceiveNotificationInstructionRequest:receivedDate:sendingDeviceName:completion:", v17, v5, v10, v22);

  }
}

- (void)messageCenterDidReceiveTinkerOptInRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInRequest___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInRequest___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  os_log_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  HDNotificationManager *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  char isKindOfClass;
  HDNotificationManager *v48;
  id v49;
  HDSharedDataOptInNotification *v50;
  void *v51;
  HDSharedDataOptInNotification *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD handler[4];
  id v61;
  id location;
  _BYTE buf[24];
  void *v64;
  __int128 v65;
  id v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)*v2 + 6);
  objc_msgSend(v2[1], "fromParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v5, *v2, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)*v2 + 13);
  *((_QWORD *)*v2 + 13) = v6;

  v8 = *((_QWORD *)*v2 + 13);
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5370];
  v10 = *MEMORY[0x1E0CB5370];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Created _activeTinkerSyncStore for new pairing request %{public}@ (#t0)", buf, 0xCu);
    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 104);
    v15 = *(id *)(a1 + 40);
    v16 = v14;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v13 + 56));
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerOptInRequest_syncStore_, v13, CFSTR("HDNanoSyncManager.m"), 3497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    }
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerOptInRequest_syncStore_, v13, CFSTR("HDNanoSyncManager.m"), 3498, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    }
    objc_msgSend(v15, "pbRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v18 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      objc_msgSend(v17, "requestIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nanoRegistryUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "device");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      v64 = v21;
      LOWORD(v65) = 2114;
      *(_QWORD *)((char *)&v65 + 2) = v22;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker opt in request from guardian %{public}@, active NR device ID %{public}@, active IDS device %{public}@ (#t0)", buf, 0x2Au);

    }
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke;
    v64 = &unk_1E6CED948;
    *(_QWORD *)&v65 = v13;
    v23 = v15;
    *((_QWORD *)&v65 + 1) = v23;
    v24 = v17;
    v66 = v24;
    v25 = v16;
    v67 = v25;
    v26 = _Block_copy(buf);
    v27 = (id *)(v13 + 48);
    v28 = objc_loadWeakRetained((id *)(v13 + 48));
    objc_msgSend(v28, "daemon");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "contentProtectionManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v28) = objc_msgSend(v30, "isProtectedDataAvailable");

    if ((v28 & 1) != 0)
    {
      if ((objc_msgSend(v25, "isAltAccount") & 1) != 0)
      {
        v57 = v26;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v13 + 56));
        v31 = *(void **)(v13 + 112);
        if (v31)
        {
          v32 = (void *)objc_msgSend(v57, "copy");
          v33 = _Block_copy(v32);
          objc_msgSend(v31, "addObject:", v33);

        }
        else
        {
          v40 = objc_alloc(MEMORY[0x1E0C99DE8]);
          v41 = (void *)objc_msgSend(v57, "copy");
          v42 = objc_msgSend(v40, "initWithObjects:", v41, 0);
          v43 = *(void **)(v13 + 112);
          *(_QWORD *)(v13 + 112) = v42;

          objc_initWeak(&location, (id)v13);
          v44 = *(NSObject **)(v13 + 56);
          handler[0] = MEMORY[0x1E0C809B0];
          handler[1] = 3221225472;
          handler[2] = __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke;
          handler[3] = &unk_1E6CE8390;
          objc_copyWeak(&v61, &location);
          notify_register_dispatch((const char *)*MEMORY[0x1E0CB6058], (int *)(v13 + 28), v44, handler);
          v45 = *(NSObject **)(v13 + 56);
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke_2;
          v58[3] = &unk_1E6CE8390;
          objc_copyWeak(&v59, &location);
          notify_register_dispatch((const char *)*MEMORY[0x1E0CB6060], (int *)(v13 + 32), v45, v58);
          objc_destroyWeak(&v59);
          objc_destroyWeak(&v61);
          objc_destroyWeak(&location);
        }

        v46 = objc_loadWeakRetained((id *)(v13 + 48));
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_loadWeakRetained((id *)(v13 + 48));
          objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerOptInRequest_syncStore_, v13, CFSTR("HDNanoSyncManager.m"), 3544, CFSTR("[sharing-setup] Profile %@ is not an instance of type HDPrimaryProfile (#t0)"), v56);

        }
        v48 = [HDNotificationManager alloc];
        v49 = objc_loadWeakRetained(v27);
        v39 = -[HDNotificationManager initWithProfile:bundle:](v48, "initWithProfile:bundle:", v49, 1);

        v50 = [HDSharedDataOptInNotification alloc];
        objc_msgSend(v24, "guardianDisplayName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = -[HDSharedDataOptInNotification initWithNotificationManager:guardianDisplayName:](v50, "initWithNotificationManager:guardianDisplayName:", v39, v51);

        -[HDNanoHealthNotification triggerNotification](v52, "triggerNotification");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Watch is not in Tinker pairing mode, ignoring opt in request: %@"), v23);
        v39 = (HDNotificationManager *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, _QWORD, HDNotificationManager *))v26 + 2))(v26, 0, v39);
      }
    }
    else
    {
      _HKInitializeLogging();
      v38 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(handler[0]) = 0;
        _os_log_error_impl(&dword_1B7802000, v38, OS_LOG_TYPE_ERROR, "[sharing-setup] Apple Watch is locked, sending setup error to guardian (#t0)", (uint8_t *)handler, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 6, CFSTR("Apple Watch needs to be unlocked for sharing setup, ignoring opt in request: %@"), v23);
      v39 = (HDNotificationManager *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, HDNotificationManager *))v26 + 2))(v26, 0, v39);
    }

  }
  else if (v11)
  {
    v34 = *(void **)(a1 + 40);
    v35 = v10;
    objc_msgSend(v34, "fromParticipant");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "description");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v37;
    _os_log_impl(&dword_1B7802000, v35, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for request from device %{public}@ (#t0)", buf, 0xCu);

  }
}

- (void)messageCenterDidReceiveTinkerOptInResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInResponse___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  os_log_t v27;
  os_log_t v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _BYTE buf[24];
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (v3)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v6, *(_QWORD *)(a1 + 32), 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (v3)
  {
LABEL_3:
    v10 = *(void **)(a1 + 40);
    v11 = v3;
    v12 = *(NSObject **)(v2 + 56);
    v13 = v10;
    dispatch_assert_queue_V2(v12);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerOptInResponse_syncStore_, v2, CFSTR("HDNanoSyncManager.m"), 3599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

    }
    objc_msgSend(v13, "requestPersistentUserInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pbResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "hasError"))
    {
      objc_msgSend(v15, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorWithCodableError:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    _HKInitializeLogging();
    v18 = (os_log_t *)MEMORY[0x1E0CB5370];
    v19 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v15, "requestIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2112;
      v37 = v17;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker opt in response from watch %@, error: %@ (#t0)", buf, 0x20u);

    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tinker-optin"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v11, "pendingRequestContextForUUID:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = *(id *)(v23 + 16);
        v26 = v25;
        if (v25)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __65__HDNanoSyncManager__queue_receiveTinkerOptInResponse_syncStore___block_invoke;
          v37 = &unk_1E6CEBCA0;
          v40 = v25;
          v38 = v15;
          v39 = v17;
          HKDispatchAsyncOnGlobalConcurrentQueue();

        }
      }
      else
      {
        _HKInitializeLogging();
        v28 = *v18;
        if (!os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:

          goto LABEL_20;
        }
        v26 = v28;
        objc_msgSend(v22, "UUIDString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no context for %@ (#t0)", buf, 0xCu);

      }
    }
    else
    {
      _HKInitializeLogging();
      v27 = *v18;
      if (!os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        return;
      }
      v24 = v27;
      objc_msgSend(v15, "requestIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no request identifier for %@ (#t0)", buf, 0xCu);
    }

    goto LABEL_19;
  }
  _HKInitializeLogging();
  v30 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v31 = *(void **)(a1 + 40);
    v32 = v30;
    objc_msgSend(v31, "fromParticipant");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v34;
    _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for response from device %{public}@ (#t0)", buf, 0xCu);

  }
}

- (void)messageCenterDidReceiveTinkerOptInError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInError___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __61__HDNanoSyncManager_messageCenterDidReceiveTinkerOptInError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  void *v19;
  id v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hd_isFromRequest"))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 104);
      v4 = *(id *)(a1 + 40);
      v5 = v3;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 138543362;
        *(_QWORD *)&v18[4] = v4;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] Error sending health sharing opt in request %{public}@ (#t0)", v18, 0xCu);
      }
      objc_msgSend(v4, "hd_persistentUserInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tinker-optin"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "pendingRequestContextForUUID:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
        {
          v11 = *(id *)(v9 + 16);
          v12 = v11;
          if (v11)
          {
            *(_QWORD *)v18 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v18[8] = 3221225472;
            *(_QWORD *)&v18[16] = __79__HDNanoSyncManager__queue_tinkerOptInRequestDidFailToSendWithError_syncStore___block_invoke;
            v19 = &unk_1E6CE8C48;
            v21 = v11;
            v20 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          objc_msgSend(v5, "removePendingRequestContextForUUID:", v8);

        }
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 40);
      v15 = v13;
      objc_msgSend(v14, "hd_messageIDSIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2114;
      *(_QWORD *)&v18[14] = v17;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to find sync store for error from message %{public}@ to device %{public}@ (#t0)", v18, 0x16u);

    }
  }
}

- (void)messageCenterDidReceiveTinkerPairingRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingRequest___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __65__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingRequest___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  HDMutableDatabaseTransactionContext *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  HDMutableDatabaseTransactionContext *v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  HDMutableDatabaseTransactionContext *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];
  HDMutableDatabaseTransactionContext *v62;
  _QWORD v63[4];
  id v64;
  uint64_t v65;
  HDMutableDatabaseTransactionContext *v66;
  _QWORD *v67;
  _QWORD v68[4];
  id v69;
  uint64_t v70;
  _QWORD v71[5];
  _QWORD v72[4];
  id v73;
  id v74;
  _QWORD *v75;
  _QWORD v76[5];
  id v77;
  _QWORD v78[5];
  id v79;
  id v80;
  _QWORD aBlock[4];
  id v82;
  id v83;
  uint64_t v84;
  id v85;
  _BYTE buf[24];
  void *v87;
  id v88;
  uint64_t v89;
  id v90;
  _QWORD *v91;
  _QWORD *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)*v2 + 6);
  objc_msgSend(v2[1], "fromParticipant");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v5, *v2, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)*((_QWORD *)*v2 + 13);
  *((_QWORD *)*v2 + 13) = v6;

  v8 = *((_QWORD *)*v2 + 13);
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5370];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Created _activeTinkerSyncStore for new pairing request %{public}@ (#t0)", buf, 0xCu);
    }
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 104);
    v14 = *(id *)(a1 + 40);
    v15 = v13;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 56));
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerPairingRequest_syncStore_, v12, CFSTR("HDNanoSyncManager.m"), 3699, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

    }
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerPairingRequest_syncStore_, v12, CFSTR("HDNanoSyncManager.m"), 3700, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    }
    objc_msgSend(v14, "pbRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v16, "requestIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "nanoRegistryUUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "device");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2114;
      v87 = v21;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Received health sharing request from guardian %{public}@, active NR device ID %{public}@, active IDS device %{public}@ (#t0)", buf, 0x20u);

    }
    v22 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke;
    aBlock[3] = &unk_1E6CED970;
    v23 = v14;
    v82 = v23;
    v24 = v16;
    v83 = v24;
    v84 = v12;
    v25 = v15;
    v85 = v25;
    v26 = _Block_copy(aBlock);
    objc_msgSend(v24, "guardianIcloudIdentifier");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      if ((objc_msgSend(v25, "isAltAccount") & 1) != 0)
      {
        v27 = objc_alloc_init(HDMutableDatabaseTransactionContext);
        v28 = objc_loadWeakRetained((id *)(v12 + 48));
        objc_msgSend(v28, "database");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0;
        objc_msgSend(v29, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", CFSTR("Tinker Setup"), &v80, 600.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v80;

        if (v30)
        {
          -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v27, "addAccessibilityAssertion:", v30);
        }
        else
        {
          _HKInitializeLogging();
          v39 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v56;
            _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Failed to take tinker setup accessibility assertion (#t0): %{public}@", buf, 0x16u);
          }
        }
        v78[0] = 0;
        v78[1] = v78;
        v78[2] = 0x3032000000;
        v78[3] = __Block_byref_object_copy__31;
        v78[4] = __Block_byref_object_dispose__31;
        v79 = 0;
        v76[0] = 0;
        v76[1] = v76;
        v76[2] = 0x3032000000;
        v76[3] = __Block_byref_object_copy__31;
        v76[4] = __Block_byref_object_dispose__31;
        v77 = 0;
        v40 = objc_alloc(MEMORY[0x1E0D29810]);
        v72[0] = v22;
        v72[1] = 3221225472;
        v72[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_628;
        v72[3] = &unk_1E6CED998;
        v74 = v26;
        v75 = v76;
        v55 = v30;
        v73 = v55;
        v41 = (void *)objc_msgSend(v40, "initWithDescription:completion:", CFSTR("Setup Tinker sharing."), v72);
        v42 = *(_QWORD *)(v12 + 56);
        v71[0] = v22;
        v71[1] = 3221225472;
        v71[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_630;
        v71[3] = &unk_1E6CED9C0;
        v71[4] = v12;
        objc_msgSend(v41, "addTaskOnQueue:task:", v42, v71);
        v43 = *(_QWORD *)(v12 + 56);
        v68[0] = v22;
        v68[1] = 3221225472;
        v68[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2;
        v68[3] = &unk_1E6CED9E8;
        v44 = v24;
        v69 = v44;
        v70 = v12;
        objc_msgSend(v41, "addTaskOnQueue:task:", v43, v68);
        v45 = *(_QWORD *)(v12 + 56);
        *(_QWORD *)buf = v22;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_633;
        v87 = &unk_1E6CEDA38;
        v46 = v44;
        v88 = v46;
        v89 = v12;
        v90 = v23;
        v91 = v76;
        v92 = v78;
        objc_msgSend(v41, "addTaskOnQueue:task:", v45, buf);
        v47 = *(_QWORD *)(v12 + 56);
        v63[0] = v22;
        v63[1] = 3221225472;
        v63[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_638;
        v63[3] = &unk_1E6CEDA88;
        v67 = v78;
        v64 = v46;
        v65 = v12;
        v48 = v27;
        v66 = v48;
        objc_msgSend(v41, "addTaskOnQueue:task:", v47, v63);
        v49 = *(_QWORD *)(v12 + 56);
        v61[0] = v22;
        v61[1] = 3221225472;
        v61[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_641;
        v61[3] = &unk_1E6CED9E8;
        v61[4] = v12;
        v38 = v48;
        v62 = v38;
        objc_msgSend(v41, "addTaskOnQueue:task:", v49, v61);
        v50 = *(_QWORD *)(v12 + 56);
        v60[0] = v22;
        v60[1] = 3221225472;
        v60[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_643;
        v60[3] = &unk_1E6CED9C0;
        v60[4] = v12;
        objc_msgSend(v41, "addTaskOnQueue:task:", v50, v60);
        v51 = *(_QWORD *)(v12 + 56);
        v59[0] = v22;
        v59[1] = 3221225472;
        v59[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_645;
        v59[3] = &unk_1E6CED9C0;
        v59[4] = v12;
        objc_msgSend(v41, "addTaskOnQueue:task:", v51, v59);
        v52 = *(_QWORD *)(v12 + 56);
        v58[0] = v22;
        v58[1] = 3221225472;
        v58[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_647;
        v58[3] = &unk_1E6CED9C0;
        v58[4] = v12;
        objc_msgSend(v41, "addTaskOnQueue:task:", v52, v58);
        objc_msgSend(v41, "begin");

        _Block_object_dispose(v76, 8);
        _Block_object_dispose(v78, 8);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Watch is not in Tinker pairing mode, ignoring request: %@"), v23);
        v38 = (HDMutableDatabaseTransactionContext *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, _QWORD, HDMutableDatabaseTransactionContext *))v26 + 2))(v26, 0, v38);
      }
    }
    else
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = objc_opt_class();
      objc_msgSend(v24, "requestIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v36, sel__queue_receiveTinkerPairingRequest_syncStore_, CFSTR("Guardian icloud ID not found %@"), v37);
      v38 = (HDMutableDatabaseTransactionContext *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(void *, _QWORD, HDMutableDatabaseTransactionContext *))v26 + 2))(v26, 0, v38);
    }

  }
  else if (v10)
  {
    v31 = *(void **)(a1 + 40);
    v32 = v9;
    objc_msgSend(v31, "fromParticipant");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v34;
    _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for request from device %{public}@ (#t0)", buf, 0xCu);

  }
}

- (void)messageCenterDidReceiveTinkerPairingResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingResponse___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __66__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  os_log_t *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  os_log_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  _BYTE buf[24];
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (v3)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v6, *(_QWORD *)(a1 + 32), 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (v3)
  {
LABEL_3:
    v10 = *(void **)(a1 + 40);
    v11 = v3;
    v12 = *(NSObject **)(v2 + 56);
    v13 = v10;
    dispatch_assert_queue_V2(v12);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerPairingResponse_syncStore_, v2, CFSTR("HDNanoSyncManager.m"), 3923, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

    }
    objc_msgSend(v13, "requestPersistentUserInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pbResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "hasError"))
    {
      objc_msgSend(v15, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorWithCodableError:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    _HKInitializeLogging();
    v18 = (os_log_t *)MEMORY[0x1E0CB5370];
    v19 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v20 = v19;
      objc_msgSend(v15, "requestIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Received health sharing response from tinker watch %@, error: %@ (#t0)", buf, 0x16u);

    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tinker-pairing"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v11, "pendingRequestContextForUUID:", v22);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = *(id *)(v23 + 16);
        v26 = v25;
        if (v25)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __67__HDNanoSyncManager__queue_receiveTinkerPairingResponse_syncStore___block_invoke;
          v37 = &unk_1E6CEBCA0;
          v40 = v25;
          v38 = v15;
          v39 = v17;
          HKDispatchAsyncOnGlobalConcurrentQueue();

        }
      }
      else
      {
        _HKInitializeLogging();
        v28 = *v18;
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
LABEL_19:

          goto LABEL_20;
        }
        v26 = v28;
        objc_msgSend(v22, "UUIDString");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v29;
        _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no context for %@ (#t0)", buf, 0xCu);

      }
    }
    else
    {
      _HKInitializeLogging();
      v27 = *v18;
      if (!os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        return;
      }
      v24 = v27;
      objc_msgSend(v15, "requestIdentifier");
      v26 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v26;
      _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no request identifier for %@ (#t0)", buf, 0xCu);
    }

    goto LABEL_19;
  }
  _HKInitializeLogging();
  v30 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v31 = *(void **)(a1 + 40);
    v32 = v30;
    objc_msgSend(v31, "fromParticipant");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v34;
    _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for response from device %{public}@ (#t0)", buf, 0xCu);

  }
}

- (void)messageCenterDidReceiveTinkerPairingError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingError___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__HDNanoSyncManager_messageCenterDidReceiveTinkerPairingError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _BYTE v16[24];
  void *v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hd_isFromRequest"))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 104);
      v4 = *(id *)(a1 + 40);
      v5 = v3;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v16 = 138543362;
        *(_QWORD *)&v16[4] = v4;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] Error sending health sharing request %{public}@ (#t0)", v16, 0xCu);
      }
      objc_msgSend(v4, "hd_persistentUserInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tinker-pairing"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "pendingRequestContextForUUID:", v8);
        v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          if (v9[2])
          {
            *(_QWORD *)v16 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v16[8] = 3221225472;
            *(_QWORD *)&v16[16] = __81__HDNanoSyncManager__queue_tinkerPairingRequestDidFailToSendWithError_syncStore___block_invoke;
            v17 = &unk_1E6CE8080;
            v18 = v9;
            v19 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          objc_msgSend(v5, "removePendingRequestContextForUUID:", v8);
        }

      }
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(void **)(a1 + 40);
      v13 = v11;
      objc_msgSend(v12, "hd_messageIDSIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v16 = 138543618;
      *(_QWORD *)&v16[4] = v14;
      *(_WORD *)&v16[12] = 2114;
      *(_QWORD *)&v16[14] = v15;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to find sync store for error from message %{public}@ to device %{public}@ (#t0)", v16, 0x16u);

    }
  }
}

- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncRequest___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __75__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncRequest___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  os_log_t *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  _BYTE buf[24];
  void *v45;
  __int128 v46;
  id v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v4, *(_QWORD *)(a1 + 32), 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v5;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  _HKInitializeLogging();
  v9 = (os_log_t *)MEMORY[0x1E0CB5370];
  v10 = *MEMORY[0x1E0CB5370];
  v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Created _activeTinkerSyncStore for new end to end Cloud Sync request %{public}@ (#t0)", buf, 0xCu);
    }
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(a1 + 40);
    v15 = *(void **)(v14 + 104);
    v16 = v13;
    v17 = v15;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v14 + 56));
    if (v16)
    {
      if (v17)
      {
LABEL_6:
        objc_msgSend(v16, "pbRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _HKInitializeLogging();
        v19 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v20 = v19;
          objc_msgSend(v18, "requestIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "nanoRegistryUUID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "device");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v14;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v21;
          *(_WORD *)&buf[22] = 2114;
          v45 = v22;
          LOWORD(v46) = 2114;
          *(_QWORD *)((char *)&v46 + 2) = v23;
          _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker end to end Cloud Sync request from guardian %{public}@, active NR device ID %{public}@, active IDS device %{public}@ (#t0)", buf, 0x2Au);

        }
        v24 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke;
        v45 = &unk_1E6CED948;
        *(_QWORD *)&v46 = v14;
        v25 = v16;
        *((_QWORD *)&v46 + 1) = v25;
        v26 = v18;
        v47 = v26;
        v27 = v17;
        v48 = v27;
        v28 = _Block_copy(buf);
        if ((objc_msgSend(v27, "isAltAccount") & 1) != 0)
        {
          v29 = v28;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v14 + 56));
          v30 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, 0, 20, 0);
          v31 = objc_loadWeakRetained((id *)(v14 + 48));
          objc_msgSend(v31, "cloudSyncManager");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v42[0] = v24;
          v42[1] = 3221225472;
          v42[2] = __80__HDNanoSyncManager__queue_performSyncForTinkerEndToEndCloudSyncWithCompletion___block_invoke;
          v42[3] = &unk_1E6CE77F0;
          v33 = v29;
          v43 = v33;
          v34 = (id)objc_msgSend(v32, "syncWithContext:completion:", v30, v42);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Watch is not in Tinker pairing mode, ignoring end to end Cloud Sync request: %@"), v25);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(void *, _QWORD, void *))v28 + 2))(v28, 0, v39);

        }
        return;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore_, v14, CFSTR("HDNanoSyncManager.m"), 4020, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request != nil"));

      if (v17)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore_, v14, CFSTR("HDNanoSyncManager.m"), 4021, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncStore != nil"));

    goto LABEL_6;
  }
  if (v11)
  {
    v35 = *(void **)(a1 + 40);
    v36 = v10;
    objc_msgSend(v35, "fromParticipant");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "description");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v38;
    _os_log_impl(&dword_1B7802000, v36, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for end to end Cloud Sync request from device %{public}@ (#t0)", buf, 0xCu);

  }
}

- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logIncomingRequest:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncResponse___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __76__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  os_log_t *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id *v23;
  NSObject *v24;
  NSObject *v25;
  os_log_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _BYTE buf[24];
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (v3)
    goto LABEL_3;
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(*(id *)(a1 + 40), "fromParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDNanoSyncStore nanoSyncStoreWithProfile:device:delegate:tinkerPaired:](HDNanoSyncStore, "nanoSyncStoreWithProfile:device:delegate:tinkerPaired:", WeakRetained, v6, *(_QWORD *)(a1 + 32), 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 104);
  *(_QWORD *)(v8 + 104) = v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  if (v3)
  {
LABEL_3:
    v10 = *(id *)(a1 + 40);
    v11 = *(NSObject **)(v2 + 56);
    v12 = v3;
    dispatch_assert_queue_V2(v11);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_receiveTinkerEndToEndCloudSyncResponse_syncStore_, v2, CFSTR("HDNanoSyncManager.m"), 4075, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response != nil"));

    }
    objc_msgSend(v10, "pbResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hasError"))
    {
      objc_msgSend(v13, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorWithCodableError:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    _HKInitializeLogging();
    v16 = (os_log_t *)MEMORY[0x1E0CB5370];
    v17 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v13, "requestIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v2;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2112;
      v35 = v15;
      _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Did receive Tinker end to end Cloud Sync response from watch %@, error: %@ (#t0)", buf, 0x20u);

    }
    v20 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v13, "requestIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithUUIDString:", v21);

    objc_msgSend(v12, "pendingRequestContextForUUID:", v22);
    v23 = (id *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = v23[2];
      v25 = v24;
      if (v24)
      {
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __77__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncResponse_syncStore___block_invoke;
        v35 = &unk_1E6CEBCA0;
        v38 = v24;
        v36 = v13;
        v37 = v15;
        HKDispatchAsyncOnGlobalConcurrentQueue();

      }
    }
    else
    {
      _HKInitializeLogging();
      v26 = *v16;
      if (!os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        return;
      }
      v25 = v26;
      objc_msgSend(v22, "UUIDString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v27;
      _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ignoring response: no context for %@ (#t0)", buf, 0xCu);

    }
    goto LABEL_16;
  }
  _HKInitializeLogging();
  v28 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v29 = *(void **)(a1 + 40);
    v30 = v28;
    objc_msgSend(v29, "fromParticipant");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "description");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v32;
    _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to create sync store for end to end Cloud Sync response from device %{public}@ (#t0)", buf, 0xCu);

  }
}

- (void)messageCenterDidReceiveTinkerEndToEndCloudSyncError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDNanoSyncManager _logOutgoingMessageError:]((uint64_t)self, v4);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncError___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __73__HDNanoSyncManager_messageCenterDidReceiveTinkerEndToEndCloudSyncError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  _BYTE v18[24];
  void *v19;
  id v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hd_isFromRequest"))
    {
      v2 = *(_QWORD *)(a1 + 32);
      v3 = *(void **)(v2 + 104);
      v4 = *(id *)(a1 + 40);
      v5 = v3;
      dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 56));
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v18 = 138543362;
        *(_QWORD *)&v18[4] = v4;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[sharing-setup] Error sending Tinker end to end Cloud Sync request %{public}@ (#t0)", v18, 0xCu);
      }
      objc_msgSend(v4, "hd_persistentUserInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tinker-optin"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v5, "pendingRequestContextForUUID:", v8);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9)
        {
          v11 = *(id *)(v9 + 16);
          v12 = v11;
          if (v11)
          {
            *(_QWORD *)v18 = MEMORY[0x1E0C809B0];
            *(_QWORD *)&v18[8] = 3221225472;
            *(_QWORD *)&v18[16] = __91__HDNanoSyncManager__queue_tinkerEndToEndCloudSyncRequestDidFailToSendWithError_syncStore___block_invoke;
            v19 = &unk_1E6CE8C48;
            v21 = v11;
            v20 = v4;
            HKDispatchAsyncOnGlobalConcurrentQueue();

          }
          objc_msgSend(v5, "removePendingRequestContextForUUID:", v8);

        }
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void **)(a1 + 40);
      v15 = v13;
      objc_msgSend(v14, "hd_messageIDSIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "hd_messageIDSDeviceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v18 = 138543618;
      *(_QWORD *)&v18[4] = v16;
      *(_WORD *)&v18[12] = 2114;
      *(_QWORD *)&v18[14] = v17;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Unable to find sync store for end to end Cloud Sync error from message %{public}@ to device %{public}@ (#t0)", v18, 0x16u);

    }
  }
}

- (void)_queue_synchronizeWithOptions:(void *)a3 restoreMessagesSentHandler:(void *)a4 targetSyncStore:(void *)a5 reason:(void *)a6 accessibilityAssertion:(void *)a7 completion:
{
  id v13;
  id v14;
  BOOL v16;
  os_log_t *v17;
  os_signpost_id_t v18;
  os_log_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  NSObject *v26;
  id v27;
  void *v28;
  _BOOL4 v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id WeakRetained;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD aBlock[5];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  os_signpost_id_t v63;
  uint64_t v64;
  BOOL v65;
  id v66;
  _QWORD v67[2];
  uint64_t (*v68)(uint64_t);
  void *v69;
  id v70;
  id location;
  _BYTE buf[24];
  void *v73;
  id v74;
  id v75[5];

  v75[2] = *(id *)MEMORY[0x1E0C80C00];
  v54 = a3;
  v13 = a4;
  v56 = a5;
  v55 = a6;
  v14 = a7;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  -[HDNanoSyncManager _queue_updateSyncStores](a1);
  v16 = (a2 & 4) == 0 && *(_BYTE *)(a1 + 8) != 0;
  v66 = 0;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
  if ((objc_msgSend(*(id *)(a1 + 160), "permitSynchronization") & 1) != 0)
  {
    if (v13 || (v13 = *(id *)(a1 + 96)) != 0)
    {
      v17 = (os_log_t *)MEMORY[0x1E0CB5370];
      v18 = _HKLogSignpostIDGenerate();
      _HKInitializeLogging();
      v19 = *v17;
      if (os_signpost_enabled(*v17))
      {
        v20 = v19;
        v21 = v20;
        if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
        {
          _StringFromSyncOptions(a2);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v56;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v22;
          _os_signpost_emit_with_name_impl(&dword_1B7802000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v18, "nano-sync-with-options", "reason=%{public}@ options=%{public}@", buf, 0x16u);

        }
      }
      v23 = objc_msgSend(v13, "restoreState");
      v24 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke;
      aBlock[3] = &unk_1E6CED5D8;
      v65 = v16;
      v61 = v54;
      aBlock[4] = a1;
      v58 = v55;
      v62 = v14;
      v63 = v18;
      v13 = v13;
      v59 = v13;
      v64 = a2;
      v60 = v56;
      v14 = _Block_copy(aBlock);
      v25 = v23 == 3;
      if (v23 != 3 && *(_BYTE *)(a1 + 8))
      {
        if (v23 == 1)
        {
          _HKInitializeLogging();
          v26 = *v17;
          if (os_log_type_enabled(*v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v13;
            _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_INFO, "will attempt restore for paired device %{public}@", buf, 0xCu);
          }
          v27 = v13;
          dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
          if (objc_msgSend(v27, "restoreState") == 1)
          {
            if (!*(_BYTE *)(a1 + 8))
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToRestoreInProgressWithSyncStore_, a1, CFSTR("HDNanoSyncManager.m"), 1757, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_isMaster"));

            }
            objc_msgSend(v27, "persistentUUID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v28 == 0;

            if (v29)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToRestoreInProgressWithSyncStore_, a1, CFSTR("HDNanoSyncManager.m"), 1758, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[syncStore persistentUUID] != nil"));

            }
            +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1, CFSTR("Restore"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v67[0] = v24;
            v67[1] = 3221225472;
            v68 = __71__HDNanoSyncManager__queue_transitionToRestoreInProgressWithSyncStore___block_invoke;
            v69 = &unk_1E6CE77C8;
            v70 = v30;
            v31 = v30;
            v53 = v27;
            v52 = v67;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
            if (objc_msgSend(v53, "restoreState") == 1)
            {
              objc_initWeak(&location, (id)a1);
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)a1, "restoreTimeout");
              v34 = v33;
              *(_QWORD *)buf = v24;
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __61__HDNanoSyncManager__queue_beginRestoreWithStore_completion___block_invoke;
              v73 = &unk_1E6CED650;
              objc_copyWeak(v75, &location);
              v35 = v53;
              v74 = v35;
              objc_msgSend(v35, "beginRestoreSessionWithUUID:timeout:timeoutHandler:", v32, buf, v34);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v50, "sessionUUID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = *(NSObject **)(a1 + 56);
              v38 = v36;
              v39 = v35;
              dispatch_assert_queue_V2(v37);
              +[HDCodableNanoSyncActivationRestore activationRestoreWithRestoreUUID:sequenceNumber:statusCode:](HDCodableNanoSyncActivationRestore, "activationRestoreWithRestoreUUID:sequenceNumber:statusCode:", v38, 1, 2);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v39, "sourceBundleIdentifier");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "setDefaultSourceBundleIdentifier:", v40);

              objc_msgSend(v39, "obliteratedDatabaseUUIDs");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "encodeObliteratedHealthPairingUUIDs:", v41);

              WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
              +[HDIDSOutgoingRequest activationRequestWithRestore:syncStore:profile:](HDIDSOutgoingRequest, "activationRequestWithRestore:syncStore:profile:", v51, v39, WeakRetained);
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              -[HDNanoSyncManager _queue_sendRequest:syncStore:](a1, v43, (uint64_t)v39);
              objc_msgSend(v50, "setSequenceNumber:", 1);
              ((void (*)(_QWORD *, uint64_t, _QWORD))v68)(v52, 1, 0);

              objc_destroyWeak(v75);
              objc_destroyWeak(&location);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Unexpected restore state %ld"), objc_msgSend(v53, "restoreState"));
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (*)(_QWORD *, _QWORD, void *))v68)(v52, 0, v46);

            }
          }

        }
        objc_msgSend(v13, "restoreSession");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addCompletionHandler:", v14);

        v14 = 0;
      }

      v44 = 0;
      v45 = v61;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("no active paired device"));
      v44 = (id)objc_claimAutoreleasedReturnValue();
      v45 = 0;
      v13 = 0;
      v25 = 0;
    }

    if (v14)
      (*((void (**)(id, _BOOL8, id))v14 + 2))(v14, v25, v44);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v66, 100, CFSTR("sync is restricted by PairedSync"));
    v44 = v66;
    if (v14)
      (*((void (**)(id, _QWORD, id))v14 + 2))(v14, 0, v44);
  }

}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD aBlock[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  char v31;

  v5 = a3;
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_2;
  aBlock[3] = &unk_1E6CED560;
  v7 = *(id *)(a1 + 64);
  v31 = *(_BYTE *)(a1 + 96);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v28 = v7;
  aBlock[4] = v8;
  v27 = v9;
  v10 = *(id *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 80);
  v29 = v10;
  v30 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (a2)
  {
    v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_363;
    v19[3] = &unk_1E6CED5B0;
    v15 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 88);
    v20 = v15;
    v25 = v16;
    v17 = *(id *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 32);
    v21 = v17;
    v22 = v18;
    v24 = v13;
    v23 = *(id *)(a1 + 40);
    dispatch_async(v14, v19);

  }
  else
  {
    (*((void (**)(void *, _QWORD, id))v12 + 2))(v12, 0, v5);
  }

}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  const char *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
  if ((_DWORD)a2 && *(_BYTE *)(a1 + 72))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    v9 = *(NSObject **)(v7 + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_3;
    block[3] = &unk_1E6CEA160;
    block[4] = v7;
    v17 = v8;
    v18 = *(id *)(a1 + 56);
    dispatch_async(v9, block);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 56);
    if (v10)
    {
      if (!v5 && (a2 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Sync failed without reporting an error."));
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 56);
      }
      (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, a2, v5);
    }
  }
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5370];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5370]))
  {
    v12 = v11;
    v13 = v12;
    v14 = *(_QWORD *)(a1 + 64);
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v15 = "NO";
      if ((_DWORD)a2)
        v15 = "YES";
      *(_DWORD *)buf = 136315138;
      v20 = v15;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v13, OS_SIGNPOST_INTERVAL_END, v14, "nano-sync-with-options", "success=%s", buf, 0xCu);
    }

  }
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void (**v4)(id, _QWORD, uint64_t);
  id WeakRetained;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 48);
  v3 = *(id *)(a1 + 40);
  v4 = v2;
  if (!v1)
    goto LABEL_18;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 56));
  if (!*(_BYTE *)(v1 + 8))
  {
    if (!v4)
      goto LABEL_18;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("proactive sync is unavailable on this device"));
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v16 = (void *)v15;
    v4[2](v4, 0, v15);

    goto LABEL_18;
  }
  if (!v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isProtectedDataAvailable");

    if ((v7 & 1) == 0)
    {
      if (!v4)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HDNanoSyncManager _queue_eligibleInactiveSyncStores](v1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "device", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[HDNanoSyncManager _queue_performNextProactiveSyncWithRemainingDevices:accessibilityAssertion:completion:](v1, v8, v3, v4);
LABEL_18:

}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_363(uint64_t a1)
{
  HDNanoSyncSession *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HDNanoSyncSession *v14;
  _QWORD v15[5];
  HDNanoSyncSession *v16;
  id v17;
  uint64_t *v18;
  id obj;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v2 = -[HDNanoSyncSession initWithSyncStore:options:reason:delegate:completion:]([HDNanoSyncSession alloc], "initWithSyncStore:options:reason:delegate:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__31;
  v24 = __Block_byref_object_dispose__31;
  v25 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 48));
  v7 = (id *)(v21 + 5);
  obj = (id)v21[5];
  objc_msgSend(v4, "resetNextAnchorsForStore:profile:minimumElapsedTime:error:", v5, v6, &obj, 86400.0);
  objc_storeStrong(v7, obj);

  -[HDSyncSession syncStore](v2, "syncStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "syncStoreIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.nano-sync.%@"), *MEMORY[0x1E0CB76B8], v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 48));
  objc_msgSend(v12, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_369;
  v15[3] = &unk_1E6CED588;
  v15[4] = *(_QWORD *)(a1 + 48);
  v14 = v2;
  v16 = v14;
  v17 = *(id *)(a1 + 56);
  v18 = &v20;
  objc_msgSend(v13, "performBlockWithPowerAssertionIdentifier:transactionName:powerAssertionInterval:block:", v11, CFSTR("NanoSyncSession"), v15, 30.0);

  _Block_object_dispose(&v20, 8);
}

void __135__HDNanoSyncManager__queue_synchronizeWithOptions_restoreMessagesSentHandler_targetSyncStore_reason_accessibilityAssertion_completion___block_invoke_369(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  v5 = a1[6];
  v6 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v3, "performSyncSession:accessibilityAssertion:error:", v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);

}

- (void)_queue_transitionToRestoreIncompleteWithSyncStore:(void *)a3 error:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (v6)
    {
      if (!v5)
        goto LABEL_8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToRestoreIncompleteWithSyncStore_error_, a1, CFSTR("HDNanoSyncManager.m"), 1727, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error != nil"));

      if (!v5)
        goto LABEL_8;
    }
    if (objc_msgSend(v5, "restoreState") != 1)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v10 = v5;
        v11 = 2114;
        v12 = v6;
        _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_INFO, "resetting restore state to incomplete for paired device %{public}@, error: %{public}@", buf, 0x16u);
      }
      objc_msgSend(v5, "finishRestoreSessionWithError:", v6);
    }
  }
LABEL_8:

}

- (void)_queue_transitionToRestoreCompleteWithSyncStore:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  __int128 v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (v3)
    {
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        LODWORD(v8) = 138543362;
        *(_QWORD *)((char *)&v8 + 4) = v3;
        _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "finished restore for paired device %{public}@", (uint8_t *)&v8, 0xCu);
      }
      v5 = v3;
      v6 = *(NSObject **)(a1 + 64);
      *(_QWORD *)&v8 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v8 + 1) = 3221225472;
      v9 = __47__HDNanoSyncManager__resetSyncAnchorsForStore___block_invoke;
      v10 = &unk_1E6CE8080;
      v11 = a1;
      v7 = v5;
      v12 = v7;
      dispatch_async(v6, &v8);

      objc_msgSend(v7, "finishRestoreSessionWithError:", 0);
    }
  }

}

uint64_t __71__HDNanoSyncManager__queue_transitionToRestoreInProgressWithSyncStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __51__HDNanoSyncManager__restoreTimedOutWithSyncStore___block_invoke(uint64_t a1)
{
  id v2;

  if (objc_msgSend(*(id *)(a1 + 32), "restoreState") == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 103, CFSTR("Restore timed out"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    -[HDNanoSyncManager _queue_transitionToRestoreIncompleteWithSyncStore:error:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), v2);

  }
}

- (void)_deviceDidPair:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "did pair notification", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HDNanoSyncManager__deviceDidPair___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __36__HDNanoSyncManager__deviceDidPair___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_updateSyncStores](*(_QWORD *)(a1 + 32));
}

- (void)_deviceDidUnpair:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "did unpair notification", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HDNanoSyncManager__deviceDidUnpair___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __38__HDNanoSyncManager__deviceDidUnpair___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_updateSyncStores](*(_QWORD *)(a1 + 32));
}

- (void)_deviceDidBecomeActive:(id)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEBUG, "did become active notification", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HDNanoSyncManager__deviceDidBecomeActive___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__HDNanoSyncManager__deviceDidBecomeActive___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_generateWatchActivationSamples](*(_QWORD *)(a1 + 32));
  -[HDNanoSyncManager _notifyObserversPairedDevicesChanged:](*(_QWORD *)(a1 + 32), 0);
}

void __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8 && *(_DWORD *)(a1 + 56) < a2)
  {
    objc_msgSend(MEMORY[0x1E0CB6378], "categorySampleWithType:value:startDate:endDate:", *(_QWORD *)(a1 + 32), 1, v7, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v9);
      }
      objc_msgSend(v11, "addObject:", v10);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;

  }
  else
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109634;
      v13[1] = a2;
      v14 = 2112;
      v15 = v9;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "got index %u pairingID %@ and date %@ from getSwitchEventsFromIndex", (uint8_t *)v13, 0x1Cu);
    }
  }

}

void __58__HDNanoSyncManager__queue_generateWatchActivationSamples__block_invoke_398(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v26 = 0;
  +[HDNanoPairingEntity sourceEntityForRegistryUUID:profile:error:](HDNanoPairingEntity, "sourceEntityForRegistryUUID:profile:error:", v5, WeakRetained, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;

  if (v8)
  {
    v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(v10, "dataManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    v12 = objc_msgSend(v11, "insertDataObjects:sourceEntity:deviceEntity:sourceVersion:creationDate:error:", v6, v8, 0, 0, &v25, 2.22507386e-308);
    v13 = v25;

    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    v15 = *MEMORY[0x1E0CB5370];
    if (v12)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = v14;
        v17 = objc_msgSend(v6, "count");
        objc_msgSend(v5, "UUIDString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v28 = v17;
        v29 = 2112;
        v30 = v18;
        _os_log_debug_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEBUG, "inserted %lu activation samples for pairing ID %@", buf, 0x16u);

      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v28 = (uint64_t)v13;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "failed to insert watch activation samples: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    _HKInitializeLogging();
    v19 = (void *)*MEMORY[0x1E0CB5370];
    v20 = *MEMORY[0x1E0CB5370];
    if (v9)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = v19;
        objc_msgSend(v5, "UUIDString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = (uint64_t)v24;
        v29 = 2114;
        v30 = v9;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "failed to get source for watch activation with pairing ID %{public}@: %{public}@", buf, 0x16u);

      }
      v13 = v9;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v19;
        objc_msgSend(v5, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v28 = (uint64_t)v22;
        _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "no source exists for watch activation with pairing ID %{public}@", buf, 0xCu);

      }
      v13 = 0;
    }
  }

}

uint64_t __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __87__HDNanoSyncManager__queue_pairedSyncDidBeginForDevice_messagesSentHandler_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0 && objc_msgSend(v5, "hk_isDatabaseAccessibilityError"))
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "hd_shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "PairedSync for device %{public}@ postponed until unlock", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "setNeedsSyncOnUnlock:", 1);

    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __61__HDNanoSyncManager__queue_beginRestoreWithStore_completion___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _QWORD *WeakRetained;
  _QWORD block[4];
  id v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    v3 = WeakRetained[7];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__HDNanoSyncManager__restoreTimedOutWithSyncStore___block_invoke;
    block[3] = &unk_1E6CE8080;
    v6 = v2;
    v7 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __73__HDNanoSyncManager__syncQueue_prepareForCompanionChangeWithStore_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "resetProvenanceWithError:"))
    return 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "orderedSyncEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v7 = v6;
    v19 = a3;
    v8 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
          v20 = 0;
          v12 = objc_msgSend(v10, "companionDidChangeForProfile:error:", WeakRetained, &v20);
          v13 = v20;

          if ((v12 & 1) == 0)
          {
            _HKInitializeLogging();
            v15 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v26 = v10;
              v27 = 2114;
              v28 = v13;
              _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: failed to apply companion change: %{public}@", buf, 0x16u);
            }
            v16 = v13;
            v17 = v16;
            if (v16)
            {
              if (v19)
                *v19 = objc_retainAutorelease(v16);
              else
                _HKLogDroppedError();
            }

            v14 = 0;
            goto LABEL_21;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v7)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_21:

  return v14;
}

uint64_t __73__HDNanoSyncManager__syncQueue_prepareForCompanionChangeWithStore_error___block_invoke_431(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Companion change requires protected data accessibility."));
  return 0;
}

void __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char *__ptr32 *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id *v21;
  id WeakRetained;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  _QWORD block[4];
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  int8x16_t v63;
  uint64_t v64;
  char v65;
  char v66;
  void *v67;
  id v68;
  _BYTE buf[24];
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "decodedPersistentPairingUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPersistentUUID:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "decodedHealthPairingUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHealthUUID:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v7 = &off_1B7F39000;
  switch(*(_QWORD *)(a1 + 96))
  {
    case 1:
      v10 = *(_QWORD *)(a1 + 48);
      v11 = *(void **)(a1 + 56);
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v16 = *(void **)(v13 + 40);
      v14 = (id *)(v13 + 40);
      v15 = v16;
      v54 = *(id *)(a1 + 64);
      if (v10)
      {
        v8 = *(_QWORD *)(v10 + 64);
        v17 = v12;
        v18 = v11;
        dispatch_assert_queue_V2((dispatch_queue_t)v8);
        objc_msgSend(v17, "persistentUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "defaultSourceBundleIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v8) = 1;
        if (v19 && v20)
        {
          v21 = (id *)(v10 + 48);
          WeakRetained = objc_loadWeakRetained((id *)(v10 + 48));
          objc_msgSend(WeakRetained, "sourceManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = 0;
          LODWORD(v8) = objc_msgSend(v23, "setLocalDeviceSourceUUID:bundleIdentifier:error:", v19, v20, &v68);
          v24 = v68;

          if ((_DWORD)v8)
          {
            v53 = v24;
            v25 = objc_loadWeakRetained(v21);
            objc_msgSend(v25, "daemon");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "behavior");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isAppleInternalInstall");

            if (v28)
            {
              _HKInitializeLogging();
              v29 = (void *)*MEMORY[0x1E0CB5370];
              v7 = &off_1B7F39000;
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
              {
                v30 = v29;
                objc_msgSend(v54, "idsIdentifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v20;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v31;
                _os_log_impl(&dword_1B7802000, v30, OS_LOG_TYPE_INFO, "set local device source bundle identifier to \"%{public}@\" with message %{public}@", buf, 0x16u);

              }
            }
            else
            {
              v7 = &off_1B7F39000;
            }
            v24 = v53;
          }
          else
          {
            _HKInitializeLogging();
            v42 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v24;
              _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "failed to set local device source bundle identifier: %{public}@", buf, 0xCu);
            }
            v43 = v24;
            v44 = v43;
            v7 = &off_1B7F39000;
            if (v43)
              v15 = objc_retainAutorelease(v43);

          }
          v6 = MEMORY[0x1E0C809B0];
        }

      }
      else
      {
        LOBYTE(v8) = 0;
      }

      v41 = v14;
      v40 = v15;
      goto LABEL_24;
    case 2:
    case 4:
      LOBYTE(v8) = 0;
      v9 = 1;
      break;
    case 3:
      v8 = *(_QWORD *)(a1 + 48);
      v32 = *(void **)(a1 + 32);
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v35 = *(void **)(v33 + 40);
      v34 = (id *)(v33 + 40);
      v67 = v35;
      v36 = v32;
      if (v8)
      {
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 64));
        v37 = objc_loadWeakRetained((id *)(v8 + 48));
        objc_msgSend(v37, "database");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v6;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __73__HDNanoSyncManager__syncQueue_prepareForCompanionChangeWithStore_error___block_invoke;
        v70 = &unk_1E6CE7950;
        v71 = v36;
        v72 = v8;
        LOBYTE(v8) = objc_msgSend(v38, "performTransactionWithContext:error:block:inaccessibilityHandler:", v39, &v67, buf, &__block_literal_global_433);

      }
      v40 = v67;
      v41 = v34;
LABEL_24:
      objc_storeStrong(v41, v40);
      v9 = v8 ^ 1;
      break;
    default:
      v9 = 0;
      LOBYTE(v8) = 0;
      break;
  }
  v45 = *(void **)(a1 + 56);
  v46 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
  block[0] = v6;
  block[1] = *((_QWORD *)v7 + 174);
  block[2] = __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke_2;
  block[3] = &unk_1E6CED6B8;
  v47 = v45;
  v65 = v8;
  v48 = *(_QWORD *)(a1 + 48);
  v56 = v47;
  v57 = v48;
  v58 = *(id *)(a1 + 32);
  v66 = v9;
  v49 = *(id *)(a1 + 64);
  v50 = *(_QWORD *)(a1 + 88);
  v59 = v49;
  v62 = v50;
  v60 = *(id *)(a1 + 72);
  v63 = vextq_s8(*(int8x16_t *)(a1 + 96), *(int8x16_t *)(a1 + 96), 8uLL);
  v51 = *(id *)(a1 + 80);
  v52 = *(_QWORD *)(a1 + 112);
  v61 = v51;
  v64 = v52;
  dispatch_async(v46, block);

}

void __59__HDNanoSyncManager__queue_handleRestoreRequest_syncStore___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  os_log_t *v4;
  int v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  os_log_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  os_log_t v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  _BYTE v37[18];
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
  v3 = objc_msgSend(*(id *)(a1 + 32), "statusCode");
  v4 = (os_log_t *)MEMORY[0x1E0CB5370];
  if (*(_BYTE *)(a1 + 112))
  {
    if (v2 == 2)
      -[HDNanoSyncManager _queue_transitionToRestoreCompleteWithSyncStore:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    v5 = *(unsigned __int8 *)(a1 + 113);
    _HKInitializeLogging();
    v6 = *v4;
    v7 = *v4;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v29 = *(void **)(a1 + 48);
        v30 = v6;
        objc_msgSend(v29, "restoreSession");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sessionUUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "idsIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
        v36 = 138543874;
        *(_QWORD *)v37 = v33;
        *(_WORD *)&v37[8] = 2114;
        *(_QWORD *)&v37[10] = v34;
        v38 = 2114;
        v39 = v35;
        _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "aborting restore %{public}@ after message %{public}@: %{public}@", (uint8_t *)&v36, 0x20u);

      }
      v3 = 3;
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 56);
      v9 = v6;
      objc_msgSend(v8, "idsIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v36 = 138543618;
      *(_QWORD *)v37 = v10;
      *(_WORD *)&v37[8] = 2114;
      *(_QWORD *)&v37[10] = v11;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "unhandled restore message %{public}@: %{public}@", (uint8_t *)&v36, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 56), "response");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCodableNanoSyncActivationRestore activationRestoreWithRestoreUUID:sequenceNumber:statusCode:](HDCodableNanoSyncActivationRestore, "activationRestoreWithRestoreUUID:sequenceNumber:statusCode:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  if (v14)
    WeakRetained = objc_loadWeakRetained((id *)(v14 + 48));
  else
    WeakRetained = 0;
  objc_msgSend(v12, "configureWithActivationRestore:syncStore:profile:", v13, v15, WeakRetained);

  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 40), v12, *(void **)(a1 + 48));
  if (*(_QWORD *)(a1 + 96) == 4)
  {
    _HKInitializeLogging();
    v17 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 56);
      v19 = v17;
      objc_msgSend(v18, "idsIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543362;
      *(_QWORD *)v37 = v20;
      _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "obliterating in response to restore message %{public}@", (uint8_t *)&v36, 0xCu);

    }
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      v22 = objc_loadWeakRetained((id *)(v21 + 48));
    else
      v22 = 0;
    objc_msgSend(v22, "obliterateAndTerminateWithOptions:reason:completion:", 1, CFSTR("Requested by NanoSync remote"), 0);

  }
  objc_msgSend(*(id *)(a1 + 72), "invalidate");
  _HKInitializeLogging();
  v23 = *v4;
  if (os_signpost_enabled(*v4))
  {
    v24 = v23;
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 104);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      v27 = *(unsigned __int8 *)(a1 + 112);
      v28 = *(_QWORD *)(a1 + 96);
      v36 = 67109376;
      *(_DWORD *)v37 = v27;
      *(_WORD *)&v37[4] = 2048;
      *(_QWORD *)&v37[6] = v28;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v25, OS_SIGNPOST_INTERVAL_END, v26, "nano-sync-restore-request", "didApply=%d action=%ld", (uint8_t *)&v36, 0x12u);
    }

  }
}

void __60__HDNanoSyncManager__queue_handleRestoreResponse_syncStore___block_invoke(uint64_t a1, os_log_type_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], a2))
  {
    v7 = *(void **)(a1 + 32);
    v8 = v6;
    objc_msgSend(v7, "idsIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_DWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 138413058;
    v13 = v5;
    v14 = 2114;
    v15 = v9;
    v16 = 1024;
    v17 = v10;
    v18 = 2048;
    v19 = v11;
    _os_log_impl(&dword_1B7802000, v8, a2, "%@ with response %{public}@ statusCode:%d seq:%lld", (uint8_t *)&v12, 0x26u);

  }
}

- (void)persistChildIdentityFromCodable:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  id WeakRetained;
  void *v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "hasCurrentSyncIdentity"))
  {
    objc_msgSend(v3, "currentSyncIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v4, &v18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v18;

    if (v5)
      v7 = 1;
    else
      v7 = v6 == 0;
    if (v7)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(WeakRetained, "database");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v6;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __53__HDNanoSyncManager_persistChildIdentityFromCodable___block_invoke;
      v15[3] = &unk_1E6CE7950;
      v15[4] = a1;
      v16 = v5;
      v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncIdentityEntity, "performWriteTransactionWithHealthDatabase:error:block:", v9, &v17, v15);
      v11 = v17;

      if (!v10)
      {
        _HKInitializeLogging();
        v12 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v11;
          _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Could not persist child sync identity from HDCodableNanoSyncMessage, %{public}@", buf, 0xCu);
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v13 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "Could not extract sync identity from HDCodableNanoSyncMessage, %@", buf, 0xCu);
      }
      v11 = v6;
    }

  }
}

uint64_t __53__HDNanoSyncManager_persistChildIdentityFromCodable___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 48));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "syncIdentityManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "concreteIdentityForIdentity:shouldCreate:transaction:error:", *(_QWORD *)(a1 + 40), 1, v5, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isChild") & 1) != 0)
  {
    v10 = v9 != 0;
  }
  else
  {
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(v11, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "analyticsSubmissionCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cloudSync_newChildAdded:", 1);

    v14 = *(_QWORD *)(a1 + 32);
    if (v14)
      v15 = objc_loadWeakRetained((id *)(v14 + 48));
    else
      v15 = 0;
    objc_msgSend(v15, "syncIdentityManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v16, "updateIsChild:concreteIdentity:error:", 1, v9, a3);

  }
  return v10;
}

void __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  HDMutableDatabaseTransactionContext *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  char v20;
  NSObject *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  int v55;
  _QWORD v56[3];
  char v57;
  _QWORD v58[3];
  char v59;
  id v60;
  uint8_t buf[4];
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  v57 = 0;
  if (*(_QWORD *)(a1 + 104) == 1)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    -[HDMutableDatabaseTransactionContext setCacheScope:](v4, "setCacheScope:", 1);
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_msgSend(v5, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_2;
    v43[3] = &unk_1E6CED758;
    v44 = *(id *)(a1 + 40);
    v45 = v32;
    v46 = *(id *)(a1 + 48);
    v7 = v3;
    v47 = v7;
    v8 = *(id *)(a1 + 56);
    v52 = *(_QWORD *)(a1 + 96);
    v9 = *(_QWORD *)(a1 + 32);
    v48 = v8;
    v49 = v9;
    v50 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 72);
    v55 = *(_DWORD *)(a1 + 112);
    v51 = v10;
    v53 = v58;
    v54 = v56;
    objc_msgSend(v6, "performWithTransactionContext:error:block:", v4, 0, v43);

  }
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(a1 + 48);
  v13 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  v14 = *(id *)(a1 + 56);
  v15 = v12;
  if (v11
    && (dispatch_assert_queue_V2(*(dispatch_queue_t *)(v11 + 64)), objc_msgSend(v14, "expectsResponse")))
  {
    +[HDCodableNanoSyncStatus statusWithStatusCode:](HDCodableNanoSyncStatus, "statusWithStatusCode:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id *)(v11 + 48);
    v18 = objc_loadWeakRetained((id *)(v11 + 48));
    objc_msgSend(v18, "syncEngine");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 0;
    v20 = objc_msgSend(v19, "getReceivedAnchorMap:forStore:error:", v16, v15, &v60);
    v31 = v60;

    if ((v20 & 1) == 0)
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v62 = v31;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "failed to get received anchors: %{public}@", buf, 0xCu);
      }
      objc_msgSend(v16, "clearAnchors", v31);
      objc_msgSend(v16, "setStatusCode:", 0);
    }
    v22 = objc_loadWeakRetained(v17);
    objc_msgSend(v22, "daemon");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "analyticsSubmissionCoordinator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v16, "statusCode");
    v26 = objc_loadWeakRetained(v17);
    objc_msgSend(v24, "nanoSync_reportResponseStatusCode:profileType:", v25, objc_msgSend(v26, "profileType"));

    objc_msgSend(v14, "response");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_loadWeakRetained(v17);
    objc_msgSend(v27, "configureWithStatus:syncStore:profile:", v16, v15, v28);

  }
  else
  {
    v27 = 0;
  }

  v29 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_485;
  block[3] = &unk_1E6CED780;
  v34 = *(id *)(a1 + 56);
  v35 = *(id *)(a1 + 48);
  v36 = *(id *)(a1 + 40);
  v37 = v27;
  v38 = *(_QWORD *)(a1 + 32);
  v41 = v58;
  v42 = v56;
  v39 = *(id *)(a1 + 80);
  v40 = *(id *)(a1 + 88);
  v30 = v27;
  dispatch_async(v29, block);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);

}

uint64_t __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  uint64_t j;
  void *v23;
  id WeakRetained;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char v31;
  id v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46[5];
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[4];
  id v58;
  id v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "changes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v54;
    v6 = (void *)MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
        v46[1] = v6;
        v46[2] = (id)3221225472;
        v46[3] = __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_3;
        v46[4] = &unk_1E6CED730;
        v47 = *(id *)(a1 + 40);
        v48 = v8;
        v49 = *(id *)(a1 + 48);
        v50 = *(id *)(a1 + 56);
        v9 = *(id *)(a1 + 64);
        v10 = *(_QWORD *)(a1 + 96);
        v51 = v9;
        v52 = v10;
        HKWithAutoreleasePool();

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v4);
  }

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v12 = *(_QWORD *)(a1 + 72);
    v11 = *(void **)(a1 + 80);
    v13 = *(void **)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = v11;
    v16 = v13;
    if (!v12)
    {
LABEL_29:

      goto LABEL_30;
    }
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v12 + 64));
    if (v14)
    {
      if (v16)
      {
LABEL_12:
        if (*(_BYTE *)(v12 + 8) && objc_msgSend(v14, "count") && objc_msgSend(v15, "count"))
        {
          v44 = v12;
          v42 = v15;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v43 = v14;
          v17 = v14;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v62;
            v21 = (id *)(v12 + 48);
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v62 != v20)
                  objc_enumerationMutation(v17);
                v23 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
                WeakRetained = objc_loadWeakRetained(v21);
                v25 = objc_msgSend(v23, "syncEntityClassForProfile:", WeakRetained);

                if (objc_msgSend(v16, "supportsSpeculativeChangesForSyncEntityClass:", v25))
                {
                  objc_msgSend(v23, "speculativeCopy");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v26)
                    objc_msgSend(v45, "addObject:", v26);

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
            }
            while (v19);
          }

          v15 = v42;
          if (objc_msgSend(v45, "count"))
          {
            v27 = *(NSObject **)(v44 + 56);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __119__HDNanoSyncManager__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore___block_invoke;
            block[3] = &unk_1E6CE7FB8;
            v58 = v42;
            v59 = v45;
            v60 = v44;
            dispatch_async(v27, block);

          }
          v14 = v43;
        }
        goto LABEL_29;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore_, v12, CFSTR("HDNanoSyncManager.m"), 2966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changes != nil"));

      if (v16)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore_, v12, CFSTR("HDNanoSyncManager.m"), 2967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originSyncStore != nil"));

    goto LABEL_12;
  }
LABEL_30:
  v28 = *(_QWORD *)(a1 + 88);
  if (v28)
  {
    v29 = *(void **)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    v46[0] = 0;
    v31 = objc_msgSend(v29, "applyAcknowledgedAnchorMap:forStore:resetNext:resetInvalid:error:", v28, v30, 1, 1, v46);
    v32 = v46[0];
    if ((v31 & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v36 = *(void **)(a1 + 64);
        v37 = v35;
        objc_msgSend(v36, "idsIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v67 = v38;
        v68 = 2114;
        v69 = v32;
        _os_log_error_impl(&dword_1B7802000, v37, OS_LOG_TYPE_ERROR, "failed to apply acknowledged anchors for request %{public}@: %{public}@", buf, 0x16u);

      }
      goto LABEL_39;
    }
    v33 = *(_DWORD *)(a1 + 120);
    if (v33 == 5)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    }
    else
    {
      if (v33 != 4)
      {
LABEL_39:

        return 1;
      }
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    }
    *(_BYTE *)(v34 + 24) = 1;
    goto LABEL_39;
  }
  return 1;
}

uint64_t __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;
  void *v7;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v13 = 0;
  v5 = objc_msgSend(v2, "applySyncChange:forStore:error:", v3, v4, &v13);
  v6 = v13;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v9 = *(void **)(a1 + 64);
      v10 = v7;
      objc_msgSend(v9, "idsIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "nanoSyncDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v11;
      v16 = 2114;
      v17 = v12;
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "failed to apply request %{public}@ change %{public}@: %{public}@", buf, 0x20u);

    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 2;
  }

  return 1;
}

uint64_t __70__HDNanoSyncManager__queue_receiveChangeRequest_syncStore_completion___block_invoke_485(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __CFString *v4;

  if (objc_msgSend(*(id *)(a1 + 32), "messageID") == 2)
    objc_msgSend(*(id *)(a1 + 40), "didReceiveRequestWithChangeSet:", *(_QWORD *)(a1 + 48));
  v2 = *(void **)(a1 + 56);
  if (v2)
    -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 64), v2, *(void **)(a1 + 40));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      v3 = 10;
    else
      v3 = 8;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      v4 = CFSTR("Remote requested last chance sync");
    else
      v4 = CFSTR("Remote requested sync");
    -[HDNanoSyncManager _queue_syncImmediatelyWithReason:options:accessibilityAssertion:completion:](*(_QWORD *)(a1 + 64), v4, v3, 0, 0);
  }
  objc_msgSend(*(id *)(a1 + 72), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
}

void __74__HDNanoSyncManager__queue_changeRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAnchorsWithFailedChanges:store:", v4, *(_QWORD *)(a1 + 48));

}

void __75__HDNanoSyncManager__queue_changeResponseDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "changeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetAnchorsWithFailedChanges:store:", v4, *(_QWORD *)(a1 + 48));

}

void __96__HDNanoSyncManager__queue_syncImmediatelyWithReason_options_accessibilityAssertion_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  double v6;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "daemon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "analyticsSubmissionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v13 = objc_msgSend(v12, "profileType");
  if ((_DWORD)a2)
    objc_msgSend(v9, "nanoSync_reportSyncSuccessWithReason:options:duration:profileType:", v11, v10, v13, v6);
  else
    objc_msgSend(v9, "nanoSync_reportSyncFailureWithReason:options:duration:profileType:error:", v11, v10, v13, v5, v6);

  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 64);
    v18 = v14;
    _StringFromSyncOptions(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413314;
    v21 = v16;
    v22 = 2048;
    v23 = v6;
    v24 = 2112;
    v25 = v19;
    v26 = 1024;
    v27 = a2;
    v28 = 2114;
    v29 = v5;
    _os_log_debug_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEBUG, "Finished sync (%@) in %lfs options='%@' success=%d error=%{public}@", (uint8_t *)&v20, 0x30u);

  }
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v5);

}

- (void)_queue_performNextProactiveSyncWithRemainingDevices:(void *)a3 accessibilityAssertion:(void *)a4 completion:
{
  id v7;
  id v8;
  id v9;
  os_log_t *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    if (objc_msgSend(v7, "count"))
    {
      _HKInitializeLogging();
      v10 = (os_log_t *)MEMORY[0x1E0CB5370];
      v11 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
      {
        v12 = v11;
        *(_DWORD *)buf = 134217984;
        v27 = objc_msgSend(v7, "count");
        _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_INFO, "performing proactive sync with %lu remaining device(s)", buf, 0xCu);

      }
      objc_msgSend(v7, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", 0);
      v14 = *(void **)(a1 + 120);
      objc_msgSend(v13, "hd_deviceIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && (objc_msgSend(v16, "isActive") & 1) == 0 && objc_msgSend(v16, "isRestoreComplete"))
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke;
        v20[3] = &unk_1E6CED820;
        v21 = v16;
        v22 = a1;
        v23 = v7;
        v24 = v8;
        v25 = v9;
        -[HDNanoSyncManager _queue_synchronizeWithOptions:restoreMessagesSentHandler:targetSyncStore:reason:accessibilityAssertion:completion:](a1, 4, 0, v21, CFSTR("proactive sync"), v24, v20);

      }
      else
      {
        _HKInitializeLogging();
        v17 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          objc_msgSend(v13, "hd_shortDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = (uint64_t)v16;
          v28 = 2114;
          v29 = v19;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "skipping proactive sync for store %{public}@ for device \"%{public}@\", buf, 0x16u);

        }
        -[HDNanoSyncManager _queue_performNextProactiveSyncWithRemainingDevices:accessibilityAssertion:completion:](a1, v7, v8, v9);
      }

    }
    else if (v9)
    {
      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 1, 0);
    }
  }

}

void __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "failed proactive sync for store %{public}@: %{public}@", buf, 0x16u);
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v9 = *(NSObject **)(v7 + 56);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke_516;
  v11[3] = &unk_1E6CE7E08;
  v11[4] = v7;
  v12 = v8;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  dispatch_async(v9, v11);

}

uint64_t __107__HDNanoSyncManager__queue_performNextProactiveSyncWithRemainingDevices_accessibilityAssertion_completion___block_invoke_516(_QWORD *a1)
{
  return -[HDNanoSyncManager _queue_performNextProactiveSyncWithRemainingDevices:accessibilityAssertion:completion:](a1[4], a1[5], a1[6], a1[7]);
}

void __119__HDNanoSyncManager__syncQueue_forwardSpeculativeChangeSetIfNecessaryForChanges_destinationSyncStores_originSyncStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  HDCodableNanoSyncChangeSet *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  HDCodableNanoSyncChangeSet *v17;
  id v18;
  int v19;
  id v20;
  id v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE buf[12];
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = *(id *)(a1 + 32);
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v2;
        v3 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v2);
        v4 = objc_alloc_init(HDCodableNanoSyncChangeSet);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v5 = *(id *)(a1 + 40);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v28 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
              WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 48));
              v12 = objc_msgSend(v10, "syncEntityClassForProfile:", WeakRetained);

              if (objc_msgSend(v3, "supportsSpeculativeChangesForSyncEntityClass:", v12))
                -[HDCodableNanoSyncChangeSet addChanges:](v4, "addChanges:", v10);
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
          }
          while (v7);
        }

        if (-[HDCodableNanoSyncChangeSet changesCount](v4, "changesCount"))
        {
          _HKInitializeLogging();
          v13 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
          {
            v14 = v13;
            -[HDCodableNanoSyncChangeSet nanoSyncDescription](v4, "nanoSyncDescription");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v15;
            v36 = 2114;
            v37 = v3;
            _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "forwarding speculative change set %{public}@ to %{public}@", buf, 0x16u);

          }
          v16 = *(_QWORD *)(a1 + 48);
          v17 = v4;
          v18 = v3;
          if (v16)
          {
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v16 + 56));
            *(_QWORD *)buf = 0;
            v19 = -[HDNanoSyncManager _queue_isRestoreCompleteForSyncStore:error:](v16, v18, (uint64_t)buf);
            v20 = *(id *)buf;
            if (v17 && v19)
            {
              v21 = objc_loadWeakRetained((id *)(v16 + 48));
              +[HDIDSOutgoingRequest speculativeChangeRequestWithChangeSet:syncStore:profile:](HDIDSOutgoingRequest, "speculativeChangeRequestWithChangeSet:syncStore:profile:", v17, v18, v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v22, "setNonWaking:", 1);
              -[HDNanoSyncManager _queue_sendRequest:syncStore:](v16, v22, (uint64_t)v18);

            }
          }

        }
        v2 = v26 + 1;
      }
      while (v26 + 1 != v25);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v25);
  }

}

void __47__HDNanoSyncManager__resetSyncAnchorsForStore___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetStore:", *(_QWORD *)(a1 + 40));

}

- (void)_userCharacteristicsDidChange:(id)a3
{
  if (self)
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, CFSTR("user characteristics changed"), 0);
}

- (void)_userPreferencesDidChange:(id)a3
{
  if (self)
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, CFSTR("user preferences changed"), 0);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  if (self)
    -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, CFSTR("samples of observed types were added"), 0);
}

- (void)_watchOffWristNotification:(id)a3
{
  -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, CFSTR("watch off wrist"), 2);
}

void __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke_2;
  block[3] = &unk_1E6CECE78;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "removeExpiredIncomingSyncObservers");

}

void __82__HDNanoSyncManager__queue_waitForLastChanceSyncWithPairingID_timeout_completion___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "error occurred during last-chance sync request: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }

}

- (void)_sendFinalStatusMessageForSyncSession:(char)a3 didFinishSuccessfully:(void *)a4 error:
{
  id v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v9 = *(NSObject **)(a1 + 64);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __87__HDNanoSyncManager__sendFinalStatusMessageForSyncSession_didFinishSuccessfully_error___block_invoke;
    v10[3] = &unk_1E6CEDB28;
    v11 = v7;
    v12 = a1;
    v14 = a3;
    v13 = v8;
    dispatch_async(v9, v10);

  }
}

void __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v18 = CFSTR("with response");
    if (!v5)
      v18 = CFSTR("with nil response");
    *(_DWORD *)buf = 138412546;
    v26 = v18;
    v27 = 2114;
    v28 = v6;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "Start workout app request complete %@, error: %{public}@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestIdentifier:", v8);

  if (v6)
  {
    objc_msgSend(v6, "hk_codableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLaunchError:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPbResponse:", v5);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke_574;
  block[3] = &unk_1E6CED890;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v20 = v12;
  v21 = v13;
  v22 = v10;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 64);
  v23 = v15;
  v24 = v16;
  v17 = v10;
  dispatch_async(v11, block);

}

void __68__HDNanoSyncManager__queue_recieveStartWorkoutAppRequest_syncStore___block_invoke_574(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEBUG))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v2;
    objc_msgSend(v5, "requestIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "Sending response to start app request %@", (uint8_t *)&v8, 0xCu);

  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __69__HDNanoSyncManager__queue_recieveStartWorkoutAppResponse_syncStore___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __83__HDNanoSyncManager__queue_startWorkoutAppRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __86__HDNanoSyncManager__queue_sendCompanionUserNotificationRequest_syncStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!a2)
  {
    if (v4)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5330];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_ERROR))
      {
        v7 = 138412290;
        v8 = v5;
        _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Request to display companion user notification failed: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }

}

void __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  const __CFString *v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEBUG))
  {
    v18 = CFSTR("with response");
    if (!v5)
      v18 = CFSTR("with nil response");
    *(_DWORD *)buf = 138412546;
    v26 = v18;
    v27 = 2112;
    v28 = v6;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "Display notification request complete %@, error: %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequestIdentifier:", v8);

  if (v6)
  {
    objc_msgSend(v6, "hk_codableError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setError:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPbResponse:", v5);
  v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke_583;
  block[3] = &unk_1E6CED890;
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v20 = v12;
  v21 = v13;
  v22 = v10;
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 64);
  v23 = v15;
  v24 = v16;
  v17 = v10;
  dispatch_async(v11, block);

}

void __78__HDNanoSyncManager__queue_recieveCompanionUserNotificationRequest_syncStore___block_invoke_583(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEBUG))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v2;
    objc_msgSend(v5, "requestIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "Sending response to start app request %@", (uint8_t *)&v8, 0xCu);

  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

uint64_t __79__HDNanoSyncManager__queue_recieveCompanionUserNotificationResponse_syncStore___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __93__HDNanoSyncManager__queue_companionUserNotificationRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__HDNanoSyncManager__queue_receiveNotificationInstructionRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5330];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5330], OS_LOG_TYPE_DEBUG))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = *(void **)(a1 + 40);
    v9 = v7;
    objc_msgSend(v8, "requestIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2112;
    v14 = v10;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Processed Notification instruction request %@, error: %@", (uint8_t *)&v11, 0x20u);

  }
}

void __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  HDCodableTinkerOptInResponse *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing response to Tinker opt in request; error: %{public}@ (#t0)",
      buf,
      0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(HDCodableTinkerOptInResponse);
  objc_msgSend(*(id *)(a1 + 48), "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerOptInResponse setRequestIdentifier:](v9, "setRequestIdentifier:", v10);

  -[HDCodableTinkerOptInResponse setAccepted:](v9, "setAccepted:", a2);
  if (v5)
  {
    objc_msgSend(v5, "hk_codableError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableTinkerOptInResponse setError:](v9, "setError:", v11);

  }
  objc_msgSend(v8, "setPbResponse:", v9);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(NSObject **)(v12 + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke_595;
  v15[3] = &unk_1E6CECCA8;
  v15[4] = v12;
  v16 = *(id *)(a1 + 48);
  v17 = v8;
  v18 = *(id *)(a1 + 56);
  v14 = v8;
  dispatch_async(v13, v15);

}

void __64__HDNanoSyncManager__queue_receiveTinkerOptInRequest_syncStore___block_invoke_595(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker opt in response to request %{public}@ (#t0)", (uint8_t *)&v7, 0x16u);

  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDNanoSyncManager _queue_handleTinkerOptInNotification:]((uint64_t)WeakRetained, 1);

}

- (void)_queue_handleTinkerOptInNotification:(uint64_t)a1
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint8_t v30[128];
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    notify_cancel(*(_DWORD *)(a1 + 28));
    notify_cancel(*(_DWORD *)(a1 + 32));
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB5370];
    v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v5)
      {
        v6 = *(void **)(a1 + 112);
        v7 = v4;
        *(_DWORD *)buf = 134349056;
        v32 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Tinker opt in accepted for the previous %{public}lu requests. Sending answer to companion (#t0)", buf, 0xCu);

      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = *(id *)(a1 + 112);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i) + 16))();
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v10);
      }
    }
    else
    {
      if (v5)
      {
        v13 = *(void **)(a1 + 112);
        v14 = v4;
        *(_DWORD *)buf = 134349056;
        v32 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Tinker opt in declined for the previous %{public}lu requests. Sending answer to companion (#t0)", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Tinker user declined Health sharing opt-in"));
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = *(id *)(a1 + 112);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v22;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v22 != v18)
              objc_enumerationMutation(v15);
            (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j));
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v17);
      }

    }
    v20 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = 0;

  }
}

void __75__HDNanoSyncManager__queue_registerForTinkerOptInNotificationWithResponse___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[HDNanoSyncManager _queue_handleTinkerOptInNotification:]((uint64_t)WeakRetained, 0);

}

uint64_t __65__HDNanoSyncManager__queue_receiveTinkerOptInResponse_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "accepted"), *(_QWORD *)(a1 + 40));
}

uint64_t __79__HDNanoSyncManager__queue_tinkerOptInRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  HDCodableTinkerPairingResponse *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2114;
    v26 = v6;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Preparing response %{public}@ to Tinker pairing request; error: %{public}@ (#t0)",
      buf,
      0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(HDCodableTinkerPairingResponse);
  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerPairingResponse setRequestIdentifier:](v9, "setRequestIdentifier:", v10);

  -[HDCodableTinkerPairingResponse setSetupMetadata:](v9, "setSetupMetadata:", v5);
  if (v6)
  {
    objc_msgSend(v6, "hk_codableError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableTinkerPairingResponse setError:](v9, "setError:", v11);

  }
  objc_msgSend(v8, "setPbResponse:", v9);
  v12 = *(void **)(a1 + 40);
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_617;
  v18[3] = &unk_1E6CECCA8;
  v14 = v12;
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(a1 + 56);
  v19 = v14;
  v20 = v15;
  v21 = v8;
  v22 = v16;
  v17 = v8;
  dispatch_async(v13, v18);

}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_617(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "requestIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Sending response to Tinker pairing request %{public}@ (#t0)", (uint8_t *)&v6, 0xCu);

  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_628(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  v8 = *MEMORY[0x1E0CB5370];
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 138543362;
      v11 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[sharing-setup] Failed health sharing set up process: %{public}@ (#t0)", (uint8_t *)&v10, 0xCu);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Successfully finished health sharing set up process, sending response (#t0)", (uint8_t *)&v10, 2u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_630(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Ensuring that sync is enabled locally. (#t0)", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudSyncCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cloudSyncSupportStatusDidChange");

  v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(v9, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudSyncCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accountProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_631;
  v14[3] = &unk_1E6CE77F0;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v12, "enableSyncLocallyWithCompletion:", v14);

}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_631(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  id v15;
  __int16 v16;
  id v17;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "tinkerFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Updating profile name for local device. (#t0)", buf, 2u);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      WeakRetained = objc_loadWeakRetained((id *)(v8 + 48));
    else
      WeakRetained = 0;
    objc_msgSend(*(id *)(a1 + 32), "tinkerFirstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "tinkerLastName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v12 = objc_msgSend(WeakRetained, "setDisplayFirstName:lastName:error:", v10, v11, &v17);
    v13 = v17;

    if (v12)
    {
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v14 = 1;
      v15 = v13;
    }
    ((void (**)(id, uint64_t, id))v4)[2](v4, v14, v15);

  }
  else
  {
    if (v7)
    {
      v16 = 0;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] No first/last name present; not saving in local profile. (#t0)",
        (uint8_t *)&v16,
        2u);
    }
    v4[2](v4, 0, 0);
  }

}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_633(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL8 v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C95218]);
  objc_msgSend(*(id *)(a1 + 32), "guardianIcloudIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEmailAddress:", v6);

  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v7;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Starting sharing setup with lookupInfo %{public}@ (#t0)", buf, 0xCu);
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "setupType") == 1;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_636;
  v14[3] = &unk_1E6CEDA10;
  v16 = v4;
  v15 = *(id *)(a1 + 48);
  v17 = *(_OWORD *)(a1 + 56);
  v12 = v4;
  v13 = (id)objc_msgSend(v11, "setupSharingToAccountWithIdentityLookupInfo:requireExistingRelationship:requireZoneDeviceMode:completion:", v7, v9, &unk_1E6DFABC8, v14);

}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_636(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void (*v16)(void);
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5370];
  v9 = *MEMORY[0x1E0CB5370];
  v10 = *MEMORY[0x1E0CB5370];
  if (v6)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)a1[4];
      *(_DWORD *)buf = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Set up shares in response to Tinker pairing request %{public}@ (#t0)", buf, 0xCu);
    }
    v18 = 0;
    objc_msgSend(v6, "codableSharingSetupMetadataWithError:", &v18);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v18;
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v12;

    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
      v16 = *(void (**)(void))(a1[5] + 16);
    }
    else
    {
      _HKInitializeLogging();
      v17 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v13;
        _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[sharing-setup] Encoding sharing setup metadata failed %{public}@ (#t0)", buf, 0xCu);
      }
      v16 = *(void (**)(void))(a1[5] + 16);
    }
    v16();

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "[sharing-setup] Share setup failed %{public}@ (#t0)", buf, 0xCu);
    }
    (*(void (**)(void))(a1[5] + 16))();
  }

}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_638(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HDTinkerPairedUserInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  uint64_t v15;
  HDTinkerPairedUserInfo *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  HDTinkerPairedUserInfo *v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v7 = v5;
    objc_msgSend(v6, "shareParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v8;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Sharing set up successful to %{public}@. Save guardian details for transparency alert (#t0)", buf, 0xCu);

  }
  v9 = objc_alloc_init(HDTinkerPairedUserInfo);
  objc_msgSend(*(id *)(a1 + 32), "guardianFirstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo setFirstName:](v9, "setFirstName:", v10);

  objc_msgSend(*(id *)(a1 + 32), "guardianLastName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo setLastName:](v9, "setLastName:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "guardianDSID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDTinkerPairedUserInfo setDsid:](v9, "setDsid:", v12);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(WeakRetained, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_640;
  v19[3] = &unk_1E6CEDA60;
  v15 = *(_QWORD *)(a1 + 48);
  v19[4] = *(_QWORD *)(a1 + 40);
  v20 = v9;
  v21 = *(_QWORD *)(a1 + 56);
  v16 = v9;
  LODWORD(v9) = objc_msgSend(v14, "performWithTransactionContext:error:block:", v15, &v22, v19);
  v17 = v22;

  if ((_DWORD)v9)
    v18 = 0;
  else
    v18 = 2;
  v4[2](v4, v18, v17);

}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_640(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  id WeakRetained;
  int v11;
  id v12;
  uint64_t v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a1[4];
  v3 = (void *)a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "shareParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v7 = v5;
  if (!v4)
    goto LABEL_6;
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = v6;
    v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Saving guardian info %{public}@, guardianParticipant %{public}@ (#t0)", (uint8_t *)&v15, 0x16u);
  }
  v9 = (id *)(v4 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(v4 + 48));
  v11 = objc_msgSend(WeakRetained, "setPairedGuardianUserInfo:error:", v6, a2);

  if (v11)
  {
    v12 = objc_loadWeakRetained(v9);
    v13 = objc_msgSend(v12, "setPairedGuardianParticipant:error:", v7, a2);

  }
  else
  {
LABEL_6:
    v13 = 0;
  }

  return v13;
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_641(uint64_t a1, uint64_t a2, void *a3)
{
  void (**v4)(id, uint64_t, id);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Scheduling buddy flow transparency alert(#t0)", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_642;
  v12[3] = &unk_1E6CECC80;
  v8 = *(_QWORD *)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v9 = objc_msgSend(v7, "performWithTransactionContext:error:block:", v8, &v13, v12);
  v10 = v13;

  if (v9)
    v11 = 0;
  else
    v11 = 2;
  v4[2](v4, v11, v10);

}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_642(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject **v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  uint64_t v19;
  _BYTE v21[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    return 0;
  _HKInitializeLogging();
  v4 = (NSObject **)MEMORY[0x1E0CB5370];
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Set up transparency alert to fire after buddy flow (#t0)", v21, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB4BD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 128, objc_msgSend(v7, "integerValue"), v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v11 = *v4;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      NSStringFromSelector(sel__scheduleTransparencyAlert_);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 138543618;
      *(_QWORD *)&v21[4] = v13;
      *(_WORD *)&v21[12] = 2114;
      *(_QWORD *)&v21[14] = v10;
      v14 = "[sharing-setup] %{public}@ Found user defaults, scheduling alert for %{public}@ (#t0)";
LABEL_10:
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, v14, v21, 0x16u);

    }
  }
  else
  {
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, 2, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    v15 = *v4;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v15;
      NSStringFromSelector(sel__scheduleTransparencyAlert_);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 138543618;
      *(_QWORD *)&v21[4] = v13;
      *(_WORD *)&v21[12] = 2114;
      *(_QWORD *)&v21[14] = v10;
      v14 = "[sharing-setup] %{public}@ Did not find any user defaults. Scheduling alert for %{public}@ (#t0)";
      goto LABEL_10;
    }
  }
  objc_msgSend(v9, "components:fromDate:", 62, v10, *(_OWORD *)v21, *(_QWORD *)&v21[16], v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCalendar:", v9);
  WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
  objc_msgSend(WeakRetained, "tinkerPrivacyAlertCoordinator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "scheduleEventIfRequiredForDateComponents:eventIdentifier:error:", v16, CFSTR("TinkerPrivacyAlertEventSharingSetUp"), a2);

  return v19;
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_643(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Subscribing to data upload requests (#t0)", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_644;
  v9[3] = &unk_1E6CE77F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "subscribeToDataUploadRequestsWithCompletion:", v9);

}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_644(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_645(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] Subscribing to data download available notifications (#t0)", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "cloudSyncManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_646;
  v9[3] = &unk_1E6CE77F0;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "subscribeToDataAvailableNotificationsWithCompletion:", v9);

}

uint64_t __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_646(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 0;
  else
    v3 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __66__HDNanoSyncManager__queue_receiveTinkerPairingRequest_syncStore___block_invoke_2_647(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  HDKeyValueDomain *v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  HDKeyValueDomain *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HDKeyValueDomain alloc];
  v6 = *MEMORY[0x1E0CB7648];
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 48));
  else
    WeakRetained = 0;
  v9 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v5, "initWithCategory:domainName:profile:", 100, v6, WeakRetained);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CB7640]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = -[HDKeyValueDomain removeValuesForKeys:error:](v9, "removeValuesForKeys:error:", v10, &v14);
  v12 = v14;

  if (!v11)
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[sharing-setup] Failed to purge sharing state cache with error: %{public}@ (#t0)", buf, 0xCu);
    }
  }
  (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);

}

void __67__HDNanoSyncManager__queue_receiveTinkerPairingResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "setupMetadata");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

uint64_t __81__HDNanoSyncManager__queue_tinkerPairingRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, 0, *(_QWORD *)(a1 + 40));
}

void __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  HDCodableTinkerEndToEndCloudSyncResponse *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v5;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Preparing response to Tinker end to end Cloud Sync request; error: %{public}@ (#t0)",
      buf,
      0x16u);
  }
  objc_msgSend(*(id *)(a1 + 40), "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(HDCodableTinkerEndToEndCloudSyncResponse);
  objc_msgSend(*(id *)(a1 + 48), "requestIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableTinkerEndToEndCloudSyncResponse setRequestIdentifier:](v9, "setRequestIdentifier:", v10);

  -[HDCodableTinkerEndToEndCloudSyncResponse setSuccess:](v9, "setSuccess:", a2);
  if (v5)
  {
    objc_msgSend(v5, "hk_codableError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableTinkerEndToEndCloudSyncResponse setError:](v9, "setError:", v11);

  }
  objc_msgSend(v8, "setPbResponse:", v9);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(NSObject **)(v12 + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke_660;
  v15[3] = &unk_1E6CECCA8;
  v15[4] = v12;
  v16 = *(id *)(a1 + 48);
  v17 = v8;
  v18 = *(id *)(a1 + 56);
  v14 = v8;
  dispatch_async(v13, v15);

}

void __76__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncRequest_syncStore___block_invoke_660(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    objc_msgSend(v3, "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[sharing-setup] %{public}@ Will send Tinker end to end Cloud Sync response to request %{public}@ (#t0)", (uint8_t *)&v7, 0x16u);

  }
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56));
}

void __80__HDNanoSyncManager__queue_performSyncForTinkerEndToEndCloudSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

uint64_t __77__HDNanoSyncManager__queue_receiveTinkerEndToEndCloudSyncResponse_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "success"), *(_QWORD *)(a1 + 40));
}

uint64_t __91__HDNanoSyncManager__queue_tinkerEndToEndCloudSyncRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109378;
    v18 = a3;
    v19 = 2114;
    v20 = v6;
    _os_log_debug_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEBUG, "Authorization request complete with success: %d, error: %{public}@.", buf, 0x12u);
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_673;
  v12[3] = &unk_1E6CED948;
  v13 = v6;
  v8 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v11 = v6;
  objc_msgSend(v8, "syncHealthDataWithOptions:reason:completion:", 0, CFSTR("Remote authorization request complete"), v12);

}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_673(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  HDCodableAuthorizationCompleteMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  _QWORD block[5];
  id v19;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 67109378;
    v22 = a2;
    v23 = 2114;
    v24 = v17;
    _os_log_debug_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEBUG, "Post-authorization sync complete with success: %d, error: %{public}@.", buf, 0x12u);
  }
  v7 = objc_alloc_init(HDCodableAuthorizationCompleteMessage);
  objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationCompleteMessage setAppBundleIdentifier:](v7, "setAppBundleIdentifier:", v8);

  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationCompleteMessage setRequestIdentifier:](v7, "setRequestIdentifier:", v9);

  v10 = *(void **)(a1 + 32);
  if (v10 || (v10 = v5) != 0)
  {
    objc_msgSend(v10, "localizedDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableAuthorizationCompleteMessage setErrorDescription:](v7, "setErrorDescription:", v11);

  }
  objc_msgSend(*(id *)(a1 + 48), "createRequestWithMessageID:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPbRequest:", v7);
  v14 = *(void **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v15 = *(NSObject **)(v13 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_674;
  block[3] = &unk_1E6CE7FB8;
  block[4] = v13;
  v19 = v12;
  v20 = v14;
  v16 = v12;
  dispatch_async(v15, block);

}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_674(uint64_t a1)
{
  -[HDNanoSyncManager _queue_sendRequest:syncStore:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  HDCodableAuthorizationResponseMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v7;
    v24 = 1024;
    v25 = a2;
    v26 = 2114;
    v27 = v8;
    _os_log_debug_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEBUG, "Sending response to authorization request; host app is %@ and should prompt is %d; error: %{public}@",
      buf,
      0x1Cu);
  }
  objc_msgSend(*(id *)(a1 + 32), "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(HDCodableAuthorizationResponseMessage);
  objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationResponseMessage setAppBundleIdentifier:](v11, "setAppBundleIdentifier:", v12);

  objc_msgSend(*(id *)(a1 + 40), "requestIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableAuthorizationResponseMessage setRequestIdentifier:](v11, "setRequestIdentifier:", v13);

  -[HDCodableAuthorizationResponseMessage setShouldPrompt:](v11, "setShouldPrompt:", a2);
  -[HDCodableAuthorizationResponseMessage setHostAppName:](v11, "setHostAppName:", v7);
  if (v8)
  {
    objc_msgSend(v8, "localizedDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableAuthorizationResponseMessage setErrorDescription:](v11, "setErrorDescription:", v14);

  }
  objc_msgSend(v10, "setPbResponse:", v11);
  v15 = *(_QWORD *)(a1 + 48);
  v16 = *(void **)(a1 + 56);
  v17 = *(NSObject **)(v15 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_676;
  block[3] = &unk_1E6CE7FB8;
  block[4] = v15;
  v20 = v10;
  v21 = v16;
  v18 = v10;
  dispatch_async(v17, block);

}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_676(uint64_t a1)
{
  -[HDNanoSyncManager _queue_sendResponse:syncStore:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

void __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_2_678(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (!a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "localizedShortName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5280];
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v15)
        {
          v16 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v24 = v16;
          v17 = "Failed to lookup name for bundle '%@': got a proxy, but didn't find a localizedName or localizedShortName.";
LABEL_14:
          _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);
        }
      }
      else if (v15)
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v24 = v19;
        v17 = "Failed to lookup name for bundle '%@': failed to get an application proxy object from LSApplicationProxy.";
        goto LABEL_14;
      }
      v18 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), *(_QWORD *)(a1 + 64), CFSTR("Unable to look up host app with requested bundle identifier."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v18 + 16))(v18, 0, 0, v10);
      goto LABEL_5;
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(WeakRetained, "authorizationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_3;
  v20[3] = &unk_1E6CECC08;
  v22 = *(id *)(a1 + 48);
  v21 = v7;
  objc_msgSend(v12, "openAppForAuthorization:sessionIdentifier:completion:", v13, v21, v20);

  (*(void (**)(_QWORD, uint64_t, void *, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, v10, 0);
LABEL_5:

LABEL_7:
}

uint64_t __66__HDNanoSyncManager__queue_receiveAuthorizationRequest_syncStore___block_invoke_3(uint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) == 0)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(result + 40) + 16))(*(_QWORD *)(result + 40), *(_QWORD *)(result + 32), 0, a3);
  return result;
}

uint64_t __67__HDNanoSyncManager__queue_receiveAuthorizationResponse_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __81__HDNanoSyncManager__queue_authorizationRequestDidFailToSendWithError_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v1 + 16))(v1, 0, 0, *(_QWORD *)(a1 + 40));
}

uint64_t __81__HDNanoSyncManager__queue_authorizationRequestDidFailToSendWithError_syncStore___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 24);
  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(v1, *(_QWORD *)(a1 + 40));
}

uint64_t __74__HDNanoSyncManager__queue_receiveAuthorizationCompleteRequest_syncStore___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    v1 = *(_QWORD *)(v1 + 24);
  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 + 16))(v1, *(_QWORD *)(a1 + 40));
}

- (void)_scheduleResetReceivedNanoSyncAnchorsForHFD
{
  OS_dispatch_queue *queue;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[5];

  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke;
  v8[3] = &unk_1E6CE80E8;
  v8[4] = self;
  +[HDMaintenanceOperation maintenanceOperationWithName:queue:synchronousBlock:](HDMaintenanceOperation, "maintenanceOperationWithName:queue:synchronousBlock:", CFSTR("Reset Received Nanosync Anchors"), queue, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maintenanceWorkCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueMaintenanceOperation:", v4);

}

void __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (NSObject **)MEMORY[0x1E0CB52B0];
  v3 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "Attempting reset of sync anchors", buf, 2u);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    WeakRetained = objc_loadWeakRetained((id *)(v4 + 48));
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v6, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, &v13, &__block_literal_global_690, 0);
  v9 = v13;

  _HKInitializeLogging();
  v10 = *v2;
  v11 = *v2;
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Reset of sync anchors completed", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Failed to reset sync anchors as requested after HFD rebuild step.", buf, 0xCu);
  }

}

BOOL __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke_689(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v4 = a2;
  +[HDSyncStoreEntity allSyncStoreEntitiesOfType:transaction:error:](HDSyncStoreEntity, "allSyncStoreEntitiesOfType:transaction:error:", 1, v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "hk_map:", &__block_literal_global_693);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[HDSyncAnchorEntity resetAllSyncAnchorsOfType:syncProvenances:transaction:error:](HDSyncAnchorEntity, "resetAllSyncAnchorsOfType:syncProvenances:transaction:error:", 3, v7, v4, a3);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __64__HDNanoSyncManager__scheduleResetReceivedNanoSyncAnchorsForHFD__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "syncProvenance"));
}

void __87__HDNanoSyncManager__sendFinalStatusMessageForSyncSession_didFinishSuccessfully_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isLastChance"))
    v2 = 5;
  else
    v2 = 4;
  +[HDCodableNanoSyncStatus statusWithStatusCode:](HDCodableNanoSyncStatus, "statusWithStatusCode:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "syncStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(WeakRetained, "syncEngine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v7 = objc_msgSend(v6, "getReceivedAnchorMap:forStore:error:", v3, v4, &v15);
  v8 = v15;

  if (v7)
  {
    v10 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(unsigned __int8 *)(a1 + 56);
    v12 = *(void **)(a1 + 48);
    v13 = v3;
  }
  else
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v8;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "failed to get received anchors for outgoing change pull request: %{public}@", buf, 0xCu);
    }
    v10 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48))
      v12 = *(void **)(a1 + 48);
    else
      v12 = v8;
    v13 = v3;
    v11 = 0;
  }
  -[HDNanoSyncManager _sendFinalMessageForSyncSession:status:success:error:](v9, v10, v13, v11, v12);

}

uint64_t __74__HDNanoSyncManager__sendFinalMessageForSyncSession_status_success_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;
  uint64_t v4;

  if (a2)
    v3 = *(_BYTE *)(a1 + 48) == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (*(_QWORD *)(a1 + 40))
    a3 = *(_QWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "invokeCompletionWithSuccess:error:", v4, a3);
}

- (void)nanoSyncStore:(id)a3 remoteSystemBuildVersionDidChange:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  HDNanoSyncManager *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HDNanoSyncManager_nanoSyncStore_remoteSystemBuildVersionDidChange___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __69__HDNanoSyncManager_nanoSyncStore_remoteSystemBuildVersionDidChange___block_invoke(uint64_t a1)
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
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "store %{public}@ remote system build version changed to %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  -[HDNanoSyncManager _queue_updateSyncStores](*(_QWORD *)(a1 + 48));
}

- (void)nanoSyncStore:(id)a3 deviceNameDidChange:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  HDNanoSyncManager *v10;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HDNanoSyncManager_nanoSyncStore_deviceNameDidChange___block_invoke;
  v8[3] = &unk_1E6CE8080;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

}

void __55__HDNanoSyncManager_nanoSyncStore_deviceNameDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "store %{public}@ device name did change", (uint8_t *)&v6, 0xCu);
  }
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v5 == *(void **)(v4 + 96))
    -[HDNanoSyncManager _queue_updateDeviceNameIfNecessaryWithSyncStore:](v4, v5);
}

void __69__HDNanoSyncManager__queue_updateDeviceNameIfNecessaryWithSyncStore___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  int v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  objc_msgSend(WeakRetained, "sourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = a1[5];
  v19 = 0;
  objc_msgSend(v3, "localSourceForBundleIdentifier:error:", v4, &v19);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v19;

  if (v5)
  {
    v7 = a1[7];
    v8 = objc_loadWeakRetained((id *)(a1[4] + 48));
    v18 = v6;
    v9 = objc_msgSend(v5, "setName:profile:error:", v7, v8, &v18);
    v10 = v18;

    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    v12 = *MEMORY[0x1E0CB5370];
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = (void *)a1[6];
        v13 = a1[7];
        *(_DWORD *)buf = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v14;
        _os_log_debug_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEBUG, "updated device name to %@ for %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v17 = a1[6];
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "failed to set device name for %{public}@: %{public}@", buf, 0x16u);
    }
    v6 = v10;
  }
  else
  {
    _HKInitializeLogging();
    v15 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v16 = a1[6];
      *(_DWORD *)buf = 138543618;
      v21 = v16;
      v22 = 2114;
      v23 = v6;
      _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "failed to look up source for %{public}@: %{public}@", buf, 0x16u);
    }
  }

}

- (void)nanoSyncStore:(id)a3 restoreStateDidChange:(int64_t)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HDNanoSyncManager_nanoSyncStore_restoreStateDidChange___block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __57__HDNanoSyncManager_nanoSyncStore_restoreStateDidChange___block_invoke(uint64_t a1)
{
  -[HDNanoSyncManager _queue_updateSyncStores](*(_QWORD *)(a1 + 32));
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  const char *v5;
  HDNanoSyncStore *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  HDNanoSyncStore *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v22;
  HDNanoSyncStore *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_isMaster)
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\tMaster: %s"), v5);
  v6 = self->_activeSyncStore;
  if (v6)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n\tActive Store:\n\t"));
    -[HDNanoSyncStore diagnosticDescription](v6, "diagnosticDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v8);

  }
  -[NSMutableDictionary allValues](self->_syncStoresByDeviceIdentifier, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (!v6 || v10 >= 2)
  {
    v23 = v6;
    objc_msgSend(v4, "appendString:", CFSTR("\n\n\tInactive Stores:\n\t"));
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(HDNanoSyncStore **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          if (v16 != self->_activeSyncStore)
          {
            -[HDNanoSyncStore diagnosticDescription](v16, "diagnosticDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "appendString:", v18);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v9 = v22;
    v6 = v23;
  }
  if (self->_periodicSyncTimer)
    v19 = "ON";
  else
    v19 = "OFF";
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tPeriodic sync timer: %s"), v19);
  HKDiagnosticStringFromDate();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\tLast periodic sync: %@"), v20);

  return v4;
}

- (void)foregroundClientProcessesDidChange:(id)a3 previouslyForegroundBundleIdentifiers:(id)a4
{
  _CDLocalContext *v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  void *v10;
  _CDLocalContext *context;
  void *v12;
  os_log_t v13;
  _CDLocalContext *v14;
  void *v15;
  os_log_t v16;
  _CDLocalContext *v17;
  NSObject *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  char v23;
  _CDLocalContext *v24;
  NSObject *v25;
  void *v26;
  int v27;
  _CDLocalContext *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = (_CDLocalContext *)a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5370];
  v9 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "CoreDuet: Attempt to add new foregroundClientBundleIds: %@ \n and remove previouslyForegroundBundleIds: %@", (uint8_t *)&v27, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0D15C58], "keyPathForServicesAppearingForeground");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    context = self->_context;
    objc_msgSend(v7, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(context) = -[_CDLocalContext removeObjects:fromArrayAtKeyPath:](context, "removeObjects:fromArrayAtKeyPath:", v12, v10);

    if ((context & 1) == 0)
    {
      _HKInitializeLogging();
      v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        v24 = self->_context;
        v25 = v13;
        -[_CDLocalContext objectForContextualKeyPath:](v24, "objectForContextualKeyPath:", v10);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = v24;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v26;
        _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "CoreDuet: Unsuccessful attempt to remove previously foreground bundleIDs from context %@ at keypath %@. Existing foreground bundleIDs: %@", (uint8_t *)&v27, 0x20u);

      }
    }
  }
  if (-[_CDLocalContext count](v6, "count"))
  {
    v14 = self->_context;
    -[_CDLocalContext allObjects](v6, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = -[_CDLocalContext addObjects:toArrayAtKeyPath:](v14, "addObjects:toArrayAtKeyPath:", v15, v10);

    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      v16 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v17 = self->_context;
        v18 = v16;
        -[_CDLocalContext objectForContextualKeyPath:](v17, "objectForContextualKeyPath:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412802;
        v28 = v17;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "CoreDuet: Unsuccessful attempt to add new foreground bundle ids to context %@ at keypath %@. Existing foreground bundleIDs: %@", (uint8_t *)&v27, 0x20u);

      }
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "behavior");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isAppleWatch");

    if ((v23 & 1) == 0)
      -[HDNanoSyncManager _syncImmediatelyWithReason:options:]((uint64_t)self, CFSTR("client process entered foreground"), 1);
  }

}

- (double)restoreTimeout
{
  return self->_restoreTimeout;
}

- (void)setRestoreTimeout:(double)a3
{
  self->_restoreTimeout = a3;
}

- (void)setEnablePeriodicSyncTimer:(BOOL)a3
{
  self->_enablePeriodicSyncTimer = a3;
}

- (HDPairedSyncManager)pairedSyncManager
{
  return self->_pairedSyncManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairedSyncManager, 0);
  objc_storeStrong((id *)&self->_lastPeriodicSyncDate, 0);
  objc_storeStrong((id *)&self->_periodicSyncTimer, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_syncStoresByDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_tinkerOptInResponseBlocks, 0);
  objc_storeStrong((id *)&self->_activeTinkerSyncStore, 0);
  objc_storeStrong((id *)&self->_activeSyncStore, 0);
  objc_storeStrong((id *)&self->_nanoSyncDomain, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_messageCenter, 0);
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_pairedDevicesSnapshot, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
