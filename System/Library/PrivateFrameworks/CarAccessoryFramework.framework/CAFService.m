@implementation CAFService

+ (void)load
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    +[CAFService registerServiceClass:](CAFService, "registerServiceClass:", objc_opt_class());
}

+ (void)registerServiceClass:(Class)a3
{
  void *v4;
  void *v5;
  id obj;

  if (registerServiceClass__onceToken != -1)
    dispatch_once(&registerServiceClass__onceToken, &__block_literal_global);
  obj = (id)_registeredServiceClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredServiceClasses;
  -[objc_class serviceType](a3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a3, v5);

  objc_sync_exit(obj);
}

void __35__CAFService_registerServiceClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_registeredServiceClasses;
  _registeredServiceClasses = v0;

}

+ (id)registeredServiceClasses
{
  id v2;
  void *v3;

  v2 = (id)_registeredServiceClasses;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend((id)_registeredServiceClasses, "copy");
  objc_sync_exit(v2);

  return v3;
}

+ (id)serviceWithAccessory:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;

  v5 = a4;
  v6 = a3;
  +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFService registeredServiceClasses](CAFService, "registeredServiceClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFServiceTypes serviceNameByType](CAFServiceTypes, "serviceNameByType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v10);

  if (!v11)
    v11 = (objc_class *)objc_opt_class();
  v12 = (void *)objc_msgSend([v11 alloc], "initWithAccessory:config:", v6, v5);

  return v12;
}

- (CAFService)initWithAccessory:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  CAFService *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  CAFCachedDescription *v24;
  void *v25;
  CAFValueMonitor *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CAFService *v49;
  NSObject *v50;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  objc_super v64;

  v6 = a3;
  v7 = a4;
  v64.receiver = self;
  v64.super_class = (Class)CAFService;
  v8 = -[CAFService init](&v64, sel_init);
  v9 = (uint64_t)v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_accessory, v6);
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("iid"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 && (objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    v12 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = v11;

    if (*(_QWORD *)(v9 + 48))
    {
      +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(void **)(v9 + 56);
      *(_QWORD *)(v9 + 56) = v13;

      if (*(_QWORD *)(v9 + 56))
      {
        objc_msgSend(v6, "pluginID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[CAFCarConfiguration getUUID:instanceID:](CAFCarConfiguration, "getUUID:instanceID:", v15, *(_QWORD *)(v9 + 48));
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(v9 + 64);
        *(_QWORD *)(v9 + 64) = v16;

        +[CAFServiceTypes serviceNameForType:](CAFServiceTypes, "serviceNameForType:", *(_QWORD *)(v9 + 56));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(v9 + 72);
        *(_QWORD *)(v9 + 72) = v18;

        v20 = objc_alloc(MEMORY[0x24BE15228]);
        objc_msgSend((id)objc_opt_class(), "observerProtocol");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "initWithProtocol:", v21);
        v23 = *(void **)(v9 + 120);
        *(_QWORD *)(v9 + 120) = v22;

        v24 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v9);
        v25 = *(void **)(v9 + 80);
        *(_QWORD *)(v9 + 80) = v24;

        v26 = -[CAFValueMonitor initWithDelegate:]([CAFValueMonitor alloc], "initWithDelegate:", v9);
        v27 = *(void **)(v9 + 88);
        *(_QWORD *)(v9 + 88) = v26;

        v28 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        objc_opt_class();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("characteristics"));
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (v31 && (objc_opt_isKindOfClass() & 1) != 0)
          v32 = v31;
        else
          v32 = 0;

        if (v32)
        {
          v58[0] = MEMORY[0x24BDAC760];
          v58[1] = 3221225472;
          v58[2] = __39__CAFService_initWithAccessory_config___block_invoke;
          v58[3] = &unk_2508FD1A0;
          v59 = v6;
          v60 = (id)v9;
          v61 = v28;
          v62 = v29;
          v63 = v30;
          objc_msgSend(v32, "enumerateObjectsUsingBlock:", v58);

        }
        v52 = v28;
        objc_storeStrong((id *)(v9 + 32), v28);
        objc_storeStrong((id *)(v9 + 96), v29);
        objc_storeStrong((id *)(v9 + 104), v30);
        v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v35 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_opt_class();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("controls"));
        v36 = (id)objc_claimAutoreleasedReturnValue();
        if (v36 && (objc_opt_isKindOfClass() & 1) != 0)
          v37 = v36;
        else
          v37 = 0;

        if (v37)
        {
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __39__CAFService_initWithAccessory_config___block_invoke_26;
          v53[3] = &unk_2508FD1C8;
          v54 = v6;
          v55 = (id)v9;
          v56 = v34;
          v57 = v35;
          objc_msgSend(v37, "enumerateObjectsUsingBlock:", v53);

        }
        objc_storeStrong((id *)(v9 + 40), v34);
        v38 = *(void **)(v9 + 112);
        *(_QWORD *)(v9 + 112) = v35;
        v39 = v35;

        objc_msgSend((id)v9, "cachedDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setNeedsRefreshDescription");

        CAFServiceLogging();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          -[CAFService initWithAccessory:config:].cold.3(v9, v41, v42, v43, v44, v45, v46, v47);

        objc_msgSend(*(id *)(v9 + 88), "signalReadyToMonitor");
        v48 = objc_msgSend(*(id *)(v9 + 88), "receivedAllValues");

        objc_msgSend((id)v9, "setReceivedAllValues:", v48);
        goto LABEL_26;
      }
      CAFServiceLogging();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[CAFService initWithAccessory:config:].cold.2(v6);

    }
    else
    {
      CAFServiceLogging();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[CAFService initWithAccessory:config:].cold.1(v6);

    }
    v49 = 0;
    goto LABEL_31;
  }
