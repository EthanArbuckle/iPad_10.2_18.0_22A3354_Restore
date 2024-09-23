@implementation HFHomePropertyCacheManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HFHomePropertyCacheManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379580 != -1)
    dispatch_once(&qword_1ED379580, block);
  return (id)_MergedGlobals_279;
}

- (id)valueForObject:(id)a3 key:(id)a4 invalidationReasons:(unint64_t)a5 recalculationBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v12, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomePropertyCacheManager valueForObject:home:key:invalidationReasons:recalculationBlock:](self, "valueForObject:home:key:invalidationReasons:recalculationBlock:", v12, v13, v11, a5, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)valueForObject:(id)a3 home:(id)a4 key:(id)a5 invalidationReasons:(unint64_t)a6 recalculationBlock:(id)a7
{
  char v8;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _HFHomePropertyCacheManagerKey *v26;
  void *v27;
  _HFHomePropertyCacheManagerKey *v28;
  void *v29;
  _HFHomePropertyCacheManagerKey *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  id v42;
  _QWORD v43[5];
  _HFHomePropertyCacheManagerKey *v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v8 = a6;
  v53 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(_QWORD))a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFHomePropertyCacheManager.m"), 101, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recalculationBlock"));

  }
  v16 = v13;
  objc_msgSend(v13, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isEqual:", v20))
  {
    v41 = v8;
    v21 = -[HFHomePropertyCacheManager _testing_disableCaching](self, "_testing_disableCaching");

    if (!v21)
    {
      v22 = v42;
      -[HFHomePropertyCacheManager cachedValuesForObject:](self, "cachedValuesForObject:", v42);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKey:", v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v24)
      {
        HFLogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v14;
          v47 = 2112;
          v48 = v42;
          _os_log_impl(&dword_1DD34E000, v25, OS_LOG_TYPE_INFO, "HFHomePropertyCacheManager: Recalculating %@ for object %@", buf, 0x16u);
        }

        v15[2](v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFHomePropertyCacheManager keyChangedWithObject:key:](self, v42, v14);
        if (!v24)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "setObject:forKey:cost:", v24, v14, 1);
        if ((v41 & 4) != 0)
        {
          v26 = [_HFHomePropertyCacheManagerKey alloc];
          objc_msgSend(v42, "uniqueIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[_HFHomePropertyCacheManagerKey initWithObjectID:key:](v26, "initWithObjectID:key:", v27, v14);

          -[HFHomePropertyCacheManager roomOrderKeysLock](self, "roomOrderKeysLock");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = MEMORY[0x1E0C809B0];
          v43[1] = 3221225472;
          v43[2] = __93__HFHomePropertyCacheManager_valueForObject_home_key_invalidationReasons_recalculationBlock___block_invoke;
          v43[3] = &unk_1EA727188;
          v43[4] = self;
          v44 = v28;
          v30 = v28;
          objc_msgSend(v29, "performBlock:", v43);

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24 == v31)
        v32 = 0;
      else
        v32 = v24;
      v33 = v32;

      goto LABEL_22;
    }
  }
  else
  {

  }
  if (!-[HFHomePropertyCacheManager _testing_disableCaching](self, "_testing_disableCaching"))
  {
    HFLogForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v13, "uniqueIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "home");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "uniqueIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v46 = v42;
      v47 = 2112;
      v48 = v36;
      v49 = 2112;
      v50 = v39;
      v51 = 2112;
      v52 = v14;
      _os_log_debug_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEBUG, "HFHomePropertyCacheManager: Object %@ home (%@) is not current home (%@): recalculating %@", buf, 0x2Au);

    }
  }
  v22 = v42;
  -[HFHomePropertyCacheManager keyChangedWithObject:key:](self, v42, v14);
  v15[2](v15);
  v33 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v33;
}

- (id)cachedValuesForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[HFHomePropertyCacheManager objectCaches](self, "objectCaches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[HFHomePropertyCacheManager objectCaches](self, "objectCaches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@(%@)"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v12);

    -[HFHomePropertyCacheManager objectCaches](self, "objectCaches");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:cost:", v7, v14, 1);

  }
  return v7;
}

- (NSCache)objectCaches
{
  return self->_objectCaches;
}

- (BOOL)_testing_disableCaching
{
  return self->__testing_disableCaching;
}

- (void)keyChangedWithObject:(void *)a3 key:
{
  id v5;
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "changedKeys");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = +[HFUtilities isInternalTest](HFUtilities, "isInternalTest");

      if (v8)
      {
        objc_msgSend(a1, "changedKeys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");
        v13 = v12;
        if (v12)
        {
          v14 = v12;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;

        objc_msgSend(v15, "addObject:", v5);
        objc_msgSend(a1, "changedKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v15, v17);

      }
    }
  }

}

- (NSMutableDictionary)changedKeys
{
  return self->_changedKeys;
}

- (HMFUnfairLock)roomOrderKeysLock
{
  return self->_roomOrderKeysLock;
}

void __43__HFHomePropertyCacheManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_279;
  _MergedGlobals_279 = (uint64_t)v1;

}

