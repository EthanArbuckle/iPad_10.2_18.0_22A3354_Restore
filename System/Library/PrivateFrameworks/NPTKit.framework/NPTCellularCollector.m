@implementation NPTCellularCollector

- (NPTCellularCollector)init
{
  void *v3;
  NPTCellularCollector *v4;

  +[NPTCellularCollector getPreferredDataSlot](NPTCellularCollector, "getPreferredDataSlot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NPTCellularCollector initWithSlotID:](self, "initWithSlotID:", v3);

  return v4;
}

- (NPTCellularCollector)initWithSlotID:(id)a3
{
  id v5;
  NPTCellularCollector *v6;
  NSMutableArray *v7;
  NSMutableArray *mutableCellChanges;
  NSMutableArray *v9;
  NSMutableArray *mutableDataStatusChanges;
  NSMutableDictionary *v11;
  NSMutableDictionary *mutableMetadata;
  NSMutableDictionary *v13;
  NSMutableDictionary *servingCellInfo;
  id v15;
  void *v16;
  uint64_t v17;
  CoreTelephonyClient *ctClient;
  CTTelephonyNetworkInfo *v19;
  CTTelephonyNetworkInfo *networkInfo;
  uint64_t v21;
  uint64_t v22;
  CTXPCServiceSubscriptionContext *context;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NPTCellularCollector;
  v6 = -[NPTCellularCollector init](&v25, sel_init);
  if (v6)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableCellChanges = v6->_mutableCellChanges;
    v6->_mutableCellChanges = v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mutableDataStatusChanges = v6->_mutableDataStatusChanges;
    v6->_mutableDataStatusChanges = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    mutableMetadata = v6->_mutableMetadata;
    v6->_mutableMetadata = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    servingCellInfo = v6->_servingCellInfo;
    v6->_servingCellInfo = v13;

    v15 = objc_alloc(MEMORY[0x24BDC2810]);
    dispatch_get_global_queue(2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithQueue:", v16);
    ctClient = v6->_ctClient;
    v6->_ctClient = (CoreTelephonyClient *)v17;

    -[CoreTelephonyClient setDelegate:](v6->_ctClient, "setDelegate:", v6);
    objc_storeStrong((id *)&v6->_slotID, a3);
    v19 = (CTTelephonyNetworkInfo *)objc_alloc_init(MEMORY[0x24BDC27F8]);
    networkInfo = v6->_networkInfo;
    v6->_networkInfo = v19;

    if ((objc_msgSend(v5, "isEqualToNumber:", &unk_24C9A7700) & 1) != 0)
    {
      v21 = 1;
    }
    else if ((objc_msgSend(v5, "isEqualToNumber:", &unk_24C9A7718) & 1) != 0)
    {
      v21 = 2;
    }
    else
    {
      NSLog(CFSTR("Expecting slotID to be 1 or 2. Received %@. Passing SlotUnknown to CT"), v5);
      v21 = 0;
    }
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2800]), "initWithSlot:", v21);
    context = v6->_context;
    v6->_context = (CTXPCServiceSubscriptionContext *)v22;

  }
  return v6;
}

