@implementation _LSInstallProgressService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CFURLRef v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  LSInstallProgressObserver *v16;
  LSInstallProgressObserver *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  LSInstallProgressObserver *v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((int)softLinkMKBDeviceUnlockedSinceBoot[0]() <= 0)
  {
    objc_msgSend(v7, "_xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = _LSCopyExecutableURLForXPCConnection(v8);

    -[__CFURL lastPathComponent](v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_opt_class();
      v13 = v12;
      *(_DWORD *)buf = 138412802;
      v29 = v12;
      v30 = 2112;
      v31 = v10;
      v32 = 2048;
      v33 = (int)objc_msgSend(v7, "processIdentifier");
      _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "Service %@ being accessed by %@ (%lu) before first unlock.", buf, 0x20u);

    }
  }
  installProgressInterface();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v14);

  workspaceObserverInterface();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v15);

  v16 = -[LSInstallProgressObserver initWithConnection:]([LSInstallProgressObserver alloc], "initWithConnection:", v7);
  objc_msgSend(v7, "setExportedObject:", v16);
  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __64___LSInstallProgressService_listener_shouldAcceptNewConnection___block_invoke;
  v23 = &unk_1E1046540;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, (id *)buf);
  v17 = v16;
  v24 = v17;
  v18 = (void *)MEMORY[0x186DAE9BC](&v20);
  objc_msgSend(v7, "setInvalidationHandler:", v18, v20, v21, v22, v23);
  objc_msgSend(v7, "setInterruptionHandler:", v18);
  objc_msgSend(v7, "resume");

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return 1;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *observersQueue;
  uint64_t v6;
  id v7;
  _LSInstallProgressService *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  _QWORD block[5];
  id v23;
  _QWORD *v24;
  _QWORD v25[3];
  char v26;

  v4 = a3;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  observersQueue = self->_observersQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___LSInstallProgressService_addObserver___block_invoke;
  block[3] = &unk_1E10404A0;
  v24 = v25;
  block[4] = self;
  v7 = v4;
  v23 = v7;
  dispatch_sync(observersQueue, block);
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableOrderedSet array](v8->_orderedInstalls, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[NSMutableSet allObjects](v8->_inactiveInstalls, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_sync_exit(v8);
  v13 = self->_observersQueue;
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __41___LSInstallProgressService_addObserver___block_invoke_2;
  v17[3] = &unk_1E1046588;
  v20 = v12;
  v21 = v25;
  v17[4] = v8;
  v18 = v7;
  v19 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v7;
  dispatch_async(v13, v17);

  _Block_object_dispose(v25, 8);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_188);
  return (id)sharedInstance_sharedInstance_2;
}

+ (void)beginListening
{
  if (beginListening_once_0 != -1)
    dispatch_once(&beginListening_once_0, &__block_literal_global_189);
}

+ (int)notificationTypeForOperation:(unint64_t)a3
{
  if (a3 > 8)
    return 1;
  else
    return dword_1829FAEC4[a3];
}

- (_LSInstallProgressService)init
{
  id v2;
  uint64_t v3;
  void *v4;
  LSInstallProgressList *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  dispatch_queue_t v17;
  void *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject **v24;
  NSObject *v25;
  NSObject *v26;
  dispatch_source_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD handler[4];
  id v34;
  id location;
  _QWORD block[4];
  NSObject **v37;
  objc_super v38;

  v38.receiver = self;
  v38.super_class = (Class)_LSInstallProgressService;
  v2 = -[_LSInstallProgressService init](&v38, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    v5 = objc_alloc_init(LSInstallProgressList);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithCapacity:", 0);
    v10 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v12 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    v14 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    v16 = (void *)*((_QWORD *)v2 + 7);
    *((_QWORD *)v2 + 7) = v15;

    v17 = dispatch_queue_create("com.apple.lsd.appcontrols", 0);
    v18 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.lsd.observers", v19);
    v21 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v20;

    *((_BYTE *)v2 + 128) = 0;
    objc_msgSend(v2, "sendNetworkUsageChangedNotification");
    v22 = *((_QWORD *)v2 + 9);
    v23 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33___LSInstallProgressService_init__block_invoke;
    block[3] = &unk_1E1040478;
    v24 = (NSObject **)v2;
    v37 = v24;
    dispatch_async(v22, block);
    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v26 = v24[11];
    v24[11] = v25;

    v27 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 9));
    v28 = v24[13];
    v24[13] = v27;

    objc_initWeak(&location, v24);
    v29 = v24[13];
    handler[0] = v23;
    handler[1] = 3221225472;
    handler[2] = __33___LSInstallProgressService_init__block_invoke_2;
    handler[3] = &unk_1E10403D8;
    objc_copyWeak(&v34, &location);
    dispatch_source_set_event_handler(v29, handler);
    dispatch_resume(v24[13]);
    v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v31 = v24[15];
    v24[15] = v30;

    *((_DWORD *)v24 + 28) = 0;
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);

  }
  return (_LSInstallProgressService *)v2;
}

- (id)_LSFindPlaceholderApplications
{
  id v2;
  id v4;
  void *v5;
  void *v6;

  v6 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!_LSContextInit(&v6))
  {
    v5 = v6;
    v4 = v2;
    _CSStoreEnumerateUnits();
    _LSContextDestroy(&v6);

  }
  return v2;
}

- (void)restoreInactiveInstalls
{
  NSObject *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  id obj;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__53;
  v27 = __Block_byref_object_dispose__53;
  v28 = 0;
  _LSDatabaseGetSeedingGroup();
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  _LSServer_DatabaseExecutionContext();
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke;
  v22[3] = &unk_1E103FB40;
  v22[4] = self;
  v22[5] = &v23;
  -[LSDBExecutionContext syncRead:](v4, v22);

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)v24[5];
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v33, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v6 = 138412546;
    v15 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x1E0CB38A8];
        objc_msgSend(v9, "bundleIdentifier", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "publishingKeyForApp:withPhase:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        _LSProgressLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "installFailureReason");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v30 = v9;
          v31 = 2112;
          v32 = v14;
          _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "Restoring progress for %@ with failure state %@", buf, 0x16u);

        }
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __52___LSInstallProgressService_restoreInactiveInstalls__block_invoke_199;
        v17[3] = &unk_1E1040A90;
        v17[4] = v9;
        -[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:](self, "createInstallProgressForApplication:withPhase:andPublishingString:reply:", v9, 0, v12, v17);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v33, 16);
    }
    while (v5);
  }

  _Block_object_dispose(&v23, 8);
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *observersQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___LSInstallProgressService_removeObserver___block_invoke;
  block[3] = &unk_1E103FCC8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observersQueue, block);

}

