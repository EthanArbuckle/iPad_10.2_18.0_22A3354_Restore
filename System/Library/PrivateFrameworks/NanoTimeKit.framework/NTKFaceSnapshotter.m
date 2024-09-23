@implementation NTKFaceSnapshotter

+ (id)defaultModernSnapshotOptions
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("NTKSnapshotPersistableKey");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NTKFaceSnapshotter)init
{
  NTKFaceSnapshotter *v2;
  NTKFaceSnapshotter *v3;
  _QWORD block[4];
  NTKFaceSnapshotter *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKFaceSnapshotter;
  v2 = -[NTKFaceSnapshotter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__NTKFaceSnapshotter_init__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v6 = v2;
    if (init_onceToken != -1)
      dispatch_once(&init_onceToken, block);

  }
  return v3;
}

void __26__NTKFaceSnapshotter_init__block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  id v4;
  dispatch_queue_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v2 = dispatch_semaphore_create(1);
  v3 = (void *)NTKFaceSnapshotterSemaphore;
  NTKFaceSnapshotterSemaphore = (uint64_t)v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.ntkd.facesnapshotter"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = dispatch_queue_create((const char *)objc_msgSend(v4, "UTF8String"), 0);
  v6 = (void *)NTKFaceSnapshotterQueue;
  NTKFaceSnapshotterQueue = (uint64_t)v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)NTKFaceSnapshotterRequests;
  NTKFaceSnapshotterRequests = v7;

  NTKFaceSnapshotterServicingRequest = 0;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)NTKFaceSnapshotterComplicationCollections;
  NTKFaceSnapshotterComplicationCollections = v9;

  NTKFaceSnapshotterCompanionAppLibraryLoaded = 0;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Waiting on NTKCompanionAppLibrary (AppConduit) so apps are known before we snapshot", buf, 2u);
  }

  +[NTKCompanionAppLibrary sharedAppLibrary](NTKCompanionAppLibrary, "sharedAppLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __26__NTKFaceSnapshotter_init__block_invoke_66;
  v13[3] = &unk_1E6BCD5F0;
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v12, "prewarmCompanionDaemonWithCompletion:", v13);

}

void __26__NTKFaceSnapshotter_init__block_invoke_66(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = NTKFaceSnapshotterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__NTKFaceSnapshotter_init__block_invoke_2;
  block[3] = &unk_1E6BCD5F0;
  v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);

}

uint64_t __26__NTKFaceSnapshotter_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary loaded!", v4, 2u);
  }

  NTKFaceSnapshotterCompanionAppLibraryLoaded = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

- (void)_setupNotificationForCollectionLoadForDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  NTKFaceSnapshotter *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__NTKFaceSnapshotter__setupNotificationForCollectionLoadForDevice_completion___block_invoke;
  block[3] = &unk_1E6BCD820;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__NTKFaceSnapshotter__setupNotificationForCollectionLoadForDevice_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nrDeviceUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend((id)NTKFaceSnapshotterComplicationCollections, "objectForKey:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:](NTKCompanionComplicationCollectionManager, "sharedComplicationCollectionForDevice:", *(_QWORD *)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)NTKFaceSnapshotterComplicationCollections, "setObject:forKey:", v3, v2);
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138412290;
        v6 = v2;
        _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Listening for collection load of device uuid %@", (uint8_t *)&v5, 0xCu);
      }

      if ((objc_msgSend(v3, "hasLoaded") & 1) == 0)
        objc_msgSend(v3, "addObserver:", *(_QWORD *)(a1 + 40));
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  NTKFaceSnapshotter *v21;
  id v22;
  _QWORD v23[5];
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "dispatching to face snapshotter queue", buf, 2u);
  }

  objc_msgSend(v8, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  if (v12)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke;
    v23[3] = &unk_1E6BCD5F0;
    v23[4] = self;
    -[NTKFaceSnapshotter _setupNotificationForCollectionLoadForDevice:completion:](self, "_setupNotificationForCollectionLoadForDevice:completion:", v12, v23);
  }
  v14 = NTKFaceSnapshotterQueue;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_3;
  block[3] = &unk_1E6BCFD50;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  dispatch_async(v14, block);

}