- (NSDictionary)metadata
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE70];
  -[NPTCellularCollector mutableMetadata](self, "mutableMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (id)dualSimStatus
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  id result;
  uint64_t v8;

  -[NPTCellularCollector ctClient](self, "ctClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return CFSTR("Unknown");
  -[NPTCellularCollector ctClient](self, "ctClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v5 = objc_msgSend(v4, "getDualSimCapability:", &v8);
  v6 = v8;

  result = CFSTR("Unknown");
  if (!v6 && v5 <= 4)
    return off_24C990F00[v5];
  return result;
}

- (id)wrmBasebandMetrics
{
  id v3;
  id v4;
  dispatch_semaphore_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  dispatch_time_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NPTCellularCollector *v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  dispatch_semaphore_t dsema;
  NSObject *queue;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[4];
  id v32;
  id v33;
  _QWORD v34[5];
  dispatch_semaphore_t v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[3];
  int v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v26 = v3;
  if (objc_opt_class())
  {
    v4 = objc_alloc_init(MEMORY[0x24BEC2AF0]);
    queue = dispatch_queue_create("com.apple.Client.queueBB.wirelesscoexmanager", 0);
    objc_msgSend(v4, "registerClient:queue:", 33);
    v5 = dispatch_semaphore_create(0);
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy_;
    v42 = __Block_byref_object_dispose_;
    v43 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6 = MEMORY[0x24BDAC760];
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke;
    v34[3] = &unk_24C990DC8;
    v34[4] = self;
    v36 = &v38;
    v37 = v44;
    dsema = v5;
    v35 = dsema;
    v7 = (void *)MEMORY[0x212BC40E0](v34);
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke_2;
    block[3] = &unk_24C990DF0;
    v8 = v4;
    v32 = v8;
    v23 = v7;
    v33 = v23;
    dispatch_async(queue, block);
    v9 = dispatch_walltime(0, 1000000000);
    dispatch_semaphore_wait(dsema, v9);
    v22 = v8;
    objc_msgSend(v8, "unregisterClient");
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = objc_msgSend(&unk_24C9A7CB0, "countByEnumeratingWithState:objects:count:", &v27, v46, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v28;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(&unk_24C9A7CB0);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
          v14 = self;
          objc_sync_enter(v14);
          objc_msgSend((id)v39[5], "valueForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (v16 = v15,
                  objc_msgSend(MEMORY[0x24BDD1518], "notANumber"),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  v18 = objc_msgSend(v16, "isEqualToNumber:", v17),
                  v17,
                  v16,
                  (v18 & 1) == 0))
            {
              objc_msgSend(&unk_24C9A7CB0, "objectForKey:", v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "setObject:forKey:", v15, v19);

            }
          }

          objc_sync_exit(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(&unk_24C9A7CB0, "countByEnumeratingWithState:objects:count:", &v27, v46, 16);
      }
      while (v10);
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v44, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

void __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;

  v6 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addEntriesFromDictionary:", v6);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v5 = *(_DWORD *)(v4 + 24);
  *(_DWORD *)(v4 + 24) = v5 + 1;
  if (v5 >= 3)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  objc_sync_exit(v3);

}

uint64_t __42__NPTCellularCollector_wrmBasebandMetrics__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "getNRPhyMetrics:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "getCellularDataMetrics:", *(_QWORD *)(a1 + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "getWiFiBWEstimationMetrics:", *(_QWORD *)(a1 + 40));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "getQSHMetrics:", *(_QWORD *)(a1 + 40));
  return result;
}

- (id)signalStrengthMeasurements
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCellularCollector ctClient](self, "ctClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NPTCellularCollector signalStrengthMeasurements].cold.2(v8);
    goto LABEL_9;
  }
  v6 = (void *)MEMORY[0x24BDC27B0];
  -[NPTCellularCollector context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "descriptorWithSubscriptionContext:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  -[NPTCellularCollector ctClient](self, "ctClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v9, "getSignalStrengthMeasurements:error:", v8, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;

  if (!v11)
  {
    objc_msgSend(v10, "rssi");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cellular_rssi"));

    objc_msgSend(v10, "rscp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cellular_rscp"));

    objc_msgSend(v10, "ecn0");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("cellular_ecn0"));

    objc_msgSend(v10, "rsrp");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("cellular_rsrp"));

    objc_msgSend(v10, "rsrq");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("cellular_rsrq"));

    objc_msgSend(v10, "snr");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("cellular_snr"));

    objc_msgSend(v10, "ecio");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("cellular_ecio"));

    objc_msgSend(v10, "rxagc");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("cellular_rxagc"));

LABEL_9:
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[NPTLogger cellular](NPTLogger, "cellular");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[NPTCellularCollector signalStrengthMeasurements].cold.1(self, v11, v12);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v13;
}

