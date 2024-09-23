@implementation CHSWidgetExtensionProvider

- (NSSet)containers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CHSWidgetExtensionProvider _widgetExtensionSet](self, "_widgetExtensionSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetExtensionContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (CHSWidgetExtensionSet)_widgetExtensionSet
{
  os_unfair_lock_s *p_lock;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CHSWidgetExtensionProvider__widgetExtensionSet__block_invoke;
  v5[3] = &unk_1E2A5A300;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __49__CHSWidgetExtensionProvider__widgetExtensionSet__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CHSWidgetExtensionSet *)v3;
}

void __49__CHSWidgetExtensionProvider__widgetExtensionSet__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lock_loadContentInitiallySynchronouslyIfNecessary");
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_lock_loadContentInitiallySynchronouslyIfNecessary
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  CHSChronoServicesConnection *lock_connection;
  BSInvalidatable *v10;
  BSInvalidatable *lock_subscription;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  CHSWidgetExtensionProvider *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_lock_subscription)
  {
    v3 = -[CHSWidgetExtensionProvider _isEDUMode](self, "_isEDUMode");
    CHSLogChronoServices();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_DWORD *)buf = 134217984;
        v17 = self;
        _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Skipping sync load because in EDU mode.", buf, 0xCu);
      }
      v6 = 0;
      v7 = 0;
    }
    else
    {
      if (v5)
      {
        -[CHSWidgetExtensionProviderOptions description](self->_lock_providerOptions, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v17 = self;
        v18 = 2114;
        v19 = (uint64_t)v8;
        _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Loading synchronously options: %{public}@.", buf, 0x16u);

      }
      lock_connection = self->_lock_connection;
      v14 = 0;
      v15 = 0;
      -[CHSChronoServicesConnection subscribeToExtensions:fromClient:withOptions:outExtensions:](lock_connection, "subscribeToExtensions:fromClient:withOptions:outExtensions:", &v15, self, self->_lock_providerOptions, &v14);
      v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v7 = v15;
      v6 = v14;
      lock_subscription = self->_lock_subscription;
      self->_lock_subscription = v10;

      CHSLogChronoServices();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = objc_msgSend(v6, "count");
        -[CHSWidgetExtensionProviderOptions description](self->_lock_providerOptions, "description");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v17 = self;
        v18 = 2048;
        v19 = v12;
        v20 = 2114;
        v21 = v13;
        _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Loaded synchronously - %lu received, options: %{public}@.", buf, 0x20u);

      }
    }

    -[CHSWidgetExtensionProvider _lock_widgetExtensionsDidChange:postNotification:reason:](self, "_lock_widgetExtensionsDidChange:postNotification:reason:", v6, 0, CFSTR("initial sync"));
  }
}

- (CHSWidgetExtensionProvider)initWithOptions:(id)a3
{
  id v4;
  void *v5;
  CHSWidgetExtensionProvider *v6;

  v4 = a3;
  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CHSWidgetExtensionProvider initWithConnection:providerOptions:eduProvider:](self, "initWithConnection:providerOptions:eduProvider:", v5, v4, &__block_literal_global_1);

  return v6;
}

