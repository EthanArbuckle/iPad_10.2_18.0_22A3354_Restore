@implementation NTKRelevanceEngineCache

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_0);
  return (id)sharedCache_cache;
}

void __38__NTKRelevanceEngineCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_cache;
  sharedCache_cache = v0;

}

+ (id)_dataSourceLoaderForRelevanceEngineDataSourcesForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  MEMORY[0x1BCCA7918]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("System"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Library"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("RelevanceEngine"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("NanoDataSources"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (NTKInternalBuild(v11, v12))
  {
    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(CFSTR("/AppleInternal/Library/RelevanceEngine"), "stringByAppendingPathComponent:", CFSTR("NanoDataSources"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = v10;
    v20[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0D842E0], "dataSourceLoaderWithDirectories:dataSourceKey:", v16, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_modelFileLocation
{
  if (_modelFileLocation_onceToken != -1)
    dispatch_once(&_modelFileLocation_onceToken, &__block_literal_global_15);
  return (id)_modelFileLocation_FilePath;
}

void __45__NTKRelevanceEngineCache__modelFileLocation__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0C99E98];
  NTKHomeDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("UpNext/model.mdl"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_modelFileLocation_FilePath;
  _modelFileLocation_FilePath = v2;

}

+ (id)sampleConfiguration
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__NTKRelevanceEngineCache_sampleConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sampleConfiguration_onceToken != -1)
    dispatch_once(&sampleConfiguration_onceToken, block);
  return (id)sampleConfiguration_SampleConfiguration;
}

void __46__NTKRelevanceEngineCache_sampleConfiguration__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _NTKRelevanceEngineLocationManager *v10;
  void *v11;
  _NTKRelevanceEngineLocationManager *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D84358], "sampleUpNextConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "_dataSourceLoaderForRelevanceEngineDataSourcesForKey:", *MEMORY[0x1E0D843F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D842E0], "dataSourceLoaderWithBlock:", &__block_literal_global_20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D842E0];
  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "aggregateDataSourceLoaderWithDataSourceLoaders:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSourceLoader:", v9);

  v10 = [_NTKRelevanceEngineLocationManager alloc];
  v11 = (void *)objc_opt_new();
  v12 = -[_NTKRelevanceEngineLocationManager initWithLocationManager:](v10, "initWithLocationManager:", v11);
  objc_msgSend(v3, "setLocationManager:", v12);

  v13 = objc_msgSend(v3, "copy");
  v14 = (void *)sampleConfiguration_SampleConfiguration;
  sampleConfiguration_SampleConfiguration = v13;

}

id __46__NTKRelevanceEngineCache_sampleConfiguration__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v4, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy", v4, v5);

  v2 = (void *)objc_msgSend(v1, "copy");
  return v2;
}