- (void)getMaxProgressPhaseUnitsForLoading:(int *)a3 restoring:(int *)a4 installing:(int *)a5 essentialAssets:(int *)a6 forAppProxy:(id)a7
{
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _DWORD *v35;
  id v36;

  v11 = a7;
  v12 = objc_msgSend(v11, "installType");
  if (v12 == 2)
    v13 = 35;
  else
    v13 = 40;
  if (v12 == 2)
    v14 = 10;
  else
    v14 = 0;
  if (v12 == 2)
    v15 = 55;
  else
    v15 = 60;
  objc_msgSend(v11, "bundleIdentifier", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LSInstallProgressService progressProportionsForBundleID:](self, "progressProportionsForBundleID:", v16);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  v17 = (unint64_t)v36;
  if (v36)
  {
    objc_msgSend(v36, "objectForKeyedSubscript:", &unk_1E1075810);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;
    objc_msgSend(v36, "objectForKeyedSubscript:", &unk_1E1075828);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v20 + v22;
    objc_msgSend(v36, "objectForKeyedSubscript:", &unk_1E1075840);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "doubleValue");
    v26 = v23 + v25;
    objc_msgSend(v36, "objectForKeyedSubscript:", &unk_1E1075858);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v26 + v28;

    v15 = computeEffectiveUnitsForPhase(0, v15, v36, v29);
    v14 = computeEffectiveUnitsForPhase(2, v14, v36, v29);
    v13 = computeEffectiveUnitsForPhase(1, v13, v36, v29);
    v17 = computeEffectiveUnitsForPhase(4, v13, v36, v29);
  }
  v30 = 100.0 / (double)(v13 + v15 + v17 + v14);
  v31 = (unint64_t)(v30 * (double)v14);
  v32 = (unint64_t)(v30 * (double)v13);
  v33 = (unint64_t)(v30 * (double)v17);
  if (a3)
    *a3 = 100 - v33 - (v32 + v31);
  if (a4)
    *a4 = v31;
  if (a5)
    *a5 = v32;
  if (v35)
    *v35 = v33;

}

- (unint64_t)finalInstallPhaseForAppProxy:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "correspondingApplicationRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "requiresPostProcessing"))
    v4 = 4;
  else
    v4 = 1;

  return v4;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  os_unfair_lock_s *v21;
  _LSInstallProgressService *v22;
  void *v23;
  char v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *p_super;
  int v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  int v50;
  uint64_t v51;
  _LSInstallProgressService *obj;
  NSObject *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];
  NSObject *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  uint64_t v69;
  uint8_t buf[4];
  NSObject *v71;
  __int16 v72;
  _BYTE v73[20];
  id v74;
  int v75;
  __int16 v76;
  int v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a6;
  if (v16 && _NSIsNSString() && -[NSObject length](v16, "length"))
  {
    v17 = -[NSObject rangeOfString:options:](v16, "rangeOfString:options:", CFSTR("."), 4);
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      _LSProgressLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.1();
      goto LABEL_9;
    }
    v19 = v17;
    -[NSObject substringToIndex:](v16, "substringToIndex:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    -[NSObject substringFromIndex:](v16, "substringFromIndex:", v19 + 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18 || !_NSIsNSString() || !-[NSObject length](v18, "length"))
    {
      _LSProgressLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v10;
        _os_log_impl(&dword_182882000, v34, OS_LOG_TYPE_DEFAULT, "Received kvo for %@ notification with invalid bundleID", buf, 0xCu);
      }

      goto LABEL_28;
    }
    _LSProgressLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      v71 = v18;
      v72 = 2112;
      *(_QWORD *)v73 = v16;
      *(_WORD *)&v73[8] = 2112;
      *(_QWORD *)&v73[10] = v10;
      *(_WORD *)&v73[18] = 2112;
      v74 = v12;
      _os_log_debug_impl(&dword_182882000, v20, OS_LOG_TYPE_DEBUG, "Received kvo for %@ <%@:%@> with change %@", buf, 0x2Au);
    }

    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__53;
    v67 = __Block_byref_object_dispose__53;
    v68 = 0;
    _LSServer_DatabaseExecutionContext();
    v21 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __76___LSInstallProgressService_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v60[3] = &unk_1E103FB40;
    v62 = &v63;
    v53 = v18;
    v61 = v53;
    -[LSDBExecutionContext syncRead:](v21, v60);

    if (!v64[5])
    {
      _LSProgressLog();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.2();
      goto LABEL_37;
    }
    v22 = self;
    objc_sync_enter(v22);
    obj = v22;
    -[LSInstallProgressList progressForBundleID:](v22->_progresses, "progressForBundleID:", v53);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    if (v56 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v56, "installPhaseString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v57, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
      {
        if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("fractionCompleted")))
        {
          objc_msgSend(v14, "doubleValue");
          v26 = v25;
          objc_msgSend(v15, "doubleValue");
          v28 = v27;
          objc_msgSend(v15, "doubleValue");
          v30 = v29;
          objc_msgSend(v14, "doubleValue");
          if (v30 < v31)
            goto LABEL_36;
          objc_msgSend(v15, "doubleValue");
          if (v32 > 1.0 || v28 == v26)
            goto LABEL_36;
          v58 = 0;
          v59 = 0;
          -[_LSInstallProgressService getMaxProgressPhaseUnitsForLoading:restoring:installing:essentialAssets:forAppProxy:](obj, "getMaxProgressPhaseUnitsForLoading:restoring:installing:essentialAssets:forAppProxy:", (char *)&v59 + 4, &v59, (char *)&v58 + 4, &v58, v64[5]);
          v33 = 0;
          v54 = 0;
          v51 = 0;
          switch(objc_msgSend(v56, "installPhase"))
          {
            case 0:
              v54 = 0;
              v51 = 0;
              v33 = (int)(v28 * (double)SHIDWORD(v59));
              break;
            case 1:
              v33 = HIDWORD(v59);
              v54 = v59;
              LODWORD(v51) = 0;
              HIDWORD(v51) = (int)(v28 * (double)SHIDWORD(v58));
              break;
            case 2:
              v51 = 0;
              v33 = HIDWORD(v59);
              v54 = (int)(v28 * (double)(int)v59);
              break;
            case 3:
              break;
            case 4:
              v33 = HIDWORD(v59);
              v54 = v59;
              LODWORD(v51) = (int)(v28 * (double)(int)v58);
              HIDWORD(v51) = HIDWORD(v58);
              break;
            default:
              v54 = 0;
              v51 = 0;
              break;
          }
          _LSProgressLog();
          v47 = objc_claimAutoreleasedReturnValue();
          v48 = (v54 + v33 + HIDWORD(v51) + (int)v51);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v50 = objc_msgSend(v56, "installPhase");
            *(_DWORD *)buf = 134219522;
            v71 = v48;
            v72 = 1024;
            *(_DWORD *)v73 = v50;
            *(_WORD *)&v73[4] = 2112;
            *(_QWORD *)&v73[6] = v16;
            *(_WORD *)&v73[14] = 1024;
            *(_DWORD *)&v73[16] = HIDWORD(v59);
            LOWORD(v74) = 1024;
            *(_DWORD *)((char *)&v74 + 2) = v59;
            HIWORD(v74) = 1024;
            v75 = HIDWORD(v58);
            v76 = 1024;
            v77 = v58;
            _os_log_debug_impl(&dword_182882000, v47, OS_LOG_TYPE_DEBUG, "setting completed unit count to %llu for progress in phase %d (ps %@). maxes: %d %d %d %d", buf, 0x34u);
          }

          objc_msgSend(v56, "setCompletedUnitCount:", v48);
        }
        else
        {
          if (!-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("userInfo.installState")))
          {
            if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("pausable")))
            {
              v43 = objc_msgSend(v15, "BOOLValue");
              if (v43 != objc_msgSend(v56, "isPausable"))
                objc_msgSend(v56, "setPausable:", objc_msgSend(v15, "BOOLValue"));
            }
            else if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("cancellable")))
            {
              v44 = objc_msgSend(v15, "BOOLValue");
              if (v44 != objc_msgSend(v56, "isCancellable"))
                objc_msgSend(v56, "setCancellable:", objc_msgSend(v15, "BOOLValue"));
            }
            else if (-[NSObject isEqualToString:](v10, "isEqualToString:", CFSTR("prioritizable")))
            {
              v45 = objc_msgSend(v15, "BOOLValue");
              if (v45 != objc_msgSend(v56, "isPrioritizable"))
                objc_msgSend(v56, "setPrioritizable:", objc_msgSend(v15, "BOOLValue"));
            }
            goto LABEL_36;
          }
          v37 = objc_msgSend(v14, "intValue");
          if (v37 == objc_msgSend(v15, "intValue"))
            goto LABEL_36;
          _LSProgressLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "integerValue"));
            v55 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v56, "installPhase"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v71 = v55;
            v72 = 2112;
            *(_QWORD *)v73 = v49;
            _os_log_debug_impl(&dword_182882000, v38, OS_LOG_TYPE_DEBUG, "LSInstallProgress: Got update for userInfo.installState: newVal = %@, parentPhase = %@", buf, 0x16u);

          }
          if (objc_msgSend(v15, "integerValue") == 5
            && (v39 = objc_msgSend(v56, "installPhase"),
                v39 != -[_LSInstallProgressService finalInstallPhaseForAppProxy:](obj, "finalInstallPhaseForAppProxy:", v64[5])))
          {
            v42 = 0;
          }
          else
          {
            objc_msgSend(v56, "setInstallState:", (int)objc_msgSend(v15, "intValue"));
            _LSProgressLog();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v15, "intValue"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.4(v41, (uint64_t)buf, v40);
            }

            v42 = 1;
          }
          if (objc_msgSend(v15, "intValue") == 4
            || objc_msgSend(v15, "intValue") == 2
            || !objc_msgSend(v15, "intValue"))
          {
            objc_msgSend(v56, "setPausable:", 1);
            objc_msgSend(v56, "setCancellable:", 1);
            objc_msgSend(v56, "setPrioritizable:", 1);
            if (objc_msgSend(v15, "intValue") == 4)
              objc_msgSend(v56, "setCompletedUnitCount:", 0);
          }
          if (!v42)
          {
LABEL_36:

            p_super = &obj->super;
            objc_sync_exit(obj);
LABEL_37:

            _Block_object_dispose(&v63, 8);
LABEL_28:

            goto LABEL_9;
          }
        }
        v69 = v64[5];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1, v51);
        v35 = objc_claimAutoreleasedReturnValue();
        -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:](obj, "sendNotification:forAppProxies:Plugins:completion:", 3, v35, 0, 0);
      }
      else
      {
        _LSProgressLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v56, "installPhaseString");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v71 = v16;
          v72 = 2112;
          *(_QWORD *)v73 = v46;
          *(_WORD *)&v73[8] = 2112;
          *(_QWORD *)&v73[10] = v57;
          _os_log_debug_impl(&dword_182882000, v35, OS_LOG_TYPE_DEBUG, "LSInstallProgress: Got update for %@ but parent phase %@ does not match %@", buf, 0x20u);

        }
      }
    }
    else
    {
      _LSProgressLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        -[_LSInstallProgressService observeValueForKeyPath:ofObject:change:context:].cold.3();
    }

    goto LABEL_36;
  }
  _LSProgressLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = v10;
    _os_log_impl(&dword_182882000, v18, OS_LOG_TYPE_DEFAULT, "Received kvo for %@ notification with invalid context", buf, 0xCu);
  }
