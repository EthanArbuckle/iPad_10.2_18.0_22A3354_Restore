@implementation HDUnitPreferencesManager

- (void)removeUnitPreferenceObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

void __77__HDUnitPreferencesManager__unitPreferencesDictionaryFromKeyValueDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  _BYTE buf[12];
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = (objc_class *)MEMORY[0x1E0CB3900];
      v7 = v18;
      v8 = (void *)objc_msgSend([v6 alloc], "initWithString:", v7);

      *(_QWORD *)buf = -1;
      if (objc_msgSend(v8, "scanInteger:", buf) && (_HKValidDataTypeCode() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", *(_QWORD *)buf);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = *(_QWORD *)(a1 + 32);
          v11 = v5;
          v12 = v9;
          if (v10)
          {
            objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v12, "isCompatibleWithUnit:", v13) & 1) != 0)
            {
LABEL_14:

              if (v13)
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v12);

              goto LABEL_19;
            }
            _HKInitializeLogging();
            HKLogInfrastructure();
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);

            if (v15)
            {
              HKLogInfrastructure();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
              {
                v17 = objc_opt_class();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = v17;
                v20 = 2112;
                v21 = v11;
                v22 = 2112;
                v23 = v12;
                _os_log_debug_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: Unit string (%@) not compatible with quantity type (%@)", buf, 0x20u);
              }

            }
          }
          v13 = 0;
          goto LABEL_14;
        }
      }
      else
      {

      }
    }
    v12 = 0;
LABEL_19:

  }
}

- (HDUnitPreferencesManager)initWithProfile:(id)a3
{
  id v4;
  HDUnitPreferencesManager *v5;
  HDUnitPreferencesManager *v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  HKObserverSet *observers;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDUnitPreferencesManager;
  v5 = -[HDUnitPreferencesManager init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "initWithName:loggingCategory:", v9, v10);
    observers = v6->_observers;
    v6->_observers = (HKObserverSet *)v11;

    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HDUnitPreferencesManager;
  -[HDUnitPreferencesManager dealloc](&v4, sel_dealloc);
}

- (id)unitPreferencesDictionaryForTypes:(id)a3 version:(int64_t)a4 authorizationOracle:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  os_unfair_lock_s *p_lock;
  NSArray *versionedUnitPreferences;
  NSArray *v27;
  NSArray *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  id v40;
  NSArray *v41;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a6, 3, CFSTR("Object (%@) is not of class %@"), v15, objc_opt_class());
          v23 = 0;
          v22 = v10;
          goto LABEL_39;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      if (v12)
        continue;
      break;
    }
  }

  v16 = v10;
  v17 = v9;
  v18 = v17;
  if (!self)
  {
    v22 = 0;
    goto LABEL_21;
  }
  v52 = 0;
  v19 = objc_msgSend(v17, "isAuthorizationStatusDeterminedForTypes:error:", v16, &v52);
  v20 = v52;
  v21 = v20;
  if (v19)
  {
    objc_msgSend(v18, "readAuthorizationStatusesForTypes:error:", v16, a6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 5, CFSTR("Authorization status is not determined for all types provided."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
LABEL_16:
    v24 = v21;
    if (!v24)
      goto LABEL_21;
    goto LABEL_17;
  }
  v24 = v20;
  v22 = 0;
LABEL_17:
  if (a6)
    *a6 = objc_retainAutorelease(v24);
  else
    _HKLogDroppedError();

LABEL_21:
  if (v22)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v40 = v10;
    if (self)
    {
      versionedUnitPreferences = self->_versionedUnitPreferences;
      if (versionedUnitPreferences)
      {
        v41 = versionedUnitPreferences;
LABEL_27:
        v39 = v9;
        objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v30 = v16;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v45 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              objc_msgSend(v22, "objectForKey:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v36, "canRead"))
                -[HDUnitPreferencesManager _lock_unitForType:versionedUnitPreferences:version:locale:](self, v35, v41, a4, v29);
              else
                _HKGenerateDefaultUnitForQuantityTypeWithVersion();
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, v35);

            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
          }
          while (v32);
        }

        p_lock = &self->_lock;
        v9 = v39;
        goto LABEL_38;
      }
      -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((id *)&self->super.isa, a6);
      v27 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v28 = self->_versionedUnitPreferences;
      self->_versionedUnitPreferences = v27;

      v41 = self->_versionedUnitPreferences;
      if (v41)
        goto LABEL_27;
    }
    v41 = 0;
    v23 = 0;
LABEL_38:
    os_unfair_lock_unlock(p_lock);

    v10 = v40;
    goto LABEL_39;
  }
  v23 = 0;
LABEL_39:

  return v23;
}

