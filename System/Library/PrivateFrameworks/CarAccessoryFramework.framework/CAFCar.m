@implementation CAFCar

- (CAFCar)initWithManager:(id)a3 car:(id)a4
{
  id v7;
  id v8;
  CAFCar *v9;
  CAFCar *v10;
  uint64_t v11;
  CARObserverHashTable *observers;
  CAFCachedDescription *v13;
  CAFCachedDescription *cachedDescription;
  CAFValueMonitor *v15;
  CAFValueMonitor *valueMonitor;
  CAFPositionManager *v17;
  CAFPositionManager *positionManager;
  CAFDimensionManager *v19;
  CAFDimensionManager *dimensionManager;
  NSObject *v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *refreshQueue;
  uint64_t v25;
  NSDictionary *updatables;
  uint64_t v27;
  NSMutableSet *accessoryTypes;
  uint64_t v29;
  NSDictionary *accessories;
  uint64_t v31;
  NSDictionary *accessoriesByCategory;
  uint64_t v33;
  NSMutableSet *processedPluginIDs;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  objc_super v40;

  v7 = a3;
  v8 = a4;
  v40.receiver = self;
  v40.super_class = (Class)CAFCar;
  v9 = -[CAFCar init](&v40, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_carManager, a3);
    objc_storeStrong((id *)&v10->_car, a4);
    -[CAFCarConfiguration setDelegate:](v10->_car, "setDelegate:", v10);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_2568121D0);
    observers = v10->_observers;
    v10->_observers = (CARObserverHashTable *)v11;

    v13 = -[CAFCachedDescription initWithCacheable:]([CAFCachedDescription alloc], "initWithCacheable:", v10);
    cachedDescription = v10->_cachedDescription;
    v10->_cachedDescription = v13;

    v15 = -[CAFValueMonitor initWithDelegate:]([CAFValueMonitor alloc], "initWithDelegate:", v10);
    valueMonitor = v10->_valueMonitor;
    v10->_valueMonitor = v15;

    v17 = -[CAFPositionManager initWithCar:]([CAFPositionManager alloc], "initWithCar:", v10);
    positionManager = v10->_positionManager;
    v10->_positionManager = v17;

    v19 = -[CAFDimensionManager initWithCar:]([CAFDimensionManager alloc], "initWithCar:", v10);
    dimensionManager = v10->_dimensionManager;
    v10->_dimensionManager = v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v21, QOS_CLASS_DEFAULT, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    v23 = dispatch_queue_create("com.apple.CarAccessoryFramework.Car.Refresh", v22);
    refreshQueue = v10->_refreshQueue;
    v10->_refreshQueue = (OS_dispatch_queue *)v23;

    v25 = objc_opt_new();
    updatables = v10->_updatables;
    v10->_updatables = (NSDictionary *)v25;

    v27 = objc_opt_new();
    accessoryTypes = v10->_accessoryTypes;
    v10->_accessoryTypes = (NSMutableSet *)v27;

    v29 = objc_opt_new();
    accessories = v10->_accessories;
    v10->_accessories = (NSDictionary *)v29;

    v31 = objc_opt_new();
    accessoriesByCategory = v10->_accessoriesByCategory;
    v10->_accessoriesByCategory = (NSDictionary *)v31;

    v33 = objc_opt_new();
    processedPluginIDs = v10->_processedPluginIDs;
    v10->_processedPluginIDs = (NSMutableSet *)v33;

    objc_msgSend(v8, "pluginConfigs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count");

    if (v36)
      -[CAFCar _refreshAccessories](v10, "_refreshAccessories");
    -[CAFCar cachedDescription](v10, "cachedDescription");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setNeedsRefreshDescription");

    CAFCarLogging();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[CAFCar initWithManager:car:].cold.1();

  }
  return v10;
}

- (void)dealloc
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[CAFCar dealloc]";
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_5(&dword_237717000, a2, a3, "%s %p", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (BOOL)rightHandDrive
{
  void *v2;
  char v3;

  -[CAFCar car](self, "car");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rightHandDrive");

  return v3;
}

- (NSArray)sortedAccessories
{
  void *v2;
  void *v3;
  void *v4;

  -[CAFCar accessories](self, "accessories");
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
  CAFCar *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_receivedAllValues != a3)
  {
    v3 = a3;
    CAFCarLogging();
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
      -[CAFCar cachedDescription](self, "cachedDescription");
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

      -[CAFCar combineObserver](self, "combineObserver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "carDidUpdate:receivedAllValues:", self, 1);

      -[CAFCar observers](self, "observers");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject carDidUpdate:receivedAllValues:](v9, "carDidUpdate:receivedAllValues:", self, 1);
    }
    else
    {
      CAFGeneralLogging();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[CAFCar setReceivedAllValues:].cold.1();
    }

  }
}

