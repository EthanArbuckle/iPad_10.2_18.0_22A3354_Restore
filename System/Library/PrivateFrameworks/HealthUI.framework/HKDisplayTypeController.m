@implementation HKDisplayTypeController

uint64_t __53__HKDisplayTypeController__computeSharedDisplayTypes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidden") ^ 1;

  return v3;
}

+ (HKDisplayTypeController)sharedInstance
{
  void *v3;
  void *v4;
  HKDisplayTypeController *v5;
  id v6;
  void *v7;
  void *v8;

  os_unfair_lock_lock((os_unfair_lock_t)&_controllersLock);
  objc_msgSend(a1, "controllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6790], "primaryStoreIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (HKDisplayTypeController *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB6780]);
    v5 = -[HKDisplayTypeController initWithHealthStore:]([HKDisplayTypeController alloc], "initWithHealthStore:", v6);
    objc_msgSend(a1, "controllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6790], "primaryStoreIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_controllersLock);
  return v5;
}

+ (id)sharedInstanceForHealthStore:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKDisplayTypeController *v7;
  void *v8;
  void *v9;

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_controllersLock);
  objc_msgSend(a1, "controllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (HKDisplayTypeController *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[HKDisplayTypeController initWithHealthStore:]([HKDisplayTypeController alloc], "initWithHealthStore:", v4);
    objc_msgSend(a1, "controllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v7, v9);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_controllersLock);

  return v7;
}

+ (NSMutableDictionary)controllers
{
  void *v2;
  id v3;
  void *v4;

  os_unfair_lock_assert_owner((const os_unfair_lock *)&_controllersLock);
  v2 = (void *)_controllers;
  if (!_controllers)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)_controllers;
    _controllers = (uint64_t)v3;

    v2 = (void *)_controllers;
  }
  return (NSMutableDictionary *)v2;
}

- (HKDisplayTypeController)initWithHealthStore:(id)a3
{
  id v4;
  HKDisplayTypeController *v5;
  uint64_t v6;
  _HKWheelchairUseCharacteristicCache *wheelchairUseCharacteristicCache;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDisplayTypeController;
  v5 = -[HKDisplayTypeController init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7038]), "initWithHealthStore:", v4);
    wheelchairUseCharacteristicCache = v5->_wheelchairUseCharacteristicCache;
    v5->_wheelchairUseCharacteristicCache = (_HKWheelchairUseCharacteristicCache *)v6;

    -[_HKWheelchairUseCharacteristicCache registerObserver:](v5->_wheelchairUseCharacteristicCache, "registerObserver:", v5);
    -[_HKWheelchairUseCharacteristicCache isWheelchairUser](v5->_wheelchairUseCharacteristicCache, "isWheelchairUser");
    +[HKDisplayTypeController initializeSharedDisplayTypes](HKDisplayTypeController, "initializeSharedDisplayTypes");
    objc_storeStrong((id *)&v5->_displayTypes, (id)_sharedDisplayTypes);
    objc_storeStrong((id *)&v5->_displayTypesByIdentifier, (id)_sharedDisplayTypesByIdentifier);
    objc_storeStrong((id *)&v5->_displayTypesByCategoryIdentifier, (id)_sharedDisplayTypesByCategoryIdentifier);
    objc_storeStrong((id *)&v5->_displayTypesByObjectType, (id)_sharedDisplayTypesByObjectType);
  }

  return v5;
}

+ (void)initializeSharedDisplayTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HKDisplayTypeController_initializeSharedDisplayTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initializeSharedDisplayTypes_onceToken != -1)
    dispatch_once(&initializeSharedDisplayTypes_onceToken, block);
}