- (id)_lock_unitForType:(void *)a3 versionedUnitPreferences:(uint64_t)a4 version:(void *)a5 locale:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    if (a4 < 0)
    {
LABEL_7:
      _HKGenerateDefaultUnitForQuantityTypeWithVersion();
      a1 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = a4;
      while (1)
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v9);
        a1 = (void *)objc_claimAutoreleasedReturnValue();

        if (a1)
          break;
        if (v12-- <= 0)
          goto LABEL_7;
      }
    }
  }

  return a1;
}

- (BOOL)setPreferredUnit:(id)a3 forType:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v9, "isCompatibleWithUnit:", v8);
  if ((v10 & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDUnitPreferencesManager _lock_setUnit:forType:]((uint64_t)self, (uint64_t)v8, v9);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 3, CFSTR("Unit (%@) is not compatible with the provided type (%@)"), v8, v9);
  }

  return v10;
}

- (void)_lock_setUnit:(void *)a3 forType:
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id WeakRetained;
  BOOL v25;
  id v26;
  id v27;
  BOOL v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD *v34;
  id v35;
  id v36;
  id v37;
  _BYTE buf[24];
  void *v39;
  _QWORD *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v4 = a3;
    _HKUnitPreferencesVersionToUnitDictionaryForQuantityType();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v34 = (_QWORD *)a1;
    -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((id *)a1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    if (objc_msgSend(v8, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v8, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "mutableCopy");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v11, "setObject:forKey:", v13, v6);
        else
          objc_msgSend(v11, "removeObjectForKey:", v6);
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v11, v9);

        ++v9;
      }
      while (v9 < objc_msgSend(v8, "count"));
    }
    v14 = (_QWORD *)a1;
    v15 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v8;

    v35 = v5;
    v33 = v6;
    -[HDUnitPreferencesManager _stringFromQuantityType:](v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = 0;
    v19 = (id *)(a1 + 8);
    while (1)
    {
      -[HDUnitPreferencesManager _domainForVersion:](v14, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v22, "unitString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained(v19);
        v37 = v17;
        v25 = +[HDKeyValueEntity setString:forKey:domain:category:profile:error:](HDProtectedKeyValueEntity, "setString:forKey:domain:category:profile:error:", v23, v16, v20, 104, WeakRetained, &v37);
        v26 = v37;

        v14 = v34;
        v17 = v26;
        if (!v25)
          goto LABEL_13;
      }
      else
      {
        v27 = objc_loadWeakRetained(v19);
        v36 = v17;
        v28 = +[HDKeyValueEntity setString:forKey:domain:category:profile:error:](HDProtectedKeyValueEntity, "setString:forKey:domain:category:profile:error:", 0, v16, v20, 104, v27, &v36);
        v29 = v36;

        v17 = v29;
        if (!v28)
        {
LABEL_13:
          _HKInitializeLogging();
          HKLogInfrastructure();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v17;
            _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "%{public}@: Error persisting unit preferences: %{public}@", buf, 0x16u);
          }

        }
      }

      if (++v18 == 3)
      {

        v32 = (void *)v14[3];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __68__HDUnitPreferencesManager__lock_notifyObserversWithUnitPreferences__block_invoke;
        v39 = &unk_1E6CF22A8;
        v40 = v14;
        objc_msgSend(v32, "notifyObservers:", buf);

        return;
      }
    }
  }
}

- (BOOL)removePreferredUnitForType:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  id v13;
  _BOOL4 v14;
  NSArray *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  NSArray *versionedUnitPreferences;
  uint64_t v21;
  uint64_t v22;
  BOOL (*v23)(uint64_t, uint64_t, uint64_t *);
  void *v24;
  HDUnitPreferencesManager *v25;
  id v26;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  v8 = v7;
  v9 = v8;
  if (self)
  {
    -[HDUnitPreferencesManager _stringFromQuantityType:](v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __67__HDUnitPreferencesManager__lock_removePreferredUnitForType_error___block_invoke;
    v24 = &unk_1E6CE7950;
    v25 = self;
    v13 = v10;
    v26 = v13;
    v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDProtectedKeyValueEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, a4, &v21);

    if (v14)
    {
      v15 = (NSArray *)-[NSArray mutableCopy](self->_versionedUnitPreferences, "mutableCopy", v21, v22, v23, v24, v25);
      if (-[NSArray count](v15, "count"))
      {
        v16 = 0;
        do
        {
          -[NSArray objectAtIndexedSubscript:](v15, "objectAtIndexedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(v17, "mutableCopy");

          objc_msgSend(v18, "removeObjectForKey:", v9);
          -[NSArray setObject:atIndexedSubscript:](v15, "setObject:atIndexedSubscript:", v18, v16);

          ++v16;
        }
        while (v16 < -[NSArray count](v15, "count"));
      }
      versionedUnitPreferences = self->_versionedUnitPreferences;
      self->_versionedUnitPreferences = v15;

    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (void)setPreferredUnitToDefaultIfNotSetForType:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    os_unfair_lock_lock(&self->_lock);
    -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((id *)&self->super.isa, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
      v7 = v15;
      if (self)
      {
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v6 = v6;
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v17;
          while (2)
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v17 != v10)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "objectForKey:", v7);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (v12)
              {

                goto LABEL_15;
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
            if (v9)
              continue;
            break;
          }
        }

      }
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _HKGenerateDefaultUnitForQuantityTypeWithVersion();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDUnitPreferencesManager _lock_setUnit:forType:]((uint64_t)self, (uint64_t)v14, v7);
    }
