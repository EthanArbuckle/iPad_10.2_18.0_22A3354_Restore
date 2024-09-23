@implementation DNDSClientDetailsProvider

- (DNDSClientDetailsProvider)init
{
  DNDSClientDetailsProvider *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *detailsByIdentifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDSClientDetailsProvider;
  v2 = -[DNDSClientDetailsProvider init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    detailsByIdentifier = v2->_detailsByIdentifier;
    v2->_detailsByIdentifier = v3;

    -[DNDSClientDetailsProvider _loadPreloadBundles](v2, "_loadPreloadBundles");
  }
  return v2;
}

- (id)findClientDetailsForIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;

  v4 = a3;
  v5 = self->_detailsByIdentifier;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKey:](self->_detailsByIdentifier, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (id)clientDetailsForIdentifier:(id)a3
{
  return -[DNDSClientDetailsProvider clientDetailsForIdentifier:applicationBundleURL:](self, "clientDetailsForIdentifier:applicationBundleURL:", a3, 0);
}

- (id)clientDetailsForIdentifier:(id)a3 applicationBundleURL:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  DNDSClientDetails *v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  DNDSClientDetails *v17;
  void *v18;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  DNDSClientDetails *v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_detailsByIdentifier;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKey:](self->_detailsByIdentifier, "objectForKey:", v6);
  v9 = (DNDSClientDetails *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __77__DNDSClientDetailsProvider_clientDetailsForIdentifier_applicationBundleURL___block_invoke;
    v24[3] = &unk_1E86A7610;
    v24[4] = self;
    v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A0D58](v24);
    ((void (**)(_QWORD, id))v10)[2](v10, v6);
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = (DNDSClientDetails *)v11;
    if (v7 && !v11)
    {
      +[DNDSClientDetails detailsForClientIdentifier:applicationBundleURL:](DNDSClientDetails, "detailsForClientIdentifier:applicationBundleURL:", v6, v7);
      v9 = (DNDSClientDetails *)objc_claimAutoreleasedReturnValue();
    }
    if (!v9)
    {
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.donotdisturb.private.schedule")) & 1) != 0)
        goto LABEL_11;
      if (!objc_msgSend(v6, "hasSuffix:", CFSTR(".private.schedule")))
        goto LABEL_11;
      -[NSMutableDictionary objectForKey:](self->_detailsByIdentifier, "objectForKey:", CFSTR("com.apple.donotdisturb.private.schedule"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        ((void (**)(_QWORD, const __CFString *))v10)[2](v10, CFSTR("com.apple.donotdisturb.private.schedule"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](self->_detailsByIdentifier, "setObject:forKey:", v12, CFSTR("com.apple.donotdisturb.private.schedule"));
        if (!v12)
          goto LABEL_11;
      }
      v23 = [DNDSClientDetails alloc];
      v26[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v12, "isResolutionContextAssumingDeviceUILocked");
      v21 = objc_msgSend(v12, "isUserInteractionClient");
      v14 = objc_msgSend(v12, "isPersistentAssertionClient");
      v15 = objc_msgSend(v12, "isSyncSuppressedClient");
      v16 = objc_msgSend(v12, "isIOS14SyncSuppressedClient");
      BYTE1(v20) = objc_msgSend(v12, "forcesAssertionStatusUpdate");
      LOBYTE(v20) = v16;
      v9 = -[DNDSClientDetails initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:](v23, "initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:", v6, v13, v22, v21, v14, v15, v20);

      if (!v9)
      {
LABEL_11:
        v17 = [DNDSClientDetails alloc];
        v25 = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        LOWORD(v20) = 0;
        v9 = -[DNDSClientDetails initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:](v17, "initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:", v6, v18, 0, 0, 0, 0, v20);

      }
    }
    -[NSMutableDictionary setObject:forKey:](self->_detailsByIdentifier, "setObject:forKey:", v9, v6);

  }
  objc_sync_exit(v8);

  return v9;
}

id __77__DNDSClientDetailsProvider_clientDetailsForIdentifier_applicationBundleURL___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend((id)objc_opt_class(), "_defaultModuleDirectories");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v6), "URLByAppendingPathComponent:", v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "URLByAppendingPathExtension:", CFSTR("bundle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

        if ((v11 & 1) != 0)
        {
          +[DNDSClientDetails detailsForBundleAtURL:](DNDSClientDetails, "detailsForBundleAtURL:", v8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_defaultModuleDirectories
{
  if (_defaultModuleDirectories_onceToken != -1)
    dispatch_once(&_defaultModuleDirectories_onceToken, &__block_literal_global_20);
  return (id)_defaultModuleDirectories_directories;
}

void __54__DNDSClientDetailsProvider__defaultModuleDirectories__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", &unk_1E86DEFA0);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v0);
    v1 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v1;
  }
  else
  {
    v2 = v5;
  }
  v6 = v2;
  objc_msgSend(v2, "bs_map:", &__block_literal_global_17);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_defaultModuleDirectories_directories;
  _defaultModuleDirectories_directories = v3;

}

id __54__DNDSClientDetailsProvider__defaultModuleDirectories__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = a2;
  BSSystemRootDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = CFSTR("DoNotDisturb");
  v8[3] = CFSTR("ClientBundles");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_loadPreloadBundles
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableDictionary *obj;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_defaultModuleDirectories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_24_1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "bs_flatten");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bs_filter:", &__block_literal_global_26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bs_mapNoNulls:", &__block_literal_global_30_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = self->_detailsByIdentifier;
  objc_sync_enter(obj);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "identifiers", obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v19;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v10);
              -[NSMutableDictionary setObject:forKey:](self->_detailsByIdentifier, "setObject:forKey:", v9, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

id __48__DNDSClientDetailsProvider__loadPreloadBundles__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3620];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__DNDSClientDetailsProvider__loadPreloadBundles__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR(".preload.bundle"));

  return v3;
}

id __48__DNDSClientDetailsProvider__loadPreloadBundles__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[DNDSClientDetails detailsForBundleAtURL:](DNDSClientDetails, "detailsForBundleAtURL:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailsByIdentifier, 0);
}

@end
