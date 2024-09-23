@implementation EXConcreteExtension

void __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke_2;
  activity_block[3] = &unk_1E2CFC520;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v5;
  _os_activity_initiate(&dword_190C25000, "discovering extensions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKPlugIn uuid](self->__plugIn, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PKPlugIn uuid](self->__plugIn, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_plugIn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPlugIn)_plugIn
{
  return (PKPlugIn *)objc_getProperty(self, a2, 80, 1);
}

void __81__EXConcreteExtension_extensionsWithMatchingAttributes_synchronously_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  EXConcreteExtension *v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          v14 = [EXConcreteExtension alloc];
          v15 = -[EXConcreteExtension _initWithPKPlugin:](v14, "_initWithPKPlugin:", v13, (_QWORD)v18);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

  }
  v16 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "allObjects", (_QWORD)v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v17, v6);

}

void __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  EXConcreteExtension *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v18 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
          v9 = [EXConcreteExtension alloc];
          v10 = -[EXConcreteExtension _initWithPKPlugin:](v9, "_initWithPKPlugin:", v8, (_QWORD)v17);
          objc_msgSend(v2, "addObject:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v5);
    }

    _EXLegacyLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2114;
      v24 = v2;
      _os_log_impl(&dword_190C25000, v11, OS_LOG_TYPE_DEFAULT, "discovered extensions: attributes %@, extensionSet %{public}@", buf, 0x16u);
    }

    v13 = *(_QWORD *)(a1 + 56);
    if (v13)
    {
      objc_msgSend(v2, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v13 + 16))(v13, v14, 0);

    }
  }
  else
  {
    _EXLegacyLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1();

    v16 = *(_QWORD *)(a1 + 56);
    if (v16)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v16 + 16))(v16, 0, *(_QWORD *)(a1 + 48));
  }
}

- (id)_initWithPKPlugin:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)EXConcreteExtension;
  v5 = -[EXConcreteExtension _init](&v45, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v7;

    objc_msgSend(v4, "version");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    objc_msgSend(v4, "attributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    v14 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v13;

    objc_msgSend(v4, "bundleInfoDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    v17 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v16;

    objc_msgSend(v4, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    v20 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v19;

    objc_msgSend(v4, "localizedShortName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    v23 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v22;

    objc_msgSend(*((id *)v5 + 4), "objectForKey:", *MEMORY[0x1E0CB2A28]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    v26 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v25;

    v27 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = 0;

    v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v4, "launchPersonas");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "personaUniqueString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          +[_EXPersona personaWithPersonaUniqueString:](_EXPersona, "personaWithPersonaUniqueString:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v31);
    }

    objc_storeStrong((id *)v5 + 11, v28);
    if (objc_msgSend(v5, "_wantsProcessPerRequest"))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)*((_QWORD *)v5 + 9);
      *((_QWORD *)v5 + 9) = v36;

      objc_msgSend(v4, "createInstanceWithUUID:", *((_QWORD *)v5 + 9));
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = v4;
    }
    v39 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v38;

    *((_DWORD *)v5 + 2) = 0;
  }

  return v5;
}

- (BOOL)_wantsProcessPerRequest
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[EXConcreteExtension infoDictionary](self, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _EXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtension _wantsProcessPerRequest].cold.1();

  }
  -[EXConcreteExtension infoDictionary](self, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("XPCService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("_MultipleInstances"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (id)infoDictionary
{
  return self->_infoDictionary;
}

- (void)setRequestInterruptionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)version
{
  return self->_version;
}

void __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke_2(uint64_t a1)
{
  EXConcreteExtensionTearDownRequestWithIdentifier(*(void **)(a1 + 32), *(void **)(a1 + 40), 0);
}

+ (void)extensionsWithMatchingAttributes:(id)a3 synchronously:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v7 = a5;
  if (v5)
    v8 = 1024;
  else
    v8 = 0;
  v9 = (void *)MEMORY[0x1E0D7D420];
  v10 = a3;
  objc_msgSend(v9, "defaultHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__EXConcreteExtension_extensionsWithMatchingAttributes_synchronously_completion___block_invoke;
  v13[3] = &unk_1E2CFC4F8;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "discoverPlugInsForAttributes:flags:found:", v10, v8, v13);

}

+ (id)beginMatchingExtensionsWithAttributes:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D7D420], "defaultHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__EXConcreteExtension_beginMatchingExtensionsWithAttributes_completion___block_invoke;
  v12[3] = &unk_1E2CFC570;
  v13 = v5;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "continuouslyDiscoverPlugInsForAttributes:flags:found:", v9, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_2;
  block[3] = &unk_1E2CFC598;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

- (void)_didCreateExtensionContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  _QWORD block[5];

  v4 = a3;
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "platformShouldExhibitEmbeddedBehavior");

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend((id)objc_opt_class(), "_shouldSendHostApplicationStateNotifications") ^ 1;
    else
      v7 = 0;
    os_unfair_lock_lock(&self->_unfairLock);
    if (!self->_observingHostAppStateChanges && (v7 & 1) == 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__EXConcreteExtension__didCreateExtensionContext___block_invoke;
      block[3] = &unk_1E2CFC438;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      self->_observingHostAppStateChanges = 1;
    }
    os_unfair_lock_unlock(&self->_unfairLock);
  }

}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  Class Class;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allValues](self->__extensionServiceConnections, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "setInvalidationHandler:", 0);
        objc_msgSend(v8, "setInterruptionHandler:", 0);
        objc_msgSend(v8, "invalidate");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "platformShouldExhibitEmbeddedBehavior");

  if (v10 && self->_observingHostAppStateChanges)
  {
    Class = objc_getClass("UIApplication");
    if (Class)
    {
      -[objc_class performSelector:](Class, "performSelector:", sel_sharedApplication);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObserver:name:object:", self, CFSTR("UIApplicationWillEnterForegroundNotification"), v12);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeObserver:name:object:", self, CFSTR("UIApplicationDidEnterBackgroundNotification"), v12);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObserver:name:object:", self, CFSTR("UIApplicationWillResignActiveNotification"), v12);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObserver:name:object:", self, CFSTR("UIApplicationDidBecomeActiveNotification"), v12);

    }
    self->_observingHostAppStateChanges = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)EXConcreteExtension;
  -[EXConcreteExtension dealloc](&v17, sel_dealloc);
}

+ (id)globalStateQueueForExtension:(id)a3
{
  void *v3;
  int v4;
  id v5;
  id v6;

  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "platformShouldExhibitEmbeddedBehavior");

  if (v4 && dyld_program_sdk_at_least())
  {
    if (globalStateQueueForExtension__onceToken != -1)
      dispatch_once(&globalStateQueueForExtension__onceToken, &__block_literal_global_0);
    v5 = (id)globalStateQueueForExtension__dedicatedQueue;
  }
  else
  {
    v5 = (id)MEMORY[0x1E0C80D38];
    v6 = MEMORY[0x1E0C80D38];
  }
  return v5;
}

- (void)cancelExtensionRequestWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**requestCancellationBlock)(id, id, void *);
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  _QWORD aBlock[5];
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0CB29E0];
  v16 = *MEMORY[0x1E0CB2D50];
  v17[0] = CFSTR("Extension cancelled by host.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  requestCancellationBlock = (void (**)(id, id, void *))self->_requestCancellationBlock;
  if (requestCancellationBlock)
    requestCancellationBlock[2](requestCancellationBlock, v4, v8);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke;
  aBlock[3] = &unk_1E2CFC638;
  aBlock[4] = self;
  v10 = v4;
  v15 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[EXConcreteExtension _requestPostCompletionBlock](self, "_requestPostCompletionBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[EXConcreteExtension _requestPostCompletionBlock](self, "_requestPostCompletionBlock");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void (**)(_QWORD)))v13)[2](v13, v10, v11);

  }
  else
  {
    v11[2](v11);
  }

}

void __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__EXConcreteExtension_cancelExtensionRequestWithIdentifier___block_invoke_2;
  v4[3] = &unk_1E2CFC638;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

- (id)_requestPostCompletionBlock
{
  return objc_getProperty(self, a2, 152, 1);
}

- (NSMutableDictionary)_extensionServiceConnections
{
  return self->__extensionServiceConnections;
}

- (id)_extensionContextForUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  void *v6;

  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMutableDictionary objectForKey:](self->__extensionContexts, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);

  return v6;
}

- (int)_plugInProcessIdentifier
{
  void *v2;
  int v3;

  -[PKPlugIn pluginConnection](self->__plugIn, "pluginConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", *(_QWORD *)(a1 + 32));
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2;
  v12[3] = &unk_1E2CFC6D8;
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v15 = v5;
  v9 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 32);
  v18 = v8;
  v17 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

