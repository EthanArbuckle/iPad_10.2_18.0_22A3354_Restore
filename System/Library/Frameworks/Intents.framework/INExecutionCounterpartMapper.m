@implementation INExecutionCounterpartMapper

- (INExecutionCounterpartMapper)init
{
  INExecutionCounterpartMapper *v2;
  INExecutionCounterpartMapper *v3;
  void *v4;
  INExecutionCounterpartMapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INExecutionCounterpartMapper;
  v2 = -[INExecutionCounterpartMapper init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_installedApplicationsDidChange_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);
    -[INExecutionCounterpartMapper reset](v3, "reset");
    v5 = v3;

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  v4.receiver = self;
  v4.super_class = (Class)INExecutionCounterpartMapper;
  -[INExecutionCounterpartMapper dealloc](&v4, sel_dealloc);
}

- (void)installedApplicationsDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isPlaceholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "BOOLValue");
  if ((v8 & 1) == 0)
    -[INExecutionCounterpartMapper reset](self, "reset");
}

- (void)reset
{
  void (**v3)(_QWORD);
  NSMutableDictionary *v4;
  NSMutableDictionary *mapping;
  _QWORD v6[5];

  os_unfair_lock_lock(&self->_lock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__INExecutionCounterpartMapper_reset__block_invoke;
  v6[3] = &unk_1E2294DE0;
  v6[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x18D7812C4](v6);
  v4 = (NSMutableDictionary *)objc_opt_new();
  mapping = self->_mapping;
  self->_mapping = v4;

  self->_filled = 0;
  v3[2](v3);

}

- (id)localIdentifiersForCounterpartIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  BOOL v24;
  __int128 v26;
  id obj;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void (**v31)(void);
  void *context;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
    v47 = 2112;
    v48 = v4;
    _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] Starting counterpart mapping for bundle id: %@", buf, 0x16u);
  }
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __73__INExecutionCounterpartMapper_localIdentifiersForCounterpartIdentifier___block_invoke;
    v42[3] = &unk_1E2294DE0;
    v42[4] = self;
    v31 = (void (**)(void))MEMORY[0x18D7812C4](v42);
    -[NSMutableDictionary objectForKey:](self->_mapping, "objectForKey:", v4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
        v47 = 2112;
        v48 = v4;
        v49 = 2112;
        v50 = v28;
        _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Found counterpart in local mapping: %@", buf, 0x20u);
      }
      v7 = v28;
      v8 = v28;
    }
    else
    {
      if (self->_filled)
      {
        v9 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
          v47 = 2112;
          v48 = v4;
          _os_log_impl(&dword_18BEBC000, v9, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Mapping is filled and a counterpart was not found, returning nil", buf, 0x16u);
        }
        v8 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 1);
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v10)
        {
          v30 = *(_QWORD *)v39;
          *(_QWORD *)&v11 = 136315394;
          v26 = v11;
          while (2)
          {
            v12 = 0;
            v29 = v10;
            do
            {
              if (*(_QWORD *)v39 != v30)
                objc_enumerationMutation(obj);
              v33 = v12;
              v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
              context = (void *)MEMORY[0x18D7810F0]();
              INCounterpartIdentifiersForApplicationRecord(v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = 0u;
              v37 = 0u;
              v34 = 0u;
              v35 = 0u;
              v15 = v14;
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v35;
                while (2)
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v35 != v17)
                      objc_enumerationMutation(v15);
                    v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                    v20 = INSiriLogContextIntents;
                    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 136315650;
                      v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
                      v47 = 2112;
                      v48 = v4;
                      v49 = 2112;
                      v50 = v19;
                      _os_log_impl(&dword_18BEBC000, v20, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Found counterpart: %@", buf, 0x20u);
                    }
                    -[NSMutableDictionary objectForKey:](self->_mapping, "objectForKey:", v19, v26);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v21)
                    {
                      v21 = (void *)objc_opt_new();
                      -[NSMutableDictionary setObject:forKey:](self->_mapping, "setObject:forKey:", v21, v19);
                    }
                    objc_msgSend(v13, "bundleIdentifier");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v21, "addObject:", v22);

                    if (objc_msgSend(v19, "isEqualToString:", v4))
                    {
                      v23 = INSiriLogContextIntents;
                      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = v26;
                        v46 = "-[INExecutionCounterpartMapper localIdentifiersForCounterpartIdentifier:]";
                        v47 = 2112;
                        v48 = v4;
                        _os_log_impl(&dword_18BEBC000, v23, OS_LOG_TYPE_INFO, "%s [Counterpart Mapping] (%@) Counterpart and original match, stopping", buf, 0x16u);
                      }

                      LOBYTE(v16) = 1;
                      goto LABEL_34;
                    }

                  }
                  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
                  if (v16)
                    continue;
                  break;
                }
              }
LABEL_34:

              objc_autoreleasePoolPop(context);
              if ((v16 & 1) != 0)
              {
                v24 = 0;
                goto LABEL_39;
              }
              v12 = v33 + 1;
            }
            while (v33 + 1 != v29);
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
            if (v10)
              continue;
            break;
          }
        }
        v24 = 1;
LABEL_39:

        self->_filled = v24;
        -[NSMutableDictionary objectForKey:](self->_mapping, "objectForKey:", v4);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      v7 = 0;
    }

    v31[2]();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)counterpartIdentifiersForLocalIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, 0);

  if (v5)
  {
    INCounterpartIdentifiersForApplicationRecord(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSMutableDictionary)_mapping
{
  return self->_mapping;
}

- (BOOL)_filled
{
  return self->_filled;
}

- (os_unfair_lock_s)_lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
}

void __73__INExecutionCounterpartMapper_localIdentifiersForCounterpartIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

void __37__INExecutionCounterpartMapper_reset__block_invoke(uint64_t a1)
{
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

@end
