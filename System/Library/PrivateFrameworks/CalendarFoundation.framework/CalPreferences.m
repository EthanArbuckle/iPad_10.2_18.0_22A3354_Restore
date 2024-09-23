@implementation CalPreferences

- (CalPreferences)initWithDomain:(id)a3
{
  return -[CalPreferences initWithDomain:readOnly:](self, "initWithDomain:readOnly:", a3, 0);
}

- (BOOL)getBooleanPreference:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  BOOL v10;

  v6 = a3;
  v7 = v6;
  v10 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[CalPreferencesStore getBoolean:forDomain:key:](self->_store, "getBoolean:forDomain:key:", &v10, self->_domain, v7);
    a4 = v10;
  }
  else
  {
    +[CalPreferences log](CalPreferences, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalPreferences getBooleanPreference:defaultValue:].cold.1();

  }
  return a4;
}

- (id)getValueForPreference:(id)a3 expectedClass:(Class)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  Class v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!v6 || !objc_msgSend(v6, "length"))
  {
    +[CalPreferences log](CalPreferences, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CalPreferences getBooleanPreference:defaultValue:].cold.1();
    goto LABEL_11;
  }
  v14 = 0;
  -[CalPreferencesStore getValue:forDomain:key:](self->_store, "getValue:forDomain:key:", &v14, self->_domain, v7);
  v8 = v14;
  v9 = v8;
  if (a4 && v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    +[CalPreferences log](CalPreferences, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v16 = v7;
      v17 = 2114;
      v18 = a4;
      v19 = 2114;
      v20 = v12;
      v13 = v12;
      _os_log_error_impl(&dword_18FC12000, v10, OS_LOG_TYPE_ERROR, "Unexpected type for preference [%{public}@] encountered.  Expected type: [%{public}@].  Actual type: [%{public}@]", buf, 0x20u);

    }
LABEL_11:

    v9 = 0;
  }

  return v9;
}

- (void)registerReflectionForPreferenceWithNotificationName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    +[CalDistributedNotificationCenter addObserver:selector:name:](CalDistributedNotificationCenter, "addObserver:selector:name:", self, sel__preferenceChangedExternally_, v5);
    -[NSMutableSet addObject:](self->_registeredNotificationsToReflect, "addObject:", v5);
  }
  else
  {
    +[CalPreferences log](CalPreferences, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CalPreferences registerReflectionForPreferenceWithNotificationName:].cold.1();

  }
}

- (void)setValueForPreference:(id)a3 value:(id)a4 notificationName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_readOnly)
  {
    if (v8 && objc_msgSend(v8, "length"))
    {
      -[CalPreferencesStore setValue:forDomain:key:](self->_store, "setValue:forDomain:key:", v9, self->_domain, v8);
      -[CalPreferences _preferenceChangedInternally:](self, "_preferenceChangedInternally:", v10);
    }
    else
    {
      +[CalPreferences log](CalPreferences, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CalPreferences getBooleanPreference:defaultValue:].cold.1();

    }
  }

}

- (void)_preferenceChangedInternally:(id)a3
{
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *name;

  name = (__CFString *)a3;
  -[CalPreferences _synchronizePreferences](self, "_synchronizePreferences");
  if (name && -[__CFString length](name, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", name, 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
  }

}

- (void)_synchronizePreferences
{
  -[CalPreferencesStore synchronizeDomain:](self->_store, "synchronizeDomain:", self->_domain);
}

- (void)_preferenceChangedExternally:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CalPreferences _synchronizePreferences](self, "_synchronizePreferences");
  if (v5 && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:", v5, 0);

  }
}

- (void)setBooleanPreference:(id)a3 value:(BOOL)a4 notificationName:(id)a5
{
  _BOOL4 v6;
  id v8;
  _QWORD *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = a5;
  if (v10 && !self->_readOnly && objc_msgSend(v10, "length"))
  {
    v9 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if (!v6)
      v9 = (_QWORD *)MEMORY[0x1E0C9AE40];
    -[CalPreferencesStore setValue:forDomain:key:](self->_store, "setValue:forDomain:key:", *v9, self->_domain, v10);
    -[CalPreferences _preferenceChangedInternally:](self, "_preferenceChangedInternally:", v8);
  }

}

+ (id)log
{
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, &__block_literal_global_31);
  return (id)log_log;
}

void __21__CalPreferences_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.calendar", "Preferences");
  v1 = (void *)log_log;
  log_log = (uint64_t)v0;

}

- (CalPreferences)init
{
  return -[CalPreferences initWithDomain:](self, "initWithDomain:", 0);
}

- (CalPreferences)initWithDomain:(id)a3 readOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  CalPreferences *v8;

  v4 = a4;
  v6 = a3;
  +[CalCFPreferencesStore shared](CalCFPreferencesStore, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CalPreferences initWithDomain:store:readOnly:](self, "initWithDomain:store:readOnly:", v6, v7, v4);

  return v8;
}

- (CalPreferences)initWithDomain:(id)a3 store:(id)a4
{
  return -[CalPreferences initWithDomain:store:readOnly:](self, "initWithDomain:store:readOnly:", a3, a4, 0);
}

