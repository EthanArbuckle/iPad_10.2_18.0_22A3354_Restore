@implementation HAENHealthKitStore

+ (id)sharedInstance
{
  if (sharedInstance_once_1 != -1)
    dispatch_once(&sharedInstance_once_1, &__block_literal_global_1);
  return (id)sharedInstance_instance_1;
}

void __36__HAENHealthKitStore_sharedInstance__block_invoke()
{
  HAENHealthKitStore *v0;
  void *v1;

  v0 = objc_alloc_init(HAENHealthKitStore);
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (HAENHealthKitStore)init
{
  HAENHealthKitStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  HKHealthStore *healthStore;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HAENHealthKitStore;
  v2 = -[HAENHealthKitStore init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.coreaudio.hae.notifications.hkq", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    healthStore = v2->_healthStore;
    v2->_healthStore = 0;

  }
  return v2;
}

+ (id)createHKCategorySampleForEvent:(id)a3
{
  id v3;
  NSObject *v4;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "eventType") == 2003133803)
  {
    if (!objc_opt_class())
    {
      v21 = 0;
      goto LABEL_14;
    }
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("_HAENMetadataIdentifierWeeklyExposureDuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD3E48];
      objc_msgSend(MEMORY[0x24BDD4050], "secondUnit");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v7, "quantityWithUnit:doubleValue:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v4, "setObject:forKey:", v9, *MEMORY[0x24BDD3148]);

    }
    objc_msgSend(v3, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("_HAENMetadataIdentifierWeeklyIncludesPrunableData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      -[NSObject setObject:forKey:](v4, "setObject:forKey:", v11, CFSTR("_HKPrivateMetadataKeyNotificationIncludesPrunableData"));
    v12 = (void *)MEMORY[0x24BDD3E48];
    objc_msgSend(MEMORY[0x24BDD4050], "decibelAWeightedSoundPressureLevelUnit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "level");
    objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v4, "setObject:forKey:", v14, *MEMORY[0x24BDD3158]);

    v15 = (void *)MEMORY[0x24BDD3980];
    objc_msgSend(MEMORY[0x24BDD3DB8], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2920]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateInterval");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "categorySampleWithType:value:startDate:endDate:device:metadata:", v16, 1, v18, v20, 0, v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    HAENotificationsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "uuid");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412546;
      v26 = v21;
      v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_2144B3000, v22, OS_LOG_TYPE_DEFAULT, "created HKCategorySample [ %@ ] for event [ %@ ]", (uint8_t *)&v25, 0x16u);

    }
  }
  else
  {
    HAENotificationsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[HAENHealthKitStore createHKCategorySampleForEvent:].cold.1((uint64_t)v3, v4);
    v21 = 0;
  }

LABEL_14:
  return v21;
}

- (id)saveNotificationEventToHealthKit:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *queue;
  void *v10;
  _QWORD v12[4];
  id v13;
  HAENHealthKitStore *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HAENotificationsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_2144B3000, v5, OS_LOG_TYPE_DEFAULT, "saving notification event [ %@ ] to HealthKit", buf, 0xCu);

  }
  +[HAENHealthKitStore createHKCategorySampleForEvent:](HAENHealthKitStore, "createHKCategorySampleForEvent:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke;
    v12[3] = &unk_24D19F1B8;
    v13 = v7;
    v14 = self;
    dispatch_async(queue, v12);

    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HAENotficiationsError"), *(_QWORD *)"skh!", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HAENotificationsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2144B3000, v2, OS_LOG_TYPE_DEFAULT, "saving HKCategorySample [ %@ ] to healthkit", buf, 0xCu);

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) && objc_opt_class())
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD3C38]);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

  }
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_194;
  v9[3] = &unk_24D19F280;
  v10 = v7;
  objc_msgSend(v8, "saveObject:withCompletion:", v10, v9);

}

void __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_194(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    HAENotificationsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_194_cold_1(a1, (uint64_t)v5, v6);

  }
}

- (id)saveNotificationEventToHealthKit:(id)a3 withDelegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *queue;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HAENotificationsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v9;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_2144B3000, v8, OS_LOG_TYPE_DEFAULT, "saving notification event [ %@ ] to HealthKit using delegate: %@", buf, 0x16u);

  }
  if (v7)
  {
    +[HAENHealthKitStore createHKCategorySampleForEvent:](HAENHealthKitStore, "createHKCategorySampleForEvent:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      queue = self->_queue;
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __68__HAENHealthKitStore_saveNotificationEventToHealthKit_withDelegate___block_invoke;
      v15[3] = &unk_24D19F1B8;
      v16 = v10;
      v17 = v7;
      dispatch_async(queue, v15);

      v13 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HAENotficiationsError"), *(_QWORD *)"skh!", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HAENotficiationsError"), *(_QWORD *)"gld!", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

uint64_t __68__HAENHealthKitStore_saveNotificationEventToHealthKit_withDelegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HAENotificationsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2144B3000, v2, OS_LOG_TYPE_DEFAULT, "saving HKCategorySample [ %@ ] to HealthKit through HAENotificationCenterUserDelegate", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "saveHAENotificationEventAsHKCategorySample:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)createHKCategorySampleForEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2144B3000, a2, OS_LOG_TYPE_ERROR, "unknown event type %@", (uint8_t *)&v2, 0xCu);
}

void __55__HAENHealthKitStore_saveNotificationEventToHealthKit___block_invoke_194_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_2144B3000, a3, OS_LOG_TYPE_ERROR, "failed to write healthkit sample [ %@ ], error: %@", (uint8_t *)&v6, 0x16u);

}

@end
