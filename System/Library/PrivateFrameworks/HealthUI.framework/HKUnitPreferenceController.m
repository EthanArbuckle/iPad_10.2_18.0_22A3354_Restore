@implementation HKUnitPreferenceController

- (id)_generateDefaultHKUnitPreferences
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  _HKAllQuantityTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v7);
        _HKGenerateDefaultUnitForQuantityType();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB6528], "correlationTypeForIdentifier:", *MEMORY[0x1E0CB4AB8]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mmHg"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v31);

  objc_msgSend(MEMORY[0x1E0CB6B50], "heartbeatSeriesType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("count/min"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v30);

  objc_msgSend(MEMORY[0x1E0CB6380], "tachycardiaType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v12);

  objc_msgSend(MEMORY[0x1E0CB6380], "dataTypeWithCode:", 189);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, v14);

  objc_msgSend(MEMORY[0x1E0CB6380], "bradycardiaType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, v16);

  objc_msgSend(MEMORY[0x1E0CB6380], "atrialFibrillationEventType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, v18);

  objc_msgSend(MEMORY[0x1E0CB6680], "electrocardiogramType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v21, v20);

  objc_msgSend(MEMORY[0x1E0CB6310], "audiogramSampleType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v23, v22);

  objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6380], "handwashingEventType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v24, v25);

  objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v27, v26);

  v28 = (void *)objc_msgSend(v2, "copy");
  return v28;
}

- (id)localizedDisplayNameForDisplayType:(id)a3 value:(id)a4 nameContext:(int64_t)a5
{
  _BOOL8 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a4 != 0;
  v9 = a4;
  v10 = a3;
  -[HKUnitPreferenceController _displayNameKeyForDisplayType:withNumber:nameContext:](self, "_displayNameKeyForDisplayType:withNumber:nameContext:", v10, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedHealthUIStringForDisplayType:key:value:](self, "localizedHealthUIStringForDisplayType:key:value:", v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedDisplayNameForDisplayType:(id)a3 value:(id)a4
{
  return -[HKUnitPreferenceController localizedDisplayNameForDisplayType:value:nameContext:](self, "localizedDisplayNameForDisplayType:value:nameContext:", a3, a4, 1);
}

- (id)displayRangeForDisplayType:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = displayRangeForDisplayType__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&displayRangeForDisplayType__onceToken, &__block_literal_global_410);
  v5 = (void *)displayRangeForDisplayType____displayRanges;
  objc_msgSend(v4, "objectType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_unitDisplayNameKeyForDisplayType:(id)a3 nameContext:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HKUnitPreferenceController unitForDisplayType:](self, "unitForDisplayType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localization");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "unitDisplayNameKeyOverrideForUnit:nameContext:", v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    +[HKUnitPreferenceController _displayNameKeyForUnit:nameContext:](HKUnitPreferenceController, "_displayNameKeyForUnit:nameContext:", v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)localizedHealthUIStringForDisplayType:(id)a3 key:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HKUnitPreferenceController unitForDisplayType:](self, "unitForDisplayType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnitPreferenceController _localizedHealthUIStringForDisplayType:unit:key:value:](HKUnitPreferenceController, "_localizedHealthUIStringForDisplayType:unit:key:value:", v10, v11, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)unitForChartingDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;

  v4 = a3;
  -[HKUnitPreferenceController unitForDisplayType:](self, "unitForDisplayType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_msgSend(v4, "behavior"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "chartsRelativeData"),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "_changeInUnit:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v5;
  }
  v9 = v8;

  return v9;
}

- (id)unitForDisplayType:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKUnitPreferenceController _lock_unitForDisplayType:](self, "_lock_unitForDisplayType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_unitForDisplayType:(id)a3
{
  id v4;
  NSMutableDictionary *unitPreferencesByObjectType;
  void *v6;
  void *v7;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (v4)
  {
    unitPreferencesByObjectType = self->_unitPreferencesByObjectType;
    objc_msgSend(v4, "objectType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](unitPreferencesByObjectType, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)_localizedHealthUIStringForDisplayType:(id)a3 unit:(id)a4 key:(id)a5 value:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  __CFString *v22;
  __CFString *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v11)
  {
    v23 = 0;
    goto LABEL_14;
  }
  if (!objc_msgSend(v11, "length"))
  {
    v23 = &stru_1E9C4C428;
    goto LABEL_14;
  }
  objc_msgSend(v9, "localization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizationTableNameOverride");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_6;
  HKHealthKitFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localization");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizationTableNameOverride");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", v11, &stru_1E9C4C428, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 || (v18 = v14, objc_msgSend(v14, "isEqualToString:", v11)))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v11, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v12
    && (objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v10, "isEqual:", v20),
        v20,
        (v21 & 1) == 0))
  {
    if (!objc_msgSend(v18, "containsString:", CFSTR("unit_double")))
    {
      v27 = objc_msgSend(v12, "integerValue");
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v18, v27);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!-[__CFString length](v23, "length"))
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v28, "localizedStringWithFormat:", v18, v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v23 = (__CFString *)v30;
      }
      goto LABEL_11;
    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(v25, "localizedStringWithFormat:", v18, v26);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = v18;
  }
  v23 = v22;
