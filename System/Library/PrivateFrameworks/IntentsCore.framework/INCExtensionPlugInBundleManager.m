@implementation INCExtensionPlugInBundleManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__INCExtensionPlugInBundleManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_203 != -1)
    dispatch_once(&sharedManager_onceToken_203, block);
  return (id)sharedManager_sharedManager_204;
}

- (id)extensionForIntent:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "extensionBundleId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_className");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (objc_msgSend(v4, "_intents_launchIdForCurrentPlatform"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        INExtractAppInfoFromSiriLaunchId(),
        v5 = 0,
        v7,
        v5))
  {
    buf[0] = 0;
    -[INCExtensionPlugInBundleManager _extensionPlugInBundleForIntent:bundleIdentifier:](self, "_extensionPlugInBundleForIntent:bundleIdentifier:", v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else if (!-[INCExtensionPlugInBundleManager loadBundleForBundleIdentifier:wasPrewarmed:](self, "loadBundleForBundleIdentifier:wasPrewarmed:", v5, buf))
    {
      v10 = 0;
LABEL_9:

      goto LABEL_10;
    }
    -[INCExtensionPlugInBundleManager _extensionPlugInBundleForIntent:bundleIdentifier:](self, "_extensionPlugInBundleForIntent:bundleIdentifier:", v6, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init((Class)objc_msgSend(v9, "principalClass"));
    if ((_INExtensionValidateClass() & 1) == 0)
    {

      v10 = 0;
    }

    goto LABEL_9;
  }
  v12 = *MEMORY[0x1E0CBD670];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[INCExtensionPlugInBundleManager extensionForIntent:]";
    v15 = 2112;
    v16 = v4;
    _os_log_error_impl(&dword_1B727D000, v12, OS_LOG_TYPE_ERROR, "%s Unable to get bundleIdentifier from %@", buf, 0x16u);
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (id)_extensionPlugInBundleForIntent:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *intentsSupportedQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__194;
  v21 = __Block_byref_object_dispose__195;
  v22 = 0;
  intentsSupportedQueue = self->_intentsSupportedQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__INCExtensionPlugInBundleManager__extensionPlugInBundleForIntent_bundleIdentifier___block_invoke;
  v13[3] = &unk_1E6BC4080;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(intentsSupportedQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __84__INCExtensionPlugInBundleManager__extensionPlugInBundleForIntent_bundleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)loadBundleForBundleIdentifier:(id)a3 wasPrewarmed:(BOOL *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_pluginsPlistDictionary, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    INCExtensionPlugInBundleManagerPath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", v9);
    *a4 = objc_msgSend(v10, "isLoaded");
    v11 = *MEMORY[0x1E0CBD670];
    v12 = *MEMORY[0x1E0CBD670];
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 136315394;
        v16 = "-[INCExtensionPlugInBundleManager loadBundleForBundleIdentifier:wasPrewarmed:]";
        v17 = 2112;
        v18 = v9;
        _os_log_impl(&dword_1B727D000, v11, OS_LOG_TYPE_INFO, "%s Successfully loaded bundle at path \"%@\", (uint8_t *)&v15, 0x16u);
      }
      v13 = -[INCExtensionPlugInBundleManager _registerBundle:bundleIdentifier:](self, "_registerBundle:bundleIdentifier:", v10, v6);
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[INCExtensionPlugInBundleManager loadBundleForBundleIdentifier:wasPrewarmed:]";
        v17 = 2112;
        v18 = v9;
        _os_log_error_impl(&dword_1B727D000, v11, OS_LOG_TYPE_ERROR, "%s Error loading bundle at path \"%@\", (uint8_t *)&v15, 0x16u);
      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (INCExtensionPlugInBundleManager)init
{
  INCExtensionPlugInBundleManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *intentsSupported;
  dispatch_queue_t v5;
  OS_dispatch_queue *intentsSupportedQueue;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *pluginsPlistDictionary;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)INCExtensionPlugInBundleManager;
  v2 = -[INCExtensionPlugInBundleManager init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    intentsSupported = v2->_intentsSupported;
    v2->_intentsSupported = v3;

    v5 = dispatch_queue_create("INCIntentsSupportedQueue", 0);
    intentsSupportedQueue = v2->_intentsSupportedQueue;
    v2->_intentsSupportedQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", CFSTR("SiriKitPlugins"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithContentsOfFile:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    pluginsPlistDictionary = v2->_pluginsPlistDictionary;
    v2->_pluginsPlistDictionary = (NSDictionary *)v10;

  }
  return v2;
}

- (void)_setExtensionPlugInBundle:(id)a3 forIntent:(id)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *intentsSupportedQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  intentsSupportedQueue = self->_intentsSupportedQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__INCExtensionPlugInBundleManager__setExtensionPlugInBundle_forIntent_bundleIdentifier___block_invoke;
  block[3] = &unk_1E6BC40A8;
  block[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  dispatch_sync(intentsSupportedQueue, block);

}

- (BOOL)_registerBundle:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  INCExtensionPlugInBundle *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  BOOL v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  NSObject *v36;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v32 = *MEMORY[0x1E0CBD670];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
    {
LABEL_21:
      v31 = 0;
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136315650;
    v45 = "-[INCExtensionPlugInBundleManager _registerBundle:bundleIdentifier:]";
    v46 = 2112;
    v47 = v6;
    v48 = 2112;
    v49 = v8;
    v33 = "%s Unable to register '%@' bundle for '%@' bundleIdentifier";
    v34 = v32;
    v35 = 32;
LABEL_24:
    _os_log_error_impl(&dword_1B727D000, v34, OS_LOG_TYPE_ERROR, v33, buf, v35);
    goto LABEL_21;
  }
  v9 = objc_msgSend(v6, "principalClass");
  if (!v9)
  {
    v36 = *MEMORY[0x1E0CBD670];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CBD670], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v45 = "-[INCExtensionPlugInBundleManager _registerBundle:bundleIdentifier:]";
    v46 = 2112;
    v47 = v6;
    v33 = "%s SiriKit extension plugin does not specify an NSPrincipalClass, unable to load: %@";
    v34 = v36;
    v35 = 22;
    goto LABEL_24;
  }
  v10 = v9;
  objc_msgSend(v6, "infoDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("NSExtension"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v12;
  objc_msgSend(v12, "objectForKey:", CFSTR("NSExtensionAttributes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = MEMORY[0x1E0C9AA60];
  if (v15)
    v18 = v15;
  else
    v18 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v14, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("IntentsRestrictedWhileLocked"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v21)
    v23 = v21;
  else
    v23 = v17;
  objc_msgSend(v20, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = -[INCExtensionPlugInBundle initWithPrincipalClass:intentsSupported:intentsRestrictedWhileLocked:]([INCExtensionPlugInBundle alloc], "initWithPrincipalClass:intentsSupported:intentsRestrictedWhileLocked:", v10, v19, v24);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v26 = v19;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v26);
        -[INCExtensionPlugInBundleManager _setExtensionPlugInBundle:forIntent:bundleIdentifier:](self, "_setExtensionPlugInBundle:forIntent:bundleIdentifier:", v25, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i), v8);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v28);
  }

  v31 = 1;
LABEL_22:

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginsPlistDictionary, 0);
  objc_storeStrong((id *)&self->_intentsSupportedQueue, 0);
  objc_storeStrong((id *)&self->_intentsSupported, 0);
}

void __88__INCExtensionPlugInBundleManager__setExtensionPlugInBundle_forIntent_bundleIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:");
  }

  objc_msgSend(v4, "setObject:forKeyedSubscript:", a1[7], a1[6]);
}

void __48__INCExtensionPlugInBundleManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_sharedManager_204;
  sharedManager_sharedManager_204 = (uint64_t)v0;

}

@end
