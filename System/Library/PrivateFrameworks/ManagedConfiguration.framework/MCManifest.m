@implementation MCManifest

+ (void)_setSystemManifestPath:(id)a3 userManifestPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)__systemManifestFilePath;
  __systemManifestFilePath = (uint64_t)v5;
  v9 = v5;

  v8 = (void *)__userManifestFilePath;
  __userManifestFilePath = (uint64_t)v6;

}

+ (id)sharedManifest
{
  if (sharedManifest_once != -1)
    dispatch_once(&sharedManifest_once, &__block_literal_global_7);
  return (id)sharedManifest_obj;
}

void __28__MCManifest_sharedManifest__block_invoke()
{
  MCManifest *v0;
  void *v1;

  v0 = objc_alloc_init(MCManifest);
  v1 = (void *)sharedManifest_obj;
  sharedManifest_obj = (uint64_t)v0;

}

+ (id)installedProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "installedSystemProfileDataWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(a1, "installedUserProfileDataWithIdentifier:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    +[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)installedSystemProfileWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "installedSystemProfileDataWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)installedUserProfileWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "installedUserProfileDataWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[MCProfile profileWithData:outError:](MCProfile, "profileWithData:outError:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)installedProfileWithIdentifier:(id)a3
{
  return +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", a3);
}

- (id)installedProfileWithIdentifier:(id)a3 filterFlags:(int)a4
{
  char v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = a4;
  v5 = a3;
  if ((v4 & 0x18) != 0)
  {
    if ((v4 & 8) != 0)
    {
      if ((v4 & 0x10) != 0)
      {
        v7 = 0;
        goto LABEL_8;
      }
      +[MCManifest installedUserProfileWithIdentifier:](MCManifest, "installedUserProfileWithIdentifier:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MCManifest installedSystemProfileWithIdentifier:](MCManifest, "installedSystemProfileWithIdentifier:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[MCManifest installedProfileWithIdentifier:](MCManifest, "installedProfileWithIdentifier:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_8:

  return v7;
}

- (id)installedSystemProfileWithIdentifier:(id)a3
{
  return +[MCManifest installedSystemProfileWithIdentifier:](MCManifest, "installedSystemProfileWithIdentifier:", a3);
}

- (id)installedUserProfileWithIdentifier:(id)a3
{
  return +[MCManifest installedUserProfileWithIdentifier:](MCManifest, "installedUserProfileWithIdentifier:", a3);
}

- (id)installedMDMProfile
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D44770], "sharedConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memberQueueManagingProfileIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCManifest installedProfileWithIdentifier:](self, "installedProfileWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)installedProfileDataWithIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "installedSystemProfileDataWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "installedUserProfileDataWithIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)installedSystemProfileDataWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  MCSystemProfileStorageDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCHashedFilenameWithExtension:", CFSTR("stub"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)installedUserProfileDataWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  MCUserProfileStorageDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "MCHashedFilenameWithExtension:", CFSTR("stub"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)installedProfileDataWithIdentifier:(id)a3
{
  return +[MCManifest installedProfileDataWithIdentifier:](MCManifest, "installedProfileDataWithIdentifier:", a3);
}

- (MCManifest)init
{
  MCManifest *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *syncQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCManifest;
  v2 = -[MCManifest init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)__systemManifestFilePath;
    if (!__systemManifestFilePath)
    {
      MCSystemManifestPath();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)__systemManifestFilePath;
      __systemManifestFilePath = v4;

      v3 = (void *)__systemManifestFilePath;
    }
    objc_storeStrong((id *)&v2->_systemFilePath, v3);
    v6 = (void *)__userManifestFilePath;
    if (!__userManifestFilePath)
    {
      MCUserManifestPath();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)__userManifestFilePath;
      __userManifestFilePath = v7;

      v6 = (void *)__userManifestFilePath;
    }
    objc_storeStrong((id *)&v2->_userFilePath, v6);
    v9 = dispatch_queue_create("com.apple.managedconfiguration.MCManifest._syncQueue", 0);
    syncQueue = v2->_syncQueue;
    v2->_syncQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0);
  dispatch_suspend((dispatch_object_t)self->_syncQueue);
  v4.receiver = self;
  v4.super_class = (Class)MCManifest;
  -[MCManifest dealloc](&v4, sel_dealloc);
}