- (void)set_stashedPlugInConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)_safelyBeginUsingSynchronously:(BOOL)a3 request:(id)a4 readyHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  PKPlugIn *plugIn;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  EXConcreteExtension *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  _xpc_connection_s *v26;
  NSObject *v27;
  PKPlugIn *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  void (**v34)(void *, id);
  PKPlugIn *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id *v43;
  id v44;
  NSObject *v45;
  void *v46;
  _BOOL4 v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[5];
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  int v56;
  _QWORD aBlock[4];
  id v58;
  uint64_t v59;
  os_activity_scope_state_s *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  const __CFString *v70;
  _BYTE location[24];
  void *v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;

  v6 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  _sharedSafePluginQueue();
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  plugIn = self->__plugIn;
  if (plugIn && !-[PKPlugIn spent](plugIn, "spent"))
  {
    v59 = 0;
    v60 = (os_activity_scope_state_s *)&v59;
    v61 = 0x3010000000;
    v63 = 0;
    v64 = 0;
    v62 = &unk_190CC5165;
    v45 = _os_activity_create(&dword_190C25000, "begin using plugin", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v45, v60 + 2);
    v47 = v6;
    if (useAssertions())
    {
      objc_initWeak((id *)location, v8);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke;
      aBlock[3] = &unk_1E2CFC8B8;
      objc_copyWeak(&v58, (id *)location);
      v16 = _Block_copy(aBlock);
      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)location);
    }
    else
    {
      v16 = 0;
    }
    if (useAssertions())
    {
      -[EXConcreteExtension identifier](self, "identifier", v45);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self;
      v19 = v17;
      if (-[EXConcreteExtension _wantsProcessPerRequest](v18, "_wantsProcessPerRequest"))
      {
        v20 = 0;
      }
      else
      {
        v65 = 0;
        v66 = &v65;
        v67 = 0x2020000000;
        v68 = 0;
        *(_QWORD *)location = MEMORY[0x1E0C809B0];
        *(_QWORD *)&location[8] = 3221225472;
        *(_QWORD *)&location[16] = __EXConcreteExtensionGetProcessIdentifierForExtensionIdentifier_block_invoke;
        v72 = &unk_1E2CFCAB0;
        v74 = &v65;
        v22 = v19;
        v73 = v22;
        safelyAccessPidForExtensionIdentiferDictionary(location);
        v20 = *((unsigned int *)v66 + 6);
        if ((int)v20 <= 0)
        {
          if (-[EXConcreteExtension _isSystemExtension](v18, "_isSystemExtension"))
          {
            v23 = v22;
            if (EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_onceToken != -1)
              dispatch_once(&EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_onceToken, &__block_literal_global_371);
            v24 = objc_retainAutorelease(v23);
            v25 = (const char *)objc_msgSend(v24, "UTF8String");
            v26 = xpc_connection_create(v25, (dispatch_queue_t)EXConcreteExtensionResolveSystemExtensionPIDByIdentifier_resolution_queue);
            if (v26)
            {
              v20 = +[EXXPCUtil servicePidFromXPCConnection:](EXXPCUtil, "servicePidFromXPCConnection:", v26);
              xpc_connection_set_event_handler(v26, &__block_literal_global_374);
              xpc_connection_activate(v26);
            }
            else
            {
              v20 = 0;
            }

            *((_DWORD *)v66 + 6) = v20;
          }
          else
          {
            v20 = *((unsigned int *)v66 + 6);
          }
        }

        _Block_object_dispose(&v65, 8);
      }

      _NSAcquireProcessAssertionForPIDWithOptions(v20, objc_msgSend(v8, "options"), v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        _EXLegacyLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 138543618;
          *(_QWORD *)&location[4] = v21;
          *(_WORD *)&location[12] = 1024;
          *(_DWORD *)&location[14] = v20;
          _os_log_impl(&dword_190C25000, v27, OS_LOG_TYPE_DEFAULT, "Aquired asertion %{public}@ for running extension with pid %d", location, 0x12u);
        }

      }
    }
    else
    {
      v21 = 0;
      LODWORD(v20) = -1;
    }
    v28 = self->__plugIn;
    if (!v28)
    {
      _EXDefaultLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:].cold.4();

      v28 = self->__plugIn;
    }
    if (-[PKPlugIn spent](v28, "spent", v45))
    {
      _EXDefaultLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:].cold.3();

    }
    v50[0] = MEMORY[0x1E0C809B0];
    v50[1] = 3221225472;
    v50[2] = __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118;
    v50[3] = &unk_1E2CFC8E0;
    v50[4] = self;
    v31 = v21;
    v51 = v31;
    v56 = v20;
    v32 = v8;
    v52 = v32;
    v33 = v16;
    v53 = v33;
    v54 = v9;
    v55 = &v59;
    v34 = (void (**)(void *, id))_Block_copy(v50);
    v35 = self->__plugIn;
    _EXLegacyLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v32, "pkUUID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:].cold.2((uint64_t)v35, v37, (uint64_t)location, v36);
    }

    v38 = (void *)MEMORY[0x1E0D7D428];
    objc_msgSend(v32, "pkUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "persona");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "launchRequestWithUUID:launchPersona:", v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "sandboxProfileName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPlugIn setSandboxProfile:](v35, "setSandboxProfile:", v42);

    if (v47)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v49 = 0;
        v43 = (id *)&v49;
        -[PKPlugIn beginUsingRequest:error:](v35, "beginUsingRequest:error:", v41, &v49);
      }
      else
      {
        v48 = 0;
        v43 = (id *)&v48;
        -[PKPlugIn beginUsingWithError:](v35, "beginUsingWithError:", &v48);
      }
      v44 = *v43;
      v34[2](v34, v44);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PKPlugIn beginUsingRequest:completion:](v35, "beginUsingRequest:completion:", v41, v34);
    }
    else
    {
      -[PKPlugIn beginUsing:](v35, "beginUsing:", v34);
    }

    _Block_object_dispose(&v59, 8);
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v69 = *MEMORY[0x1E0CB2938];
    v70 = CFSTR("The plugin has been invalidated.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB29E0], -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    _EXLegacyLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[EXConcreteExtension _safelyBeginUsingSynchronously:request:readyHandler:].cold.1();

    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v14);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)EXConcreteExtension;
  -[EXConcreteExtension description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXConcreteExtension identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {id = %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSMutableDictionary)_extensionContexts
{
  return self->__extensionContexts;
}

uint64_t __65__EXConcreteExtension__safelyBeginUsingWithRequest_readyHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_safelyBeginUsingSynchronously:request:readyHandler:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (void)extensionsWithMatchingAttributes:(id)a3 completion:(id)a4
{
  +[EXConcreteExtension extensionsWithMatchingAttributes:synchronously:completion:](EXConcreteExtension, "extensionsWithMatchingAttributes:synchronously:completion:", a3, 0, a4);
}

- (id)extensionPointIdentifier
{
  return self->_extensionPointIdentifier;
}

uint64_t __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (void)initialize
{
  const __CFString *v3;
  os_log_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  os_log_t v10;
  void *v11;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "initializeFiltering");
    v3 = (const __CFString *)*MEMORY[0x1E0C9B228];
    CFPreferencesGetAppBooleanValue(CFSTR("EXAssertionLoggingEnabled"), (CFStringRef)*MEMORY[0x1E0C9B228], 0);
    EXConcreteExtensionDiscoveryLoggingEnabled = CFPreferencesGetAppBooleanValue(CFSTR("NSExtensionDiscoveryLoggingEnabled"), v3, 0) != 0;
    v4 = os_log_create("com.apple.foundation.NSExtension", "connection");
    v5 = (void *)EXConcreteExtensionLogCategoryConnection;
    EXConcreteExtensionLogCategoryConnection = (uint64_t)v4;

    v6 = os_log_create("com.apple.foundation.NSExtension", "context");
    v7 = (void *)EXConcreteExtensionLogCategoryContext;
    EXConcreteExtensionLogCategoryContext = (uint64_t)v6;

    v8 = os_log_create("com.apple.foundation.NSExtension", "discovery");
    v9 = (void *)EXConcreteExtensionLogCategoryDiscovery;
    EXConcreteExtensionLogCategoryDiscovery = (uint64_t)v8;

    v10 = os_log_create("com.apple.foundation.NSExtension", "plugin");
    v11 = (void *)EXConcreteExtensionLogCategoryPlugIn;
    EXConcreteExtensionLogCategoryPlugIn = (uint64_t)v10;

  }
}

+ (void)initializeFiltering
{
  CFPropertyListRef v2;
  void *v3;

  v2 = CFPreferencesCopyAppValue(CFSTR("NSExtensionUseAlternateRules"), (CFStringRef)*MEMORY[0x1E0C9B228]);
  v3 = (void *)_EXExtensionUseAlternateRules;
  _EXExtensionUseAlternateRules = (uint64_t)v2;

}

void __52__EXConcreteExtension_globalStateQueueForExtension___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.extension.global-state-queue", 0);
  v1 = (void *)globalStateQueueForExtension__dedicatedQueue;
  globalStateQueueForExtension__dedicatedQueue = (uint64_t)v0;

}

- (void)_safelyEndUsingRequestWithPKUUID:(id)a3 processAssertion:(id)a4 continuation:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  _sharedSafePluginQueue();
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke;
  block[3] = &unk_1E2CFC958;
  v13 = v7;
  v14 = v8;
  block[4] = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  uint8_t v17[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    if (v6)
    {
      *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
      _EXLegacyLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_2();
    }
    else
    {
      _EXLegacyLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_1();
    }

    _EXRegistrationLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = a1[8];
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v17 = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v15, OS_SIGNPOST_INTERVAL_END, v16, "async extension request'", ", v17, 2u);
    }

    (*(void (**)(void))(a1[5] + 16))();
    v9 = a1[6];
    goto LABEL_18;
  }
  if (v6)
  {
    _EXLegacyLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_5();

    v9 = a1[7];
LABEL_18:
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
    goto LABEL_22;
  }
  v11 = *(unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24);
  _EXLegacyLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_4();
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
  {
    __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_3();
  }

LABEL_22:
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = (id)objc_opt_new();
  objc_msgSend(v10, "setOptions:", a3);
  objc_msgSend(v10, "setInputItems:", v9);

  -[EXConcreteExtension _beginExtensionRequest:completion:](self, "_beginExtensionRequest:completion:", v10, v8);
}

- (void)_beginExtensionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  EXConcreteExtension *v20;
  id v21;
  id v22;
  os_signpost_id_t v23;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _EXRegistrationLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  _EXRegistrationLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "async extension request", ", buf, 2u);
  }

  _EXLegacyLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtension _beginExtensionRequest:completion:].cold.1();

  objc_msgSend(v6, "applyActiveWebPageAlternativeIfNeededForExtension:", self);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke;
  v19 = &unk_1E2CFC700;
  v20 = self;
  v21 = v6;
  v22 = v7;
  v23 = v9;
  v13 = v7;
  v14 = v6;
  v15 = _Block_copy(&v16);
  -[EXConcreteExtension _safelyBeginUsingWithRequest:readyHandler:](self, "_safelyBeginUsingWithRequest:readyHandler:", v14, v15, v16, v17, v18, v19, v20);

}

- (void)_safelyBeginUsingWithRequest:(id)a3 readyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  _sharedSafePluginQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__EXConcreteExtension__safelyBeginUsingWithRequest_readyHandler___block_invoke;
  block[3] = &unk_1E2CFC750;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[3];
  char v18;
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  char v22;

  if (*(_QWORD *)(a1 + 32))
  {
    _EXLegacyLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2_cold_1();

    _EXRegistrationLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = *(_QWORD *)(a1 + 72);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_190C25000, v4, OS_SIGNPOST_INTERVAL_END, v5, "async extension request'", ", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x2020000000;
    v22 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v18 = 0;
    objc_msgSend(*(id *)(a1 + 40), "setAssertion:", *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 56);
    v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3;
    v11[3] = &unk_1E2CFC6B0;
    v14 = buf;
    v15 = v17;
    v8 = v7;
    v10 = *(void **)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 72);
    v12 = v8;
    v16 = v9;
    v13 = v10;
    objc_msgSend(v6, "_reallyBeginExtensionRequest:completion:", v8, v11);

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(buf, 8);
  }
}

