@implementation MRAVClusterController

void __41__MRAVClusterController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MRAVClusterControler_sharedController;
  _MRAVClusterControler_sharedController = (uint64_t)v1;

}

- (MRAVClusterController)init
{
  MRAVClusterController *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *callbackQueue;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *serialQueue;
  uint64_t v19;
  NSHashTable *observers;
  uint64_t v21;
  NSString *localPairingIdentity;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)MRAVClusterController;
  v2 = -[MRAVClusterController init](&v25, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-callback"), v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-serial"), v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v19 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v19;

    if (+[MRAVClusterController canBeClusterMember](MRAVClusterController, "canBeClusterMember"))
    {
      v21 = MRMediaRemoteCopyDeviceUID();
      localPairingIdentity = v2->_localPairingIdentity;
      v2->_localPairingIdentity = (NSString *)v21;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v2, sel_deviceInfoDidChangeNotification_, CFSTR("kMRDeviceInfoDidChangeNotification"), 0);

    -[MRAVClusterController updateClusterInformation](v2, "updateClusterInformation");
  }
  return v2;
}

- (void)updateClusterInformation
{
  if (+[MRAVClusterController canBeClusterMember](MRAVClusterController, "canBeClusterMember"))
    msv_dispatch_sync_on_queue();
}

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRAVClusterController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, block);
  return (id)_MRAVClusterControler_sharedController;
}

- (unsigned)clusterType
{
  unsigned int v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  if (!+[MRAVClusterController canBeClusterMember](MRAVClusterController, "canBeClusterMember"))
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = *((_DWORD *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (unint64_t)clusterStatus
{
  unint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  if (!+[MRAVClusterController canBeClusterMember](MRAVClusterController, "canBeClusterMember"))
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  msv_dispatch_sync_on_queue();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

+ (BOOL)canBeClusterMember
{
  return 0;
}

- (BOOL)needsCommandRedirection
{
  return -[MRAVClusterController clusterType](self, "clusterType") == 2
      && -[MRAVClusterController clusterStatus](self, "clusterStatus") == 2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MRAVClusterController_registerObserver___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __42__MRAVClusterController_registerObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MRAVClusterController_unregisterObserver___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

uint64_t __44__MRAVClusterController_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __36__MRAVClusterController_clusterType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 64);
  return result;
}

uint64_t __38__MRAVClusterController_clusterStatus__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (NSString)clusterLeaderUID
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__MRAVClusterController_clusterLeaderUID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__MRAVClusterController_clusterLeaderUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)clusterUID
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__22;
  v10 = __Block_byref_object_dispose__22;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MRAVClusterController_clusterUID__block_invoke;
  v5[3] = &unk_1E30C5D20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __35__MRAVClusterController_clusterUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)getClusterStatus:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, unint64_t))a3 + 2))(v5, -[MRAVClusterController clusterStatus](self, "clusterStatus"));

}

