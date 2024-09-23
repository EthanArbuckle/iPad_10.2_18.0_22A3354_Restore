@implementation CAFAccessory

+ (void)load
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    +[CAFAccessory registerAccessoryClass:](CAFAccessory, "registerAccessoryClass:", objc_opt_class());
}

+ (void)registerAccessoryClass:(Class)a3
{
  void *v4;
  void *v5;
  id obj;

  if (registerAccessoryClass__onceToken != -1)
    dispatch_once(&registerAccessoryClass__onceToken, &__block_literal_global_11);
  obj = (id)_registeredAccessoryClasses;
  objc_sync_enter(obj);
  v4 = (void *)_registeredAccessoryClasses;
  -[objc_class accessoryIdentifier](a3, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", a3, v5);

  objc_sync_exit(obj);
}

void __39__CAFAccessory_registerAccessoryClass___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_registeredAccessoryClasses;
  _registeredAccessoryClasses = v0;

}

+ (id)registeredAccessoryClasses
{
  id v2;
  void *v3;

  v2 = (id)_registeredAccessoryClasses;
  objc_sync_enter(v2);
  v3 = (void *)objc_msgSend((id)_registeredAccessoryClasses, "copy");
  objc_sync_exit(v2);

  return v3;
}

+ (CAFAccessory)accessoryWithCar:(id)a3 pluginID:(id)a4 config:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFAccessory registeredAccessoryClasses](CAFAccessory, "registeredAccessoryClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (objc_class *)objc_msgSend(v11, "objectForKeyedSubscript:", v10);

  if (!v12)
    v12 = (objc_class *)objc_opt_class();
  v13 = (void *)objc_msgSend([v12 alloc], "initWithCar:pluginID:config:", v9, v8, v7);

  return (CAFAccessory *)v13;
}

+ (id)_sharedServiceGroupInitQueue
{
  if (_sharedServiceGroupInitQueue_onceToken != -1)
    dispatch_once(&_sharedServiceGroupInitQueue_onceToken, &__block_literal_global_17_0);
  return (id)_sharedServiceGroupInitQueue__sharedServiceGroupInitQueue;
}

void __44__CAFAccessory__sharedServiceGroupInitQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x24BDAC9C0], QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.CarAccessoryFramework.Accessory.ServiceGroupInit", v2);
  v1 = (void *)_sharedServiceGroupInitQueue__sharedServiceGroupInitQueue;
  _sharedServiceGroupInitQueue__sharedServiceGroupInitQueue = (uint64_t)v0;

}