- (CalPreferences)initWithDomain:(id)a3 store:(id)a4 readOnly:(BOOL)a5
{
  id v8;
  id v9;
  CalPreferences *v10;
  CalPreferences *v11;
  void *v12;
  NSString *v13;
  NSString *domain;
  NSMutableSet *v15;
  NSMutableSet *registeredNotificationsToReflect;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CalPreferences;
  v10 = -[CalPreferences init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_store, a4);
    v11->_readOnly = a5;
    v12 = (void *)*MEMORY[0x1E0C9B248];
    if (v8)
      v12 = v8;
    v13 = v12;
    domain = v11->_domain;
    v11->_domain = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredNotificationsToReflect = v11->_registeredNotificationsToReflect;
    v11->_registeredNotificationsToReflect = v15;

  }
  return v11;
}

- (void)dealloc
{
  NSMutableSet *registeredNotificationsToReflect;
  objc_super v4;
  _QWORD v5[5];

  registeredNotificationsToReflect = self->_registeredNotificationsToReflect;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __25__CalPreferences_dealloc__block_invoke;
  v5[3] = &unk_1E2A845C0;
  v5[4] = self;
  -[NSMutableSet enumerateObjectsUsingBlock:](registeredNotificationsToReflect, "enumerateObjectsUsingBlock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)CalPreferences;
  -[CalPreferences dealloc](&v4, sel_dealloc);
}

uint64_t __25__CalPreferences_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterReflectionForPreferenceWithNotificationName:", a2);
}

- (void)unregisterReflectionForPreferenceWithNotificationName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    +[CalDistributedNotificationCenter removeObserver:name:](CalDistributedNotificationCenter, "removeObserver:name:", self, v5);
    -[NSMutableSet removeObject:](self->_registeredNotificationsToReflect, "removeObject:", v5);
  }
  else
  {
    +[CalPreferences log](CalPreferences, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CalPreferences registerReflectionForPreferenceWithNotificationName:].cold.1();

  }
}

- (int64_t)getIntegerPreference:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int64_t v10;

  v6 = a3;
  v7 = v6;
  v10 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[CalPreferencesStore getInteger:forDomain:key:](self->_store, "getInteger:forDomain:key:", &v10, self->_domain, v7);
    a4 = v10;
  }
  else
  {
    +[CalPreferences log](CalPreferences, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalPreferences getBooleanPreference:defaultValue:].cold.1();

  }
  return a4;
}

- (void)setIntegerPreference:(id)a3 value:(int64_t)a4 notificationName:(id)a5
{
  id v8;
  id v9;
  CFNumberRef v10;
  CFNumberRef v11;
  int64_t valuePtr;

  v8 = a3;
  valuePtr = a4;
  v9 = a5;
  if (v8 && !self->_readOnly && objc_msgSend(v8, "length"))
  {
    v10 = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
    if (v10)
    {
      v11 = v10;
      -[CalPreferencesStore setValue:forDomain:key:](self->_store, "setValue:forDomain:key:", v10, self->_domain, v8);
      CFRelease(v11);
    }
    -[CalPreferences _preferenceChangedInternally:](self, "_preferenceChangedInternally:", v9);
  }

}

- (void)removePreference:(id)a3 notificationName:(id)a4
{
  CalPreferencesStore *store;
  NSString *domain;
  id v8;

  if (!self->_readOnly)
  {
    store = self->_store;
    domain = self->_domain;
    v8 = a4;
    -[CalPreferencesStore setValue:forDomain:key:](store, "setValue:forDomain:key:", 0, domain, a3);
    -[CalPreferences _preferenceChangedInternally:](self, "_preferenceChangedInternally:", v8);

  }
}

- (id)debugColorStringForString:(id)a3 isDark:(BOOL)a4
{
  const __CFString *v4;

  v4 = CFSTR("DebugColorLight-%@");
  if (a4)
    v4 = CFSTR("DebugColorDark-%@");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v4, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_debugColorPreferences
{
  if (_debugColorPreferences_onceToken != -1)
    dispatch_once(&_debugColorPreferences_onceToken, &__block_literal_global_67);
  return (id)_debugColorPreferences__preferences;
}

void __40__CalPreferences__debugColorPreferences__block_invoke()
{
  CalPreferences *v0;
  void *v1;

  v0 = -[CalPreferences initWithDomain:]([CalPreferences alloc], "initWithDomain:", CFSTR("com.apple.mobilecal"));
  v1 = (void *)_debugColorPreferences__preferences;
  _debugColorPreferences__preferences = (uint64_t)v0;

}

+ (id)getDebugColorStringForPreference:(id)a3 dark:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_debugColorPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugColorStringForString:isDark:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getValueForPreference:expectedClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)setDebugColorStringForPreference:(id)a3 value:(id)a4 dark:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_debugColorPreferences");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugColorStringForString:isDark:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setValueForPreference:value:notificationName:", v10, v8, 0);
}

+ (id)getDebugColorNumberForPreference:(id)a3 dark:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_debugColorPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugColorStringForString:isDark:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "getValueForPreference:expectedClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)setDebugColorNumberForPreference:(id)a3 value:(id)a4 dark:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(a1, "_debugColorPreferences");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "debugColorStringForString:isDark:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setValueForPreference:value:notificationName:", v10, v8, 0);
}

+ (void)removeDebugColorPreference:(id)a3 dark:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "_debugColorPreferences");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugColorStringForString:isDark:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removePreference:notificationName:", v7, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredNotificationsToReflect, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)registerReflectionForPreferenceWithNotificationName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, v0, v1, "'name' should be non-nil and non-empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)getBooleanPreference:defaultValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_18FC12000, v0, v1, "'preferenceName' should be non-nil and non-empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
