@implementation NTKFaceBundleManager

- (void)enumerateFaceBundlesOnDevice:(id)a3 includingLegacy:(BOOL)a4 withBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  -[NTKFaceBundleManager _generateLookupsIfNecessary](self, "_generateLookupsIfNecessary");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1BCCA7FA8](v11);
        if (a4
          || (objc_msgSend(v15, "legacyFaceStyle", (_QWORD)v18),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v17,
              !v17))
        {
          if ((objc_msgSend((id)objc_msgSend(v15, "faceClass", (_QWORD)v18), "isRestrictedForDevice:", v8) & 1) == 0)
            v9[2](v9, v15);
        }
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v12 = v11;
    }
    while (v11);
  }

}

- (id)_generateLookupsIfNecessary
{
  os_unfair_lock_s *p_lookupLock;
  NSArray *cachedLookup;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_lock(&self->_lookupLock);
  cachedLookup = self->_cachedLookup;
  if (!cachedLookup)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "Generating face bundle lookups for bundle manager…", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceBundleManager loader](self, "loader");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__NTKFaceBundleManager__generateLookupsIfNecessary__block_invoke;
    v13[3] = &unk_1E6BCE7D8;
    v14 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateFaceBundleClassesIgnoringCache:withBlock:", 1, v13);

    v9 = (NSArray *)objc_msgSend(v8, "copy");
    v10 = self->_cachedLookup;
    self->_cachedLookup = v9;

    cachedLookup = self->_cachedLookup;
  }
  v11 = cachedLookup;
  os_unfair_lock_unlock(p_lookupLock);
  return v11;
}

- (void)enumerateFaceBundlesOnDevice:(id)a3 withBlock:(id)a4
{
  -[NTKFaceBundleManager enumerateFaceBundlesOnDevice:includingLegacy:withBlock:](self, "enumerateFaceBundlesOnDevice:includingLegacy:withBlock:", a3, 0, a4);
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NTKFaceBundleManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, block);
  return (id)sharedManager_manager_0;
}

void __51__NTKFaceBundleManager__generateLookupsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  objc_sync_exit(v3);

}

- (id)_init
{
  NTKFaceBundleManager *v2;
  NTKFaceBundleManager *v3;
  uint64_t v4;
  NSMutableDictionary *progressiveStyleLookup;
  uint64_t v6;
  NSMutableDictionary *progressiveBundleIDLookup;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id *v29;
  void *v30;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)NTKFaceBundleManager;
  v2 = -[NTKFaceBundleManager init](&v32, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lookupLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    progressiveStyleLookup = v3->_progressiveStyleLookup;
    v3->_progressiveStyleLookup = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    progressiveBundleIDLookup = v3->_progressiveBundleIDLookup;
    v3->_progressiveBundleIDLookup = (NSMutableDictionary *)v6;

    +[NTKBundleLoader rootDirectory](NTKBundleLoader, "rootDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _os_feature_enabled_impl();
    if ((_DWORD)v10)
    {
      v12 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("/AppleInternal/Library/NanoTimeKit/FaceBundles/"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURLWithPath:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v14);
    }
    if (NTKInternalBuild(v10, v11) && _os_feature_enabled_impl())
    {
      v15 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("/AppleInternal/Library/NanoTimeKit/FaceSupport/UnencryptedBundles/"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fileURLWithPath:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "addObject:", v17);
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library/NanoTimeKit/FaceBundles/"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v19);

    }
    v20 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/System/Library/NanoTimeKit/FaceBundles/"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileURLWithPath:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObject:", v22);
    if ((v18 & 1) == 0)
    {
      NTKArgonExtractorBasePath();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NTKArgonExtractorBuildVersion();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingPathComponent:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v26);

    }
    +[NTKFaceBundleLoader faceBundleLoaderWithDirectories:](NTKFaceBundleLoader, "faceBundleLoaderWithDirectories:", v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v3->_loader, v27);
    v28 = CLKRunningInProcess();
    v29 = (id *)0x1E0CB37D0;
    if (!v28)
      v29 = (id *)0x1E0CB35B0;
    objc_msgSend(*v29, "defaultCenter");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObserver:selector:name:object:", v3, sel_argonUpdated_, CFSTR("NTKArgonManagerDidUpdateNotificationName"), 0);

  }
  return v3;
}

