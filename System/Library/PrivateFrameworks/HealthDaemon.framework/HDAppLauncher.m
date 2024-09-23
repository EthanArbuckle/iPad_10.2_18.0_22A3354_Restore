@implementation HDAppLauncher

- (HDAppLauncher)initWithProcessStateManager:(id)a3 openApplicationService:(id)a4
{
  id v7;
  id v8;
  HDAppLauncher *v9;
  HDAppLauncher *v10;
  uint64_t v11;
  OS_dispatch_queue *queue;
  HDAssertionManager *v13;
  HDAssertionManager *assertionManager;
  NSMutableDictionary *v15;
  NSMutableDictionary *registeredAssertionsByIdentifier;
  NSMutableSet *v17;
  NSMutableSet *monitoredProcessBundleIdentifiers;
  NSMutableSet *v19;
  NSMutableSet *launchingProcessBundleIdentifiers;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)HDAppLauncher;
  v9 = -[HDAppLauncher init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_processStateManager, a3);
    objc_storeStrong((id *)&v10->_openApplicationService, a4);
    HKCreateSerialDispatchQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v11;

    v13 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E0D29808]);
    assertionManager = v10->_assertionManager;
    v10->_assertionManager = v13;

    -[HDAssertionManager addObserver:forAssertionIdentifier:queue:](v10->_assertionManager, "addObserver:forAssertionIdentifier:queue:", v10, CFSTR("HDAppLaunchClientKeepAliveAssertionIdentifier"), v10->_queue);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    registeredAssertionsByIdentifier = v10->_registeredAssertionsByIdentifier;
    v10->_registeredAssertionsByIdentifier = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    monitoredProcessBundleIdentifiers = v10->_monitoredProcessBundleIdentifiers;
    v10->_monitoredProcessBundleIdentifiers = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    launchingProcessBundleIdentifiers = v10->_launchingProcessBundleIdentifiers;
    v10->_launchingProcessBundleIdentifiers = v19;

    v10->_baseLaunchDelay = 8.0;
    v10->_maxLaunchCount = 6;
    objc_opt_self();
    v10->_launchCountResetThreshold = 1037.9707;
  }

  return v10;
}

- (id)takeKeepAliveAssertionForApplicationBundleIdentifier:(id)a3 processBundleIdentifier:(id)a4 payloadOptions:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  id v15;
  _BYTE *v16;
  _BYTE buf[24];
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "length"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v18 = __Block_byref_object_copy__105;
    v19 = __Block_byref_object_dispose__105;
    v20 = 0;
    queue = self->_queue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __109__HDAppLauncher_takeKeepAliveAssertionForApplicationBundleIdentifier_processBundleIdentifier_payloadOptions___block_invoke;
    v13[3] = &unk_1E6CED588;
    v13[4] = self;
    v14 = v7;
    v15 = v8;
    v16 = buf;
    dispatch_sync(queue, v13);
    v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring attempt to request keep-alive for invalide bundle identifier %{public}@", buf, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

void __109__HDAppLauncher_takeKeepAliveAssertionForApplicationBundleIdentifier_processBundleIdentifier_payloadOptions___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  HDClientKeepAliveAssertion *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSString *clientBundleIdentifier;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[22];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v34;
    v7 = 0.0;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD **)(*((_QWORD *)&v33 + 1) + 8 * v8);
        if (v9)
          v10 = (void *)v9[13];
        else
          v10 = 0;
        if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 48), (_QWORD)v33) & 1) == 0)
        {
          _HKInitializeLogging();
          v15 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
          {
            v31 = *(_QWORD *)(a1 + 32);
            v32 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)v37 = 138543618;
            *(_QWORD *)&v37[4] = v31;
            *(_WORD *)&v37[12] = 2112;
            *(_QWORD *)&v37[14] = v32;
            _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Taking assertion on processs %@ with different payload", v37, 0x16u);
          }

          goto LABEL_43;
        }
        if (v9)
          v11 = (void *)v9[11];
        else
          v11 = 0;
        objc_msgSend(v11, "timeIntervalSinceReferenceDate");
        if (v7 < v12)
          v7 = v12;
        if (v9)
          v13 = v9[10];
        else
          v13 = 0;
        if (v5 <= v13)
          v5 = v13;
        ++v8;
      }
      while (v4 != v8);
      v14 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      v4 = v14;
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
    v7 = 0.0;
  }

  v16 = [HDClientKeepAliveAssertion alloc];
  v17 = *(void **)(a1 + 48);
  v18 = *(id *)(a1 + 40);
  v19 = v17;
  if (v16)
  {
    *(_QWORD *)v37 = v16;
    *(_QWORD *)&v37[8] = HDClientKeepAliveAssertion;
    v16 = (HDClientKeepAliveAssertion *)objc_msgSendSuper2((objc_super *)v37, sel_initWithAssertionIdentifier_ownerIdentifier_, CFSTR("HDAppLaunchClientKeepAliveAssertionIdentifier"), v18);
    if (v16)
    {
      v20 = objc_msgSend(v18, "copy");
      clientBundleIdentifier = v16->_clientBundleIdentifier;
      v16->_clientBundleIdentifier = (NSString *)v20;

      objc_storeStrong((id *)&v16->_payloadOptions, v17);
    }
  }

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v16;

  v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v24)
    *(_QWORD *)(v24 + 80) = v5;
  if (v7 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v27)
      objc_setProperty_nonatomic_copy(v27, v25, v26, 88);

  }
  _HKInitializeLogging();
  v28 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    v29 = *(_QWORD *)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v37 = 138543618;
    *(_QWORD *)&v37[4] = v29;
    *(_WORD *)&v37[12] = 2114;
    *(_QWORD *)&v37[14] = v30;
    _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_INFO, "%{public}@: Taking keep-alive assertion for %{public}@", v37, 0x16u);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "takeAssertion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (_QWORD)v33))
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerObserver:forBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    -[HDAppLauncher _queue_launchClientIfNeeded:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
LABEL_43:

}

