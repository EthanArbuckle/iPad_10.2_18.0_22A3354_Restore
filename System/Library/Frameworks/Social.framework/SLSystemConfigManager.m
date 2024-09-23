@implementation SLSystemConfigManager

+ (id)sharedInstanceForServiceType:(id)a3
{
  id v3;
  SLSystemConfigManager *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  if (!__sharedSLSystemConfigManagers)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v6 = (void *)__sharedSLSystemConfigManagers;
    __sharedSLSystemConfigManagers = v5;

LABEL_5:
    v4 = -[SLSystemConfigManager initWithServiceType:]([SLSystemConfigManager alloc], "initWithServiceType:", v3);
    objc_msgSend((id)__sharedSLSystemConfigManagers, "setObject:forKey:", v4, v3);
    goto LABEL_6;
  }
  objc_msgSend((id)__sharedSLSystemConfigManagers, "objectForKey:", v3);
  v4 = (SLSystemConfigManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_5;
LABEL_6:
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
  -[SLSystemConfigManager _keepAlive](v4, "_keepAlive");

  return v4;
}

+ (id)sharedInstanceForCallbackWhileLocked:(void *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)__sharedSLSystemConfigManagers;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (*(void **)(*((_QWORD *)&v11 + 1) + 8 * v8) == a3)
        {
          v9 = a3;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

- (SLSystemConfigManager)initWithServiceType:(id)a3
{
  id v5;
  SLSystemConfigManager *v6;
  SLSystemConfigManager *v7;
  const __CFString *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SLSystemConfigManager;
  v6 = -[SLSystemConfigManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceType, a3);
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.social.twitter")) & 1) != 0)
    {
      v8 = CFSTR("com.apple.twitter.plist");
LABEL_8:
      -[SLSystemConfigManager _initializeSystemConfigPrefs:](v7, "_initializeSystemConfigPrefs:", v8);
      goto LABEL_9;
    }
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.social.sinaweibo")) & 1) != 0)
    {
      v8 = CFSTR("com.apple.sinaweibo.plist");
      goto LABEL_8;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.social.facebook")))
    {
      v8 = CFSTR("com.apple.facebook.plist");
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (void)dealloc
{
  const __SCPreferences *prefs;
  __CFRunLoop *Main;
  objc_super v5;

  prefs = (const __SCPreferences *)self->_prefs;
  if (prefs)
  {
    Main = CFRunLoopGetMain();
    SCPreferencesUnscheduleFromRunLoop(prefs, Main, (CFStringRef)*MEMORY[0x1E0C9B280]);
    CFRelease(self->_prefs);
  }
  v5.receiver = self;
  v5.super_class = (Class)SLSystemConfigManager;
  -[SLSystemConfigManager dealloc](&v5, sel_dealloc);
}

- (void)setCachedUsername:(id)a3
{
  if (a3)
    -[SLSystemConfigManager _setValue:forKey:](self, "_setValue:forKey:", a3, CFSTR("SLCachedUsername"));
}

- (id)cachedUsername
{
  return -[SLSystemConfigManager _getValueForKey:](self, "_getValueForKey:", CFSTR("SLCachedUsername"));
}

- (void)_initializeSystemConfigPrefs:(id)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  SCPreferencesRef v8;
  __CFRunLoop *Main;
  _QWORD v10[2];
  __int128 v11;
  uint64_t v12;

  v4 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v8 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, v4, 0);
  self->_prefs = v8;
  Main = CFRunLoopGetMain();
  SCPreferencesScheduleWithRunLoop(v8, Main, (CFStringRef)*MEMORY[0x1E0C9B280]);
  v10[0] = 0;
  v11 = 0u;
  v12 = 0;
  v10[1] = self;
  -[SLSystemConfigManager _setCallback:withContext:](self, "_setCallback:withContext:", _SLSystemConfigManagerPreferencesCallback, v10);

}

- (void)_keepAlive
{
  pthread_mutex_lock(&__SystemConfigManagerMutex);
  +[SLSystemConfigManager cancelPreviousPerformRequestsWithTarget:selector:object:](SLSystemConfigManager, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__tearDown, 0);
  -[SLSystemConfigManager performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__tearDown, 0, 3.0);
  pthread_mutex_unlock(&__SystemConfigManagerMutex);
}

- (void)_tearDown
{
  void *v3;
  id v4;

  pthread_mutex_lock(&__SystemConfigManagerMutex);
  objc_msgSend((id)__sharedSLSystemConfigManagers, "objectForKey:", self->_serviceType);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend((id)__sharedSLSystemConfigManagers, "removeObjectForKey:", self->_serviceType);
  if (!objc_msgSend((id)__sharedSLSystemConfigManagers, "count"))
  {
    v3 = (void *)__sharedSLSystemConfigManagers;
    __sharedSLSystemConfigManagers = 0;

  }
  pthread_mutex_unlock(&__SystemConfigManagerMutex);

}

- (void)_notifyTarget:(unsigned int)a3
{
  int applySkipCount;
  BOOL v5;
  int v6;

  if ((a3 & 2) != 0)
  {
    applySkipCount = self->_applySkipCount;
    if (!applySkipCount)
    {
      -[SLSystemConfigManager _refresh](self, "_refresh");
      -[SLSystemConfigManager _synchronize](self, "_synchronize");
      applySkipCount = self->_applySkipCount;
    }
    v5 = __OFSUB__(applySkipCount, 1);
    v6 = applySkipCount - 1;
    if (v6 < 0 == v5)
      self->_applySkipCount = v6;
  }
}

- (void)_synchronize
{
  SCPreferencesSynchronize((SCPreferencesRef)self->_prefs);
}

- (void)_getValueForKey:(id)a3
{
  return (void *)SCPreferencesGetValue((SCPreferencesRef)self->_prefs, (CFStringRef)a3);
}

- (void)_setValue:(void *)a3 forKey:(id)a4
{
  __CFString *key;

  key = (__CFString *)a4;
  if (SCPreferencesLock((SCPreferencesRef)self->_prefs, 1u))
    goto LABEL_14;
  if (SCError() == 1006)
    -[SLSystemConfigManager _setValue:forKey:].cold.1();
  if (SCError() == 3005)
  {
    SCPreferencesSynchronize((SCPreferencesRef)self->_prefs);
    if (SCPreferencesLock((SCPreferencesRef)self->_prefs, 1u))
    {
LABEL_14:
      if (SCPreferencesSetValue((SCPreferencesRef)self->_prefs, key, a3)
        && SCPreferencesCommitChanges((SCPreferencesRef)self->_prefs)
        && SCPreferencesApplyChanges((SCPreferencesRef)self->_prefs))
      {
        ++self->_applySkipCount;
        -[SLSystemConfigManager _synchronize](self, "_synchronize");
      }
      SCPreferencesUnlock((SCPreferencesRef)self->_prefs);
    }
  }

}

- (void)_setCallback:(void *)a3 withContext:(id *)a4
{
  SCPreferencesSetCallback((SCPreferencesRef)self->_prefs, (SCPreferencesCallBack)a3, (SCPreferencesContext *)a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
}

- (void)_setValue:forKey:.cold.1()
{
  __assert_rtn("-[SLSystemConfigManager _setValue:forKey:]", "SLSystemConfigManager.m", 221, "success || SCError() != kSCStatusLocked");
}

@end