- (id)_systemManifest
{
  NSMutableDictionary *systemManifest;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  systemManifest = self->_systemManifest;
  if (!systemManifest)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", self->_systemFilePath);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v4, 1, 0, 0);
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_systemManifest;
    self->_systemManifest = v5;

    v7 = self->_systemManifest;
    if (!v7)
    {
      v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
      v9 = self->_systemManifest;
      self->_systemManifest = v8;

      v7 = self->_systemManifest;
    }
    _populateMissingManifestDictionaries(v7);

    systemManifest = self->_systemManifest;
  }
  return systemManifest;
}

- (id)_userManifest
{
  NSMutableDictionary *userManifest;
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;

  userManifest = self->_userManifest;
  if (!userManifest)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", self->_userFilePath);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB38B0], "MCSafePropertyListWithData:options:format:error:", v4, 1, 0, 0);
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_userManifest;
    self->_userManifest = v5;

    v7 = self->_userManifest;
    if (!v7)
    {
      v8 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
      v9 = self->_userManifest;
      self->_userManifest = v8;

      v7 = self->_userManifest;
    }
    _populateMissingManifestDictionaries(v7);

    userManifest = self->_userManifest;
  }
  return userManifest;
}

- (id)systemManifest
{
  NSObject *syncQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__MCManifest_systemManifest__block_invoke;
  v5[3] = &unk_1E41E0CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__MCManifest_systemManifest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_systemManifest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)userManifest
{
  NSObject *syncQueue;
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  syncQueue = self->_syncQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__MCManifest_userManifest__block_invoke;
  v5[3] = &unk_1E41E0CF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(syncQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__MCManifest_userManifest__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_userManifest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setSystemManifest:(id)a3 userManifest:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  v6 = (void *)objc_msgSend(a3, "MCMutableDeepCopy");
  _populateMissingManifestDictionaries(v6);
  if ((-[NSMutableDictionary isEqualToDictionary:](self->_systemManifest, "isEqualToDictionary:", v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_systemManifest, v6);
    -[NSMutableDictionary MCWriteToBinaryFile:](self->_systemManifest, "MCWriteToBinaryFile:", self->_systemFilePath);
  }
  v7 = (void *)objc_msgSend(v8, "MCMutableDeepCopy");
  _populateMissingManifestDictionaries(v7);
  if ((-[NSMutableDictionary isEqualToDictionary:](self->_userManifest, "isEqualToDictionary:", v7) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userManifest, v7);
    -[NSMutableDictionary MCWriteToBinaryFile:](self->_userManifest, "MCWriteToBinaryFile:", self->_userFilePath);
  }

}

- (id)identifiersOfProfilesWithFilterFlags:(int)a3
{
  char v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCManifest systemManifest](self, "systemManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCManifest userManifest](self, "userManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 1) != 0)
  {
    if ((v3 & 8) == 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("OrderedProfiles"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

    }
    if ((v3 & 0x10) == 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("OrderedProfiles"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v9);

    }
  }
  if ((v3 & 2) != 0)
  {
    if ((v3 & 8) == 0)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("HiddenProfiles"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v10);

    }
    if ((v3 & 0x10) == 0)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("HiddenProfiles"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v11);

    }
  }

  return v5;
}

- (id)allInstalledProfileIdentifiers
{
  return -[MCManifest identifiersOfProfilesWithFilterFlags:](self, "identifiersOfProfilesWithFilterFlags:", 3);
}

- (id)allInstalledUserProfileIdentifiers
{
  return -[MCManifest identifiersOfProfilesWithFilterFlags:](self, "identifiersOfProfilesWithFilterFlags:", 9);
}

- (id)allInstalledSystemProfileIdentifiers
{
  return -[MCManifest identifiersOfProfilesWithFilterFlags:](self, "identifiersOfProfilesWithFilterFlags:", 19);
}

