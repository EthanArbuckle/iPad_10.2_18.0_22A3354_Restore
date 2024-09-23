@implementation HCSettings

void __39__HCSettings__handlePreferenceChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "synchronizePreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "updateBlocks");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  __CFString *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  __CFString *v18;
  _QWORD v19[5];
  id v20;
  __CFString *v21;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __40__HCSettings_setValue_forPreferenceKey___block_invoke;
  v19[3] = &unk_1E66CFDA0;
  v19[4] = self;
  v9 = v6;
  v20 = v9;
  v10 = (__CFString *)v7;
  v21 = v10;
  LOBYTE(v7) = -[HCSettings _switchFromRootUserIfNecessary:](self, "_switchFromRootUserIfNecessary:", v19);

  if ((v7 & 1) == 0)
  {
    if (-[HCSettings shouldStoreLocally](self, "shouldStoreLocally"))
    {
      v11 = -[HCSettings preferenceDomainForPreferenceKey:](self, "preferenceDomainForPreferenceKey:", v10);
      CFPreferencesSetAppValue(v10, v9, v11);
      CFPreferencesAppSynchronize(v11);
      -[HCSettings notificationForPreferenceKey:](self, "notificationForPreferenceKey:", v10);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v12, 0, 0, 1u);
      }

    }
    -[HCSettings keysToSync](self, "keysToSync");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count") && objc_msgSend(v14, "containsObject:", v10))
    {
      -[HCSettings nanoDomainAccessorQueue](self, "nanoDomainAccessorQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __40__HCSettings_setValue_forPreferenceKey___block_invoke_2;
      v16[3] = &unk_1E66CFDA0;
      v16[4] = self;
      v17 = v9;
      v18 = v10;
      dispatch_async(v15, v16);

    }
  }

}

void __39__HCSettings__registerForNotification___block_invoke()
{
  objc_class *v0;
  dispatch_queue_t v1;
  void *v2;
  id v3;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
  v2 = (void *)_registerForNotification__RegistrationQueue;
  _registerForNotification__RegistrationQueue = (uint64_t)v1;

}

- (HCSettings)init
{
  HCSettings *v2;
  NSMutableSet *v3;
  NSMutableSet *registeredNotifications;
  NSMutableSet *v5;
  NSMutableSet *synchronizePreferences;
  NSMutableDictionary *v7;
  NSMutableDictionary *updateBlocks;
  void *v9;
  uint64_t v10;
  dispatch_queue_t v11;
  NSObject *v12;
  HCSettings *v13;
  void *v14;
  void *v15;
  _QWORD block[4];
  HCSettings *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HCSettings;
  v2 = -[HCSettings init](&v19, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredNotifications = v2->_registeredNotifications;
    v2->_registeredNotifications = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    synchronizePreferences = v2->_synchronizePreferences;
    v2->_synchronizePreferences = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    updateBlocks = v2->_updateBlocks;
    v2->_updateBlocks = v7;

    v2->_syncLock._os_unfair_lock_opaque = 0;
    -[HCSettings keysToSync](v2, "keysToSync");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = dispatch_queue_create("accessibility.hearing.domain.accessor", 0);
      -[HCSettings setNanoDomainAccessorQueue:](v2, "setNanoDomainAccessorQueue:", v11);

      -[HCSettings nanoDomainAccessorQueue](v2, "nanoDomainAccessorQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __18__HCSettings_init__block_invoke;
      block[3] = &unk_1E66CFCE0;
      v13 = v2;
      v18 = v13;
      dispatch_async(v12, block);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517D0], 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel_pairedWatchDidChange_, *MEMORY[0x1E0D517A8], 0);

    }
  }
  return v2;
}

- (BOOL)BOOLValueForPreferenceKey:(id)a3 withDefaultValue:(BOOL)a4
{
  void *v5;

  -[HCSettings _valueForPreferenceKey:](self, "_valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

void __39__HCSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  __CFString *v2;
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "registeredNotifications");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "notificationForPreferenceKey:", *(_QWORD *)(a1 + 40));
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Registering for %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logMessage:", v4);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
}

void __38__HCSettings__synchronizeIfNecessary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "synchronizePreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    CFPreferencesAppSynchronize((CFStringRef)objc_msgSend(*(id *)(a1 + 32), "preferenceDomainForPreferenceKey:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  }

}

- (NSMutableSet)synchronizePreferences
{
  return self->_synchronizePreferences;
}

- (NSMutableSet)registeredNotifications
{
  return self->_registeredNotifications;
}

