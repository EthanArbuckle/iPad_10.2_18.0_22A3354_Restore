@implementation CAFCharacteristic

+ (void)load
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    +[CAFCharacteristic registerCharacteristicClass:](CAFCharacteristic, "registerCharacteristicClass:", objc_opt_class());
}

+ (void)registerCharacteristicClass:(Class)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (registerCharacteristicClass__onceToken != -1)
    dispatch_once(&registerCharacteristicClass__onceToken, &__block_literal_global_16);
  v4 = (id)_registeredCharacteristicClasses;
  objc_sync_enter(v4);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[objc_class characteristicFormats](a3, "characteristicFormats", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend((id)_registeredCharacteristicClasses, "setObject:forKeyedSubscript:", a3, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_sync_exit(v4);
}

void __49__CAFCharacteristic_registerCharacteristicClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_registeredCharacteristicClasses;
  _registeredCharacteristicClasses = v0;

}

+ (id)registeredCharacteristicClasses
{
  id v2;
  void *v3;

  v2 = (id)_registeredCharacteristicClasses;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend((id)_registeredCharacteristicClasses, "copy");
  objc_sync_exit(v2);

  return v3;
}

+ (id)characteristicWithService:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFCharacteristic registeredCharacteristicClasses](CAFCharacteristic, "registeredCharacteristicClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v7);

  if (!v9)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("format"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCharacteristicMetadataFormat((int)objc_msgSend(v10, "intValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || (+[CAFCharacteristic registeredCharacteristicClasses](CAFCharacteristic, "registeredCharacteristicClasses"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v9 = (objc_class *)objc_msgSend(v12, "objectForKeyedSubscript:", v11), v12, v11, !v9))
    {
      v9 = (objc_class *)objc_opt_class();
    }
  }
  v13 = (void *)objc_msgSend([v9 alloc], "initWithService:config:", v6, v5);

  return v13;
}

- (CAFCharacteristic)initWithService:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  CAFCharacteristic *v8;
  CAFCharacteristic *v9;
  id v10;
  NSNumber *v11;
  NSNumber *instanceID;
  id v13;
  NSNumber *v14;
  NSNumber *errorInstanceID;
  id v16;
  NSNumber *v17;
  NSNumber *disabledInstanceID;
  id v19;
  NSNumber *v20;
  NSNumber *notifierInstanceID;
  id v22;
  NSNumber *v23;
  NSNumber *restrictedInstanceID;
  uint64_t v25;
  NSString *characteristicType;
  void *v27;
  uint64_t v28;
  NSUUID *uniqueIdentifier;
  uint64_t v30;
  NSString *typeName;
  void *v32;
  void *v33;
  int v34;
  CAFCharacteristicValue *v35;
  void *v36;
  NSObject *v37;
  CAFCharacteristic *v38;
  uint64_t v39;
  CAFCharacteristicValue *characteristicValue;
  CAFCharacteristicMetadata *v41;
  CAFCharacteristicMetadata *metaData;
  id v43;
  NSNumber *v44;
  NSNumber *priority;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  CARObserverHashTable *observers;
  CAFCachedDescription *v52;
  CAFCachedDescription *cachedDescription;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  objc_super v58;

  v6 = a3;
  v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)CAFCharacteristic;
  v8 = -[CAFCharacteristic init](&v58, sel_init);
  v9 = v8;
  if (!v8)
    goto LABEL_52;
  v8->_valueLock._os_unfair_lock_opaque = 0;
  objc_storeWeak((id *)&v8->_service, v6);
  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iid"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
    v11 = (NSNumber *)v10;
  else
    v11 = 0;

  instanceID = v9->_instanceID;
  v9->_instanceID = v11;

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iidError"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_opt_isKindOfClass() & 1) != 0)
    v14 = (NSNumber *)v13;
  else
    v14 = 0;

  errorInstanceID = v9->_errorInstanceID;
  v9->_errorInstanceID = v14;

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iidDisabled"));
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v16 && (objc_opt_isKindOfClass() & 1) != 0)
    v17 = (NSNumber *)v16;
  else
    v17 = 0;

  disabledInstanceID = v9->_disabledInstanceID;
  v9->_disabledInstanceID = v17;

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iidNotifier"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19 && (objc_opt_isKindOfClass() & 1) != 0)
    v20 = (NSNumber *)v19;
  else
    v20 = 0;

  notifierInstanceID = v9->_notifierInstanceID;
  v9->_notifierInstanceID = v20;

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iidRestricted"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v22 && (objc_opt_isKindOfClass() & 1) != 0)
    v23 = (NSNumber *)v22;
  else
    v23 = 0;

  restrictedInstanceID = v9->_restrictedInstanceID;
  v9->_restrictedInstanceID = v23;

  if (!v9->_instanceID)
  {
    CAFCharacteristicLogging();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CAFCharacteristic initWithService:config:].cold.1(v6);
    goto LABEL_31;
  }
  +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7);
  v25 = objc_claimAutoreleasedReturnValue();
  characteristicType = v9->_characteristicType;
  v9->_characteristicType = (NSString *)v25;

  if (!v9->_characteristicType)
  {
    CAFCharacteristicLogging();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CAFCharacteristic initWithService:config:].cold.2(v6);
