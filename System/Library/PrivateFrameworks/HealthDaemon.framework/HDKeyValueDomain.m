@implementation HDKeyValueDomain

- (id)dateForKey:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;
  void *v11;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class dateForKey:domain:category:profile:entity:error:](entityClass, "dateForKey:domain:category:profile:entity:error:", v9, domainName, category, WeakRetained, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HDKeyValueDomain)initWithCategory:(int64_t)a3 domainName:(id)a4 profile:(id)a5
{
  id v9;
  id v10;
  HDKeyValueDomain *v11;
  HDKeyValueDomain *v12;
  id v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  HKObserverSet *observers;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDKeyValueDomain;
  v11 = -[HDKeyValueDomain init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_category = a3;
    objc_storeStrong((id *)&v11->_domainName, a4);
    objc_storeWeak((id *)&v12->_profile, v10);
    v12->_entityClass = +[HDKeyValueEntity _entityClassForKeyValueCategory:](HDKeyValueEntity, "_entityClassForKeyValueCategory:", a3);
    v13 = objc_alloc(MEMORY[0x1E0CB6988]);
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithName:loggingCategory:", v15, *MEMORY[0x1E0CB52C0]);
    observers = v12->_observers;
    v12->_observers = (HKObserverSet *)v16;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_profile);
}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v11;
  id v12;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = -[objc_class setData:forKey:domain:category:profile:error:](entityClass, "setData:forKey:domain:category:profile:error:", v12, v11, domainName, category, WeakRetained, a5);

  return (char)a5;
}

- (id)numberForKey:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;
  void *v11;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class numberForKey:domain:category:profile:entity:error:](entityClass, "numberForKey:domain:category:profile:entity:error:", v9, domainName, category, WeakRetained, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setNumber:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v11;
  id v12;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = -[objc_class setNumber:forKey:domain:category:profile:error:](entityClass, "setNumber:forKey:domain:category:profile:error:", v12, v11, domainName, category, WeakRetained, a5);

  return (char)a5;
}

- (BOOL)setDate:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v11;
  id v12;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = -[objc_class setDate:forKey:domain:category:profile:error:](entityClass, "setDate:forKey:domain:category:profile:error:", v12, v11, domainName, category, WeakRetained, a5);

  return (char)a5;
}

- (id)allValuesWithError:(id *)a3
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  id WeakRetained;
  void *v8;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  -[objc_class allValuesForDomain:category:profile:error:](entityClass, "allValuesForDomain:category:profile:error:", domainName, category, WeakRetained, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;
  void *v11;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class dataForKey:domain:category:profile:entity:error:](entityClass, "dataForKey:domain:category:profile:entity:error:", v9, domainName, category, WeakRetained, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)stringForKey:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;
  void *v11;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class stringForKey:domain:category:profile:entity:error:](entityClass, "stringForKey:domain:category:profile:entity:error:", v9, domainName, category, WeakRetained, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_wristTemperatureIdentifierDomainWithProfile:(id)a3
{
  id v3;
  HDKeyValueDomain *v4;

  v3 = a3;
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 105, CFSTR("wrist-temperature-identifiers"), v3);

  return v4;
}

- (id)_wristTemperatureSerialNumbersBySourceIdentifier
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleInternalInstall");

  if (v4)
  {
    v11 = 0;
    -[HDKeyValueDomain allValuesWithError:](self, "allValuesWithError:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    v7 = v5;
    if (!v5)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5310];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5310], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v13 = v6;
        _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[Wrist Temperature] Failed to retrieve serial numbers by source identifier: %{public}@", buf, 0xCu);
      }
      v7 = (void *)MEMORY[0x1E0C9AA70];
    }
    v9 = v7;

  }
  else
  {
    v9 = (id)MEMORY[0x1E0C9AA70];
  }
  return v9;
}

- (id)_wristTemperatureResolvedSourceIdentifiersBySourceIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  -[HDKeyValueDomain _wristTemperatureSerialNumbersBySourceIdentifier](self, "_wristTemperatureSerialNumbersBySourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_sortedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke;
  v14[3] = &unk_1E6CEAE78;
  v15 = v3;
  v16 = v2;
  v6 = v2;
  v7 = v3;
  objc_msgSend(v4, "hk_mapToDictionary:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_3;
  v12[3] = &unk_1E6CEAEA0;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v6, "hk_map:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void (**v7)(id, id, void *);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_2;
  v10[3] = &unk_1E6CEAE50;
  v6 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v5;
  v9 = v5;
  v7 = a3;
  objc_msgSend(v6, "hk_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9, v8);

}

uint64_t __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

void __109__HDKeyValueDomain_WristTemperatureIdentifiers___wristTemperatureResolvedSourceIdentifiersBySourceIdentifier__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a4)[2](v8, v9, v10);

}