void __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_2;
  block[3] = &unk_1E6BCD5F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)NTKFaceSnapshotterQueue, block);
}

uint64_t __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

void __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NTKFaceSnapshotRequest *v4;

  v4 = -[NTKFaceSnapshotRequest initWithFace:options:completion:]([NTKFaceSnapshotRequest alloc], "initWithFace:options:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (id)NTKFaceSnapshotterRequests;
  v3 = objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v2, "count"), 1024, &__block_literal_global_25);
  objc_msgSend((id)NTKFaceSnapshotterRequests, "insertObject:atIndex:", v4, v3);
  objc_msgSend(*(id *)(a1 + 48), "_queue_serviceRequestIfIdle");

}

uint64_t __63__NTKFaceSnapshotter_provideSnapshotOfFace_options_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("NTKSnapshotPriorityKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 0;
  objc_msgSend(v5, "options");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("NTKSnapshotPriorityKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = objc_msgSend(v10, "unsignedIntegerValue");
  else
    v11 = 0;
  if (v8 == v11)
  {
    objc_msgSend(v4, "creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "creationDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "compare:", v13);

  }
  else
  {
    v14 = v8 < v11;
  }

  return v14;
}

- (void)_queue_serviceRequestIfIdle
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)NTKFaceSnapshotterQueue);
  if (objc_msgSend((id)NTKFaceSnapshotterRequests, "count"))
  {
    if (NTKFaceSnapshotterServicingRequest == 1)
    {
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v4 = "Already servicing a face snapshot request.";
LABEL_10:
        _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
      }
    }
    else
    {
      v5 = objc_msgSend((id)NTKFaceSnapshotterRequests, "indexOfObjectPassingTest:", &__block_literal_global_73_0);
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = v5;
        objc_msgSend((id)NTKFaceSnapshotterRequests, "objectAtIndex:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        NTKFaceSnapshotterServicingRequest = 1;
        objc_msgSend((id)NTKFaceSnapshotterRequests, "removeObjectAtIndex:", v6);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_74;
        v8[3] = &unk_1E6BCD778;
        v8[4] = self;
        v9 = v7;
        v3 = v7;
        dispatch_async(MEMORY[0x1E0C80D38], v8);

        goto LABEL_12;
      }
      _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v4 = "No complication snapshot requests are ready.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "No face snapshot requests to service.";
      goto LABEL_10;
    }
  }
LABEL_12:

}

uint64_t __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isReady");
}

uint64_t __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_74(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_2;
  v4[3] = &unk_1E6BCD5F0;
  v4[4] = v2;
  return objc_msgSend(v2, "_mainQueue_serviceRequest:completion:", v1, v4);
}

void __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "Signalling waiting queue that main queue is ready", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_75;
  block[3] = &unk_1E6BCD5F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)NTKFaceSnapshotterQueue, block);
}

uint64_t __49__NTKFaceSnapshotter__queue_serviceRequestIfIdle__block_invoke_75(uint64_t a1)
{
  NTKFaceSnapshotterServicingRequest = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

- (void)provideSnapshotOfFace:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = CFSTR("NTKSnapshotUIOnlyKey");
  v14[0] = MEMORY[0x1E0C9AAB0];
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__NTKFaceSnapshotter_provideSnapshotOfFace_completion___block_invoke;
  v11[3] = &unk_1E6BCFDB8;
  v12 = v6;
  v10 = v6;
  -[NTKFaceSnapshotter provideSnapshotOfFace:options:completion:](self, "provideSnapshotOfFace:options:completion:", v8, v9, v11);

}

uint64_t __55__NTKFaceSnapshotter_provideSnapshotOfFace_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)viewControllerForFace:(id)a3 withOptions:(id)a4
{
  id v5;
  id v6;
  NTKFaceViewController *v7;
  id v8;
  NTKFaceViewController *v9;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = [NTKFaceViewController alloc];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__NTKFaceSnapshotter_viewControllerForFace_withOptions___block_invoke;
  v11[3] = &unk_1E6BCFDE0;
  v12 = v5;
  v8 = v5;
  v9 = -[NTKFaceViewController initWithFace:configuration:](v7, "initWithFace:configuration:", v6, v11);

  -[NTKFaceViewController freeze](v9, "freeze");
  return v9;
}