- (CAFAccessory)initWithCar:(id)a3 pluginID:(id)a4 config:(id)a5
{
  id v8;
  id v9;
  id v10;
  CAFAccessory *v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  CAFCachedDescription *v31;
  void *v32;
  CAFValueMonitor *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CAFAccessory *v68;
  void *v70;
  id obj;
  void *v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  objc_super v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v90.receiver = self;
  v90.super_class = (Class)CAFAccessory;
  v11 = -[CAFAccessory init](&v90, sel_init);
  v12 = (uint64_t)v11;
  if (v11)
  {
    v11->_indexLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v11->_car, v8);
    v13 = (uint64_t *)(v12 + 40);
    objc_storeStrong((id *)(v12 + 40), a4);
    objc_opt_class();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("iid"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    v16 = *(void **)(v12 + 48);
    *(_QWORD *)(v12 + 48) = v15;

    if (*(_QWORD *)(v12 + 48))
    {
      +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v10);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(v12 + 56);
      *(_QWORD *)(v12 + 56) = v17;

      if (*(_QWORD *)(v12 + 56))
      {
        +[CAFCarConfiguration getUUID:instanceID:](CAFCarConfiguration, "getUUID:instanceID:", *(_QWORD *)(v12 + 40), *(_QWORD *)(v12 + 48));
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(v12 + 64);
        *(_QWORD *)(v12 + 64) = v19;

        +[CAFAccessoryTypes accessoryNameForType:](CAFAccessoryTypes, "accessoryNameForType:", *(_QWORD *)(v12 + 56));
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(v12 + 72);
        *(_QWORD *)(v12 + 72) = v21;

        objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("version"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (v23 && (objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;

        v26 = *(void **)(v12 + 24);
        *(_QWORD *)(v12 + 24) = v24;

        v27 = objc_alloc(MEMORY[0x24BE15228]);
        objc_msgSend((id)objc_opt_class(), "observerProtocol");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v27, "initWithProtocol:", v28);
        v30 = *(void **)(v12 + 136);
        *(_QWORD *)(v12 + 136) = v29;

        v31 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v12);
        v32 = *(void **)(v12 + 80);
        *(_QWORD *)(v12 + 80) = v31;

        v33 = -[CAFValueMonitor initWithDelegate:]([CAFValueMonitor alloc], "initWithDelegate:", v12);
        v34 = *(void **)(v12 + 88);
        *(_QWORD *)(v12 + 88) = v33;

        v35 = (void *)objc_opt_new();
        v36 = (void *)objc_opt_new();
        v76 = (void *)objc_opt_new();
        objc_opt_class();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("services"));
        v37 = (id)objc_claimAutoreleasedReturnValue();
        if (v37 && (objc_opt_isKindOfClass() & 1) != 0)
          v38 = v37;
        else
          v38 = 0;
        v74 = v9;
        v75 = v8;

        if (v38)
        {
          v85[0] = MEMORY[0x24BDAC760];
          v85[1] = 3221225472;
          v85[2] = __44__CAFAccessory_initWithCar_pluginID_config___block_invoke;
          v85[3] = &unk_2508FD1C8;
          v86 = (id)v12;
          v87 = v35;
          v88 = v36;
          v89 = v76;
          objc_msgSend(v38, "enumerateObjectsUsingBlock:", v85);

        }
        v70 = v38;
        obj = v36;
        v73 = v10;
        os_unfair_lock_lock((os_unfair_lock_t)(v12 + 12));
        objc_storeStrong((id *)(v12 + 32), v35);
        v72 = v35;
        objc_msgSend(v35, "allValues");
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = *(void **)(v12 + 96);
        *(_QWORD *)(v12 + 96) = v39;

        v41 = (void *)objc_opt_new();
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v42 = *(id *)(v12 + 96);
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v82;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v82 != v45)
                objc_enumerationMutation(v42);
              objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * i), "characteristics");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "allValues");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "addObjectsFromArray:", v48);

            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
          }
          while (v44);
        }

        objc_storeStrong((id *)(v12 + 104), v41);
        v49 = (void *)objc_opt_new();
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v50 = *(id *)(v12 + 96);
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v78;
          do
          {
            for (j = 0; j != v52; ++j)
            {
              if (*(_QWORD *)v78 != v53)
                objc_enumerationMutation(v50);
              objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "controls");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "allValues");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "addObjectsFromArray:", v56);

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
          }
          while (v52);
        }

        objc_storeStrong((id *)(v12 + 112), v49);
        objc_storeStrong((id *)(v12 + 120), obj);
        v57 = *(void **)(v12 + 128);
        *(_QWORD *)(v12 + 128) = v76;
        v58 = v76;

        os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 12));
        objc_msgSend((id)v12, "cachedDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setNeedsRefreshDescription");

        CAFAccessoryLogging();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          -[CAFService initWithAccessory:config:].cold.3(v12, v60, v61, v62, v63, v64, v65, v66);

        objc_msgSend(*(id *)(v12 + 88), "signalReadyToMonitor");
        v67 = objc_msgSend(*(id *)(v12 + 88), "receivedAllValues");

        objc_msgSend((id)v12, "setReceivedAllValues:", v67);
        v9 = v74;
        v8 = v75;
        v10 = v73;
        goto LABEL_37;
      }
      CAFAccessoryLogging();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CAFAccessory initWithCar:pluginID:config:].cold.2(v13, (uint64_t *)(v12 + 48), v25);
    }
    else
    {
      CAFAccessoryLogging();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[CAFAccessory initWithCar:pluginID:config:].cold.1(v13, v25);
    }

    v68 = 0;
    goto LABEL_41;
  }
LABEL_37:
  v68 = (CAFAccessory *)(id)v12;
LABEL_41:

  return v68;
}