- (void)_reallyBeginExtensionRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v8 = -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:](self, "makeExtensionContextAndXPCConnectionForRequest:error:", v6, &v19);
  v9 = v19;
  if (v8)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke;
    v17[3] = &unk_1E2CFC5C0;
    v17[4] = self;
    v18 = v7;
    v10 = v7;
    -[EXConcreteExtension _reallyBeginExtensionRequest:synchronously:completion:](self, "_reallyBeginExtensionRequest:synchronously:completion:", v6, 0, v17);
    v11 = v18;
  }
  else
  {
    +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", self);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_3;
    block[3] = &unk_1E2CFC5E8;
    v16 = v7;
    v15 = v9;
    v13 = v7;
    dispatch_async(v12, block);

    v11 = v16;
  }

}

- (id)_bareExtensionServiceConnection
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[EXConcreteExtension _extensionBundle](self, "_extensionBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[EXConcreteExtension identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v4, *MEMORY[0x1E0CB29D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _EXLegacyLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtension _bareExtensionServiceConnection].cold.2();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", v5);
  +[EXExtensionContextImplementation _extensionContextVendorProtocolWithAllowedErrorClasses:](EXExtensionContextImplementation, "_extensionContextVendorProtocolWithAllowedErrorClasses:", self->__allowedErrorClasses);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  +[EXExtensionContextImplementation _extensionContextHostProtocolWithAllowedErrorClasses:](EXExtensionContextImplementation, "_extensionContextHostProtocolWithAllowedErrorClasses:", self->__allowedErrorClasses);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  if (-[EXConcreteExtension _wantsProcessPerRequest](self, "_wantsProcessPerRequest"))
  {
    if (!self->_connectionUUID)
    {
      _EXDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[EXConcreteExtension _bareExtensionServiceConnection].cold.1();

    }
    objc_msgSend(v7, "_xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = 0;
    v13[1] = 0;
    -[NSUUID getUUIDBytes:](self->_connectionUUID, "getUUIDBytes:", v13);
    xpc_connection_set_oneshot_instance();

  }
  return v7;
}

- (BOOL)makeExtensionContextAndXPCConnectionForRequest:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *extensionContexts;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *extensionServiceConnections;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  id v23;
  id v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  int v44;
  int v45;
  BOOL v46;
  _BOOL4 v47;
  uint64_t v48;
  NSObject *v49;
  _QWORD v52[4];
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id location;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  _BYTE v65[48];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _EXLegacyLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.8();

  os_unfair_lock_lock(&self->_unfairLock);
  v7 = -[EXConcreteExtension _hostContextClass](self, "_hostContextClass");
  v8 = [v7 alloc];
  objc_msgSend(v5, "inputItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithInputItems:", v9);

  if (!v10)
  {
    _EXDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.7(v12, (uint64_t)v65, v11);
    }

  }
  objc_msgSend(v10, "_UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internalImplementation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExtensionRequest:", v5);
  extensionContexts = self->__extensionContexts;
  if (!extensionContexts)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = self->__extensionContexts;
    self->__extensionContexts = v16;

    extensionContexts = self->__extensionContexts;
  }
  -[NSMutableDictionary setObject:forKey:](extensionContexts, "setObject:forKey:", v10, v13);
  -[EXConcreteExtension _bareExtensionServiceConnection](self, "_bareExtensionServiceConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  extensionServiceConnections = self->__extensionServiceConnections;
  if (!extensionServiceConnections)
  {
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = self->__extensionServiceConnections;
    self->__extensionServiceConnections = v20;

    extensionServiceConnections = self->__extensionServiceConnections;
  }
  -[NSMutableDictionary setObject:forKey:](extensionServiceConnections, "setObject:forKey:", v18, v13);
  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke;
  v55[3] = &unk_1E2CFC610;
  objc_copyWeak(&v57, &location);
  v23 = v13;
  v56 = v23;
  objc_msgSend(v18, "setInterruptionHandler:", v55);
  v52[0] = v22;
  v52[1] = 3221225472;
  v52[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_58;
  v52[3] = &unk_1E2CFC610;
  objc_copyWeak(&v54, &location);
  v24 = v23;
  v53 = v24;
  objc_msgSend(v18, "setInvalidationHandler:", v52);

  objc_destroyWeak(&v54);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&location);

  os_unfair_lock_unlock(&self->_unfairLock);
  v25 = v10 != 0;
  if (v10)
  {
    objc_msgSend(v5, "setContext:", v10);
  }
  else
  {
    if (a4)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v63 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to make extension context for extension: %@ request: %@"), self, v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB29E0], -1, v28);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    _EXLegacyLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.6();

  }
  if (v18)
  {
    objc_msgSend(v5, "setXpcConnection:", v18);
    objc_msgSend(v5, "assertion");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "valid");

    if (v31)
    {
      objc_msgSend(v18, "resume");
      goto LABEL_30;
    }
    _EXLegacyLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.5(v10, self, v36);

    if (a4)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v61 = *MEMORY[0x1E0CB2938];
      v38 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "_UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXConcreteExtension identifier](self, "identifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "stringWithFormat:", CFSTR("Extension assertion was invalidated! request: %@; plugin_identifier: %@"),
        v39,
        v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB29E0], -1, v42);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    _EXLegacyLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.4();

    if (a4)
    {
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v59 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to make XPC connection for extension: %@ request: %@"), self, v5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v34;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB29E0], -1, v35);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v25 = 0;
LABEL_30:
  +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
  v43 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject allowSimulatedJetsam](v43, "allowSimulatedJetsam"))
  {
LABEL_35:

    goto LABEL_36;
  }
  v44 = objc_msgSend(v5, "options");

  if (v44 >= 0)
    goto LABEL_36;
  v45 = -[EXConcreteExtension _plugInProcessIdentifier](self, "_plugInProcessIdentifier");
  v46 = terminate_with_reason() == 0;
  _EXLegacyLog();
  v43 = objc_claimAutoreleasedReturnValue();
  v47 = os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG);
  if (!v46)
  {
    if (v47)
      -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.3(v43);
    goto LABEL_35;
  }
  if (v47)
    -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.2(v45, v43, v48);

  sleep(1u);
LABEL_36:
  _EXLegacyLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:].cold.1((uint64_t)self, v5, v49);

  return v25;
}

- (void)_reallyBeginExtensionRequest:(id)a3 synchronously:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  EXConcreteExtension *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  const char *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  _QWORD aBlock[4];
  id v34;
  uint8_t buf[4];
  EXConcreteExtension *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v6 = a4;
  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _EXLegacyLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v26 = "NO";
    *(_DWORD *)buf = 138543874;
    v36 = self;
    if (v6)
      v26 = "YES";
    v37 = 2114;
    v38 = v8;
    v39 = 2082;
    v40 = v26;
    _os_log_debug_impl(&dword_190C25000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ really begining request: %{public}@ synchronously: %{public}s", buf, 0x20u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke;
  aBlock[3] = &unk_1E2CFC660;
  v11 = v9;
  v34 = v11;
  v12 = _Block_copy(aBlock);
  objc_msgSend(v8, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inputItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endpoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  else
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v13;
  v28 = v12;
  objc_msgSend(v14, "internalImplementation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_setExtensionVendorProxy:", v17);
  if (v16)
  {
    v19 = v16;
  }
  else
  {
    objc_msgSend(v18, "_auxiliaryListener");
    v20 = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "endpoint");
    v19 = (id)objc_claimAutoreleasedReturnValue();

    self = v20;
  }
  objc_msgSend(v14, "_UUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_71;
  v29[3] = &unk_1E2CFC688;
  v29[4] = self;
  v30 = v8;
  v31 = v14;
  v32 = v11;
  v23 = v11;
  v24 = v14;
  v25 = v8;
  objc_msgSend(v17, "_beginRequestWithExtensionItems:listenerEndpoint:withContextUUID:completion:", v15, v19, v22, v29);

}

- (Class)_hostContextClass
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *Class;
  NSObject *v8;
  uint64_t v9;
  objc_class *v10;

  -[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("NSExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("NSExtensionContextHostClass"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

    goto LABEL_4;
  }
  -[NSDictionary objectForKey:](self->_infoDictionary, "objectForKey:", CFSTR("NSExtensionContextHostClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
LABEL_4:
    v6 = objc_retainAutorelease(v5);
    Class = objc_getClass((const char *)objc_msgSend(v6, "UTF8String"));
    if (Class)
      goto LABEL_8;
    goto LABEL_5;
  }
  Class = (void *)objc_opt_class();
  v6 = 0;
  if (Class)
    goto LABEL_8;
LABEL_5:
  _EXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    -[EXConcreteExtension _hostContextClass].cold.1((uint64_t)v6, v8, v9);

LABEL_8:
  v10 = Class;

  return v10;
}

- (NSBundle)_extensionBundle
{
  NSBundle *extensionBundle;
  PKPlugIn *plugIn;
  char v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSBundle *v9;
  NSBundle *v10;
  NSObject *v12;
  id v13;

  extensionBundle = self->__extensionBundle;
  if (extensionBundle)
    return extensionBundle;
  plugIn = self->__plugIn;
  v13 = 0;
  v5 = -[PKPlugIn useBundle:error:](plugIn, "useBundle:error:", 0, &v13);
  v6 = v13;
  if ((v5 & 1) != 0)
  {
    -[PKPlugIn url](self->__plugIn, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      _EXDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[EXConcreteExtension _extensionBundle].cold.1();

    }
    v9 = (NSBundle *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithURL:", v7);
    v10 = self->__extensionBundle;
    self->__extensionBundle = v9;

    extensionBundle = self->__extensionBundle;
    return extensionBundle;
  }
  _EXDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[EXConcreteExtension _extensionBundle].cold.2(v6, v12);

  return (NSBundle *)0;
}

+ (BOOL)_inputItemsMatchActiveWebPageAlternative:(id)a3
{
  return objc_msgSend(a1, "_genericValuesMatchActiveWebPageAlternativeWithExtensionItems:attachmentsLens:registeredTypeIdentifiersLens:isActiveWebPageAttachmentCheck:", a3, &__block_literal_global_28, &__block_literal_global_30, &__block_literal_global_32);
}

+ (BOOL)_genericValuesMatchActiveWebPageAlternativeWithExtensionItems:(id)a3 attachmentsLens:(id)a4 registeredTypeIdentifiersLens:(id)a5 isActiveWebPageAttachmentCheck:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(void *, void *, _QWORD);
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "count") == 2)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __199__EXConcreteExtension_NSExtensionActiveWebPageAlternative___genericValuesMatchActiveWebPageAlternativeWithExtensionItems_attachmentsLens_registeredTypeIdentifiersLens_isActiveWebPageAttachmentCheck___block_invoke;
    aBlock[3] = &unk_1E2CFCE10;
    v22 = v10;
    v23 = v11;
    v25 = &v31;
    v26 = &v27;
    v24 = v12;
    v13 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v14, 0);

    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v15, 1);

    v16 = v32[3];
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = 0;
    }
    else
    {
      v18 = v28[3];
      v17 = v18 != 0x7FFFFFFFFFFFFFFFLL && v16 != v18;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
  {
    v3 = v2;
    _EXLegacyLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_2();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_128;
      v13[3] = &unk_1E2CFC660;
      v5 = &v14;
      v6 = *(_QWORD *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      objc_msgSend(v3, "endUsingRequest:completion:", v6, v13);
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_2;
      v11[3] = &unk_1E2CFC660;
      v5 = &v12;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v3, "endUsing:", v11);
    }

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB29E0];
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("The plugin has been invalidated.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -1, v9);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    _EXLegacyLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__allowedErrorClasses, 0);
  objc_storeStrong((id *)&self->__extensionBundle, 0);
  objc_storeStrong(&self->__requestPostCompletionBlockWithItems, 0);
  objc_storeStrong(&self->__requestPostCompletionBlock, 0);
  objc_storeStrong(&self->_requestInterruptionBlock, 0);
  objc_storeStrong(&self->_requestCancellationBlock, 0);
  objc_storeStrong(&self->_requestCompletionBlock, 0);
  objc_storeStrong(&self->__stashedPlugInConnection, 0);
  objc_storeStrong((id *)&self->__extensionContexts, 0);
  objc_storeStrong((id *)&self->__extensionExpirationIdentifiers, 0);
  objc_storeStrong((id *)&self->__extensionServiceConnections, 0);
  objc_storeStrong((id *)&self->__internalPersonas, 0);
  objc_storeStrong((id *)&self->__plugIn, 0);
  objc_storeStrong((id *)&self->_connectionUUID, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
  objc_storeStrong((id *)&self->__localizedShortName, 0);
  objc_storeStrong((id *)&self->__localizedName, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)_shouldLogExtensionDiscovery
{
  return EXConcreteExtensionDiscoveryLoggingEnabled;
}

+ (id)extensionsWithMatchingAttributes:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__EXConcreteExtension_extensionsWithMatchingAttributes_error___block_invoke;
  v8[3] = &unk_1E2CFC4D0;
  v8[4] = &v15;
  v8[5] = &v9;
  +[EXConcreteExtension extensionsWithMatchingAttributes:synchronously:completion:](EXConcreteExtension, "extensionsWithMatchingAttributes:synchronously:completion:", v5, 1, v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v10[5]);
  v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __62__EXConcreteExtension_extensionsWithMatchingAttributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  v6 = objc_msgSend(a2, "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

+ (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "extensionWithIdentifier:excludingDisabledExtensions:error:", a3, 0, a4);
}

+ (id)extensionWithIdentifier:(id)a3 excludingDisabledExtensions:(BOOL)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v18[0] = *MEMORY[0x1E0CB2A08];
    v18[1] = CFSTR("NSUserElection");
    v19[0] = a3;
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = a3;
    objc_msgSend(v7, "numberWithInteger:", 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = *MEMORY[0x1E0CB2A08];
    v17 = a3;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v9 = a3;
    objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(a1, "extensionsWithMatchingAttributes:error:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)extensionWithUUID:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D7D420], "defaultHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke;
  v10[3] = &unk_1E2CFC548;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "findPlugInByUUID:reply:", v9, v10);

}

void __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2;
  activity_block[3] = &unk_1E2CFC520;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v5;
  _os_activity_initiate(&dword_190C25000, "discovering extensions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = -[EXConcreteExtension _initWithPKPlugin:]([EXConcreteExtension alloc], "_initWithPKPlugin:", a1[4]);
    _EXLegacyLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[5];
      v6 = 138543618;
      v7 = v2;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_190C25000, v3, OS_LOG_TYPE_DEFAULT, "discovered extension: %{public}@, uuid: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    _EXLegacyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(a1[7] + 16))();
  }
}

+ (void)extensionWithURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D7D420], "defaultHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__EXConcreteExtension_extensionWithURL_completion___block_invoke;
  v10[3] = &unk_1E2CFC548;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "findPlugInByPathURL:reply:", v9, v10);

}