- (id)accessoriesForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAFCar accessoriesByCategory](self, "accessoriesByCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)refreshAllCharacteristics
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ refreshing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFCar observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFCar observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (NSString)description
{
  void *v2;
  void *v3;

  -[CAFCar cachedDescription](self, "cachedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)compare:(id)a3
{
  return CAFEntityCompare(self, a3);
}

- (void)_refreshAccessories
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ triggered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
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
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  uint8_t v37[16];
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;

  CAFCarLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __29__CAFCar__refreshAccessories__block_invoke_cold_2();

  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(*v3, "accessoriesByCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_msgSend(*v3, "updatables");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(*v3, "car");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pluginConfigs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  v16 = (void *)objc_opt_new();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __29__CAFCar__refreshAccessories__block_invoke_84;
  v38[3] = &unk_2508FE360;
  v38[4] = *v3;
  v17 = v6;
  v39 = v17;
  v45 = &v46;
  v18 = v9;
  v40 = v18;
  v19 = v12;
  v41 = v19;
  v20 = v10;
  v42 = v20;
  v21 = v8;
  v43 = v21;
  v22 = v16;
  v44 = v22;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v38);
  objc_msgSend(*v3, "processedPluginIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObjectsFromArray:", v22);

  if (*((_BYTE *)v47 + 24))
  {
    objc_msgSend(*v3, "setAccessories:", v17);
    objc_msgSend(*v3, "setAccessoriesByCategory:", v21);
    objc_msgSend(v17, "allValues");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "setAllAccessories:", v24);

    objc_msgSend(*v3, "setUpdatables:", v19);
    objc_msgSend(*v3, "cachedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNeedsRefreshDescription");

    objc_msgSend(*v3, "combineObserver");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "carDidUpdateAccessories:", *v3);

    objc_msgSend(*v3, "observers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "carDidUpdateAccessories:", *v3);

  }
  if (objc_msgSend(*v3, "isConfigured"))
  {
    objc_msgSend(*v3, "cachedDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setNeedsRefreshDescription");

    objc_msgSend(*v3, "observers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "carIsConfigured:", *v3);

    objc_msgSend(*v3, "observers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "carHasAllBridges:", *v3);

    objc_msgSend(*v3, "valueMonitor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "signalReadyToMonitor");

    objc_msgSend(*v3, "valueMonitor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "setReceivedAllValues:", objc_msgSend(v32, "receivedAllValues"));

  }
  objc_msgSend(*v3, "_groupInitialization:controls:", v18, v20);
  CAFCarLogging();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    __29__CAFCar__refreshAccessories__block_invoke_cold_1();

  CARSignpostLogForCategory();
  v34 = objc_claimAutoreleasedReturnValue();
  if (*v3)
  {
    CARSignpostLogForCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_signpost_id_make_with_pointer(v35, *v3);

    if (v36 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_15;
  }
  else
  {
    v36 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_237717000, v34, OS_SIGNPOST_INTERVAL_END, v36, "Car-RefreshAccessories", (const char *)&unk_2377DBA75, v37, 2u);
  }
LABEL_15:

  _Block_object_dispose(&v46, 8);
}

void __29__CAFCar__refreshAccessories__block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "processedPluginIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v5);

  CAFCarLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10)
      __29__CAFCar__refreshAccessories__block_invoke_84_cold_1();
  }
  else
  {
    if (v10)
      __29__CAFCar__refreshAccessories__block_invoke_84_cold_3();

    objc_opt_class();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessories"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 && (objc_opt_isKindOfClass() & 1) != 0)
      v9 = v11;
    else
      v9 = 0;

    if (v9)
    {
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __29__CAFCar__refreshAccessories__block_invoke_86;
      v21 = &unk_2508FE338;
      v12 = v5;
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(a1 + 40);
      v22 = v12;
      v23 = v13;
      v15 = v14;
      v16 = *(_QWORD *)(a1 + 88);
      v24 = v15;
      v29 = v16;
      v25 = *(id *)(a1 + 48);
      v26 = *(id *)(a1 + 56);
      v27 = *(id *)(a1 + 64);
      v28 = *(id *)(a1 + 72);
      -[NSObject enumerateObjectsUsingBlock:](v9, "enumerateObjectsUsingBlock:", &v18);

    }
    objc_msgSend(*(id *)(a1 + 80), "addObject:", v5, v18, v19, v20, v21);
    CAFCarLogging();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __29__CAFCar__refreshAccessories__block_invoke_84_cold_2();

  }
}

void __29__CAFCar__refreshAccessories__block_invoke_86(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if (v4 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("iid"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

    if (!v6)
    {
      CAFCarLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __29__CAFCar__refreshAccessories__block_invoke_86_cold_2();
      goto LABEL_24;
    }
    +[CAFCarConfiguration getType:](CAFCarConfiguration, "getType:", v4);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessoryTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v8);

    objc_msgSend(*(id *)(a1 + 40), "carManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "shouldAllocAccessoryType:", v8);

    if (!v11)
    {
LABEL_24:

      v7 = v4;
      goto LABEL_25;
    }
    +[CAFCarConfiguration getUUID:instanceID:](CAFCarConfiguration, "getUUID:instanceID:", *(_QWORD *)(a1 + 32), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      CAFCarLogging();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __29__CAFCar__refreshAccessories__block_invoke_86_cold_4();

      +[CAFAccessory accessoryWithCar:pluginID:config:](CAFAccessory, "accessoryWithCar:pluginID:config:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v4);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        CAFCarLogging();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __29__CAFCar__refreshAccessories__block_invoke_86_cold_3();
        goto LABEL_21;
      }
      v13 = v15;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v15, v12);
      if ((-[NSObject receivedAllValues](v13, "receivedAllValues") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "valueMonitor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniqueIdentifier](v13, "uniqueIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "monitorForValue:", v17);

      }
      -[NSObject allCharacteristics](v13, "allCharacteristics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v18);
      v19 = MEMORY[0x24BDAC760];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __29__CAFCar__refreshAccessories__block_invoke_90;
      v31[3] = &unk_2508FE2E8;
      v32 = *(id *)(a1 + 64);
      objc_msgSend(v18, "enumerateObjectsUsingBlock:", v31);
      -[NSObject allControls](v13, "allControls");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "addObjectsFromArray:", v20);
      v26 = v19;
      v27 = 3221225472;
      v28 = __29__CAFCar__refreshAccessories__block_invoke_2;
      v29 = &unk_2508FE310;
      v30 = *(id *)(a1 + 64);
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", &v26);

    }
    v21 = *(void **)(a1 + 80);
    -[NSObject categoryType](v13, "categoryType", v26, v27, v28, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      v23 = (void *)objc_opt_new();
      v24 = *(void **)(a1 + 80);
      -[NSObject categoryType](v13, "categoryType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

    }
    objc_msgSend(v23, "addObject:", v13);

LABEL_21:
    goto LABEL_24;
  }

  CAFCarLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __29__CAFCar__refreshAccessories__block_invoke_86_cold_1();
LABEL_25:

}

void __29__CAFCar__refreshAccessories__block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "pluginID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "allInstanceIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

void __29__CAFCar__refreshAccessories__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "pluginID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v4);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "allInstanceIDs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)performGroupRead:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CAFGroupReadRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CAFGroupRequest initWithCar:]([CAFGroupReadRequest alloc], "initWithCar:", self);
  -[CAFGroupRequest addCharacteristics:](v8, "addCharacteristics:", v7);

  -[CAFGroupRequest performWithCompletion:](v8, "performWithCompletion:", v6);
}