LABEL_26:
  v49 = (CAFService *)(id)v9;
LABEL_31:

  return v49;
}

void __39__CAFService_initWithAccessory_config___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
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
  NSObject *v24;
  NSObject *v25;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "car");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "carManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "categoryType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "serviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "shouldAllocAccessoryType:serviceType:characteristicType:", v10, v11, v5);

    if (v12)
    {
      +[CAFCharacteristic characteristicWithService:config:](CAFCharacteristic, "characteristicWithService:config:", *v6, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        if (objc_msgSend(v13, "usable"))
        {
          v15 = *(void **)(a1 + 48);
          objc_msgSend(v14, "uniqueIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

          if ((objc_msgSend(v14, "isCurrent") & 1) == 0)
          {
            v17 = *(void **)(*v6 + 88);
            objc_msgSend(v14, "uniqueIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "monitorForValue:", v18);

          }
          v19 = *(void **)(a1 + 56);
          objc_msgSend(v14, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v21 = (void *)objc_opt_new();
            v22 = *(void **)(a1 + 56);
            objc_msgSend(v14, "name");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, v23);

          }
          objc_msgSend(v21, "addObject:", v14);
          if (objc_msgSend(v14, "hasLargePayload"))
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v14);

        }
      }
      else
      {
        CAFServiceLogging();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          __39__CAFService_initWithAccessory_config___block_invoke_cold_2(a1);

      }
    }

    v24 = v4;
  }
  else
  {

    CAFServiceLogging();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      __39__CAFService_initWithAccessory_config___block_invoke_cold_1(a1);
  }

}

void __39__CAFService_initWithAccessory_config___block_invoke_26(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "car");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "carManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "serviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "shouldAllocAccessoryType:serviceType:controlType:", v9, v10, v5);

    if (v11)
    {
      +[CAFControl controlWithService:config:](CAFControl, "controlWithService:config:", *(_QWORD *)(a1 + 40), v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        if (objc_msgSend(v12, "usable"))
        {
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v13, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

          v16 = *(void **)(a1 + 56);
          objc_msgSend(v13, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v18 = (void *)objc_opt_new();
            v19 = *(void **)(a1 + 56);
            objc_msgSend(v13, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

          }
          objc_msgSend(v18, "addObject:", v13);

        }
      }
      else
      {
        CAFServiceLogging();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __39__CAFService_initWithAccessory_config___block_invoke_26_cold_2(a1);

      }
    }

    v21 = v4;
  }
  else
  {

    CAFServiceLogging();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      __39__CAFService_initWithAccessory_config___block_invoke_26_cold_1(a1);
  }

}