uint64_t __46__CHSWidgetExtensionProvider_initWithOptions___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.springboard")))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v2 = (void *)getUMUserManagerClass_softClass;
    v11 = getUMUserManagerClass_softClass;
    if (!getUMUserManagerClass_softClass)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __getUMUserManagerClass_block_invoke;
      v7[3] = &unk_1E2A5A6E8;
      v7[4] = &v8;
      __getUMUserManagerClass_block_invoke((uint64_t)v7);
      v2 = (void *)v9[3];
    }
    v3 = objc_retainAutorelease(v2);
    _Block_object_dispose(&v8, 8);
    objc_msgSend(v3, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isMultiUser");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initIncludingIntents:(BOOL)a3
{
  _BOOL8 v3;
  CHSWidgetExtensionProviderOptions *v5;
  CHSWidgetDescriptorsPredicate *v6;
  CHSWidgetExtensionProviderOptions *v7;
  CHSWidgetExtensionProvider *v8;

  v3 = a3;
  v5 = [CHSWidgetExtensionProviderOptions alloc];
  v6 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  v7 = -[CHSWidgetExtensionProviderOptions initWithWidgetsPredicate:controlsPredicate:includeIntents:](v5, "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v6, 0, v3);

  v8 = -[CHSWidgetExtensionProvider initWithOptions:](self, "initWithOptions:", v7);
  return v8;
}

- (CHSWidgetExtensionProvider)init
{
  CHSWidgetExtensionProviderOptions *v3;
  CHSWidgetDescriptorsPredicate *v4;
  CHSWidgetExtensionProviderOptions *v5;
  CHSWidgetExtensionProvider *v6;

  v3 = [CHSWidgetExtensionProviderOptions alloc];
  v4 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  v5 = -[CHSWidgetExtensionProviderOptions initWithWidgetsPredicate:controlsPredicate:includeIntents:](v3, "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v4, 0, 1);

  v6 = -[CHSWidgetExtensionProvider initWithOptions:](self, "initWithOptions:", v5);
  return v6;
}

- (CHSWidgetExtensionProvider)initWithConnection:(id)a3 providerOptions:(id)a4 eduProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHSWidgetExtensionProvider *v12;
  CHSWidgetExtensionProvider *v13;
  uint64_t v14;
  NSHashTable *lock_observers;
  void *v16;
  id eduModeProvider;
  CHSIconResolver *v18;
  CHSIconResolving *iconResolver;
  CHSWidgetExtensionSet *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  CHSWidgetExtensionSet *lock_extensionSet;
  uint64_t v25;
  NSDictionary *lock_iconVersionByExtensionIdentity;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (initWithConnection_providerOptions_eduProvider____once[0] != -1)
    dispatch_once(initWithConnection_providerOptions_eduProvider____once, &__block_literal_global_6);
  v28.receiver = self;
  v28.super_class = (Class)CHSWidgetExtensionProvider;
  v12 = -[CHSWidgetExtensionProvider init](&v28, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    lock_observers = v13->_lock_observers;
    v13->_lock_observers = (NSHashTable *)v14;

    objc_storeStrong((id *)&v13->_lock_connection, a3);
    objc_storeStrong((id *)&v13->_lock_providerOptions, a4);
    -[CHSChronoServicesConnection addClient:](v13->_lock_connection, "addClient:", v13);
    v16 = _Block_copy(v11);
    eduModeProvider = v13->_eduModeProvider;
    v13->_eduModeProvider = v16;

    v18 = objc_alloc_init(CHSIconResolver);
    iconResolver = v13->_iconResolver;
    v13->_iconResolver = (CHSIconResolving *)v18;

    v20 = [CHSWidgetExtensionSet alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHSEquivalentBundleIdentifierResolver defaultResolver](CHSEquivalentBundleIdentifierResolver, "defaultResolver");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[CHSWidgetExtensionSet initWithExtensions:equivalentBundleIdentifierResolver:iconResolver:](v20, "initWithExtensions:equivalentBundleIdentifierResolver:iconResolver:", v21, v22, v13->_iconResolver);
    lock_extensionSet = v13->_lock_extensionSet;
    v13->_lock_extensionSet = (CHSWidgetExtensionSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    lock_iconVersionByExtensionIdentity = v13->_lock_iconVersionByExtensionIdentity;
    v13->_lock_iconVersionByExtensionIdentity = (NSDictionary *)v25;

  }
  return v13;
}

void __77__CHSWidgetExtensionProvider_initWithConnection_providerOptions_eduProvider___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.chrono.descriptorProvider", v2);
  v1 = (void *)__calloutQueue_0;
  __calloutQueue_0 = (uint64_t)v0;

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__CHSWidgetExtensionProvider_dealloc__block_invoke;
  v5[3] = &unk_1E2A5A2D8;
  v5[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __37__CHSWidgetExtensionProvider_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)CHSWidgetExtensionProvider;
  -[CHSWidgetExtensionProvider dealloc](&v4, sel_dealloc);
}

uint64_t __37__CHSWidgetExtensionProvider_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
}

- (NSSet)extensions
{
  void *v2;
  void *v3;

  -[CHSWidgetExtensionProvider _widgetExtensionSet](self, "_widgetExtensionSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)widgetDescriptorForWidget:(id)a3
{
  -[CHSWidgetExtensionProvider widgetDescriptorForIdentifiable:](self, "widgetDescriptorForIdentifiable:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)widgetDescriptorForIdentifiable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetExtensionProvider _widgetExtensionSet](self, "_widgetExtensionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetExtensionForExtensionIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[CHSWidgetExtensionProvider succinctDescription](self, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetExtensionProvider widgetDescriptorForIdentifiable:].cold.1(v9, (uint64_t)v5, (uint64_t)v13);
    }

  }
  objc_msgSend(v4, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "widgetDescriptorForKind:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)controlDescriptorForControl:(id)a3
{
  -[CHSWidgetExtensionProvider controlDescriptorForIdentifiable:](self, "controlDescriptorForIdentifiable:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)controlDescriptorForIdentifiable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetExtensionProvider _widgetExtensionSet](self, "_widgetExtensionSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "widgetExtensionForExtensionIdentity:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[CHSWidgetExtensionProvider succinctDescription](self, "succinctDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetExtensionProvider widgetDescriptorForIdentifiable:].cold.1(v9, (uint64_t)v5, (uint64_t)v13);
    }

  }
  objc_msgSend(v4, "kind");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlDescriptorForKind:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)widgetExtensionContainerForContainerBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CHSWidgetExtensionProvider _widgetExtensionSet](self, "_widgetExtensionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetExtensionContainerForContainerBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)widgetExtensionContainerForExtensionBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CHSWidgetExtensionProvider _widgetExtensionSet](self, "_widgetExtensionSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widgetExtensionContainerForExtensionBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)registerObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CHSWidgetExtensionProvider_registerObserver___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __47__CHSWidgetExtensionProvider_registerObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __47__CHSWidgetExtensionProvider_registerObserver___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 56))
  {
    v2 = result;
    objc_msgSend(*(id *)(v1 + 72), "addObject:", *(_QWORD *)(result + 40));
    CHSLogChronoServices();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = *(_QWORD *)(v2 + 32);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p>"), v7, *(_QWORD *)(v2 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v10 = v5;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_18FB18000, v3, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Add observer: %{public}@.", buf, 0x16u);

    }
    return objc_msgSend(*(id *)(v2 + 32), "_lock_loadContentInitiallySynchronouslyIfNecessary");
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__CHSWidgetExtensionProvider_unregisterObserver___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __49__CHSWidgetExtensionProvider_unregisterObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __49__CHSWidgetExtensionProvider_unregisterObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p>"), v6, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v10 = v4;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Remove observer: %{public}@.", buf, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _QWORD v3[5];

  p_lock = &self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__CHSWidgetExtensionProvider_invalidate__block_invoke;
  v3[3] = &unk_1E2A5A2D8;
  v3[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __40__CHSWidgetExtensionProvider_invalidate__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_lock);
}