LABEL_9:

  objc_autoreleasePoolPop(v13);
}

- (id)parentProgressForApplication:(id)a3 andPhase:(unint64_t)a4 isActive:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  _LSInstallProgressService *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  NSObject *v33;
  void *context;
  uint8_t buf[4];
  _BYTE v37[10];
  _BYTE v38[10];
  const __CFString *v39;
  uint64_t v40;

  v5 = a5;
  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  context = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    -[LSInstallProgressList progressForBundleID:](v10->_progresses, "progressForBundleID:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_installIndexes, "objectForKeyedSubscript:", v9);
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_installTypes, "objectForKeyedSubscript:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");
      if (v13 && ((v15 = objc_msgSend(v8, "installType"), (unint64_t)(v14 - 7) > 2) || v14 == v15))
      {
        if ((-[NSMutableSet containsObject:](v10->_inactiveInstalls, "containsObject:", v9) & v5) == 1)
        {
          _LSProgressLog();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "_LSDescription");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v37 = v25;
            _os_log_impl(&dword_182882000, v24, OS_LOG_TYPE_DEFAULT, "Updating installState for %@ to LSInstallStateWaiting", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_installTypes, "setObject:forKeyedSubscript:", v26, v9);

          -[NSMutableSet removeObject:](v10->_inactiveInstalls, "removeObject:", v9);
          -[NSMutableOrderedSet addObject:](v10->_orderedInstalls, "addObject:", v9);
          -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
          objc_msgSend(v11, "setInstallState:", 0);
        }
      }
      else
      {
        _LSProgressLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v37 = objc_msgSend(v8, "installType");
          *(_WORD *)&v37[4] = 1024;
          *(_DWORD *)&v37[6] = v14;
          *(_WORD *)v38 = 2112;
          *(_QWORD *)&v38[2] = v8;
          _os_log_debug_impl(&dword_182882000, v16, OS_LOG_TYPE_DEBUG, "Updating install type to %u from %u from: %@", buf, 0x18u);
        }

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_installTypes, "setObject:forKeyedSubscript:", v17, v9);

        if (!v12)
        {
          -[NSMutableSet removeObject:](v10->_inactiveInstalls, "removeObject:", v9);
          if (v5)
          {
            -[NSMutableOrderedSet addObject:](v10->_orderedInstalls, "addObject:", v9);
            objc_msgSend(v11, "setInstallState:", 0);
          }
          else
          {
            -[NSMutableSet addObject:](v10->_inactiveInstalls, "addObject:", v9);
          }
        }
        -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
      }
      if (a4 == 3 && objc_msgSend(v11, "installPhase") != 2)
        goto LABEL_37;
      _LSProgressLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "_LSDescription");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v37 = v30;
        *(_WORD *)&v37[8] = 2112;
        *(_QWORD *)v38 = v31;
        _os_log_impl(&dword_182882000, v29, OS_LOG_TYPE_DEFAULT, "Updating installPhase for %@ to %@", buf, 0x16u);

      }
      objc_msgSend(v11, "setInstallPhase:", a4);
      if (a4 <= 4 && ((1 << a4) & 0x19) != 0)
      {
LABEL_37:
        objc_msgSend(v11, "setPausable:", 1);
        v32 = 1;
        objc_msgSend(v11, "setCancellable:", 1);
      }
      else
      {
        objc_msgSend(v11, "setPausable:", 0);
        objc_msgSend(v11, "setCancellable:", 0);
        v32 = a4 == 1;
      }
      objc_msgSend(v11, "setPrioritizable:", v32);

    }
    else
    {
      if (v5)
      {
        if ((-[NSMutableOrderedSet containsObject:](v10->_orderedInstalls, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableOrderedSet addObject:](v10->_orderedInstalls, "addObject:", v9);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_installTypes, "setObject:forKeyedSubscript:", v22, v9);

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableOrderedSet indexOfObject:](v10->_orderedInstalls, "indexOfObject:", v9));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v10->_installIndexes, "setObject:forKey:", v23, v9);

        }
        if (!v10->_usingNetwork)
        {
          v10->_usingNetwork = 1;
          -[_LSInstallProgressService sendNetworkUsageChangedNotification](v10, "sendNetworkUsageChangedNotification");
        }
      }
      else if ((-[NSMutableSet containsObject:](v10->_inactiveInstalls, "containsObject:", v9) & 1) == 0)
      {
        -[NSMutableSet addObject:](v10->_inactiveInstalls, "addObject:", v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "installType"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_installTypes, "setObject:forKeyedSubscript:", v27, v9);

      }
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB38A8]), "initWithParent:bundleID:andPhase:", 0, v9, a4);
      -[LSInstallProgressList setProgress:forBundleID:](v10->_progresses, "setProgress:forBundleID:", v11, v9);
      objc_msgSend(v11, "ls_setExpectedFinalInstallPhase:", -[_LSInstallProgressService finalInstallPhaseForAppProxy:](v10, "finalInstallPhaseForAppProxy:", v8));
      objc_msgSend(v11, "_publish");
      _LSProgressLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "_LSDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v37 = v28;
        _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Created parent progress %@", buf, 0xCu);

      }
    }

    objc_sync_exit(v10);
    objc_autoreleasePoolPop(context);
    _LSProgressLog();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      -[_LSInstallProgressService parentProgressForApplication:andPhase:isActive:].cold.1(v11, (uint64_t)v8, v33);

  }
  else
  {
    _LSProgressLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = CFSTR("INACTIVE");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v37 = v8;
      *(_WORD *)&v37[8] = 2112;
      if (v5)
        v21 = CFSTR("ACTIVE");
      *(_QWORD *)v38 = v19;
      *(_WORD *)&v38[8] = 2112;
      v39 = v21;
      _os_log_impl(&dword_182882000, v18, OS_LOG_TYPE_DEFAULT, "Invalid bundleID, failed to create parent progress for %@ {%@-%@}", buf, 0x20u);

    }
    objc_autoreleasePoolPop(context);
    v11 = 0;
  }

  return v11;
}