- (void)getClusterLeaderEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *serialQueue;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  MRAVLightweightReconnaissanceSession *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  _QWORD block[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[MRAVClusterController canBeClusterMember](MRAVClusterController, "canBeClusterMember")
    && -[MRAVClusterController clusterStatus](self, "clusterStatus") == 2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__22;
    v32 = __Block_byref_object_dispose__22;
    v33 = 0;
    serialQueue = self->_serialQueue;
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke;
    block[3] = &unk_1E30C5D20;
    block[4] = self;
    block[5] = &v28;
    dispatch_sync(serialQueue, block);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Discovering cluster leader with UID: %@"), v29[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("getClusterLeaderEndpoint"), v10);
    v13 = v12;
    if (v11)
      objc_msgSend(v12, "appendFormat:", CFSTR(" for %@"), v11);
    _MRLogForCategory(0xAuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v13;
      _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v15 = objc_alloc_init(MRAVLightweightReconnaissanceSession);
    v16 = v29[5];
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke_25;
    v20[3] = &unk_1E30CABD8;
    v21 = CFSTR("getClusterLeaderEndpoint");
    v17 = v10;
    v22 = v17;
    v18 = v5;
    v23 = v18;
    v25 = v4;
    v26 = &v28;
    v19 = v11;
    v24 = v19;
    -[MRAVLightweightReconnaissanceSession searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:](v15, "searchEndpointsForOutputDeviceUID:timeout:reason:queue:completion:", v16, CFSTR("Discover cluster leader endpoint"), v6, v20, 5.0);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke_25(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to discover cluster leader endpoint with UID: %@"), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = a1[7];
    _MRLogForCategory(0xAuLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v9 = v16;
    if (v6 || !v7)
    {
      if (v6)
      {
        v33 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        if (!v15)
        {
          if (!v33)
            goto LABEL_37;
LABEL_34:
          __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke_25_cold_1();
          goto LABEL_37;
        }
        if (!v33)
          goto LABEL_37;
        v34 = a1[4];
        v35 = a1[5];
        v36 = (void *)a1[7];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", a1[6]);
        *(_DWORD *)buf = 138544386;
        v53 = v34;
        v54 = 2114;
        v55 = v35;
        v56 = 2114;
        v57 = v6;
        v58 = 2114;
        v59 = v36;
        v60 = 2048;
        v61 = v37;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_32:

        goto LABEL_37;
      }
      v41 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (!v41)
          goto LABEL_37;
        v49 = a1[4];
        v50 = a1[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", a1[6]);
        *(_DWORD *)buf = 138543874;
        v53 = v49;
        v54 = 2114;
        v55 = v50;
        v56 = 2048;
        v57 = v51;
        v23 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v24 = v9;
        v25 = 32;
        goto LABEL_31;
      }
      if (!v41)
        goto LABEL_37;
      v42 = a1[4];
      v43 = a1[5];
      v44 = (void *)a1[7];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544130;
      v53 = v42;
      v54 = 2114;
      v55 = v43;
      v56 = 2114;
      v57 = v44;
      v58 = 2048;
      v59 = v45;
      v23 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    else
    {
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (!v17)
          goto LABEL_37;
        v18 = a1[4];
        v19 = a1[5];
        v20 = (void *)a1[7];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "timeIntervalSinceDate:", a1[6]);
        *(_DWORD *)buf = 138544386;
        v53 = v18;
        v54 = 2114;
        v55 = v19;
        v56 = 2112;
        v57 = v7;
        v58 = 2114;
        v59 = v20;
        v60 = 2048;
        v61 = v22;
        v23 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v24 = v9;
        v25 = 52;
        goto LABEL_31;
      }
      if (!v17)
        goto LABEL_37;
      v46 = a1[4];
      v47 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544130;
      v53 = v46;
      v54 = 2114;
      v55 = v47;
      v56 = 2112;
      v57 = v7;
      v58 = 2048;
      v59 = v48;
      v23 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    v24 = v9;
    v25 = 42;
LABEL_31:
    _os_log_impl(&dword_193827000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Discovered leader endpoint: %@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6)
  {
    v26 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v26)
        goto LABEL_37;
      v27 = a1[4];
      v28 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138544130;
      v53 = v27;
      v54 = 2114;
      v55 = v28;
      v56 = 2114;
      v57 = v7;
      v58 = 2048;
      v59 = v29;
      v30 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v31 = v9;
      v32 = 42;
    }
    else
    {
      if (!v26)
        goto LABEL_37;
      v38 = a1[4];
      v39 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
      *(_DWORD *)buf = 138543874;
      v53 = v38;
      v54 = 2114;
      v55 = v39;
      v56 = 2048;
      v57 = v40;
      v30 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v31 = v9;
      v32 = 32;
    }
    _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    goto LABEL_23;
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (!v7)
  {
    if (!v10)
      goto LABEL_37;
    goto LABEL_34;
  }
  if (v10)
  {
    v11 = a1[4];
    v12 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", a1[6]);
    *(_DWORD *)buf = 138544386;
    v53 = v11;
    v54 = 2114;
    v55 = v12;
    v56 = 2114;
    v57 = v6;
    v58 = 2114;
    v59 = v7;
    v60 = 2048;
    v61 = v14;
    _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_23:

  }
LABEL_37:

  (*(void (**)(void))(a1[8] + 16))();
}

- (void)deviceInfoDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MRGetOriginFromUserInfo(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isLocal"))
    -[MRAVClusterController updateClusterInformation](self, "updateClusterInformation");

}

void __49__MRAVClusterController_updateClusterInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  unsigned int v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "getClusterUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "getClusterLeaderUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "getClusterType");
  v5 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v6 = *(_QWORD *)(a1 + 32);
  if (v5 && (v7 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(v6 + 48)), v6 = *(_QWORD *)(a1 + 32), v7))
  {
    v8 = *(_DWORD *)(v6 + 64);
    objc_storeStrong((id *)(v6 + 40), v2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v3);
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterStatus:", objc_msgSend(*(id *)(a1 + 32), "onQueue_computeClusterStatus"));
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterType:", v4);
    if ((_DWORD)v4 == v8)
      goto LABEL_12;
  }
  else
  {
    objc_storeStrong((id *)(v6 + 40), v2);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v3);
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterStatus:", objc_msgSend(*(id *)(a1 + 32), "onQueue_computeClusterStatus"));
    objc_msgSend(*(id *)(a1 + 32), "onQueue_setClusterType:", v4);
  }
  _MRLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 64) - 1;
    if (v10 > 2)
      v11 = CFSTR("None");
    else
      v11 = off_1E30CABF8[v10];
    v12 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(v12 + 40);
    v13 = *(_QWORD *)(v12 + 48);
    v15 = 138412802;
    v16 = v11;
    v17 = 2114;
    v18 = v14;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Cluster information updated: type=%@ | clusterUID=%{public}@ | leaderUID=%{public}@", (uint8_t *)&v15, 0x20u);
  }