void __40__CHSWidgetExtensionProvider_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 56))
  {
    *(_BYTE *)(v1 + 56) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

  }
}

- (NSString)description
{
  return (NSString *)-[CHSWidgetExtensionProvider descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetExtensionProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD v11[7];
  _QWORD v12[4];
  _QWORD v13[5];
  id v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  v14 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  p_lock = &self->_lock;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke;
  v11[3] = &unk_1E2A5A670;
  v11[4] = self;
  v11[5] = v13;
  v11[6] = v12;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke(v11);
  os_unfair_lock_unlock(p_lock);
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke_2;
  v7[3] = &unk_1E2A5A698;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  v9 = v13;
  v10 = v12;
  objc_msgSend(v5, "appendProem:block:", self, v7);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v13, 8);

  return v5;
}

void __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1[4] + 64), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1[4] + 32), "allExtensions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v5, "count");

}

id __56__CHSWidgetExtensionProvider_succinctDescriptionBuilder__block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), CFSTR("options"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), CFSTR("widgetExtensions"));
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetExtensionProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CHSWidgetExtensionProvider *v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  v14 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E2A5A6C0;
  v12[4] = self;
  v12[5] = v13;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke((uint64_t)v12);
  os_unfair_lock_unlock(&self->_lock);
  -[CHSWidgetExtensionProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v9[3] = &unk_1E2A5A290;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);
  v7 = v6;

  _Block_object_dispose(v13, 8);
  return v7;
}

void __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __68__CHSWidgetExtensionProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_widgetExtensionSet");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "widgetExtensionContainers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("containers"), 0);

}

- (void)widgetExtensionsDidChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  p_lock = &self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__CHSWidgetExtensionProvider_widgetExtensionsDidChange___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __56__CHSWidgetExtensionProvider_widgetExtensionsDidChange___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __56__CHSWidgetExtensionProvider_widgetExtensionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_widgetExtensionsDidChange:postNotification:reason:", *(_QWORD *)(a1 + 40), 1, CFSTR("chrono update"));
}