void __44__CAFAccessory_initWithCar_pluginID_config___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
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
  NSObject *v27;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (!v4 || (objc_opt_isKindOfClass() & 1) == 0)
  {

    CAFAccessoryLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_1(a1, v11);
    v10 = 0;
    goto LABEL_17;
  }
  v5 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "car");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "categoryType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "shouldAllocAccessoryType:serviceConfig:", v8, v4);

  v10 = v4;
  if (v9)
  {
    +[CAFService serviceWithAccessory:config:](CAFService, "serviceWithAccessory:config:", *v5, v4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
      v12 = *(void **)(a1 + 40);
      -[NSObject uniqueIdentifier](v11, "uniqueIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      if ((-[NSObject receivedAllValues](v11, "receivedAllValues") & 1) == 0)
      {
        objc_msgSend(*v5, "valueMonitor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueIdentifier](v11, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "monitorForValue:", v15);

      }
      v16 = *(void **)(a1 + 48);
      -[NSObject serviceType](v11, "serviceType");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        v18 = (void *)objc_opt_new();
        v19 = *(void **)(a1 + 48);
        -[NSObject serviceType](v11, "serviceType");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

      }
      objc_msgSend(v18, "addObject:", v11);
      -[NSObject indexBy](v11, "indexBy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = *(void **)(a1 + 56);
        -[NSObject serviceType](v11, "serviceType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          v24 = (void *)objc_opt_new();
          v25 = *(void **)(a1 + 56);
          -[NSObject serviceType](v11, "serviceType");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, v26);

        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)*v5 + 3);

    }
    else
    {
      CAFAccessoryLogging();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_2(v5, v27);

    }
    v10 = v4;
LABEL_17:

  }
}

- (NSArray)sortedServices
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFAccessory services](self, "services");
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
  CAFAccessory *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_receivedAllValues != a3)
  {
    v3 = a3;
    CAFAccessoryLogging();
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
      -[CAFAccessory cachedDescription](self, "cachedDescription");
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

      -[CAFAccessory car](self, "car");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_accessoryReceivedAllValues:", self);

      -[CAFAccessory observers](self, "observers");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject accessoryDidUpdate:receivedAllValues:](v9, "accessoryDidUpdate:receivedAllValues:", self, 1);
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

- (id)servicesForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAFAccessory servicesByType](self, "servicesByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)servicesForIndexBy:(id)a3
{
  os_unfair_lock_s *p_indexLock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_indexLock = &self->_indexLock;
  v5 = a3;
  os_unfair_lock_lock(p_indexLock);
  -[CAFAccessory servicesIndexBy](self, "servicesIndexBy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "copy");
  os_unfair_lock_unlock(p_indexLock);
  return v8;
}

- (void)refreshCharacteristics
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  CAFAccessoryLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CAFService refreshCharacteristics].cold.1((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CAFAccessory services](self, "services", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "refreshCharacteristics");
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFAccessory observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFAccessory observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFAccessory cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (void)_serviceReceivedAllValues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAFAccessory valueMonitor](self, "valueMonitor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFAccessory setReceivedAllValues:](self, "setReceivedAllValues:", objc_msgSend(v6, "valueReceivedFor:", v5));
}

+ (id)accessoryIdentifier
{
  return &stru_2508FF798;
}

+ (id)observerProtocol
{
  return &unk_256824858;
}

- (void)_serviceDidUpdate:(id)a3 characteristic:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, _BYTE *);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "indexBy");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "characteristicType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexBy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      os_unfair_lock_lock(&self->_indexLock);
      -[CAFAccessory servicesIndexBy](self, "servicesIndexBy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "serviceType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0;
      v29 = &v28;
      v30 = 0x3032000000;
      v31 = __Block_byref_object_copy__1;
      v32 = __Block_byref_object_dispose__1;
      v33 = 0;
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = __49__CAFAccessory__serviceDidUpdate_characteristic___block_invoke;
      v25 = &unk_2508FE948;
      v16 = v6;
      v26 = v16;
      v27 = &v28;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v22);
      if (v29[5])
        objc_msgSend(v15, "removeObjectForKey:", v22, v23, v24, v25);
      objc_msgSend(v16, "indexBy", v22, v23, v24, v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "characteristicForType:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v19);
      os_unfair_lock_unlock(&self->_indexLock);

      _Block_object_dispose(&v28, 8);
    }
  }
  -[CAFAccessory car](self, "car");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_accessoryDidUpdate:service:characteristic:", self, v6, v7);

  -[CAFAccessory observers](self, "observers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "accessoryDidUpdate:service:characteristic:", self, v6, v7);

}