- (CAFCar)car
{
  void *v2;
  void *v3;

  -[CAFService accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFCar *)v3;
}

- (id)characteristicForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[CAFCharacteristicTypes characteristicNameByType](CAFCharacteristicTypes, "characteristicNameByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFService characteristicForName:](self, "characteristicForName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)characteristicForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CAFService characteristicsByType](self, "characteristicsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)controlForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[CAFControlTypes controlNameByType](CAFControlTypes, "controlNameByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFService controlForName:](self, "controlForName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)controlForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[CAFService controlsByType](self, "controlsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasError
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CAFService characteristics](self, "characteristics", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hasError") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSArray)sortedCharacteristics
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFService characteristics](self, "characteristics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)sortedControls
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFService controls](self, "controls");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setReceivedAllValues:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  const __CFString *v11;
  int v12;
  CAFService *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_receivedAllValues != a3)
  {
    v3 = a3;
    CAFServiceLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = CFSTR("YES");
      if (self->_receivedAllValues)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = 138543874;
      v13 = self;
      if (!v3)
        v10 = CFSTR("NO");
      v14 = 2112;
      v15 = v11;
      v16 = 2112;
      v17 = v10;
      _os_log_debug_impl(&dword_237717000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ receivedAllValues transitioning from %@ to %@", (uint8_t *)&v12, 0x20u);
    }

    if (v3)
    {
      self->_receivedAllValues = v3;
      -[CAFService cachedDescription](self, "cachedDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setNeedsRefreshDescription");

      CARSignpostLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v7))
      {
        v12 = 138412290;
        v13 = self;
        _os_signpost_emit_with_name_impl(&dword_237717000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedAllValues", "%@", (uint8_t *)&v12, 0xCu);
      }

      -[CAFService accessory](self, "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_serviceReceivedAllValues:", self);

      -[CAFService observers](self, "observers");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject serviceDidUpdate:receivedAllValues:](v9, "serviceDidUpdate:receivedAllValues:", self, 1);
    }
    else
    {
      CAFGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[CAFService setReceivedAllValues:].cold.1(v9);
    }

  }
}

