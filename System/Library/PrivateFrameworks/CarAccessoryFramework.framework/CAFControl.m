@implementation CAFControl

+ (void)load
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    +[CAFControl registerControlClass:](CAFControl, "registerControlClass:", objc_opt_class());
}

+ (void)registerControlClass:(Class)a3
{
  void *v4;
  void *v5;
  id obj;

  if (registerControlClass__onceToken != -1)
    dispatch_once(&registerControlClass__onceToken, &__block_literal_global_0);
  obj = (id)_registeredControlClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredControlClasses;
  -[objc_class controlIdentifier](a3, "controlIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a3, v5);

  objc_sync_exit(obj);
}

void __35__CAFControl_registerControlClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_registeredControlClasses;
  _registeredControlClasses = v0;

}

+ (id)registeredControlClasses
{
  id v2;
  void *v3;

  v2 = (id)_registeredControlClasses;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend((id)_registeredControlClasses, "copy");
  objc_sync_exit(v2);

  return v3;
}

+ (id)controlWithService:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFControl registeredControlClasses](CAFControl, "registeredControlClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v7);

  if (!v9)
    v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend([v9 alloc], "initWithService:config:", v6, v5);

  return v10;
}

- (CAFControl)initWithService:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  CAFControl *v8;
  CAFControl *v9;
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
  NSNumber *restrictedInstanceID;
  uint64_t v22;
  NSString *controlType;
  void *v24;
  uint64_t v25;
  NSUUID *uniqueIdentifier;
  uint64_t v27;
  NSString *typeName;
  id v29;
  NSNumber *v30;
  NSObject *v31;
  NSNumber *priority;
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  NSArray *requestParameters;
  id v40;
  id v41;
  uint64_t v42;
  NSArray *responseParameters;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  CARObserverHashTable *observers;
  CAFCachedDescription *v50;
  CAFCachedDescription *cachedDescription;
  CAFControl *v52;
  objc_super v54;

  v6 = a3;
  v7 = a4;
  v54.receiver = self;
  v54.super_class = (Class)CAFControl;
  v8 = -[CAFControl init](&v54, sel_init);
  v9 = v8;
  if (v8)
  {
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
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iidRestricted"));
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0)
      v20 = (NSNumber *)v19;
    else
      v20 = 0;

    restrictedInstanceID = v9->_restrictedInstanceID;
    v9->_restrictedInstanceID = v20;

    if (v9->_instanceID)
    {
      +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7);
      v22 = objc_claimAutoreleasedReturnValue();
      controlType = v9->_controlType;
      v9->_controlType = (NSString *)v22;

      if (!v9->_controlType)
      {
        CAFControlLogging();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[CAFControl initWithService:config:].cold.2(v6);

        goto LABEL_47;
      }
      objc_msgSend(v6, "pluginID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CAFCarConfiguration getUUID:instanceID:](CAFCarConfiguration, "getUUID:instanceID:", v24, v9->_instanceID);
      v25 = objc_claimAutoreleasedReturnValue();
      uniqueIdentifier = v9->_uniqueIdentifier;
      v9->_uniqueIdentifier = (NSUUID *)v25;

      +[CAFControlTypes controlNameForType:](CAFControlTypes, "controlNameForType:", v9->_controlType);
      v27 = objc_claimAutoreleasedReturnValue();
      typeName = v9->_typeName;
      v9->_typeName = (NSString *)v27;

      objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("priority"));
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (v29 && (objc_opt_isKindOfClass() & 1) != 0)
        v30 = (NSNumber *)v29;
      else
        v30 = 0;

      priority = v9->_priority;
      v9->_priority = v30;

      objc_opt_class();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sender"));
      v33 = (id)objc_claimAutoreleasedReturnValue();
      if (v33 && (objc_opt_isKindOfClass() & 1) != 0)
        v34 = v33;
      else
        v34 = 0;

      if (v34)
      {
        v9->_sender = objc_msgSend(v34, "unsignedIntegerValue");
        v9->_hasResponse = +[CAFCarConfiguration getBoolean:key:](CAFCarConfiguration, "getBoolean:key:", v7, CFSTR("hasResponse"));
        objc_opt_class();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("requestParameters"));
        v35 = (id)objc_claimAutoreleasedReturnValue();
        if (v35 && (objc_opt_isKindOfClass() & 1) != 0)
          v36 = v35;
        else
          v36 = 0;

        +[CAFControlParameter parseParameters:](CAFControlParameter, "parseParameters:", v36);
        v38 = objc_claimAutoreleasedReturnValue();
        requestParameters = v9->_requestParameters;
        v9->_requestParameters = (NSArray *)v38;

        objc_opt_class();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("responseParameters"));
        v40 = (id)objc_claimAutoreleasedReturnValue();
        if (v40 && (objc_opt_isKindOfClass() & 1) != 0)
          v41 = v40;
        else
          v41 = 0;

        +[CAFControlParameter parseParameters:](CAFControlParameter, "parseParameters:", v41);
        v42 = objc_claimAutoreleasedReturnValue();
        responseParameters = v9->_responseParameters;
        v9->_responseParameters = (NSArray *)v42;

        v9->_isNotificationEnabled = 0;
        -[CAFControl car](v9, "car");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "carManager");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_shouldInitialize = objc_msgSend(v45, "shouldInitializeControl:", v9);

        v46 = objc_alloc(MEMORY[0x24BE15228]);
        objc_msgSend((id)objc_opt_class(), "observerProtocol");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v46, "initWithProtocol:", v47);
        observers = v9->_observers;
        v9->_observers = (CARObserverHashTable *)v48;

        v50 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v9);
        cachedDescription = v9->_cachedDescription;
        v9->_cachedDescription = v50;

        goto LABEL_43;
      }
      CAFControlLogging();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CAFControl initWithService:config:].cold.3(v31);
    }
    else
    {
      CAFControlLogging();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CAFControl initWithService:config:].cold.1(v6);
    }