- (void)performGroupWrite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CAFGroupWriteRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CAFGroupRequest initWithCar:]([CAFGroupWriteRequest alloc], "initWithCar:", self);
  -[CAFGroupWriteRequest addCharacteristicsAndValues:](v8, "addCharacteristicsAndValues:", v7);

  -[CAFGroupRequest performWithCompletion:](v8, "performWithCompletion:", v6);
}

- (void)_groupInitialization:(id)a3 controls:(id)a4
{
  id v6;
  CAFGroupEnableNotificationRequest *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CAFGroupReadRequest *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  CAFGroupReadRequest *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  CAFGroupReadRequest *v25;
  void *v26;
  CAFGroupReadRequest *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  CAFGroupReadRequest *v38;
  void *v39;
  CAFGroupReadRequest *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  CAFGroupReadRequest *v46;
  CAFGroupEnableNotificationRequest *v47;
  void *v48;
  CAFGroupEnableNotificationRequest *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  CAFGroupReadRequest *v61;
  __int16 v62;
  CAFGroupEnableNotificationRequest *v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  CAFGroupReadRequest *v67;
  __int16 v68;
  CAFGroupEnableNotificationRequest *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v45 = a4;
  v46 = -[CAFGroupRequest initWithCar:]([CAFGroupReadRequest alloc], "initWithCar:", self);
  v7 = -[CAFGroupRequest initWithCar:]([CAFGroupEnableNotificationRequest alloc], "initWithCar:", self);
  CAFCarLogging();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v59 = objc_msgSend(v6, "count", v45);
    v60 = 2112;
    v61 = v46;
    v62 = 2112;
    v63 = v7;
    _os_log_debug_impl(&dword_237717000, v8, OS_LOG_TYPE_DEBUG, "Group initialization start (count=%lu) read=%@ notify=%@", buf, 0x20u);
  }

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
  v47 = v7;
  v48 = v9;
  if (!v10)
  {
    v49 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_30;
  }
  v11 = v10;
  v49 = 0;
  v12 = 0;
  v13 = 0;
  v14 = *(_QWORD *)v55;
  do
  {
    v15 = 0;
    do
    {
      if (*(_QWORD *)v55 != v14)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v15);
      if ((objc_msgSend(v16, "shouldInitialize", v45) & 1) == 0)
      {
        CAFCarLogging();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          goto LABEL_13;
        objc_msgSend(v16, "pluginID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "instanceID");
        v19 = (CAFGroupReadRequest *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = (uint64_t)v18;
        v60 = 2112;
        v61 = v19;
        v20 = v17;
        v21 = "Skipping pluginID: %@ instanceID: %@";
        goto LABEL_26;
      }
      if (objc_msgSend(v16, "hasLargePayload"))
      {
        CAFCarLogging();
        v17 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
LABEL_13:

          v13 = (CAFGroupReadRequest *)((char *)v13 + 1);
          goto LABEL_14;
        }
        objc_msgSend(v16, "pluginID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "instanceID");
        v19 = (CAFGroupReadRequest *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v59 = (uint64_t)v18;
        v60 = 2112;
        v61 = v19;
        v20 = v17;
        v21 = "Skipping large payload pluginID: %@ instanceID: %@";
LABEL_26:
        _os_log_debug_impl(&dword_237717000, v20, OS_LOG_TYPE_DEBUG, v21, buf, 0x16u);

        v9 = v48;
        goto LABEL_13;
      }
      if (objc_msgSend(v16, "notifies"))
      {
        CAFCarLogging();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "pluginID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "instanceID");
          v25 = (CAFGroupReadRequest *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v59 = (uint64_t)v24;
          v60 = 2112;
          v61 = v25;
          _os_log_debug_impl(&dword_237717000, v22, OS_LOG_TYPE_DEBUG, "Notifies pluginID: %@ instanceID: %@", buf, 0x16u);

          v7 = v47;
          v9 = v48;
        }

        -[CAFGroupRequest addCharacteristic:](v7, "addCharacteristic:", v16);
        objc_msgSend(v16, "groupInitializationRequested");
        ++v12;
      }
      else if (objc_msgSend(v16, "readable") && (objc_msgSend(v16, "hasInitialValue") & 1) == 0)
      {
        CAFCarLogging();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "pluginID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "instanceID");
          v27 = (CAFGroupReadRequest *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v59 = (uint64_t)v26;
          v60 = 2112;
          v61 = v27;
          _os_log_debug_impl(&dword_237717000, v23, OS_LOG_TYPE_DEBUG, "Read pluginID: %@ instanceID: %@", buf, 0x16u);

          v9 = v48;
          v7 = v47;
        }

        -[CAFGroupRequest addCharacteristic:](v46, "addCharacteristic:", v16);
        objc_msgSend(v16, "groupInitializationRequested");
        v49 = (CAFGroupEnableNotificationRequest *)((char *)v49 + 1);
      }
LABEL_14:
      ++v15;
    }
    while (v11 != v15);
    v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
    v11 = v28;
  }
  while (v28);
LABEL_30:

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v29 = v45;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v51 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if ((objc_msgSend(v34, "shouldInitialize", v45) & 1) != 0)
        {
          if (objc_msgSend(v34, "notifies"))
          {
            CAFCarLogging();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v34, "pluginID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "instanceID");
              v40 = (CAFGroupReadRequest *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v59 = (uint64_t)v39;
              v60 = 2112;
              v61 = v40;
              _os_log_debug_impl(&dword_237717000, v35, OS_LOG_TYPE_DEBUG, "Notifies pluginID: %@ instanceID: %@", buf, 0x16u);

              v7 = v47;
            }

            -[CAFGroupEnableNotificationRequest addControl:](v7, "addControl:", v34);
            ++v12;
          }
        }
        else
        {
          CAFCarLogging();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v34, "pluginID");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "instanceID");
            v38 = (CAFGroupReadRequest *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v59 = (uint64_t)v37;
            v60 = 2112;
            v61 = v38;
            _os_log_debug_impl(&dword_237717000, v36, OS_LOG_TYPE_DEBUG, "Skipping pluginID: %@ instanceID: %@", buf, 0x16u);

            v7 = v47;
          }

          v13 = (CAFGroupReadRequest *)((char *)v13 + 1);
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
    }
    while (v31);
  }

  CAFCarLogging();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    v43 = objc_msgSend(v48, "count");
    v44 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134219266;
    v59 = v44 + v43;
    v60 = 2048;
    v61 = v13;
    v62 = 2048;
    v63 = v49;
    v64 = 2048;
    v65 = v12;
    v66 = 2112;
    v67 = v46;
    v68 = 2112;
    v69 = v7;
    _os_log_debug_impl(&dword_237717000, v41, OS_LOG_TYPE_DEBUG, "Group initialization perform (total: %lu skipped: %lu read: %lu notify: %lu) read: %@ notify: %@", buf, 0x3Eu);
  }

  if (-[CAFGroupRequest count](v7, "count"))
    -[CAFGroupRequest performWithCompletion:](v7, "performWithCompletion:", &__block_literal_global_6);
  if (-[CAFGroupRequest count](v46, "count", v45))
    -[CAFGroupRequest performWithCompletion:](v46, "performWithCompletion:", &__block_literal_global_102);
  CAFCarLogging();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    -[CAFCar _groupInitialization:controls:].cold.1();

}

