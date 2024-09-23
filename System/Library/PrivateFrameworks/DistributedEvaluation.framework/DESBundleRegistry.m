@implementation DESBundleRegistry

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[DESBundleRegistry _init]([DESBundleRegistry alloc], "_init");
    v3 = (void *)sSharedInstance;
    sSharedInstance = (uint64_t)v2;

  }
}

+ (id)sharedInstance
{
  return (id)sSharedInstance;
}

- (DESBundleRegistry)init
{
  DESBundleRegistry *v3;

  v3 = (DESBundleRegistry *)(id)sSharedInstance;

  return v3;
}

+ (id)_extensionsWithEndpointName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = *MEMORY[0x1E0CB2A28];
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionsWithMatchingAttributes:error:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1B96E5000, v8, OS_LOG_TYPE_INFO, "Found extensions=%@", buf, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "valueForKeyPath:", CFSTR("@unionOfObjects.identifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[DESBundleRegistry _extensionsWithEndpointName:].cold.1((uint64_t)v3, (uint64_t)v6, v8);
    v10 = 0;
  }

  return v10;
}

- (id)_init
{
  DESBundleRegistry *v2;
  uint64_t v3;
  NSSet *lowMemoryExtensions;
  uint64_t v5;
  NSSet *highMemoryExtensions;
  uint64_t v7;
  NSSet *restrictedExtensions;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DESBundleRegistry;
  v2 = -[DESBundleRegistry init](&v10, sel_init);
  if (v2)
  {
    +[DESBundleRegistry _extensionsWithEndpointName:](DESBundleRegistry, "_extensionsWithEndpointName:", CFSTR("com.apple.mlruntime.extension-point-low"));
    v3 = objc_claimAutoreleasedReturnValue();
    lowMemoryExtensions = v2->_lowMemoryExtensions;
    v2->_lowMemoryExtensions = (NSSet *)v3;

    +[DESBundleRegistry _extensionsWithEndpointName:](DESBundleRegistry, "_extensionsWithEndpointName:", CFSTR("com.apple.mlruntime.extension-point-high"));
    v5 = objc_claimAutoreleasedReturnValue();
    highMemoryExtensions = v2->_highMemoryExtensions;
    v2->_highMemoryExtensions = (NSSet *)v5;

    +[DESBundleRegistry _extensionsWithEndpointName:](DESBundleRegistry, "_extensionsWithEndpointName:", CFSTR("com.apple.mlruntime.extension-point-restricted"));
    v7 = objc_claimAutoreleasedReturnValue();
    restrictedExtensions = v2->_restrictedExtensions;
    v2->_restrictedExtensions = (NSSet *)v7;

  }
  return v2;
}

- (id)allBundleIds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[DESBundleRegistry allUnrestrictedBundleIds](self, "allUnrestrictedBundleIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSet allObjects](self->_restrictedExtensions, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  return v5;
}

- (id)allUnrestrictedExtensionIds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[NSSet allObjects](self->_lowMemoryExtensions, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSet allObjects](self->_highMemoryExtensions, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  return v5;
}

- (id)allUnrestrictedBundleIds
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[DESBundleRegistry allUnrestrictedExtensionIds](self, "allUnrestrictedExtensionIds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)allPossibleUnrestrictedFedStatsIds
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.dp.PrivateFederatedLearning.DPMLRuntimePluginNonDnU");
  v3[1] = CFSTR("com.apple.dp.PrivateFederatedLearning.DPMLRuntimePlugin");
  v3[2] = CFSTR("com.apple.aiml.mlpt.PriML.FedStats.Plugin");
  v3[3] = CFSTR("com.apple.aiml.mlpt.PriML.FedStats.PluginNonDnU");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allFedStatsUnrestrictedBundleIds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[DESBundleRegistry allUnrestrictedBundleIds](self, "allUnrestrictedBundleIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[DESBundleRegistry allPossibleUnrestrictedFedStatsIds](self, "allPossibleUnrestrictedFedStatsIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13, (_QWORD)v15))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)allNonFedStatsUnrestrictedBundleIds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[DESBundleRegistry allUnrestrictedBundleIds](self, "allUnrestrictedBundleIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[DESBundleRegistry allPossibleUnrestrictedFedStatsIds](self, "allPossibleUnrestrictedFedStatsIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v13, (_QWORD)v15) & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (BOOL)containsBundleId:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = -[NSSet containsObject:](self->_lowMemoryExtensions, "containsObject:", v4)
    || -[NSSet containsObject:](self->_highMemoryExtensions, "containsObject:", v4)
    || -[NSSet containsObject:](self->_restrictedExtensions, "containsObject:", v4);

  return v5;
}

- (int64_t)pluginTypeForBundleId:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if (-[NSSet containsObject:](self->_lowMemoryExtensions, "containsObject:", v4))
  {
    v5 = 2;
  }
  else if (-[NSSet containsObject:](self->_highMemoryExtensions, "containsObject:", v4))
  {
    v5 = 3;
  }
  else if (-[NSSet containsObject:](self->_restrictedExtensions, "containsObject:", v4))
  {
    v5 = 4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedExtensions, 0);
  objc_storeStrong((id *)&self->_highMemoryExtensions, 0);
  objc_storeStrong((id *)&self->_lowMemoryExtensions, 0);
}

+ (void)_extensionsWithEndpointName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1B96E5000, log, OS_LOG_TYPE_ERROR, "Fail to discover extensions for endpoint=%@ with error=%@", (uint8_t *)&v3, 0x16u);
}

@end