- (void)createInstallProgressForApplication:(id)a3 withPhase:(unint64_t)a4 andPublishingString:(id)a5 reply:(id)a6
{
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  NSMutableSet *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _LSInstallProgressService *v40;
  id v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)MEMORY[0x186DAE7A0]();
  if (v12)
  {
    v15 = self->_publishingStrings;
    objc_sync_enter(v15);
    -[NSMutableSet member:](self->_publishingStrings, "member:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;

    }
    else
    {
      _LSProgressLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v47 = v12;
        _os_log_impl(&dword_182882000, v19, OS_LOG_TYPE_DEFAULT, "Using publishing string \"%{public}@\" for the first time", buf, 0xCu);
      }

      -[NSMutableSet addObject:](self->_publishingStrings, "addObject:", v12);
      -[NSMutableSet member:](self->_publishingStrings, "member:", v12);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_LSInstallProgressService.m"), 1023, CFSTR("Failed to get back value \"%@\" we just inserted into an NSMutableSet."), 0);

        v18 = 0;
      }
    }

    objc_sync_exit(v15);
  }
  else
  {
    v18 = 0;
  }
  _LSProgressLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v11;
    v48 = 2112;
    v49 = v36;
    v50 = 2112;
    v51 = v18;
    _os_log_debug_impl(&dword_182882000, v20, OS_LOG_TYPE_DEBUG, "createInstallProgressForApplication:%@ withPhase:%@ andPublishingString:%@", buf, 0x20u);

  }
  objc_msgSend(v11, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    _LSProgressLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = 0;
      _os_log_impl(&dword_182882000, v31, OS_LOG_TYPE_DEFAULT, "Cannot create install progress for app, invalid app proxy %@", buf, 0xCu);
    }

    v44 = *MEMORY[0x1E0CB2938];
    v45 = CFSTR("invalid application proxy");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]", 1034, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v33);

    goto LABEL_29;
  }
  if (!v18)
  {
    _LSProgressLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v47 = v11;
      v48 = 2112;
      v49 = 0;
      _os_log_impl(&dword_182882000, v34, OS_LOG_TYPE_DEFAULT, "Cannot create install progress for app %@, missing publishing key %@", buf, 0x16u);
    }

    v42 = *MEMORY[0x1E0CB2938];
    v43 = CFSTR("no publishing key");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]", 1040, v32);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v35);

    goto LABEL_29;
  }
  -[_LSInstallProgressService parentProgressForApplication:andPhase:isActive:](self, "parentProgressForApplication:andPhase:isActive:", v11, a4, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  _LSProgressLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v22, "_LSDescription");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = v24;
    v48 = 2112;
    v49 = v25;
    _os_log_impl(&dword_182882000, v23, OS_LOG_TYPE_DEFAULT, "Parent progress for installation %@, adding phase %@", buf, 0x16u);

  }
  if (!v22)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10810, (uint64_t)"-[_LSInstallProgressService createInstallProgressForApplication:withPhase:andPublishingString:reply:]", 1048, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v32);
LABEL_29:

    objc_autoreleasePoolPop(v14);
    goto LABEL_30;
  }
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __101___LSInstallProgressService_createInstallProgressForApplication_withPhase_andPublishingString_reply___block_invoke;
  v38[3] = &unk_1E10465D8;
  v26 = v18;
  v39 = v26;
  v40 = self;
  v27 = v21;
  v41 = v27;
  v28 = (void *)MEMORY[0x186DAE9BC](v38);
  objc_msgSend(MEMORY[0x1E0CB38A8], "_addSubscriberForCategory:usingPublishingHandler:", v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    -[LSInstallProgressList addSubscriber:forPublishingKey:andBundleID:](self->_progresses, "addSubscriber:forPublishingKey:andBundleID:", v29, v26, v27);
  _LSProgressLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v26;
    _os_log_impl(&dword_182882000, v30, OS_LOG_TYPE_DEFAULT, "Subscribing to %@", buf, 0xCu);
  }

  objc_autoreleasePoolPop(v14);
  v13[2](v13, 0);
LABEL_30:

}

- (void)rebuildInstallIndexes
{
  unint64_t v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary removeAllObjects](self->_installIndexes, "removeAllObjects");
  if (-[NSMutableOrderedSet count](self->_orderedInstalls, "count"))
  {
    v3 = 0;
    do
    {
      -[NSMutableOrderedSet objectAtIndex:](self->_orderedInstalls, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_installIndexes, "setObject:forKey:", v5, v4);

      ++v3;
    }
    while (-[NSMutableOrderedSet count](self->_orderedInstalls, "count") > v3);
  }
}

