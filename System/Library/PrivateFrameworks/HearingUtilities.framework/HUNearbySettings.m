@implementation HUNearbySettings

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1)
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_23);
  return (id)sharedInstance_Settings_5;
}

void __34__HUNearbySettings_sharedInstance__block_invoke()
{
  HUNearbySettings *v0;
  void *v1;

  v0 = objc_alloc_init(HUNearbySettings);
  v1 = (void *)sharedInstance_Settings_5;
  sharedInstance_Settings_5 = (uint64_t)v0;

}

+ (id)timeStamp
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss:SS"));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)dateFromTimeStamp:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss:SS"));
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isTimeStampExpired:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[HUNearbySettings dateFromTimeStamp:](HUNearbySettings, "dateFromTimeStamp:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    v7 = v6 > 86400.0;

  }
  else
  {
    HCLogHearingNearbyIDS();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[HUNearbySettings isTimeStampExpired:].cold.1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);

    v7 = 1;
  }

  return v7;
}

- (HUNearbySettings)init
{
  HUNearbySettings *v2;
  uint64_t v3;
  NSMutableDictionary *collectedOutcomingData;
  uint64_t v5;
  NSMutableDictionary *collectedIncomingData;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *saveQueue;
  uint64_t v11;
  AXDispatchTimer *saveTimer;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HUNearbySettings;
  v2 = -[HCSettings init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    collectedOutcomingData = v2->_collectedOutcomingData;
    v2->_collectedOutcomingData = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    collectedIncomingData = v2->_collectedIncomingData;
    v2->_collectedIncomingData = (NSMutableDictionary *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("hu_nearby_settings_queue", v8);
    saveQueue = v2->_saveQueue;
    v2->_saveQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", v2->_saveQueue);
    saveTimer = v2->_saveTimer;
    v2->_saveTimer = (AXDispatchTimer *)v11;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_saveTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[HUNearbySettings processAndSaveCollectedTimeStamps](v2, "processAndSaveCollectedTimeStamps");
  }
  return v2;
}

- (void)sentIDSMessage:(id)a3 domain:(id)a4 priority:(unint64_t)a5 priorityDescription:(id)a6
{
  -[HUNearbySettings addNewMessage:domain:numberData:stringData:toDictionary:](self, "addNewMessage:domain:numberData:stringData:toDictionary:", a3, a4, a5, a6, self->_collectedOutcomingData);
}

- (void)incomingIDSMessage:(id)a3 domain:(id)a4 deviceType:(int64_t)a5 deviceTypeDescription:(id)a6
{
  -[HUNearbySettings addNewMessage:domain:numberData:stringData:toDictionary:](self, "addNewMessage:domain:numberData:stringData:toDictionary:", a3, a4, a5, a6, self->_collectedIncomingData);
}

- (void)incomingXPCMessageID:(unint64_t)a3 fromPid:(int)a4
{
  const __CFString *v6;
  __CFString *v7;

  if (a3)
  {
    messageIdentifierDescription();
    v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("New XPC");
  }
  v7 = (__CFString *)v6;
  -[HUNearbySettings addNewMessage:domain:numberData:stringData:toDictionary:](self, "addNewMessage:domain:numberData:stringData:toDictionary:", MEMORY[0x1E0C9AA70], CFSTR("com.apple.heard.xpc"), a4, v6, self->_collectedIncomingData);

}

- (void)saveCollectedDataWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke;
  v6[3] = &unk_1EA8EB368;
  v7 = v4;
  v5 = v4;
  -[HUNearbySettings processAndSaveCollectedDataWithCompletion:](self, "processAndSaveCollectedDataWithCompletion:", v6);

}