void __40__CAFCar__groupInitialization_controls___block_invoke()
{
  NSObject *v0;

  CAFCarLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __40__CAFCar__groupInitialization_controls___block_invoke_cold_1();

}

void __40__CAFCar__groupInitialization_controls___block_invoke_101()
{
  NSObject *v0;

  CAFCarLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __40__CAFCar__groupInitialization_controls___block_invoke_101_cold_1();

}

- (BOOL)registeredForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CAFCar carManager](self, "carManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registrations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasAccessory:", v4);

  return v8;
}

- (BOOL)hasAccessoryType:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CAFCar accessoryTypes](self, "accessoryTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isConfigured
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  -[CAFCar car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isConfigured"))
  {
    -[CAFCar processedPluginIDs](self, "processedPluginIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    -[CAFCar car](self, "car");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == objc_msgSend(v6, "pluginCount");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)trimAccessories
{
  NSObject *v3;
  _QWORD block[5];

  -[CAFCar refreshQueue](self, "refreshQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__CAFCar_trimAccessories__block_invoke;
  block[3] = &unk_2508FD218;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __25__CAFCar_trimAccessories__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  CAFCarLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __25__CAFCar_trimAccessories__block_invoke_cold_1();

  v3 = MEMORY[0x24BDBD1B8];
  objc_msgSend(*(id *)(a1 + 32), "setAccessories:", MEMORY[0x24BDBD1B8]);
  objc_msgSend(*(id *)(a1 + 32), "setAllAccessories:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(*(id *)(a1 + 32), "setAccessoriesByCategory:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "setTrimmedAccessories:", 1);
}

- (void)didUpdatePluginID:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    CAFGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAFCar didUpdatePluginID:values:].cold.1();
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CAFGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CAFCar didUpdatePluginID:values:].cold.3((uint64_t)v6, (uint64_t)v7, v11);
LABEL_10:

    goto LABEL_17;
  }
  CARSignpostLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (!self)
  {
    v10 = 0xEEEEB0B5B2B2EEEELL;
LABEL_12:
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v6;
      v19 = 2048;
      v20 = objc_msgSend(v7, "count");
      _os_signpost_emit_with_name_impl(&dword_237717000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Car-UpdateValues", "Update values from pluginID: %@ with value count %ld", buf, 0x16u);
    }
    goto LABEL_14;
  }
  CARSignpostLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    goto LABEL_12;
LABEL_14:

  CAFGeneralLogging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[CAFCar didUpdatePluginID:values:].cold.2((uint64_t)v6, v7, v12);

  -[CAFCar refreshQueue](self, "refreshQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__CAFCar_didUpdatePluginID_values___block_invoke;
  block[3] = &unk_2508FD358;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  dispatch_async(v13, block);

LABEL_17:
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke(id *a1)
{
  os_signpost_id_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(id *, void *, void *);
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  uint8_t buf[16];

  v2 = 0xEEEEB0B5B2B2EEEELL;
  objc_msgSend(a1[4], "updatables");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1[6];
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __35__CAFCar_didUpdatePluginID_values___block_invoke_103;
    v17 = &unk_2508FE3E8;
    v18 = v4;
    v19 = a1[5];
    v20 = a1[6];
    v7 = v5;
    v21 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v14);
    if ((unint64_t)objc_msgSend(a1[6], "count", v14, v15, v16, v17) >= 2)
    {
      CAFCarLogging();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_3(a1 + 6, v7, v8);

      -[NSObject enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_108);
    }
    CAFGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_2((uint64_t)(a1 + 5), a1 + 6, v9);

    CARSignpostLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!a1[4]
      || (CARSignpostLogForCategory(),
          v11 = objc_claimAutoreleasedReturnValue(),
          v2 = os_signpost_id_make_with_pointer(v11, a1[4]),
          v11,
          v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_237717000, v10, OS_SIGNPOST_INTERVAL_END, v2, "Car-UpdateValues", (const char *)&unk_2377DBA75, buf, 2u);
      }
    }

  }
  else
  {
    CAFGeneralLogging();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_1();

    CARSignpostLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!a1[4]
      || (CARSignpostLogForCategory(),
          v13 = objc_claimAutoreleasedReturnValue(),
          v2 = os_signpost_id_make_with_pointer(v13, a1[4]),
          v13,
          v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL))
    {
      if (os_signpost_enabled(v7))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_237717000, v7, OS_SIGNPOST_INTERVAL_END, v2, "Car-UpdateValues", (const char *)&unk_2377DBA75, buf, 2u);
      }
    }
  }

}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_103(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    CAFCarLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __35__CAFCar_didUpdatePluginID_values___block_invoke_103_cold_1();
    goto LABEL_9;
  }
  objc_msgSend(v7, "handleUpdateWithInstanceID:value:", v5, v6);
  if ((unint64_t)objc_msgSend(a1[6], "count") >= 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      -[NSObject service](v9, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[7], "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "addObject:", v9);
      objc_msgSend(a1[7], "setObject:forKey:", v12, v11);

LABEL_9:
    }
  }

}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_106(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "anyObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_didUpdateValuesForGroupedCharacteristics:", v5);
}

- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  CARSignpostLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (self)
  {
    CARSignpostLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_signpost_id_make_with_pointer(v15, self);

    if (v16 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    v16 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2048;
    v34 = objc_msgSend(v12, "count");
    _os_signpost_emit_with_name_impl(&dword_237717000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Car-RequestValues", "Request from pluginID: %@ instanceID: %@ with request count %ld", buf, 0x20u);
  }
LABEL_7:

  CAFGeneralLogging();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v23 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 138412802;
    v30 = v10;
    v31 = 2112;
    v32 = v11;
    v33 = 2048;
    v34 = v23;
    _os_log_debug_impl(&dword_237717000, v17, OS_LOG_TYPE_DEBUG, "Request received from pluginID: %@ instanceID: %@ with request count %ld START", buf, 0x20u);
  }

  -[CAFCar refreshQueue](self, "refreshQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke;
  block[3] = &unk_2508FE450;
  block[4] = self;
  v25 = v10;
  v27 = v12;
  v28 = v13;
  v26 = v11;
  v19 = v12;
  v20 = v11;
  v21 = v13;
  v22 = v10;
  dispatch_async(v18, block);

}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updatables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    CAFGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1();

    CARSignpostLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
    {
      CARSignpostLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 32));

      if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_23:

        v15 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v4);
        goto LABEL_24;
      }
    }
    else
    {
      v12 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v10))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_237717000, v10, OS_SIGNPOST_INTERVAL_END, v12, "Car-RequestValues", (const char *)&unk_2377DBA75, (uint8_t *)&v19, 2u);
    }
    goto LABEL_23;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    CAFCarLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_2();
    goto LABEL_18;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    CAFCarLogging();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_3();
LABEL_18:

    v14 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.caraccessoryframework.cardata"), 9, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, NSObject *))(v14 + 16))(v14, 0, v6);
    goto LABEL_19;
  }
  objc_msgSend(v4, "handleRequestWithValue:withResponse:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  CAFGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 48);
    v18 = objc_msgSend(*(id *)(a1 + 56), "count");
    v19 = 138412802;
    v20 = v16;
    v21 = 2112;
    v22 = v17;
    v23 = 2048;
    v24 = v18;
    _os_log_debug_impl(&dword_237717000, v5, OS_LOG_TYPE_DEBUG, "Request received from pluginID: %@ instanceID: %@ with request count %ld END", (uint8_t *)&v19, 0x20u);
  }

  CARSignpostLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 32))
  {
    v8 = 0xEEEEB0B5B2B2EEEELL;
    goto LABEL_26;
  }
  CARSignpostLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_26:
    if (os_signpost_enabled(v6))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_237717000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Car-RequestValues", (const char *)&unk_2377DBA75, (uint8_t *)&v19, 2u);
    }
  }
LABEL_19:

LABEL_24:
}

- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  CARSignpostLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (self)
  {
    CARSignpostLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_make_with_pointer(v12, self);

    if (v13 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    v13 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2048;
    v29 = objc_msgSend(v10, "count");
    _os_signpost_emit_with_name_impl(&dword_237717000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Car-RequestValues", "Notification from pluginID: %@ instanceID: %@ with request count %ld", buf, 0x20u);
  }
LABEL_7:

  CAFGeneralLogging();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v19 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 138412802;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    v28 = 2048;
    v29 = v19;
    _os_log_debug_impl(&dword_237717000, v14, OS_LOG_TYPE_DEBUG, "Notification received from pluginID: %@ instanceID: %@ with request count %ld START", buf, 0x20u);
  }

  -[CAFCar refreshQueue](self, "refreshQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke;
  v20[3] = &unk_2508FE478;
  v20[4] = self;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v8;
  dispatch_async(v15, v20);

}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "updatables");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      CAFCarLogging();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_2();
      goto LABEL_24;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      CAFCarLogging();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_3();
      goto LABEL_24;
    }
    -[NSObject handleNotificationWithValue:](v4, "handleNotificationWithValue:", *(_QWORD *)(a1 + 56));
    CAFGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = objc_msgSend(*(id *)(a1 + 56), "count");
      v15 = 138412802;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      _os_log_debug_impl(&dword_237717000, v5, OS_LOG_TYPE_DEBUG, "Notification received from pluginID: %@ instanceID: %@ with request count %ld END", (uint8_t *)&v15, 0x20u);
    }

    CARSignpostLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 32))
    {
      CARSignpostLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_make_with_pointer(v7, *(const void **)(a1 + 32));

      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      v8 = 0xEEEEB0B5B2B2EEEELL;
    }
    if (os_signpost_enabled(v6))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_237717000, v6, OS_SIGNPOST_INTERVAL_END, v8, "Car-RequestValues", (const char *)&unk_2377DBA75, (uint8_t *)&v15, 2u);
    }
    goto LABEL_24;
  }
  CAFGeneralLogging();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_1();

  CARSignpostLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 32))
  {
    CARSignpostLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_make_with_pointer(v10, *(const void **)(a1 + 32));

    if (v11 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_25;
  }
  else
  {
    v11 = 0xEEEEB0B5B2B2EEEELL;
  }
  if (os_signpost_enabled(v4))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_237717000, v4, OS_SIGNPOST_INTERVAL_END, v11, "Car-RequestValues", (const char *)&unk_2377DBA75, (uint8_t *)&v15, 2u);
  }
LABEL_25:

}

- (void)requestControl:(id)a3 value:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAFCar carManager](self, "carManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "requestControl:value:response:", v10, v9, v8);

}

- (void)notifyControl:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CAFCar carManager](self, "carManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyControl:value:", v7, v6);

}

- (void)readCharacteristic:(id)a3 response:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CAFCar carManager](self, "carManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "readCharacteristic:response:", v7, v6);

}

- (void)writeCharacteristic:(id)a3 value:(id)a4 response:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAFCar carManager](self, "carManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeCharacteristic:value:response:", v10, v9, v8);

}

- (void)enableNotificationForCharacteristic:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CAFCar carManager](self, "carManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableNotificationForCharacteristic:enable:response:", v9, v5, v8);

}

- (void)enableNotificationForControl:(id)a3 enable:(BOOL)a4 response:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CAFCar carManager](self, "carManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableNotificationForControl:enable:response:", v9, v5, v8);

}

- (void)performGroupedRequest:(id)a3 key:(id)a4 value:(id)a5 withResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[CAFCar carManager](self, "carManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performGroupedRequest:key:value:withResponse:", v13, v12, v11, v10);

}

- (void)_accessoryDidUpdate:(id)a3 service:(id)a4 characteristic:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAFCar observers](self, "observers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "carDidUpdate:accessory:service:characteristic:", self, v10, v9, v8);

}

- (void)refreshCharacteristics:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "updateValueRequiringRead:", 1);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_accessoryReceivedAllValues:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CAFCar valueMonitor](self, "valueMonitor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFCar setReceivedAllValues:](self, "setReceivedAllValues:", objc_msgSend(v6, "valueReceivedFor:", v5));
}

- (void)_accessoryDidUpdate:(id)a3 service:(id)a4 control:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CAFCar observers](self, "observers");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "carDidUpdate:accessory:service:control:", self, v10, v9, v8);

}

- (NSUUID)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[CAFCar car](self, "car");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (NSString)name
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[CAFCar car](self, "car");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("_unnamed_");
  v5 = v3;

  return v5;
}

- (NSString)typeName
{
  return (NSString *)CFSTR("Car");
}

- (BOOL)usable
{
  void *v2;
  BOOL v3;

  -[CAFCar accessories](self, "accessories");
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
  return (NSArray *)&unk_2509585F0;
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "allAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_237717000, a2, v4, "%{public}@ time to invalidate (%lu)", v5);

  OUTLINED_FUNCTION_0();
}