- (void)installationEndedForApplication:(id)a3 withState:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _LSInstallProgressService *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x186DAE7A0]();
  _LSProgressLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v6;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_DEFAULT, "Installation ended for %@ with state %@", (uint8_t *)&v14, 0x16u);

  }
  v10 = self;
  objc_sync_enter(v10);
  -[LSInstallProgressList progressForBundleID:](v10->_progresses, "progressForBundleID:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if (a4 == 5)
      objc_msgSend(v11, "setCompletedUnitCount:", 100);
    objc_msgSend(v12, "setInstallState:", a4);
    if (-[NSMutableSet containsObject:](v10->_inactiveInstalls, "containsObject:", v6))
    {
      -[NSMutableSet removeObject:](v10->_inactiveInstalls, "removeObject:", v6);
    }
    else
    {
      -[NSMutableOrderedSet removeObject:](v10->_orderedInstalls, "removeObject:", v6);
      -[NSMutableDictionary removeObjectForKey:](v10->_installIndexes, "removeObjectForKey:", v6);
      -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
    }
    -[NSMutableDictionary removeObjectForKey:](v10->_installTypes, "removeObjectForKey:", v6);
    if (!-[NSMutableOrderedSet count](v10->_orderedInstalls, "count") && v10->_usingNetwork)
    {
      v10->_usingNetwork = 0;
      -[_LSInstallProgressService sendNetworkUsageChangedNotification](v10, "sendNetworkUsageChangedNotification");
    }
    objc_msgSend(v12, "_unpublish");
    -[LSInstallProgressList removeProgressForBundleID:](v10->_progresses, "removeProgressForBundleID:", v6);
    -[_LSInstallProgressService discardProportionsForBundleID:](v10, "discardProportionsForBundleID:", v6);
  }
  else
  {
    _LSProgressLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "Could not find parent progress for %@, it may have been removed", (uint8_t *)&v14, 0xCu);
    }

  }
  objc_sync_exit(v10);

  objc_autoreleasePoolPop(v7);
}

- (void)installationFailedForApplication:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _LSInstallProgressService *v7;
  void *v8;
  os_unfair_lock_s *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  __int128 *p_buf;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x186DAE7A0]();
  _LSProgressLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[_LSInstallProgressService installationFailedForApplication:].cold.2();

  v7 = self;
  objc_sync_enter(v7);
  -[LSInstallProgressList progressForBundleID:](v7->_progresses, "progressForBundleID:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__53;
    v20 = __Block_byref_object_dispose__53;
    v21 = 0;
    _LSServer_DatabaseExecutionContext();
    v9 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __62___LSInstallProgressService_installationFailedForApplication___block_invoke;
    v13[3] = &unk_1E103FB40;
    p_buf = &buf;
    v10 = v4;
    v14 = v10;
    -[LSDBExecutionContext syncRead:](v9, v13);

    -[NSMutableSet addObject:](v7->_inactiveInstalls, "addObject:", v10);
    -[NSMutableOrderedSet removeObject:](v7->_orderedInstalls, "removeObject:", v10);
    -[_LSInstallProgressService rebuildInstallIndexes](v7, "rebuildInstallIndexes");
    if (!-[NSMutableOrderedSet count](v7->_orderedInstalls, "count") && v7->_usingNetwork)
    {
      v7->_usingNetwork = 0;
      -[_LSInstallProgressService sendNetworkUsageChangedNotification](v7, "sendNetworkUsageChangedNotification");
    }
    objc_msgSend(v8, "setCompletedUnitCount:", 0);
    objc_msgSend(v8, "setInstallState:", 4);
    objc_msgSend(v8, "setCancellable:", 1);
    objc_msgSend(v8, "setPausable:", 1);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v16 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
      v11 = objc_claimAutoreleasedReturnValue();
      -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:](v7, "sendNotification:forAppProxies:Plugins:completion:", 3, v11, 0, 0);
    }
    else
    {
      _LSProgressLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[_LSInstallProgressService installationFailedForApplication:].cold.1();
    }

    objc_msgSend(v8, "_unpublish");
    -[LSInstallProgressList removeProgressForBundleID:](v7->_progresses, "removeProgressForBundleID:", v10);
    -[_LSInstallProgressService discardProportionsForBundleID:](v7, "discardProportionsForBundleID:", v10);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    _LSProgressLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "Could not find parent progress for %@, it may have been removed", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_sync_exit(v7);

  objc_autoreleasePoolPop(v5);
}

- (void)_placeholderIconUpdatedForApp:(id)a3
{
  _LSInstallProgressService *v4;
  NSMutableSet *inactiveInstalls;
  void *v6;
  NSMutableDictionary *installIndexes;
  void *v8;
  void *v9;
  NSMutableOrderedSet *orderedInstalls;
  void *v11;
  id v12;

  v12 = a3;
  v4 = self;
  objc_sync_enter(v4);
  inactiveInstalls = v4->_inactiveInstalls;
  objc_msgSend(v12, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(inactiveInstalls) = -[NSMutableSet containsObject:](inactiveInstalls, "containsObject:", v6);

  if ((inactiveInstalls & 1) == 0)
  {
    installIndexes = v4->_installIndexes;
    objc_msgSend(v12, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](installIndexes, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      orderedInstalls = v4->_orderedInstalls;
      objc_msgSend(v12, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet addObject:](orderedInstalls, "addObject:", v11);

      -[_LSInstallProgressService rebuildInstallIndexes](v4, "rebuildInstallIndexes");
    }

  }
  objc_sync_exit(v4);

}

- (void)_placeholdersUninstalled:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _LSInstallProgressService *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 138412290;
    v13 = v6;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "bundleIdentifier", v13, (_QWORD)v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = self;
        objc_sync_enter(v10);
        if ((-[NSMutableSet containsObject:](self->_inactiveInstalls, "containsObject:", v9) & 1) == 0)
        {
          -[NSMutableDictionary objectForKey:](self->_installIndexes, "objectForKey:", v9);

        }
        _LSProgressLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v13;
          v19 = v9;
          _os_log_impl(&dword_182882000, v11, OS_LOG_TYPE_DEFAULT, "Placeholder for %@ uninstalled; removing progress tracking",
            buf,
            0xCu);
        }

        -[LSInstallProgressList progressForBundleID:](self->_progresses, "progressForBundleID:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](self->_inactiveInstalls, "removeObject:", v9);
        -[NSMutableOrderedSet removeObject:](self->_orderedInstalls, "removeObject:", v9);
        -[_LSInstallProgressService rebuildInstallIndexes](v10, "rebuildInstallIndexes");
        if (!-[NSMutableOrderedSet count](self->_orderedInstalls, "count") && self->_usingNetwork)
        {
          self->_usingNetwork = 0;
          -[_LSInstallProgressService sendNetworkUsageChangedNotification](v10, "sendNetworkUsageChangedNotification");
        }
        -[NSMutableDictionary removeObjectForKey:](self->_installTypes, "removeObjectForKey:", v9);
        objc_msgSend(v12, "_unpublish");
        -[LSInstallProgressList removeProgressForBundleID:](self->_progresses, "removeProgressForBundleID:", v9);
        -[_LSInstallProgressService discardProportionsForBundleID:](v10, "discardProportionsForBundleID:", v9);

        objc_sync_exit(v10);
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

- (void)sendNotification:(id)a3 ForPlugins:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "correspondingApplicationExtensionRecord", (_QWORD)v15);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    -[_LSInstallProgressService sendNotification:forApplicationExtensionRecords:](self, "sendNotification:forApplicationExtensionRecords:", v6, v8);
  }

}