- (id)displayTypeWithIdentifier:(id)a3
{
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_displayTypesByIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeController _displayTypeWithUpdatedWheelchairUserIfNecessary:](self, "_displayTypeWithUpdatedWheelchairUserIfNecessary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)displayTypeForObjectType:(id)a3
{
  void *v4;
  void *v5;

  -[NSDictionary objectForKeyedSubscript:](self->_displayTypesByObjectType, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeController _displayTypeWithUpdatedWheelchairUserIfNecessary:](self, "_displayTypeWithUpdatedWheelchairUserIfNecessary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_displayTypeWithUpdatedWheelchairUserIfNecessary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (-[_HKWheelchairUseCharacteristicCache isWheelchairUser](self->_wheelchairUseCharacteristicCache, "isWheelchairUser")&& (objc_msgSend(v4, "_isWheelchairUser") & 1) == 0)
  {
    v5 = objc_msgSend(v4, "copyWithIsWheelchairUser:", 1);
  }
  else
  {
    v5 = objc_msgSend(v4, "copy");
  }
  v6 = (void *)v5;

  return v6;
}

+ (void)_computeSharedDisplayTypes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id obj;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  +[HKDisplayType builtinDisplayTypes](HKDisplayType, "builtinDisplayTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_filter:", &__block_literal_global_18);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_sharedDisplayTypes;
  _sharedDisplayTypes = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = (id)_sharedDisplayTypes;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v30)
  {
    v27 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v36 != v27)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "displayTypeIdentifier"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v7, v8);

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "categoryIdentifier"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

        objc_msgSend(v7, "secondaryCategoryIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v11);

        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v12 = v9;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v32 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(v5, "objectForKeyedSubscript:", v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v18)
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v17);
              }
              objc_msgSend(v18, "addObject:", v7);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v14);
        }

        objc_msgSend(v7, "objectType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v7, v19);

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v30);
  }

  v20 = objc_msgSend(v29, "copy");
  v21 = (void *)_sharedDisplayTypesByIdentifier;
  _sharedDisplayTypesByIdentifier = v20;

  v22 = objc_msgSend(v5, "copy");
  v23 = (void *)_sharedDisplayTypesByCategoryIdentifier;
  _sharedDisplayTypesByCategoryIdentifier = v22;

  v24 = objc_msgSend(v28, "copy");
  v25 = (void *)_sharedDisplayTypesByObjectType;
  _sharedDisplayTypesByObjectType = v24;

}

uint64_t __55__HKDisplayTypeController_initializeSharedDisplayTypes__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_computeSharedDisplayTypes");
}

- (id)allDisplayTypes
{
  return self->_displayTypes;
}

+ (os_unfair_lock_s)controllersLock
{
  return (os_unfair_lock_s)_controllersLock;
}

+ (void)_unitTest_resetSharedDisplayTypes
{
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&_controllersLock);
  v3 = (void *)_controllers;
  _controllers = 0;

  objc_msgSend(a1, "_computeSharedDisplayTypes");
  os_unfair_lock_unlock((os_unfair_lock_t)&_controllersLock);
}

+ (id)displayTypeForObjectType:(id)a3 wheelchairUse:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  +[HKDisplayTypeController initializeSharedDisplayTypes](HKDisplayTypeController, "initializeSharedDisplayTypes");
  objc_msgSend((id)_sharedDisplayTypesByObjectType, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && (objc_msgSend(v6, "_isWheelchairUser") & 1) == 0)
    v7 = (id)objc_msgSend(v6, "copyWithIsWheelchairUser:", 1);
  else
    v7 = v6;
  v8 = v7;

  return v8;
}

- (HKDisplayTypeController)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("HKDisplayTypeControllerDisplayTypeStringValuesChangedNotification"), 0);

}

- (id)displayTypeForObjectTypeUnifyingBloodPressureTypes:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 17 || objc_msgSend(v4, "code") == 16)
  {
    objc_msgSend(MEMORY[0x1E0CB6528], "correlationTypeForIdentifier:", *MEMORY[0x1E0CB4AB8]);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  -[HKDisplayTypeController displayTypeForObjectType:](self, "displayTypeForObjectType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayTypesForCategoryIdentifier:(int64_t)a3
{
  NSDictionary *displayTypesByCategoryIdentifier;
  void *v4;
  void *v5;

  displayTypesByCategoryIdentifier = self->_displayTypesByCategoryIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](displayTypesByCategoryIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_displayTypesByObjectType, 0);
  objc_storeStrong((id *)&self->_displayTypesByCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_displayTypesByIdentifier, 0);
  objc_storeStrong((id *)&self->_displayTypes, 0);
}

@end