LABEL_11:

LABEL_14:
  return v23;
}

- (id)_displayNameKeyForDisplayType:(id)a3 withNumber:(BOOL)a4 nameContext:(int64_t)a5
{
  _BOOL8 v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HKUnitPreferenceController _unitDisplayNameKeyForDisplayType:nameContext:](self, "_unitDisplayNameKeyForDisplayType:nameContext:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnitPreferenceController _displayNameKey:withNumber:](HKUnitPreferenceController, "_displayNameKey:withNumber:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_displayNameKey:(id)a3 withNumber:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  v4 = a4;
  v5 = a3;
  v6 = CFSTR("_NUMBERLESS_UNIT");
  if (v4)
    v6 = CFSTR("_NUMBERED_UNIT");
  v7 = v6;
  if (objc_msgSend(v5, "length") && (objc_msgSend(v5, "containsString:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v5, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_1E9C4C428;
  }

  return v8;
}

void __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_2;
    block[3] = &unk_1E9C3FBE0;
    block[4] = *(_QWORD *)(a1 + 32);
    v16 = v5;
    v17 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if ((HKIsUnitTesting() & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
      (*(void (**)(uint64_t, _QWORD))(v14 + 16))(v14, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_unitPreferencesByObjectType, 0);
  objc_storeStrong((id *)&self->_unitStrings, 0);
}

void __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "_lock_updatePreferredUnits:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_postNotificationWithChangedKeys:", v3);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);

}

- (id)_lock_updatePreferredUnits:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[HKUnitPreferenceController _changedKeysBetweenDictionary:andDictionary:](self, "_changedKeysBetweenDictionary:andDictionary:", self->_unitPreferencesByObjectType, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v11, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unitPreferencesByObjectType, "setObject:forKeyedSubscript:", v12, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v13 = v6;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKUnitPreferenceController;
  -[HKUnitPreferenceController dealloc](&v4, sel_dealloc);
}

- (HKUnitPreferenceController)initWithHealthStore:(id)a3
{
  HKUnitPreferenceController *v3;
  HKUnitPreferenceController *v4;

  v3 = -[HKUnitPreferenceController _initWithHealthStore:completion:](self, "_initWithHealthStore:completion:", a3, 0);
  v4 = v3;
  if (v3)
    -[HKUnitPreferenceController _initHKUnitPreferencesWithCompletion:](v3, "_initHKUnitPreferencesWithCompletion:", 0);
  return v4;
}

- (void)_fetchHKUnitPreferencesWithAttempt:(int64_t)a3
{
  -[HKUnitPreferenceController _fetchHKUnitPreferencesWithAttempt:completion:](self, "_fetchHKUnitPreferencesWithAttempt:completion:", a3, 0);
}

- (void)_refreshHKUnitPreferencesWithCompletion:(id)a3
{
  id v4;
  HKHealthStore *healthStore;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  healthStore = self->_healthStore;
  v6 = (void *)MEMORY[0x1E0C99E60];
  _HKAllQuantityTypes();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke;
  v10[3] = &unk_1E9C41CC0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HKHealthStore preferredUnitsForQuantityTypes:completion:](healthStore, "preferredUnitsForQuantityTypes:completion:", v8, v10);

}