- (id)_queue_assertionsForClientBundleIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    objc_msgSend(*(id *)(a1 + 32), "activeAssertionsForIdentifier:", CFSTR("HDAppLaunchClientKeepAliveAssertionIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60__HDAppLauncher__queue_assertionsForClientBundleIdentifier___block_invoke;
    v6[3] = &unk_1E6CFA6D8;
    v7 = v3;
    objc_msgSend(v4, "hk_filter:", v6);
    a1 = objc_claimAutoreleasedReturnValue();

  }
  return (id)a1;
}

- (void)_queue_launchClientIfNeeded:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[HDAppLauncher _queue_clientRequiresLaunch:assertions:](a1, v3, v4) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v3);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v22 = v4;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v7)
      {
        v9 = v7;
        v10 = 0;
        v11 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(v6);
            v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (v13)
            {
              objc_setProperty_nonatomic_copy(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), v8, v5, 88);
              ++*(_QWORD *)(v13 + 80);
              v14 = *(void **)(v13 + 104);
              if (v14)
              {
                v15 = v14;

                v10 = v15;
              }
            }
          }
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v9);
      }
      else
      {
        v10 = 0;
      }

      objc_msgSend(v6, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ownerIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      v19 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = a1;
        v34 = 2114;
        v35 = v18;
        _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to launch %{public}@.", buf, 0x16u);
      }
      v20 = *(void **)(a1 + 16);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke;
      v23[3] = &unk_1E6CFA700;
      v24 = v18;
      v25 = a1;
      v26 = v3;
      v21 = v18;
      objc_msgSend(v20, "hd_openApplication:optionsDictionary:completion:", v21, v10, v23);

      v4 = v22;
    }
    else
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v33 = a1;
        v34 = 2114;
        v35 = v3;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Not attempting to launch %{public}@; does not require launch.",
          buf,
          0x16u);
      }
    }

  }
}

uint64_t __60__HDAppLauncher__queue_assertionsForClientBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v3)
      v4 = (void *)v3[12];
    else
      v4 = 0;
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (uint64_t)_queue_clientRequiresLaunch:(void *)a3 assertions:
{
  id v5;
  id v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!objc_msgSend(v6, "count"))
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5380];
    v10 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v16 = 138543618;
    v17 = a1;
    v18 = 2114;
    v19 = v5;
    v11 = "%{public}@: %{public}@ has no active assertions.";
    goto LABEL_10;
  }
  v7 = objc_msgSend(*(id *)(a1 + 8), "processIdentifierForApplicationIdentifier:", v5);
  if (v7 < 1)
  {
    if (!objc_msgSend(*(id *)(a1 + 56), "containsObject:", v5))
    {
      v10 = 1;
      goto LABEL_13;
    }
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5380];
    v10 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v16 = 138543618;
    v17 = a1;
    v18 = 2114;
    v19 = v5;
    v11 = "%{public}@: %{public}@ is already being launched.";
LABEL_10:
    v12 = v14;
    v13 = 22;
    goto LABEL_11;
  }
  v8 = v7;
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  v10 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543874;
    v17 = a1;
    v18 = 2114;
    v19 = v5;
    v20 = 1026;
    v21 = v8;
    v11 = "%{public}@: %{public}@ is already running with pid %{public}d.";
    v12 = v9;
    v13 = 28;
LABEL_11:
    _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    v10 = 0;
  }
LABEL_13:

  return v10;
}

void __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a2)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to open: %{public}@", buf, 0x16u);
    }
  }
  v7 = a1[5];
  v8 = (void *)a1[6];
  v9 = *(NSObject **)(v7 + 24);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke_192;
  v11[3] = &unk_1E6CE8080;
  v11[4] = v7;
  v12 = v8;
  dispatch_async(v9, v11);

}

