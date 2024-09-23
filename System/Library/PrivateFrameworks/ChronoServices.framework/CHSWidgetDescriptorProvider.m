@implementation CHSWidgetDescriptorProvider

- (id)initIncludingIntents:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CHSWidgetExtensionProviderOptions *v6;
  CHSWidgetDescriptorsPredicate *v7;
  CHSWidgetExtensionProviderOptions *v8;
  CHSWidgetExtensionProvider *v9;
  CHSWidgetDescriptorProvider *v10;

  v3 = a3;
  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [CHSWidgetExtensionProviderOptions alloc];
  v7 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  v8 = -[CHSWidgetExtensionProviderOptions initWithWidgetsPredicate:controlsPredicate:includeIntents:](v6, "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v7, 0, v3);

  v9 = -[CHSWidgetExtensionProvider initWithOptions:]([CHSWidgetExtensionProvider alloc], "initWithOptions:", v8);
  v10 = -[CHSWidgetDescriptorProvider initWithConnection:extensionProvider:providerOptions:](self, "initWithConnection:extensionProvider:providerOptions:", v5, v9, v8);

  return v10;
}

- (CHSWidgetDescriptorProvider)init
{
  return (CHSWidgetDescriptorProvider *)-[CHSWidgetDescriptorProvider initIncludingIntents:](self, "initIncludingIntents:", 1);
}

- (CHSWidgetDescriptorProvider)initWithConnection:(id)a3 extensionProvider:(id)a4
{
  id v6;
  id v7;
  CHSWidgetExtensionProviderOptions *v8;
  CHSWidgetDescriptorsPredicate *v9;
  CHSWidgetExtensionProviderOptions *v10;
  CHSWidgetDescriptorProvider *v11;

  v6 = a3;
  v7 = a4;
  v8 = [CHSWidgetExtensionProviderOptions alloc];
  v9 = objc_alloc_init(CHSWidgetDescriptorsPredicate);
  v10 = -[CHSWidgetExtensionProviderOptions initWithWidgetsPredicate:controlsPredicate:includeIntents:](v8, "initWithWidgetsPredicate:controlsPredicate:includeIntents:", v9, 0, 1);

  v11 = -[CHSWidgetDescriptorProvider initWithConnection:extensionProvider:providerOptions:](self, "initWithConnection:extensionProvider:providerOptions:", v6, v7, v10);
  return v11;
}

- (CHSWidgetDescriptorProvider)initWithConnection:(id)a3 extensionProvider:(id)a4 providerOptions:(id)a5
{
  id v9;
  id v10;
  id v11;
  CHSWidgetDescriptorProvider *v12;
  CHSWidgetDescriptorProvider *v13;
  uint64_t v14;
  NSMutableSet *lock_observers;
  _QWORD v17[4];
  CHSWidgetDescriptorProvider *v18;
  id v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (initWithConnection_extensionProvider_providerOptions____once[0] != -1)
    dispatch_once(initWithConnection_extensionProvider_providerOptions____once, &__block_literal_global);
  v20.receiver = self;
  v20.super_class = (Class)CHSWidgetDescriptorProvider;
  v12 = -[CHSWidgetDescriptorProvider init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    lock_observers = v13->_lock_observers;
    v13->_lock_observers = (NSMutableSet *)v14;

    objc_storeStrong((id *)&v13->_lock_connection, a3);
    objc_storeStrong((id *)&v13->_extensionProvider, a4);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke_2;
    v17[3] = &unk_1E2A5A290;
    v18 = v13;
    v19 = v11;
    os_unfair_lock_assert_not_owner(&v13->_lock);
    os_unfair_lock_lock(&v13->_lock);
    __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke_2((uint64_t)v17);
    os_unfair_lock_unlock(&v13->_lock);

  }
  return v13;
}

void __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.chrono.descriptorProvider", v2);
  v1 = (void *)__calloutQueue;
  __calloutQueue = (uint64_t)v0;

}

void __84__CHSWidgetDescriptorProvider_initWithConnection_extensionProvider_providerOptions___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cachedExtensionsWithOptions:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = (void *)v2;
  v9 = (id)v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "_descriptorsFromExtensions:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  v8 = v9;
  if (!v9)
  {

    v8 = 0;
  }

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  objc_super v4;
  _QWORD v5[5];

  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__CHSWidgetDescriptorProvider_dealloc__block_invoke;
  v5[3] = &unk_1E2A5A2D8;
  v5[4] = self;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __38__CHSWidgetDescriptorProvider_dealloc__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)CHSWidgetDescriptorProvider;
  -[CHSWidgetDescriptorProvider dealloc](&v4, sel_dealloc);
}