void __51__EXConcreteExtension_extensionWithURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__EXConcreteExtension_extensionWithURL_completion___block_invoke_2;
  activity_block[3] = &unk_1E2CFC520;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v5;
  _os_activity_initiate(&dword_190C25000, "discovering extensions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __51__EXConcreteExtension_extensionWithURL_completion___block_invoke_2(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1[4])
  {
    v2 = -[EXConcreteExtension _initWithPKPlugin:]([EXConcreteExtension alloc], "_initWithPKPlugin:", a1[4]);
    _EXLegacyLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = a1[5];
      v6 = 138543618;
      v7 = v2;
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_190C25000, v3, OS_LOG_TYPE_DEFAULT, "discovered extension: %{public}@, url: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    _EXLegacyLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(a1[7] + 16))();
  }
}

+ (void)endMatchingExtensions:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D7D420];
  v4 = a3;
  objc_msgSend(v3, "defaultHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelPlugInDiscovery:", v4);

}

- (EXConcreteExtension)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Unable to create null NSExtensions!"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)optedIn
{
  return -[PKPlugIn userElection](self->__plugIn, "userElection") == 1;
}

- (BOOL)attemptOptIn:(id *)a3
{
  -[PKPlugIn setUserElection:](self->__plugIn, "setUserElection:", -[PKPlugIn userElection](self->__plugIn, "userElection", a3) & 0xFFFFFFFFFFFFFF00 | 1);
  return 1;
}

- (BOOL)attemptOptOut:(id *)a3
{
  -[PKPlugIn setUserElection:](self->__plugIn, "setUserElection:", -[PKPlugIn userElection](self->__plugIn, "userElection", a3) & 0xFFFFFFFFFFFFFF00 | 2);
  return 1;
}

uint64_t __63__EXConcreteExtension__reallyBeginExtensionRequest_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", WeakRetained);
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_2;
    v5[3] = &unk_1E2CFC610;
    objc_copyWeak(&v7, v2);
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, v5);

    objc_destroyWeak(&v7);
  }

}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _EXLegacyLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_190C25000, v3, OS_LOG_TYPE_DEFAULT, "extension connection was interrupted! request: %{public}@; plugin_identifier: %{public}@",
        (uint8_t *)&v8,
        0x16u);

    }
    objc_msgSend(WeakRetained, "requestInterruptionBlock");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32));
    EXConcreteExtensionErrorCleanupHandler(WeakRetained, *(void **)(a1 + 32));

  }
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_58(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    _EXLegacyLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v4;
      v12 = 2114;
      v13 = v5;
      _os_log_impl(&dword_190C25000, v3, OS_LOG_TYPE_DEFAULT, "extension connection was invalidated! request: %{public}@; plugin_identifier: %{public}@",
        buf,
        0x16u);

    }
    _sharedSafePluginQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_59;
    v7[3] = &unk_1E2CFC638;
    v8 = WeakRetained;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v6, v7);

  }
}

void __76__EXConcreteExtension_makeExtensionContextAndXPCConnectionForRequest_error___block_invoke_59(uint64_t a1)
{
  EXConcreteExtensionErrorCleanupHandler(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _EXLegacyLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;

  v5 = a2;
  v6 = a3;
  _EXLegacyLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_71_cold_2();

  objc_msgSend(*(id *)(a1 + 48), "_UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v5);

  if ((v9 & 1) == 0)
  {
    _EXLegacyLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_71_cold_1(v10);

  }
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_didCreateExtensionContext:", *(_QWORD *)(a1 + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setOptions:", a3);
  objc_msgSend(v9, "setInputItems:", v8);

  -[EXConcreteExtension _beginExtensionRequest:error:](self, "_beginExtensionRequest:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setOptions:", a3);
  objc_msgSend(v13, "setInputItems:", v12);

  objc_msgSend(v13, "setEndpoint:", v11);
  -[EXConcreteExtension _beginExtensionRequest:completion:](self, "_beginExtensionRequest:completion:", v13, v10);

}

- (id)beginExtensionRequestWithOptions:(unint64_t)a3 inputItems:(id)a4 listenerEndpoint:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setOptions:", a3);
  objc_msgSend(v12, "setInputItems:", v11);

  objc_msgSend(v12, "setEndpoint:", v10);
  -[EXConcreteExtension _beginExtensionRequest:error:](self, "_beginExtensionRequest:error:", v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_beginExtensionRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  _QWORD v24[6];
  uint8_t buf[8];
  uint8_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _EXRegistrationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  _EXRegistrationLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "synchronus extension request", ", buf, 2u);
  }

  _EXLegacyLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtension _beginExtensionRequest:error:].cold.1();

  *(_QWORD *)buf = 0;
  v26 = buf;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  if (-[EXConcreteExtension _beginUsingAndCreateExtensionAssertionWithRequest:error:](self, "_beginUsingAndCreateExtensionAssertionWithRequest:error:", v6, a4)&& -[EXConcreteExtension makeExtensionContextAndXPCConnectionForRequest:error:](self, "makeExtensionContextAndXPCConnectionForRequest:error:", v6, a4))
  {
    *(_QWORD *)v31 = 0;
    *(_QWORD *)&v31[8] = v31;
    *(_QWORD *)&v31[16] = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __52__EXConcreteExtension__beginExtensionRequest_error___block_invoke;
    v24[3] = &unk_1E2CFC728;
    v24[4] = v31;
    v24[5] = buf;
    -[EXConcreteExtension _reallyBeginExtensionRequest:synchronously:completion:](self, "_reallyBeginExtensionRequest:synchronously:completion:", v6, 1, v24);
    objc_msgSend(v6, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EXConcreteExtension _didCreateExtensionContext:](self, "_didCreateExtensionContext:", v13);

    }
    v14 = *(void **)(*(_QWORD *)&v31[8] + 40);
    if (v14)
    {
      if (!a4)
        goto LABEL_22;
    }
    else if (!a4 || *((_QWORD *)v26 + 5))
    {
      goto LABEL_22;
    }
    *a4 = objc_retainAutorelease(v14);
LABEL_22:
    _Block_object_dispose(v31, 8);

    goto LABEL_23;
  }
  _EXLegacyLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (a4)
      v16 = *a4;
    else
      v16 = 0;
    *(_DWORD *)v31 = 138543362;
    *(_QWORD *)&v31[4] = v16;
    _os_log_impl(&dword_190C25000, v15, OS_LOG_TYPE_DEFAULT, "Failed to begin using with error: %{public}@", v31, 0xCu);
  }