- (void)refreshCharacteristics
{
  OUTLINED_FUNCTION_4(&dword_237717000, a2, a3, "%{public}@ refreshing", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)registerAllRawDataIfNeeded
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  -[CAFService characteristicsWithLargePayload](self, "characteristicsWithLargePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __40__CAFService_registerAllRawDataIfNeeded__block_invoke;
    block[3] = &unk_2508FD218;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  CAFGroupEnableNotificationRequest *v3;
  void *v4;
  CAFGroupEnableNotificationRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CAFServiceLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__CAFService_registerAllRawDataIfNeeded__block_invoke_cold_1(a1, v2);

  v3 = [CAFGroupEnableNotificationRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "car");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFGroupRequest initWithCar:](v3, "initWithCar:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "characteristicsWithLargePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[CAFGroupRequest addCharacteristic:](v5, "addCharacteristic:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__CAFService_registerAllRawDataIfNeeded__block_invoke_37;
  v11[3] = &unk_2508FD1F0;
  v11[4] = *(_QWORD *)(a1 + 32);
  -[CAFGroupRequest performWithCompletion:](v5, "performWithCompletion:", v11);

}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  CAFServiceLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __40__CAFService_registerAllRawDataIfNeeded__block_invoke_37_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)unregisterAllRawDataIfNeeded
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  -[CAFService characteristicsWithLargePayload](self, "characteristicsWithLargePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke;
    block[3] = &unk_2508FD218;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  CAFGroupDisableNotificationRequest *v3;
  void *v4;
  CAFGroupDisableNotificationRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CAFServiceLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_cold_1(a1, v2);

  v3 = [CAFGroupDisableNotificationRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "car");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFGroupRequest initWithCar:](v3, "initWithCar:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "characteristicsWithLargePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[CAFGroupRequest addCharacteristic:](v5, "addCharacteristic:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_40;
  v11[3] = &unk_2508FD1F0;
  v11[4] = *(_QWORD *)(a1 + 32);
  -[CAFGroupRequest performWithCompletion:](v5, "performWithCompletion:", v11);

}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_40(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  CAFServiceLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_40_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  CAFServiceLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CAFService registerObserver:].cold.1();

  -[CAFService observers](self, "observers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasObservers");

  -[CAFService observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerObserver:", v4);

  -[CAFService cachedDescription](self, "cachedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsRefreshDescription");

  if ((v7 & 1) == 0)
    -[CAFService registerAllRawDataIfNeeded](self, "registerAllRawDataIfNeeded");

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[CAFService observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

  -[CAFService cachedDescription](self, "cachedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsRefreshDescription");

  CAFServiceLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CAFService unregisterObserver:].cold.1();

  -[CAFService observers](self, "observers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasObservers");

  if ((v9 & 1) == 0)
    -[CAFService unregisterAllRawDataIfNeeded](self, "unregisterAllRawDataIfNeeded");

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFService cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

+ (id)serviceType
{
  void *v3;
  void *v4;
  void *v5;

  +[CAFServiceTypes serviceNameByType](CAFServiceTypes, "serviceNameByType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)indexBy
{
  return (id)objc_msgSend((id)objc_opt_class(), "indexBy");
}

- (void)_updateReceivedValuesWithCharacteristic:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isCurrent"))
  {
    -[CAFService valueMonitor](self, "valueMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFService setReceivedAllValues:](self, "setReceivedAllValues:", objc_msgSend(v4, "valueReceivedFor:", v5));

  }
}

- (id)pluginID
{
  void *v2;
  void *v3;

  -[CAFService accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pluginID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)serviceIdentifier
{
  return &stru_2508FF798;
}

+ (id)observerProtocol
{
  return &unk_256812388;
}

+ (id)indexBy
{
  return 0;
}

- (void)_characteristicDidUpdate:(id)a3 fromGroupUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  CAFServiceLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CAFService _characteristicDidUpdate:fromGroupUpdate:].cold.1();

  -[CAFService accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_serviceDidUpdate:characteristic:", self, v6);

  -[CAFService observers](self, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceDidUpdate:characteristic:fromGroupUpdate:", self, v6, v4);

  -[CAFService _updateReceivedValuesWithCharacteristic:](self, "_updateReceivedValuesWithCharacteristic:", v6);
}

- (void)_didUpdateValuesForGroupedCharacteristics:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "setCachedValueIfAvailableForGroupUpdate:", 1);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  dispatch_get_global_queue(33, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CAFService__didUpdateValuesForGroupedCharacteristics___block_invoke;
  block[3] = &unk_2508FD218;
  block[4] = self;
  dispatch_barrier_async(v9, block);

}

void __56__CAFService__didUpdateValuesForGroupedCharacteristics___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serviceDidFinishGroupUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)_controlDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v4 = a3;
  CAFServiceLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CAFService _controlDidUpdate:].cold.1();

  -[CAFService accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_serviceDidUpdate:control:", self, v4);

  -[CAFService observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceDidUpdate:control:", self, v4);

}

- (void)invalidate
{
  OUTLINED_FUNCTION_4(&dword_237717000, a2, a3, "%{public}@ time to invalidate", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (BOOL)usable
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CAFService characteristics](self, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[CAFService controls](self, "controls");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  return v4;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_250958560;
}

- (id)currentDescriptionForCache:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CAFService name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService pluginID](self, "pluginID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService serviceType](self, "serviceType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFService accessory](self, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "instanceID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CAFService receivedAllValues](self, "receivedAllValues");
  v14 = CFSTR("NO");
  if (v13)
    v14 = CFSTR("YES");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@ %@ %@ type=%@ accessory=(%p)%@ recievedAllValues=%@>"), v5, self, v6, v7, v8, v9, v10, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)state
{
  if (-[CAFService receivedAllValues](self, "receivedAllValues"))
    return 3;
  else
    return 6;
}

- (id)observableCache
{
  return self->_observableCache;
}

- (void)setObservableCache:(id)a3
{
  objc_storeStrong(&self->_observableCache, a3);
}

- (CAFAccessory)accessory
{
  return (CAFAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (NSDictionary)characteristics
{
  return self->_characteristics;
}

- (BOOL)receivedAllValues
{
  return self->_receivedAllValues;
}

- (NSDictionary)controls
{
  return self->_controls;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSString)serviceType
{
  return self->_serviceType;
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

- (CAFCachedDescription)cachedDescription
{
  return self->_cachedDescription;
}

- (void)setCachedDescription:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDescription, a3);
}

- (CAFValueMonitor)valueMonitor
{
  return self->_valueMonitor;
}

- (void)setValueMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_valueMonitor, a3);
}

- (NSDictionary)characteristicsByType
{
  return self->_characteristicsByType;
}

- (NSArray)characteristicsWithLargePayload
{
  return self->_characteristicsWithLargePayload;
}

- (NSDictionary)controlsByType
{
  return self->_controlsByType;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_controlsByType, 0);
  objc_storeStrong((id *)&self->_characteristicsWithLargePayload, 0);
  objc_storeStrong((id *)&self->_characteristicsByType, 0);
  objc_storeStrong((id *)&self->_valueMonitor, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_controls, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong(&self->_observableCache, 0);
}

- (void)initWithAccessory:(void *)a1 config:.cold.1(void *a1)
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
  OUTLINED_FUNCTION_1(&dword_237717000, v3, v4, "Parsing service config from pluginID: %@ accessory instanceID: %@ failed for instanceID", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)initWithAccessory:(void *)a1 config:.cold.2(void *a1)
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
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Parsing service config from pluginID: %@ instanceID: %@ failed for serviceType", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)initWithAccessory:(uint64_t)a3 config:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_237717000, a2, a3, "%{public}@ done", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __39__CAFService_initWithAccessory_config___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10(a1), "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for characteristic", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __39__CAFService_initWithAccessory_config___block_invoke_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10(a1), "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Creating characteristic from pluginID: %@ instanceID: %@ failed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __39__CAFService_initWithAccessory_config___block_invoke_26_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10(a1), "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for control", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __39__CAFService_initWithAccessory_config___block_invoke_26_cold_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_10(a1), "pluginID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_237717000, v2, v3, "Creating control from pluginID: %@ instanceID: %@ failed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)setReceivedAllValues:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_237717000, log, OS_LOG_TYPE_FAULT, "receivedAllValues should not go back to NO", v1, 2u);
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "characteristicsWithLargePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_237717000, a2, v4, "%@ register large payloads count=%lu", v5);

  OUTLINED_FUNCTION_0();
}

void __40__CAFService_registerAllRawDataIfNeeded__block_invoke_37_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_237717000, a2, a3, "%@ group register large payloads request completed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "characteristicsWithLargePayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_237717000, a2, v4, "%@ unregister large payloads count=%lu", v5);

  OUTLINED_FUNCTION_0();
}

void __42__CAFService_unregisterAllRawDataIfNeeded__block_invoke_40_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_237717000, a2, a3, "%@ group unregister large payloads request completed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)registerObserver:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_237717000, v0, v1, "%@ adding observer %@");
  OUTLINED_FUNCTION_6();
}

- (void)unregisterObserver:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_237717000, v0, v1, "%@ removed observer %@");
  OUTLINED_FUNCTION_6();
}

- (void)_characteristicDidUpdate:fromGroupUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_237717000, v0, v1, "%{public}@ characteristic=%{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_controlDidUpdate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_237717000, v0, v1, "%{public}@ control=%{public}@ updated");
  OUTLINED_FUNCTION_6();
}

@end