LABEL_31:

    goto LABEL_32;
  }
  objc_msgSend(v6, "pluginID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFCarConfiguration getUUID:instanceID:](CAFCarConfiguration, "getUUID:instanceID:", v27, v9->_instanceID);
  v28 = objc_claimAutoreleasedReturnValue();
  uniqueIdentifier = v9->_uniqueIdentifier;
  v9->_uniqueIdentifier = (NSUUID *)v28;

  +[CAFCharacteristicTypes characteristicNameForType:](CAFCharacteristicTypes, "characteristicNameForType:", v9->_characteristicType);
  v30 = objc_claimAutoreleasedReturnValue();
  typeName = v9->_typeName;
  v9->_typeName = (NSString *)v30;

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("initialValue"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v9->_hasInitialValue = 1;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v32, "isEqual:", v33);

    v35 = [CAFCharacteristicValue alloc];
    if (v34)
      v36 = 0;
    else
      v36 = v32;
    v39 = -[CAFCharacteristicValue initWithValue:error:](v35, "initWithValue:error:", v36, 0);
    characteristicValue = v9->_characteristicValue;
    v9->_characteristicValue = (CAFCharacteristicValue *)v39;

  }
  v41 = -[CAFCharacteristicMetadata initWithConfig:]([CAFCharacteristicMetadata alloc], "initWithConfig:", v7);
  metaData = v9->_metaData;
  v9->_metaData = v41;

  if (v9->_metaData)
  {
    v9->_writable = +[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v7, CFSTR("writable"));
    v9->_isMutable = +[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v7, CFSTR("mutable"));
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("priority"));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    if (v43 && (objc_opt_isKindOfClass() & 1) != 0)
      v44 = (NSNumber *)v43;
    else
      v44 = 0;

    priority = v9->_priority;
    v9->_priority = v44;

    v9->_hasLargePayload = +[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v7, CFSTR("largePayload"));
    v9->_supportsInvalid = +[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v7, CFSTR("supportsInvalid"));
    v9->_isNotificationEnabled = 0;
    -[CAFCharacteristic car](v9, "car");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "carManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_shouldInitialize = objc_msgSend(v47, "shouldInitializeCharacteristic:", v9);

    v48 = objc_alloc(MEMORY[0x24BE15228]);
    objc_msgSend((id)objc_opt_class(), "observerProtocol");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v48, "initWithProtocol:", v49);
    observers = v9->_observers;
    v9->_observers = (CARObserverHashTable *)v50;

    v52 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v9);
    cachedDescription = v9->_cachedDescription;
    v9->_cachedDescription = v52;

    -[CAFCharacteristic setCachedValueIfAvailableForGroupUpdate:](v9, "setCachedValueIfAvailableForGroupUpdate:", 0);
    if (v9->_shouldInitialize)
    {
      if (!-[CAFCharacteristic shouldDeferInitialization](v9, "shouldDeferInitialization"))
      {
LABEL_51:

LABEL_52:
        v38 = v9;
        goto LABEL_53;
      }
      CAFCharacteristicLogging();
      v54 = objc_claimAutoreleasedReturnValue();
      v55 = 2;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        -[CAFCharacteristic initWithService:config:].cold.5();
        v55 = 2;
      }
    }
    else
    {
      CAFCharacteristicLogging();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        -[CAFCharacteristic initWithService:config:].cold.4();
      v55 = 1;
    }

    os_unfair_lock_lock(&v9->_valueLock);
    -[CAFCharacteristic setLockState:](v9, "setLockState:", v55);
    os_unfair_lock_unlock(&v9->_valueLock);
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](v9, "_didUpdateFromGroupUpdate:", 0);
    goto LABEL_51;
  }
  CAFCharacteristicLogging();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    -[CAFCharacteristic initWithService:config:].cold.3(v6);

LABEL_32:
  v38 = 0;