LABEL_23:
  _EXLegacyLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v22 = *((_QWORD *)v26 + 5);
    if (a4)
      v23 = (uint64_t (*)(uint64_t, uint64_t))*a4;
    else
      v23 = 0;
    *(_DWORD *)v31 = 138543874;
    *(_QWORD *)&v31[4] = v6;
    *(_WORD *)&v31[12] = 2114;
    *(_QWORD *)&v31[14] = v22;
    *(_WORD *)&v31[22] = 2114;
    v32 = v23;
    _os_log_debug_impl(&dword_190C25000, v17, OS_LOG_TYPE_DEBUG, "completed synchronus begin extension request %{public}@ with identifier: %{public}@ error: %{public}@", v31, 0x20u);
  }

  _EXRegistrationLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_190C25000, v19, OS_SIGNPOST_INTERVAL_END, v8, "synchronus extension request'", ", v31, 2u);
  }

  v20 = *((id *)v26 + 5);
  _Block_object_dispose(buf, 8);

  return v20;
}

void __52__EXConcreteExtension__beginExtensionRequest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 completion:(id)a5
{
  -[EXConcreteExtension beginExtensionRequestWithOptions:inputItems:listenerEndpoint:completion:](self, "beginExtensionRequestWithOptions:inputItems:listenerEndpoint:completion:", 1, a3, a4, a5);
}

- (id)beginExtensionRequestWithInputItems:(id)a3 listenerEndpoint:(id)a4 error:(id *)a5
{
  return -[EXConcreteExtension beginExtensionRequestWithOptions:inputItems:listenerEndpoint:error:](self, "beginExtensionRequestWithOptions:inputItems:listenerEndpoint:error:", 1, a3, a4, a5);
}

- (void)beginExtensionRequestWithInputItems:(id)a3 completion:(id)a4
{
  -[EXConcreteExtension beginExtensionRequestWithInputItems:listenerEndpoint:completion:](self, "beginExtensionRequestWithInputItems:listenerEndpoint:completion:", a3, 0, a4);
}

- (id)beginExtensionRequestWithInputItems:(id)a3 error:(id *)a4
{
  return -[EXConcreteExtension beginExtensionRequestWithInputItems:listenerEndpoint:error:](self, "beginExtensionRequestWithInputItems:listenerEndpoint:error:", a3, 0, a4);
}

- (int)pidForRequestIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_unfairLock;
  void *v6;
  NSObject *v7;
  int v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->__extensionServiceConnections, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _EXLegacyLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v4;
      _os_log_impl(&dword_190C25000, v7, OS_LOG_TYPE_DEFAULT, "nil service connection for UUID: %{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
  v8 = objc_msgSend(v6, "processIdentifier");

  os_unfair_lock_unlock(p_unfairLock);
  return v8;
}

void __50__EXConcreteExtension__didCreateExtensionContext___block_invoke(uint64_t a1)
{
  Class Class;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  Class = objc_getClass("UIApplication");
  if (Class)
  {
    -[objc_class performSelector:](Class, "performSelector:", sel_sharedApplication);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__hostWillEnterForegroundNote_, CFSTR("UIApplicationWillEnterForegroundNotification"), v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__hostDidEnterBackgroundNote_, CFSTR("UIApplicationDidEnterBackgroundNotification"), v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__hostWillResignActiveNote_, CFSTR("UIApplicationWillResignActiveNotification"), v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__hostDidBecomeActiveNote_, CFSTR("UIApplicationDidBecomeActiveNotification"), v7);

  }
}

- (id)objectForInfoDictionaryKey:(id)a3
{
  id v4;
  PKPlugIn *plugIn;
  void *v6;
  PKPlugIn *v7;
  id v8;
  NSObject *v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  plugIn = self->__plugIn;
  v28[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = plugIn;
  v8 = v6;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  if (!v7)
  {
    _EXDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtension objectForInfoDictionaryKey:].cold.1();

  }
  v10 = dispatch_semaphore_create(0);
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __EXConcreteExtensionGetLocalizedInfoDictionaryObjectForPlugInAndKeys_block_invoke;
  v19 = &unk_1E2CFCA70;
  v21 = &v22;
  v11 = v10;
  v20 = v11;
  -[PKPlugIn localizedInfoDictionaryForKeys:completion:](v7, "localizedInfoDictionaryForKeys:completion:", v8, &v16);
  if (dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL))
    NSLog(CFSTR("Timed out attempting to resolve bundle!"), v16, v17, v18, v19);
  v12 = v20;
  v13 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  objc_msgSend(v13, "objectForKey:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)icons
{
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[EXConcreteExtension __UIKit_upcall_icons](self, "__UIKit_upcall_icons");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_itemProviderForPayload:(id)a3 extensionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", 0x1E2D00AF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v5, "inputItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v8 = *(_QWORD *)v31;
    v22 = *(_QWORD *)v31;
    v23 = v5;
    v25 = v7;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v10, "attachments", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v27 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v16, "_loadOperator");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "isEqual:", v6);

              if ((v19 & 1) != 0)
              {
                v20 = v16;

                v5 = v23;
                v7 = v25;
                goto LABEL_19;
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v13)
              continue;
            break;
          }
        }

        v7 = v25;
        v8 = v22;
      }
      v20 = 0;
      v5 = v23;
      v24 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }
  else
  {
    v20 = 0;
  }
LABEL_19:

  return v20;
}

- (BOOL)_isPhotoServiceAccessGranted
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PKPlugIn uuid](self->__plugIn, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    _EXDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtension _isPhotoServiceAccessGranted].cold.1();

  }
  +[_EXServiceClient sharedInstance](_EXServiceClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v4, "photoServiceAuthorizationStatusForExtensionUUID:error:", v2, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    _EXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v11 = v2;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_190C25000, v7, OS_LOG_TYPE_DEFAULT, "Cannot access privacy settings for %{public}@ with error %{public}@", buf, 0x16u);
    }

  }
  return v5;
}

- (void)_completeRequestReturningItems:(id)a3 forExtensionContextWithUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_activity_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  EXConcreteExtension *v21;
  id v22;
  id v23;
  os_activity_t v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_190C25000, "completing extension request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12 = _os_activity_create(&dword_190C25000, "tear down extension request", v11, OS_ACTIVITY_FLAG_DEFAULT);
  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", self);
  v13 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke;
  v19[3] = &unk_1E2CFC7A0;
  v20 = v11;
  v21 = self;
  v22 = v9;
  v23 = v8;
  v24 = v12;
  v25 = v10;
  v14 = v12;
  v15 = v10;
  v16 = v8;
  v17 = v9;
  v18 = v11;
  dispatch_async(v13, v19);

}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  objc_msgSend(*(id *)(a1 + 40), "requestCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestCompletionBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 48);
    EXConcreteExtensionFilterItemsWithMCProfile(*(void **)(a1 + 40), *(void **)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, void *))v3)[2](v3, v4, v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "_requestPostCompletionBlockWithItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    objc_msgSend(v7, "_requestPostCompletionBlockWithItems");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    EXConcreteExtensionFilterItemsWithMCProfile(*(void **)(a1 + 40), *(void **)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_2;
    v22[3] = &unk_1E2CFC750;
    v11 = *(void **)(a1 + 48);
    v22[4] = *(_QWORD *)(a1 + 40);
    v23 = v11;
    v24 = *(id *)(a1 + 72);
    ((void (**)(_QWORD, uint64_t, void *, _QWORD *))v8)[2](v8, v9, v10, v22);
    v12 = &v23;
    v13 = &v24;

  }
  else
  {
    objc_msgSend(v7, "_requestPostCompletionBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *(void **)(a1 + 40);
    if (!v14)
    {
      EXConcreteExtensionTearDownRequestCompletion(v15, *(void **)(a1 + 48), *(void **)(a1 + 72));
      goto LABEL_8;
    }
    objc_msgSend(v15, "_requestPostCompletionBlock");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_4;
    v18[3] = &unk_1E2CFC778;
    v17 = *(_QWORD *)(a1 + 48);
    v18[4] = *(_QWORD *)(a1 + 40);
    v19 = *(id *)(a1 + 64);
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 72);
    ((void (**)(_QWORD, uint64_t, _QWORD *))v16)[2](v16, v17, v18);
    v12 = &v19;
    v13 = &v20;

    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v21;
  }

LABEL_8:
  os_activity_scope_leave(&state);
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_3;
  block[3] = &unk_1E2CFC750;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_3(void **a1)
{
  EXConcreteExtensionTearDownRequestCompletion(a1[4], a1[5], a1[6]);
}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_5;
  v5[3] = &unk_1E2CFC778;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  dispatch_async(v2, v5);

}

void __93__EXConcreteExtension__completeRequestReturningItems_forExtensionContextWithUUID_completion___block_invoke_5(uint64_t a1)
{
  os_activity_scope_state_s v2;

  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v2);
  EXConcreteExtensionTearDownRequestCompletion(*(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  os_activity_scope_leave(&v2);
}

- (void)_cancelRequestWithError:(id)a3 forExtensionContextWithUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_activity_t v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD block[4];
  os_activity_t v18;
  EXConcreteExtension *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_190C25000, "cancelling extension request", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  +[EXConcreteExtension globalStateQueueForExtension:](EXConcreteExtension, "globalStateQueueForExtension:", self);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke;
  block[3] = &unk_1E2CFC7C8;
  v18 = v11;
  v19 = self;
  v20 = v9;
  v21 = v8;
  v22 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  v16 = v11;
  dispatch_async(v12, block);

}

void __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD);
  id v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  _QWORD aBlock[5];
  id v13;
  id v14;
  os_activity_scope_state_s state;

  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  objc_msgSend(*(id *)(a1 + 40), "requestCancellationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestCancellationBlock");
    v3 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke_2;
  aBlock[3] = &unk_1E2CFC598;
  v4 = *(id *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v14 = v4;
  aBlock[4] = v5;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 40), "_requestPostCompletionBlockWithItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *(void **)(a1 + 40);
  if (v8)
  {
    objc_msgSend(v9, "_requestPostCompletionBlockWithItems");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void (**)(_QWORD)))v10)[2](v10, *(_QWORD *)(a1 + 48), 0, v7);
  }
  else
  {
    objc_msgSend(v9, "_requestPostCompletionBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v7[2](v7);
      goto LABEL_8;
    }
    objc_msgSend(*(id *)(a1 + 40), "_requestPostCompletionBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(_QWORD, _QWORD, _QWORD, _QWORD), _QWORD, void (**)(_QWORD)))v10[2])(v10, *(_QWORD *)(a1 + 48), v7);
  }

LABEL_8:
  os_activity_scope_leave(&state);
}