- (CAFCarObserver)combineObserver
{
  id v2;
  id v3;

  -[CAFCar observableCache](self, "observableCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_256812140))
    v3 = v2;
  else
    v3 = 0;

  return (CAFCarObserver *)v3;
}

- (id)currentDescriptionForCache:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  if (-[CAFCar trimmedAccessories](self, "trimmedAccessories", a3))
  {
    v4 = CFSTR("Accessories Trimmed");
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (void *)MEMORY[0x24BDD16E0];
    -[CAFCar accessories](self, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("accessoriesCount=%@"), v8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = objc_opt_class();
  -[CAFCar name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCar uniqueIdentifier](self, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAFCar isConfigured](self, "isConfigured"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (-[CAFCar receivedAllValues](self, "receivedAllValues"))
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@ %p: name=%@ uniqueIdentifier=%@ %@ isConfigured=%@ recievedAllValues=%@>"), v10, self, v11, v12, v4, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)state
{
  if (-[CAFCar receivedAllValues](self, "receivedAllValues"))
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

- (CAFCarManager)carManager
{
  return self->_carManager;
}

- (CAFPositionManager)positionManager
{
  return self->_positionManager;
}

- (void)setPositionManager:(id)a3
{
  objc_storeStrong((id *)&self->_positionManager, a3);
}

- (NSDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (BOOL)receivedAllValues
{
  return self->_receivedAllValues;
}

- (CAFDimensionManager)dimensionManager
{
  return self->_dimensionManager;
}

- (CAFCarConfiguration)car
{
  return self->_car;
}

- (void)setCar:(id)a3
{
  objc_storeStrong((id *)&self->_car, a3);
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

- (NSMutableSet)processedPluginIDs
{
  return self->_processedPluginIDs;
}

- (BOOL)trimmedAccessories
{
  return self->_trimmedAccessories;
}

- (void)setTrimmedAccessories:(BOOL)a3
{
  self->_trimmedAccessories = a3;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)refreshQueue
{
  return self->_refreshQueue;
}

- (void)setRefreshQueue:(id)a3
{
  objc_storeStrong((id *)&self->_refreshQueue, a3);
}

- (NSMutableSet)accessoryTypes
{
  return self->_accessoryTypes;
}

- (NSArray)allAccessories
{
  return self->_allAccessories;
}

- (void)setAllAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_allAccessories, a3);
}

- (NSDictionary)accessoriesByCategory
{
  return self->_accessoriesByCategory;
}

- (void)setAccessoriesByCategory:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesByCategory, a3);
}

- (NSDictionary)updatables
{
  return self->_updatables;
}

- (void)setUpdatables:(id)a3
{
  objc_storeStrong((id *)&self->_updatables, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatables, 0);
  objc_storeStrong((id *)&self->_accessoriesByCategory, 0);
  objc_storeStrong((id *)&self->_allAccessories, 0);
  objc_storeStrong((id *)&self->_accessoryTypes, 0);
  objc_storeStrong((id *)&self->_refreshQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_processedPluginIDs, 0);
  objc_storeStrong((id *)&self->_valueMonitor, 0);
  objc_storeStrong((id *)&self->_cachedDescription, 0);
  objc_storeStrong((id *)&self->_car, 0);
  objc_storeStrong((id *)&self->_dimensionManager, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_positionManager, 0);
  objc_storeStrong((id *)&self->_carManager, 0);
  objc_storeStrong(&self->_observableCache, 0);
}

- (id)mediaSourceWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[CAFCar media](self, "media");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__CAFCar_CAFNowPlaying__mediaSourceWithIdentifier___block_invoke;
  v13[3] = &unk_2508FE898;
  v7 = v4;
  v14 = v7;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v13);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[CAFCar media](self, "media");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mediaSources");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

uint64_t __51__CAFCar_CAFNowPlaying__mediaSourceWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (CAFMediaSource)currentMediaSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CAFCar nowPlayingInformation](self, "nowPlayingInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlaying");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentMediaSourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAFCar mediaSourceWithIdentifier:](self, "mediaSourceWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFMediaSource *)v6;
}

- (unsigned)np_currentFrequency
{
  void *v2;
  unsigned int v3;

  -[CAFCar currentMediaSource](self, "currentMediaSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentFrequency");

  return v3;
}

- (CAFUInt32Range)np_currentFrequencyRange
{
  void *v2;
  void *v3;

  -[CAFCar currentMediaSource](self, "currentMediaSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentFrequencyRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFUInt32Range *)v3;
}

- (CAFMediaItems)np_currentMediaItems
{
  void *v2;
  void *v3;

  -[CAFCar currentMediaSource](self, "currentMediaSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFMediaItems *)v3;
}

- (NSString)np_titleForCurrentMediaSource
{
  void *v2;
  void *v3;

  -[CAFCar currentMediaSource](self, "currentMediaSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userVisibleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (CAFAudioSettings)audioSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000002000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000002000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFAudioSettings *)v8;
}

- (CAFAutomakerExteriorCamera)automakerExteriorCamera
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001300001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001300001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFAutomakerExteriorCamera *)v8;
}

- (NSArray)automakerInputStreams
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x000000000C000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x000000000C000001"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return (NSArray *)v7;
}

- (CAFAutomakerNotificationHistory)automakerNotificationHistory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001400001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001400001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFAutomakerNotificationHistory *)v8;
}

- (NSArray)automakerNotifications
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000006000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000006000001"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return (NSArray *)v7;
}

- (NSArray)automakerRequestContent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001200001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001200001"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return (NSArray *)v7;
}

- (CAFAutomakerSettings)automakerSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000005000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000005000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFAutomakerSettings *)v8;
}

- (CAFCharging)charging
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000008"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000008"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFCharging *)v8;
}

- (CAFClimate)climate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFClimate *)v8;
}

- (CAFClosure)closure
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x000000000D000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x000000000D000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFClosure *)v8;
}

- (CAFDriveState)driveState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000003"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000003"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFDriveState *)v8;
}

- (CAFDriverAssistance)driverAssistance
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x000000000E000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x000000000E000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFDriverAssistance *)v8;
}

- (CAFElectricEngine)electricEngine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000004"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000004"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFElectricEngine *)v8;
}

- (CAFEnvironmentalConditions)environmentalConditions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001600001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001600001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFEnvironmentalConditions *)v8;
}