LABEL_53:

  return v38;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CAFCharacteristic car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableNotificationForCharacteristic:enable:response:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)CAFCharacteristic;
  -[CAFCharacteristic dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CAFCharacteristic uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CAFCharacteristic *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CAFCharacteristic *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CAFCharacteristic uniqueIdentifier](v4, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFCharacteristic uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (CAFCar)car
{
  void *v2;
  void *v3;

  -[CAFCharacteristic accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFCar *)v3;
}

- (CAFAccessory)accessory
{
  void *v2;
  void *v3;

  -[CAFCharacteristic service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFAccessory *)v3;
}

- (BOOL)isCurrent
{
  CAFCharacteristic *v2;
  os_unfair_lock_s *p_valueLock;

  v2 = self;
  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  LOBYTE(v2) = CAFCharacteristicStateIsCurrent(-[CAFCharacteristic lockState](v2, "lockState"));
  os_unfair_lock_unlock(p_valueLock);
  return (char)v2;
}

- (BOOL)isInitializing
{
  char IsInitializing;

  if (-[CAFCharacteristic initializationFinished](self, "initializationFinished"))
    return 0;
  os_unfair_lock_lock(&self->_valueLock);
  IsInitializing = CAFCharacteristicStateIsInitializing(-[CAFCharacteristic lockState](self, "lockState"));
  if ((IsInitializing & 1) == 0)
    -[CAFCharacteristic setInitializationFinished:](self, "setInitializationFinished:", 1);
  os_unfair_lock_unlock(&self->_valueLock);
  return IsInitializing;
}

- (id)value
{
  os_unfair_lock_s *p_valueLock;
  void *v4;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  if (-[CAFCharacteristic lockState](self, "lockState") > 3)
    -[CAFCharacteristic pendingValue](self, "pendingValue");
  else
    -[CAFCharacteristic cachedValue](self, "cachedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (void)setValue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[CAFCharacteristic writable](self, "writable"))
  {
    if (-[CAFCharacteristic isDisabled](self, "isDisabled"))
    {
      CAFCharacteristicLogging();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[CAFCharacteristic setValue:].cold.1();
      goto LABEL_19;
    }
    v7 = -[CAFCharacteristic isInitializing](self, "isInitializing");
    CAFCharacteristicLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v8)
        -[CAFCharacteristic setValue:].cold.2();
      goto LABEL_19;
    }
    if (v8)
      -[CAFCharacteristic setValue:].cold.3();

    CARSignpostLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (self)
    {
      CARSignpostLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_signpost_id_make_with_pointer(v10, self);

      if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_18:

        os_unfair_lock_lock(&self->_valueLock);
        -[CAFCharacteristic setLockState:](self, "setLockState:", 5);
        v19 = 0;
        -[CAFCharacteristic encodeValue:error:](self, "encodeValue:error:", v4, &v19);
        v5 = objc_claimAutoreleasedReturnValue();
        v15 = v19;
        -[CAFCharacteristic _lock_setError:](self, "_lock_setError:", v15);
        -[CAFCharacteristic setPendingValue:](self, "setPendingValue:", v4);
        -[CAFCharacteristic setTransactionId:](self, "setTransactionId:", -[CAFCharacteristic transactionId](self, "transactionId") + 1);
        os_unfair_lock_unlock(&self->_valueLock);
        -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
        objc_initWeak((id *)buf, self);
        -[CAFCharacteristic car](self, "car");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x24BDAC760];
        v17[1] = 3221225472;
        v17[2] = __30__CAFCharacteristic_setValue___block_invoke;
        v17[3] = &unk_2508FF390;
        objc_copyWeak(&v18, (id *)buf);
        objc_msgSend(v16, "writeCharacteristic:value:response:", self, v5, v17);

        objc_destroyWeak(&v18);
        objc_destroyWeak((id *)buf);

        goto LABEL_19;
      }
    }
    else
    {
      v11 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v9))
    {
      -[CAFCharacteristic name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFCharacteristic pluginID](self, "pluginID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFCharacteristic instanceID](self, "instanceID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v21 = v12;
      v22 = 2114;
      v23 = v13;
      v24 = 2114;
      v25 = v14;
      _os_signpost_emit_with_name_impl(&dword_237717000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Set", "Characteristic: %{public}@ pluginID: %{public}@ instanceID: %{public}@", buf, 0x20u);

    }
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "CAF_writeToReadonlyError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic setError:](self, "setError:", v6);

  CAFCharacteristicLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CAFCharacteristic setValue:].cold.4();
LABEL_19:

}

void __30__CAFCharacteristic_setValue___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint8_t v9[16];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleWrite:value:", v5, v3);

  CARSignpostLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    CARSignpostLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, WeakRetained);

    if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    v8 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_237717000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Set", (const char *)&unk_2377DBA75, v9, 2u);
  }
LABEL_7:

}

- (void)groupInitializationRequested
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ groupInitializationRequested", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (BOOL)setCachedValueIfAvailableForGroupUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  CAFCharacteristic *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x24BDAC8D0];
  -[CAFCharacteristic characteristicValue](self, "characteristicValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFCharacteristic characteristicValue](self, "characteristicValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[CAFCharacteristic characteristicValue](self, "characteristicValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      -[CAFCharacteristic decodeValue:error:](self, "decodeValue:error:", v8, &v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v14;

    }
    else
    {
      v9 = 0;
      v10 = 0;
    }

    CAFCharacteristicLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v13 = CFSTR("YES");
      *(_DWORD *)buf = 138543874;
      v16 = self;
      v17 = 2112;
      if (!v9)
        v13 = CFSTR("NO");
      v18 = v13;
      v19 = 2112;
      v20 = v10;
      _os_log_debug_impl(&dword_237717000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ value set %@ decodeError=%@", buf, 0x20u);
    }

    os_unfair_lock_lock(&self->_valueLock);
    -[CAFCharacteristic setCachedValue:](self, "setCachedValue:", v9);
    -[CAFCharacteristic setPendingValue:](self, "setPendingValue:", 0);
    -[CAFCharacteristic setLockState:](self, "setLockState:", 3);
    -[CAFCharacteristic _lock_setError:](self, "_lock_setError:", v10);
    -[CAFCharacteristic setTransactionId:](self, "setTransactionId:", -[CAFCharacteristic transactionId](self, "transactionId") + 1);
    os_unfair_lock_unlock(&self->_valueLock);
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", v3);

  }
  else
  {
    CAFCharacteristicLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CAFCharacteristic setCachedValueIfAvailableForGroupUpdate:].cold.1();
  }

  return v5 != 0;
}

- (NSString)formattedValue
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[CAFCharacteristic value](self, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("(null)");
  v5 = v3;

  return v5;
}