- (id)getCellularMNCMCCDE
{
  id v3;
  CoreTelephonyClient *ctClient;
  CTXPCServiceSubscriptionContext *context;
  void *v6;
  id v7;
  NSObject *v8;
  CoreTelephonyClient *v9;
  CTXPCServiceSubscriptionContext *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t IsEnabled;
  int v15;
  NSObject *v16;
  void *v17;
  id v19;
  id v20;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  ctClient = self->_ctClient;
  context = self->_context;
  v20 = 0;
  v6 = (void *)-[CoreTelephonyClient copyMobileCountryCode:error:](ctClient, "copyMobileCountryCode:error:", context, &v20);
  v7 = v20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("cellular_rn_mobile_country_code"));

  if (v7)
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NPTCellularCollector getCellularMNCMCCDE].cold.3();

  }
  v9 = self->_ctClient;
  v10 = self->_context;
  v19 = v7;
  v11 = (void *)-[CoreTelephonyClient copyMobileNetworkCode:error:](v9, "copyMobileNetworkCode:error:", v10, &v19);
  v12 = v19;

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("cellular_rn_mobile_network_code"));
  if (v12)
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NPTCellularCollector getCellularMNCMCCDE].cold.2();

  }
  _CTServerConnectionCreate();
  IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  v15 = HIDWORD(IsEnabled);
  if ((_DWORD)IsEnabled)
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[NPTCellularCollector getCellularMNCMCCDE].cold.1(v15, v16);

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("cellular_data_is_enabled"));
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)getCellInfoForSlot:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  dispatch_time_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  intptr_t (*v18)(uint64_t, void *);
  void *v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc(MEMORY[0x24BDC2810]);
  dispatch_get_global_queue(2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithQueue:", v5);

  if (objc_msgSend(v3, "isEqualToNumber:", &unk_24C9A7700))
  {
    v7 = objc_alloc(MEMORY[0x24BDC2800]);
    v8 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToNumber:", &unk_24C9A7718))
  {
    v7 = objc_alloc(MEMORY[0x24BDC2800]);
    v8 = 2;
  }
  else
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NPTCellularCollector getCellInfoForSlot:].cold.1();

    v7 = objc_alloc(MEMORY[0x24BDC2800]);
    v8 = 0;
  }
  v10 = (void *)objc_msgSend(v7, "initWithSlot:", v8);
  v11 = dispatch_semaphore_create(0);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __43__NPTCellularCollector_getCellInfoForSlot___block_invoke;
  v19 = &unk_24C990E18;
  v21 = &v22;
  v12 = v11;
  v20 = v12;
  objc_msgSend(v6, "copyCellInfo:completion:", v10, &v16);
  v13 = dispatch_time(0, 500000000);
  dispatch_semaphore_wait(v12, v13);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v23[5], v16, v17, v18, v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v22, 8);
  return v14;
}

