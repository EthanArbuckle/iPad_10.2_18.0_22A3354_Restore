@implementation AXBaseSettings

void __50__AXBaseSettings__userDefaultsStoreForDomainName___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_domainNameToDefaultsStoreMap;
  _domainNameToDefaultsStoreMap = (uint64_t)v0;

  _defaultsStoreCacheLock = 0;
}

void __43__AXBaseSettings__registerForNotification___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXBaseSettings-Registration", 0);
  v1 = (void *)_registerForNotification__RegistrationQueue;
  _registerForNotification__RegistrationQueue = (uint64_t)v0;

}

- (AXBaseSettings)init
{
  objc_class *v3;
  AXBaseSettings *v4;
  NSMutableSet *v5;
  NSMutableSet *registeredPreferenceKeys;
  NSMutableDictionary *v7;
  NSMutableDictionary *preferenceKeysByDomainNameToSynchronize;
  NSMutableDictionary *v9;
  NSMutableDictionary *updateBlocks;
  AXBaseSettings *v11;
  NSObject *v12;
  objc_super v14;

  v3 = (objc_class *)objc_opt_class();
  if ((objc_class *)objc_opt_class() == v3)
  {
    AXLogSettings();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[AXBaseSettings init].cold.1(v3);

    v11 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXBaseSettings;
    v4 = -[AXBaseSettings init](&v14, sel_init);
    if (v4)
    {
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      registeredPreferenceKeys = v4->_registeredPreferenceKeys;
      v4->_registeredPreferenceKeys = v5;

      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      preferenceKeysByDomainNameToSynchronize = v4->_preferenceKeysByDomainNameToSynchronize;
      v4->_preferenceKeysByDomainNameToSynchronize = v7;

      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      updateBlocks = v4->_updateBlocks;
      v4->_updateBlocks = v9;

      v4->_domainNamesToSynchronizeLock._os_unfair_lock_opaque = 0;
    }
    self = v4;
    v11 = self;
  }

  return v11;
}

- (id)objectValueForPreferenceKey:(id)a3 ofClass:(Class)a4 defaultValue:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  -[AXBaseSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = v7;

    v8 = v9;
  }

  return v8;
}

- (BOOL)BOOLValueForPreferenceKey:(id)a3 defaultValue:(BOOL)a4
{
  void *v5;

  -[AXBaseSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (void)registerUpdateBlock:(id)a3 forRetrieveSelector:(SEL)a4 withListener:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_domainNamesToSynchronizeLock;
  void *v11;
  NSObject *v12;

  v8 = a3;
  v9 = a5;
  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[AXBaseSettings _registerUpdateBlock:forPreferenceKey:withListener:](self, "_registerUpdateBlock:forPreferenceKey:withListener:", v8, v11, v9);
  }
  else
  {
    AXLogSettings();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AXBaseSettings unregisterUpdateBlockForRetrieveSelector:withListenerID:].cold.1(a4);

  }
  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);

}