- (NTKRelevanceEngineCache)init
{
  NTKRelevanceEngineCache *v2;
  uint64_t v3;
  NSLock *coordinatorLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKRelevanceEngineCache;
  v2 = -[NTKRelevanceEngineCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    coordinatorLock = v2->_coordinatorLock;
    v2->_coordinatorLock = (NSLock *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKRelevanceEngineCache;
  -[NTKRelevanceEngineCache dealloc](&v2, sel_dealloc);
}

- (void)setLibraryCollection:(id)a3
{
  NTKFaceCollection *v5;
  NTKFaceCollection *libraryCollection;
  _QWORD block[5];

  v5 = (NTKFaceCollection *)a3;
  libraryCollection = self->_libraryCollection;
  if (libraryCollection != v5)
  {
    -[NTKFaceCollection removeObserver:](libraryCollection, "removeObserver:", self);
    -[NTKFaceCollection addObserver:](v5, "addObserver:", self);
    -[NTKFaceCollection removeObserver:](self->_libraryCollection, "removeObserver:", self);
    objc_storeStrong((id *)&self->_libraryCollection, a3);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__NTKRelevanceEngineCache_setLibraryCollection___block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __48__NTKRelevanceEngineCache_setLibraryCollection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "faceCollectionDidLoad:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (id)sharedRelevanceEngine
{
  RERelevanceEngine *v3;

  -[NSLock lock](self->_coordinatorLock, "lock");
  v3 = self->_coordinator;
  -[NSLock unlock](self->_coordinatorLock, "unlock");
  return v3;
}

+ (id)_globallyCachedCanonicalRelevanceEngine
{
  void (**v2)(_QWORD);
  void *WeakRetained;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NTKRelevanceEngineCache__globallyCachedCanonicalRelevanceEngine__block_invoke;
  aBlock[3] = &__block_descriptor_40_e24___RERelevanceEngine_8__0l;
  aBlock[4] = a1;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained(&OnDemandEngine);
  if (!WeakRetained)
  {
    v2[2](v2);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&OnDemandEngine, WeakRetained);
  }

  return WeakRetained;
}

id __66__NTKRelevanceEngineCache__globallyCachedCanonicalRelevanceEngine__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "sampleConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D84350]), "initWithName:configuration:", CFSTR("NTK-Sample-OnDemand"), v1);

  return v2;
}

- (id)canonicalRelevanceEngine
{
  return (id)objc_msgSend((id)objc_opt_class(), "_globallyCachedCanonicalRelevanceEngine");
}

- (id)canonicalRelevanceEngineIgnoringAppInstallations
{
  RERelevanceEngine **p_canonicalRelevanceEngineIgnoringAppInstallations;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  p_canonicalRelevanceEngineIgnoringAppInstallations = &self->_canonicalRelevanceEngineIgnoringAppInstallations;
  WeakRetained = objc_loadWeakRetained((id *)&self->_canonicalRelevanceEngineIgnoringAppInstallations);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sampleConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setIgnoresInstalledApplications:", 1);
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D84350]), "initWithName:configuration:", CFSTR("NTK-Canonical-OnDemand-IgnoresInstallations"), v7);
    objc_storeWeak((id *)p_canonicalRelevanceEngineIgnoringAppInstallations, v5);

  }
  return v5;
}

- (void)_clockViewControllerDidBeginEditing
{
  self->_isEditing = 1;
}

- (void)_clockViewControllerDidEnterAddable
{
  if (-[NTKRelevanceEngineCache _needsLiveElementCoordinator](self, "_needsLiveElementCoordinator"))
    -[NTKRelevanceEngineCache _loadCoordinatorIfNeeded](self, "_loadCoordinatorIfNeeded");
}

- (void)_clockViewControllerDidEndEditing
{
  self->_isEditing = 0;
  if (!-[NTKRelevanceEngineCache _needsLiveElementCoordinator](self, "_needsLiveElementCoordinator"))
    -[NTKRelevanceEngineCache _unloadCoordinatorIfNeeded](self, "_unloadCoordinatorIfNeeded");
}

- (void)prewarm
{
  if (-[NTKRelevanceEngineCache _needsLiveElementCoordinator](self, "_needsLiveElementCoordinator"))
    -[NTKRelevanceEngineCache _loadCoordinatorIfNeeded](self, "_loadCoordinatorIfNeeded");
}

- (void)_refreshLiveCoordinator
{
  if (-[NTKRelevanceEngineCache _needsLiveElementCoordinator](self, "_needsLiveElementCoordinator"))
    -[NTKRelevanceEngineCache _loadCoordinatorIfNeeded](self, "_loadCoordinatorIfNeeded");
  else
    -[NTKRelevanceEngineCache _unloadCoordinatorIfNeeded](self, "_unloadCoordinatorIfNeeded");
}

- (BOOL)_faceNeedsElementCoordinator:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)_needsLiveElementCoordinator
{
  return self->_isEditing
      || -[NTKRelevanceEngineCache _faceCollectionNeedsLiveElementCoordinator:](self, "_faceCollectionNeedsLiveElementCoordinator:", self->_libraryCollection);
}

- (BOOL)_faceCollectionContainsSiriFace:(id)a3
{
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v4 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__NTKRelevanceEngineCache__faceCollectionContainsSiriFace___block_invoke;
  v6[3] = &unk_1E6BCD750;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v4, "enumerateFacesUsingBlock:", v6);
  LOBYTE(self) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