intptr_t __43__NPTCellularCollector_getCellInfoForSlot___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a2, "legacyInfo", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x24BDC2A08];
    v8 = *MEMORY[0x24BDC2A18];
    v9 = *MEMORY[0x24BDC2A10];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "valueForKey:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isEqualToString:", v8) & 1) != 0
          || objc_msgSend(v12, "isEqualToString:", v9))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addEntriesFromDictionary:", v11);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)startCollectingWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CoreTelephonyClient *ctClient;
  CTXPCServiceSubscriptionContext *context;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  CoreTelephonyClient *v27;
  void *v28;
  id v29;
  void *v30;
  CoreTelephonyClient *v31;
  CTXPCServiceSubscriptionContext *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  CoreTelephonyClient *v37;
  CTXPCServiceSubscriptionContext *v38;
  uint64_t v39;
  id v40;
  void *v41;
  CoreTelephonyClient *v42;
  CTXPCServiceSubscriptionContext *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NPTCellularCollector *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void (**v64)(id, void *, void *);
  _QWORD v65[5];
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  id v76;

  v64 = (void (**)(id, void *, void *))a3;
  v63 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTCellularCollector setStopCollectingMetadata:](self, "setStopCollectingMetadata:", 0);
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTCellularCollector setCachedMetadata:](self, "setCachedMetadata:", v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTCellularCollector cachedMetadata](self, "cachedMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6);

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTCellularCollector cachedMetadata](self, "cachedMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("events"));

  -[NPTCellularCollector dualSimStatus](self, "dualSimStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("cellular_dual_sim_capability"));

  -[NPTCellularCollector slotID](self, "slotID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCellularCollector getCellInfoForSlot:](self, "getCellInfoForSlot:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    v74[0] = MEMORY[0x24BDAC760];
    v74[1] = 3221225472;
    v74[2] = __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke;
    v74[3] = &unk_24C990E40;
    v75 = &unk_24C9A7CD8;
    v76 = v4;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v74);

  }
  v62 = v12;
  -[NPTCellularCollector signalStrengthMeasurements](self, "signalStrengthMeasurements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v14);

  -[NPTCellularCollector networkInfo](self, "networkInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataServiceIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();

  -[NPTCellularCollector networkInfo](self, "networkInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "serviceCurrentRadioAccessTechnology");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)v16;
  objc_msgSend(v18, "objectForKeyedSubscript:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("CTRadioAccessTechnology"), &stru_24C992208);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("cellular_radio_access_technology"));

  }
  ctClient = self->_ctClient;
  context = self->_context;
  v73 = 0;
  v23 = (void *)-[CoreTelephonyClient copyMobileSubscriberCountryCode:error:](ctClient, "copyMobileSubscriberCountryCode:error:", context, &v73);
  v24 = v73;
  v25 = v24;
  if (v23 && !v24)
  {
    objc_msgSend(v23, "uppercaseString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, CFSTR("cellular_mobile_country_code"));

    v27 = self->_ctClient;
    v72 = 0;
    v28 = (void *)-[CoreTelephonyClient copyMobileSubscriberIsoCountryCode:error:](v27, "copyMobileSubscriberIsoCountryCode:error:", v23, &v72);
    v29 = v72;
    v25 = v29;
    if (v28 && !v29)
    {
      objc_msgSend(v28, "uppercaseString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("cellular_iso_country_code"));

    }
  }
  v31 = self->_ctClient;
  v32 = self->_context;
  v71 = v25;
  v33 = (void *)-[CoreTelephonyClient copyMobileSubscriberNetworkCode:error:](v31, "copyMobileSubscriberNetworkCode:error:", v32, &v71);
  v34 = v71;

  if (v33 && !v34)
  {
    objc_msgSend(v33, "uppercaseString");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v35, CFSTR("cellular_mobile_network_code"));

  }
  v58 = v33;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2700]), "initWithBundleType:", 1);
  v37 = self->_ctClient;
  v38 = self->_context;
  v70 = v34;
  v39 = -[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v37, "copyCarrierBundleValue:key:bundleType:error:", v38, CFSTR("AllowVOIP"), v36, &v70);
  v40 = v70;

  if (!v40)
  {
    if (v39)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v39, CFSTR("cellular_allows_voip"));
    }
    else
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", 1);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("cellular_allows_voip"));

    }
  }
  v57 = (void *)v39;
  v59 = v23;
  v60 = v19;
  v42 = self->_ctClient;
  v43 = self->_context;
  v69 = v40;
  v44 = (void *)-[CoreTelephonyClient copyCarrierBundleValue:key:bundleType:error:](v42, "copyCarrierBundleValue:key:bundleType:error:", v43, CFSTR("CarrierName"), v36, &v69);
  v45 = v69;

  if (v44 && !v45)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("cellular_carrier_name"));
  -[NPTCellularCollector ctClient](self, "ctClient");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCellularCollector context](self, "context");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v46, "getDataStatus:error:", v47, &v68);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v68;

  if (v49)
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[NPTCellularCollector startCollectingWithCompletion:].cold.1(v49, v50);

  }
  objc_msgSend(v48, "dictionary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v51);

  -[NPTCellularCollector getCellularMNCMCCDE](self, "getCellularMNCMCCDE");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v52);

  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3042000000;
  v66[3] = __Block_byref_object_copy__175;
  v66[4] = __Block_byref_object_dispose__176;
  objc_initWeak(&v67, self);
  v65[0] = v13;
  v65[1] = 3221225472;
  v65[2] = __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_177;
  v65[3] = &unk_24C990E90;
  v65[4] = v66;
  -[NPTCellularCollector setUpPathMonitor:](self, "setUpPathMonitor:", v65);
  if (v49)
    objc_msgSend(v63, "addObject:", v49);
  if (v64)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v63, "copy");
    v64[2](v64, v53, v54);

  }
  v55 = self;
  objc_sync_enter(v55);
  -[NPTCellularCollector cachedMetadata](v55, "cachedMetadata");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v4, CFSTR("initial_state"));

  -[NPTCellularCollector setMutableMetadata:](v55, "setMutableMetadata:", v4);
  objc_sync_exit(v55);

  _Block_object_dispose(v66, 8);
  objc_destroyWeak(&v67);

}