void __86__EXConcreteExtension__cancelRequestWithError_forExtensionContextWithUUID_completion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  double v5;
  uint8_t v6[16];

  _EXLegacyLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "in completeTearDown block", v6, 2u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  v4 = (void *)a1[4];
  v3 = (void *)a1[5];
  objc_msgSend(v4, "requestTeardownDelay");
  EXConcreteExtensionTearDownRequestWithIdentifier(v4, v3, (uint64_t)v5);
}

- (void)_loadItemForPayload:(id)a3 contextIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  Class Class;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  Class v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  __int128 v32;

  v8 = a5;
  v9 = a3;
  -[EXConcreteExtension _extensionContextForUUID:](self, "_extensionContextForUUID:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXConcreteExtension _itemProviderForPayload:extensionContext:](self, "_itemProviderForPayload:extensionContext:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2D00B18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2D00B38);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Class = objc_getClass((const char *)objc_msgSend(v13, "UTF8String"));
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2D00B58);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "auditToken");
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }

  v22[1] = 3221225472;
  v28 = v31;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[2] = __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke;
  v22[3] = &unk_1E2CFC818;
  v26 = v8;
  v27 = Class;
  v23 = v11;
  v24 = v12;
  v30 = 1;
  v29 = v32;
  v25 = v15;
  v18 = v8;
  v19 = v15;
  v20 = v12;
  v21 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v22);

}

void __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;
  char v12;

  v2 = *(_QWORD *)(a1 + 64);
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_1E2CFC7F0;
  v12 = *(_BYTE *)(a1 + 104);
  v8 = v3;
  v6 = *(_OWORD *)(a1 + 88);
  v10 = *(_OWORD *)(a1 + 72);
  v11 = v6;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v4, "_loadItemOfClass:forTypeIdentifier:options:coerceForCoding:completionHandler:", v2, v8, v5, 1, v7);

}

void __79__EXConcreteExtension__loadItemForPayload_contextIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  id v15;
  __int128 v16;
  __int128 v17;

  v15 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 80))
  {
    v6 = *(const __CFString **)(a1 + 32);
    if (v6)
    {
      if (UTTypeConformsTo(v6, (CFStringRef)*MEMORY[0x1E0CA5C90]) && _NSIsNSData())
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "objectWithItemProviderData:typeIdentifier:error:", v15, *(_QWORD *)(a1 + 32), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = *(_OWORD *)(a1 + 64);
          v16 = *(_OWORD *)(a1 + 48);
          v17 = v9;
          EXConcreteExtensionGetSandboxedResourceForItemIfNeeded(v7, &v16, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10)
          {
            v12 = v10;

            v15 = v12;
          }

        }
      }
    }
  }
  v13 = *(void **)(a1 + 40);
  v14 = *(_OWORD *)(a1 + 64);
  v16 = *(_OWORD *)(a1 + 48);
  v17 = v14;
  EXConcreteExtensionCompleteItemLoading(v15, &v16, v5, v13);

}

- (void)_loadPreviewImageForPayload:(id)a3 contextIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  Class Class;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  Class v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v8 = a5;
  v9 = a3;
  -[EXConcreteExtension _extensionContextForUUID:](self, "_extensionContextForUUID:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXConcreteExtension _itemProviderForPayload:extensionContext:](self, "_itemProviderForPayload:extensionContext:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2D00B38);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Class = objc_getClass((const char *)objc_msgSend(v12, "UTF8String"));
  objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E2D00B58);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "auditToken");
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke;
  v20[3] = &unk_1E2CFC868;
  v21 = v11;
  v22 = v14;
  v25 = v27;
  v26 = v28;
  v23 = v8;
  v24 = Class;
  v17 = v8;
  v18 = v14;
  v19 = v11;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

void __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  __int128 v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  __int128 v8;

  v5[1] = 3221225472;
  v1 = *(_OWORD *)(a1 + 80);
  v7 = *(_OWORD *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5[2] = __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke_2;
  v5[3] = &unk_1E2CFC840;
  v8 = v1;
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_loadPreviewImageOfClass:options:coerceForCoding:completionHandler:", v4, v3, 1, v5);

}

void __87__EXConcreteExtension__loadPreviewImageForPayload_contextIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  __int128 v4;
  _OWORD v5[2];

  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  EXConcreteExtensionCompleteItemLoading(a2, v5, a3, v3);
}

- (void)_openURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__EXConcreteExtension__openURL_completion___block_invoke;
    block[3] = &unk_1E2CFC750;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __43__EXConcreteExtension__openURL_completion___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = _Block_copy(*(const void **)(a1 + 48));
  objc_msgSend(v1, "performSelector:withObject:withObject:", sel___UI_upcall_openURL_completion_, v2, v3);

}

- (BOOL)_isSystemExtension
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[EXConcreteExtension infoDictionary](self, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _EXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      -[EXConcreteExtension _isSystemExtension].cold.1();

  }
  -[EXConcreteExtension infoDictionary](self, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("XPCService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("ServiceType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("System"));

  return v8;
}

- (double)requestTeardownDelay
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  double v6;

  -[EXConcreteExtension infoDictionary](self, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("NSExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("NSExtensionDisableTeardownDelay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
    v6 = 0.0;
  else
    v6 = 5.0;

  return v6;
}

- (void)_safelyBeginUsing:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setOptions:", 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__EXConcreteExtension__safelyBeginUsing___block_invoke;
  v7[3] = &unk_1E2CFC890;
  v8 = v4;
  v6 = v4;
  -[EXConcreteExtension _safelyBeginUsingWithRequest:readyHandler:](self, "_safelyBeginUsingWithRequest:readyHandler:", v5, v7);

}

uint64_t __41__EXConcreteExtension__safelyBeginUsing___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _EXLegacyLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "xpcConnection");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v3;
      _os_log_impl(&dword_190C25000, v2, OS_LOG_TYPE_DEFAULT, "Assertion invalidated: Invalidating XPC connection %{public}@ ", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(WeakRetained, "xpcConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  _BYTE buf[24];
  void *v27;
  id v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x194018140]();
  if (useAssertions())
  {
    v5 = (id *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 32), "_plugInProcessIdentifier");
    if (!(_DWORD)v6)
    {
      _EXLegacyLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_4();

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "pluginConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "set_stashedPlugInConnection:", v9);

    v10 = *(void **)(a1 + 40);
    if (v10 && (_DWORD)v6 == *(_DWORD *)(a1 + 80))
    {
      v11 = v10;
LABEL_12:
      v14 = v11;
      goto LABEL_18;
    }
    objc_msgSend(v10, "invalidate");
    v12 = *v5;
    objc_msgSend(*v5, "identifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "_wantsProcessPerRequest") & 1) == 0)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __EXConcreteExtensionSetProcessIdentifierForExtensionIdentifier_block_invoke;
      v27 = &unk_1E2CFCB58;
      v28 = v13;
      v29 = v6;
      safelyAccessPidForExtensionIdentiferDictionary(buf);

    }
    _NSAcquireProcessAssertionForPIDWithOptions(v6, objc_msgSend(*(id *)(a1 + 48), "options"), *(void **)(a1 + 56));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_12;
    _EXLegacyLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = *((_QWORD *)*v5 + 10);
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      _os_log_error_impl(&dword_190C25000, v15, OS_LOG_TYPE_ERROR, "Failed to acquire assertion for plugin: %{public}@ pid: %d", buf, 0x12u);
    }

    if (!v3)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB29E0];
      v24 = *MEMORY[0x1E0CB2D50];
      v25 = CFSTR("The plugin cannot be restarted.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -1, v18);
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v14 = 0;
LABEL_18:
  _EXLegacyLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_3(a1, (uint64_t)v3, v19);

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v20 = useAssertions();
  if (!v14 && v20)
  {
    _EXLegacyLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_2(a1, v21);

    objc_msgSend(*(id *)(a1 + 32), "_kill:", 9);
  }
  if (v3)
  {
    _EXLegacyLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_1(a1, v22);

    objc_msgSend(v14, "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "_kill:", 9);
  }
  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));

  objc_autoreleasePoolPop(v4);
}

- (BOOL)_beginUsingAndCreateExtensionAssertionWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  _sharedSafePluginQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  _sharedSafePluginQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke;
  block[3] = &unk_1E2CFC930;
  block[4] = self;
  v9 = v6;
  v15 = v9;
  v16 = &v17;
  dispatch_sync(v8, block);

  objc_msgSend(v9, "assertion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

LABEL_3:
    v11 = 1;
    goto LABEL_4;
  }
  v13 = (void *)v18[5];
  if (!v13)
    goto LABEL_3;
  v11 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v13);
LABEL_4:

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke_2;
  v6[3] = &unk_1E2CFC908;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "_safelyBeginUsingSynchronously:request:readyHandler:", 1, v4, v6);

}

void __79__EXConcreteExtension__beginUsingAndCreateExtensionAssertionWithRequest_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setAssertion:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)_safelyEndUsing:(id)a3
{
  -[EXConcreteExtension _safelyEndUsingRequestWithPKUUID:processAssertion:continuation:](self, "_safelyEndUsingRequestWithPKUUID:processAssertion:continuation:", 0, 0, a3);
}

uint64_t __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_128(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_kill:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  _EXLegacyLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[EXConcreteExtension _kill:].cold.1();

  -[PKPlugIn pluginConnection](self->__plugIn, "pluginConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_killConnection:", v3);

  -[EXConcreteExtension _stashedPlugInConnection](self, "_stashedPlugInConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[EXConcreteExtension _stashedPlugInConnection](self, "_stashedPlugInConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_kill();

    -[EXConcreteExtension set_stashedPlugInConnection:](self, "set_stashedPlugInConnection:", 0);
  }
}

- (id)extensionContexts
{
  os_unfair_lock_s *p_unfairLock;
  void *v4;

  p_unfairLock = &self->_unfairLock;
  os_unfair_lock_lock(&self->_unfairLock);
  -[NSMutableDictionary allValues](self->__extensionContexts, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_unfairLock);
  return v4;
}

- (void)_dropAssertion
{
  NSObject *v3;
  _QWORD block[5];

  _sharedSafePluginQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__EXConcreteExtension__dropAssertion__block_invoke;
  block[3] = &unk_1E2CFC438;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __37__EXConcreteExtension__dropAssertion__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "internalImplementation");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_processAssertion");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidate");
        objc_msgSend(v6, "_setProcessAssertion:", 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

}