- (id)objectValueForKey:(id)a3 withClass:(Class)a4 andDefaultValue:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  -[HCSettings _valueForPreferenceKey:](self, "_valueForPreferenceKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = v7;

    v8 = v9;
  }

  return v8;
}

- (id)_valueForPreferenceKey:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  id v7;
  __CFString *v8;
  CFPropertyListRef v9;
  void *v10;
  NSObject *v11;
  _QWORD v13[5];
  __CFString *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  __CFString *v21;
  _QWORD v22[5];
  __CFString *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __37__HCSettings__valueForPreferenceKey___block_invoke;
  v22[3] = &unk_1E66CFDC8;
  v24 = &v25;
  v22[4] = self;
  v6 = (__CFString *)v4;
  v23 = v6;
  if (-[HCSettings _switchFromRootUserIfNecessary:](self, "_switchFromRootUserIfNecessary:", v22))
  {
    v7 = (id)v26[5];
    v8 = v23;
  }
  else
  {

    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    if (-[HCSettings shouldStoreLocally](self, "shouldStoreLocally"))
    {
      -[HCSettings _synchronizeIfNecessary:](self, "_synchronizeIfNecessary:", v6);
      -[HCSettings _registerForNotification:](self, "_registerForNotification:", v6);
      v9 = CFPreferencesCopyAppValue(v6, (CFStringRef)-[HCSettings preferenceDomainForPreferenceKey:](self, "preferenceDomainForPreferenceKey:", v6));
      v10 = (void *)v17[5];
      v17[5] = (uint64_t)v9;

    }
    else
    {
      -[HCSettings nanoDomainAccessorQueue](self, "nanoDomainAccessorQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __37__HCSettings__valueForPreferenceKey___block_invoke_2;
      v13[3] = &unk_1E66CFDF0;
      v13[4] = self;
      v15 = &v16;
      v14 = v6;
      dispatch_sync(v11, v13);

    }
    v7 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
    v8 = v21;
  }

  _Block_object_dispose(&v25, 8);
  return v7;
}

- (BOOL)_switchFromRootUserIfNecessary:(id)a3
{
  void (**v3)(_QWORD);
  BOOL v4;
  passwd *v6;
  uid_t pw_uid;
  NSObject *v8;

  v3 = (void (**)(_QWORD))a3;
  if (!geteuid())
  {
    v6 = getpwnam("mobile");
    if (v6)
    {
      pw_uid = v6->pw_uid;
      if (pw_uid)
      {
        seteuid(pw_uid);
        v3[2](v3);
        seteuid(0);
        v4 = 1;
        goto LABEL_3;
      }
      AXLogSettings();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[HCSettings _switchFromRootUserIfNecessary:].cold.1(v8);

    }
  }
  v4 = 0;
LABEL_3:

  return v4;
}

- (void)_synchronizeIfNecessary:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AX_PERFORM_WITH_LOCK();

}

- (void)_registerForNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  _QWORD v10[5];

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__HCSettings__registerForNotification___block_invoke;
  v10[3] = &unk_1E66CFCE0;
  v10[4] = self;
  if (_registerForNotification__onceToken != -1)
    dispatch_once(&_registerForNotification__onceToken, v10);
  v6 = _registerForNotification__RegistrationQueue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __39__HCSettings__registerForNotification___block_invoke_2;
  block[3] = &unk_1E66CFCB8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

- (id)notificationForPreferenceKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_AXNotification_"), a3);
}

- (void)_handlePreferenceChanged:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_AXNotification_"), &stru_1E66D0290);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  AX_PERFORM_WITH_LOCK();
  objc_msgSend((id)v6[5], "enumerateObjectsUsingBlock:", &__block_literal_global_1);

  _Block_object_dispose(&v5, 8);
}

void __39__HCSettings__handlePreferenceChanged___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(a2, "objectAtIndexedSubscript:", 1);
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

void __18__HCSettings_init__block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR(".GlobalPreferences"));
  objc_msgSend(*(id *)(a1 + 32), "setGlobalDomainAccessor:", v2);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HCSettings;
  -[HCSettings dealloc](&v4, sel_dealloc);
}

- (void)pairedWatchDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HCSettings nanoDomainAccessorQueue](self, "nanoDomainAccessorQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HCSettings_pairedWatchDidChange___block_invoke;
  block[3] = &unk_1E66CFCE0;
  block[4] = self;
  dispatch_async(v4, block);

}