- (id)valueForPreferenceKey:(id)a3
{
  id v4;
  __CFString *v5;
  id v6;
  __CFString *v7;
  NSObject *v8;
  _QWORD v10[5];
  __CFString *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__AXBaseSettings_valueForPreferenceKey___block_invoke;
  v10[3] = &unk_1E28C2DB0;
  v12 = &v13;
  v10[4] = self;
  v5 = (__CFString *)v4;
  v11 = v5;
  if (-[AXBaseSettings _switchFromRootUserIfNecessary:](self, "_switchFromRootUserIfNecessary:", v10))
  {
    v6 = (id)v14[5];

  }
  else
  {

    -[AXBaseSettings domainNameForPreferenceKey:](self, "domainNameForPreferenceKey:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[AXBaseSettings _synchronizeIfNecessaryForPreferenceKey:domainName:](self, "_synchronizeIfNecessaryForPreferenceKey:domainName:", v5, v7);
    if (v7)
    {
      -[AXBaseSettings _registerForNotification:](self, "_registerForNotification:", v5);
      v6 = (id)CFPreferencesCopyAppValue(v5, v7);
    }
    else
    {
      AXLogSettings();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[AXBaseSettings valueForPreferenceKey:].cold.1();

      v6 = 0;
    }

  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (void)_registerForNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (_registerForNotification__onceToken != -1)
    dispatch_once(&_registerForNotification__onceToken, &__block_literal_global_24_0);
  v5 = _registerForNotification__RegistrationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__AXBaseSettings__registerForNotification___block_invoke_2;
  v7[3] = &unk_1E28C2E80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_synchronizeIfNecessaryForPreferenceKey:(id)a3 domainName:(id)a4
{
  __CFString *v6;
  os_unfair_lock_s *p_domainNamesToSynchronizeLock;
  id v8;
  void *v9;
  void *v10;
  const __CFString *applicationID;

  v6 = (__CFString *)a4;
  if (v6)
  {
    p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
    applicationID = v6;
    v8 = a3;
    os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
    -[AXBaseSettings preferenceKeysByDomainNameToSynchronize](self, "preferenceKeysByDomainNameToSynchronize");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", applicationID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v9) = objc_msgSend(v10, "containsObject:", v8);
    objc_msgSend(v10, "removeObject:", v8);

    os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
    if ((_DWORD)v9)
      CFPreferencesAppSynchronize(applicationID);

    v6 = (__CFString *)applicationID;
  }

}

void __43__AXBaseSettings__registerForNotification___block_invoke_2(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "registeredPreferenceKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "notificationNameForPreferenceKey:", *(_QWORD *)(a1 + 40));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)_axSettingsHandlePreferenceChanged, v3, 0, (CFNotificationSuspensionBehavior)1028);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "allDomainNamesForPreferenceKey:", *(_QWORD *)(a1 + 40), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 32), "_userDefaultsStoreForDomainName:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 3, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (NSMutableSet)registeredPreferenceKeys
{
  return self->_registeredPreferenceKeys;
}

- (NSMutableDictionary)preferenceKeysByDomainNameToSynchronize
{
  return self->_preferenceKeysByDomainNameToSynchronize;
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
        -[AXBaseSettings _switchFromRootUserIfNecessary:].cold.1(v8);

    }
  }
  v4 = 0;
LABEL_3:

  return v4;
}

- (id)notificationNameForPreferenceKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("_AXNotification_"), a3);
}

- (id)_userDefaultsStoreForDomainName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v3 = a3;
  if (_userDefaultsStoreForDomainName__onceToken != -1)
    dispatch_once(&_userDefaultsStoreForDomainName__onceToken, &__block_literal_global_21);
  os_unfair_lock_lock((os_unfair_lock_t)&_defaultsStoreCacheLock);
  objc_msgSend((id)_domainNameToDefaultsStoreMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v3);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v3);
    }
    v4 = (void *)v8;
    objc_msgSend((id)_domainNameToDefaultsStoreMap, "setObject:forKeyedSubscript:", v8, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_defaultsStoreCacheLock);

  return v4;
}

- (NSMutableDictionary)updateBlocks
{
  return self->_updateBlocks;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableSet *obj;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_registeredPreferenceKeys;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[AXBaseSettings allDomainNamesForPreferenceKey:](self, "allDomainNamesForPreferenceKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v17;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v17 != v11)
                objc_enumerationMutation(v8);
              -[AXBaseSettings _userDefaultsStoreForDomainName:](self, "_userDefaultsStoreForDomainName:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "removeObserver:forKeyPath:", self, v7);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v4);
  }

  v15.receiver = self;
  v15.super_class = (Class)AXBaseSettings;
  -[AXBaseSettings dealloc](&v15, sel_dealloc);
}

- (void)unregisterUpdateBlockForRetrieveSelector:(SEL)a3 withListenerID:(id)a4
{
  id v6;
  os_unfair_lock_s *p_domainNamesToSynchronizeLock;
  void *v8;
  NSObject *v9;

  v6 = a4;
  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AXBaseSettings _unregisterUpdateBlockForPreferenceKey:withListenerID:](self, "_unregisterUpdateBlockForPreferenceKey:withListenerID:", v8, v6);
  }
  else
  {
    AXLogSettings();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXBaseSettings unregisterUpdateBlockForRetrieveSelector:withListenerID:].cold.1(a3);

  }
  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);

}

- (void)unregisterUpdateBlockForPreferenceKey:(id)a3 withListenerID:(id)a4
{
  os_unfair_lock_s *p_domainNamesToSynchronizeLock;
  id v7;
  id v8;

  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_domainNamesToSynchronizeLock);
  -[AXBaseSettings _unregisterUpdateBlockForPreferenceKey:withListenerID:](self, "_unregisterUpdateBlockForPreferenceKey:withListenerID:", v8, v7);

  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
}

- (void)_unregisterUpdateBlockForPreferenceKey:(id)a3 withListenerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  -[AXBaseSettings updateBlocks](self, "updateBlocks");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__AXBaseSettings__unregisterUpdateBlockForPreferenceKey_withListenerID___block_invoke;
  v12[3] = &unk_1E28C2D68;
  v13 = v6;
  v9 = v6;
  objc_msgSend(v8, "indexesOfObjectsPassingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v8, "removeObjectsAtIndexes:", v10);

}