void __49__CAFAccessory__serviceDidUpdate_characteristic___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = a3;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = objc_msgSend(v10, "isEqual:", v11);
  if ((_DWORD)v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_serviceDidUpdate:(id)a3 control:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[CAFAccessory car](self, "car");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessoryDidUpdate:service:control:", self, v7, v6);

  -[CAFAccessory observers](self, "observers");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessoryDidUpdate:service:control:", self, v7, v6);

}

- (BOOL)usable
{
  void *v2;
  BOOL v3;

  -[CAFAccessory services](self, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (Class)baseCAFClass
{
  return (Class)objc_opt_class();
}

- (NSArray)comparisonKeys
{
  return (NSArray *)&unk_250958638;
}

- (void)invalidate
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CAFGeneralLogging();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[CAFService invalidate].cold.1((uint64_t)self, v3, v4, v5, v6, v7, v8, v9);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CAFAccessory allServices](self, "allServices", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "invalidate");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

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
  _BOOL4 v11;
  const __CFString *v12;
  void *v13;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  -[CAFAccessory name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFAccessory pluginID](self, "pluginID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFAccessory instanceID](self, "instanceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFAccessory categoryType](self, "categoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFAccessory version](self, "version");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[CAFAccessory receivedAllValues](self, "receivedAllValues");
  v12 = CFSTR("NO");
  if (v11)
    v12 = CFSTR("YES");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@ %@ %@ type=%@ version=%@ recievedAllValues=%@>"), v5, self, v6, v7, v8, v9, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)state
{
  if (-[CAFAccessory receivedAllValues](self, "receivedAllValues"))
    return 3;
  else
    return 6;
}

- (CAFCar)car
{
  return (CAFCar *)objc_loadWeakRetained((id *)&self->_car);
}

- (NSString)version
{
  return self->_version;
}

- (NSDictionary)services
{
  return self->_services;
}

- (BOOL)receivedAllValues
{
  return self->_receivedAllValues;
}

- (NSNumber)pluginID
{
  return self->_pluginID;
}

- (NSNumber)instanceID
{
  return self->_instanceID;
}

- (NSString)categoryType
{
  return self->_categoryType;
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

- (NSArray)allServices
{
  return self->_allServices;
}

- (NSArray)allCharacteristics
{
  return self->_allCharacteristics;
}

- (NSArray)allControls
{
  return self->_allControls;
}

- (NSDictionary)servicesByType
{
  return self->_servicesByType;
}

- (NSDictionary)servicesIndexBy
{
  return self->_servicesIndexBy;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (os_unfair_lock_s)indexLock
{
  return self->_indexLock;
}

- (void)setIndexLock:(os_unfair_lock_s)a3
{
  self->_indexLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_servicesIndexBy, 0);
  objc_storeStrong((id *)&self->_servicesByType, 0);
  objc_storeStrong((id *)&self->_allControls, 0);
  objc_storeStrong((id *)&self->_allCharacteristics, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
  objc_storeStrong((id *)&self->_valueMonitor, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_pluginID, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_destroyWeak((id *)&self->_car);
}

- (void)initWithCar:(uint64_t *)a1 pluginID:(NSObject *)a2 config:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_237717000, a2, OS_LOG_TYPE_ERROR, "Parsing accessory config from pluginID: %@ failed for instanceID", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_6();
}

- (void)initWithCar:(uint64_t *)a1 pluginID:(uint64_t *)a2 config:(NSObject *)a3 .cold.2(uint64_t *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_1_3(&dword_237717000, a3, (uint64_t)a3, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for categoryType", (uint8_t *)&v5);
  OUTLINED_FUNCTION_6();
}

void __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "pluginID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_237717000, a2, v6, "Parsing accessory config from pluginID: %@ instanceID: %@ failed for service", v7);

  OUTLINED_FUNCTION_0();
}

void __44__CAFAccessory_initWithCar_pluginID_config___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "pluginID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a1, "instanceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_3(&dword_237717000, a2, v6, "Creating service from pluginID: %@ instanceID: %@ failed", v7);

  OUTLINED_FUNCTION_0();
}

@end
