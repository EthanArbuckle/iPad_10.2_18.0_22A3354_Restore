@implementation HKAudioExposureDevicesDataSource

- (HKAudioExposureDevicesDataSource)initWithDeviceType:(unint64_t)a3 healthStore:(id)a4
{
  id v7;
  HKAudioExposureDevicesDataSource *v8;
  HKAudioExposureDevicesDataSource *v9;
  uint64_t v10;
  NSSet *devices;
  NSDictionary *devicesByName;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HKObserverSet *observers;
  HKQuery *query;
  objc_super v21;

  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HKAudioExposureDevicesDataSource;
  v8 = -[HKAudioExposureDevicesDataSource init](&v21, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_ready = 0;
    v8->_deviceType = a3;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    devices = v9->_devices;
    v9->_devices = (NSSet *)v10;

    devicesByName = v9->_devicesByName;
    v9->_devicesByName = (NSDictionary *)MEMORY[0x1E0C9AA70];

    objc_storeStrong((id *)&v9->_healthStore, a4);
    v13 = objc_alloc(MEMORY[0x1E0CB6988]);
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "initWithName:loggingCategory:", v15, v16);
    observers = v9->_observers;
    v9->_observers = (HKObserverSet *)v17;

    query = v9->_query;
    v9->_query = 0;

  }
  return v9;
}

- (int64_t)deviceCount
{
  void *v2;
  int64_t v3;

  -[HKAudioExposureDevicesDataSource devices](self, "devices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)startQuery
{
  void *v3;
  void *v4;
  id v5;

  -[HKAudioExposureDevicesDataSource setReady:](self, "setReady:", 0);
  -[HKAudioExposureDevicesDataSource _makeDeviceQueryForDeviceType](self, "_makeDeviceQueryForDeviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudioExposureDevicesDataSource setQuery:](self, "setQuery:", v3);

  -[HKAudioExposureDevicesDataSource healthStore](self, "healthStore");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKAudioExposureDevicesDataSource query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:", v4);

}

- (void)cancelQuery
{
  -[HKAudioExposureDevicesDataSource setReady:](self, "setReady:", 0);
  -[HKAudioExposureDevicesDataSource _cleanUp](self, "_cleanUp");
}

- (void)_cleanUp
{
  void *v3;
  void *v4;

  -[HKAudioExposureDevicesDataSource healthStore](self, "healthStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudioExposureDevicesDataSource query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopQuery:", v4);

  -[HKAudioExposureDevicesDataSource setQuery:](self, "setQuery:", 0);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HKAudioExposureDevicesDataSource observers](self, "observers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerObserver:queue:", v4, MEMORY[0x1E0C80D38]);

  if (-[HKAudioExposureDevicesDataSource isReady](self, "isReady"))
    -[HKAudioExposureDevicesDataSource _notify_dataSourceIsReady](self, "_notify_dataSourceIsReady");
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKAudioExposureDevicesDataSource observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)_notify_dataSourceIsReady
{
  void *v3;
  _QWORD v4[5];

  -[HKAudioExposureDevicesDataSource observers](self, "observers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HKAudioExposureDevicesDataSource__notify_dataSourceIsReady__block_invoke;
  v4[3] = &unk_1E9C437A0;
  v4[4] = self;
  objc_msgSend(v3, "notifyObservers:", v4);

}

void __61__HKAudioExposureDevicesDataSource__notify_dataSourceIsReady__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "audioExposureDataSourceIsReady:", *(_QWORD *)(a1 + 32));

}

- (id)_makeDeviceQueryForDeviceType
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke;
  aBlock[3] = &unk_1E9C437F0;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = objc_alloc(MEMORY[0x1E0CB65F8]);
  -[HKAudioExposureDevicesDataSource _sampleTypeForDeviceType](self, "_sampleTypeForDeviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithObjectType:predicate:resultsHandler:", v5, 0, v3);

  return v6;
}

void __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id obj;
  _QWORD block[7];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v22 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_cleanUp");
  v23 = v8;
  v24 = v9;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_cold_1((uint64_t)v24, v10);
  }
  else
  {
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__14;
    v41 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__14;
    v35 = __Block_byref_object_dispose__14;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)v38[5];
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1D829F904]();
          objc_msgSend(*(id *)(a1 + 32), "_localizedNameForDevice:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v32[5], "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "set");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v17;
          }
          v19 = (void *)objc_msgSend(v17, "mutableCopy");
          if (!v18)

          objc_msgSend(v19, "addObject:", v14);
          v20 = (void *)v32[5];
          v21 = (void *)objc_msgSend(v19, "copy");
          objc_msgSend(v20, "setValue:forKey:", v21, v16);

          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_188;
    block[3] = &unk_1E9C437C8;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = &v37;
    block[6] = &v31;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v37, 8);
  }

}

uint64_t __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_188(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDevices:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setDevicesByName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 32), "setReady:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_notify_dataSourceIsReady");
}

- (id)_sampleTypeForDeviceType
{
  void *v2;
  _QWORD *v3;

  v2 = -[HKAudioExposureDevicesDataSource deviceType](self, "deviceType");
  if (!v2)
  {
    v3 = (_QWORD *)MEMORY[0x1E0CB5CA8];
    goto LABEL_5;
  }
  if (v2 == (void *)1)
  {
    v3 = (_QWORD *)MEMORY[0x1E0CB5C78];
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)_localizedNameForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("wired"));

    if (!v7)
    {
      objc_msgSend(v3, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("WIRED_HEADPHONE_DEVICE_NAME");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("UNKNOWN_DEVICE_NAME");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (BOOL)isReady
{
  return self->_ready;
}

- (void)setReady:(BOOL)a3
{
  self->_ready = a3;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(unint64_t)a3
{
  self->_deviceType = a3;
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)devicesByName
{
  return self->_devicesByName;
}

- (void)setDevicesByName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKObserverSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (HKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_devicesByName, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

void __65__HKAudioExposureDevicesDataSource__makeDeviceQueryForDeviceType__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Error querying for audio exposure sample devices: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