LABEL_47:
    v52 = 0;
    goto LABEL_48;
  }
LABEL_43:
  v52 = v9;
LABEL_48:

  return v52;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CAFControl car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enableNotificationForControl:enable:response:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)CAFControl;
  -[CAFControl dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CAFControl uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CAFControl *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CAFControl *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CAFControl uniqueIdentifier](v4, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFControl uniqueIdentifier](self, "uniqueIdentifier");
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

  -[CAFControl accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFCar *)v3;
}

- (CAFAccessory)accessory
{
  void *v2;
  void *v3;

  -[CAFControl service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFAccessory *)v3;
}

- (BOOL)outgoing
{
  return -[CAFControl sender](self, "sender") == 0;
}

- (BOOL)incoming
{
  return -[CAFControl sender](self, "sender") == 1;
}

- (BOOL)notifies
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[CAFControl incoming](self, "incoming"))
    return 1;
  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v3 = 1;
  }
  else
  {
    -[CAFControl disabledInstanceID](self, "disabledInstanceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v3 = 1;
    }
    else
    {
      -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v6 != 0;

    }
  }

  return v3;
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
  -[CAFControl observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFControl observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFControl cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (void)_didUpdate
{
  NSObject *v3;
  _QWORD block[5];

  dispatch_get_global_queue(33, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__CAFControl__didUpdate__block_invoke;
  block[3] = &unk_2508FD218;
  block[4] = self;
  dispatch_async(v3, block);

}

void __24__CAFControl__didUpdate__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_controlDidUpdate:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)requestWithValue:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;

  v6 = a3;
  v7 = a4;
  if (!-[CAFControl outgoing](self, "outgoing"))
  {
    if (!v7)
      goto LABEL_9;
    dispatch_get_global_queue(33, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__CAFControl_requestWithValue_response___block_invoke;
    block[3] = &unk_2508FD320;
    v17 = v7;
    dispatch_async(v11, block);

    v12 = v17;
LABEL_8:

    goto LABEL_9;
  }
  v8 = -[CAFControl hasResponse](self, "hasResponse");
  -[CAFControl car](self, "car");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    objc_msgSend(v9, "notifyControl:value:", self, v6);

    if (!v7)
      goto LABEL_9;
    dispatch_get_global_queue(33, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __40__CAFControl_requestWithValue_response___block_invoke_2;
    v14[3] = &unk_2508FD320;
    v15 = v7;
    dispatch_async(v13, v14);

    v12 = v15;
    goto LABEL_8;
  }
  objc_msgSend(v9, "requestControl:value:response:", self, v6, v7);

LABEL_9:
}

void __40__CAFControl_requestWithValue_response___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 10, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

uint64_t __40__CAFControl_requestWithValue_response___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)notifyWithValue:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[CAFControl outgoing](self, "outgoing"))
  {
    v4 = -[CAFControl hasResponse](self, "hasResponse");
    -[CAFControl car](self, "car");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "requestControl:value:response:", self, v7, 0);
    else
      objc_msgSend(v5, "notifyControl:value:", self, v7);

  }
}