- (HFHomePropertyCacheManager)init
{
  HFHomePropertyCacheManager *v2;
  NSCache *v3;
  NSCache *objectCaches;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *keysForRoomOrder;
  uint64_t v11;
  HMFUnfairLock *roomOrderKeysLock;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HFHomePropertyCacheManager;
  v2 = -[HFHomePropertyCacheManager init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    objectCaches = v2->_objectCaches;
    v2->_objectCaches = v3;

    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:cache"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setName:](v2->_objectCaches, "setName:", v8);

    -[NSCache setEvictsObjectsWhenApplicationEntersBackground:](v2->_objectCaches, "setEvictsObjectsWhenApplicationEntersBackground:", 0);
    v2->__testing_disableCaching = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = objc_claimAutoreleasedReturnValue();
    keysForRoomOrder = v2->_keysForRoomOrder;
    v2->_keysForRoomOrder = (NSMutableSet *)v9;

    objc_msgSend(MEMORY[0x1E0D286D8], "lock");
    v11 = objc_claimAutoreleasedReturnValue();
    roomOrderKeysLock = v2->_roomOrderKeysLock;
    v2->_roomOrderKeysLock = (HMFUnfairLock *)v11;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addHomeManagerObserver:", v2);
    objc_msgSend(v13, "addHomeObserver:", v2);
    objc_msgSend(v13, "addAccessoryObserver:", v2);

  }
  return v2;
}

void __93__HFHomePropertyCacheManager_valueForObject_home_key_invalidationReasons_recalculationBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "keysForRoomOrder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableSet)keysForRoomOrder
{
  return self->_keysForRoomOrder;
}

- (void)_clearCachedValues
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  HFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEBUG, "HFHomePropertyCacheManager: Clearing cache", v5, 2u);
  }

  -[HFHomePropertyCacheManager objectCaches](self, "objectCaches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HFHomePropertyCacheManager _clearRoomOrderValues](self, "_clearRoomOrderValues");
}

- (void)_clearRoomOrderValues
{
  void *v3;
  _QWORD v4[5];

  -[HFHomePropertyCacheManager roomOrderKeysLock](self, "roomOrderKeysLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HFHomePropertyCacheManager__clearRoomOrderValues__block_invoke;
  v4[3] = &unk_1EA727DD8;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

void __51__HFHomePropertyCacheManager__clearRoomOrderValues__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "HFHomePropertyCacheManager: Clearing room order cache", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "keysForRoomOrder", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "objectCaches");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "keysForRoomOrder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (void)accessoryDidUpdateServices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v6)
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "home", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "home", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
    +[HFAccessoryLikeObject _invalidateObjectMap](HFAccessoryLikeObject, "_invalidateObjectMap");
  }
}

- (void)home:(id)a3 didAddServiceGroup:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
}

- (void)home:(id)a3 didRemoveServiceGroup:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
    +[HFAccessoryLikeObject _invalidateObjectMap](HFAccessoryLikeObject, "_invalidateObjectMap");
  }
}

- (void)home:(id)a3 didAddService:(id)a4 toServiceGroup:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
}

- (void)home:(id)a3 didRemoveService:(id)a4 fromServiceGroup:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues");
    +[HFAccessoryLikeObject _invalidateObjectMap](HFAccessoryLikeObject, "_invalidateObjectMap");
  }
}

- (void)home:(id)a3 didAddRoom:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
    -[HFHomePropertyCacheManager _clearRoomOrderValues](self, "_clearRoomOrderValues");
}

- (void)home:(id)a3 didRemoveRoom:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "home");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
    -[HFHomePropertyCacheManager _clearRoomOrderValues](self, "_clearRoomOrderValues");
}

- (void)homeDidUpdateApplicationData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
    -[HFHomePropertyCacheManager _clearRoomOrderValues](self, "_clearRoomOrderValues");
}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues", a3, a4, a5);
  +[HFAccessoryLikeObject _invalidateObjectMap](HFAccessoryLikeObject, "_invalidateObjectMap");
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  if (a4)
  {
    -[HFHomePropertyCacheManager _clearCachedValues](self, "_clearCachedValues", a3);
    +[HFAccessoryLikeObject _invalidateObjectMap](HFAccessoryLikeObject, "_invalidateObjectMap");
  }
}

- (void)stopTrackingChangedKeys
{
  NSMutableDictionary *changedKeys;

  changedKeys = self->_changedKeys;
  self->_changedKeys = 0;

}

- (void)resetTrackingChangedKeys
{
  NSMutableDictionary *v3;
  NSMutableDictionary *changedKeys;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  changedKeys = self->_changedKeys;
  self->_changedKeys = v3;

}

- (void)setObjectCaches:(id)a3
{
  objc_storeStrong((id *)&self->_objectCaches, a3);
}

- (void)setKeysForRoomOrder:(id)a3
{
  objc_storeStrong((id *)&self->_keysForRoomOrder, a3);
}

- (void)setRoomOrderKeysLock:(id)a3
{
  objc_storeStrong((id *)&self->_roomOrderKeysLock, a3);
}

- (void)set_testing_disableCaching:(BOOL)a3
{
  self->__testing_disableCaching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomOrderKeysLock, 0);
  objc_storeStrong((id *)&self->_keysForRoomOrder, 0);
  objc_storeStrong((id *)&self->_objectCaches, 0);
  objc_storeStrong((id *)&self->_changedKeys, 0);
}

@end