- (id)_changedKeysBetweenDictionary:(id)a3 andDictionary:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  _HKAllQuantityTypes();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v15) & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4 nameContext:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a4;
  +[HKUnitPreferenceController _displayNameKeyForUnit:nameContext:](HKUnitPreferenceController, "_displayNameKeyForUnit:nameContext:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUnitPreferenceController _displayNameKey:withNumber:](HKUnitPreferenceController, "_displayNameKey:withNumber:", v9, v8 != 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKUnitPreferenceController localizedHealthUIStringForDisplayType:key:value:](self, "localizedHealthUIStringForDisplayType:key:value:", 0, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_displayNameKeyForUnit:(id)a3 nameContext:(int64_t)a4
{
  id v5;
  void *v6;
  int v7;
  __CFString *v8;

  v5 = a3;
  if (_displayNameKeyForUnit_nameContext__onceToken != -1)
    dispatch_once(&_displayNameKeyForUnit_nameContext__onceToken, &__block_literal_global_245);
  objc_msgSend(MEMORY[0x1E0CB6CD0], "largeCalorieUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    if (a4 == 2)
      v8 = CFSTR("LARGE_CALORIES");
    else
      v8 = CFSTR("SMALL_CALORIES");
  }
  else
  {
    objc_msgSend((id)_displayNameKeyForUnit_nameContext__localizableStringDict, "objectForKeyedSubscript:", v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __57__HKUnitPreferenceController_displayRangeForDisplayType___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v10 = *MEMORY[0x1E0CB5A98];
  v0 = (void *)MEMORY[0x1E0CB6A38];
  v1 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mg/dL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "quantityWithUnit:doubleValue:", v2, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mg/dL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantityWithUnit:doubleValue:", v5, 600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "inclusiveRangeWithMinimum:maximum:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)displayRangeForDisplayType____displayRanges;
  displayRangeForDisplayType____displayRanges = v8;

}

+ (HKUnitPreferenceController)unitPreferenceControllerWithHealthStore:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  HKUnitPreferenceController *result;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a4;
  v6 = a3;
  v7 = -[HKUnitPreferenceController _initWithHealthStore:completion:]([HKUnitPreferenceController alloc], "_initWithHealthStore:completion:", v6, 0);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HKUnitPreferenceController_unitPreferenceControllerWithHealthStore_completion___block_invoke;
  v11[3] = &unk_1E9C40DA8;
  v12 = v7;
  v13 = v5;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v8, "_initHKUnitPreferencesWithCompletion:", v11);

  return result;
}

uint64_t __81__HKUnitPreferenceController_unitPreferenceControllerWithHealthStore_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, v4);
}

- (id)_initWithHealthStore:(id)a3 completion:(id)a4
{
  id v6;
  HKUnitPreferenceController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *unitStrings;
  void *v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKUnitPreferenceController;
  v7 = -[HKUnitPreferenceController init](&v13, sel_init);
  if (v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    unitStrings = v7->_unitStrings;
    v7->_unitStrings = v8;

    objc_storeStrong((id *)&v7->_healthStore, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__localeDidChange_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__unitPreferencesDidUpdate_, *MEMORY[0x1E0CB60C0], v7->_healthStore);

  }
  return v7;
}

- (void)updatePreferredUnit:(id)a3 forDisplayType:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HKUnitPreferenceController _lock_updatePreferredUnit:forDisplayType:](self, "_lock_updatePreferredUnit:forDisplayType:", v8, v7);

  os_unfair_lock_unlock(p_lock);
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "objectType");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setWithObject:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController _postNotificationWithChangedKeys:](self, "_postNotificationWithChangedKeys:", v10);

}