- (void)_lock_widgetExtensionsDidChange:(id)a3 postNotification:(BOOL)a4 reason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSDictionary *v12;
  CHSWidgetExtensionSet *v13;
  CHSWidgetExtensionSet *lock_extensionSet;
  NSDictionary *lock_iconVersionByExtensionIdentity;
  int v16;
  CHSWidgetExtensionProvider *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  CHSLogChronoServices();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134218498;
    v17 = self;
    v18 = 2048;
    v19 = objc_msgSend(v8, "count");
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_DEFAULT, "<CHSWidgetExtensionProvider:%p> Widget extensions changed - %lu received for %{public}@.", (uint8_t *)&v16, 0x20u);
  }

  if (!v8)
    v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  if (!self->_lock_invalidated)
  {
    -[CHSWidgetExtensionSet allExtensions](self->_lock_extensionSet, "allExtensions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CHSWidgetExtensionProvider _computeIconVersionsByForExtensions:withIconResolver:](CHSWidgetExtensionProvider, "_computeIconVersionsByForExtensions:withIconResolver:", v11, self->_iconResolver);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isEqualToSet:", v11)
      || !-[NSDictionary isEqualToDictionary:](v12, "isEqualToDictionary:", self->_lock_iconVersionByExtensionIdentity))
    {
      +[CHSWidgetExtensionProvider _makeWidgetExtensionSetWithExtensions:iconResolver:](CHSWidgetExtensionProvider, "_makeWidgetExtensionSetWithExtensions:iconResolver:", v8, self->_iconResolver);
      v13 = (CHSWidgetExtensionSet *)objc_claimAutoreleasedReturnValue();
      lock_extensionSet = self->_lock_extensionSet;
      self->_lock_extensionSet = v13;

      if (v6)
        -[CHSWidgetExtensionProvider _lock_notifyObserversExtensionsDidChange](self, "_lock_notifyObserversExtensionsDidChange");
    }
    lock_iconVersionByExtensionIdentity = self->_lock_iconVersionByExtensionIdentity;
    self->_lock_iconVersionByExtensionIdentity = v12;

  }
}

+ (id)_makeWidgetExtensionSetWithExtensions:(id)a3 iconResolver:(id)a4
{
  id v5;
  id v6;
  CHSWidgetExtensionSet *v7;
  void *v8;
  CHSWidgetExtensionSet *v9;

  v5 = a3;
  v6 = a4;
  v7 = [CHSWidgetExtensionSet alloc];
  +[CHSEquivalentBundleIdentifierResolver defaultResolver](CHSEquivalentBundleIdentifierResolver, "defaultResolver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CHSWidgetExtensionSet initWithExtensions:equivalentBundleIdentifierResolver:iconResolver:](v7, "initWithExtensions:equivalentBundleIdentifierResolver:iconResolver:", v5, v8, v6);

  return v9;
}

+ (id)_computeIconVersionsByForExtensions:(id)a3 withIconResolver:(id)a4
{
  return (id)objc_opt_new();
}

- (BOOL)_isEDUMode
{
  uint64_t (**eduModeProvider)(void);

  eduModeProvider = (uint64_t (**)(void))self->_eduModeProvider;
  if (eduModeProvider)
    LOBYTE(eduModeProvider) = eduModeProvider[2]();
  return (char)eduModeProvider;
}

- (void)_lock_notifyObserversExtensionsDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
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
  v3 = (void *)-[NSHashTable copy](self->_lock_observers, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9[0] = v6;
          v9[1] = 3221225472;
          v9[2] = __70__CHSWidgetExtensionProvider__lock_notifyObserversExtensionsDidChange__block_invoke;
          v9[3] = &unk_1E2A5A290;
          v9[4] = v8;
          v9[5] = self;
          dispatch_async((dispatch_queue_t)__calloutQueue_0, v9);
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __70__CHSWidgetExtensionProvider__lock_notifyObserversExtensionsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "extensionsDidChangeForExtensionProvider:", *(_QWORD *)(a1 + 40));
}

- (CHSChronoServicesConnection)connection
{
  return self->_lock_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_lock_connection, a3);
}

- (id)eduModeProvider
{
  return self->_eduModeProvider;
}

- (void)setEduModeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_iconVersionByExtensionIdentity, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_providerOptions, 0);
  objc_storeStrong((id *)&self->_lock_subscription, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_lock_extensionSet, 0);
  objc_storeStrong((id *)&self->_iconResolver, 0);
  objc_storeStrong(&self->_eduModeProvider, 0);
}

- (void)widgetDescriptorForIdentifiable:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_18FB18000, "[%{public}@] Unable to find extension for extension identity: %{public}@.", v4, v5);

}

@end