void __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("kCTCellMonitor"), &stru_24C992208);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cellular_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5);
  if ((v6 & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("kCTCellMonitor"), &stru_24C992208);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v8);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v8);
    }
  }

}

void __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_177(uint64_t a1, void *a2)
{
  NSObject *v3;
  _QWORD enumerate_block[4];
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  if (nw_path_get_status(v3) == nw_path_status_satisfied)
  {
    enumerate_block[0] = MEMORY[0x24BDAC760];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_2;
    enumerate_block[3] = &unk_24C990E68;
    v6 = *(_QWORD *)(a1 + 32);
    v5 = v3;
    nw_path_enumerate_interfaces(v5, enumerate_block);

  }
}

BOOL __54__NPTCellularCollector_startCollectingWithCompletion___block_invoke_2(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type;
  id WeakRetained;

  type = nw_interface_get_type(interface);
  if (type == nw_interface_type_cellular)
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(WeakRetained, "estimateDidChange:", *(_QWORD *)(a1 + 32));

  }
  return type != nw_interface_type_cellular;
}

- (void)stopCollecting
{
  -[CTTelephonyNetworkInfo setServiceSubscriberCellularProvidersDidUpdateNotifier:](self->_networkInfo, "setServiceSubscriberCellularProvidersDidUpdateNotifier:", 0);
  -[NPTCellularCollector setStopCollectingMetadata:](self, "setStopCollectingMetadata:", 1);
}

+ (id)collectorName
{
  return CFSTR("cellular");
}

+ (id)getPreferredDataSlot
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDC2810]);
  dispatch_get_global_queue(2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithQueue:", v3);

  v25 = 0;
  objc_msgSend(v4, "getActiveContexts:", &v25);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v25;
  if (v6)
  {
    +[NPTLogger cellular](NPTLogger, "cellular");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[NPTCellularCollector getPreferredDataSlot].cold.1(v6, v7);

    v8 = &unk_24C9A7700;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v5, "subscriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v20 = v4;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "uuid");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "dataPreferred");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v15, "isEqual:", v16);

          if (v17)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "slotID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = v20;
            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v11)
          continue;
        break;
      }
      v4 = v20;
    }
    v18 = &unk_24C9A7700;
LABEL_16:

    v8 = v18;
  }

  return v8;
}

- (void)setUpPathMonitor:(id)a3
{
  id v4;
  nw_path_monitor_t v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  v4 = a3;
  v5 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
  -[NPTCellularCollector setPathMonitor:](self, "setPathMonitor:", v5);

  -[NPTCellularCollector pathMonitor](self, "pathMonitor");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_queue(v6, v7);

  -[NPTCellularCollector pathMonitor](self, "pathMonitor");
  v8 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_set_update_handler(v8, v4);

  -[NPTCellularCollector pathMonitor](self, "pathMonitor");
  v9 = objc_claimAutoreleasedReturnValue();
  nw_path_monitor_start(v9);

}