- (id)localizedDisplayNameForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKUnitPreferenceController _displayNameKeyForDisplayType:withNumber:](self, "_displayNameKeyForDisplayType:withNumber:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedHealthUIStringForDisplayType:key:value:](self, "localizedHealthUIStringForDisplayType:key:value:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4
{
  return -[HKUnitPreferenceController localizedDisplayNameForUnit:value:nameContext:](self, "localizedDisplayNameForUnit:value:nameContext:", a3, a4, 1);
}

- (id)localizedLongDisplayNameForDisplayType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HKUnitPreferenceController unitForDisplayType:](self, "unitForDisplayType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController _longDisplayNameOverrideForDisplayType:](self, "_longDisplayNameOverrideForDisplayType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[HKUnitPreferenceController _longDisplayNameForUnit:](self, "_longDisplayNameForUnit:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[HKUnitPreferenceController localizedDisplayNameForDisplayType:](self, "localizedDisplayNameForDisplayType:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(v4, "localization");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "displayName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return v6;
}

- (id)_longDisplayNameOverrideForDisplayType:(id)a3
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v3 = objc_msgSend(a3, "displayTypeIdentifier");
  v4 = 0;
  if (v3 > 78)
  {
    if (v3 <= 136)
    {
      if (v3 == 79)
      {
        v5 = CFSTR("LONG_WORKOUT_MINUTES");
        goto LABEL_23;
      }
      if (v3 != 118)
        return v4;
    }
    else if (v3 != 137)
    {
      if (v3 == 251)
      {
        v5 = CFSTR("LONG_NUMBER_OF_ALCOHOLIC_BEVERAGES");
        goto LABEL_23;
      }
      if (v3 != 266)
        return v4;
    }
LABEL_17:
    v5 = CFSTR("LONG_BEATS_PER_MINUTE");
    goto LABEL_23;
  }
  if (v3 <= 6)
  {
    if (!v3)
    {
      v5 = CFSTR("LONG_BMI");
      goto LABEL_23;
    }
    if (v3 != 5)
      return v4;
    goto LABEL_17;
  }
  switch(v3)
  {
    case 7:
      v5 = CFSTR("LONG_STEPS");
      goto LABEL_23;
    case 12:
      v5 = CFSTR("LONG_FLOORS");
      goto LABEL_23;
    case 61:
      v5 = CFSTR("LONG_BREATHS_PER_MINUTE");
LABEL_23:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v4;
}

- (double)scaleFactorForYAxisLabeling:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  int v9;

  v4 = a3;
  -[HKUnitPreferenceController unitForDisplayType:](self, "unitForDisplayType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "displayTypeIdentifier");

  v7 = 1.0;
  if (v6 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ft"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqual:", v8);

    if (v9)
      v7 = 12.0;
    else
      v7 = 1.0;
  }

  return v7;
}

- (void)_lock_updatePreferredUnit:(id)a3 forDisplayType:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;
  id v9;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  objc_msgSend(v7, "objectType");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_unitPreferencesByObjectType, "setObject:forKeyedSubscript:", v8, v9);
  -[HKHealthStore _setPreferredUnit:forType:completion:](self->_healthStore, "_setPreferredUnit:forType:completion:", v8, v9, &__block_literal_global_25);

}

void __71__HKUnitPreferenceController__lock_updatePreferredUnit_forDisplayType___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __71__HKUnitPreferenceController__lock_updatePreferredUnit_forDisplayType___block_invoke_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (void)_localeDidChange:(id)a3
{
  -[HKUnitPreferenceController _fetchHKUnitPreferencesWithAttempt:completion:](self, "_fetchHKUnitPreferencesWithAttempt:completion:", 0, 0);
}

- (void)_unitPreferencesDidUpdate:(id)a3
{
  -[HKUnitPreferenceController _fetchHKUnitPreferencesWithAttempt:completion:](self, "_fetchHKUnitPreferencesWithAttempt:completion:", 0, 0);
}

- (void)_initHKUnitPreferencesWithCompletion:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *unitPreferencesByObjectType;
  id v7;

  v7 = a3;
  -[HKUnitPreferenceController _generateDefaultHKUnitPreferences](self, "_generateDefaultHKUnitPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  unitPreferencesByObjectType = self->_unitPreferencesByObjectType;
  self->_unitPreferencesByObjectType = v5;

  -[HKUnitPreferenceController _fetchHKUnitPreferencesWithAttempt:completion:](self, "_fetchHKUnitPreferencesWithAttempt:completion:", 0, v7);
}