- (void)sendNotification:(id)a3 forApplicationExtensionRecords:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  const char **v16;
  id v17;
  const char *v18;
  NSObject *installControlsQueue;
  _LSInstallProgressService *v20;
  _QWORD block[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v20 = self;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v25;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v25 != v12)
            objc_enumerationMutation(v9);
          v14 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v13);
          if (recordSelectorsForPluginNotification_onceToken != -1)
            dispatch_once(&recordSelectorsForPluginNotification_onceToken, &__block_literal_global_475);
          if (recordSelectorsForPluginNotification_registeredSels)
          {
            v15 = *(const char **)recordSelectorsForPluginNotification_registeredSels;
            if (*(_QWORD *)recordSelectorsForPluginNotification_registeredSels)
            {
              v16 = (const char **)(recordSelectorsForPluginNotification_registeredSels + 8);
              do
              {
                v17 = objc_msgSend(v14, v15);
                v18 = *v16++;
                v15 = v18;
              }
              while (v18);
            }
          }
          objc_msgSend(v14, "detach");

          ++v13;
        }
        while (v13 != v11);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v11);
    }

    installControlsQueue = v20->_installControlsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77___LSInstallProgressService_sendNotification_forApplicationExtensionRecords___block_invoke;
    block[3] = &unk_1E103FCC8;
    v22 = v9;
    v23 = v6;
    dispatch_async(installControlsQueue, block);

  }
}

- (SEL)observerSelectorForNotification:(int)a3
{
  SEL result;

  result = 0;
  switch(a3)
  {
    case 1:
      result = sel_applicationInstallsDidStart_;
      break;
    case 2:
      result = sel_applicationInstallsDidUpdateIcon_;
      break;
    case 4:
      result = sel_applicationsWillInstall_;
      break;
    case 5:
      result = sel_applicationsWillUninstall_;
      break;
    case 7:
    case 10:
      result = sel_applicationsDidInstall_;
      break;
    case 8:
    case 9:
      result = sel_applicationsDidUninstall_;
      break;
    case 11:
      result = sel_applicationsDidFailToInstall_;
      break;
    case 12:
      result = sel_applicationsDidFailToUninstall_;
      break;
    case 13:
      result = sel_applicationIconDidChange_;
      break;
    case 14:
      result = sel_applicationsDidChangePersonas_;
      break;
    case 15:
      result = sel_applicationInstallsDidChange_;
      break;
    default:
      return result;
  }
  return result;
}

- (void)sendNotification:(int)a3 forAppProxies:(id)a4 Plugins:(BOOL)a5 completion:(id)a6
{
  id v9;
  uint64_t (**v10)(_QWORD);
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  NSObject *observersQueue;
  void *v26;
  void *v27;
  _LSInstallProgressService *v28;
  int v29;
  uint64_t (**v30)(_QWORD);
  void *v31;
  _BOOL4 v32;
  void *v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t (**v39)(_QWORD);
  int v40;
  BOOL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  _BYTE v47[128];
  uint64_t v48;

  v32 = a5;
  v48 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (uint64_t (**)(_QWORD))a6;
  MEMORY[0x186DAF208]();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke;
  v46[3] = &unk_1E1040478;
  v46[4] = self;
  v30 = v10;
  v29 = a3;
  v28 = self;
  if (sendNotification_forAppProxies_Plugins_completion__onceToken != -1)
    dispatch_once(&sendNotification_forAppProxies_Plugins_completion__onceToken, v46);
  v33 = (void *)objc_opt_new();
  v31 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v17, "bundleType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("Hidden"));

        if ((v19 & 1) == 0)
        {
          objc_msgSend(v17, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);

          objc_msgSend(v17, "bundleType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("VPNPlugin"));

          if ((v22 & 1) == 0)
          {
            objc_msgSend(v33, "addObject:", v17);
            if (v32)
            {
              objc_msgSend(v17, "plugInKitPlugins");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObjectsFromArray:", v23);

            }
          }
        }
        objc_msgSend(v17, "detach");
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v14);
  }

  v24 = objc_msgSend(v33, "count");
  if (v24)
  {
    observersQueue = v28->_observersQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79___LSInstallProgressService_sendNotification_forAppProxies_Plugins_completion___block_invoke_2;
    block[3] = &unk_1E1046600;
    block[4] = v28;
    v40 = v29;
    v35 = v12;
    v41 = v32;
    v36 = v33;
    v37 = v11;
    v26 = v31;
    v38 = v31;
    v27 = v30;
    v39 = v30;
    dispatch_async(observersQueue, block);

  }
  else
  {
    v27 = v30;
    v26 = v31;
    if (v30)
      v24 = v30[2](v30);
    MEMORY[0x186DAF214](v24);
  }

}

- (void)sendDatabaseRebuiltNotificationToObserver:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  v4 = (void *)MEMORY[0x186DAE7A0]();
  objc_msgSend(v3, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71___LSInstallProgressService_sendDatabaseRebuiltNotificationToObserver___block_invoke;
  v8[3] = &unk_1E1040A90;
  v6 = v3;
  v9 = v6;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "databaseWasRebuilt");

  objc_autoreleasePoolPop(v4);
}

- (void)sendDatabaseRebuiltNotification
{
  void *v3;
  NSObject *observersQueue;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)os_transaction_create();
  observersQueue = self->_observersQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60___LSInstallProgressService_sendDatabaseRebuiltNotification__block_invoke;
  v6[3] = &unk_1E103FCC8;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(observersQueue, v6);

}

- (id)_prepareApplicationProxiesForNotification:(int)a3 identifiers:(id)a4 withPlugins:(BOOL)a5
{
  id v7;
  os_unfair_lock_s *v8;
  BOOL v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__53;
  v23 = __Block_byref_object_dispose__53;
  v24 = (id)objc_opt_new();
  _LSServer_DatabaseExecutionContext();
  v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v10 = a3 == 15 || (a3 - 1) < 3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95___LSInstallProgressService__prepareApplicationProxiesForNotification_identifiers_withPlugins___block_invoke;
  v14[3] = &unk_1E1046628;
  v11 = v7;
  v17 = v10;
  v15 = v11;
  v16 = &v19;
  v18 = a5;
  -[LSDBExecutionContext syncRead:](v8, v14);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void)sendNotification:(int)a3 forApps:(id)a4 withPlugins:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v7 = a5;
  v8 = *(_QWORD *)&a3;
  v13 = a4;
  v10 = a6;
  v11 = (void *)MEMORY[0x186DAE7A0]();
  -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:](self, "_prepareApplicationProxiesForNotification:identifiers:withPlugins:", v8, v13, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:](self, "sendNotification:forAppProxies:Plugins:completion:", v8, v12, v7, v10);

  objc_autoreleasePoolPop(v11);
}

- (void)loadProportions
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_2_0(&dword_182882000, v0, v1, "Couldn't deserialize proportion state: got %@, error %@");
  OUTLINED_FUNCTION_1();
}