- (id)allProfileIdentifiersInstalledNonInteractivelyWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v3 = *(_QWORD *)&a3;
  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCManifest sharedManifest](MCManifest, "sharedManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiersOfProfilesWithFilterFlags:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1A1AF0250]();
        +[MCManifest sharedManifest](MCManifest, "sharedManifest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "installedProfileWithIdentifier:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "installOptions");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", CFSTR("isInstalledInteractively"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "BOOLValue");

          if ((v16 & 1) == 0)
            objc_msgSend(v19, "addObject:", v10);
        }

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v19, "copy");
  return v17;
}

- (id)allInstalledPayloadsOfClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  uint64_t v17;
  MCManifest *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self;
  -[MCManifest allInstalledProfileIdentifiers](self, "allInstalledProfileIdentifiers");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1A1AF0250]();
        -[MCManifest installedProfileWithIdentifier:](v18, "installedProfileWithIdentifier:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "payloads");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v21;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v21 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v4, "addObject:", v14);
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v11);
        }

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v5 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  return v4;
}

- (void)addIdentifierToSystemManifest:(id)a3 flag:(int)a4
{
  -[MCManifest _adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:](self, "_adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:", a3, 0, *(_QWORD *)&a4, 1);
}

- (void)addIdentifierToUserManifest:(id)a3 flag:(int)a4
{
  -[MCManifest _adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:](self, "_adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:", a3, 1, *(_QWORD *)&a4, 1);
}

- (void)removeIdentifierFromSystemManifest:(id)a3 flag:(int)a4
{
  -[MCManifest _adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:](self, "_adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:", a3, 0, *(_QWORD *)&a4, 0);
}

- (void)removeIdentifierFromUserManifest:(id)a3 flag:(int)a4
{
  -[MCManifest _adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:](self, "_adjustManifestIdentifier:isUserInstall:flag:addingIdentifier:", a3, 1, *(_QWORD *)&a4, 0);
}

- (void)_adjustManifestIdentifier:(id)a3 isUserInstall:(BOOL)a4 flag:(int)a5 addingIdentifier:(BOOL)a6
{
  id v10;
  NSObject *syncQueue;
  id v12;
  _QWORD block[5];
  id v14;
  int v15;
  BOOL v16;
  BOOL v17;

  v10 = a3;
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__MCManifest__adjustManifestIdentifier_isUserInstall_flag_addingIdentifier___block_invoke;
  block[3] = &unk_1E41E2C80;
  v16 = a4;
  v15 = a5;
  v17 = a6;
  block[4] = self;
  v14 = v10;
  v12 = v10;
  dispatch_sync(syncQueue, block);

}

void __76__MCManifest__adjustManifestIdentifier_isUserInstall_flag_addingIdentifier___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v2 = *(unsigned __int8 *)(a1 + 52);
  v3 = *(void **)(a1 + 32);
  if (v2)
    objc_msgSend(v3, "_userManifest");
  else
    objc_msgSend(v3, "_systemManifest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v4, "MCMutableDeepCopy");

  v5 = *(_DWORD *)(a1 + 48);
  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("OrderedProfiles"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 53))
      objc_msgSend(v8, "addObject:", v9);
    else
      objc_msgSend(v8, "removeObject:", v9);
    objc_msgSend(v8, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v10, CFSTR("OrderedProfiles"));

    v5 = *(_DWORD *)(a1 + 48);
  }
  if ((v5 & 2) != 0)
  {
    v11 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("HiddenProfiles"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 53))
      objc_msgSend(v13, "addObject:", v14);
    else
      objc_msgSend(v13, "removeObject:", v14);
    objc_msgSend(v13, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v15, CFSTR("HiddenProfiles"));

  }
  v16 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 52))
  {
    objc_msgSend(v16, "_systemManifest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = v17;
    v20 = v21;
  }
  else
  {
    objc_msgSend(v16, "_userManifest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = v21;
    v20 = v17;
  }
  objc_msgSend(v18, "_setSystemManifest:userManifest:", v19, v20);

}

- (void)invalidateCache
{
  NSObject *syncQueue;
  _QWORD block[5];

  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__MCManifest_invalidateCache__block_invoke;
  block[3] = &unk_1E41E0C18;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

void __29__MCManifest_invalidateCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_userManifest, 0);
  objc_storeStrong((id *)&self->_systemManifest, 0);
  objc_storeStrong((id *)&self->_userFilePath, 0);
  objc_storeStrong((id *)&self->_systemFilePath, 0);
}

@end