- (id)fetchCellularTPutEstimates
{
  id v3;
  dispatch_semaphore_t v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = dispatch_semaphore_create(0);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3042000000;
  v15[3] = __Block_byref_object_copy__175;
  v15[4] = __Block_byref_object_dispose__176;
  objc_initWeak(&v16, self);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke;
  v11[3] = &unk_24C990EE0;
  v5 = v3;
  v12 = v5;
  v14 = v15;
  v6 = v4;
  v13 = v6;
  -[NPTCellularCollector setUpPathMonitor:](self, "setUpPathMonitor:", v11);
  v7 = dispatch_walltime(0, 1000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = v13;
  v9 = v5;

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v9;
}

void __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD enumerate_block[4];
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;

  v5 = a2;
  if (nw_path_get_status(v5) == nw_path_status_satisfied)
  {
    enumerate_block[0] = MEMORY[0x24BDAC760];
    enumerate_block[1] = 3221225472;
    enumerate_block[2] = __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke_2;
    enumerate_block[3] = &unk_24C990EB8;
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 48);
    v7 = v3;
    v10 = v4;
    v8 = v5;
    v9 = *(id *)(a1 + 40);
    nw_path_enumerate_interfaces(v8, enumerate_block);

  }
}

BOOL __50__NPTCellularCollector_fetchCellularTPutEstimates__block_invoke_2(uint64_t a1, nw_interface_t interface)
{
  nw_interface_type_t type;
  void *v4;
  id WeakRetained;
  void *v6;

  type = nw_interface_get_type(interface);
  if (type == nw_interface_type_cellular)
  {
    v4 = *(void **)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(WeakRetained, "getEstimateFromPath:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addEntriesFromDictionary:", v6);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
  return type != nw_interface_type_cellular;
}

- (id)getEstimateFromPath:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t estimated_download_throughput;
  uint64_t estimated_upload_throughput;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BDBCED8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  estimated_download_throughput = nw_path_get_estimated_download_throughput();
  estimated_upload_throughput = nw_path_get_estimated_upload_throughput();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)estimated_download_throughput / 125000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("cellular_download_estimate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)(unint64_t)estimated_upload_throughput / 125000.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("cellular_upload_estimate"));

  return v5;
}

- (void)estimateDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NPTCellularCollector *v8;
  void *v9;
  id v10;
  NPTMetadataEvent *v11;
  uint64_t v12;
  void *v13;
  NPTMetadataEvent *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTCellularCollector getEstimateFromPath:](self, "getEstimateFromPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  +[NPTLogger cellular](NPTLogger, "cellular");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[NPTCellularCollector estimateDidChange:].cold.1();

  if (objc_msgSend(v5, "count"))
  {
    v8 = self;
    objc_sync_enter(v8);
    -[NPTCellularCollector mutableMetadata](v8, "mutableMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEntriesFromDictionary:", v5);

    v10 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
    v11 = [NPTMetadataEvent alloc];
    v12 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NPTMetadataEvent initWithType:eventType:timeStamp:data:](v11, "initWithType:eventType:timeStamp:data:", v12, 27, v13, v5);

    -[NPTCellularCollector cachedMetadata](v8, "cachedMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("events"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPTMetadataEvent asDictionary](v14, "asDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    objc_sync_exit(v8);
    -[NPTCellularCollector metadataDidChangeHandler](v8, "metadataDidChangeHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[NPTCellularCollector metadataDidChangeHandler](v8, "metadataDidChangeHandler");
      v19 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NPTMetadataEvent *, _QWORD))v19)[2](v19, v14, 0);

    }
  }

}