LABEL_12:
}

- (unint64_t)onQueue_computeClusterStatus
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (!self->_clusterUID)
    return 0;
  if (-[NSString isEqualToString:](self->_clusterLeaderUID, "isEqualToString:", self->_localPairingIdentity))
    return 1;
  return 2;
}

- (void)onQueue_setClusterType:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_clusterType != (_DWORD)v3)
  {
    self->_clusterType = v3;
    -[MRAVClusterController onQueue_notifyObserversWithClusterType:](self, "onQueue_notifyObserversWithClusterType:", v3);
  }
}

- (void)onQueue_setClusterStatus:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_clusterStatus != a3)
  {
    self->_clusterStatus = a3;
    -[MRAVClusterController onQueue_notifyObserversWithClusterStatus:](self, "onQueue_notifyObserversWithClusterStatus:", a3);
  }
}

- (void)onQueue_notifyObserversWithClusterStatus:(unint64_t)a3
{
  void *v5;
  NSObject *callbackQueue;
  id v7;
  _QWORD block[4];
  id v9;
  MRAVClusterController *v10;
  unint64_t v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRAVClusterController_onQueue_notifyObserversWithClusterStatus___block_invoke;
  block[3] = &unk_1E30C9E88;
  v9 = v5;
  v10 = self;
  v11 = a3;
  v7 = v5;
  dispatch_async(callbackQueue, block);

}

void __66__MRAVClusterController_onQueue_notifyObserversWithClusterStatus___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "clusterController:clusterStatusDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)onQueue_notifyObserversWithClusterType:(unsigned int)a3
{
  void *v5;
  NSObject *callbackQueue;
  id v7;
  _QWORD block[4];
  id v9;
  MRAVClusterController *v10;
  unsigned int v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRAVClusterController_onQueue_notifyObserversWithClusterType___block_invoke;
  block[3] = &unk_1E30C7610;
  v9 = v5;
  v10 = self;
  v11 = a3;
  v7 = v5;
  dispatch_async(callbackQueue, block);

}

void __64__MRAVClusterController_onQueue_notifyObserversWithClusterType___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "clusterController:clusterTypeDidChange:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

+ (id)getClusterUID
{
  return (id)MRMediaRemoteCopyLocalClusterID();
}

+ (id)getClusterLeaderUID
{
  return (id)MRMediaRemoteCopyLocalClusterLeaderIdentity();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterLeaderUID, 0);
  objc_storeStrong((id *)&self->_clusterUID, 0);
  objc_storeStrong((id *)&self->_localPairingIdentity, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

void __50__MRAVClusterController_getClusterLeaderEndpoint___block_invoke_25_cold_1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6(v1, v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

@end