- (void)_fetchHKUnitPreferencesWithAttempt:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__HKUnitPreferenceController__fetchHKUnitPreferencesWithAttempt_completion___block_invoke;
  v8[3] = &unk_1E9C41C98;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[HKUnitPreferenceController _refreshHKUnitPreferencesWithCompletion:](self, "_refreshHKUnitPreferencesWithCompletion:", v8);

}

uint64_t __76__HKUnitPreferenceController__fetchHKUnitPreferencesWithAttempt_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  if ((a2 & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 <= 2)
      return objc_msgSend(*(id *)(a1 + 32), "_fetchHKUnitPreferencesWithAttempt:completion:", v2 + 1, *(_QWORD *)(a1 + 40));
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_postNotificationWithChangedKeys:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("HKUnitPreferenceControllerUnitPreferenceChangedKey");
  v9[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("HKUnitPreferenceControllerUnitPreferencesDidChangeNotification"), self, v6);
}

- (id)_displayNameKeyForDisplayType:(id)a3 withNumber:(BOOL)a4
{
  return -[HKUnitPreferenceController _displayNameKeyForDisplayType:withNumber:nameContext:](self, "_displayNameKeyForDisplayType:withNumber:nameContext:", a3, a4, 1);
}

void __65__HKUnitPreferenceController__displayNameKeyForUnit_nameContext___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[47];
  _QWORD v50[49];

  v50[47] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "inchUnit");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v48;
  v50[0] = CFSTR("INCHES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v47;
  v50[1] = CFSTR("FEET");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "poundUnit");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v46;
  v50[2] = CFSTR("POUNDS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v45;
  v50[3] = CFSTR("SECONDS_SHORT");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v44;
  v50[4] = CFSTR("MINUTES_SHORT");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v43;
  v50[5] = CFSTR("HOURS_SHORT");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "stoneUnit");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v42;
  v50[6] = CFSTR("STONES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnitWithMetricPrefix:", 9);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v41;
  v50[7] = CFSTR("KILOGRAMS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "mileUnit");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v40;
  v50[8] = CFSTR("MILES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "yardUnit");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v39;
  v50[9] = CFSTR("YARDS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnit");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v38;
  v50[10] = CFSTR("METERS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnitWithMetricPrefix:", 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v37;
  v50[11] = CFSTR("CENTIMETERS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "meterUnitWithMetricPrefix:", 9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v36;
  v50[12] = CFSTR("KILOMETERS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeCelsiusUnit");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[13] = v35;
  v50[13] = CFSTR("DEGREES_CELSIUS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "degreeFahrenheitUnit");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[14] = v34;
  v50[14] = CFSTR("DEGREES_FAHRENHEIT");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "jouleUnitWithMetricPrefix:", 9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[15] = v33;
  v50[15] = CFSTR("KILOJOULES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[16] = v32;
  v50[16] = CFSTR("INTERNATIONAL_UNITS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelHearingLevelUnit");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v31;
  v50[17] = CFSTR("DECIBELS_HEARING");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelAWeightedSoundPressureLevelUnit");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[18] = v30;
  v50[18] = CFSTR("DECIBELS");
  _HKBloodGlucoseMillimolesPerLiterUnit();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[19] = v29;
  v50[19] = CFSTR("MILLIMOLES_PER_LITER");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[20] = v28;
  v50[20] = CFSTR("PERCENT");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "kilocalorieUnit");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[21] = v27;
  v50[21] = CFSTR("KILOCALORIES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "largeCalorieUnit");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[22] = v26;
  v50[22] = CFSTR("LARGE_CALORIES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "literUnit");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[23] = v25;
  v50[23] = CFSTR("LITERS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "gramUnit");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[24] = v24;
  v50[24] = CFSTR("GRAMS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "wattUnit");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[25] = v23;
  v50[25] = CFSTR("WATTS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("cal"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[26] = v22;
  v50[26] = CFSTR("SMALL_CALORIES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mg/dL"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[27] = v21;
  v50[27] = CFSTR("MILLIGRAMS_PER_DECILITER");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mg"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[28] = v20;
  v50[28] = CFSTR("MILLIGRAMS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mcg"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[29] = v19;
  v50[29] = CFSTR("MICROGRAMS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mcS"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[30] = v18;
  v50[30] = CFSTR("MICROSIEMENS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("L/min"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[31] = v17;
  v50[31] = CFSTR("LITERS_PER_MINUTE");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[32] = v16;
  v50[32] = CFSTR("MILLILITERS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mmHg"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[33] = v15;
  v50[33] = CFSTR("MILLIMETERS_MERCURY");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("fl_oz_us"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49[34] = v14;
  v50[34] = CFSTR("US_FLUID_OUNCES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("fl_oz_imp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49[35] = v13;
  v50[35] = CFSTR("IMPERIAL_FLUID_OUNCES");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("pt_us"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v49[36] = v12;
  v50[36] = CFSTR("US_PINTS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("pt_imp"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v49[37] = v0;
  v50[37] = CFSTR("IMPERIAL_PINTS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("cup_us"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v49[38] = v1;
  v50[38] = CFSTR("US_CUPS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("cup_imp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v49[39] = v2;
  v50[39] = CFSTR("IMPERIAL_CUPS");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ms"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49[40] = v3;
  v50[40] = CFSTR("MILLISECONDS_SHORT");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ml/(kg*min)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[41] = v4;
  v50[41] = CFSTR("VO2_MAX");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("m/s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[42] = v5;
  v50[42] = CFSTR("METERS_PER_SECOND");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("ft/s"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[43] = v6;
  v50[43] = CFSTR("FEET_PER_SECOND");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mi/hr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[44] = v7;
  v50[44] = CFSTR("MILES_PER_HOUR");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("km/hr"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[45] = v8;
  v50[45] = CFSTR("KILOMETERS_PER_HOUR");
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("kcal/(kg*hr)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v49[46] = v9;
  v50[46] = CFSTR("PHYSICAL_EFFORT");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 47);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_displayNameKeyForUnit_nameContext__localizableStringDict;
  _displayNameKeyForUnit_nameContext__localizableStringDict = v10;

}

- (id)_longDisplayNameForUnit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (_longDisplayNameForUnit__onceToken != -1)
    dispatch_once(&_longDisplayNameForUnit__onceToken, &__block_literal_global_380);
  v4 = (void *)_longDisplayNameForUnit__longUnitNameStringDict;
  objc_msgSend(v3, "unitString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __54__HKUnitPreferenceController__longDisplayNameForUnit___block_invoke()
{
  void *v0;

  v0 = (void *)_longDisplayNameForUnit__longUnitNameStringDict;
  _longDisplayNameForUnit__longUnitNameStringDict = (uint64_t)&unk_1E9CED6F0;

}

+ (id)localizedUnitStringForObjectType:(id)a3 unit:(id)a4 value:(id)a5 wheelchairUse:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v9 = a4;
  v10 = a5;
  +[HKDisplayTypeController displayTypeForObjectType:wheelchairUse:](HKDisplayTypeController, "displayTypeForObjectType:wheelchairUse:", a3, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unitDisplayNameKeyOverrideForUnit:nameContext:", v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    +[HKUnitPreferenceController _displayNameKeyForUnit:nameContext:](HKUnitPreferenceController, "_displayNameKeyForUnit:nameContext:", v9, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[HKUnitPreferenceController _displayNameKey:withNumber:](HKUnitPreferenceController, "_displayNameKey:withNumber:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKUnitPreferenceController _localizedHealthUIStringForDisplayType:unit:key:value:](HKUnitPreferenceController, "_localizedHealthUIStringForDisplayType:unit:key:value:", v11, v9, v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

void __71__HKUnitPreferenceController__lock_updatePreferredUnit_forDisplayType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Error setting preferred unit: %{public}@", a5, a6, a7, a8, 2u);
}

void __70__HKUnitPreferenceController__refreshHKUnitPreferencesWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D7813000, a2, a3, "Error fetching preferred units: %{public}@", a5, a6, a7, a8, 2u);
}

@end