- (void)dataStatus:(id)a3 dataStatusInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NPTCellularCollector *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NPTMetadataEvent *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NPTMetadataEvent *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCellularCollector context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v10))
  {
    v11 = -[NPTCellularCollector stopCollectingMetadata](self, "stopCollectingMetadata");

    if (!v11)
    {
      +[NPTLogger cellular](NPTLogger, "cellular");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[NPTCellularCollector dataStatus:dataStatusInfo:].cold.1(v7, v12);

      v13 = self;
      objc_sync_enter(v13);
      -[NPTCellularCollector setDataStatus:](v13, "setDataStatus:", v7);
      -[NPTCellularCollector mutableDataStatusChanges](v13, "mutableDataStatusChanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTCellularCollector dataStatus](v13, "dataStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v16);

      -[NPTCellularCollector mutableMetadata](v13, "mutableMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTCellularCollector dataStatus](v13, "dataStatus");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addEntriesFromDictionary:", v19);

      v20 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
      v21 = [NPTMetadataEvent alloc];
      v22 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTCellularCollector dataStatus](v13, "dataStatus");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dictionary");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[NPTMetadataEvent initWithType:eventType:timeStamp:data:](v21, "initWithType:eventType:timeStamp:data:", v22, 1, v23, v25);

      -[NPTCellularCollector cachedMetadata](v13, "cachedMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("events"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        -[NPTCellularCollector cachedMetadata](v13, "cachedMetadata");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("events"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTMetadataEvent asDictionary](v26, "asDictionary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v31);

      }
      objc_sync_exit(v13);

      -[NPTCellularCollector metadataDidChangeHandler](v13, "metadataDidChangeHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[NPTCellularCollector metadataDidChangeHandler](v13, "metadataDidChangeHandler");
        v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NPTMetadataEvent *, _QWORD))v33)[2](v33, v26, 0);

      }
    }
  }
  else
  {

  }
}

- (void)cellChanged:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NPTCellularCollector *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NPTMetadataEvent *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NPTMetadataEvent *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCellularCollector context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v10))
  {
    v11 = -[NPTCellularCollector stopCollectingMetadata](self, "stopCollectingMetadata");

    if (!v11)
    {
      +[NPTLogger cellular](NPTLogger, "cellular");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[NPTCellularCollector cellChanged:cell:].cold.1();

      v13 = self;
      objc_sync_enter(v13);
      -[NPTCellularCollector servingCellInfo](v13, "servingCellInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v7);

      -[NPTCellularCollector servingCellInfo](v13, "servingCellInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTCellularCollector slotID](v13, "slotID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPTCellularCollector getCellInfoForSlot:](v13, "getCellInfoForSlot:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addEntriesFromDictionary:", v17);

      -[NPTCellularCollector mutableCellChanges](v13, "mutableCellChanges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v7);

      -[NPTCellularCollector mutableMetadata](v13, "mutableMetadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addEntriesFromDictionary:", v7);

      v20 = objc_alloc_init(MEMORY[0x24BDD1500]);
      objc_msgSend(v20, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSxxx"));
      v21 = [NPTMetadataEvent alloc];
      v22 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x24BDBCE70];
      -[NPTCellularCollector servingCellInfo](v13, "servingCellInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "dictionaryWithDictionary:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NPTMetadataEvent initWithType:eventType:timeStamp:data:](v21, "initWithType:eventType:timeStamp:data:", v22, 2, v23, v26);

      -[NPTCellularCollector cachedMetadata](v13, "cachedMetadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("events"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        -[NPTCellularCollector cachedMetadata](v13, "cachedMetadata");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("events"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPTMetadataEvent asDictionary](v27, "asDictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v32);

      }
      objc_sync_exit(v13);

      -[NPTCellularCollector metadataDidChangeHandler](v13, "metadataDidChangeHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        -[NPTCellularCollector metadataDidChangeHandler](v13, "metadataDidChangeHandler");
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, NPTMetadataEvent *, _QWORD))v34)[2](v34, v27, 0);

      }
    }
  }
  else
  {

  }
}