- (void)_hostWillEnterForegroundNote:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__EXConcreteExtension__hostWillEnterForegroundNote___block_invoke;
  v3[3] = &unk_1E2CFC438;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __52__EXConcreteExtension__hostWillEnterForegroundNote___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "internalImplementation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_extensionVendorProxy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_hostWillEnterForegroundForContextUUID:completion:", v9, &__block_literal_global_129);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)_hostDidEnterBackgroundNote:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__EXConcreteExtension__hostDidEnterBackgroundNote___block_invoke;
  v3[3] = &unk_1E2CFC438;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __51__EXConcreteExtension__hostDidEnterBackgroundNote___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "internalImplementation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_extensionVendorProxy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_hostDidEnterBackgroundForContextUUID:completion:", v9, &__block_literal_global_130);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)_hostWillResignActiveNote:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__EXConcreteExtension__hostWillResignActiveNote___block_invoke;
  v3[3] = &unk_1E2CFC438;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __49__EXConcreteExtension__hostWillResignActiveNote___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "internalImplementation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_extensionVendorProxy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_hostWillResignActiveForContextUUID:completion:", v9, &__block_literal_global_131);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)_hostDidBecomeActiveNote:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__EXConcreteExtension__hostDidBecomeActiveNote___block_invoke;
  v3[3] = &unk_1E2CFC438;
  v3[4] = self;
  EXConcreteExtensionDispatchSyncFromMainQueueToGlobalStateQueue(self, v3);
}

void __48__EXConcreteExtension__hostDidBecomeActiveNote___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "extensionContexts", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "internalImplementation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_extensionVendorProxy");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_UUID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_hostDidBecomeActiveForContextUUID:completion:", v9, &__block_literal_global_132);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (id)attributes
{
  return self->_attributes;
}

- (NSString)_localizedName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)_localizedShortName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)connectionUUID
{
  return self->_connectionUUID;
}

- (void)setConnectionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)_setPlugIn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSArray)_internalPersonas
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)_setExtensionServiceConnections:(id)a3
{
  objc_storeStrong((id *)&self->__extensionServiceConnections, a3);
}

- (NSMutableDictionary)_extensionExpirationIdentifiers
{
  return self->__extensionExpirationIdentifiers;
}

- (void)_setExtensionExpirationsIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->__extensionExpirationIdentifiers, a3);
}

- (void)_setExtensionContexts:(id)a3
{
  objc_storeStrong((id *)&self->__extensionContexts, a3);
}

- (id)_stashedPlugInConnection
{
  return objc_getProperty(self, a2, 120, 1);
}

- (id)requestCompletionBlock
{
  return self->_requestCompletionBlock;
}

- (void)setRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)requestCancellationBlock
{
  return self->_requestCancellationBlock;
}

- (void)setRequestCancellationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)requestInterruptionBlock
{
  return self->_requestInterruptionBlock;
}

- (void)set_requestPostCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (id)_requestPostCompletionBlockWithItems
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)set_requestPostCompletionBlockWithItems:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (NSSet)_allowedErrorClasses
{
  return self->__allowedErrorClasses;
}

- (void)_setAllowedErrorClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)_isObservingHostAppStateChanges
{
  return self->_observingHostAppStateChanges;
}

- (void)_setObservingHostAppStateChanges:(BOOL)a3
{
  self->_observingHostAppStateChanges = a3;
}

- (int64_t)wantsDedicatedQueue
{
  return self->_wantsDedicatedQueue;
}

- (void)setWantsDedicatedQueue:(int64_t)a3
{
  self->_wantsDedicatedQueue = a3;
}

- (NSDictionary)_extensionState
{
  void *v2;
  void *v3;
  void *v4;

  -[EXConcreteExtension _plugIn](self, "_plugIn");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v4;
}

- (void)_setExtensionState:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(a3, "copy");
  -[EXConcreteExtension _plugIn](self, "_plugIn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExtensionState:", v5);

}

- (BOOL)_isMarkedNew
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[EXConcreteExtension _plugIn](self, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userElection");

  if (v4)
    return 0;
  -[EXConcreteExtension _plugIn](self, "_plugIn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("extensionState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("lastDateManagedOn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("firstDateIndicatedFor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "components:fromDate:toDate:options:", 16, v9, v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(v12, "day") < 2;
    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (void)_didShowExtensionManagementInterface
{
  void *v3;
  void *v4;
  id v5;

  -[EXConcreteExtension _extensionState](self, "_extensionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("lastDateManagedOn"));

  -[EXConcreteExtension willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedNew"));
  -[EXConcreteExtension _setExtensionState:](self, "_setExtensionState:", v5);
  -[EXConcreteExtension didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedNew"));

}

- (void)_didShowNewExtensionIndicator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EXConcreteExtension _extensionState](self, "_extensionState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v6, "objectForKey:", CFSTR("firstDateIndicatedFor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("firstDateIndicatedFor"));

    -[EXConcreteExtension willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedNew"));
    -[EXConcreteExtension _setExtensionState:](self, "_setExtensionState:", v6);
    -[EXConcreteExtension didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedNew"));
  }

}

- (void)_resetExtensionState
{
  void *v3;

  -[EXConcreteExtension willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("markedNew"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXConcreteExtension _setExtensionState:](self, "_setExtensionState:", v3);

  -[EXConcreteExtension didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("markedNew"));
}

+ (id)_inputItemsByApplyingActiveWebPageAlternative:(id)a3 ifNeededByActivationRule:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];
  uint64_t v11;

  v6 = a3;
  v11 = 0;
  if (objc_msgSend(a1, "_evaluateActivationRule:withInputItemsIfTheyMatchActiveWebPageAlternative:matchResult:", a4, v6, &v11))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __131__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsByApplyingActiveWebPageAlternative_ifNeededByActivationRule___block_invoke;
    v10[3] = &__block_descriptor_40_e42_B24__0__NSExtensionItem_8__NSDictionary_16l;
    v10[4] = v11;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  return v6;
}

uint64_t __131__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsByApplyingActiveWebPageAlternative_ifNeededByActivationRule___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "attachments", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (*(_QWORD *)(a1 + 32) == 1)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "registeredTypeIdentifiers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "containsObject:", CFSTR("com.apple.webarchive"));

          if (!v11)
            goto LABEL_19;
        }
        objc_msgSend(v3, "userInfo");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("supportsJavaScript"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (*(_QWORD *)(a1 + 32) == 2)
        {
          objc_msgSend(v9, "registeredTypeIdentifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v14, "containsObject:", CFSTR("public.url"))
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {

LABEL_19:
            v16 = 0;
            goto LABEL_20;
          }
          v15 = objc_msgSend(v13, "BOOLValue");

          if (!v15)
            goto LABEL_19;
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v16 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_20:

  return v16;
}

+ (BOOL)_matchingDictionaryMatchesActiveWebPageAlternative:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  char v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("extensionItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  v7 = objc_msgSend(a1, "_genericValuesMatchActiveWebPageAlternativeWithExtensionItems:attachmentsLens:registeredTypeIdentifiersLens:isActiveWebPageAttachmentCheck:", v6, &__block_literal_global_2, &__block_literal_global_24, &__block_literal_global_26);
  return v7;
}

id __111__EXConcreteExtension_NSExtensionActiveWebPageAlternative___matchingDictionaryMatchesActiveWebPageAlternative___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("attachments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

id __111__EXConcreteExtension_NSExtensionActiveWebPageAlternative___matchingDictionaryMatchesActiveWebPageAlternative___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("registeredTypeIdentifiers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __111__EXConcreteExtension_NSExtensionActiveWebPageAlternative___matchingDictionaryMatchesActiveWebPageAlternative___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("registeredTypeIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.active-webpage"));
  return v6;
}

uint64_t __101__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsMatchActiveWebPageAlternative___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attachments");
}

uint64_t __101__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsMatchActiveWebPageAlternative___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "registeredTypeIdentifiers");
}

uint64_t __101__EXConcreteExtension_NSExtensionActiveWebPageAlternative___inputItemsMatchActiveWebPageAlternative___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("supportsJavaScript"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  if (v9)
  {
    objc_msgSend(v4, "registeredTypeIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("public.url"));

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __199__EXConcreteExtension_NSExtensionActiveWebPageAlternative___genericValuesMatchActiveWebPageAlternativeWithExtensionItems_attachmentsLens_registeredTypeIdentifiersLens_isActiveWebPageAttachmentCheck___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  (*(void (**)(void))(a1[4] + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v8, "containsObject:", CFSTR("com.apple.webarchive")))
      {
        *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
      }
      if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
        && (*(unsigned int (**)(void))(a1[6] + 16))())
      {
        *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = a3;
      }

    }
  }

}

+ (id)_dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:(id)a3 fromMatchingDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensionItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __141__EXConcreteExtension_NSExtensionActiveWebPageAlternative___dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier_fromMatchingDictionary___block_invoke;
  v16[3] = &unk_1E2CFCE38;
  v17 = v5;
  v10 = v5;
  objc_msgSend(v9, "indexesOfObjectsPassingTest:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    v12 = (id)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("extensionItems"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObjectsAtIndexes:", v11);
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("extensionItems"));

  }
  else
  {
    v12 = v6;
  }

  return v12;
}