- (BOOL)isInvalid
{
  void *v2;
  BOOL v3;

  -[CAFCharacteristic cachedValue](self, "cachedValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (BOOL)hasError
{
  void *v2;
  BOOL v3;

  -[CAFCharacteristic error](self, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSError)error
{
  os_unfair_lock_s *p_valueLock;
  void *v4;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  v4 = (void *)-[NSError copy](self->_error, "copy");
  os_unfair_lock_unlock(p_valueLock);
  return (NSError *)v4;
}

- (void)setError:(id)a3
{
  os_unfair_lock_s *p_valueLock;
  id v5;
  _BOOL4 v6;

  p_valueLock = &self->_valueLock;
  v5 = a3;
  os_unfair_lock_lock(p_valueLock);
  v6 = -[CAFCharacteristic _lock_setError:](self, "_lock_setError:", v5);

  os_unfair_lock_unlock(p_valueLock);
  if (v6)
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
}

- (BOOL)_lock_setError:(id)a3
{
  id v5;
  NSError **p_error;
  char v7;

  v5 = a3;
  p_error = &self->_error;
  v7 = BSEqualObjects();
  if ((v7 & 1) == 0)
    objc_storeStrong((id *)p_error, a3);

  return v7 ^ 1;
}

- (void)updateValueRequiringRead:(BOOL)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  CARSignpostLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 0xEEEEB0B5B2B2EEEELL;
  v7 = 0xEEEEB0B5B2B2EEEELL;
  if (!self
    || (CARSignpostLogForCategory(),
        v8 = objc_claimAutoreleasedReturnValue(),
        v7 = os_signpost_id_make_with_pointer(v8, self),
        v8,
        v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
  {
    if (os_signpost_enabled(v5))
    {
      -[CAFCharacteristic name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFCharacteristic pluginID](self, "pluginID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFCharacteristic instanceID](self, "instanceID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v9;
      v33 = 2114;
      v34 = v10;
      v35 = 2114;
      v36 = v11;
      _os_signpost_emit_with_name_impl(&dword_237717000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Get", "Characteristic: %{public}@ pluginID: %{public}@ instanceID: %{public}@", buf, 0x20u);

    }
  }

  os_unfair_lock_lock(&self->_valueLock);
  if (!-[CAFCharacteristic readable](self, "readable"))
    goto LABEL_9;
  if (!a3)
  {
    -[CAFCharacteristic characteristicValue](self, "characteristicValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if (!v13)
    {
      -[CAFCharacteristic characteristicValue](self, "characteristicValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      -[CAFCharacteristic decodeValue:error:](self, "decodeValue:error:", v15, &v30);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v30;

      -[CAFCharacteristic _lock_setError:](self, "_lock_setError:", v17);
      -[CAFCharacteristic setCachedValue:](self, "setCachedValue:", v16);
      -[CAFCharacteristic setPendingValue:](self, "setPendingValue:", 0);
      -[CAFCharacteristic setLockState:](self, "setLockState:", 3);

LABEL_9:
      os_unfair_lock_unlock(&self->_valueLock);
      -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
LABEL_12:
      CAFCharacteristicLogging();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[CAFCharacteristic updateValueRequiringRead:].cold.1(self);

      CARSignpostLogForCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!self
        || (CARSignpostLogForCategory(),
            v20 = objc_claimAutoreleasedReturnValue(),
            v6 = os_signpost_id_make_with_pointer(v20, self),
            v20,
            v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
      {
        if (os_signpost_enabled(v19))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_237717000, v19, OS_SIGNPOST_INTERVAL_END, v6, "Get", "Bailed", buf, 2u);
        }
      }

      return;
    }
  }
  if (-[CAFCharacteristic lockState](self, "lockState") == 4)
  {
    os_unfair_lock_unlock(&self->_valueLock);
    goto LABEL_12;
  }
  if (-[CAFCharacteristic lockState](self, "lockState") > 3)
  {
    -[CAFCharacteristic setTransactionId:](self, "setTransactionId:", -[CAFCharacteristic transactionId](self, "transactionId") + 1);
    os_unfair_lock_unlock(&self->_valueLock);
  }
  else
  {
    -[CAFCharacteristic characteristicValue](self, "characteristicValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    -[CAFCharacteristic decodeValue:error:](self, "decodeValue:error:", v22, &v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v29;
    -[CAFCharacteristic setPendingValue:](self, "setPendingValue:", v23);

    -[CAFCharacteristic _lock_setError:](self, "_lock_setError:", v24);
    -[CAFCharacteristic setLockState:](self, "setLockState:", 4);
    -[CAFCharacteristic setTransactionId:](self, "setTransactionId:", -[CAFCharacteristic transactionId](self, "transactionId") + 1);
    os_unfair_lock_unlock(&self->_valueLock);
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
  }
  CAFCharacteristicLogging();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[CAFCharacteristic updateValueRequiringRead:].cold.2(self);

  objc_initWeak((id *)buf, self);
  -[CAFCharacteristic car](self, "car");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __46__CAFCharacteristic_updateValueRequiringRead___block_invoke;
  v27[3] = &unk_2508FF390;
  objc_copyWeak(&v28, (id *)buf);
  objc_msgSend(v26, "readCharacteristic:response:", self, v27);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

void __46__CAFCharacteristic_updateValueRequiringRead___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  uint8_t v9[16];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "handleRead:value:", v5, v3);

  CARSignpostLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (WeakRetained)
  {
    CARSignpostLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_signpost_id_make_with_pointer(v7, WeakRetained);

    if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    v8 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_237717000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Get", (const char *)&unk_2377DBA75, v9, 2u);
  }
LABEL_7:

}

- (void)_readValueCompletionTransactionID:(unint64_t)a3 error:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  os_unfair_lock_lock(&self->_valueLock);
  v7 = -[CAFCharacteristic transactionId](self, "transactionId");
  if (v7 == a3)
  {
    -[CAFCharacteristic characteristicValue](self, "characteristicValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    -[CAFCharacteristic decodeValue:error:](self, "decodeValue:error:", v9, &v17);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v17;

    if (v6)
      v12 = v6;
    else
      v12 = v11;
    -[CAFCharacteristic _lock_setError:](self, "_lock_setError:", v12);
    -[CAFCharacteristic setCachedValue:](self, "setCachedValue:", v10);

    -[CAFCharacteristic setPendingValue:](self, "setPendingValue:", 0);
    -[CAFCharacteristic setLockState:](self, "setLockState:", 3);
    os_unfair_lock_unlock(&self->_valueLock);
    CAFCharacteristicLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[CAFCharacteristic fullDescription](self, "fullDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v16;
      v20 = 2114;
      v21 = (unint64_t)v10;
      v22 = 2114;
      v23 = (unint64_t)v6;
      _os_log_debug_impl(&dword_237717000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ readValue completion: value=%{public}@ error=<%{public}@>", buf, 0x20u);

    }
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
  }
  else
  {
    v13 = v7;
    os_unfair_lock_unlock(&self->_valueLock);
    CAFCharacteristicLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      -[CAFCharacteristic fullDescription](self, "fullDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2048;
      v21 = a3;
      v22 = 2048;
      v23 = v13;
      _os_log_debug_impl(&dword_237717000, v10, OS_LOG_TYPE_DEBUG, "%{public}@ readValue completion: transactionID %lu != %lu", buf, 0x20u);

    }
  }

}

- (NSString)format
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "primaryCharacteristicFormat");
}

- (NSString)baseFormat
{
  void *v2;
  void *v3;

  -[CAFCharacteristic metaData](self, "metaData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formatString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)readable
{
  return 1;
}

- (BOOL)hidden
{
  return 0;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFCharacteristic observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFCharacteristic observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFCharacteristic cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (unint64_t)state
{
  os_unfair_lock_s *p_valueLock;
  unint64_t v4;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  v4 = -[CAFCharacteristic lockState](self, "lockState");
  os_unfair_lock_unlock(p_valueLock);
  return v4;
}

- (void)_updateStateIfNeeded
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_13_0();
  NSStringFromCharacteristicState(objc_msgSend(v1, "lastState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCharacteristicState(v0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v3, v4, "%{public}@ lastState=%{public}@ state=%{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_didUpdateFromGroupUpdate:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  dispatch_get_global_queue(33, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__CAFCharacteristic__didUpdateFromGroupUpdate___block_invoke;
  v6[3] = &unk_2508FF3B8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __47__CAFCharacteristic__didUpdateFromGroupUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_updateStateIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_characteristicDidUpdate:fromGroupUpdate:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicDidUpdate:fromGroupUpdate:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)supportsStates
{
  return -[CAFCharacteristic supportsInvalid](self, "supportsInvalid")
      || -[CAFCharacteristic supportsError](self, "supportsError")
      || -[CAFCharacteristic supportsDisable](self, "supportsDisable");
}

- (BOOL)supportsError
{
  void *v2;
  BOOL v3;

  -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsDisable
{
  void *v2;
  BOOL v3;

  -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsRestricted
{
  void *v2;
  BOOL v3;

  -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsNotifier
{
  void *v2;
  BOOL v3;

  -[CAFCharacteristic notifierInstanceID](self, "notifierInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)propertiesDescription
{
  __CFString *v3;
  _BOOL4 v4;
  __CFString *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;

  v3 = &stru_2508FF798;
  if (-[CAFCharacteristic notifies](self, "notifies"))
  {
    v4 = -[CAFCharacteristic isNotificationEnabled](self, "isNotificationEnabled");
    v5 = CFSTR("n");
    if (v4)
      v5 = CFSTR("N");
    v3 = v5;
  }
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (-[CAFCharacteristic readable](self, "readable"))
    v7 = CFSTR("R");
  else
    v7 = &stru_2508FF798;
  if (-[CAFCharacteristic writable](self, "writable"))
    v8 = CFSTR("W");
  else
    v8 = &stru_2508FF798;
  if (-[CAFCharacteristic isMutable](self, "isMutable"))
    v9 = CFSTR("M");
  else
    v9 = &stru_2508FF798;
  if (-[CAFCharacteristic hasInitialValue](self, "hasInitialValue"))
    v10 = CFSTR("I");
  else
    v10 = &stru_2508FF798;
  if (-[CAFCharacteristic hasLargePayload](self, "hasLargePayload"))
    v11 = CFSTR("L");
  else
    v11 = &stru_2508FF798;
  if (-[CAFCharacteristic hidden](self, "hidden"))
    v12 = CFSTR("H");
  else
    v12 = &stru_2508FF798;
  v13 = -[CAFCharacteristic supportsStates](self, "supportsStates");
  v14 = CFSTR("S");
  if (!v13)
    v14 = &stru_2508FF798;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@%@%@%@%@%@%@%@)"), v7, v8, v3, v9, v10, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)allInstanceIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_opt_new();
  -[CAFCharacteristic instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[CAFCharacteristic notifierInstanceID](self, "notifierInstanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CAFCharacteristic notifierInstanceID](self, "notifierInstanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  return v3;
}

- (id)readInstanceIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[CAFCharacteristic instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  return v3;
}

- (id)registrationInstanceIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  if (-[CAFCharacteristic isMutable](self, "isMutable"))
  {
    -[CAFCharacteristic instanceID](self, "instanceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  return v3;
}

- (id)pluginID
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFCharacteristic service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)characteristicFormats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "primaryCharacteristicFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secondaryCharacteristicFormats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)handleValueAndError:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  os_unfair_lock_s *p_valueLock;
  void *v21;
  int v22;
  id v23;
  NSObject *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  NSObject *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CAFCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (!v9)
  {
    -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "isEqual:", v12);

    if (v13)
    {
      objc_opt_class();
      objc_msgSend(v7, "value");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14 && (objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;

      CAFCharacteristicLogging();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        -[CAFCharacteristic pluginID](self, "pluginID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFCharacteristic instanceID](self, "instanceID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 138413058;
        v39 = v32;
        v40 = 2112;
        v41 = v33;
        v42 = 2112;
        v43 = v6;
        v44 = 2112;
        v45 = v15;
        _os_log_debug_impl(&dword_237717000, v19, OS_LOG_TYPE_DEBUG, "Handle error state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v38, 0x2Au);

      }
      p_valueLock = &self->_valueLock;
      os_unfair_lock_lock(&self->_valueLock);
      -[CAFCharacteristic setHasErrorState:](self, "setHasErrorState:", -[NSObject BOOLValue](v15, "BOOLValue"));
    }
    else
    {
      -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v6, "isEqual:", v16);

      if (v17)
      {
        objc_opt_class();
        objc_msgSend(v7, "value");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18 && (objc_opt_isKindOfClass() & 1) != 0)
          v15 = v18;
        else
          v15 = 0;

        CAFCharacteristicLogging();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          -[CAFCharacteristic pluginID](self, "pluginID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAFCharacteristic instanceID](self, "instanceID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138413058;
          v39 = v34;
          v40 = 2112;
          v41 = v35;
          v42 = 2112;
          v43 = v6;
          v44 = 2112;
          v45 = v15;
          _os_log_debug_impl(&dword_237717000, v24, OS_LOG_TYPE_DEBUG, "Handle disabled state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v38, 0x2Au);

        }
        p_valueLock = &self->_valueLock;
        os_unfair_lock_lock(&self->_valueLock);
        -[CAFCharacteristic setIsDisabled:](self, "setIsDisabled:", -[NSObject BOOLValue](v15, "BOOLValue"));
      }
      else
      {
        -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v6, "isEqual:", v21);

        if (!v22)
        {
          -[CAFCharacteristic notifierInstanceID](self, "notifierInstanceID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v6, "isEqual:", v25);

          if (!v26)
            goto LABEL_38;
          CAFCharacteristicLogging();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            -[CAFCharacteristic handleValueAndError:value:].cold.3();

          if (-[CAFCharacteristic shouldInitialize](self, "shouldInitialize"))
          {
            -[CAFCharacteristic service](self, "service");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "observers");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "hasObservers");

            if ((v30 & 1) != 0)
            {
              -[CAFCharacteristic updateValueRequiringRead:](self, "updateValueRequiringRead:", 1);
              goto LABEL_38;
            }
            CAFGeneralLogging();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              -[CAFCharacteristic handleValueAndError:value:].cold.1(self);
          }
          else
          {
            CAFGeneralLogging();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              -[CAFCharacteristic handleValueAndError:value:].cold.2(self);
          }
LABEL_37:

          goto LABEL_38;
        }
        objc_opt_class();
        objc_msgSend(v7, "value");
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23 && (objc_opt_isKindOfClass() & 1) != 0)
          v15 = v23;
        else
          v15 = 0;

        CAFCharacteristicLogging();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          -[CAFCharacteristic pluginID](self, "pluginID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAFCharacteristic instanceID](self, "instanceID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 138413058;
          v39 = v36;
          v40 = 2112;
          v41 = v37;
          v42 = 2112;
          v43 = v6;
          v44 = 2112;
          v45 = v15;
          _os_log_debug_impl(&dword_237717000, v31, OS_LOG_TYPE_DEBUG, "Handle restricted state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v38, 0x2Au);

        }
        p_valueLock = &self->_valueLock;
        os_unfair_lock_lock(&self->_valueLock);
        -[CAFCharacteristic setIsRestricted:](self, "setIsRestricted:", -[NSObject BOOLValue](v15, "BOOLValue"));
      }
    }
    os_unfair_lock_unlock(p_valueLock);
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
    goto LABEL_37;
  }
  os_unfair_lock_lock(&self->_valueLock);
  -[CAFCharacteristic setCharacteristicValue:](self, "setCharacteristicValue:", v7);
  os_unfair_lock_unlock(&self->_valueLock);
  if (v7)
  {
    objc_msgSend(v7, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFCharacteristic setError:](self, "setError:", v11);

    }
  }
  -[CAFCharacteristic setCachedValueIfAvailableForGroupUpdate:](self, "setCachedValueIfAvailableForGroupUpdate:", 0);
LABEL_38:

}

- (void)handleUpdateWithInstanceID:(id)a3 value:(id)a4
{
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[CAFCharacteristic handleValueAndError:value:](self, "handleValueAndError:value:", a3, a4);
  CARSignpostLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (self)
  {
    CARSignpostLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_make_with_pointer(v6, self);

    if (v7 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    v7 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v5))
  {
    -[CAFCharacteristic name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic pluginID](self, "pluginID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFCharacteristic instanceID](self, "instanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_signpost_emit_with_name_impl(&dword_237717000, v5, OS_SIGNPOST_EVENT, v7, "Update", "Characteristic: %{public}@ pluginID: %{public}@ instanceID: %{public}@", (uint8_t *)&v11, 0x20u);

  }
LABEL_7:

}

- (void)handleWrite:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  -[CAFCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    CAFCharacteristicLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CAFCharacteristic handleWrite:value:].cold.1(self, v6, v10);

    if (v6)
    {
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v6, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAFCharacteristic setError:](self, "setError:", v12);

      }
    }
  }

}

- (void)handleError:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;

  v6 = a4;
  v7 = a3;
  -[CAFCharacteristic instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if (v9)
  {
    CAFCharacteristicLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CAFCharacteristic handleError:value:].cold.1();

    -[CAFCharacteristic setError:](self, "setError:", v6);
  }

}

- (void)handleRegistrationWithInstanceID:(id)a3 value:(id)a4 registered:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  int v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v8 = a4;
  -[CAFCharacteristic instanceID](self, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "isEqual:", v9);

  if (v10)
  {
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFCharacteristic setIsNotificationEnabled:](self, "setIsNotificationEnabled:", v5);
    os_unfair_lock_unlock(&self->_valueLock);
  }
  -[CAFCharacteristic handleValueAndError:value:](self, "handleValueAndError:value:", v11, v8);

}

- (void)handleRegistrationWithInstanceID:(id)a3 registered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  -[CAFCharacteristic instanceID](self, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    CAFCharacteristicLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CAFControl handleRegistrationWithInstanceID:registered:].cold.1(self);

    os_unfair_lock_lock(&self->_valueLock);
    -[CAFCharacteristic setIsNotificationEnabled:](self, "setIsNotificationEnabled:", v4);
    os_unfair_lock_unlock(&self->_valueLock);
    -[CAFCharacteristic _didUpdateFromGroupUpdate:](self, "_didUpdateFromGroupUpdate:", 0);
  }
}

+ (id)observerProtocol
{
  return &unk_2568308A8;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("generic");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)descriptionExtras
{
  return &stru_2508FF798;
}

- (id)encodeValue:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)decodeValue:(id)a3 error:(id *)a4
{
  return a3;
}

- (NSString)fullDescription
{
  void *v2;
  os_unfair_lock_s *p_valueLock;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _BOOL4 v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v33;
  unint64_t v34;

  p_valueLock = &self->_valueLock;
  os_unfair_lock_lock(&self->_valueLock);
  v5 = -[CAFCharacteristic lockState](self, "lockState");
  v6 = -[CAFCharacteristic transactionId](self, "transactionId");
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[CAFCharacteristic characteristicValue](self, "characteristicValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CAFCharacteristic characteristicValue](self, "characteristicValue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  -[CAFCharacteristic cachedValue](self, "cachedValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic pendingValue](self, "pendingValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[V:%@ C:%@ P:%@]"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {

  }
  v13 = (__CFString *)-[NSError copy](self->_error, "copy");
  os_unfair_lock_unlock(p_valueLock);
  -[CAFCharacteristic descriptionExtras](self, "descriptionExtras");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "length"))
  {
    v15 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" %@"), v14);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
    v15 = 0x24BDD1000uLL;
  }

  v34 = v6;
  if (-[CAFCharacteristic supportsStates](self, "supportsStates"))
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    if (-[CAFCharacteristic isInvalid](self, "isInvalid"))
      v18 = CFSTR("I");
    else
      v18 = &stru_2508FF798;
    if (-[CAFCharacteristic hasErrorState](self, "hasErrorState"))
      v19 = CFSTR("E");
    else
      v19 = &stru_2508FF798;
    if (-[CAFCharacteristic isDisabled](self, "isDisabled"))
      v20 = CFSTR("D");
    else
      v20 = &stru_2508FF798;
    v21 = -[CAFCharacteristic isRestricted](self, "isRestricted");
    v22 = CFSTR("R");
    if (!v21)
      v22 = &stru_2508FF798;
    v33 = v18;
    v15 = 0x24BDD1000;
    objc_msgSend(v17, "stringWithFormat:", CFSTR(" states=%@%@%@%@"), v33, v19, v20, v22);
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  v24 = *(void **)(v15 + 1992);
  -[CAFCharacteristic description](self, "description");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCharacteristicState(v5);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v23)
    v28 = v23;
  else
    v28 = &stru_2508FF798;
  v29 = CFSTR("NO");
  if (v13)
    v29 = v13;
  if (v16)
    v30 = v16;
  else
    v30 = &stru_2508FF798;
  objc_msgSend(v24, "stringWithFormat:", CFSTR("%@(state=%@(%lu) values=%@%@ error=%@%@)"), v25, v26, v34, v12, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v31;
}

- (BOOL)usable
{
  return 1;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_250958650;
}

- (id)currentDescriptionForCache:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v30 = (void *)MEMORY[0x24BDD17C8];
  v29 = objc_opt_class();
  -[CAFCharacteristic name](self, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic pluginID](self, "pluginID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic instanceID](self, "instanceID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic errorInstanceID](self, "errorInstanceID");
  v4 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("-");
  v26 = v5;
  -[CAFCharacteristic disabledInstanceID](self, "disabledInstanceID");
  v6 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = CFSTR("-");
  v25 = v7;
  -[CAFCharacteristic notifierInstanceID](self, "notifierInstanceID");
  v8 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v8;
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("-");
  v24 = v9;
  -[CAFCharacteristic restrictedInstanceID](self, "restrictedInstanceID");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("-");
  v23 = v12;
  -[CAFCharacteristic characteristicType](self, "characteristicType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic accessory](self, "accessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic accessory](self, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instanceID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "instanceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCharacteristic propertiesDescription](self, "propertiesDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p %@ %@ %@ (%@|%@|%@|%@) type=%@ accessory=(%p)%@ service=(%p)%@ properties=%@>"), v29, self, v28, v34, v27, v26, v25, v24, v23, v22, v21, v14, v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (CAFService)service
{
  return (CAFService *)objc_loadWeakRetained((id *)&self->_service);
}

- (BOOL)hasErrorState
{
  return self->_hasErrorState;
}

- (void)setHasErrorState:(BOOL)a3
{
  self->_hasErrorState = a3;
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void)setIsDisabled:(BOOL)a3
{
  self->_isDisabled = a3;
}

- (BOOL)isRestricted
{
  return self->_isRestricted;
}

- (void)setIsRestricted:(BOOL)a3
{
  self->_isRestricted = a3;
}

- (BOOL)writable
{
  return self->_writable;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSNumber)errorInstanceID
{
  return self->_errorInstanceID;
}

- (NSNumber)disabledInstanceID
{
  return self->_disabledInstanceID;
}

- (NSNumber)notifierInstanceID
{
  return self->_notifierInstanceID;
}

- (NSNumber)restrictedInstanceID
{
  return self->_restrictedInstanceID;
}

- (NSString)characteristicType
{
  return self->_characteristicType;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSString)typeName
{
  return self->_typeName;
}

- (void)setTypeName:(id)a3
{
  objc_storeStrong((id *)&self->_typeName, a3);
}

- (CAFCharacteristicValue)characteristicValue
{
  return self->_characteristicValue;
}

- (void)setCharacteristicValue:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicValue, a3);
}

- (NSNumber)notifierValue
{
  return self->_notifierValue;
}

- (void)setNotifierValue:(id)a3
{
  objc_storeStrong((id *)&self->_notifierValue, a3);
}

- (CAFCharacteristicMetadata)metaData
{
  return self->_metaData;
}

- (BOOL)isMutable
{
  return self->_isMutable;
}

- (NSNumber)priority
{
  return self->_priority;
}

- (BOOL)hasInitialValue
{
  return self->_hasInitialValue;
}

- (BOOL)hasLargePayload
{
  return self->_hasLargePayload;
}

- (BOOL)supportsInvalid
{
  return self->_supportsInvalid;
}

- (BOOL)isNotificationEnabled
{
  return self->_isNotificationEnabled;
}

- (void)setIsNotificationEnabled:(BOOL)a3
{
  self->_isNotificationEnabled = a3;
}

- (BOOL)shouldInitialize
{
  return self->_shouldInitialize;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (BOOL)initializationFinished
{
  return self->_initializationFinished;
}

- (void)setInitializationFinished:(BOOL)a3
{
  self->_initializationFinished = a3;
}

- (unint64_t)lastState
{
  return self->_lastState;
}

- (void)setLastState:(unint64_t)a3
{
  self->_lastState = a3;
}

- (os_unfair_lock_s)valueLock
{
  return self->_valueLock;
}

- (void)setValueLock:(os_unfair_lock_s)a3
{
  self->_valueLock = a3;
}

- (id)cachedValue
{
  return self->_cachedValue;
}

- (void)setCachedValue:(id)a3
{
  objc_storeStrong(&self->_cachedValue, a3);
}

- (id)pendingValue
{
  return self->_pendingValue;
}

- (void)setPendingValue:(id)a3
{
  objc_storeStrong(&self->_pendingValue, a3);
}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (unint64_t)transactionId
{
  return self->_transactionId;
}

- (void)setTransactionId:(unint64_t)a3
{
  self->_transactionId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingValue, 0);
  objc_storeStrong(&self->_cachedValue, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_notifierValue, 0);
  objc_storeStrong((id *)&self->_characteristicValue, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicType, 0);
  objc_storeStrong((id *)&self->_restrictedInstanceID, 0);
  objc_storeStrong((id *)&self->_notifierInstanceID, 0);
  objc_storeStrong((id *)&self->_disabledInstanceID, 0);
  objc_storeStrong((id *)&self->_errorInstanceID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)initWithService:(void *)a1 config:.cold.1(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_237717000, v3, v4, "Parsing characteristic config from pluginID: %@ service instanceID: %@ failed for instanceID", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)initWithService:(void *)a1 config:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Parsing characteristic config from pluginID: %@ instanceID: %@ failed for characteristicType", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)initWithService:(void *)a1 config:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Parsing characteristic config from pluginID: %@ instanceID: %@ failed for metaData", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)initWithService:config:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ shouldInitialize=NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)initWithService:config:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ shouldDefer=YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "%{public}@ characteristic is currently disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setValue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ unable to set value while initializing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setValue:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_11();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_237717000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ setValue: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_6();
}