uint64_t __59__NTKRelevanceEngineCache__faceCollectionContainsSiriFace___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_faceNeedsElementCoordinator:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)_loadCoordinatorIfNeeded
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  RERelevanceEngine *v9;
  RERelevanceEngine *staticCoordinator;
  void *v11;
  uint8_t v12[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Loading coordinator for RelevanceEngine…", v12, 2u);
  }

  -[NSLock lock](self->_coordinatorLock, "lock");
  if (self->_staticCoordinator)
  {
    -[NSLock unlock](self->_coordinatorLock, "unlock");
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "sampleConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (NTKIsDaemonOrFaceSnapshotService())
    {
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create("com.apple.nanotimekit.re-samplequeue", v6);
      objc_msgSend(v5, "setEngineQueue:", v7);

      v8 = objc_msgSend(v5, "copy");
      v4 = (void *)v8;
    }
    v9 = (RERelevanceEngine *)objc_msgSend(objc_alloc(MEMORY[0x1E0D84350]), "initWithName:configuration:", CFSTR("NTK-Sample-Engine"), v4);
    staticCoordinator = self->_staticCoordinator;
    self->_staticCoordinator = v9;

    if (NTKIsDaemonOrFaceSnapshotService())
      -[NTKRelevanceEngineCache _beginLoadingDataForEngine:](self, "_beginLoadingDataForEngine:", self->_staticCoordinator);

    -[NSLock unlock](self->_coordinatorLock, "unlock");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("NTKUpNextRelevanceEngineCacheDidUpdateEngine"), self);

  }
}

- (void)_beginLoadingDataForEngine:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  NTKRelevanceEngineCache *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__NTKRelevanceEngineCache__beginLoadingDataForEngine___block_invoke;
  v6[3] = &unk_1E6BCD778;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __54__NTKRelevanceEngineCache__beginLoadingDataForEngine___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "addObserver:", *(_QWORD *)(a1 + 40));
  v2 = dispatch_time(0, 1000000000);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__NTKRelevanceEngineCache__beginLoadingDataForEngine___block_invoke_2;
  v5[3] = &unk_1E6BCD778;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_after(v2, MEMORY[0x1E0C80D38], v5);

}

uint64_t __54__NTKRelevanceEngineCache__beginLoadingDataForEngine___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserver:", *(_QWORD *)(a1 + 40));
}

- (void)_unloadCoordinatorIfNeeded
{
  NSObject *v3;
  RERelevanceEngine *coordinator;
  RERelevanceEngine *staticCoordinator;
  void *v6;
  uint8_t v7[16];

  _NTKLoggingObjectForDomain(27, (uint64_t)"NTKLoggingDomainUpNext");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Unloading coordinator for RelevanceEngine…", v7, 2u);
  }

  -[NSLock lock](self->_coordinatorLock, "lock");
  coordinator = self->_coordinator;
  if (coordinator)
  {
    self->_coordinator = 0;

  }
  staticCoordinator = self->_staticCoordinator;
  if (staticCoordinator)
  {
    self->_staticCoordinator = 0;

    -[NSLock unlock](self->_coordinatorLock, "unlock");
  }
  else
  {
    -[NSLock unlock](self->_coordinatorLock, "unlock");
    if (!coordinator)
      return;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("NTKUpNextRelevanceEngineCacheDidUpdateEngine"), self);

}

- (void)relevanceEngine:(id)a3 performBatchUpdateBlock:(id)a4 completion:(id)a5
{
  void (*v6)(id);
  void (**v7)(void);

  v6 = (void (*)(id))*((_QWORD *)a4 + 2);
  v7 = (void (**)(void))a5;
  v6(a4);
  v7[2]();

}

- (BOOL)relevanceEngine:(id)a3 isElementAtPathVisible:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryCollection, 0);
  objc_destroyWeak((id *)&self->_canonicalRelevanceEngineIgnoringAppInstallations);
  objc_storeStrong((id *)&self->_staticCoordinator, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_coordinatorLock, 0);
}

@end