- (BOOL)supportsStates
{
  return -[CAFControl supportsError](self, "supportsError") || -[CAFControl supportsDisable](self, "supportsDisable");
}

- (BOOL)supportsError
{
  void *v2;
  BOOL v3;

  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsDisable
{
  void *v2;
  BOOL v3;

  -[CAFControl disabledInstanceID](self, "disabledInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)supportsRestricted
{
  void *v2;
  BOOL v3;

  -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)propertiesDescription
{
  _BOOL4 v3;
  BOOL v4;
  __CFString *v5;
  _BOOL4 v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  _BOOL4 v12;
  const __CFString *v13;
  void *v14;

  v3 = -[CAFControl hasResponse](self, "hasResponse");
  v4 = -[CAFControl outgoing](self, "outgoing");
  if (v3)
  {
    v5 = CFSTR("C");
    if (v4)
      goto LABEL_8;
    v6 = -[CAFControl isNotificationEnabled](self, "isNotificationEnabled");
    v7 = CFSTR("c");
  }
  else
  {
    v5 = CFSTR("E");
    if (v4)
      goto LABEL_8;
    v6 = -[CAFControl isNotificationEnabled](self, "isNotificationEnabled");
    v7 = CFSTR("e");
  }
  if (!v6)
    v5 = (__CFString *)v7;
LABEL_8:
  v8 = v5;
  v9 = (void *)MEMORY[0x24BDD17C8];
  if (-[CAFControl outgoing](self, "outgoing"))
    v10 = CFSTR("O");
  else
    v10 = CFSTR("I");
  if (-[CAFControl hidden](self, "hidden"))
    v11 = CFSTR("H");
  else
    v11 = &stru_2508FF798;
  v12 = -[CAFControl supportsStates](self, "supportsStates");
  v13 = CFSTR("S");
  if (!v12)
    v13 = &stru_2508FF798;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@%@%@%@)"), v10, v8, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)_appendParametersDescription:(id)a3 parameters:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
          objc_msgSend(v5, "appendString:", CFSTR("("));
          objc_msgSend(v12, "formatString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v13);

          if (objc_msgSend(v12, "supportsInvalid"))
            objc_msgSend(v5, "appendString:", CFSTR("?"));
          objc_msgSend(v5, "appendString:", CFSTR(") "));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }

}

- (id)parametersDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("( "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl requestParameters](self, "requestParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "appendString:", CFSTR("in: "));
    -[CAFControl requestParameters](self, "requestParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFControl _appendParametersDescription:parameters:](CAFControl, "_appendParametersDescription:parameters:", v3, v6);

  }
  -[CAFControl responseParameters](self, "responseParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v3, "appendString:", CFSTR("out: "));
    -[CAFControl responseParameters](self, "responseParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CAFControl _appendParametersDescription:parameters:](CAFControl, "_appendParametersDescription:parameters:", v3, v9);

  }
  else if (!v5)
  {
    objc_msgSend(v3, "appendString:", CFSTR("void "));
  }
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
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

  v3 = (void *)objc_opt_new();
  -[CAFControl instanceID](self, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFControl errorInstanceID](self, "errorInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[CAFControl disabledInstanceID](self, "disabledInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CAFControl disabledInstanceID](self, "disabledInstanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

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

  v3 = (void *)objc_opt_new();
  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CAFControl errorInstanceID](self, "errorInstanceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[CAFControl disabledInstanceID](self, "disabledInstanceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CAFControl disabledInstanceID](self, "disabledInstanceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

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
  if (-[CAFControl incoming](self, "incoming"))
  {
    -[CAFControl instanceID](self, "instanceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CAFControl errorInstanceID](self, "errorInstanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[CAFControl disabledInstanceID](self, "disabledInstanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[CAFControl disabledInstanceID](self, "disabledInstanceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
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

  -[CAFControl service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pluginID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)handleNotificationWithValue:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  CAFControlLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CAFControl handleNotificationWithValue:].cold.1(self);

  dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__CAFControl_handleNotificationWithValue___block_invoke;
  v8[3] = &unk_2508FD240;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __42__CAFControl_handleNotificationWithValue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_didNotifyWithValue:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "control:didNotifyWithValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)handleRequestWithValue:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  CAFControlLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CAFControl handleRequestWithValue:withResponse:].cold.1(self);

  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__CAFControl_handleRequestWithValue_withResponse___block_invoke;
  block[3] = &unk_2508FD400;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, block);

}

void __50__CAFControl_handleRequestWithValue_withResponse___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_QWORD *, void *, _BYTE *);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v18 = objc_msgSend(*(id *)(a1 + 32), "_didRequestWithValue:response:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (!*((_BYTE *)v16 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __50__CAFControl_handleRequestWithValue_withResponse___block_invoke_2;
    v10 = &unk_2508FD3D8;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v14 = &v15;
    v11 = v3;
    v12 = v4;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v2, "enumerateObserversWithBlock:", &v7);

    if (!*((_BYTE *)v16 + 24))
    {
      v5 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0, v7, v8, v9, v10, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

    }
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __50__CAFControl_handleRequestWithValue_withResponse___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "control:didRequestWithValue:response:", a1[4], a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    *a3 = 1;
  return result;
}

- (void)handleValueAndError:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  os_unfair_lock_s *p_valueLock;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    objc_opt_class();
    objc_msgSend(v7, "value");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    CAFControlLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      -[CAFControl pluginID](self, "pluginID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFControl instanceID](self, "instanceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = v22;
      v30 = 2112;
      v31 = v23;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v11;
      _os_log_debug_impl(&dword_237717000, v15, OS_LOG_TYPE_DEBUG, "Handle control error state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v28, 0x2Au);

    }
    p_valueLock = &self->_valueLock;
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setHasErrorState:](self, "setHasErrorState:", objc_msgSend(v11, "BOOLValue"));
LABEL_25:
    os_unfair_lock_unlock(p_valueLock);
    -[CAFControl _didUpdate](self, "_didUpdate");

    goto LABEL_26;
  }
  -[CAFControl disabledInstanceID](self, "disabledInstanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "isEqual:", v12);

  if (v13)
  {
    objc_opt_class();
    objc_msgSend(v7, "value");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v14;
    else
      v11 = 0;

    CAFControlLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      -[CAFControl pluginID](self, "pluginID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFControl instanceID](self, "instanceID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = v24;
      v30 = 2112;
      v31 = v25;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v11;
      _os_log_debug_impl(&dword_237717000, v20, OS_LOG_TYPE_DEBUG, "Handle control disabled state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v28, 0x2Au);

    }
    p_valueLock = &self->_valueLock;
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setIsDisabled:](self, "setIsDisabled:", objc_msgSend(v11, "BOOLValue"));
    goto LABEL_25;
  }
  -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v6, "isEqual:", v17);

  if (v18)
  {
    objc_opt_class();
    objc_msgSend(v7, "value");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    if (v19 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v19;
    else
      v11 = 0;

    CAFControlLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[CAFControl pluginID](self, "pluginID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAFControl instanceID](self, "instanceID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138413058;
      v29 = v26;
      v30 = 2112;
      v31 = v27;
      v32 = 2112;
      v33 = v6;
      v34 = 2112;
      v35 = v11;
      _os_log_debug_impl(&dword_237717000, v21, OS_LOG_TYPE_DEBUG, "Handle control restricted state update pluginID: %@ instanceID: %@ (%@) state value: %@", (uint8_t *)&v28, 0x2Au);

    }
    p_valueLock = &self->_valueLock;
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setIsRestricted:](self, "setIsRestricted:", objc_msgSend(v11, "BOOLValue"));
    goto LABEL_25;
  }
LABEL_26:

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
  -[CAFControl handleValueAndError:value:](self, "handleValueAndError:value:", a3, a4);
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
    -[CAFControl name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFControl pluginID](self, "pluginID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFControl instanceID](self, "instanceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_signpost_emit_with_name_impl(&dword_237717000, v5, OS_SIGNPOST_EVENT, v7, "Update", "Control: %{public}@ pluginID: %{public}@ instanceID: %{public}@", (uint8_t *)&v11, 0x20u);

  }
LABEL_7:

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
  -[CAFControl instanceID](self, "instanceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "isEqual:", v9);

  if (v10)
  {
    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setIsNotificationEnabled:](self, "setIsNotificationEnabled:", v5);
    os_unfair_lock_unlock(&self->_valueLock);
  }
  -[CAFControl handleValueAndError:value:](self, "handleValueAndError:value:", v11, v8);

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
  -[CAFControl instanceID](self, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    CAFCharacteristicLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[CAFControl handleRegistrationWithInstanceID:registered:].cold.1(self);

    os_unfair_lock_lock(&self->_valueLock);
    -[CAFControl setIsNotificationEnabled:](self, "setIsNotificationEnabled:", v4);
    os_unfair_lock_unlock(&self->_valueLock);
    -[CAFControl _didUpdate](self, "_didUpdate");
  }
}

+ (id)controlIdentifier
{
  return &stru_2508FF798;
}

+ (id)observerProtocol
{
  return &unk_256824918;
}

- (BOOL)_didRequestWithValue:(id)a3 response:(id)a4
{
  return 0;
}

- (NSString)fullDescription
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  _BOOL4 v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  if (-[CAFControl supportsStates](self, "supportsStates"))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    if (-[CAFControl hasErrorState](self, "hasErrorState"))
      v4 = CFSTR("E");
    else
      v4 = &stru_2508FF798;
    if (-[CAFControl isDisabled](self, "isDisabled"))
      v5 = CFSTR("D");
    else
      v5 = &stru_2508FF798;
    v6 = -[CAFControl isRestricted](self, "isRestricted");
    v7 = CFSTR("R");
    if (!v6)
      v7 = &stru_2508FF798;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(" states=%@%@%@"), v4, v5, v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  -[CAFControl description](self, "description");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
    v12 = v8;
  else
    v12 = &stru_2508FF798;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@(%@)"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
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
  return (NSArray *)&unk_250958578;
}