uint64_t __72__AXBaseSettings__unregisterUpdateBlockForPreferenceKey_withListenerID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)registerUpdateBlock:(id)a3 forPreferenceKey:(id)a4 withListener:(id)a5
{
  os_unfair_lock_s *p_domainNamesToSynchronizeLock;
  id v9;
  id v10;
  id v11;

  p_domainNamesToSynchronizeLock = &self->_domainNamesToSynchronizeLock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_domainNamesToSynchronizeLock);
  -[AXBaseSettings _registerUpdateBlock:forPreferenceKey:withListener:](self, "_registerUpdateBlock:forPreferenceKey:withListener:", v11, v10, v9);

  os_unfair_lock_unlock(p_domainNamesToSynchronizeLock);
}

- (void)_registerUpdateBlock:(id)a3 forPreferenceKey:(id)a4 withListener:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXSettingsObjectDestructionHelper *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    if (_registerUpdateBlock_forPreferenceKey_withListener__onceToken != -1)
      dispatch_once(&_registerUpdateBlock_forPreferenceKey_withListener__onceToken, &__block_literal_global_4);
    v10 = (id)_registerUpdateBlock_forPreferenceKey_withListener__FakeListener;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AXBaseSettings updateBlocks](self, "updateBlocks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v19 = (void *)objc_msgSend(v8, "copy");
    v14 = _Block_copy(v19);
    v21[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v9);
    }
    v20 = v12;
    objc_msgSend(v13, "addObject:", v15);
    objc_getAssociatedObject(v10, &AXSettingsDestructionHelpersKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setAssociatedObject(v10, &AXSettingsDestructionHelpersKey, v16, (void *)1);
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v17);
    v18 = (AXSettingsObjectDestructionHelper *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v18 = -[AXSettingsObjectDestructionHelper initWithListenerAddress:forSettings:]([AXSettingsObjectDestructionHelper alloc], "initWithListenerAddress:forSettings:", v10, self);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v17);
    }
    -[AXSettingsObjectDestructionHelper addPreferenceKey:](v18, "addPreferenceKey:", v9);
    -[AXBaseSettings _registerForNotification:](self, "_registerForNotification:", v9);

  }
  else
  {
    -[AXBaseSettings _unregisterUpdateBlockForPreferenceKey:withListenerID:](self, "_unregisterUpdateBlockForPreferenceKey:withListenerID:", v9, v11);
  }

}

void __69__AXBaseSettings__registerUpdateBlock_forPreferenceKey_withListener___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DE7910]);
  v1 = (void *)_registerUpdateBlock_forPreferenceKey_withListener__FakeListener;
  _registerUpdateBlock_forPreferenceKey_withListener__FakeListener = (uint64_t)v0;

}

- (BOOL)hasExistingValueForPreferenceWithSelector:(SEL)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  BOOL v8;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    AXLogSettings();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AXBaseSettings hasExistingValueForPreferenceWithSelector:].cold.1(a3);

  }
  -[AXBaseSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
}

- (void)clearExistingValueForPreferenceWithSelector:(SEL)a3
{
  void *v5;
  NSObject *v6;

  -[AXBaseSettings preferenceKeyForSelector:](self, "preferenceKeyForSelector:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    AXLogSettings();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[AXBaseSettings hasExistingValueForPreferenceWithSelector:].cold.1(a3);

  }
  -[AXBaseSettings setValue:forPreferenceKey:](self, "setValue:forPreferenceKey:", 0, v5);

}

- (id)allDomainNamesForPreferenceKey:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[AXBaseSettings domainNameForPreferenceKey:](self, "domainNameForPreferenceKey:", a3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

void __40__AXBaseSettings_valueForPreferenceKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "valueForPreferenceKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  const __CFString *v10;
  _QWORD v11[5];
  id v12;
  __CFString *v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__AXBaseSettings_setValue_forPreferenceKey___block_invoke;
  v11[3] = &unk_1E28C2DD8;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = (__CFString *)v7;
  v13 = v9;
  LOBYTE(v7) = -[AXBaseSettings _switchFromRootUserIfNecessary:](self, "_switchFromRootUserIfNecessary:", v11);

  if ((v7 & 1) == 0)
  {
    v10 = -[AXBaseSettings domainNameForPreferenceKey:](self, "domainNameForPreferenceKey:", v9);
    CFPreferencesSetAppValue(v9, v8, v10);
    CFPreferencesAppSynchronize(v10);
    -[AXBaseSettings willPostNotificationForPreferenceKey:value:](self, "willPostNotificationForPreferenceKey:value:", v9, v8);
    -[AXBaseSettings postNotificationForPreferenceKey:](self, "postNotificationForPreferenceKey:", v9);
  }

}