uint64_t __38__CHSWidgetDescriptorProvider_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "unregisterObserver:");
}

- (NSDictionary)descriptorsByExtensionIdentifier
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = (id)MEMORY[0x1E0C9AA70];
  p_lock = &self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__CHSWidgetDescriptorProvider_descriptorsByExtensionIdentifier__block_invoke;
  v5[3] = &unk_1E2A5A300;
  v5[4] = self;
  v5[5] = &v6;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  __63__CHSWidgetDescriptorProvider_descriptorsByExtensionIdentifier__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_lock);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __63__CHSWidgetDescriptorProvider_descriptorsByExtensionIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  if (!v3)
    goto LABEL_4;
  if (!objc_msgSend(v3, "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
LABEL_4:
    objc_msgSend(*(id *)(v2 + 8), "extensions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_descriptorsFromExtensions:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v5;

  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSSet)descriptors
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[CHSWidgetDescriptorProvider descriptorsByExtensionIdentifier](self, "descriptorsByExtensionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_flatten");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (id)descriptorForPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[CHSWidgetDescriptorProvider descriptorsByExtensionIdentifier](self, "descriptorsByExtensionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__CHSWidgetDescriptorProvider_descriptorForPersonality___block_invoke;
  v11[3] = &unk_1E2A5A328;
  v8 = v4;
  v12 = v8;
  objc_msgSend(v7, "bs_firstObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __56__CHSWidgetDescriptorProvider_descriptorForPersonality___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchesPersonality:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
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
  v7[2] = __43__CHSWidgetDescriptorProvider_addObserver___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __43__CHSWidgetDescriptorProvider_addObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __43__CHSWidgetDescriptorProvider_addObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 20))
  {
    *(_BYTE *)(v3 + 20) = 1;
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerObserver:");
  }
  return result;
}

- (void)removeObserver:(id)a3
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
  v7[2] = __46__CHSWidgetDescriptorProvider_removeObserver___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __46__CHSWidgetDescriptorProvider_removeObserver___block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __46__CHSWidgetDescriptorProvider_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)fetchDescriptorsForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  p_lock = &self->_lock;
  v11[2] = __81__CHSWidgetDescriptorProvider_fetchDescriptorsForContainerIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2A5A350;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __81__CHSWidgetDescriptorProvider_fetchDescriptorsForContainerIdentifier_completion___block_invoke((uint64_t)v11);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __81__CHSWidgetDescriptorProvider_fetchDescriptorsForContainerIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_reloadContentAsynchronouslyForContainerIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (NSString)description
{
  return (NSString *)-[CHSWidgetDescriptorProvider descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[CHSWidgetDescriptorProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[CHSWidgetDescriptorProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[CHSWidgetDescriptorProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E2A5A290;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);
  v7 = v11;
  v8 = v6;

  return v8;
}

void __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E2A5A290;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  os_unfair_lock_assert_not_owner(v3);
  os_unfair_lock_lock(v3);
  __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2((uint64_t)v6);
  os_unfair_lock_unlock(v3);

}

void __69__CHSWidgetDescriptorProvider_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "descriptors");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendArraySection:withName:skipIfEmpty:", v2, CFSTR("descriptors"), 0);

}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *p_lock;
  id v8;
  _QWORD v9[4];
  id v10;
  CHSWidgetDescriptorProvider *v11;

  v4 = a3;
  objc_msgSend(v4, "extensions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSWidgetDescriptorProvider _descriptorsFromExtensions:](self, "_descriptorsFromExtensions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  p_lock = &self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__CHSWidgetDescriptorProvider_extensionsDidChangeForExtensionProvider___block_invoke;
  v9[3] = &unk_1E2A5A290;
  v10 = v6;
  v11 = self;
  v8 = v6;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  __71__CHSWidgetDescriptorProvider_extensionsDidChangeForExtensionProvider___block_invoke((uint64_t)v9);
  os_unfair_lock_unlock(p_lock);

}

uint64_t __71__CHSWidgetDescriptorProvider_extensionsDidChangeForExtensionProvider___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  if ((result & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 32), *(id *)(a1 + 32));
    return objc_msgSend(*(id *)(a1 + 40), "_lock_notifyObserversDescriptorsDidChange");
  }
  return result;
}

- (id)_descriptorsFromExtensions:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CHSWidgetDescriptorProvider__descriptorsFromExtensions___block_invoke;
  v6[3] = &unk_1E2A5A378;
  v6[4] = &v7;
  objc_msgSend(v3, "bs_each:", v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__CHSWidgetDescriptorProvider__descriptorsFromExtensions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "orderedWidgetDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v5, v4);

}