void __35__HCSettings_pairedWatchDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (id)nanoDomainAccessor
{
  NPSDomainAccessor *domainAccessor;
  id v4;
  void *v5;
  NPSDomainAccessor *v6;
  NPSDomainAccessor *v7;

  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = objc_alloc(MEMORY[0x1E0D51610]);
    -[HCSettings nanoPreferenceDomain](self, "nanoPreferenceDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NPSDomainAccessor *)objc_msgSend(v4, "initWithDomain:", v5);
    v7 = self->_domainAccessor;
    self->_domainAccessor = v6;

    domainAccessor = self->_domainAccessor;
  }
  return domainAccessor;
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  return NSStringFromSelector(a3);
}

- (void)resetValueForSelector:(SEL)a3
{
  id v4;

  -[HCSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HCSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, v4);

}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v9 = v7;
  v10 = v8;
  v11 = v6;
  AX_PERFORM_WITH_LOCK();

}

void __67__HCSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HCSettingsListenerHelper *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "updateBlocks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preferenceKeyForSelector:", *(_QWORD *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 56);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v5, "copy");
    v15[0] = *(_QWORD *)(a1 + 40);
    v7 = (void *)MEMORY[0x1B5E2E7C0]();
    v15[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKey:", v4, v3);
    }
    objc_msgSend(v4, "addObject:", v8);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Registering %@ - %@"), v3, *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logMessage:", v10);

    objc_getAssociatedObject(*(id *)(a1 + 48), &HCSettingsDestructionHelperKey);
    v11 = (HCSettingsListenerHelper *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = -[HCSettingsListenerHelper initWithListenerAddress:andDelegate:]([HCSettingsListenerHelper alloc], "initWithListenerAddress:andDelegate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
      objc_setAssociatedObject(*(id *)(a1 + 48), &HCSettingsDestructionHelperKey, v11, (void *)1);
    }
    -[HCSettingsListenerHelper addSelectorKey:](v11, "addSelectorKey:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "_registerForNotification:", v3);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__HCSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke_2;
    v13[3] = &unk_1E66CFD50;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
      objc_msgSend(v4, "removeObjectsAtIndexes:", v12);

  }
}

uint64_t __67__HCSettings_registerUpdateBlock_forRetrieveSelector_withListener___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __40__HCSettings_setValue_forPreferenceKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forPreferenceKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __40__HCSettings_setValue_forPreferenceKey___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "nanoDomainAccessor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "synchronize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error synchronizing accessor %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logMessage:", v5);

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "nanoPreferenceDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronizeNanoDomain:keys:", v7, v10);

}

- (int64_t)integerValueForKey:(id)a3 withDefaultValue:(int64_t)a4
{
  void *v5;

  -[HCSettings _valueForPreferenceKey:](self, "_valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (double)cgfloatValueForPreferenceKey:(id)a3 withDefaultValue:(double)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  return v11;
}

void __37__HCSettings__valueForPreferenceKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_valueForPreferenceKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __37__HCSettings__valueForPreferenceKey___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "nanoDomainAccessor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error synchronizing accessor %@"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logMessage:", v4);

  }
  objc_msgSend(v8, "objectForKey:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)nanoPreferenceDomain
{
  return -[HCSettings preferenceDomainForPreferenceKey:](self, "preferenceDomainForPreferenceKey:", 0);
}

- (BOOL)shouldStoreLocally
{
  return 0;
}

- (id)keysToSync
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)setRegisteredNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_registeredNotifications, a3);
}

- (void)setSynchronizePreferences:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizePreferences, a3);
}

- (void)setUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateBlocks, a3);
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_domainAccessor, a3);
}

- (NPSDomainAccessor)globalDomainAccessor
{
  return self->_globalDomainAccessor;
}

- (void)setGlobalDomainAccessor:(id)a3
{
  objc_storeStrong((id *)&self->_globalDomainAccessor, a3);
}

- (OS_dispatch_queue)nanoDomainAccessorQueue
{
  return self->_nanoDomainAccessorQueue;
}

- (void)setNanoDomainAccessorQueue:(id)a3
{
  objc_storeStrong((id *)&self->_nanoDomainAccessorQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoDomainAccessorQueue, 0);
  objc_storeStrong((id *)&self->_globalDomainAccessor, 0);
  objc_storeStrong((id *)&self->_domainAccessor, 0);
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_synchronizePreferences, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  OUTLINED_FUNCTION_0();
  NSRequestConcreteImplementation();
  return &stru_1E66D0290;
}

- (void)logMessage:(id)a3
{
  OUTLINED_FUNCTION_0();
  NSRequestConcreteImplementation();
}

- (void)_switchFromRootUserIfNecessary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B3CA7000, log, OS_LOG_TYPE_FAULT, "Attempted to switch from root to mobile to deal with settings, but getpwnam for mobile returned root.", v1, 2u);
}

@end
