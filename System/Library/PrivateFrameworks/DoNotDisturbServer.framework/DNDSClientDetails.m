@implementation DNDSClientDetails

+ (id)detailsForBundleAtURL:(id)a3
{
  CFDictionaryRef v4;
  void *v5;

  v4 = CFBundleCopyInfoDictionaryInDirectory((CFURLRef)a3);
  if (v4)
  {
    objc_msgSend(a1, "_detailsForClientIdentifier:bundleInfoDictionary:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)detailsForClientIdentifier:(id)a3 applicationBundleURL:(id)a4
{
  id v6;
  CFDictionaryRef v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = CFBundleCopyInfoDictionaryInDirectory((CFURLRef)a4);
  -[__CFDictionary bs_safeDictionaryForKey:](v7, "bs_safeDictionaryForKey:", CFSTR("DNDClientDetails"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bs_safeDictionaryForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "_detailsForClientIdentifier:bundleInfoDictionary:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_detailsForClientIdentifier:(id)a3 bundleInfoDictionary:(id)a4
{
  __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v31;
  unsigned int v32;
  __CFString *v33;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = a4;
  objc_msgSend(v6, "bs_safeDictionaryForKey:", CFSTR("DNDModeAssertionServiceOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "bs_safeStringForKey:", CFSTR("DNDClientIdentifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v5 = v10;
    }
    else
    {
      objc_msgSend(v6, "bs_safeStringForKey:", *MEMORY[0x1E0C9AE78]);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = &stru_1E86A90B0;
      if (v12)
        v14 = (__CFString *)v12;
      v5 = v14;

    }
    objc_msgSend(v8, "bs_safeArrayForKey:", CFSTR("DNDClientIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_filter:", &__block_literal_global_28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v33 = v5;
  if (!objc_msgSend(v9, "count"))
  {
    v35[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v16;
  }
  objc_msgSend(v6, "bs_safeDictionaryForKey:", CFSTR("DNDEventBehaviorResolutionServiceOptions"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bs_safeNumberForKey:", CFSTR("DNDEventBehaviorResolutionContextDeviceUILocked"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("DNDUserInteractive"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("DNDAssertionsPersist"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("DNDSyncSuppressed"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("DNDiOS14SyncSuppressed"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  objc_msgSend(v8, "bs_safeNumberForKey:", CFSTR("DNDForceAssertionStatusUpdate"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "BOOLValue");

  BYTE1(v31) = v28;
  LOBYTE(v31) = v26;
  v29 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:", v33, v9, v32, v20, v22, v24, v31);

  return v29;
}

uint64_t __70__DNDSClientDetails__detailsForClientIdentifier_bundleInfoDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (DNDSClientDetails)initWithClientIdentifier:(id)a3 identifiers:(id)a4 resolutionContextAssumingDeviceUILocked:(BOOL)a5 userInteractionClient:(BOOL)a6 persistentAssertionClient:(BOOL)a7 syncSuppressedClient:(BOOL)a8 iOS14SyncSuppressedClient:(BOOL)a9 forcesAssertionStatusUpdate:(BOOL)a10
{
  id v16;
  id v17;
  DNDSClientDetails *v18;
  uint64_t v19;
  NSString *clientIdentifier;
  uint64_t v21;
  NSArray *identifiers;
  objc_super v24;

  v16 = a3;
  v17 = a4;
  v24.receiver = self;
  v24.super_class = (Class)DNDSClientDetails;
  v18 = -[DNDSClientDetails init](&v24, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v16, "copy");
    clientIdentifier = v18->_clientIdentifier;
    v18->_clientIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v17, "copy");
    identifiers = v18->_identifiers;
    v18->_identifiers = (NSArray *)v21;

    v18->_resolutionContextAssumingDeviceUILocked = a5;
    v18->_userInteractionClient = a6;
    v18->_persistentAssertionClient = a7;
    v18->_syncSuppressedClient = a8;
    v18->_iOS14SyncSuppressedClient = a9;
    v18->_forcesAssertionStatusUpdate = a10;
  }

  return v18;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)isResolutionContextAssumingDeviceUILocked
{
  return self->_resolutionContextAssumingDeviceUILocked;
}

- (BOOL)isUserInteractionClient
{
  return self->_userInteractionClient;
}

- (BOOL)isPersistentAssertionClient
{
  return self->_persistentAssertionClient;
}

- (BOOL)isSyncSuppressedClient
{
  return self->_syncSuppressedClient;
}

- (BOOL)isIOS14SyncSuppressedClient
{
  return self->_iOS14SyncSuppressedClient;
}

- (BOOL)forcesAssertionStatusUpdate
{
  return self->_forcesAssertionStatusUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
