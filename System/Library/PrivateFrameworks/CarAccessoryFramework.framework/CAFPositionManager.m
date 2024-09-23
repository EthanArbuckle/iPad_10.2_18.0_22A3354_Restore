@implementation CAFPositionManager

- (CAFPositionManager)initWithCar:(id)a3
{
  id v4;
  CAFPositionManager *v5;
  CAFPositionManager *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  CARObserverHashTable *observers;
  uint64_t v13;
  NSDictionary *servicesForVehicleLayoutKey;
  uint64_t v15;
  NSDictionary *vehicleLayoutKeysForServiceType;
  id WeakRetained;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAFPositionManager;
  v5 = -[CAFPositionManager init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_car, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.CarAccessoryFramework.PositionManager", v8);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_25682B768);
    observers = v6->_observers;
    v6->_observers = (CARObserverHashTable *)v11;

    v13 = objc_opt_new();
    servicesForVehicleLayoutKey = v6->_servicesForVehicleLayoutKey;
    v6->_servicesForVehicleLayoutKey = (NSDictionary *)v13;

    v15 = objc_opt_new();
    vehicleLayoutKeysForServiceType = v6->_vehicleLayoutKeysForServiceType;
    v6->_vehicleLayoutKeysForServiceType = (NSDictionary *)v15;

    -[CAFPositionManager setState:](v6, "setState:", 6);
    WeakRetained = objc_loadWeakRetained((id *)&v6->_car);
    objc_msgSend(WeakRetained, "registerObserver:", v6);

  }
  return v6;
}

- (void)setState:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  CAFPositionManager *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_state != a3)
  {
    CAFPositionManagerLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromCharacteristicState(self->_state);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCharacteristicState(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543874;
      v10 = self;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_debug_impl(&dword_237717000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ transitioning state from %@ to %@", (uint8_t *)&v9, 0x20u);

    }
    self->_state = a3;
    -[CAFPositionManager observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "positionManager:didUpdateState:", self, self->_state);

  }
}

- (unint64_t)_queue_currentState
{
  void *v3;
  int v4;

  -[CAFPositionManager car](self, "car");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConfigured");

  if (v4)
    return -[CAFPositionManager _queue_positionServicesState](self, "_queue_positionServicesState");
  else
    return 6;
}

- (unint64_t)_queue_positionServicesState
{
  void *v3;
  unint64_t v4;

  -[CAFPositionManager positionedServices](self, "positionedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAFPositionManager _stateForPositionedServices:](self, "_stateForPositionedServices:", v3);

  return v4;
}

- (unint64_t)_stateForPositionedServices:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v15;
  NSObject *v16;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v10, "vehicleLayoutKeyCharacteristic");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "vehicleLayoutKeyCharacteristic");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "state");

            if (v13 <= 6 && ((1 << v13) & 0x71) != 0)
            {
              CAFPositionManagerLogging();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
                -[CAFPositionManager _stateForPositionedServices:].cold.1((uint64_t)self, (uint64_t)v10, v16);

              v15 = 6;
              goto LABEL_21;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v15 = 3;
        if (v7)
          continue;
        break;
      }
    }
    else
    {
      v15 = 3;
    }
LABEL_21:

  }
  else
  {
    v15 = 6;
  }

  return v15;
}

- (NSArray)vehicleLayoutKeys
{
  void *v2;
  void *v3;

  -[CAFPositionManager servicesForVehicleLayoutKey](self, "servicesForVehicleLayoutKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)servicesForVehicleLayoutKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAFPositionManager servicesForVehicleLayoutKey](self, "servicesForVehicleLayoutKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)vehicleLayoutKeysFor:(Class)a3
{
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
  v6 = (id)MEMORY[0x24BDBD1A8];
  if (v5)
  {
    -[objc_class serviceIdentifier](a3, "serviceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAFPositionManager vehicleLayoutKeysForServiceType](self, "vehicleLayoutKeysForServiceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v6;
    v6 = v12;

  }
  return v6;
}

- (BOOL)accessoryIsTracked:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAFPositionManager positionedAccessories](self, "positionedAccessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFPositionManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CAFPositionManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (id)_positionedServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[CAFPositionManager car](self, "car");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v19 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v8, "services");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "allValues");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v21;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v21 != v13)
                objc_enumerationMutation(v10);
              v15 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v14);
              if (objc_msgSend(v15, "conformsToProtocol:", &unk_256814068))
              {
                if (!v15)
                  goto LABEL_15;
                objc_msgSend(v15, "registerObserver:", self);
                objc_msgSend(v3, "addObject:", v15);
              }

LABEL_15:
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v12);
        }

        ++v7;
      }
      while (v7 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  return v3;
}

- (void)_rebuildCacheIfNeededforReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CAFPositionManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke;
  v7[3] = &unk_2508FD240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  _BYTE v16[24];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_positionedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*v2, "_stateForPositionedServices:", v3);
  CAFPositionManagerLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v10, "positionedServices");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = objc_msgSend(v3, "count");
    *(_DWORD *)v16 = 138413570;
    v15 = CFSTR("NO");
    *(_QWORD *)&v16[4] = v10;
    *(_WORD *)&v16[12] = 2080;
    *(_QWORD *)&v16[14] = "-[CAFPositionManager _rebuildCacheIfNeededforReason:]_block_invoke";
    *(_WORD *)&v16[22] = 2112;
    if (v4 == 3)
      v15 = CFSTR("YES");
    v17 = v11;
    v18 = 2048;
    v19 = v13;
    v20 = 2048;
    v21 = v14;
    v22 = 2112;
    v23 = v15;
    _os_log_debug_impl(&dword_237717000, v5, OS_LOG_TYPE_DEBUG, "%@ %s (%@) %lu services already tracked. Considering tracking %lu. readyToBuildCache=%@", v16, 0x3Eu);

  }
  if (v4 == 3)
  {
    objc_msgSend(*v2, "setPositionedServices:", v3);
    objc_msgSend(*v2, "_queue_buildTrackingCache");
    CAFPositionManagerLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke_cold_1(v2, v6);

    objc_msgSend(*v2, "car");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isConfigured");

    if (v8)
      objc_msgSend(*v2, "setState:", 3);
    objc_msgSend(*v2, "observers", *(_OWORD *)v16, *(_QWORD *)&v16[16]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "positionManagerDidUpdateTracking:", *v2);

  }
}

- (void)_queue_buildTrackingCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  CAFPositionManager *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v26 = self;
  -[CAFPositionManager positionedServices](self, "positionedServices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v11, "vehicleLayoutKey");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "accessory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v14);

          objc_msgSend(v11, "vehicleLayoutKey");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = (void *)objc_opt_new();
            objc_msgSend(v11, "vehicleLayoutKey");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v18);

          }
          objc_msgSend(v11, "vehicleLayoutKey");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v11);

          objc_msgSend((id)objc_opt_class(), "serviceIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            v23 = (void *)objc_opt_new();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, v21);

          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "vehicleLayoutKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addObject:", v25);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  -[CAFPositionManager setPositionedAccessories:](v26, "setPositionedAccessories:", v5);
  -[CAFPositionManager setServicesForVehicleLayoutKey:](v26, "setServicesForVehicleLayoutKey:", v3);
  -[CAFPositionManager setVehicleLayoutKeysForServiceType:](v26, "setVehicleLayoutKeysForServiceType:", v4);

}

- (BOOL)_isVehicleLayoutKeyCharacteristic:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "typeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFCharacteristicTypes characteristicNameByType](CAFCharacteristicTypes, "characteristicNameByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("0x0000000036000065"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

- (void)carDidUpdateAccessories:(id)a3
{
  -[CAFPositionManager _rebuildCacheIfNeededforReason:](self, "_rebuildCacheIfNeededforReason:", CFSTR("Accessory Update"));
}

- (void)serviceDidUpdate:(id)a3 characteristic:(id)a4 fromGroupUpdate:(BOOL)a5
{
  if (-[CAFPositionManager _isVehicleLayoutKeyCharacteristic:](self, "_isVehicleLayoutKeyCharacteristic:", a4))
    -[CAFPositionManager _rebuildCacheIfNeededforReason:](self, "_rebuildCacheIfNeededforReason:", CFSTR("Service Update"));
}

- (id)servicesFor:(Class)a3 row:(unint64_t)a4 column:(unint64_t)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CAFPositionManager positionedServices](self, "positionedServices", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12);
        if (objc_msgSend((id)objc_opt_class(), "isEqual:", a3))
          objc_msgSend(v7, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (CAFCar)car
{
  return (CAFCar *)objc_loadWeakRetained((id *)&self->_car);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSSet)positionedAccessories
{
  return self->_positionedAccessories;
}

- (void)setPositionedAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_positionedAccessories, a3);
}

- (NSArray)positionedServices
{
  return self->_positionedServices;
}

- (void)setPositionedServices:(id)a3
{
  objc_storeStrong((id *)&self->_positionedServices, a3);
}

- (NSDictionary)servicesForVehicleLayoutKey
{
  return self->_servicesForVehicleLayoutKey;
}

- (void)setServicesForVehicleLayoutKey:(id)a3
{
  objc_storeStrong((id *)&self->_servicesForVehicleLayoutKey, a3);
}

- (NSDictionary)vehicleLayoutKeysForServiceType
{
  return self->_vehicleLayoutKeysForServiceType;
}

- (void)setVehicleLayoutKeysForServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLayoutKeysForServiceType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleLayoutKeysForServiceType, 0);
  objc_storeStrong((id *)&self->_servicesForVehicleLayoutKey, 0);
  objc_storeStrong((id *)&self->_positionedServices, 0);
  objc_storeStrong((id *)&self->_positionedAccessories, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_car);
}

- (void)_stateForPositionedServices:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138543874;
  v4 = a1;
  v5 = 2080;
  v6 = "-[CAFPositionManager _stateForPositionedServices:]";
  v7 = 2112;
  v8 = a2;
  OUTLINED_FUNCTION_0_0(&dword_237717000, a3, (uint64_t)a3, "%{public}@ %s vehicleLayoutKey pending for %@", (uint8_t *)&v3);
}

void __53__CAFPositionManager__rebuildCacheIfNeededforReason___block_invoke_cold_1(id *a1, NSObject *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  id v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  objc_msgSend(*a1, "positionedServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v3;
  v8 = 2080;
  v9 = "-[CAFPositionManager _rebuildCacheIfNeededforReason:]_block_invoke";
  v10 = 2048;
  v11 = objc_msgSend(v4, "count");
  OUTLINED_FUNCTION_0_0(&dword_237717000, a2, v5, "%@ %s cache was rebuilt, now tracking %lu services.", (uint8_t *)&v6);

}

@end