- (id)quantityForKey:(id)a3 unit:(id)a4 error:(id *)a5
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v11;
  id v12;
  id WeakRetained;
  void *v14;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class quantityForKey:unit:domain:category:profile:entity:error:](entityClass, "quantityForKey:unit:domain:category:profile:entity:error:", v12, v11, domainName, category, WeakRetained, 0, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)propertyListValueForKey:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[HDKeyValueDomain dataForKey:error:](self, "dataForKey:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)valuesForKeys:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;
  void *v11;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class valuesForKeys:domain:category:profile:error:](entityClass, "valuesForKeys:domain:category:profile:error:", v9, domainName, category, WeakRetained, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)modificationDatesForKeys:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;
  void *v11;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  -[objc_class modificationDatesForKeys:domain:category:profile:error:](entityClass, "modificationDatesForKeys:domain:category:profile:error:", v9, domainName, category, WeakRetained, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)setData:(id)a3 forKey:(id)a4 syncIdentity:(int64_t)a5 error:(id *)a6
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v13;
  id v14;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v13 = a4;
  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a6) = -[objc_class setData:forKey:domain:category:syncIdentity:profile:error:](entityClass, "setData:forKey:domain:category:syncIdentity:profile:error:", v14, v13, domainName, category, a5, WeakRetained, a6);

  return (char)a6;
}

- (BOOL)setQuantity:(id)a3 unit:(id)a4 forKey:(id)a5 error:(id *)a6
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v13;
  id v14;
  id v15;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a6) = -[objc_class setQuantity:unit:forKey:domain:category:profile:error:](entityClass, "setQuantity:unit:forKey:domain:category:profile:error:", v15, v14, v13, domainName, category, WeakRetained, a6);

  return (char)a6;
}

- (BOOL)setString:(id)a3 forKey:(id)a4 error:(id *)a5
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v11;
  id v12;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v11 = a4;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a5) = -[objc_class setString:forKey:domain:category:profile:error:](entityClass, "setString:forKey:domain:category:profile:error:", v12, v11, domainName, category, WeakRetained, a5);

  return (char)a5;
}

- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    v10 = 0;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
LABEL_5:
    v11 = -[HDKeyValueDomain setData:forKey:error:](self, "setData:forKey:error:", v10, v9, a5);

    goto LABEL_6;
  }
  v11 = 0;
LABEL_6:

  return v11;
}

- (BOOL)setValuesWithDictionary:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a4) = -[objc_class setValuesWithDictionary:domain:category:profile:error:](entityClass, "setValuesWithDictionary:domain:category:profile:error:", v9, domainName, category, WeakRetained, a4);

  return (char)a4;
}

- (BOOL)setValueForAllKeys:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  HDProfile **p_profile;
  id v9;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  p_profile = &self->_profile;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a4) = -[objc_class setValueForAllKeys:domain:category:profile:error:](entityClass, "setValueForAllKeys:domain:category:profile:error:", v9, domainName, category, WeakRetained, a4);

  return (char)a4;
}

- (BOOL)removeValuesForKeys:(id)a3 error:(id *)a4
{
  Class entityClass;
  NSString *domainName;
  int64_t category;
  void *v9;
  id WeakRetained;

  entityClass = self->_entityClass;
  category = self->_category;
  domainName = self->_domainName;
  objc_msgSend(a3, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a4) = -[objc_class removeValuesForDomain:category:keys:profile:error:](entityClass, "removeValuesForDomain:category:keys:profile:error:", domainName, category, v9, WeakRetained, a4);

  return (char)a4;
}

- (void)startObservation:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__HDKeyValueDomain_startObservation___block_invoke;
  v4[3] = &unk_1E6CE80E8;
  v4[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, 0, v4);
}

void __37__HDKeyValueDomain_startObservation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "keyValueDomainManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startObservationForDomain:", *(_QWORD *)(a1 + 32));

}

- (void)stopObservation:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__HDKeyValueDomain_stopObservation___block_invoke;
  v4[3] = &unk_1E6CE80E8;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

void __36__HDKeyValueDomain_stopObservation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "keyValueDomainManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopObservationForDomain:", *(_QWORD *)(a1 + 32));

}

- (void)notifyObservers
{
  HKObserverSet *observers;
  _QWORD v3[5];

  observers = self->_observers;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__HDKeyValueDomain_notifyObservers__block_invoke;
  v3[3] = &unk_1E6CFF338;
  v3[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v3);
}

uint64_t __35__HDKeyValueDomain_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didUpdateKeyValueDomain:", *(_QWORD *)(a1 + 32));
}

- (unint64_t)_unitTest_countOfObservers
{
  void *v2;
  unint64_t v3;

  -[HKObserverSet allObservers](self->_observers, "allObservers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (id)healthAppUserDefaultsDomainWithProfile:(id)a3
{
  id v3;
  HDKeyValueDomain *v4;
  HDKeyValueDomain *v5;

  v3 = a3;
  v4 = [HDKeyValueDomain alloc];
  v5 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v4, "initWithCategory:domainName:profile:", 102, *MEMORY[0x1E0CB7630], v3);

  return v5;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)domainName
{
  return self->_domainName;
}

@end