- (id)currentDescriptionForCache:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v28 = (void *)MEMORY[0x24BDD17C8];
  v27 = objc_opt_class();
  -[CAFControl name](self, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl pluginID](self, "pluginID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl instanceID](self, "instanceID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl errorInstanceID](self, "errorInstanceID");
  v4 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = CFSTR("-");
  v23 = v5;
  -[CAFControl disabledInstanceID](self, "disabledInstanceID");
  v6 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = CFSTR("-");
  v22 = v7;
  -[CAFControl restrictedInstanceID](self, "restrictedInstanceID");
  v8 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v8;
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = CFSTR("-");
  v21 = v9;
  -[CAFControl controlType](self, "controlType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl parametersDescription](self, "parametersDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl accessory](self, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "instanceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFControl propertiesDescription](self, "propertiesDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@: %p %@ %@ %@ (%@|%@|%@) type=%@ parameters=%@ accessory=(%p)%@ service=(%p)%@ properties=%@>"), v27, self, v26, v31, v24, v23, v22, v21, v20, v19, v10, v12, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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

- (BOOL)hasResponse
{
  return self->_hasResponse;
}

- (NSArray)requestParameters
{
  return self->_requestParameters;
}

- (NSArray)responseParameters
{
  return self->_responseParameters;
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

- (NSNumber)restrictedInstanceID
{
  return self->_restrictedInstanceID;
}

- (NSString)controlType
{
  return self->_controlType;
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

- (NSNumber)priority
{
  return self->_priority;
}

- (unint64_t)sender
{
  return self->_sender;
}

- (void)setSender:(unint64_t)a3
{
  self->_sender = a3;
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

- (os_unfair_lock_s)valueLock
{
  return self->_valueLock;
}

- (void)setValueLock:(os_unfair_lock_s)a3
{
  self->_valueLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_priority, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_controlType, 0);
  objc_storeStrong((id *)&self->_restrictedInstanceID, 0);
  objc_storeStrong((id *)&self->_disabledInstanceID, 0);
  objc_storeStrong((id *)&self->_errorInstanceID, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_responseParameters, 0);
  objc_storeStrong((id *)&self->_requestParameters, 0);
  objc_destroyWeak((id *)&self->_service);
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
  OUTLINED_FUNCTION_1(&dword_237717000, v3, v4, "Parsing control config from pluginID: %@ service instanceID: %@ failed for instanceID", v5, v6, v7, v8, 2u);

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

  objc_msgSend(a1, "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Parsing control config from pluginID: %@ instanceID: %@ failed for controlType", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)initWithService:(os_log_t)log config:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_237717000, log, OS_LOG_TYPE_ERROR, "Parsing control failed for sender", v1, 2u);
}

- (void)handleNotificationWithValue:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Handle notification pluginID: %@ instanceID: %@ value: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleRequestWithValue:(void *)a1 withResponse:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Handle request pluginID: %@ instanceID: %@ value: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)handleRegistrationWithInstanceID:(void *)a1 registered:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "pluginID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_237717000, v4, v5, "Handle registration pluginID: %@ instanceID: %@ registered: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