void __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke_2;
  block[3] = &unk_1EA8EB368;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__HUNearbySettings_saveCollectedDataWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addNewMessage:(id)a3 domain:(id)a4 numberData:(int64_t)a5 stringData:(id)a6 toDictionary:(id)a7
{
  id v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *collectedOutcomingData;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;

  v12 = a4;
  v13 = (NSMutableDictionary *)a7;
  if (v12)
  {
    v14 = a6;
    v15 = a3;
    -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "objectForKey:", kAXSTimeStampsKey);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      v17 = (void *)objc_opt_new();
    v18 = (void *)objc_opt_new();
    +[HUNearbySettings timeStamp](HUNearbySettings, "timeStamp");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v20);

    objc_msgSend(v18, "addObject:", v14);
    -[HUNearbySettings extractMessageIDsFromMessage:](self, "extractMessageIDsFromMessage:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "addObjectsFromArray:", v21);
    objc_msgSend(v17, "addObject:", v18);
    objc_msgSend(v16, "setObject:forKey:", v17, kAXSTimeStampsKey);
    collectedOutcomingData = self->_collectedOutcomingData;
    if (a5 == 2 && collectedOutcomingData == v13)
    {
      objc_msgSend(v16, "objectForKey:", kAXSNoWakeCountKey);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24 + 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v25, kAXSNoWakeCountKey);

    }
    -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v16, v12);
    v26 = CFSTR("Incoming");
    if (collectedOutcomingData == v13)
      v26 = CFSTR("Outcoming");
    v27 = v26;
    HCLogHearingNearbyIDS();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[HUNearbySettings addNewMessage:domain:numberData:stringData:toDictionary:].cold.1();

  }
}

- (void)processAndSaveCollectedTimeStamps
{
  void *v3;
  _QWORD v4[5];

  -[HUNearbySettings saveTimer](self, "saveTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke;
  v4[3] = &unk_1EA8E8220;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4, 600.0);

}

uint64_t __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke_2;
  v3[3] = &unk_1EA8E8220;
  v3[4] = v1;
  return objc_msgSend(v1, "processAndSaveCollectedDataWithCompletion:", v3);
}

uint64_t __53__HUNearbySettings_processAndSaveCollectedTimeStamps__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAndSaveCollectedTimeStamps");
}

- (void)processAndSaveCollectedDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  +[HUNearbyController sharedInstance](HUNearbyController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nearbyUpdatesQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke;
  v8[3] = &unk_1EA8E85B0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "collectedOutcomingData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  objc_msgSend(*(id *)(a1 + 32), "collectedIncomingData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(*(id *)(a1 + 32), "collectedOutcomingData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "collectedIncomingData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "saveQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2;
  v12[3] = &unk_1EA8EB390;
  v13 = v3;
  v14 = v5;
  v9 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v10 = v5;
  v11 = v3;
  dispatch_async(v8, v12);

}

uint64_t __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "count") || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "savedData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 48), "savedDataForKey:fromData:", kAXSOutcomingDataKey, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
      objc_msgSend(*(id *)(a1 + 48), "addCollectedData:toData:isOutcoming:", *(_QWORD *)(a1 + 32), v4, 1);
    objc_msgSend(*(id *)(a1 + 48), "cleanUpExpired:andSaveToData:forKey:", v4, v3, kAXSOutcomingDataKey);
    objc_msgSend(*(id *)(a1 + 48), "savedDataForKey:fromData:", kAXSIncomingDataKey, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 40), "count"))
      objc_msgSend(*(id *)(a1 + 48), "addCollectedData:toData:isOutcoming:", *(_QWORD *)(a1 + 40), v5, 0);
    objc_msgSend(*(id *)(a1 + 48), "cleanUpExpired:andSaveToData:forKey:", v5, v3, kAXSIncomingDataKey);
    objc_msgSend(*(id *)(a1 + 48), "setValue:forPreferenceKey:", v3, kAXSNearbyPreference);
    HCLogHearingNearbyIDS();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2_cold_1((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);

  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)savedData
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[HCSettings objectValueForKey:withClass:andDefaultValue:](self, "objectValueForKey:withClass:andDefaultValue:", kAXSNearbyPreference, objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "mutableCopy");
  HCLogHearingNearbyIDS();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[HUNearbySettings savedData].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  if (!v3)
    v3 = (void *)objc_opt_new();

  return v3;
}

- (id)savedDataForKey:(id)a3 fromData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v5 = a3;
  objc_msgSend(a4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
  else
    v7 = 0;
  HCLogHearingNearbyIDS();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[HUNearbySettings savedDataForKey:fromData:].cold.1();

  if (!v7)
    v7 = (void *)objc_opt_new();

  return v7;
}