- (BOOL)_isEDUMode
{
  uint64_t (**eduModeProvider)(void);

  eduModeProvider = (uint64_t (**)(void))self->_eduModeProvider;
  if (eduModeProvider)
    LOBYTE(eduModeProvider) = eduModeProvider[2]();
  return (char)eduModeProvider;
}

- (void)_lock_reloadContentAsynchronouslyForContainerIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CHSChronoServicesConnection *lock_connection;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  lock_connection = self->_lock_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke;
  v11[3] = &unk_1E2A5A3A0;
  v11[4] = self;
  v9 = v6;
  v12 = v9;
  objc_copyWeak(&v14, &location);
  v13 = v7;
  v10 = v7;
  -[CHSChronoServicesConnection fetchDescriptorsForContainerBundleIdentifier:completion:](lock_connection, "fetchDescriptorsForContainerBundleIdentifier:completion:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "<CHSWidgetDescriptorProvider:%p> Cache descriptors for container identifier: %@ returned error: %@", buf, 0x20u);
    }

  }
  if (!v5)
  {
    v10 = 0;
LABEL_12:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
    goto LABEL_13;
  }
  objc_msgSend(v5, "descriptorsByExtensionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 56));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke_14;
    v13[3] = &unk_1E2A5A290;
    v13[4] = WeakRetained;
    v14 = v10;
    os_unfair_lock_assert_not_owner(v12 + 4);
    os_unfair_lock_lock(v12 + 4);
    __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke_14((uint64_t)v13);
    os_unfair_lock_unlock(v12 + 4);

  }
  if (!v10 || !objc_msgSend(v10, "count"))
    goto LABEL_12;
  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v10);
LABEL_13:

}

uint64_t __98__CHSWidgetDescriptorProvider__lock_reloadContentAsynchronouslyForContainerIdentifier_completion___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_addNewDescriptorsFromDescriptors:", *(_QWORD *)(a1 + 40));
}

- (void)_lock_addNewDescriptorsFromDescriptors:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  CHSWidgetDescriptorProvider *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSDictionary mutableCopy](self->_lock_descriptorsByExtensionIdentifier, "mutableCopy");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __70__CHSWidgetDescriptorProvider__lock_addNewDescriptorsFromDescriptors___block_invoke;
  v15 = &unk_1E2A5A3C8;
  v6 = v5;
  v16 = v6;
  v17 = &v18;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v12);
  if (*((_BYTE *)v19 + 24))
  {
    objc_storeStrong((id *)&self->_lock_descriptorsByExtensionIdentifier, v5);
    -[CHSWidgetDescriptorProvider _lock_notifyObserversDescriptorsDidChange](self, "_lock_notifyObserversDescriptorsDidChange", v12, v13, v14, v15);
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      v26 = 2048;
      v27 = v8;
      v9 = "<CHSWidgetDescriptorProvider:%p> Added descriptors: %@ for extension count: %lu";
      v10 = v7;
      v11 = 32;
LABEL_6:
      _os_log_impl(&dword_18FB18000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v23 = self;
      v24 = 2112;
      v25 = v4;
      v9 = "<CHSWidgetDescriptorProvider:%p> No descriptor update needed. Already discovered descriptors: %@";
      v10 = v7;
      v11 = 22;
      goto LABEL_6;
    }
  }

  _Block_object_dispose(&v18, 8);
}

void __70__CHSWidgetDescriptorProvider__lock_addNewDescriptorsFromDescriptors___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "isEqualToArray:", v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v8);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)_lock_notifyObserversDescriptorsDidChange
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
  v3 = (void *)-[NSMutableSet copy](self->_lock_observers, "copy");
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
          v9[2] = __72__CHSWidgetDescriptorProvider__lock_notifyObserversDescriptorsDidChange__block_invoke;
          v9[3] = &unk_1E2A5A290;
          v9[4] = v8;
          v9[5] = self;
          dispatch_async((dispatch_queue_t)__calloutQueue, v9);
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

uint64_t __72__CHSWidgetDescriptorProvider__lock_notifyObserversDescriptorsDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "descriptorsDidChangeForDescriptorProvider:", *(_QWORD *)(a1 + 40));
}

- (CHSWidgetExtensionProvider)extensionProvider
{
  return self->_extensionProvider;
}

- (void)setExtensionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProvider, a3);
}

- (id)eduModeProvider
{
  return self->_eduModeProvider;
}

- (void)setEduModeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eduModeProvider, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
  objc_storeStrong((id *)&self->_lock_descriptorsByExtensionIdentifier, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
  objc_storeStrong((id *)&self->_extensionProvider, 0);
}

@end