- (void)saveProportions
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Could not write progress proportions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)coalesceProportionsSave
{
  NSObject *v3;
  NSObject *progressProportionsSaveTimerSource;
  dispatch_time_t v5;
  uint8_t v6[16];

  _LSProgressLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_182882000, v3, OS_LOG_TYPE_INFO, "Coalescing progress proportions save", v6, 2u);
  }

  progressProportionsSaveTimerSource = self->_progressProportionsSaveTimerSource;
  v5 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(progressProportionsSaveTimerSource, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)discardProportionsForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_progressProportionsLock);
  _LSProgressLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "Discarding proportions for %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_progressProportions, "removeObjectForKey:", v4);
  -[_LSInstallProgressService coalesceProportionsSave](self, "coalesceProportionsSave");
  os_unfair_lock_unlock(&self->_progressProportionsLock);

}

- (id)progressProportionsForBundleID:(id)a3
{
  os_unfair_lock_s *p_progressProportionsLock;
  id v5;
  void *v6;
  void *v7;

  p_progressProportionsLock = &self->_progressProportionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_progressProportionsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_progressProportions, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  os_unfair_lock_unlock(p_progressProportionsLock);
  return v7;
}

- (void)setProgressProportionsByPhase:(id)a3 forInstallOfApplicationWithIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  os_unfair_lock_s *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)MEMORY[0x186DAE7A0]();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__53;
  v27 = __Block_byref_object_dispose__53;
  v28 = 0;
  os_unfair_lock_lock(&self->_progressProportionsLock);
  _LSServer_DatabaseExecutionContext();
  v12 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __108___LSInstallProgressService_setProgressProportionsByPhase_forInstallOfApplicationWithIdentifier_completion___block_invoke;
  v20 = &unk_1E1046650;
  v13 = v9;
  v21 = v13;
  v22 = &v23;
  -[LSDBExecutionContext syncRead:](v12, &v17);

  _LSProgressLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v24[5];
    *(_DWORD *)buf = 138412802;
    v30 = v13;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v15;
    _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "Setting progress proportions for %@ to %@, error is %@", buf, 0x20u);
  }

  if (!v24[5])
  {
    v16 = (void *)objc_msgSend(v8, "copy", v17, v18, v19, v20);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_progressProportions, "setObject:forKeyedSubscript:", v16, v13);

    -[_LSInstallProgressService coalesceProportionsSave](self, "coalesceProportionsSave");
  }

  os_unfair_lock_unlock(&self->_progressProportionsLock);
  v10[2](v10, v24[5]);
  _Block_object_dispose(&v23, 8);

  objc_autoreleasePoolPop(v11);
}

- (void)sendNetworkUsageChangedNotification
{
  NSObject *installControlsQueue;
  _QWORD block[5];

  installControlsQueue = self->_installControlsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___LSInstallProgressService_sendNetworkUsageChangedNotification__block_invoke;
  block[3] = &unk_1E1040478;
  block[4] = self;
  dispatch_async(installControlsQueue, block);
}

- (void)addSendNotificationFenceWithTimeout:(double)a3 fenceBlock:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *observersQueue;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD v20[7];
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _QWORD v29[5];
  id v30;

  v6 = a4;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__288;
  v29[4] = __Block_byref_object_dispose__289;
  v30 = (id)MEMORY[0x186DAE9BC]();
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__53;
  v27 = __Block_byref_object_dispose__53;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__53;
  v21[4] = __Block_byref_object_dispose__53;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke;
  v20[3] = &unk_1E1046678;
  v20[4] = v29;
  v20[5] = &v23;
  v20[6] = v21;
  v8 = (void *)MEMORY[0x186DAE9BC](v20);
  if (a3 >= 0.0 && ((*(_QWORD *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE
    || (unint64_t)(*(_QWORD *)&a3 - 1) <= 0xFFFFFFFFFFFFELL)
  {
    v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_observersQueue);
    v12 = (void *)v24[5];
    v24[5] = (uint64_t)v11;

    v13 = v24[5];
    v14 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
    dispatch_source_set_event_handler((dispatch_source_t)v24[5], v8);
    dispatch_resume((dispatch_object_t)v24[5]);
  }
  observersQueue = self->_observersQueue;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __76___LSInstallProgressService_addSendNotificationFenceWithTimeout_fenceBlock___block_invoke_290;
  v17[3] = &unk_1E10466F0;
  v18 = v8;
  v19 = v21;
  v17[4] = self;
  v16 = v8;
  dispatch_async(observersQueue, v17);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(v29, 8);
}

- (id)loadJournalledNotificationsFromDisk
{
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  uint64_t v35;
  id obj;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = 0x1E0CB3000uLL;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "installJournalDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 1, &__block_literal_global_293_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v7)
  {
    v8 = v7;
    v34 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v41;
    v11 = 0x1E0C99000uLL;
    while (1)
    {
      v12 = 0;
      v35 = v8;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
        v14 = *(void **)(v11 + 3408);
        v39 = v9;
        objc_msgSend(v14, "dataWithContentsOfURL:options:error:", v13, 8, &v39);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v39;

        if (!v16)
        {
          v18 = v10;
          v19 = v11;
          v20 = v2;
          v21 = (void *)MEMORY[0x1E0CB3710];
          v22 = objc_opt_class();
          v38 = 0;
          objc_msgSend(v21, "ls_unarchivedObjectOfClass:fromData:error:", v22, v15, &v38);
          v17 = objc_claimAutoreleasedReturnValue();
          v16 = v38;
          _LSInstallLog();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if (v16)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v13;
              v46 = 2112;
              v47 = (uint64_t)v16;
              _os_log_error_impl(&dword_182882000, v24, OS_LOG_TYPE_ERROR, "Error unarchiving notification journal %@: %@", buf, 0x16u);
            }
            goto LABEL_12;
          }
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject primaryBundleID](v17, "primaryBundleID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = -[NSObject installOperation](v17, "installOperation");
            *(_DWORD *)buf = 138412546;
            v45 = v28;
            v46 = 2048;
            v47 = v29;
            _os_log_impl(&dword_182882000, v24, OS_LOG_TYPE_DEFAULT, "Loaded notification journaller for %@, install op %lu", buf, 0x16u);

          }
          if (-[NSObject applicableForCurrentDatabase](v17, "applicableForCurrentDatabase"))
          {
            objc_msgSend(v34, "addObject:", v17);
          }
          else
          {
            _LSInstallLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              -[NSObject primaryBundleID](v17, "primaryBundleID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = -[NSObject installOperation](v17, "installOperation");
              *(_DWORD *)buf = 138412546;
              v45 = v30;
              v46 = 2048;
              v47 = v31;
              _os_log_impl(&dword_182882000, v24, OS_LOG_TYPE_DEFAULT, "Notification journaller for %@, install op %lu, not applicable for current database", buf, 0x16u);

            }
LABEL_12:

          }
          v2 = v20;
          v11 = v19;
          v10 = v18;
          v8 = v35;
          goto LABEL_14;
        }
        _LSInstallLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v45 = v13;
          v46 = 2112;
          v47 = (uint64_t)v16;
          _os_log_error_impl(&dword_182882000, v17, OS_LOG_TYPE_ERROR, "Error reading install notification journal %@: %@", buf, 0x16u);
        }