- (void)setValue:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "%{public}@ characteristic is not writable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setCachedValueIfAvailableForGroupUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ no value to cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)updateValueRequiringRead:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%{public}@ (requireRead=%@) skipping", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)updateValueRequiringRead:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%{public}@ (requireRead=%@) readValue", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)handleValueAndError:(void *)a1 value:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%@ received update for %@ but no service observers, skipping read", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)handleValueAndError:(void *)a1 value:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "service");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_4(&dword_237717000, v2, v3, "%@ received update for uninitialized charcteristic %@, skipping read", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)handleValueAndError:value:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Handle notifier state update pluginID: %@ instanceID: %@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleWrite:(NSObject *)a3 value:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v4;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "pluginID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    objc_msgSend(a2, "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(a2, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR(" error: %@"), v4);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = 1;
    }
    else
    {
      v10 = 0;
      v11 = &stru_2508FF798;
    }
  }
  else
  {
    v10 = 0;
    v11 = &stru_2508FF798;
  }
  *(_DWORD *)buf = 138412802;
  v14 = v8;
  v15 = 2112;
  v16 = v9;
  v17 = 2112;
  v18 = v11;
  _os_log_debug_impl(&dword_237717000, a3, OS_LOG_TYPE_DEBUG, "Handle write pluginID: %@ instanceID: %@%@", buf, 0x20u);
  if (v10)
  {

  }
  if (a2)

}

- (void)handleError:value:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Handle error pluginID: %@ instanceID: %@ error: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

@end