void __56__NTKFaceSnapshotter_viewControllerForFace_withOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "setDataMode:", 3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NTKSnapshotUIOnlyKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSupressesNonSnapshotUI:", objc_msgSend(v3, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NTKSnapshotUseCanonicalContentKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "BOOLValue");
  else
    v6 = 1;
  objc_msgSend(v11, "setShowsCanonicalContent:", v6);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NTKSnapshotShouldUseSampleComplicationTemplatesKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShouldUseSampleTemplate:", objc_msgSend(v7, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NTKSnapshotUnadornedContentKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowContentForUnadornedSnapshot:", objc_msgSend(v8, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NTKSnapshotForcedLockedKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShowsLockedUI:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("NTKSnapshotIgnoreSnapshotImages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIgnoreSnapshotImages:", objc_msgSend(v10, "BOOLValue"));

}

- (void)_mainQueue_serviceRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  NSObject *v11;
  CFAbsoluteTime Current;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  dispatch_time_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void (**v31)(_QWORD);
  void *v32;
  void *v33;
  char isKindOfClass;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  void (**v44)(_QWORD);
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD *v49;
  id v50;
  _QWORD block[4];
  id v52;
  _QWORD *v53;
  _QWORD aBlock[4];
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  id v59;
  _QWORD *v60;
  __int128 *p_buf;
  id v62[3];
  _QWORD v63[3];
  char v64;
  id location;
  _QWORD v66[5];
  __int128 buf;
  uint64_t v68;
  char v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v6, "face");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (char *)os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_signpost_emit_with_name_impl(&dword_1B72A3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "FaceSnapshot", "%@", (uint8_t *)&buf, 0xCu);
  }

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("NTKSnapshotOverrideDateKey"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    NTKRoundDateDownToNearestSecond(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    NTKSetIdealizedDate(v15);
    v13 = CLKSetCompanionDisplayDate();
  }
  else
  {
    v15 = 0;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v68 = 0x2020000000;
  v69 = 0;
  v16 = (void *)MEMORY[0x1BCCA7FA8](v13);
  +[CLKRenderingContext sharedRenderingContext](NTKFaceViewRenderingContext, "sharedRenderingContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDevice:", v18);

  -[NTKFaceSnapshotter viewControllerForFace:withOptions:](self, "viewControllerForFace:withOptions:", v42, v41);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke;
  v66[3] = &unk_1E6BCFE08;
  v66[4] = &buf;
  objc_msgSend(v19, "enumerateComplicationControllersAndDisplaysWithBlock:", v66);
  objc_msgSend(v42, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshotter _showSnapshotWindowForDevice:](self, "_showSnapshotWindowForDevice:", v20);

  objc_msgSend(v19, "prepareForSnapshotting");
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKFaceSnapshottingWindow setBackgroundColor:](self->_snapshotWindow, "setBackgroundColor:", v21);

  _UIAppSetStatusBarOrientation();
  _UIAppSetStatusBarHeight();
  -[NTKFaceSnapshottingWindow setRootViewController:](self->_snapshotWindow, "setRootViewController:", v19);
  -[NTKFaceSnapshottingWindow setHidden:](self->_snapshotWindow, "setHidden:", 0);
  objc_msgSend(v19, "faceView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[NTKFaceSnapshottingWindow setNeedsLayout](self->_snapshotWindow, "setNeedsLayout");
  -[NTKFaceSnapshottingWindow layoutIfNeeded](self->_snapshotWindow, "layoutIfNeeded");
  -[NTKFaceSnapshottingWindow setNeedsDisplay](self->_snapshotWindow, "setNeedsDisplay");
  objc_msgSend(v22, "setNeedsRender");
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");

  objc_autoreleasePoolPop(v16);
  objc_initWeak(&location, self);
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v64 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_84;
  aBlock[3] = &unk_1E6BCFE30;
  v60 = v63;
  v38 = v15;
  v55 = v38;
  objc_copyWeak(v62, &location);
  v62[1] = *(id *)&Current;
  p_buf = &buf;
  v37 = v7;
  v56 = v37;
  v23 = v11;
  v57 = v23;
  v62[2] = v9;
  v24 = v6;
  v58 = v24;
  v40 = v39;
  v59 = v40;
  v25 = _Block_copy(aBlock);
  v26 = dispatch_time(0, 20000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_86;
  block[3] = &unk_1E6BCFE58;
  v53 = v63;
  v27 = v25;
  v52 = v27;
  v28 = (void *)MEMORY[0x1E0C80D38];
  dispatch_after(v26, MEMORY[0x1E0C80D38], block);

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2;
  v46[3] = &unk_1E6BCFED0;
  v29 = v19;
  v47 = v29;
  v49 = v63;
  objc_copyWeak(&v50, &location);
  v30 = v27;
  v48 = v30;
  v31 = (void (**)(_QWORD))_Block_copy(v46);
  objc_msgSend(v24, "options");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "valueForKey:", CFSTR("NTKSnapshotPerformPrewarmRoutineKey"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && (objc_msgSend(v24, "options"),
        v35 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend((id)v35, "valueForKey:", CFSTR("NTKSnapshotPerformPrewarmRoutineKey")),
        v36 = (void *)objc_claimAutoreleasedReturnValue(),
        (id)v35,
        LOBYTE(v35) = objc_msgSend(v36, "BOOLValue"),
        v36,
        (v35 & 1) != 0))
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_89;
    v43[3] = &unk_1E6BCFE58;
    v45 = v63;
    v44 = v31;
    objc_msgSend(v29, "performPrewarmRoutine:", v43);

  }
  else
  {
    v31[2](v31);
  }

  objc_destroyWeak(&v50);
  objc_destroyWeak(v62);

  _Block_object_dispose(v63, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(a3, "complication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "complicationType") == 31)
    {
      objc_msgSend(v6, "display");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "complicationTemplate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "clientIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 138412290;
          v13 = v11;
          _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Missing complication template for %@", (uint8_t *)&v12, 0xCu);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      }
    }

  }
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id *WeakRetained;
  id *v9;
  double v10;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t v22;
  void *v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;
  CGSize v35;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    if (*(_QWORD *)(a1 + 32))
    {
      NTKSetIdealizedDate(0);
      CLKSetCompanionDisplayDate();
    }
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained[1], "setRootViewController:", 0);
      objc_msgSend(v9, "_hideSnapshotWindow");
    }
    v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
    if (v5)
    {
      objc_msgSend(v5, "size");
      NSStringFromCGSize(v35);
      v11 = objc_claimAutoreleasedReturnValue();
      _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
          v13 = CFSTR(" hasBlankComplication");
        else
          v13 = &stru_1E6BDC918;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("snapshot succeeded%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218754;
        v27 = v10;
        v28 = 2112;
        v29 = v14;
        v30 = 2112;
        v31 = v11;
        v32 = 2112;
        v33 = v15;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "%.2f seconds - %@: %@ %@", buf, 0x2Au);

      }
      v16 = *(id *)(a1 + 48);
      v17 = v16;
      v18 = *(_QWORD *)(a1 + 104);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        v19 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 138412546;
        v27 = *(double *)&v11;
        v28 = 1024;
        LODWORD(v29) = v19;
        _os_signpost_emit_with_name_impl(&dword_1B72A3000, v17, OS_SIGNPOST_INTERVAL_END, v18, "FaceSnapshot", "size=%@ hasBlankComplication=%d", buf, 0x12u);
      }

    }
    else
    {
      _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v25 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        v27 = v10;
        v28 = 2112;
        v29 = v25;
        v30 = 2112;
        v31 = v6;
        _os_log_error_impl(&dword_1B72A3000, v20, OS_LOG_TYPE_ERROR, "%.2f seconds - snapshot failed: %@, error: %@", buf, 0x20u);
      }

      v21 = *(id *)(a1 + 48);
      v11 = v21;
      v22 = *(_QWORD *)(a1 + 104);
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 138412290;
        v27 = *(double *)&v6;
        _os_signpost_emit_with_name_impl(&dword_1B72A3000, v11, OS_SIGNPOST_INTERVAL_END, v22, "FaceSnapshot", "snapshot failed: %@", buf, 0xCu);
      }
    }

    objc_msgSend(*(id *)(a1 + 56), "completion");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(*(id *)(a1 + 56), "completion");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v24)[2](v24, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v5);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_86(uint64_t a1)
{
  id v2;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.faceSnapshotRenderer"), 2, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;
  id v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_3;
  v3[3] = &unk_1E6BCFEA8;
  v5 = *(_QWORD *)(a1 + 48);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "finalizeForSnapshotting:", v3);

  objc_destroyWeak(&v6);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4;
  v5[3] = &unk_1E6BCFE80;
  v8 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  _QWORD *WeakRetained;
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  objc_msgSend(MEMORY[0x1E0CD28B0], "synchronize");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v6 = (void *)MEMORY[0x1BCCA7FA8]();
      objc_msgSend((id)objc_opt_class(), "renderSnapshotFromWindow:", WeakRetained[1]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v6);
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.faceSnapshotRenderer"), 4, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_14;
      }
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.faceSnapshotRenderer"), 3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v8();
LABEL_14:

    return;
  }
  v3 = *(_QWORD *)(a1 + 32);
  v2 = (uint64_t *)(a1 + 32);
  _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4_cold_1(v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "finalizeForSnapshotting completed after timeout", buf, 2u);
  }

}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_89(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[4];
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2_90;
  block[3] = &unk_1E6BCFE58;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_2_90(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    _NTKLoggingObjectForDomain(64, (uint64_t)"NTKLoggingDomainFaceSnapshotRenderer");
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_1B72A3000, v1, OS_LOG_TYPE_DEFAULT, "preform prewarm routine finished after timeout", v2, 2u);
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

+ (id)renderSnapshotFromWindow:(id)a3
{
  return NTKRenderSnapshotFromWindow(a3, 3);
}

+ (id)renderSnapshotAndTexture:(id *)a3 fromWindow:(id)a4
{
  return NTKRenderSnapshotAndTextureFromWindow(a4, 3, a3);
}

- (void)_showSnapshotWindowForDevice:(id)a3
{
  id v4;
  NTKFaceSnapshottingWindow *snapshotWindow;
  NTKFaceSnapshottingWindow *v6;
  NTKFaceSnapshottingWindow *v7;
  id v8;

  v4 = a3;
  snapshotWindow = self->_snapshotWindow;
  v8 = v4;
  if (!snapshotWindow)
  {
    v6 = objc_alloc_init(NTKFaceSnapshottingWindow);
    v7 = self->_snapshotWindow;
    self->_snapshotWindow = v6;

    v4 = v8;
    snapshotWindow = self->_snapshotWindow;
  }
  -[NTKFaceSnapshottingWindow updateForDevice:](snapshotWindow, "updateForDevice:", v4);
  -[NTKFaceSnapshottingWindow setHidden:](self->_snapshotWindow, "setHidden:", 0);

}

- (void)_hideSnapshotWindow
{
  NTKFaceSnapshottingWindow *snapshotWindow;

  -[NTKFaceSnapshottingWindow setHidden:](self->_snapshotWindow, "setHidden:", 1);
  snapshotWindow = self->_snapshotWindow;
  self->_snapshotWindow = 0;

}

- (void)dealloc
{
  objc_super v3;

  -[NTKFaceSnapshottingWindow setHidden:](self->_snapshotWindow, "setHidden:", 1);
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceSnapshotter;
  -[NTKFaceSnapshotter dealloc](&v3, sel_dealloc);
}

- (void)complicationCollectionDidLoad:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__NTKFaceSnapshotter_complicationCollectionDidLoad___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)NTKFaceSnapshotterQueue, block);
}

uint64_t __52__NTKFaceSnapshotter_complicationCollectionDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotWindow, 0);
}

void __59__NTKFaceSnapshotter__mainQueue_serviceRequest_completion___block_invoke_4_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "finalizeForSnapshotting failed after timeout: %@", (uint8_t *)&v3, 0xCu);
}

@end