LABEL_14:

        objc_msgSend(*(id *)(v2 + 1568), "defaultManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v26 = objc_msgSend(v25, "removeItemAtURL:error:", v13, &v37);
        v9 = v37;

        if ((v26 & 1) == 0)
        {
          _LSInstallLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v45 = v13;
            v46 = 2112;
            v47 = (uint64_t)v9;
            _os_log_error_impl(&dword_182882000, v27, OS_LOG_TYPE_ERROR, "Error unlinking notification journal file at %@: %@", buf, 0x16u);
          }

        }
        ++v12;
      }
      while (v8 != v12);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      v8 = v32;
      if (!v32)
      {

        v6 = v34;
        break;
      }
    }
  }

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_296);
  return v6;
}

- (void)performJournalRecovery
{
  uint64_t v3;
  NSObject *observersQueue;
  NSObject *v5;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  observersQueue = self->_observersQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke;
  block[3] = &unk_1E1040478;
  block[4] = self;
  dispatch_sync(observersQueue, block);
  v5 = self->_observersQueue;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __51___LSInstallProgressService_performJournalRecovery__block_invoke_2;
  v6[3] = &unk_1E1040478;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)dispatchJournalledNotificationsToConnectedClients
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSArray *obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = self->_journalledNotificationsToReplay;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v26;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obj);
        v20 = v3;
        v4 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v3);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v4, "journalledNotifications");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v22 != v8)
                objc_enumerationMutation(v5);
              v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              v11 = objc_msgSend(v10, "notification");
              objc_msgSend(v10, "bundleIDs");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:](self, "_prepareApplicationProxiesForNotification:identifiers:withPlugins:", v11, v12, objc_msgSend(v10, "includePlugins"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              _LSInstallLog();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                v15 = objc_msgSend(v10, "notification");
                v16 = objc_msgSend(v10, "includePlugins");
                *(_DWORD *)buf = 67109634;
                v30 = v15;
                v31 = 2112;
                v32 = v13;
                v33 = 1024;
                v34 = v16;
                _os_log_impl(&dword_182882000, v14, OS_LOG_TYPE_DEFAULT, "dispatching journalled notification: %d for %@ (plugins: %d)", buf, 0x18u);
              }

              -[_LSInstallProgressService sendNotification:forAppProxies:Plugins:completion:](self, "sendNotification:forAppProxies:Plugins:completion:", objc_msgSend(v10, "notification"), v13, objc_msgSend(v10, "includePlugins"), 0);
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v35, 16);
          }
          while (v7);
        }

        v3 = v20 + 1;
      }
      while (v20 + 1 != v19);
      v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v19);
  }

}

- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserverProxy:(id)a5
{
  uint64_t v6;
  id v8;
  const char *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v22 = a5;
  v9 = -[_LSInstallProgressService observerSelectorForNotification:](self, "observerSelectorForNotification:", v6);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v20 = v8;
    obj = v8;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "bundleType", v20);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("Hidden")))
          {

          }
          else
          {
            objc_msgSend(v16, "bundleType");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("VPNPlugin"));

            if ((v19 & 1) == 0)
              objc_msgSend(v11, "addObject:", v16);
          }
          objc_msgSend(v22, v10, v11);
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v13);
    }

    v8 = v20;
  }

}

- (void)directlySendNotification:(int)a3 withProxies:(id)a4 toObserver:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __77___LSInstallProgressService_directlySendNotification_withProxies_toObserver___block_invoke;
  v13[3] = &unk_1E1040A90;
  v14 = v8;
  v11 = v8;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LSInstallProgressService directlySendNotification:withProxies:toObserverProxy:](self, "directlySendNotification:withProxies:toObserverProxy:", v6, v9, v12);
}

- (void)dispatchJournalledNotificationsToObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  NSArray *obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint8_t v46[128];
  uint8_t buf[4];
  unint64_t v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSProgressLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (unint64_t)v4;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "Sending journalled notifications to newly connecting observer %@", buf, 0xCu);
  }

  objc_msgSend(v4, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __71___LSInstallProgressService_dispatchJournalledNotificationsToObserver___block_invoke;
  v44[3] = &unk_1E1040A90;
  v27 = v4;
  v45 = v27;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v44);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = self->_journalledNotificationsToReplay;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v31 = v8;
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v8);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v9, "journalledNotifications");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v37 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              _LSProgressLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                v17 = objc_msgSend(v15, "notification");
                objc_msgSend(v15, "bundleIDs");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218242;
                v48 = v17;
                v49 = 2112;
                v50 = v18;
                _os_log_impl(&dword_182882000, v16, OS_LOG_TYPE_INFO, "Sending notification %lu for bundles %@ to observer.", buf, 0x16u);

              }
              v19 = objc_msgSend(v15, "notification");
              objc_msgSend(v15, "bundleIDs");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[_LSInstallProgressService _prepareApplicationProxiesForNotification:identifiers:withPlugins:](self, "_prepareApplicationProxiesForNotification:identifiers:withPlugins:", v19, v20, objc_msgSend(v15, "includePlugins"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              -[_LSInstallProgressService directlySendNotification:withProxies:toObserverProxy:](self, "directlySendNotification:withProxies:toObserverProxy:", objc_msgSend(v15, "notification"), v21, v7);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
          }
          while (v12);
        }

        v8 = v31 + 1;
      }
      while (v31 + 1 != v30);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v30);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = self->_startupJournalledNotifications;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "dispatchToObserver:forInstallProgressService:", v27, self);
      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    }
    while (v24);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProportions, 0);
  objc_storeStrong((id *)&self->_progressProportionsSaveTimerSource, 0);
  objc_storeStrong((id *)&self->_startupJournalledNotifications, 0);
  objc_storeStrong((id *)&self->_journalledNotificationsToReplay, 0);
  objc_storeStrong((id *)&self->_observersQueue, 0);
  objc_storeStrong((id *)&self->_installControlsQueue, 0);
  objc_storeStrong((id *)&self->_installTypes, 0);
  objc_storeStrong((id *)&self->_inactiveInstalls, 0);
  objc_storeStrong((id *)&self->_orderedInstalls, 0);
  objc_storeStrong((id *)&self->_installIndexes, 0);
  objc_storeStrong((id *)&self->_publishingStrings, 0);
  objc_storeStrong((id *)&self->_progresses, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Failed to parse. observeValueForKeyPath: %@ does not contain period", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "In observeValueForKeyPath:%@ could not find appProxy for %@, it may have been removed");
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_0(&dword_182882000, v0, v1, "In observeValueForKeyPath:%@ could not find parent progress for %@, it may have been removed");
  OUTLINED_FUNCTION_1();
}

- (void)observeValueForKeyPath:(NSObject *)a3 ofObject:change:context:.cold.4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_3(&dword_182882000, a3, (uint64_t)a3, "LSInstallProgress: setting parent installState to %@", (uint8_t *)a2);

}

- (void)parentProgressForApplication:(void *)a1 andPhase:(uint64_t)a2 isActive:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_LSDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_7();
  v7 = a2;
  _os_log_debug_impl(&dword_182882000, a3, OS_LOG_TYPE_DEBUG, "Got parent progress %@ for app %@, ", v6, 0x16u);

  OUTLINED_FUNCTION_18_0();
}

- (void)installationFailedForApplication:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_3(&dword_182882000, v0, v1, "Could not find applicationProxy for %@ in installationFailedForApplication:", v2);
  OUTLINED_FUNCTION_1();
}

- (void)installationFailedForApplication:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_182882000, v0, v1, "Installation failed for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