void __37__NTKFaceBundleManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)sharedManager_manager_0;
  sharedManager_manager_0 = v1;

}

- (id)faceBundleForBundleIdentifier:(id)a3 onDevice:(id)a4 forMigration:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  NSObject *v15;
  id v16;

  v8 = a3;
  v9 = a4;
  os_unfair_lock_lock(&self->_lookupLock);
  -[NSMutableDictionary objectForKey:](self->_progressiveBundleIDLookup, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lookupLock);
  if (!v10)
  {
    -[NTKFaceBundleManager loader](self, "loader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadFaceBundleWithIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      os_unfair_lock_lock(&self->_lookupLock);
      -[NSMutableDictionary setObject:forKey:](self->_progressiveBundleIDLookup, "setObject:forKey:", v10, v8);
      os_unfair_lock_unlock(&self->_lookupLock);
      v12 = v10;
    }

  }
  v13 = (objc_class *)objc_msgSend(v10, "faceClass");
  objc_msgSend(v10, "legacyFaceStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    _NTKLoggingObjectForDomain(23, (uint64_t)"NTKLoggingDomainFace");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NTKFaceBundleManager faceBundleForBundleIdentifier:onDevice:forMigration:].cold.1(v13, v15);

  }
  if (a5
    || !-[objc_class isRestrictedForDevice:](v13, "isRestrictedForDevice:", v9)
    || CLKIsFaceSnapshotService())
  {
    v16 = v10;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NTKFaceBundleLoader)loader
{
  return self->_loader;
}

- (id)faceBundleForBundleIdentifier:(id)a3 onDevice:(id)a4
{
  return -[NTKFaceBundleManager faceBundleForBundleIdentifier:onDevice:forMigration:](self, "faceBundleForBundleIdentifier:onDevice:forMigration:", a3, a4, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceBundleManager;
  -[NTKFaceBundleManager dealloc](&v4, sel_dealloc);
}

- (void)_resetCaches
{
  NSObject *v3;
  NSArray *cachedLookup;
  uint8_t v5[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "Bundle manager is resetting caches…", v5, 2u);
  }

  os_unfair_lock_lock(&self->_lookupLock);
  cachedLookup = self->_cachedLookup;
  self->_cachedLookup = 0;

  os_unfair_lock_unlock(&self->_lookupLock);
}

- (void)argonUpdated:(id)a3
{
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v4, OS_LOG_TYPE_DEFAULT, "Bundle manager heard argon was updated…", buf, 2u);
  }

  -[NTKFaceBundleManager _resetCaches](self, "_resetCaches");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NTKFaceBundleManager_argonUpdated___block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __37__NTKFaceBundleManager_argonUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("NTKFaceBundleManagerDidUpdateBundlesNotificationName"), *(_QWORD *)(a1 + 32));

}

- (id)faceBundleForFaceStyle:(int64_t)a3 onDevice:(id)a4
{
  os_unfair_lock_s *p_lookupLock;
  id v7;
  NSMutableDictionary *progressiveStyleLookup;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  id v14;
  int v15;
  id v16;

  p_lookupLock = &self->_lookupLock;
  v7 = a4;
  os_unfair_lock_lock(p_lookupLock);
  progressiveStyleLookup = self->_progressiveStyleLookup;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](progressiveStyleLookup, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lookupLock);
  if (!v10)
  {
    -[NTKFaceBundleManager loader](self, "loader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loadLegacyFaceBundleForStyle:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      os_unfair_lock_lock(p_lookupLock);
      v12 = self->_progressiveStyleLookup;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v10, v13);

      os_unfair_lock_unlock(p_lookupLock);
      v14 = v10;
    }

  }
  v15 = objc_msgSend((id)objc_msgSend(v10, "faceClass"), "isRestrictedForDevice:", v7);

  if (v15 && !CLKIsFaceSnapshotService())
    v16 = 0;
  else
    v16 = v10;

  return v16;
}

- (void)enumerateArgonKeyDescriptorsWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  NTKFaceBundleLoader *loader;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    loader = self->_loader;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke;
    v28[3] = &unk_1E6BCE7D8;
    v7 = v5;
    v29 = v7;
    -[NTKFaceBundleLoader enumerateFaceBundleClassesIgnoringCache:withBlock:](loader, "enumerateFaceBundleClassesIgnoringCache:withBlock:", 0, v28);
    v8 = v7;
    objc_sync_enter(v8);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "unsignedIntegerValue");
          objc_msgSend(v9, "objectForKey:", v13);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_sync_enter(v15);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v21 != v18)
                  objc_enumerationMutation(v16);
                v4[2](v4, v14, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
              }
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
            }
            while (v17);
          }

          objc_sync_exit(v16);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      }
      while (v10);
    }

    objc_sync_exit(v9);
  }

}

void __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void (**v4)(void *, uint64_t, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD aBlock[4];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKArgonKeyDescriptor keyDescriptorFromBundle:](NTKArgonKeyDescriptor, "keyDescriptorFromBundle:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_2;
  aBlock[3] = &unk_1E6BD5388;
  v16 = *(id *)(a1 + 32);
  v4 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
  if (v3)
  {
    objc_msgSend(v2, "bundleURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x1E0C99C18];
    v6 = v17[0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "resourceValuesForKeys:error:", v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    objc_msgSend(v8, "objectForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "BOOLValue"))
        v12 = 1;
      else
        v12 = 2;
    }
    else
    {
      _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_cold_1((uint64_t)v5, (uint64_t)v9, v13);

      v12 = 0;
    }
    v4[2](v4, v12, v3);

  }
}

void __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v5);
  }
  objc_sync_exit(v6);

  v8 = v7;
  objc_sync_enter(v8);
  objc_msgSend(v8, "addObject:", v9);
  objc_sync_exit(v8);

}

- (BOOL)loadKeyDescriptor:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v11 = 0;
    v4 = a3;
    v5 = NTKAskFaceSupportServerToAddKeyDescriptor(v4, 3, &v11);
    v6 = v11;
    objc_msgSend(v4, "fileName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_DEFAULT, "Key descriptor %{public}@ was ingested!", buf, 0xCu);
      }

      -[NTKFaceBundleManager _resetCaches](self, "_resetCaches");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[NTKFaceBundleManager loadKeyDescriptor:].cold.1((uint64_t)v7, (uint64_t)v6, v9);

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (NSMutableDictionary)progressiveBundleIDLookup
{
  return self->_progressiveBundleIDLookup;
}

- (NSMutableDictionary)progressiveStyleLookup
{
  return self->_progressiveStyleLookup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_progressiveStyleLookup, 0);
  objc_storeStrong((id *)&self->_progressiveBundleIDLookup, 0);
  objc_storeStrong((id *)&self->_cachedLookup, 0);
}

- (void)faceBundleForBundleIdentifier:(objc_class *)a1 onDevice:(NSObject *)a2 forMigration:.cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "%@: Wrong initializer is being used for a bundle with a face style - use +[NTKFace defaultFaceOfStyle:forDevice:]", (uint8_t *)&v4, 0xCu);

}

void __62__NTKFaceBundleManager_enumerateArgonKeyDescriptorsWithBlock___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, a2, a3, "Error reading status for URL %@ - %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)loadKeyDescriptor:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1B72A3000, a2, a3, "Key descriptor %{public}@ was NOT ingested: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