- (NSArray)cellChanges
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[NPTCellularCollector mutableCellChanges](self, "mutableCellChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)dataStatusChanges
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[NPTCellularCollector mutableDataStatusChanges](self, "mutableDataStatusChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

+ (id)calculateMaxCellularTPutEstimates:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v30;
  id v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v31 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v30 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("events"));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("event_type"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[NPTMetadataEventTypeConverter getTypeAsString:](NPTMetadataEventTypeConverter, "getTypeAsString:", 27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11 == v12)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("cellular_download_estimate"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "doubleValue");
          v16 = v15;

          if (v16 > v8)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("cellular_download_estimate"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            v8 = v19;

          }
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("cellular_upload_estimate"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "doubleValue");
          v23 = v22;

          if (v23 > v7)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("data"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("cellular_upload_estimate"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "doubleValue");
            v7 = v26;

          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v27, CFSTR("cellular_max_download_estimate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setObject:forKeyedSubscript:", v28, CFSTR("cellular_max_upload_estimate"));

  return v31;
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setCellChanges:(id)a3
{
  objc_storeStrong((id *)&self->_cellChanges, a3);
}

- (void)setDataStatusChanges:(id)a3
{
  objc_storeStrong((id *)&self->_dataStatusChanges, a3);
}

- (CoreTelephonyClient)ctClient
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCtClient:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (CTXPCServiceSubscriptionContext)context
{
  return (CTXPCServiceSubscriptionContext *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)slotID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSlotID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CTDataStatus)dataStatus
{
  return (CTDataStatus *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDataStatus:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableArray)mutableCellChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMutableCellChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableArray)mutableDataStatusChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setMutableDataStatusChanges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSMutableDictionary)servingCellInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setServingCellInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableDictionary)mutableMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setMutableMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (CTTelephonyNetworkInfo)networkInfo
{
  return (CTTelephonyNetworkInfo *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNetworkInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)stopCollectingMetadata
{
  return self->_stopCollectingMetadata;
}

- (void)setStopCollectingMetadata:(BOOL)a3
{
  self->_stopCollectingMetadata = a3;
}

- (OS_nw_path_monitor)pathMonitor
{
  return (OS_nw_path_monitor *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPathMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_networkInfo, 0);
  objc_storeStrong((id *)&self->_mutableMetadata, 0);
  objc_storeStrong((id *)&self->_servingCellInfo, 0);
  objc_storeStrong((id *)&self->_mutableDataStatusChanges, 0);
  objc_storeStrong((id *)&self->_mutableCellChanges, 0);
  objc_storeStrong((id *)&self->_dataStatus, 0);
  objc_storeStrong((id *)&self->_slotID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_dataStatusChanges, 0);
  objc_storeStrong((id *)&self->_cellChanges, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

- (void)signalStrengthMeasurements
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E71B000, log, OS_LOG_TYPE_ERROR, "Current CoreTelephony API does not include getSignalStrengthMeasurements:Error: method", v1, 2u);
}

- (void)getCellularMNCMCCDE
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20E71B000, v0, v1, "Error collecting mobile country code %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)getCellInfoForSlot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20E71B000, v0, v1, "Expecting slotID to be 1 or 2. Received %@. Passing SlotUnknown to CT", v2);
  OUTLINED_FUNCTION_3();
}

- (void)startCollectingWithCompletion:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20E71B000, a2, v4, "Failed to get dataStatus: %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

+ (void)getPreferredDataSlot
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20E71B000, a2, v4, "Failed to get the active contexts due to %{public}@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)estimateDidChange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20E71B000, v0, v1, "Cellular Throughput Estimate Changed: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)dataStatus:(void *)a1 dataStatusInfo:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20E71B000, a2, v4, "Data Status Changed: %@", v5);

  OUTLINED_FUNCTION_4();
}

- (void)cellChanged:cell:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_20E71B000, v0, v1, "Cell changed: %@", v2);
  OUTLINED_FUNCTION_3();
}

@end