- (void)addCollectedData:(id)a3 toData:(id)a4 isOutcoming:(BOOL)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HUNearbySettings_addCollectedData_toData_isOutcoming___block_invoke;
  v9[3] = &unk_1EA8EB3B8;
  v10 = v7;
  v11 = a5;
  v8 = v7;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __56__HUNearbySettings_addCollectedData_toData_isOutcoming___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", kAXSTimeStampsKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    if (!v8)
      v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "objectForKey:", kAXSTimeStampsKey);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v16, "mutableCopy");
    if (!v9)
      v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "addObjectsFromArray:", v6);
    objc_msgSend(v7, "objectForKey:", kAXSNoWakeCountKey);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    objc_msgSend(v5, "objectForKey:", kAXSNoWakeCountKey);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v8, "setObject:forKey:", v9, kAXSTimeStampsKey);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v14, kAXSCountKey);

    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 + v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v15, kAXSNoWakeCountKey);

    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v17);

  }
}

- (void)cleanUpExpired:(id)a3 andSaveToData:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__9;
  v25 = __Block_byref_object_dispose__9;
  v26 = 0;
  v11 = objc_msgSend(v10, "isEqualToString:", kAXSOutcomingDataKey);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__HUNearbySettings_cleanUpExpired_andSaveToData_forKey___block_invoke;
  v16[3] = &unk_1EA8EB3E0;
  v16[4] = self;
  v20 = v11;
  v12 = v8;
  v17 = v12;
  v18 = &v27;
  v19 = &v21;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, kAXSTotalCountKey);

  v14 = v22[5];
  if (v14)
    objc_msgSend(v12, "setObject:forKey:", v14, kAXSTimeStampKey);
  objc_msgSend(v9, "setObject:forKey:", v12, v10);
  HCLogHearingNearbyIDS();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[HUNearbySettings cleanUpExpired:andSaveToData:forKey:].cold.1();

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __56__HUNearbySettings_cleanUpExpired_andSaveToData_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if ((objc_msgSend(v16, "isEqualToString:", kAXSTotalCountKey) & 1) == 0
    && (objc_msgSend(v16, "isEqualToString:", kAXSTimeStampKey) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cleanUpExpiredFromSavedDomainData:isOutcoming:", v5, *(unsigned __int8 *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v16);
    objc_msgSend(v6, "objectForKey:", kAXSTimeStampsKey);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", kAXSCountKey);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v9;
    if (!objc_msgSend(v7, "count"))
    {
LABEL_16:

      goto LABEL_17;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v10, "count"))
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_QWORD *)(v12 + 40))
    {
      if (!v11)
      {
LABEL_15:

        goto LABEL_16;
      }
      +[HUNearbySettings dateFromTimeStamp:](HUNearbySettings, "dateFromTimeStamp:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HUNearbySettings dateFromTimeStamp:](HUNearbySettings, "dateFromTimeStamp:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "compare:", v13) == -1)
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);

    }
    else
    {
      v15 = v11;
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v15;
    }

    goto LABEL_15;
  }
LABEL_17:

}

