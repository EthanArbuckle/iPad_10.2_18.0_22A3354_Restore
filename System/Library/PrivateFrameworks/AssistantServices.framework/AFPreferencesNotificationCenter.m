@implementation AFPreferencesNotificationCenter

- (id)addObserverForDarwinName:(__CFString *)a3 usingBlock:(id)a4
{
  __CFString *v6;
  NSLock *instanceLock;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *darwinRegistrationsByName;
  void *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  instanceLock = self->instanceLock;
  v8 = a4;
  -[NSLock lock](instanceLock, "lock");
  -[NSMutableDictionary objectForKey:](self->darwinRegistrationsByName, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  darwinRegistrationsByName = self->darwinRegistrationsByName;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "intValue") + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](darwinRegistrationsByName, "setObject:forKey:", v12, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](darwinRegistrationsByName, "setObject:forKey:", v13, v6);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_AFPreferencesNotificationCenterTrampoline, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v18.receiver = self;
  v18.super_class = (Class)AFPreferencesNotificationCenter;
  -[AFPreferencesNotificationCenter addObserverForName:object:queue:usingBlock:](&v18, sel_addObserverForName_object_queue_usingBlock_, v6, 0, 0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->darwinRegistrationsByObserver, "setObject:forKey:", v6, v16);
  -[NSLock unlock](self->instanceLock, "unlock");

  return v15;
}

- (AFPreferencesNotificationCenter)init
{
  AFPreferencesNotificationCenter *v2;
  NSLock *v3;
  NSLock *instanceLock;
  uint64_t v5;
  NSMutableDictionary *darwinRegistrationsByObserver;
  uint64_t v7;
  NSMutableDictionary *darwinRegistrationsByName;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AFPreferencesNotificationCenter;
  v2 = -[AFPreferencesNotificationCenter init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    instanceLock = v2->instanceLock;
    v2->instanceLock = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
    darwinRegistrationsByObserver = v2->darwinRegistrationsByObserver;
    v2->darwinRegistrationsByObserver = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 8);
    darwinRegistrationsByName = v2->darwinRegistrationsByName;
    v2->darwinRegistrationsByName = (NSMutableDictionary *)v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  return _AFPreferencesNotificationCenterGetSharedInstance(1);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AFPreferencesNotificationCenter;
  -[AFPreferencesNotificationCenter dealloc](&v4, sel_dealloc);
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  int v9;
  NSMutableDictionary *darwinRegistrationsByName;
  void *v11;
  NSObject *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSLock lock](self->instanceLock, "lock");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->darwinRegistrationsByObserver, "objectForKey:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKey:](self->darwinRegistrationsByName, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "intValue");
      darwinRegistrationsByName = self->darwinRegistrationsByName;
      if (v9 < 2)
      {
        -[NSMutableDictionary removeObjectForKey:](darwinRegistrationsByName, "removeObjectForKey:", v6);
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v6, 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v8, "intValue") - 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](darwinRegistrationsByName, "setObject:forKey:", v11, v6);

      }
    }
    else
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[AFPreferencesNotificationCenter removeObserver:]";
        v17 = 2112;
        v18 = v6;
        _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s Notification registration inconsistency detected for %@", buf, 0x16u);
      }
    }
    -[NSMutableDictionary removeObjectForKey:](self->darwinRegistrationsByObserver, "removeObjectForKey:", v5);

  }
  -[NSLock unlock](self->instanceLock, "unlock");
  v14.receiver = self;
  v14.super_class = (Class)AFPreferencesNotificationCenter;
  -[AFPreferencesNotificationCenter removeObserver:](&v14, sel_removeObserver_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->darwinRegistrationsByName, 0);
  objc_storeStrong((id *)&self->darwinRegistrationsByObserver, 0);
  objc_storeStrong((id *)&self->instanceLock, 0);
}

@end