LABEL_15:
    os_unfair_lock_unlock(&self->_lock);

  }
}

- (id)_lock_generateVersionedUnitPreferencesWithError:(id *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v21;
  _BYTE buf[24];
  void *v23;
  id *v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    v17 = 0;
    return v17;
  }
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = 0;
  while (1)
  {
    -[HDUnitPreferencesManager _domainForVersion:](a1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v6 = v5;
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    +[HDKeyValueEntity allValuesForDomain:category:profile:error:](HDProtectedKeyValueEntity, "allValuesForDomain:category:profile:error:", v6, 104, WeakRetained, &v21);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (objc_class *)MEMORY[0x1E0C99E08];
      v10 = v8;
      v11 = objc_alloc_init(v9);
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __77__HDUnitPreferencesManager__unitPreferencesDictionaryFromKeyValueDictionary___block_invoke;
      v23 = &unk_1E6CF22D0;
      v24 = a1;
      v12 = v11;
      v25 = v12;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", buf);

      v13 = v25;
      v14 = v12;

    }
    else
    {
      v14 = 0;
    }

    v15 = v21;
    v16 = v15;
    if (!v14)
      break;
    objc_msgSend(v3, "addObject:", v14);
LABEL_9:

    if (++v4 == 3)
    {
      v17 = (void *)objc_msgSend(v3, "copy");
      goto LABEL_17;
    }
  }
  if (!v15)
    goto LABEL_9;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2114;
    v23 = v16;
    _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Received error when getting unit preferences for domain %{public}@: %{public}@", buf, 0x20u);
  }

  if (a2)
    *a2 = objc_retainAutorelease(v16);
  else
    _HKLogDroppedError();

  v17 = 0;
LABEL_17:

  return v17;
}

- (id)preferredUnitForType:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDUnitPreferencesManager _lock_generateVersionedUnitPreferencesWithError:]((id *)&self->super.isa, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDUnitPreferencesManager _lock_unitForType:versionedUnitPreferences:version:locale:](self, v7, v8, 2, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)unitTesting_resetUnits
{
  os_unfair_lock_s *p_lock;
  NSArray *versionedUnitPreferences;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  versionedUnitPreferences = self->_versionedUnitPreferences;
  self->_versionedUnitPreferences = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)addUnitPreferenceObserver:(id)a3 queue:(id)a4
{
  -[HKObserverSet registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

uint64_t __68__HDUnitPreferencesManager__lock_notifyObserversWithUnitPreferences__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unitPreferencesManagerDidUpdateUnitPreferences:", *(_QWORD *)(a1 + 32));
}

- (id)_stringFromQuantityType:(void *)a1
{
  objc_class *v1;
  id v2;
  id v3;
  uint64_t v4;

  v1 = (objc_class *)MEMORY[0x1E0CB3940];
  v2 = a1;
  v3 = [v1 alloc];
  v4 = objc_msgSend(v2, "code");

  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("%ld"), v4);
}

BOOL __67__HDUnitPreferencesManager__lock_removePreferredUnitForType_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  BOOL v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  id WeakRetained;
  BOOL v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v5 = 0;
  v6 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    -[HDUnitPreferencesManager _domainForVersion:](*(void **)(a1 + 32), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    v10 = +[HDKeyValueEntity setString:forKey:domain:category:profile:error:](HDProtectedKeyValueEntity, "setString:forKey:domain:category:profile:error:", 0, v8, v7, 104, WeakRetained, a3);

    if (!v10)
      break;

    v5 = v6++ > 1;
    if (v6 == 3)
      return 1;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v13 = objc_opt_class();
    v14 = *a3;
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v14;
    _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error removing unit preferences: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  return v5;
}

- (__CFString)_domainForVersion:(void *)a1
{
  if (a1)
  {
    if (!a2)
      return &stru_1E6D11BB8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), CFSTR("Version"), a2);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (__CFString *)a1;
}

- (void)_localeDidChange:(id)a3
{
  os_unfair_lock_s *p_lock;
  HKObserverSet *observers;
  _QWORD v6[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    observers = self->_observers;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__HDUnitPreferencesManager__lock_notifyObserversWithUnitPreferences__block_invoke;
    v6[3] = &unk_1E6CF22A8;
    v6[4] = self;
    -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v6);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_versionedUnitPreferences, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