- (id)cleanUpExpiredFromSavedDomainData:(id)a3 isOutcoming:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v4 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKey:", kAXSTimeStampsKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v37 = v4;
    v40 = v5;
    v7 = objc_msgSend(v5, "mutableCopy");
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    v9 = (void *)objc_opt_new();
    if (objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall"))
      v10 = 500;
    else
      v10 = 100;
    if (v10 >= objc_msgSend(v8, "count"))
      v42 = 0;
    else
      v42 = objc_msgSend(v8, "count") - v10;
    v38 = (void *)v7;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    v39 = v6;
    if (v13)
    {
      v14 = v13;
      v41 = 0;
      v15 = *(_QWORD *)v44;
      v16 = 0x1E0C99000uLL;
      v17 = 0x1EA8E7000uLL;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v44 != v15)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v19, "count"))
          {
            objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(*(id *)(v17 + 2736), "isTimeStampExpired:", v20) & 1) != 0 || v42 >= 1)
            {
              v21 = v9;
              v22 = v16;
              v23 = v12;
              v24 = v17;
              v25 = v21;
              objc_msgSend(v21, "addObject:", v19);
              HCLogHearingNearbyIDS();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v48 = v19;
                _os_log_debug_impl(&dword_1DE311000, v26, OS_LOG_TYPE_DEBUG, "Will remove timeStamp: %@", buf, 0xCu);
              }

              if ((unint64_t)objc_msgSend(v19, "count") < 2)
              {
                v17 = v24;
                v12 = v23;
              }
              else
              {
                objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v17 = v24;
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v28 = objc_msgSend(v27, "unsignedIntegerValue");
                  v29 = v41;
                  if (v28 == 2)
                    v29 = v41 + 1;
                  v41 = v29;
                }
                v12 = v23;

              }
              v16 = v22;
              v30 = v42 - 1;
              if (v42 <= 0)
                v30 = 0;
              v42 = v30;
              v9 = v25;
            }

          }
          else
          {
            objc_msgSend(v9, "addObject:", v19);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v14);
    }
    else
    {
      v41 = 0;
    }

    objc_msgSend(v12, "removeObjectsInArray:", v9);
    v11 = v38;
    objc_msgSend(v38, "setObject:forKey:", v12, kAXSTimeStampsKey);
    v31 = objc_msgSend(v12, "count");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setObject:forKey:", v32, kAXSCountKey);

    if (v37)
    {
      objc_msgSend(v38, "objectForKey:", kAXSNoWakeCountKey);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "unsignedIntegerValue");

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (v34 - v41) & ~((v34 - v41) >> 63));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setObject:forKey:", v35, kAXSNoWakeCountKey);

    }
    v6 = v39;
    v5 = v40;
  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (id)extractMessageIDsFromMessage:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__HUNearbySettings_extractMessageIDsFromMessage___block_invoke;
    v6[3] = &unk_1EA8E8708;
    v7 = v4;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
  return v4;
}

void __49__HUNearbySettings_extractMessageIDsFromMessage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "unsignedIntValue");
      messageIdentifierDescription();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hcSafeAddObject:", v3);

    }
  }

}

- (id)preferenceDomainForPreferenceKey:(id)a3
{
  return (id)kAXSNearbyPreferenceDomain;
}

- (BOOL)shouldStoreLocally
{
  return 1;
}

- (NSMutableDictionary)collectedOutcomingData
{
  return self->_collectedOutcomingData;
}

- (void)setCollectedOutcomingData:(id)a3
{
  objc_storeStrong((id *)&self->_collectedOutcomingData, a3);
}

- (NSMutableDictionary)collectedIncomingData
{
  return self->_collectedIncomingData;
}

- (void)setCollectedIncomingData:(id)a3
{
  objc_storeStrong((id *)&self->_collectedIncomingData, a3);
}

- (AXDispatchTimer)saveTimer
{
  return self->_saveTimer;
}

- (void)setSaveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_saveTimer, a3);
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (void)setSaveQueue:(id)a3
{
  objc_storeStrong((id *)&self->_saveQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_collectedIncomingData, 0);
  objc_storeStrong((id *)&self->_collectedOutcomingData, 0);
}

+ (void)isTimeStampExpired:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DE311000, a2, a3, "timeStamp is nonvalid %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)addNewMessage:domain:numberData:stringData:toDictionary:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DE311000, v0, v1, "Collected IDS messages %@ statistics %@");
  OUTLINED_FUNCTION_3_0();
}

void __62__HUNearbySettings_processAndSaveCollectedDataWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_1(&dword_1DE311000, a2, a3, "IDS statistics data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)savedData
{
  OUTLINED_FUNCTION_2_1(&dword_1DE311000, a2, a3, "Saved IDS messages statistics %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)savedDataForKey:fromData:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DE311000, v0, v1, "Saved IDS messages statistics %@\n%@");
  OUTLINED_FUNCTION_3_0();
}

- (void)cleanUpExpired:andSaveToData:forKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1DE311000, v0, v1, "IDS statistics %@ data: %@");
  OUTLINED_FUNCTION_3_0();
}

@end
