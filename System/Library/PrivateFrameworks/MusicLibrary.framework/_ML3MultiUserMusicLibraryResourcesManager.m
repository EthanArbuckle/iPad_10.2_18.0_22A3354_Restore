@implementation _ML3MultiUserMusicLibraryResourcesManager

- (_ML3MultiUserMusicLibraryResourcesManager)initWithLibraryResourcesService:(id)a3
{
  id v5;
  _ML3MultiUserMusicLibraryResourcesManager *v6;
  _ML3MultiUserMusicLibraryResourcesManager *v7;
  void *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_ML3MultiUserMusicLibraryResourcesManager;
  v6 = -[_ML3BaseMusicLibraryResourcesManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryResourcesServices, a3);
    +[ML3MusicLibraryAccountChangeObserverProxy sharedProxy](ML3MusicLibraryAccountChangeObserverProxy, "sharedProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAccountChangeObserver:", v7);

    v9 = dispatch_queue_create("com.apple.medialibraryd.multi-users-resources-serial-queue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (id)libraryContainerPath
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  _ML3MultiUserMusicLibraryResourcesManager *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_ML3MultiUserMusicLibraryResourcesManager cachedLibraryContainerPath](self, "cachedLibraryContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - libraryContainerPath - Using the cached path", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - libraryContainerPath - Using the service to retrieve libraryContainerPath", buf, 0xCu);
    }

    -[_ML3MultiUserMusicLibraryResourcesManager libraryResourcesServices](self, "libraryResourcesServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "libraryContainerPathWithError:", &v22);
    v4 = objc_claimAutoreleasedReturnValue();
    v7 = v22;

    if (v7)
    {
      _ML3LogCategoryMultiUser();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = v7;
        _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "%{public}@ - libraryContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
      }

      if (MSVDeviceOSIsInternalInstall())
      {
        _ML3LogCategoryMultiUser();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v26 = self;
          v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_FAULT, "%{public}@ - libraryContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
        }

      }
      v13 = dispatch_semaphore_create(0);
      v14 = (void *)MEMORY[0x1E0D4D030];
      v15 = *MEMORY[0x1E0D4CE30];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __65___ML3MultiUserMusicLibraryResourcesManager_libraryContainerPath__block_invoke;
      v21[3] = &unk_1E5B65D80;
      v16 = v13;
      v21[4] = v16;
      objc_msgSend(v14, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("LibraryContainerPath"), CFSTR("Failed Getting Path"), 0, 0, v21);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99768];
      v23 = CFSTR("error");
      v24 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, CFSTR("Unable to retrieve media library folder"), v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v20);
    }
    -[_ML3MultiUserMusicLibraryResourcesManager setCachedLibraryContainerPath:](self, "setCachedLibraryContainerPath:", v4);
  }

  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[_ML3MultiUserMusicLibraryResourcesManager cachedLibraryContainerPath](self, "cachedLibraryContainerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - libraryContainerPath - Retrieved path: %{public}@", buf, 0x16u);

  }
  -[_ML3MultiUserMusicLibraryResourcesManager cachedLibraryContainerPath](self, "cachedLibraryContainerPath");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)musicAssetsContainerPath
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v11;
  NSObject *v12;
  dispatch_semaphore_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  const __CFString *v23;
  id v24;
  uint8_t buf[4];
  _ML3MultiUserMusicLibraryResourcesManager *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[_ML3MultiUserMusicLibraryResourcesManager cachedMusicContainerPath](self, "cachedMusicContainerPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - musicContainerPath - Using the cached path", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138543362;
      v26 = self;
      _os_log_impl(&dword_1AC149000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - musicContainerPath - Using the service to retrieve musicContainerPath", buf, 0xCu);
    }

    -[_ML3MultiUserMusicLibraryResourcesManager libraryResourcesServices](self, "libraryResourcesServices");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "musicContainerPathWithError:", &v22);
    v4 = objc_claimAutoreleasedReturnValue();
    v7 = v22;

    if (v7)
    {
      _ML3LogCategoryMultiUser();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = v7;
        _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_ERROR, "%{public}@ - musicContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
      }

      if (MSVDeviceOSIsInternalInstall())
      {
        _ML3LogCategoryMultiUser();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543618;
          v26 = self;
          v27 = 2114;
          v28 = v7;
          _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_FAULT, "%{public}@ - musicContainerPath - Fatal error retrieving library container path [throwing] - error=%{public}@", buf, 0x16u);
        }

      }
      v13 = dispatch_semaphore_create(0);
      v14 = (void *)MEMORY[0x1E0D4D030];
      v15 = *MEMORY[0x1E0D4CE30];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __69___ML3MultiUserMusicLibraryResourcesManager_musicAssetsContainerPath__block_invoke;
      v21[3] = &unk_1E5B65D80;
      v16 = v13;
      v21[4] = v16;
      objc_msgSend(v14, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v15, CFSTR("Bug"), CFSTR("musicContainerPath"), CFSTR("Failed Getting Path"), 0, 0, v21);
      dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99768];
      v23 = CFSTR("error");
      v24 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, CFSTR("Unable to retrieve media library folder"), v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v20);
    }
    -[_ML3MultiUserMusicLibraryResourcesManager setCachedMusicContainerPath:](self, "setCachedMusicContainerPath:", v4);
  }

  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[_ML3MultiUserMusicLibraryResourcesManager cachedMusicContainerPath](self, "cachedMusicContainerPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2114;
    v28 = v9;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ - musicContainerPath - Retrieved path: %{public}@", buf, 0x16u);

  }
  -[_ML3MultiUserMusicLibraryResourcesManager cachedMusicContainerPath](self, "cachedMusicContainerPath");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)cachedMusicContainerPath
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__22501;
  v11 = __Block_byref_object_dispose__22502;
  v12 = 0;
  -[_ML3MultiUserMusicLibraryResourcesManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69___ML3MultiUserMusicLibraryResourcesManager_cachedMusicContainerPath__block_invoke;
  v6[3] = &unk_1E5B65E48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setCachedMusicContainerPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_ML3MultiUserMusicLibraryResourcesManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___ML3MultiUserMusicLibraryResourcesManager_setCachedMusicContainerPath___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (NSString)cachedLibraryContainerPath
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__22501;
  v11 = __Block_byref_object_dispose__22502;
  v12 = 0;
  -[_ML3MultiUserMusicLibraryResourcesManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71___ML3MultiUserMusicLibraryResourcesManager_cachedLibraryContainerPath__block_invoke;
  v6[3] = &unk_1E5B65E48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setCachedLibraryContainerPath:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[_ML3MultiUserMusicLibraryResourcesManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___ML3MultiUserMusicLibraryResourcesManager_setCachedLibraryContainerPath___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)performDatabasePathChange:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  int v9;
  _ML3MultiUserMusicLibraryResourcesManager *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ - performDatabasePathChange: - newPath=%{public}@ - No-Op", (uint8_t *)&v9, 0x16u);
  }

  -[_ML3MultiUserMusicLibraryResourcesManager setCachedLibraryContainerPath:](self, "setCachedLibraryContainerPath:", 0);
  v7[2](v7, 1, 0);

}

- (void)emergencyDisconnectWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  _ML3MultiUserMusicLibraryResourcesManager *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v5 = os_log_create("com.apple.amp.medialibrary", "MultiUser");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[_ML3MultiUserMusicLibraryResourcesManager cachedLibraryContainerPath](self, "cachedLibraryContainerPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ - emergencyDisconnectWithCompletion: - Wiping cached media folder path: %{public}@", (uint8_t *)&v7, 0x16u);

  }
  -[_ML3MultiUserMusicLibraryResourcesManager setCachedLibraryContainerPath:](self, "setCachedLibraryContainerPath:", 0);
  v4[2](v4, 1, 0);

}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (MLMediaLibraryResourcesServiceProtocol)libraryResourcesServices
{
  return self->_libraryResourcesServices;
}

- (void)setLibraryResourcesServices:(id)a3
{
  objc_storeStrong((id *)&self->_libraryResourcesServices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryResourcesServices, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_cachedMusicContainerPath, 0);
  objc_storeStrong((id *)&self->_cachedLibraryContainerPath, 0);
}

@end
