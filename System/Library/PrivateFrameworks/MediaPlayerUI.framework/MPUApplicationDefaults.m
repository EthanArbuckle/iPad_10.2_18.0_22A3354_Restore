@implementation MPUApplicationDefaults

- (MPUApplicationDefaults)initWithApplicationIdentifier:(id)a3
{
  id v5;
  MPUApplicationDefaults *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  __CFString *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPUApplicationDefaults;
  v6 = -[MPUApplicationDefaults init](&v12, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.MediaPlayerUI.MPUApplicationDefaults.accessQueue", MEMORY[0x24BDAC9C0]);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_applicationIdentifier, a3);
    -[MPUApplicationDefaults _defaultsDidChangeNotificationName](v6, "_defaultsDidChangeNotificationName");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)_MPUApplicationDefaultsDidChangeNotification, v9, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v6;
}

- (void)dealloc
{
  __CFString *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  -[MPUApplicationDefaults _defaultsDidChangeNotificationName](self, "_defaultsDidChangeNotificationName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v3, 0);

  v5.receiver = self;
  v5.super_class = (Class)MPUApplicationDefaults;
  -[MPUApplicationDefaults dealloc](&v5, sel_dealloc);
}

- (void)registerDefaults:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MPUApplicationDefaults_registerDefaults___block_invoke;
  block[3] = &unk_24DD2F9F0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(accessQueue, block);

}

void __43__MPUApplicationDefaults_registerDefaults___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *accessQueue;
  const __CFString *v9;
  __CFString *v10;
  _QWORD block[5];
  __CFString *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFBooleanGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __37__MPUApplicationDefaults_BOOLForKey___block_invoke;
    block[3] = &unk_24DD2FA18;
    v14 = &v15;
    block[4] = self;
    v9 = (const __CFString *)v4;
    v13 = (__CFString *)v9;
    dispatch_sync(accessQueue, block);
    v10 = -[MPUApplicationDefaults _defaultsDomain](self, "_defaultsDomain");
    CFPreferencesSetAppValue(v9, (CFPropertyListRef)v16[5], v10);
    v7 = objc_msgSend((id)v16[5], "BOOLValue");

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

void __37__MPUApplicationDefaults_BOOLForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _QWORD *v4;

  v4 = (_QWORD *)MEMORY[0x24BDBD270];
  if (!a3)
    v4 = (_QWORD *)MEMORY[0x24BDBD268];
  -[MPUApplicationDefaults _setObject:forKey:](self, "_setObject:forKey:", *v4, a4);
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFStringGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFArrayGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFDictionaryGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)integerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  NSObject *accessQueue;
  const __CFString *v9;
  __CFString *v10;
  _QWORD block[5];
  __CFString *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFNumberGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__MPUApplicationDefaults_integerForKey___block_invoke;
    block[3] = &unk_24DD2FA18;
    v14 = &v15;
    block[4] = self;
    v9 = (const __CFString *)v4;
    v13 = (__CFString *)v9;
    dispatch_sync(accessQueue, block);
    v10 = -[MPUApplicationDefaults _defaultsDomain](self, "_defaultsDomain");
    CFPreferencesSetAppValue(v9, (CFPropertyListRef)v16[5], v10);
    v7 = objc_msgSend((id)v16[5], "integerValue");

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

void __40__MPUApplicationDefaults_integerForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFNumberGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD16E0];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MPUApplicationDefaults _setObject:forKey:](self, "_setObject:forKey:", v8, v7);

}

- (id)dateForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[MPUApplicationDefaults _objectForKey:expectedTypeID:](self, "_objectForKey:expectedTypeID:", v4, CFDateGetTypeID());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)removeValueForKey:(id)a3
{
  -[MPUApplicationDefaults _setObject:forKey:](self, "_setObject:forKey:", 0, a3);
}

- (void)performBatchUpdates:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  NSObject *accessQueue;
  NSObject *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  _QWORD block[5];

  v4 = (void (**)(_QWORD))a3;
  v5 = MEMORY[0x24BDAC760];
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__MPUApplicationDefaults_performBatchUpdates___block_invoke;
  block[3] = &unk_24DD2FA40;
  block[4] = self;
  dispatch_barrier_sync(accessQueue, block);
  v4[2](v4);
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v7 = self->_accessQueue;
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__MPUApplicationDefaults_performBatchUpdates___block_invoke_2;
  v8[3] = &unk_24DD2FA68;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_barrier_sync(v7, v8);
  if (*((_BYTE *)v10 + 24))
    -[MPUApplicationDefaults _applyUpdates](self, "_applyUpdates");
  _Block_object_dispose(&v9, 8);

}

uint64_t __46__MPUApplicationDefaults_performBatchUpdates___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

uint64_t __46__MPUApplicationDefaults_performBatchUpdates___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = --*(_QWORD *)(*(_QWORD *)(result + 32) + 32) == 0;
  return result;
}

- (void)_applyUpdates
{
  __CFString *v3;
  NSObject *v4;
  _QWORD v5[6];

  v3 = -[MPUApplicationDefaults _defaultsDomain](self, "_defaultsDomain");
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__MPUApplicationDefaults__applyUpdates__block_invoke;
  v5[3] = &unk_24DD2FA90;
  v5[4] = self;
  v5[5] = v3;
  dispatch_async(v4, v5);

}

void __39__MPUApplicationDefaults__applyUpdates__block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  CFPreferencesAppSynchronize(*(CFStringRef *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_defaultsDidChangeNotificationName");
  name = (__CFString *)objc_claimAutoreleasedReturnValue();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);

}

- (__CFString)_defaultsDomain
{
  return (__CFString *)self->_applicationIdentifier;
}

- (id)_defaultsDidChangeNotificationName
{
  return -[NSString stringByAppendingString:](self->_applicationIdentifier, "stringByAppendingString:", CFSTR("-prefsChanged"));
}

- (void)_defaultsDidChange
{
  id v3;

  CFPreferencesAppSynchronize(-[MPUApplicationDefaults _defaultsDomain](self, "_defaultsDomain"));
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MPUApplicationDefaultsDidChangeNotification"), self);

}

- (id)_objectForKey:(id)a3 expectedTypeID:(unint64_t)a4
{
  __CFString *v6;
  void *v7;

  v6 = (__CFString *)a3;
  v7 = (void *)CFPreferencesCopyAppValue(v6, -[MPUApplicationDefaults _defaultsDomain](self, "_defaultsDomain"));

  if (v7 && CFGetTypeID(v7) != a4)
  {
    CFRelease(v7);
    v7 = 0;
  }
  return v7;
}

- (void)_setObject:(id)a3 forKey:(id)a4
{
  id v6;
  __CFString *v7;
  NSObject *accessQueue;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v6 = a3;
  v7 = (__CFString *)a4;
  CFPreferencesSetAppValue(v7, v6, -[MPUApplicationDefaults _defaultsDomain](self, "_defaultsDomain"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  accessQueue = self->_accessQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__MPUApplicationDefaults__setObject_forKey___block_invoke;
  v9[3] = &unk_24DD2FAB8;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_barrier_sync(accessQueue, v9);
  if (*((_BYTE *)v11 + 24))
    -[MPUApplicationDefaults _applyUpdates](self, "_applyUpdates");
  _Block_object_dispose(&v10, 8);

}

uint64_t __44__MPUApplicationDefaults__setObject_forKey___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 32) == 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
