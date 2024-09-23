@implementation HMFPreferences

- (HMFPreferences)init
{
  HMFPreferences *v2;
  HMFClassRegistry *v3;
  HMFClassRegistry *classRegistry;
  HMFPreferences *v5;
  HMFActivity *v6;
  void *v7;
  void *v8;
  void *v9;
  HMFPreferences *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  HMFPreferences *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSMutableDictionary *preferences;
  void *v40;
  HMFActivity *v41;
  HMFPreferences *v42;
  HMFPreferences *v43;
  NSMutableDictionary *v44;
  uint64_t v45;
  objc_super v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v46.receiver = self;
  v46.super_class = (Class)HMFPreferences;
  v2 = -[HMFPreferences init](&v46, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HMFClassRegistry);
    classRegistry = v2->_classRegistry;
    v2->_classRegistry = v3;

    v5 = v2;
    v6 = -[HMFActivity initWithName:parent:options:]([HMFActivity alloc], "initWithName:parent:options:", CFSTR("Load Default Preferences"), 0, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v44 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1A1AC355C]();
    -[HMFActivity markWithReason:](v6, "markWithReason:", CFSTR("Determining preference location"));
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForResource:withExtension:", CFSTR("Preferences"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v5;
    v43 = v5;
    if (v9)
      goto LABEL_4;
    objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/HomeKitDaemon.framework"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("Preferences"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v43;
    if (v9)
    {
LABEL_4:
      v40 = v7;
      v41 = v6;
      v42 = v2;
      -[HMFActivity markWithReason:](v6, "markWithReason:", CFSTR("Parsing preferences"));
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (!v15)
        goto LABEL_30;
      v16 = v15;
      v17 = *(_QWORD *)v48;
      while (1)
      {
        v18 = 0;
        v45 = v16;
        do
        {
          if (*(_QWORD *)v48 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v20 = v14;
            objc_msgSend(v14, "objectForKeyedSubscript:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v10;
            v23 = v21;
            v24 = v19;
            +[HMFPreferences defaultValueForPreferenceKey:](HMFPreferences, "defaultValueForPreferenceKey:", v24);
            v25 = (id)objc_claimAutoreleasedReturnValue();
            if (!v25)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Value"));
                v25 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Customer"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                if (v26)
                {
                  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Customer"));
                  v27 = objc_claimAutoreleasedReturnValue();

                  v25 = (id)v27;
                }
                +[HMFSystemInfo systemInfo](HMFSystemInfo, "systemInfo");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "productVariant");

                if (v29 == 3)
                {
                  v30 = v23;
                  v31 = CFSTR("Internal");
                  goto LABEL_22;
                }
                if (v29 == 1)
                {
                  v30 = v23;
                  v31 = CFSTR("Developer");
LABEL_22:
                  objc_msgSend(v30, "objectForKeyedSubscript:", v31);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v35)
                  {
                    objc_msgSend(v23, "objectForKeyedSubscript:", v31);
                    v36 = objc_claimAutoreleasedReturnValue();

                    v25 = (id)v36;
                  }
                }
                v10 = v43;
              }
              else
              {
                v25 = v23;
              }
            }
            v37 = (void *)objc_msgSend(objc_alloc(-[HMFPreferences preferenceClassForPreferenceKey:](v22, "preferenceClassForPreferenceKey:", v24)), "initWithKey:options:defaultValue:", v24, 0, v25);

            if (v37)
              -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v37, v24);

            v14 = v20;
            v16 = v45;
            goto LABEL_28;
          }
          v32 = (void *)MEMORY[0x1A1AC355C]();
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier(0);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v52 = v34;
            v53 = 2112;
            v54 = v19;
            _os_log_impl(&dword_19B546000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Invalid preference key representation: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v32);
LABEL_28:
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (!v16)
        {
LABEL_30:

          v6 = v41;
          v2 = v42;
          v7 = v40;
          break;
        }
      }
    }
    objc_autoreleasePoolPop(v7);
    -[HMFActivity invalidate](v6, "invalidate");

    preferences = v10->_preferences;
    v10->_preferences = v44;

  }
  return v2;
}

- (Class)preferenceClassForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  -[HMFPreferences classRegistry](self, "classRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "classForKey:", v4);

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "preferenceClassForPreferenceKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return (Class)v8;
}

- (HMFClassRegistry)classRegistry
{
  return (HMFClassRegistry *)objc_getProperty(self, a2, 24, 1);
}

+ (Class)preferenceClassForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "classRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v6;
}

+ (id)defaultValueForPreferenceKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "defaultValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultValues
{
  if (qword_1ED013308 != -1)
    dispatch_once(&qword_1ED013308, &__block_literal_global_5);
  return (id)qword_1ED013310;
}

+ (id)classRegistry
{
  if (qword_1ED0132F8 != -1)
    dispatch_once(&qword_1ED0132F8, &__block_literal_global_2_0);
  return (id)qword_1ED013300;
}

- (id)preferenceForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  HMFPreferences *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_preferences, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc(-[HMFPreferences preferenceClassForPreferenceKey:](self, "preferenceClassForPreferenceKey:", v4));
    +[HMFPreferences defaultValueForPreferenceKey:](HMFPreferences, "defaultValueForPreferenceKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "initWithKey:options:defaultValue:", v4, 0, v7);

    v8 = (void *)MEMORY[0x1A1AC355C](-[NSMutableDictionary setObject:forKeyedSubscript:](self->_preferences, "setObject:forKeyedSubscript:", v5, v4));
    v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_19B546000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding new preference: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  os_unfair_recursive_lock_unlock();

  return v5;
}

+ (id)sharedPreferences
{
  if (_MergedGlobals_1_1 != -1)
    dispatch_once(&_MergedGlobals_1_1, &__block_literal_global_29);
  return (id)qword_1ED0132F0;
}

void __31__HMFPreferences_classRegistry__block_invoke()
{
  HMFClassRegistry *v0;
  void *v1;

  v0 = -[HMFClassRegistry initWithDefaultClass:]([HMFClassRegistry alloc], "initWithDefaultClass:", objc_opt_class());
  v1 = (void *)qword_1ED013300;
  qword_1ED013300 = (uint64_t)v0;

}

void __31__HMFPreferences_defaultValues__block_invoke()
{
  HMFMutableThreadSafeDictionary *v0;
  void *v1;

  v0 = objc_alloc_init(HMFMutableThreadSafeDictionary);
  v1 = (void *)qword_1ED013310;
  qword_1ED013310 = (uint64_t)v0;

}

void __35__HMFPreferences_sharedPreferences__block_invoke()
{
  HMFPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(HMFPreferences);
  v1 = (void *)qword_1ED0132F0;
  qword_1ED0132F0 = (uint64_t)v0;

}

+ (void)setPreferenceClass:(Class)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "classRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClass:forKey:", a3, v6);

}

+ (void)setDefaultValue:(id)a3 forPreferenceKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "defaultValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, v6);
  else
    objc_msgSend(v7, "removeObjectForKey:", v6);

}

- (NSString)propertyDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMFPreferences preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR(", Preferences = \n%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setPreferenceClass:(Class)a3 forPreferenceKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HMFPreferences classRegistry](self, "classRegistry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClass:forKey:", a3, v6);

}

- (NSArray)preferences
{
  void *v3;

  os_unfair_recursive_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_preferences, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_recursive_lock_unlock();
  return (NSArray *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classRegistry, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
}

@end