- (CAFFuel)fuel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000006"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000006"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFFuel *)v8;
}

- (CAFHighVoltageBattery)highVoltageBattery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000007"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000007"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFHighVoltageBattery *)v8;
}

- (CAFInternalCombustionEngine)internalCombustionEngine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000005"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000005"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFInternalCombustionEngine *)v8;
}

- (CAFMedia)media
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000003000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000003000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFMedia *)v8;
}

- (CAFNowPlayingInformation)nowPlayingInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x000000000F000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x000000000F000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFNowPlayingInformation *)v8;
}

- (CAFPairedDevices)pairedDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x000000000B000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x000000000B000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFPairedDevices *)v8;
}

- (CAFSeat)seat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001500001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001500001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFSeat *)v8;
}

- (NSArray)testingUseOnly
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x00000000FD000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x00000000FD000001"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return (NSArray *)v7;
}

- (CAFTire)tire
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x000000000A000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x000000000A000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFTire *)v8;
}

- (CAFTripComputer)tripComputer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000004000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000004000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFTripComputer *)v8;
}

- (NSArray)uiControl
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001100001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001100001"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  return (NSArray *)v7;
}

- (CAFVehicleMotion)vehicleMotion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000009000001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000009000001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFVehicleMotion *)v8;
}

- (CAFVehicleResources)vehicleResources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001200002"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001200002"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFVehicleResources *)v8;
}

- (CAFVehicleUnits)vehicleUnits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[CAFCar carManager](self, "carManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validateRegisteredForAccessory:", CFSTR("0x0000000001700001"));

  objc_opt_class();
  -[CAFCar accessoriesForCategory:](self, "accessoriesForCategory:", CFSTR("0x0000000001700001"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  return (CAFVehicleUnits *)v8;
}

- (void)initWithManager:car:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)setReceivedAllValues:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_16();
  _os_log_fault_impl(&dword_237717000, v0, OS_LOG_TYPE_FAULT, "receivedAllValues should not go back to NO", v1, 2u);
  OUTLINED_FUNCTION_15();
}

void __29__CAFCar__refreshAccessories__block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5(&dword_237717000, v0, (uint64_t)v0, "%{public}@ done didUpdate=%@", v1);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%{public}@ start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_84_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "Already parsed pluginID %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_84_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "Parsing pluginID %@ done", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_84_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "Parsing pluginID %@ start", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_86_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "Parsing accessory config from pluginID: %@ failed for accessory", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_86_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "Parsing accessory config from pluginID: %@ failed for instanceID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_86_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_237717000, v0, v1, "Creating accessory from pluginID: %@ instanceID: %@ failed");
  OUTLINED_FUNCTION_6();
}

void __29__CAFCar__refreshAccessories__block_invoke_86_cold_4()
{
  NSObject *v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_237717000, v0, (uint64_t)v0, "New accessory from pluginID: %@ instanceID: %@ found", v1);
  OUTLINED_FUNCTION_6();
}

- (void)_groupInitialization:controls:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "Group initialization inflight", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __40__CAFCar__groupInitialization_controls___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "Group notify request completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __40__CAFCar__groupInitialization_controls___block_invoke_101_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "Group read request completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

void __25__CAFCar_trimAccessories__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_4(&dword_237717000, v0, v1, "%@ trimming!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didUpdatePluginID:values:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "Error updating pluginID: %@ without values", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)didUpdatePluginID:(NSObject *)a3 values:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_237717000, a3, v4, "Update values from pluginID: %@ with value count %ld START", v5);
  OUTLINED_FUNCTION_12();
}

- (void)didUpdatePluginID:(NSObject *)a3 values:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = (id)objc_opt_class();
  v4 = v8;
  _os_log_error_impl(&dword_237717000, a3, OS_LOG_TYPE_ERROR, "Error updating pluginID: %@ with wrong updates type: %@", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_12();
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "Update values from pluginID: %@, but updatables do not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_2(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a2, "count");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_237717000, a3, v4, "Update values from pluginID: %@ with value count %ld END", v5);
  OUTLINED_FUNCTION_12();
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_cold_3(id *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(*a1, "count");
  v7 = 134218240;
  v8 = v5;
  v9 = 2048;
  v10 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_5(&dword_237717000, a3, v6, "Received grouped update for %lu values across %lu services", (uint8_t *)&v7);
  OUTLINED_FUNCTION_0();
}

void __35__CAFCar_didUpdatePluginID_values___block_invoke_103_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_2_1(&dword_237717000, v0, v1, "Received update from pluginID: %@, but updatable for instanceID: %@ does not exist.");
  OUTLINED_FUNCTION_6();
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "Request received from pluginID: %@, but updatables do not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_237717000, v0, v1, "Request received from pluginID: %@, but updatable for instanceID: %@ does not exist.");
  OUTLINED_FUNCTION_6();
}

void __59__CAFCar_didRequestPluginID_instanceID_value_withResponse___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_237717000, v0, v1, "Request received from pluginID: %@, but updatable for instanceID: %@ is not a control.");
  OUTLINED_FUNCTION_6();
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_3_0(&dword_237717000, v0, v1, "Notification received from pluginID: %@, but updatables do not exist.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_237717000, v0, v1, "Notification received from pluginID: %@, but updatable for instanceID: %@ does not exist.");
  OUTLINED_FUNCTION_6();
}

void __45__CAFCar_didNotifyPluginID_instanceID_value___block_invoke_cold_3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_237717000, v0, v1, "Notification received from pluginID: %@, but updatable for instanceID: %@ is not a control.");
  OUTLINED_FUNCTION_6();
}

@end