uint64_t __44__AXBaseSettings_setValue_forPreferenceKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forPreferenceKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)postNotificationForPreferenceKey:(id)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  -[AXBaseSettings notificationNameForPreferenceKey:](self, "notificationNameForPreferenceKey:", a3);
  name = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (name)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }

}

- (int64_t)integerValueForPreferenceKey:(id)a3 defaultValue:(int64_t)a4
{
  void *v5;

  -[AXBaseSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (double)doubleValueForPreferenceKey:(id)a3 defaultValue:(double)a4
{
  void *v5;
  double v6;

  -[AXBaseSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v6;
  }

  return a4;
}

- (float)floatValueForPreferenceKey:(id)a3 defaultValue:(float)a4
{
  void *v5;
  float v6;

  -[AXBaseSettings valueForPreferenceKey:](self, "valueForPreferenceKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "floatValue");
    a4 = v6;
  }

  return a4;
}

- (void)_handlePreferenceChangedWithNotificationName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_AXNotification_"), &stru_1E28C88D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXBaseSettings domainNameForPreferenceKey:](self, "domainNameForPreferenceKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    os_unfair_lock_lock(&self->_domainNamesToSynchronizeLock);
    -[AXBaseSettings preferenceKeysByDomainNameToSynchronize](self, "preferenceKeysByDomainNameToSynchronize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXBaseSettings preferenceKeysByDomainNameToSynchronize](self, "preferenceKeysByDomainNameToSynchronize");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v5);

    }
    objc_msgSend(v7, "addObject:", v4);
    -[AXBaseSettings updateBlocks](self, "updateBlocks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    os_unfair_lock_unlock(&self->_domainNamesToSynchronizeLock);
    -[AXBaseSettings willPerformUpdateBlocksForPreferenceKey:](self, "willPerformUpdateBlocksForPreferenceKey:", v4);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__AXBaseSettings__handlePreferenceChangedWithNotificationName___block_invoke;
    v13[3] = &unk_1E28C1C88;
    v14 = v11;
    v12 = v11;
    AXPerformBlockOnMainThread(v13);

  }
}

uint64_t __63__AXBaseSettings__handlePreferenceChangedWithNotificationName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateObjectsUsingBlock:", &__block_literal_global_20_0);
}

void __63__AXBaseSettings__handlePreferenceChangedWithNotificationName___block_invoke_2(uint64_t a1, void *a2)
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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v9 = a5;
  v10 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqual:", v14))
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:", v15))
      {
        v16 = objc_msgSend(v12, "isEqual:", v13);

        if ((v16 & 1) == 0)
          -[AXBaseSettings _handlePreferenceChangedWithNotificationName:](self, "_handlePreferenceChangedWithNotificationName:", v17);
        goto LABEL_6;
      }

    }
LABEL_6:

  }
}

- (void)setRegisteredPreferenceKeys:(id)a3
{
  objc_storeStrong((id *)&self->_registeredPreferenceKeys, a3);
}

- (void)setPreferenceKeysByDomainNameToSynchronize:(id)a3
{
  objc_storeStrong((id *)&self->_preferenceKeysByDomainNameToSynchronize, a3);
}

- (void)setUpdateBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_updateBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateBlocks, 0);
  objc_storeStrong((id *)&self->_preferenceKeysByDomainNameToSynchronize, 0);
  objc_storeStrong((id *)&self->_registeredPreferenceKeys, 0);
}

- (id)domainNameForPreferenceKey:(id)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_0();
  return 0;
}

- (id)preferenceKeyForSelector:(SEL)a3
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_0();
  return 0;
}

- (void)init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_18EBEC000, v2, v3, "Attempted to create an instance of abstract class %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)unregisterUpdateBlockForRetrieveSelector:(const char *)a1 withListenerID:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18EBEC000, v2, v3, "Cannot register update block for selector '%@'. No matching pref key was found.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)hasExistingValueForPreferenceWithSelector:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_18EBEC000, v2, v3, "Could not find preference key for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)valueForPreferenceKey:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_18EBEC000, v0, OS_LOG_TYPE_FAULT, "Can not get value without domain name for preference key: %@", v1, 0xCu);
}

- (void)_switchFromRootUserIfNecessary:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18EBEC000, log, OS_LOG_TYPE_FAULT, "Attempted to switch from root to mobile to deal with settings, but getpwnam for mobile returned root.", v1, 2u);
}

@end