uint64_t __141__EXConcreteExtension_NSExtensionActiveWebPageAlternative___dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier_fromMatchingDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  char v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attachments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v22 = v3;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
        v15 = v14;

        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("registeredTypeIdentifiers"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v17 = v16;
        else
          v17 = 0;
        v18 = v17;

        v19 = objc_msgSend(v18, "containsObject:", *(_QWORD *)(a1 + 32));
        if ((v19 & 1) != 0)
        {
          v20 = 0;
          goto LABEL_23;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
        continue;
      break;
    }
    v20 = 1;
LABEL_23:
    v3 = v22;
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

+ (BOOL)_evaluateActivationRule:(id)a3 withInputItemsIfTheyMatchActiveWebPageAlternative:(id)a4 matchResult:(int64_t *)a5
{
  id v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = CFSTR("extensionItems");
  v8 = a3;
  objc_msgSend(a4, "valueForKey:", CFSTR("_matchingDictionaryRepresentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "_evaluateActivationRule:withDictionaryIfItMatchesActiveWebPageAlternative:matchResult:", v8, v10, a5);

  return (char)a5;
}

+ (BOOL)_evaluateActivationRule:(id)a3 withDictionaryIfItMatchesActiveWebPageAlternative:(id)a4 matchResult:(int64_t *)a5
{
  id v8;
  id v9;
  int v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(a1, "_matchingDictionaryMatchesActiveWebPageAlternative:", v9);
  if (v10)
  {
    if (objc_msgSend(a1, "_evaluateActivationRuleWithoutWorkarounds:withExtensionItemsRepresentation:", v8, v9))
    {
      *a5 = 3;
    }
    else
    {
      objc_msgSend(a1, "_dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:fromMatchingDictionary:", CFSTR("com.apple.active-webpage"), v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1, "_evaluateActivationRuleWithoutWorkarounds:withExtensionItemsRepresentation:", v8, v11))
      {
        *a5 = 2;
      }
      else
      {
        objc_msgSend(a1, "_dictionaryIncludingOnlyItemsWithRegisteredTypeIdentifier:fromMatchingDictionary:", CFSTR("com.apple.webarchive"), v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *a5 = objc_msgSend(a1, "_evaluateActivationRuleWithoutWorkarounds:withExtensionItemsRepresentation:", v8, v12);

      }
    }
  }

  return v10;
}

+ (BOOL)evaluateActivationRule:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  id v6;
  id v7;
  char v8;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  v10 = 0;
  if (objc_msgSend(a1, "_evaluateActivationRule:withDictionaryIfItMatchesActiveWebPageAlternative:matchResult:", v6, v7, &v10))v8 = v10 != 0;
  else
    v8 = objc_msgSend(a1, "_evaluateActivationRuleWithoutWorkarounds:withExtensionItemsRepresentation:", v6, v7);

  return v8;
}

+ (BOOL)_evaluateActivationRuleWithoutWorkarounds:(id)a3 withExtensionItemsRepresentation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char matched;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    if (_NSIsNSDictionary())
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = 1;
      objc_msgSend(v5, "allValues");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __109__EXConcreteExtension_Filtering___evaluateActivationRuleWithoutWorkarounds_withExtensionItemsRepresentation___block_invoke;
      v15[3] = &unk_1E2CFCF10;
      v15[4] = &v16;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);

      if (*((_BYTE *)v17 + 24))
      {
        matched = 0;
LABEL_5:
        _Block_object_dispose(&v16, 8);
LABEL_21:

        goto LABEL_22;
      }
      +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "platformShouldExhibitEmbeddedBehavior");

      if (v11)
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("NSExtensionActivationSupportsLocationWithMaxCount"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && _NSIsNSNumber() && (int)objc_msgSend(v12, "intValue") >= 1)
        {
          matched = _EXExtensionItemsMatchHackishRepresentationOfSharedLocationExtensionItems(v6);
          if ((matched & 1) != 0 || objc_msgSend(v5, "count") == 1)
          {

            goto LABEL_5;
          }
          v13 = (void *)objc_msgSend(v5, "mutableCopy");
          objc_msgSend(v13, "removeObjectForKey:", CFSTR("NSExtensionActivationSupportsLocationWithMaxCount"));

        }
        else
        {
          v13 = v5;
        }

        v5 = v13;
      }
      _Block_object_dispose(&v16, 8);
      _EXExtensionPredicateForActivationRule(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _EXExtensionPredicateForActivationRule(v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!EXExtensionIsPredicateSafeToExecuteWithObject(v9, v6))
      {
        matched = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    matched = objc_msgSend(v9, "evaluateWithObject:", v6);
    goto LABEL_20;
  }
  matched = 0;
LABEL_22:

  return matched;
}

void __109__EXConcreteExtension_Filtering___evaluateActivationRuleWithoutWorkarounds_withExtensionItemsRepresentation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "intValue"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (id)predicateForActivationRule:(id)a3
{
  return _EXExtensionPredicateForActivationRule(a3);
}

void __52__EXConcreteExtension_extensionWithUUID_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, v0, v1, "errors encountered while discovering extensions: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_bareExtensionServiceConnection
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(&dword_190C25000, v0, v1, "%{public}@ Making host default XPC interface, allowed error classes: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = a1;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  OUTLINED_FUNCTION_17(&dword_190C25000, a3, v8, "%@ Finished making extension context: %{public}@ and connection: %{public}@", (uint8_t *)&v9);

}

- (void)makeExtensionContextAndXPCConnectionForRequest:(uint64_t)a3 error:.cold.2(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_16(&dword_190C25000, a2, a3, "terminated extension with pid %d", (uint8_t *)v3);
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(NSObject *)a1 error:.cold.3(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_16(&dword_190C25000, a1, v3, "could not terminate extension: %{darwin.errno}d", (uint8_t *)v4);
  OUTLINED_FUNCTION_6();
}

- (void)makeExtensionContextAndXPCConnectionForRequest:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(&dword_190C25000, v0, v1, "Failed to make XPC connection for extension: %{public}@ request: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(NSObject *)a3 error:.cold.5(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_10_0(&dword_190C25000, a3, v7, "extension assertion was invalidated! request: %{public}@; plugin_identifier: %{public}@",
    (uint8_t *)&v8);

  OUTLINED_FUNCTION_9();
}

- (void)makeExtensionContextAndXPCConnectionForRequest:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_7_0(&dword_190C25000, v0, v1, "Failed to make extension context for extension: %{public}@ request: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)makeExtensionContextAndXPCConnectionForRequest:(NSObject *)a3 error:.cold.7(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 136315906;
  *(_QWORD *)(a2 + 4) = "extensionContext != nil";
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtensio"
                         "n/NSExtensionSupport/EXConcreteExtension.m";
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + 24) = 618;
  *(_WORD *)(a2 + 28) = 2112;
  *(_QWORD *)(a2 + 30) = a1;
  OUTLINED_FUNCTION_20(&dword_190C25000, a3, (uint64_t)a3, "%s - %s:%d: Unable to initialize extension context class: %@", (uint8_t *)a2);

}

- (void)makeExtensionContextAndXPCConnectionForRequest:error:.cold.8()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_4_0(&dword_190C25000, v0, (uint64_t)v0, "Making extension context and XPC connection for %{public}@ request: %{public}@", v1);
  OUTLINED_FUNCTION_6();
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, a2, v4, "Unable to setup extension context - error: %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_71_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_190C25000, log, OS_LOG_TYPE_FAULT, "UUIDs did not match!", v1, 2u);
}

void __77__EXConcreteExtension__reallyBeginExtensionRequest_synchronously_completion___block_invoke_71_cold_2()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_17(&dword_190C25000, v2, (uint64_t)v2, "%{public}@ Did begin request: %{public}@ context UUID: %{public}@", v3);
  OUTLINED_FUNCTION_7();
}

- (void)_beginExtensionRequest:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "begin async extension request %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7_0(&dword_190C25000, v0, v1, "begin extension request %{public}@ complete with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_4_0(&dword_190C25000, v0, (uint64_t)v0, "begin extension request %{public}@ complete with identifier: %{public}@", v1);
  OUTLINED_FUNCTION_6();
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, v0, v1, "Async Begin using error: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_3()
{
  os_log_t v0;
  uint8_t v1[14];
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  v2 = 0;
  _os_log_fault_impl(&dword_190C25000, v0, OS_LOG_TYPE_FAULT, "Async Begin using internal completion handler called multiple times. For unknow reasons. (request ID: %{public}@ error: %{public}@)", v1, 0x16u);
  OUTLINED_FUNCTION_6();
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, v0, v1, "Async Begin using internal completion handler called multiple times. Due to error before initial completion for request: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __57__EXConcreteExtension__beginExtensionRequest_completion___block_invoke_3_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, v0, v1, "Async Begin using internal completion handler called multiple times. Due to error after initial completion: %{public}@", v2);
  OUTLINED_FUNCTION_6();
}

- (void)_beginExtensionRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "synchronus begin extension request %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)objectForInfoDictionaryKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: can't get info dictionary keys from a nil plugin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_extensionBundle
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, a2, v4, "Unable to use extension bundle: %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

- (void)_isPhotoServiceAccessGranted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: PlugIn's UUID is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_isSystemExtension
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: infoDictionary is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_wantsProcessPerRequest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: infoDictionary is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_hostContextClass
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = "extensionContextHostClass != nil";
  v5 = 2080;
  v6 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/NSExtension/NSExtensionSuppo"
       "rt/EXConcreteExtension.m";
  v7 = 1024;
  v8 = 1312;
  v9 = 2112;
  v10 = a1;
  OUTLINED_FUNCTION_20(&dword_190C25000, a2, a3, "%s - %s:%d: Unable to load host extension context class: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_7();
}

- (void)_safelyBeginUsingSynchronously:request:readyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_13(&dword_190C25000, v0, v1, "Attempt to reuse spect multi instance extension. Request will fail with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_safelyBeginUsingSynchronously:(uint64_t)a3 request:(NSObject *)a4 readyHandler:.cold.2(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_190C25000, a4, a3, "BeginUsing: Calling into PluginKit plugin: %{public}@ requestUUID: %{public}@", (uint8_t *)a3);

}

- (void)_safelyBeginUsingSynchronously:request:readyHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: attempting to message a spent plugin!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_safelyBeginUsingSynchronously:request:readyHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_190C25000, v0, v1, "%s - %s:%d: attempting to message a nil plugin!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, a2, v4, "PlugInKit error in beginUsing: with plugin identifier: %{public}@, killing plugin", v5);

  OUTLINED_FUNCTION_7();
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_2(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, a2, v4, "Unable to acquire process assertion in beginUsing: with plugin identifier: %{public}@, killing plugin", v5);

  OUTLINED_FUNCTION_7();
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "pkUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  v8 = a2;
  OUTLINED_FUNCTION_4_0(&dword_190C25000, a3, v6, "BeginUsing: PluginKit responded for requesr: %{public}@ with error: %{public}@", v7);

  OUTLINED_FUNCTION_9();
}

void __75__EXConcreteExtension__safelyBeginUsingSynchronously_request_readyHandler___block_invoke_118_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_2_0(&dword_190C25000, v0, v1, "Plugin %{public}@ must have pid! Extension request will fail", v2);
  OUTLINED_FUNCTION_6();
}

void __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_7_0(&dword_190C25000, v0, v1, "EndUsing failed to endUsing extension %{public}@ with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __86__EXConcreteExtension__safelyEndUsingRequestWithPKUUID_processAssertion_continuation___block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_4_0(&dword_190C25000, v0, (uint64_t)v0, "EndUsing: Calling into PluginKit plugin: %{public}@ requestUUID: %{public}@", v1);
  OUTLINED_FUNCTION_6();
}

- (void)_kill:.cold.1()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_190C25000, v1, OS_LOG_TYPE_DEBUG, "Client requested termination of extension %{public}@ with signal: %d ", v2, 0x12u);
  OUTLINED_FUNCTION_6();
}

@end