void __45__HDAppLauncher__queue_launchClientIfNeeded___block_invoke_192(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
  -[HDAppLauncher _queue_scheduleLaunchForClient:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_queue_scheduleLaunchForClient:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  long double v23;
  double v24;
  long double v25;
  double v26;
  double v27;
  NSObject *v28;
  dispatch_time_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id obj;
  void *v34;
  _QWORD block[5];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
    -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](a1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[HDAppLauncher _queue_clientRequiresLaunch:assertions:](a1, v3, v4) & 1) == 0)
    {
      _HKInitializeLogging();
      v31 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v43 = a1;
        v44 = 2114;
        v45 = *(double *)&v3;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@: Not scheduling launch %{public}@; does not require launch.",
          buf,
          0x16u);
      }
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v6)
    {
      v7 = v6;
      obj = v5;
      v8 = a1;
      v9 = 0;
      v10 = *(_QWORD *)v38;
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v12 = 0;
        v13 = v9;
        do
        {
          if (*(_QWORD *)v38 != v10)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v12);
          if (v14)
            v15 = *(void **)(v14 + 88);
          else
            v15 = 0;
          v16 = v15;
          objc_msgSend(v34, "timeIntervalSinceDate:", v16);
          v18 = v17;
          v19 = *(double *)(v8 + 64);

          if (v18 > v19 && v14)
            *(_QWORD *)(v14 + 80) = 0;
          HKDateMax();
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            v20 = *(_QWORD *)(v14 + 80);
          else
            v20 = 0;
          if (v11 >= v20)
            v11 = v20;
          ++v12;
          v13 = v9;
        }
        while (v7 != v12);
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        v7 = v21;
      }
      while (v21);

      a1 = v8;
      if (v11 < *(_QWORD *)(v8 + 80))
      {
        v22 = *(double *)(v8 + 72);
        v23 = pow(1.5, (double)v11) * v22;
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        v25 = v24 + v23;
        objc_msgSend(v34, "timeIntervalSinceReferenceDate");
        v27 = v25 - v26;
        if (v27 <= 0.0)
        {
          -[HDAppLauncher _queue_launchClientIfNeeded:](v8, v3);
        }
        else
        {
          _HKInitializeLogging();
          v28 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v43 = a1;
            v44 = 2048;
            v45 = v27;
            _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: Scheduling launch in %0.2lfs.", buf, 0x16u);
          }
          v29 = dispatch_time(0, (uint64_t)(v27 * 1000000000.0));
          v30 = *(NSObject **)(a1 + 24);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __48__HDAppLauncher__queue_scheduleLaunchForClient___block_invoke;
          block[3] = &unk_1E6CE8080;
          block[4] = a1;
          v36 = v3;
          dispatch_after(v29, v30, block);

        }
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {

      v9 = 0;
    }
    _HKInitializeLogging();
    v32 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v43 = a1;
      _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Too many terminations; not rescheduling a launch.",
        buf,
        0xCu);
    }
    goto LABEL_34;
  }
LABEL_36:

}

uint64_t __48__HDAppLauncher__queue_scheduleLaunchForClient___block_invoke(uint64_t a1)
{
  return -[HDAppLauncher _queue_launchClientIfNeeded:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  _QWORD *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  HDAppLauncher *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v5)
      v6 = (void *)v5[12];
    else
      v6 = 0;
    v7 = v6;
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      v11 = 138543618;
      v12 = self;
      v13 = 2114;
      v14 = v7;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "%{public}@: Invalidated keep-alive assertion for %{public}@", (uint8_t *)&v11, 0x16u);
    }
    -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:]((uint64_t)self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (!v10)
    {
      -[NSMutableSet removeObject:](self->_monitoredProcessBundleIdentifiers, "removeObject:", v7);
      -[HDProcessStateManager unregisterObserver:forBundleIdentifier:](self->_processStateManager, "unregisterObserver:forBundleIdentifier:", self, v7);
    }

  }
}

- (void)processTerminated:(id)a3
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
  v7[2] = __35__HDAppLauncher_processTerminated___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __35__HDAppLauncher_processTerminated___block_invoke(uint64_t a1)
{
  -[HDAppLauncher _queue_scheduleLaunchForClient:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)unitTest_setBaseLaunchDelay:(double)a3 launchCountResetThreshold:(double)a4 maxLaunchCount:(int64_t)a5
{
  self->_launchCountResetThreshold = a4;
  self->_baseLaunchDelay = a3;
  self->_maxLaunchCount = a5;
}

- (BOOL)unitTest_hasAssertionForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HDAppLauncher_unitTest_hasAssertionForBundleIdentifier___block_invoke;
  block[3] = &unk_1E6CF6BF8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __58__HDAppLauncher_unitTest_hasAssertionForBundleIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  -[HDAppLauncher _queue_assertionsForClientBundleIdentifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchingProcessBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_monitoredProcessBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_registeredAssertionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_openApplicationService, 0);
  objc_storeStrong((id *)&self->_processStateManager, 0);
}

@end
