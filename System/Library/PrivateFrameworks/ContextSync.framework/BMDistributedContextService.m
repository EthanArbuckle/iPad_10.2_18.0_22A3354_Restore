@implementation BMDistributedContextService

- (BMDistributedContextService)init
{
  BMDistributedContextService *v2;
  uint64_t v3;
  NSXPCListener *listener;
  uint64_t v5;
  NSUserDefaults *subscriptionDefaults;
  BMDistributedContextUserDefaultStorage *v7;
  BMDistributedContextSubscriptionStorage *subscriptionStorage;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *idsQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *biomeQueue;
  uint64_t v18;
  IDSService *internetService;
  uint64_t v20;
  IDSService *localService;
  NSObject *v22;
  BMDistributedContextService *v23;
  NSObject *v24;
  NSString *deviceUUID;
  BMDistributedContextEventTranslation *v26;
  BMDistributedContextEventTranslation *eventTranslator;
  uint64_t v28;
  NSMutableDictionary *subscriptionSinks;
  _QWORD block[4];
  BMDistributedContextService *v32;
  objc_super v33;
  uint8_t buf[4];
  NSString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)BMDistributedContextService;
  v2 = -[BMDistributedContextService init](&v33, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.biome.ContextSync"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.contextsync.subscriptions"));
    subscriptionDefaults = v2->_subscriptionDefaults;
    v2->_subscriptionDefaults = (NSUserDefaults *)v5;

    v7 = -[BMDistributedContextUserDefaultStorage initWithUserDefault:]([BMDistributedContextUserDefaultStorage alloc], "initWithUserDefault:", v2->_subscriptionDefaults);
    subscriptionStorage = v2->_subscriptionStorage;
    v2->_subscriptionStorage = (BMDistributedContextSubscriptionStorage *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.contextsync.queue", v9);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.contextsync.idsQueue", v12);
    idsQueue = v2->_idsQueue;
    v2->_idsQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.contextSync.receiverQueue", v15);
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.contextsync"));
    internetService = v2->_internetService;
    v2->_internetService = (IDSService *)v18;

    -[IDSService addDelegate:queue:](v2->_internetService, "addDelegate:queue:", v2, v2->_idsQueue);
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.contextsync.local"));
    localService = v2->_localService;
    v2->_localService = (IDSService *)v20;

    -[IDSService addDelegate:queue:](v2->_localService, "addDelegate:queue:", v2, v2->_idsQueue);
    v22 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__BMDistributedContextService_init__block_invoke;
    block[3] = &unk_24D278850;
    v23 = v2;
    v32 = v23;
    dispatch_sync(v22, block);
    __biome_log_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      deviceUUID = v23->_deviceUUID;
      *(_DWORD *)buf = 138412290;
      v35 = deviceUUID;
      _os_log_impl(&dword_214A1F000, v24, OS_LOG_TYPE_DEFAULT, "Local device %@", buf, 0xCu);
    }

    v26 = -[BMDistributedContextEventTranslation initWithLocalDeviceIdentifier:]([BMDistributedContextEventTranslation alloc], "initWithLocalDeviceIdentifier:", v23->_deviceUUID);
    eventTranslator = v23->_eventTranslator;
    v23->_eventTranslator = v26;

    v28 = objc_opt_new();
    subscriptionSinks = v23->_subscriptionSinks;
    v23->_subscriptionSinks = (NSMutableDictionary *)v28;

    -[BMDistributedContextService loadSubscriptions](v23, "loadSubscriptions");
    -[NSXPCListener activate](v2->_listener, "activate");

  }
  return v2;
}

void __35__BMDistributedContextService_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = IDSCopyLocalDeviceUniqueID();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)distributedContextManager
{
  if (distributedContextManager_onceToken != -1)
    dispatch_once(&distributedContextManager_onceToken, &__block_literal_global_0);
  return (id)distributedContextManager_distributedContextManager;
}

void __56__BMDistributedContextService_distributedContextManager__block_invoke()
{
  BMDistributedContextService *v0;
  void *v1;

  v0 = objc_alloc_init(BMDistributedContextService);
  v1 = (void *)distributedContextManager_distributedContextManager;
  distributedContextManager_distributedContextManager = (uint64_t)v0;

}

- (void)loadSubscriptions
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD block[5];

  v3 = (void *)os_transaction_create();
  -[BMDistributedContextService queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BMDistributedContextService_loadSubscriptions__block_invoke;
  block[3] = &unk_24D278850;
  block[4] = self;
  dispatch_sync(v4, block);

  if (!-[BMDistributedContextService rebootNotificationDelivered](self, "rebootNotificationDelivered"))
  {
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __48__BMDistributedContextService_loadSubscriptions__block_invoke_35;
    v6[3] = &unk_24D278850;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BE7A5D0], "runBlockWhenDeviceIsClassCUnlocked:", v6);
  }

}

void __48__BMDistributedContextService_loadSubscriptions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  void *v24;
  BMDistributedContextSubscribeMessage *v25;
  BMDistributedContextSubscribeMessage *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214A1F000, v2, OS_LOG_TYPE_INFO, "Load Context Sync Subscriptions", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "stringForKey:", CFSTR("lastBootUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMDistributedContextUtilities currentBootSessionUUID](BMDistributedContextUtilities, "currentBootSessionUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", v3);
  if ((objc_msgSend(MEMORY[0x24BE7A5D0], "isUnlocked") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(MEMORY[0x24BE7A5D0], "isClassCLocked") ^ 1;
  +[BMDistributedContextSubscriptionManager loadFromStorage:withLocalDeviceID:](BMDistributedContextSubscriptionManager, "loadFromStorage:withLocalDeviceID:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSubscriptionManager:", v7);

  objc_msgSend(*(id *)(a1 + 32), "initializeSinksForRemoteDSLIdentifiers");
  v8 = *(_QWORD **)(a1 + 32);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v8, "subscriptionDefaults");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRebootNotificationDelivered:", objc_msgSend(v9, "BOOLForKey:", CFSTR("rebootNotificationDelivered")));
  }
  else
  {
    v45 = v6;
    v42 = v5;
    v43 = v4;
    v44 = v3;
    v10 = (void *)v8[8];
    objc_msgSend(v8, "deviceUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subscriptionsWithSubscribingDevice:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v9 = v12;
    v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v52 != v15)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(v17, "dsl");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(*(id *)(a1 + 32), "logMetricsForSubscription:uponReboot:", v17, 1);
          }
          else
          {
            __biome_log_for_category();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v17, "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 32), "deviceUUID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v56 = v20;
              v57 = 2112;
              v58 = v21;
              _os_log_error_impl(&dword_214A1F000, v19, OS_LOG_TYPE_ERROR, "Failed to log identifier %@ on device %@: No DSL found", buf, 0x16u);

            }
          }
        }
        v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
      }
      while (v14);
    }

    v22 = *(_QWORD **)(a1 + 32);
    v23 = (void *)v22[8];
    objc_msgSend(v22, "deviceUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeAllSubscriptionsMadeBySubscribingDevice:", v24);

    v6 = v45;
    if (v45)
    {
      v25 = [BMDistributedContextSubscribeMessage alloc];
      v26 = -[BMDistributedContextSubscribeMessage initWithSubscriptions:localDevice:messageIntent:](v25, "initWithSubscriptions:localDevice:messageIntent:", MEMORY[0x24BDBD1A8], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), 6);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "deviceIdentifiersWithActiveSubscriptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v48;
        do
        {
          for (j = 0; j != v29; ++j)
          {
            if (*(_QWORD *)v48 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
            if ((objc_msgSend(v32, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)) & 1) == 0)
            {
              v33 = *(void **)(a1 + 32);
              -[BMDistributedContextSubscribeMessage dictionaryRepresentation](v26, "dictionaryRepresentation");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = 0;
              objc_msgSend(v33, "sendIDSMessageWithContent:asWaking:toDevice:error:", v34, 0, v32, &v46);

            }
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v47, v63, 16);
        }
        while (v29);
      }
      objc_msgSend(*(id *)(a1 + 32), "setRebootNotificationDelivered:", 1);

      v5 = v42;
      v6 = v45;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setRebootNotificationDelivered:", 0);
      v5 = v42;
    }
    objc_msgSend(*(id *)(a1 + 32), "subscriptionDefaults");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setBool:forKey:", objc_msgSend(*(id *)(a1 + 32), "rebootNotificationDelivered"), CFSTR("rebootNotificationDelivered"));

    v4 = v43;
    v3 = v44;
  }

  __biome_log_for_category();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 ^ 1u);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "allSubscriptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v56 = v37;
    v57 = 2112;
    v58 = v38;
    v59 = 2112;
    v60 = v39;
    v61 = 2112;
    v62 = v40;
    _os_log_impl(&dword_214A1F000, v36, OS_LOG_TYPE_DEFAULT, "Rebooted %@, unlocked %@, delivered notifications %@, reloaded subscriptions %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "subscriptionDefaults");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setObject:forKey:", v4, CFSTR("lastBootUUID"));

}

void __48__BMDistributedContextService_loadSubscriptions__block_invoke_35(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__BMDistributedContextService_loadSubscriptions__block_invoke_2;
  block[3] = &unk_24D278850;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

}

uint64_t __48__BMDistributedContextService_loadSubscriptions__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __biome_log_for_category();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_214A1F000, v2, OS_LOG_TYPE_DEFAULT, "Device has class C unlocked", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "updateSubscriptionsAfterUnlock");
}

- (void)initializeSinksForRemoteDSLIdentifiers
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[BMDistributedContextSubscriptionManager subscriptionsWithSubscribedDevice:](self->_subscriptionManager, "subscriptionsWithSubscribedDevice:", self->_deviceUUID);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    *(_QWORD *)&v5 = 138412290;
    v15 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionSinks, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          objc_msgSend(v9, "dsl");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __biome_log_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v21 = v10;
            _os_log_impl(&dword_214A1F000, v13, OS_LOG_TYPE_INFO, "Recreating sink for %@", buf, 0xCu);
          }

          -[BMDistributedContextService registerSinkWithIdentifier:withDSL:](self, "registerSinkWithIdentifier:withDSL:", v10, v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionSinks, "setObject:forKeyedSubscript:", v14, v10);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

}

- (void)updateSubscriptionsAfterUnlock
{
  void *v3;
  BMDistributedContextSubscribeMessage *v4;
  NSObject *v5;
  BMDistributedContextSubscribeMessage *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BMDistributedContextSubscribeMessage *v13;
  BMDistributedContextContextChangedMessage *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  BMDistributedContextSubscribeMessage *v19;
  BMDistributedContextSubscribeMessage *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  BMDistributedContextSubscribeMessage *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  BMDistributedContextSubscribeMessage *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_rebootNotificationDelivered)
  {
    -[BMDistributedContextService subscriptionDefaults](self, "subscriptionDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("lockedUpdates"));
    v4 = (BMDistributedContextSubscribeMessage *)objc_claimAutoreleasedReturnValue();

    if (v4 && -[BMDistributedContextSubscribeMessage count](v4, "count"))
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v4;
        _os_log_impl(&dword_214A1F000, v5, OS_LOG_TYPE_DEFAULT, "Class C Unlocked: Notifying stored context changes %@", buf, 0xCu);
      }

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v30 = v4;
      v6 = v4;
      v7 = -[BMDistributedContextSubscribeMessage countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v37 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            -[BMDistributedContextSubscriptionManager subscriptionsWithIdentifier:subscribedToDevice:](self->_subscriptionManager, "subscriptionsWithIdentifier:subscribedToDevice:", v11, self->_deviceUUID);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "count"))
            {
              -[BMDistributedContextSubscribeMessage objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", v11);
              v13 = (BMDistributedContextSubscribeMessage *)objc_claimAutoreleasedReturnValue();
              v14 = -[BMDistributedContextContextChangedMessage initWithMessageDictionary:]([BMDistributedContextContextChangedMessage alloc], "initWithMessageDictionary:", v13);
              if (v14)
              {
                -[BMDistributedContextService contextChanged:forSubscriptionWithIdentifier:](self, "contextChanged:forSubscriptionWithIdentifier:", v14, v11);
              }
              else
              {
                __biome_log_for_category();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v43 = v13;
                  _os_log_error_impl(&dword_214A1F000, v15, OS_LOG_TYPE_ERROR, "Could not build context changed message from locked update %@", buf, 0xCu);
                }

              }
            }

          }
          v8 = -[BMDistributedContextSubscribeMessage countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v8);
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[BMDistributedContextService setLockedUpdates:](self, "setLockedUpdates:", v16);

      -[BMDistributedContextService subscriptionDefaults](self, "subscriptionDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", CFSTR("lockedUpdates"));

      v4 = v30;
    }
    -[BMDistributedContextSubscriptionManager deviceIdentifiersWithActiveSubscriptions](self->_subscriptionManager, "deviceIdentifiersWithActiveSubscriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = [BMDistributedContextSubscribeMessage alloc];
    v20 = -[BMDistributedContextSubscribeMessage initWithSubscriptions:localDevice:messageIntent:](v19, "initWithSubscriptions:localDevice:messageIntent:", MEMORY[0x24BDBD1A8], self->_deviceUUID, 6);
    __biome_log_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v20;
      _os_log_impl(&dword_214A1F000, v21, OS_LOG_TYPE_DEFAULT, "Class C Unlocked: Sending empty subscription for local device %@", buf, 0xCu);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = v18;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
          if ((objc_msgSend(v27, "isEqualToString:", self->_deviceUUID) & 1) == 0)
          {
            -[BMDistributedContextSubscribeMessage dictionaryRepresentation](v20, "dictionaryRepresentation");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = 0;
            -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:](self, "sendIDSMessageWithContent:asWaking:toDevice:error:", v28, 0, v27, &v31);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v24);
    }

    -[BMDistributedContextService setRebootNotificationDelivered:](self, "setRebootNotificationDelivered:", 1);
    -[BMDistributedContextService subscriptionDefaults](self, "subscriptionDefaults");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBool:forKey:", -[BMDistributedContextService rebootNotificationDelivered](self, "rebootNotificationDelivered"), CFSTR("rebootNotificationDelivered"));

  }
}

- (id)registerSinkWithIdentifier:(id)a3 withDSL:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BE0CB48];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithIdentifier:targetQueue:", v6, self->_biomeQueue);
  objc_msgSend(v8, "subscribeOn:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke;
  v17[3] = &unk_24D278898;
  v18 = v6;
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_39;
  v15[3] = &unk_24D2788E8;
  v15[4] = self;
  v16 = v18;
  v12 = v18;
  objc_msgSend(v10, "sinkWithCompletion:receiveInput:", v17, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionSinks, "setObject:forKeyedSubscript:", v13, v12);
  return v13;
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (objc_msgSend(a2, "state"))
  {
    __biome_log_for_category();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_cold_1(a1, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  BMDistributedContextContextChangedMessage *v12;
  char v13;
  NSObject *v14;
  void *v15;
  uint64_t *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "translateEvent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "streamIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "eventData");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v4, "eventDataVersion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "eventBody");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v11;
          _os_log_impl(&dword_214A1F000, v10, OS_LOG_TYPE_DEFAULT, "New event: %@", buf, 0xCu);

        }
        v12 = -[BMDistributedContextContextChangedMessage initWithSubscriptionIdentifier:translatedEvent:messageIntent:]([BMDistributedContextContextChangedMessage alloc], "initWithSubscriptionIdentifier:translatedEvent:messageIntent:", *(_QWORD *)(a1 + 40), v4, GetMessageIntentFromDistributedContextClientIdentifier(*(void **)(a1 + 40)));
        v13 = objc_msgSend(*(id *)(a1 + 32), "rebootNotificationDelivered");
        objc_msgSend(*(id *)(a1 + 32), "queue");
        v14 = objc_claimAutoreleasedReturnValue();
        if ((v13 & 1) != 0)
        {
          v19 = MEMORY[0x24BDAC760];
          v15 = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_41;
          v16 = &v19;
        }
        else
        {
          v20 = MEMORY[0x24BDAC760];
          v15 = __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_40;
          v16 = &v20;
        }
        v16[1] = 3221225472;
        v16[2] = (uint64_t)v15;
        v16[3] = (uint64_t)&unk_24D2788C0;
        v18 = *(void **)(a1 + 40);
        v16[4] = *(_QWORD *)(a1 + 32);
        v16[5] = (uint64_t)v12;
        v16[6] = (uint64_t)v18;
        v17 = v12;
        dispatch_sync(v14, v16);

        goto LABEL_13;
      }
    }
    else
    {

    }
  }
  __biome_log_for_category();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_39_cold_1();
LABEL_13:

}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_40(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lockedUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "subscriptionDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("lockedUpdates"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v5;
    objc_msgSend(*(id *)(a1 + 32), "setLockedUpdates:", v5);

  }
  objc_msgSend(*(id *)(a1 + 40), "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lockedUpdates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "subscriptionDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lockedUpdates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("lockedUpdates"));

  __biome_log_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "lockedUpdates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_214A1F000, v11, OS_LOG_TYPE_DEFAULT, "Class C Locked: Stored updates are now %@", (uint8_t *)&v13, 0xCu);

  }
}

uint64_t __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "contextChanged:forSubscriptionWithIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)subscribeToBiomeWithRemoteDSL:(id)a3 forRemoteIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = -[BMDistributedContextService registerSinkWithIdentifier:withDSL:](self, "registerSinkWithIdentifier:withDSL:", v7, v6);
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "rootStreamIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "streamPublishers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_214A1F000, v9, OS_LOG_TYPE_DEFAULT, "Subscribed to Biome with %@, stream identifiers are %@, publishers are %@", (uint8_t *)&v12, 0x20u);

  }
}

- (void)removeAllSubscriptionsForDeadRemoteDevice:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BMDistributedContextSubscriptionManager subscriptionsWithSubscribingDevice:](self->_subscriptionManager, "subscriptionsWithSubscribingDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    *(_QWORD *)&v7 = 138412290;
    v14 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "identifier", v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMDistributedContextService removeSubscriptionWithIdentifier:fromSubscribingDevice:](self, "removeSubscriptionWithIdentifier:fromSubscribingDevice:", v11, v4);
        -[BMDistributedContextSubscriptionManager subscribingDevicesForIdentifier:subscribedToDevice:](self->_subscriptionManager, "subscribingDevicesForIdentifier:subscribedToDevice:", v11, self->_deviceUUID);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "count"))
        {
          __biome_log_for_category();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            v20 = v11;
            _os_log_impl(&dword_214A1F000, v13, OS_LOG_TYPE_DEFAULT, "No more devices with active subscription to identifier%@", buf, 0xCu);
          }

          -[BMDistributedContextService cancelSubscriptionForIdentifier:](self, "cancelSubscriptionForIdentifier:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

}

- (void)cancelSubscriptionForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_214A1F000, v5, OS_LOG_TYPE_DEFAULT, "Unsubscribing identifier %@ from Biome", (uint8_t *)&v9, 0xCu);
  }

  -[NSMutableDictionary objectForKeyedSubscript:](self->_subscriptionSinks, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "cancel");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subscriptionSinks, "setObject:forKeyedSubscript:", 0, v4);
  }
  else
  {
    __biome_log_for_category();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[BMDistributedContextService cancelSubscriptionForIdentifier:].cold.1();

  }
}

- (void)assertLocalSubscriptionsToDevice:(id)a3 shouldSendIfNoSubscriptions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;
  BMDistributedContextSubscribeMessage *v9;
  void *v10;
  uint64_t v11;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BMDistributedContextSubscriptionManager subscriptionsWithSubscribedDevice:](self->_subscriptionManager, "subscriptionsWithSubscribedDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = 0;
  else
    v8 = !v4;
  if (!v8)
  {
    v9 = -[BMDistributedContextSubscribeMessage initWithSubscriptions:localDevice:messageIntent:]([BMDistributedContextSubscribeMessage alloc], "initWithSubscriptions:localDevice:messageIntent:", v7, self->_deviceUUID, 1);
    -[BMDistributedContextSubscribeMessage dictionaryRepresentation](v9, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:](self, "sendIDSMessageWithContent:asWaking:toDevice:error:", v10, -[BMDistributedContextSubscribeMessage shouldWake](v9, "shouldWake"), v6, &v11);

  }
}

- (void)saveRemoteSubscription:(id)a3 fromDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  BMDistributedContextSubscriptionManager *subscriptionManager;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  BMDistributedContextSubscriptionManager *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  void *obj;
  id v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  void *v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v53 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[BMDistributedContextSubscriptionManager subscriptionsWithSubscribingDevice:](self->_subscriptionManager, "subscriptionsWithSubscribingDevice:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v73, 16);
    }
    while (v11);
  }
  v52 = v7;

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v50 = v6;
  objc_msgSend(v6, "subscriptions");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v59 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        subscriptionManager = self->_subscriptionManager;
        objc_msgSend(v19, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "subscribingDevice");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "subscribedDevice");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMDistributedContextSubscriptionManager subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:](subscriptionManager, "subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:", v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v24, "isEqual:", v19) & 1) == 0)
        {
          __biome_log_for_category();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v69 = v52;
            v70 = 2112;
            v71 = v19;
            _os_log_impl(&dword_214A1F000, v25, OS_LOG_TYPE_DEFAULT, "Updated existing subscription from remote %@: %@", buf, 0x16u);
          }

          -[BMDistributedContextSubscriptionManager removeSubscription:](self->_subscriptionManager, "removeSubscription:", v24);
          objc_msgSend(v24, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMDistributedContextService cancelSubscriptionForIdentifier:](self, "cancelSubscriptionForIdentifier:", v26);

          objc_msgSend(v19, "dsl");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMDistributedContextService subscribeToBiomeWithRemoteDSL:forRemoteIdentifier:](self, "subscribeToBiomeWithRemoteDSL:forRemoteIdentifier:", v27, v28);

          v29 = self->_subscriptionManager;
          v67 = v19;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v67, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMDistributedContextSubscriptionManager addSubscriptions:](v29, "addSubscriptions:", v30);

        }
        objc_msgSend(v19, "identifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "addObject:", v31);

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    }
    while (v16);
  }

  __biome_log_for_category();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v8;
    _os_log_impl(&dword_214A1F000, v32, OS_LOG_TYPE_DEFAULT, "existingSubscriptions %@", buf, 0xCu);
  }

  __biome_log_for_category();
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = v52;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v69 = v53;
    _os_log_impl(&dword_214A1F000, v33, OS_LOG_TYPE_DEFAULT, "activeSubscriptions %@", buf, 0xCu);
  }

  objc_msgSend(v8, "minusSet:", v53);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v35 = v8;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v55;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v55 != v38)
          objc_enumerationMutation(v35);
        v40 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
        -[BMDistributedContextService removeSubscriptionWithIdentifier:fromSubscribingDevice:](self, "removeSubscriptionWithIdentifier:fromSubscribingDevice:", v40, v34);
        -[BMDistributedContextSubscriptionManager subscribingDevicesForIdentifier:subscribedToDevice:](self->_subscriptionManager, "subscribingDevicesForIdentifier:subscribedToDevice:", v40, self->_deviceUUID);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v41, "count"))
        {
          __biome_log_for_category();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v69 = v40;
            _os_log_impl(&dword_214A1F000, v42, OS_LOG_TYPE_DEFAULT, "No more devices with active subscription to identifier%@", buf, 0xCu);
          }

          -[BMDistributedContextService cancelSubscriptionForIdentifier:](self, "cancelSubscriptionForIdentifier:", v40);
          v34 = v52;
        }

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v37);
  }

  __biome_log_for_category();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    -[BMDistributedContextSubscriptionManager allSubscriptions](self->_subscriptionManager, "allSubscriptions");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v69 = v34;
    v70 = 2112;
    v71 = v44;
    _os_log_impl(&dword_214A1F000, v43, OS_LOG_TYPE_DEFAULT, "Updated all subscriptions from remote %@: %@", buf, 0x16u);

  }
  objc_msgSend(v50, "subscriptions");
  v45 = objc_claimAutoreleasedReturnValue();
  if (!v45
    || (v46 = (void *)v45,
        objc_msgSend(v50, "subscriptions"),
        v47 = (void *)objc_claimAutoreleasedReturnValue(),
        v48 = objc_msgSend(v47, "count"),
        v47,
        v46,
        !v48))
  {
    __biome_log_for_category();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v34;
      _os_log_impl(&dword_214A1F000, v49, OS_LOG_TYPE_DEFAULT, "Subscription has no subscriptions meaning it is an unsubscribe, re-asserting subscriptions targetting subscribed device %@", buf, 0xCu);
    }

    -[BMDistributedContextService assertLocalSubscriptionsToDevice:shouldSendIfNoSubscriptions:](self, "assertLocalSubscriptionsToDevice:shouldSendIfNoSubscriptions:", v34, 0);
  }

}

- (void)removeSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_214A1F000, v8, OS_LOG_TYPE_DEFAULT, "unsubscribing from subscription %@ made by subscribing device %@", (uint8_t *)&v9, 0x16u);
  }

  -[BMDistributedContextSubscriptionManager removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:](self->_subscriptionManager, "removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:", v6, v7, self->_deviceUUID);
}

- (void)contextChanged:(id)a3 forSubscriptionWithIdentifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v23 = v7;
  -[BMDistributedContextSubscriptionManager subscriptionsWithIdentifier:subscribedToDevice:](self->_subscriptionManager, "subscriptionsWithIdentifier:subscribedToDevice:", v7, self->_deviceUUID);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "configuration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "wakeState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue") & 1;

        objc_msgSend(v6, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "subscribingDevice");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        LODWORD(v15) = -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:](self, "sendIDSMessageWithContent:asWaking:toDevice:error:", v16, v15, v17, &v25);
        v18 = v25;

        if ((_DWORD)v15)
        {
          objc_msgSend(v12, "configuration");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "oneOffSubscription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "BOOLValue");

          if (v21)
          {
            objc_msgSend(v12, "subscribingDevice");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMDistributedContextService teardownOneOffSubscriptionWithIdentifier:fromSubscribingDevice:](self, "teardownOneOffSubscriptionWithIdentifier:fromSubscribingDevice:", v23, v22);

          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

}

- (BOOL)registerRemoteDSLSubscription:(id)a3 withRemoteIdentifier:(id)a4 withOptions:(unint64_t)a5 forDevices:(id)a6
{
  id v9;
  uint64_t i;
  BMDistributedContextSubscription *v11;
  void *v12;
  BMDistributedContextSubscriptionConfiguration *v13;
  void *v14;
  NSObject *v15;
  BMDistributedContextSubscription *v16;
  void *v17;
  NSObject *v18;
  BMDistributedContextSubscriptionManager *subscriptionManager;
  void *v20;
  void *v21;
  BMDistributedContextSubscribeMessage *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char v26;
  NSObject *v27;
  BMDistributedContextSubscription *v28;
  id v30;
  id obj;
  char v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  BMDistributedContextSubscription *v45;
  uint8_t buf[4];
  BMDistributedContextSubscription *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v35 = a3;
  v34 = a4;
  v9 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v9)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v30 = v9;
    obj = v9;
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v37)
    {
      v33 = 0;
      v39 = 0;
      v36 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v37; ++i)
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(obj);
          v11 = *(BMDistributedContextSubscription **)(*((_QWORD *)&v41 + 1) + 8 * i);
          -[BMDistributedContextService idsDeviceForDeviceUUID:](self, "idsDeviceForDeviceUUID:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = [BMDistributedContextSubscriptionConfiguration alloc];
            objc_msgSend(MEMORY[0x24BDBCE60], "now");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[BMDistributedContextSubscriptionConfiguration initWithOptions:lastChangedDate:](v13, "initWithOptions:lastChangedDate:", a5, v14);

            v16 = -[BMDistributedContextSubscription initWithIdentifier:dsl:subscribingDevice:subscribedDevice:configuration:]([BMDistributedContextSubscription alloc], "initWithIdentifier:dsl:subscribingDevice:subscribedDevice:configuration:", v34, v35, self->_deviceUUID, v11, v15);
            -[BMDistributedContextSubscriptionManager subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:](self->_subscriptionManager, "subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:", v34, self->_deviceUUID, v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = v12;
            if (objc_msgSend(v17, "isEqual:", v16))
            {
              __biome_log_for_category();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v47 = v16;
                _os_log_impl(&dword_214A1F000, v18, OS_LOG_TYPE_DEFAULT, "Subscription %@ is unchanged, but we will re-assert it's existence to the subscribed device", buf, 0xCu);
              }

            }
            else if (v17)
            {
              -[BMDistributedContextService logMetricsForSubscription:uponReboot:](self, "logMetricsForSubscription:uponReboot:", v17, 0);
              -[BMDistributedContextSubscriptionManager removeSubscription:](self->_subscriptionManager, "removeSubscription:", v17);
            }
            subscriptionManager = self->_subscriptionManager;
            v45 = v16;
            v33 = 1;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMDistributedContextSubscriptionManager addSubscriptions:](subscriptionManager, "addSubscriptions:", v20);

            -[BMDistributedContextSubscriptionManager subscriptionsWithSubscribedDevice:](self->_subscriptionManager, "subscriptionsWithSubscribedDevice:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[BMDistributedContextSubscribeMessage initWithSubscriptions:localDevice:messageIntent:]([BMDistributedContextSubscribeMessage alloc], "initWithSubscriptions:localDevice:messageIntent:", v21, self->_deviceUUID, 1);
            +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMDistributedContextSubscribeMessage dictionaryRepresentation](v22, "dictionaryRepresentation");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[BMDistributedContextSubscribeMessage shouldWake](v22, "shouldWake");
            v40 = 0;
            v39 |= objc_msgSend(v23, "sendIDSMessageWithContent:asWaking:toDevice:error:", v24, v25, v11, &v40);

            v12 = v38;
          }
          else
          {
            __biome_log_for_category();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v11;
              _os_log_error_impl(&dword_214A1F000, v15, OS_LOG_TYPE_ERROR, "Could not find: %@", buf, 0xCu);
            }
          }

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
      }
      while (v37);
    }
    else
    {
      v33 = 0;
      LOBYTE(v39) = 0;
    }

    __biome_log_for_category();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      -[BMDistributedContextSubscriptionManager allSubscriptions](self->_subscriptionManager, "allSubscriptions");
      v28 = (BMDistributedContextSubscription *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v28;
      _os_log_impl(&dword_214A1F000, v27, OS_LOG_TYPE_DEFAULT, "Updated subscription for local: %@", buf, 0xCu);

    }
    v26 = v33 & v39;
    v9 = v30;
  }
  else
  {
    v26 = 0;
  }

  return v26 & 1;
}

- (BOOL)unregisterRemoteDSLSubscription:(id)a3 withRemoteIdentifier:(id)a4 forDevices:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  BMDistributedContextSubscribeMessage *v18;
  BMDistributedContextService *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char v25;
  NSObject *v26;
  void *v27;
  id v29;
  uint64_t v30;
  id obj;
  void *v32;
  int v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v8)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v29 = v8;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v33 = 0;
      v12 = *(_QWORD *)v36;
      do
      {
        v13 = 0;
        v30 = v10;
        do
        {
          if (*(_QWORD *)v36 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
          -[BMDistributedContextService idsDeviceForDeviceUUID:](self, "idsDeviceForDeviceUUID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            -[BMDistributedContextSubscriptionManager subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:](self->_subscriptionManager, "subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:", v7, self->_deviceUUID, v14);
            v16 = objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              -[BMDistributedContextService logMetricsForSubscription:uponReboot:](self, "logMetricsForSubscription:uponReboot:", v16, 0);
              -[BMDistributedContextSubscriptionManager removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:](self->_subscriptionManager, "removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:", v7, self->_deviceUUID, v14);
              -[BMDistributedContextSubscriptionManager subscriptionsWithSubscribedDevice:](self->_subscriptionManager, "subscriptionsWithSubscribedDevice:", v14);
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = -[BMDistributedContextSubscribeMessage initWithSubscriptions:localDevice:messageIntent:]([BMDistributedContextSubscribeMessage alloc], "initWithSubscriptions:localDevice:messageIntent:", v17, self->_deviceUUID, 6);
              +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
              v32 = v15;
              v19 = self;
              v20 = v12;
              v21 = v7;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[BMDistributedContextSubscribeMessage dictionaryRepresentation](v18, "dictionaryRepresentation");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = -[BMDistributedContextSubscribeMessage shouldWake](v18, "shouldWake");
              v34 = 0;
              v33 |= objc_msgSend(v22, "sendIDSMessageWithContent:asWaking:toDevice:error:", v23, v24, v14, &v34);

              v7 = v21;
              v12 = v20;
              self = v19;
              v15 = v32;

              v10 = v30;
              v11 = 1;
            }
            else
            {
              __biome_log_for_category();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v40 = v7;
                v41 = 2112;
                v42 = v14;
                _os_log_error_impl(&dword_214A1F000, v17, OS_LOG_TYPE_ERROR, "Asked to remove subscription but couldn't find existing subscription %@ on subscribed device %@", buf, 0x16u);
              }
            }

          }
          else
          {
            __biome_log_for_category();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v40 = v14;
              _os_log_error_impl(&dword_214A1F000, v16, OS_LOG_TYPE_ERROR, "Could not find: %@", buf, 0xCu);
            }
          }

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
      LOBYTE(v33) = 0;
    }

    __biome_log_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[BMDistributedContextSubscriptionManager allSubscriptions](self->_subscriptionManager, "allSubscriptions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v27;
      _os_log_impl(&dword_214A1F000, v26, OS_LOG_TYPE_DEFAULT, "Updated subscription for local: %@", buf, 0xCu);

    }
    v25 = v33 & v11;
    v8 = v29;
  }
  else
  {
    v25 = 0;
  }

  return v25 & 1;
}

- (void)handleIncomingContextChangeMessage:(id)a3 forDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  BMDistributedContextSubscriptionManager *subscriptionManager;
  void *v12;
  void *v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BMDistributedContextService *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "translatedEvent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v9;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_214A1F000, v8, OS_LOG_TYPE_DEFAULT, "Saving new context changed message %@ from subscribed device %@", buf, 0x16u);

  }
  objc_msgSend(v6, "translatedEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMDistributedContextStreamWriter postEvent:](BMDistributedContextStreamWriter, "postEvent:", v10);

  subscriptionManager = self->_subscriptionManager;
  objc_msgSend(v6, "subscriptionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDistributedContextSubscriptionManager subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:](subscriptionManager, "subscriptionForIdentifier:fromSubscribingDevice:onSubscribedDevice:", v12, self->_deviceUUID, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke;
  v18[3] = &unk_24D278910;
  v19 = v13;
  v20 = v7;
  v21 = self;
  v22 = v6;
  v15 = v6;
  v16 = v7;
  v17 = v13;
  dispatch_sync(queue, v18);

}

void __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    __biome_log_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke_cold_1(a1, v12, v15, v16, v17, v18, v19, v20);
    goto LABEL_11;
  }
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oneOffSubscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (!v5)
    return;
  __biome_log_for_category();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v22 = 138412290;
    v23 = v7;
    _os_log_impl(&dword_214A1F000, v6, OS_LOG_TYPE_DEFAULT, "Received the contextual change value for one-off subscription, removing our subscription %@", (uint8_t *)&v22, 0xCu);
  }

  v8 = *(void **)(*(_QWORD *)(a1 + 48) + 64);
  objc_msgSend(*(id *)(a1 + 56), "subscriptionIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeSubscriptionWithIdentifier:fromSubscribingDevice:onSubscribedDevice:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 56), "protocolVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  __biome_log_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11 != 2)
  {
    if (v13)
    {
      v21 = *(_QWORD *)(a1 + 40);
      v22 = 138412290;
      v23 = v21;
      _os_log_impl(&dword_214A1F000, v12, OS_LOG_TYPE_DEFAULT, "Device %@ does not support oneOff, sending explicit unsubscribe message", (uint8_t *)&v22, 0xCu);
    }
LABEL_11:

    objc_msgSend(*(id *)(a1 + 48), "assertLocalSubscriptionsToDevice:shouldSendIfNoSubscriptions:", *(_QWORD *)(a1 + 40), 1);
    return;
  }
  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 40);
    v22 = 138412290;
    v23 = v14;
    _os_log_impl(&dword_214A1F000, v12, OS_LOG_TYPE_DEFAULT, "Device %@ supports oneOff, not sending unsubscribe", (uint8_t *)&v22, 0xCu);
  }

}

- (void)teardownOneOffSubscriptionWithIdentifier:(id)a3 fromSubscribingDevice:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_214A1F000, v8, OS_LOG_TYPE_DEFAULT, "Removing one-off subscription with identifer %@ from subscribing device %@", (uint8_t *)&v11, 0x16u);
  }

  -[BMDistributedContextService removeSubscriptionWithIdentifier:fromSubscribingDevice:](self, "removeSubscriptionWithIdentifier:fromSubscribingDevice:", v6, v7);
  -[BMDistributedContextSubscriptionManager subscribingDevicesForIdentifier:subscribedToDevice:](self->_subscriptionManager, "subscribingDevicesForIdentifier:subscribedToDevice:", v6, self->_deviceUUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    __biome_log_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_214A1F000, v10, OS_LOG_TYPE_DEFAULT, "No more devices with active subscription to identifier%@", (uint8_t *)&v11, 0xCu);
    }

    -[BMDistributedContextService cancelSubscriptionForIdentifier:](self, "cancelSubscriptionForIdentifier:", v6);
  }

}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 withOptions:(unint64_t)a5 forDeviceTypes:(int64_t)a6 withError:(id *)a7
{
  id v12;
  id v13;
  _BOOL4 rebootNotificationDelivered;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  unint64_t v28;
  _BYTE buf[24];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "devicesWithDeviceType:", a6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_214A1F000, v17, OS_LOG_TYPE_DEFAULT, "Registering DSL %@ with options %@, for devices types %@, which includes %@", buf, 0x2Au);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v30) = 0;
    -[BMDistributedContextService queue](self, "queue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __102__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDeviceTypes_withError___block_invoke;
    block[3] = &unk_24D278938;
    v27 = buf;
    v24 = v12;
    v25 = v13;
    v28 = a5;
    v21 = v16;
    v26 = v21;
    dispatch_sync(v20, block);

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a7, 3);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a7, 2);
  }

  return rebootNotificationDelivered;
}

void __102__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDeviceTypes_withError___block_invoke(_QWORD *a1)
{
  id v2;

  +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "registerRemoteDSLSubscription:withRemoteIdentifier:withOptions:forDevices:", a1[4], a1[5], a1[8], a1[6]);

}

- (BOOL)registerForUpdates:(id)a3 withIdentifier:(id)a4 withOptions:(unint64_t)a5 forDevices:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  _BOOL4 rebootNotificationDelivered;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  _BYTE *v24;
  unint64_t v25;
  _BYTE buf[24];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v17;
      *(_WORD *)&buf[22] = 2112;
      v27 = v14;
      _os_log_impl(&dword_214A1F000, v16, OS_LOG_TYPE_DEFAULT, "Registering DSL %@ with options %@, for devices %@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v27) = 0;
    -[BMDistributedContextService queue](self, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __98__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDevices_withError___block_invoke;
    block[3] = &unk_24D278938;
    v24 = buf;
    v21 = v12;
    v22 = v13;
    v25 = a5;
    v23 = v14;
    dispatch_sync(v18, block);

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a7, 3);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a7, 2);
  }

  return rebootNotificationDelivered;
}

void __98__BMDistributedContextService_registerForUpdates_withIdentifier_withOptions_forDevices_withError___block_invoke(_QWORD *a1)
{
  id v2;

  +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "registerRemoteDSLSubscription:withRemoteIdentifier:withOptions:forDevices:", a1[4], a1[5], a1[8], a1[6]);

}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDeviceTypes:(int64_t)a5 withError:(id *)a6
{
  id v10;
  id v11;
  _BOOL4 rebootNotificationDelivered;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(_QWORD *);
  void *v23;
  id v24;
  id v25;
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "devicesWithDeviceType:", a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2112;
      v29 = v14;
      _os_log_impl(&dword_214A1F000, v15, OS_LOG_TYPE_DEFAULT, "Unregistering DSL %@ for device types %@, which includes %@", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v29) = 0;
    -[BMDistributedContextService queue](self, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __92__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDeviceTypes_withError___block_invoke;
    v23 = &unk_24D278960;
    v27 = buf;
    v24 = v10;
    v25 = v11;
    v18 = v14;
    v26 = v18;
    dispatch_sync(v17, &v20);

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a6, 3, v20, v21, v22, v23, v24, v25);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a6, 2);
  }

  return rebootNotificationDelivered;
}

void __92__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDeviceTypes_withError___block_invoke(_QWORD *a1)
{
  id v2;

  +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "unregisterRemoteDSLSubscription:withRemoteIdentifier:forDevices:", a1[4], a1[5], a1[6]);

}

- (BOOL)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forDevices:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL4 rebootNotificationDelivered;
  NSObject *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *);
  void *v20;
  id v21;
  id v22;
  id v23;
  _BYTE *v24;
  _BYTE buf[24];
  char v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  rebootNotificationDelivered = self->_rebootNotificationDelivered;
  if (self->_rebootNotificationDelivered)
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v12;
      _os_log_impl(&dword_214A1F000, v14, OS_LOG_TYPE_DEFAULT, "Unregistering DSL %@ for devices %@", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v26 = 0;
    -[BMDistributedContextService queue](self, "queue");
    v15 = objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __88__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDevices_withError___block_invoke;
    v20 = &unk_24D278960;
    v24 = buf;
    v21 = v10;
    v22 = v11;
    v23 = v12;
    dispatch_sync(v15, &v17);

    if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
      +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a6, 3, v17, v18, v19, v20, v21, v22);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    +[BMDistributedContextUtilities updateDescriptionForError:withErrorCode:](BMDistributedContextUtilities, "updateDescriptionForError:withErrorCode:", a6, 2);
  }

  return rebootNotificationDelivered;
}

void __88__BMDistributedContextService_unregisterForUpdates_withIdentifier_forDevices_withError___block_invoke(_QWORD *a1)
{
  id v2;

  +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v2, "unregisterRemoteDSLSubscription:withRemoteIdentifier:forDevices:", a1[4], a1[5], a1[6]);

}

+ (id)stringForIDSDeviceType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return CFSTR("Unknown");
  else
    return *(&off_24D2789F8 + a3 - 1);
}

- (id)idsDeviceForDeviceUUID:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IDSService devices](self->_internetService, "devices");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "uniqueIDOverride", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)devicesWithDeviceType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  -[IDSService devices](self->_internetService, "devices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("uniqueIDOverride"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a3)
  {
    v22 = v5;
    goto LABEL_31;
  }
  v27 = a3;
  v25 = v5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = v4;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v12)
    goto LABEL_20;
  v13 = v12;
  v14 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v31 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
      if (objc_msgSend(v16, "deviceType") == 2)
      {
        objc_msgSend(v16, "uniqueIDOverride");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
      }
      else if (objc_msgSend(v16, "deviceType") == 4)
      {
        objc_msgSend(v16, "uniqueIDOverride");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v9;
      }
      else if (objc_msgSend(v16, "deviceType") == 6)
      {
        objc_msgSend(v16, "uniqueIDOverride");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v29;
      }
      else
      {
        if (objc_msgSend(v16, "deviceType") != 1)
          goto LABEL_16;
        objc_msgSend(v16, "uniqueIDOverride");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v28;
      }
      objc_msgSend(v18, "addObject:", v17);

LABEL_16:
      if (objc_msgSend(v16, "isLocallyPaired"))
      {
        objc_msgSend(v16, "uniqueIDOverride");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v19);

      }
      objc_msgSend(v16, "uniqueIDOverride");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v20);

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v13);
LABEL_20:

  switch(v27)
  {
    case 1:
      v21 = v8;
      goto LABEL_29;
    case 2:
      v21 = v9;
      goto LABEL_29;
    case 3:
      v23 = v29;
      goto LABEL_28;
    case 4:
      v21 = v10;
      goto LABEL_29;
    case 5:
      v23 = v28;
LABEL_28:
      v21 = v23;
LABEL_29:
      v22 = v21;
      break;
    case 6:
      v22 = (id)objc_opt_new();
      objc_msgSend(v22, "addObjectsFromArray:", v8);
      objc_msgSend(v22, "addObjectsFromArray:", v9);
      objc_msgSend(v22, "addObjectsFromArray:", v28);
      break;
    default:
      v22 = 0;
      break;
  }
  v6 = v25;
  v4 = v26;

LABEL_31:
  return v22;
}

- (BOOL)sendIDSMessageWithContent:(id)a3 asWaking:(BOOL)a4 toDevice:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  BOOL v21;
  __CFString *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t MessageIntentFromDistributedContextClientIdentifier;
  void *v40;
  uint64_t *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  id v51;
  __CFString *v52;
  NSObject *v53;
  NSObject *v54;
  IDSService *localService;
  void *v56;
  char v57;
  __CFString *v58;
  id v59;
  NSObject *v60;
  NSObject *v61;
  const __CFString *v62;
  IDSService *v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  const __CFString *v67;
  IDSService *internetService;
  void *v69;
  NSObject *v70;
  id *v71;
  void *v73;
  __CFString *v74;
  void *v75;
  uint64_t v76;
  unsigned int v77;
  id v79;
  id v80;
  __CFString *v81;
  id v82;
  __CFString *v83;
  id v84;
  __CFString *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  const __CFString *v91;
  __int16 v92;
  id v93;
  __int16 v94;
  uint64_t v95;
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[2];
  _QWORD v103[2];
  _BYTE v104[128];
  uint64_t v105;

  v7 = a4;
  v105 = *MEMORY[0x24BDAC8D0];
  v79 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[IDSService devices](self->_internetService, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
  v77 = v7;
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v87;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v87 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_msgSend(v16, "uniqueIDOverride");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v9);

        if (v18)
        {
          v19 = v16;

          v13 = v19;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v86, v104, 16);
    }
    while (v12);
    v7 = v77;
    if (v13)
    {
LABEL_16:
      v22 = (__CFString *)objc_msgSend(v79, "mutableCopy");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, CFSTR("waking"));

      v76 = IDSCopyIDForDevice();
      -[__CFString objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("type"));
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v24 == CFSTR("subscription"))
      {
        v74 = v22;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%@"), self->_deviceUUID, v9);
        v29 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v29;
        v30 = (void *)MEMORY[0x24BDBCE70];
        if ((_DWORD)v7)
        {
          v103[0] = v29;
          v103[1] = &unk_24D27BA40;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v103, 2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = *MEMORY[0x24BE4FB00];
          v102[0] = *MEMORY[0x24BE4FB18];
          v102[1] = v32;
          v33 = (void *)MEMORY[0x24BDBCE30];
          v34 = v102;
          v35 = 2;
        }
        else
        {
          v101[0] = &unk_24D27BA58;
          v101[1] = v29;
          v101[2] = &unk_24D27BA40;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v101, 3);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = *MEMORY[0x24BE4FB18];
          v100[0] = *MEMORY[0x24BE4FB08];
          v100[1] = v47;
          v100[2] = *MEMORY[0x24BE4FB00];
          v33 = (void *)MEMORY[0x24BDBCE30];
          v34 = v100;
          v35 = 3;
        }
        objc_msgSend(v33, "arrayWithObjects:count:", v34, v35);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dictionaryWithObjects:forKeys:", v31, v42);
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[__CFString objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("type"));
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v25 != CFSTR("context"))
        {
          v26 = 0;
          v27 = 0;
          v28 = (__CFString *)v76;
          goto LABEL_31;
        }
        v36 = (void *)MEMORY[0x24BDD17C8];
        -[__CFString objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("identifier"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("%@:%@"), v37, v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v74 = v22;
        -[__CFString objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("identifier"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        MessageIntentFromDistributedContextClientIdentifier = GetMessageIntentFromDistributedContextClientIdentifier(v38);

        v40 = (void *)MEMORY[0x24BDBCE70];
        v41 = (uint64_t *)MEMORY[0x24BE4FB00];
        if ((_DWORD)v7)
        {
          v99[0] = v26;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", MessageIntentFromDistributedContextClientIdentifier);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v99[1] = v31;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 2);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = *v41;
          v98[0] = *MEMORY[0x24BE4FB18];
          v98[1] = v43;
          v44 = (void *)MEMORY[0x24BDBCE30];
          v45 = v98;
          v46 = 2;
        }
        else
        {
          v97[0] = &unk_24D27BA58;
          v97[1] = v26;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", MessageIntentFromDistributedContextClientIdentifier);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v97[2] = v31;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 3);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = *MEMORY[0x24BE4FB18];
          v96[0] = *MEMORY[0x24BE4FB08];
          v96[1] = v48;
          v96[2] = *MEMORY[0x24BE4FB00];
          v44 = (void *)MEMORY[0x24BDBCE30];
          v45 = v96;
          v46 = 3;
        }
        objc_msgSend(v44, "arrayWithObjects:count:", v45, v46);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dictionaryWithObjects:forKeys:", v42, v49);
        v27 = objc_claimAutoreleasedReturnValue();

      }
      v28 = (__CFString *)v76;
      if (v27)
      {
        v22 = v74;
        if (v26)
          goto LABEL_35;
      }
      else
      {
        v22 = v74;
      }
LABEL_31:
      __biome_log_for_category();
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.4();

      if (a6)
      {
        v75 = (void *)v27;
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 6, 0);
        v51 = 0;
        v21 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v52 = CFSTR("com.apple.contextsync");
LABEL_66:

        goto LABEL_67;
      }
LABEL_35:
      v73 = v26;
      v75 = (void *)v27;
      if (objc_msgSend(v13, "isLocallyPaired"))
      {
        __biome_log_for_category();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v28;
          _os_log_impl(&dword_214A1F000, v53, OS_LOG_TYPE_INFO, "Device is locally paired, will send over local service %@", buf, 0xCu);
        }

        __biome_log_for_category();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v91 = v22;
          _os_log_impl(&dword_214A1F000, v54, OS_LOG_TYPE_INFO, "Sending message over local service %@", buf, 0xCu);
        }

        localService = self->_localService;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v28);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = 0;
        v85 = CFSTR("com.apple.contextsync");
        v57 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](localService, "sendMessage:toDestinations:priority:options:identifier:error:", v22, v56, 300, v27, &v85, &v84);
        v58 = v85;
        v59 = v84;

        __biome_log_for_category();
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = v60;
        if ((v57 & 1) != 0)
        {
          v28 = (__CFString *)v76;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
          {
            v62 = CFSTR("nonwaking");
            *(_DWORD *)buf = 138412802;
            if (v77)
              v62 = CFSTR("waking");
            v91 = v62;
            v92 = 2112;
            v93 = v79;
            v94 = 2112;
            v95 = v76;
            _os_log_impl(&dword_214A1F000, v61, OS_LOG_TYPE_DEFAULT, "Sent %@ %@ to devices %@ over local service", buf, 0x20u);
          }
        }
        else
        {
          v28 = (__CFString *)v76;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.2();
        }

        internetService = self->_internetService;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v28);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v59;
        v83 = v58;
        LOBYTE(internetService) = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](internetService, "sendMessage:toDestinations:priority:options:identifier:error:", v22, v69, 300, v75, &v83, &v82);
        v52 = v83;

        v51 = v82;
        __biome_log_for_category();
        v70 = objc_claimAutoreleasedReturnValue();
        v66 = v70;
        if ((internetService & 1) != 0)
        {
          v26 = v73;
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            v67 = CFSTR("nonwaking");
            *(_DWORD *)buf = 138412802;
            if (v77)
              v67 = CFSTR("waking");
LABEL_56:
            v91 = v67;
            v92 = 2112;
            v93 = v79;
            v94 = 2112;
            v95 = (uint64_t)v28;
            _os_log_impl(&dword_214A1F000, v66, OS_LOG_TYPE_DEFAULT, "Sent %@ %@ to device %@ over internet service", buf, 0x20u);
            goto LABEL_57;
          }
          goto LABEL_57;
        }
        v26 = v73;
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.1();

        v71 = a6;
        if (!a6)
          goto LABEL_65;
      }
      else
      {
        v63 = self->_internetService;
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v28);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0;
        v81 = CFSTR("com.apple.contextsync");
        LOBYTE(v63) = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v63, "sendMessage:toDestinations:priority:options:identifier:error:", v22, v64, 300, v27, &v81, &v80);
        v52 = v81;
        v51 = v80;

        __biome_log_for_category();
        v65 = objc_claimAutoreleasedReturnValue();
        v66 = v65;
        if ((v63 & 1) != 0)
        {
          v26 = v73;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v67 = CFSTR("nonwaking");
            *(_DWORD *)buf = 138412802;
            if (v77)
              v67 = CFSTR("waking");
            goto LABEL_56;
          }
LABEL_57:

          v21 = 1;
          goto LABEL_66;
        }
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.1();

        v71 = a6;
        v26 = v73;
        if (!a6)
        {
LABEL_65:
          v21 = 0;
          goto LABEL_66;
        }
      }
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 6, 0);
      v21 = 0;
      *v71 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_66;
    }
  }
  __biome_log_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[BMDistributedContextService sendIDSMessageWithContent:asWaking:toDevice:error:].cold.5();

  -[BMDistributedContextService removeAllSubscriptionsForDeadRemoteDevice:](self, "removeAllSubscriptionsForDeadRemoteDevice:", v9);
  if (!a6)
  {
    v13 = 0;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 6, 0);
  v13 = 0;
  v21 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_67:

  return v21;
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *queue;
  BMDistributedContextContextChangedMessage *v21;
  void *v22;
  _QWORD block[4];
  BMDistributedContextContextChangedMessage *v24;
  id v25;
  BMDistributedContextService *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  -[IDSService deviceForFromID:](self->_internetService, "deviceForFromID:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDistributedContextService logMetricsForMessage:andContext:fromDevice:](self, "logMetricsForMessage:andContext:fromDevice:", v10, v12, v13);
  if (v13)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("type"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("subscription"));

    __biome_log_for_category();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        objc_msgSend(v13, "uniqueIDOverride");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "serverReceivedTime");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v18;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v19;
        _os_log_impl(&dword_214A1F000, v16, OS_LOG_TYPE_DEFAULT, "Received new subscription from %@: %@ sent at %@", buf, 0x20u);

      }
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __78__BMDistributedContextService_service_account_incomingMessage_fromID_context___block_invoke;
      block[3] = &unk_24D2788C0;
      v24 = (BMDistributedContextContextChangedMessage *)v10;
      v25 = v13;
      v26 = self;
      dispatch_sync(queue, block);

      v21 = v24;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        v28 = v10;
        _os_log_impl(&dword_214A1F000, v16, OS_LOG_TYPE_DEFAULT, "Received new context: %@", buf, 0xCu);
      }

      v21 = -[BMDistributedContextContextChangedMessage initWithMessageDictionary:]([BMDistributedContextContextChangedMessage alloc], "initWithMessageDictionary:", v10);
      if (v21)
      {
        objc_msgSend(v13, "uniqueIDOverride");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMDistributedContextService handleIncomingContextChangeMessage:forDevice:](self, "handleIncomingContextChangeMessage:forDevice:", v21, v22);

      }
    }
  }
  else
  {
    __biome_log_for_category();
    v21 = (BMDistributedContextContextChangedMessage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_FAULT))
      -[BMDistributedContextService service:account:incomingMessage:fromID:context:].cold.1();
  }

}

void __78__BMDistributedContextService_service_account_incomingMessage_fromID_context___block_invoke(uint64_t a1)
{
  BMDistributedContextSubscribeMessage *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  BMDistributedContextSubscribeMessage *v7;

  v2 = [BMDistributedContextSubscribeMessage alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uniqueIDOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMDistributedContextSubscribeMessage initWithMessageDictionary:fromRemoteDevice:localDevice:](v2, "initWithMessageDictionary:fromRemoteDevice:localDevice:", v3, v4, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));

  if (v7)
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "uniqueIDOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveRemoteSubscription:fromDevice:", v7, v6);

  }
}

- (void)connection:(id)a3 devicesChanged:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  BMDistributedContextService *v10;

  v5 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__BMDistributedContextService_connection_devicesChanged___block_invoke;
  block[3] = &unk_24D278988;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_sync(queue, block);

}

void __57__BMDistributedContextService_connection_devicesChanged___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  _QWORD v36[3];

  *(_QWORD *)((char *)&v36[1] + 4) = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("uniqueIDOverride"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36[0] = v2;
    _os_log_impl(&dword_214A1F000, v3, OS_LOG_TYPE_DEFAULT, "Potential device change: Current device set is %@", buf, 0xCu);
  }

  v4 = *(_QWORD **)(a1 + 40);
  v5 = (void *)v4[8];
  objc_msgSend(v4, "deviceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionsWithSubscribedDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v14, "subscribingDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v2, "containsObject:", v15);

        if ((v16 & 1) == 0)
        {
          __biome_log_for_category();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            __57__BMDistributedContextService_connection_devicesChanged___block_invoke_cold_1(buf, v14, v36, v17);

          objc_msgSend(v14, "subscribingDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v18);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = v8;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "removeAllSubscriptionsMadeBySubscribingDevice:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v21);
  }

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x2199D9B7C]();
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __biome_log_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "executableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v11;
    v18 = 1024;
    v19 = objc_msgSend(v9, "pid");
    _os_log_impl(&dword_214A1F000, v10, OS_LOG_TYPE_DEFAULT, "Incoming connection from %{public}@(%d)", (uint8_t *)&v16, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v9, 0, *MEMORY[0x24BE0C058]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "allowsAccessToContextSync");
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D9DAE8);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v14);
    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(v7, "resume");
  }
  else
  {
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[BMDistributedContextService listener:shouldAcceptNewConnection:].cold.1(v9);
  }

  objc_autoreleasePoolPop(v8);
  return v13;
}

- (void)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDeviceTypes:(int64_t)a7 withErrorHandler:(id)a8
{
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  char v30;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v34 = a8;
  v13 = (void *)MEMORY[0x24BDBCED8];
  v14 = a5;
  objc_msgSend(v13, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v15, "setValue:forKey:", CFSTR("Unknown Error"), *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 0, v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v17, 0, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12
    && (objc_msgSend(v11, "rootStreamIdentifiers"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v18, "allowsAccessToContextSyncStreams:", v19),
        v19,
        (v20 & 1) != 0))
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.remotedeviceactivitymonitor")) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", CFSTR("com.appleinternal.proactive.remoteactivitylevel")))
    {
      v21 = a6 | 2;
    }
    else
    {
      v21 = a6;
    }
    +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v33;
    v30 = objc_msgSend(v29, "registerForUpdates:withIdentifier:withOptions:forDeviceTypes:withError:", v11, v12, v21, a7, &v36);
    v27 = v36;

    v28 = v34;
    (*((void (**)(id, BOOL, id))v34 + 2))(v34, (v30 & 1) != 0, v27);
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v17, "executableName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("'%@' is not entitled for context sync access to '%@'"), v23, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x24BDD1540];
    v37 = v16;
    v38[0] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 5, v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v28 = v34;
    (*((void (**)(id, _QWORD, id))v34 + 2))(v34, 0, v27);

  }
}

- (void)registerForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 withOptions:(unint64_t)a6 forDevices:(id)a7 withErrorHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v41 = a8;
  v15 = (void *)MEMORY[0x24BDBCED8];
  v16 = a5;
  objc_msgSend(v15, "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v17, "setValue:forKey:", CFSTR("Unknown Error"), *MEMORY[0x24BDD0FC8]);
  v40 = v17;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 0, v17);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v20, 0, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = v13;
  if (v13
    && (objc_msgSend(v12, "rootStreamIdentifiers"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v21, "allowsAccessToContextSyncStreams:", v23),
        v23,
        (v24 & 1) != 0))
  {
    +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v39;
    v26 = objc_msgSend(v25, "registerForUpdates:withIdentifier:withOptions:forDevices:withError:", v12, v22, a6, v14, &v42);
    v27 = v42;

    v28 = v41;
    (*((void (**)(id, BOOL, id))v41 + 2))(v41, (v26 & 1) != 0, v27);
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v20, "executableName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v19;
    v31 = v12;
    v32 = v14;
    v33 = v22;
    objc_msgSend(v29, "stringWithFormat:", CFSTR("'%@' is not entitled for context sync access to '%@'"), v30, v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD1540];
    v43 = v18;
    v44[0] = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 5, v36);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    v22 = v33;
    v14 = v32;
    v28 = v41;
    (*((void (**)(id, _QWORD, id))v41 + 2))(v41, 0, v27);

    v12 = v31;
    v19 = v38;
  }

}

- (void)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDeviceTypes:(int64_t)a6 withErrorHandler:(id)a7
{
  id v10;
  void (**v11)(id, BOOL, id);
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v10 = a4;
  v11 = (void (**)(id, BOOL, id))a7;
  v12 = (void *)MEMORY[0x24BDBCED8];
  v13 = a5;
  objc_msgSend(v12, "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v14, "setValue:forKey:", CFSTR("Unknown Error"), *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 0, v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v16, 0, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v10;
  if (v10
    && (objc_msgSend(v33, "rootStreamIdentifiers"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v17, "allowsAccessToContextSyncStreams:", v19),
        v19,
        (v20 & 1) != 0))
  {
    +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v31;
    v22 = v33;
    v23 = objc_msgSend(v21, "unregisterForUpdates:withIdentifier:forDeviceTypes:withError:", v33, v18, a6, &v34);
    v24 = v34;

    v11[2](v11, (v23 & 1) != 0, v24);
  }
  else
  {
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v16, "executableName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("'%@' is not entitled for context sync access to '%@'"), v26, v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BDD1540];
    v35 = v15;
    v36[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 5, v29);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v11[2](v11, 0, v24);
    v22 = v33;
  }

}

- (void)unregisterForUpdates:(id)a3 withIdentifier:(id)a4 forUseCase:(id)a5 forDevices:(id)a6 withErrorHandler:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, BOOL, id);
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v36 = a6;
  v13 = (void (**)(id, BOOL, id))a7;
  v14 = (void *)MEMORY[0x24BDBCED8];
  v15 = a5;
  objc_msgSend(v14, "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v16, "setValue:forKey:", CFSTR("Unknown Error"), *MEMORY[0x24BDD0FC8]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 0, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C0A0], "processWithXPCConnection:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0C080], "policyForProcess:connectionFlags:useCase:", v19, 0, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v12;
  if (v12
    && (objc_msgSend(v11, "rootStreamIdentifiers"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v20, "allowsAccessToContextSyncStreams:", v21),
        v21,
        (v22 & 1) != 0))
  {
    v23 = v20;
    +[BMDistributedContextService distributedContextManager](BMDistributedContextService, "distributedContextManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v18;
    v25 = v36;
    v26 = objc_msgSend(v24, "unregisterForUpdates:withIdentifier:forDevices:withError:", v11, v37, v36, &v38);
    v27 = v38;

    v13[2](v13, (v26 & 1) != 0, v27);
  }
  else
  {
    v34 = v20;
    v28 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v19, "executableName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("'%@' is not entitled for context sync access to '%@'"), v29, v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x24BDD1540];
    v39 = v17;
    v40[0] = v30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("ContextSyncErrorDomain"), 5, v32);
    v27 = (id)objc_claimAutoreleasedReturnValue();

    __biome_log_for_category();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[BMDistributedContextService unregisterForUpdates:withIdentifier:forUseCase:forDevices:withErrorHandler:].cold.1();

    v13[2](v13, 0, v27);
    v25 = v36;
    v23 = v34;
  }

}

- (void)logMetricsForSubscription:(id)a3 uponReboot:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id obj;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dsl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "streamPublishers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subscribingDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMDistributedContextService idsDeviceForDeviceUUID:](self, "idsDeviceForDeviceUUID:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[BMDistributedContextService logMetricsForSubscription:uponReboot:].cold.1(v5);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v8;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(obj);
        v17 = v5;
        v18 = v10;
        v19 = v6;
        AnalyticsSendEventLazy();

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

}

id __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("identifier"));

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("context"));

  v5 = *(void **)(a1 + 48);
  if (v5)
  {
    +[BMDistributedContextService stringForIDSDeviceType:](BMDistributedContextService, "stringForIDSDeviceType:", objc_msgSend(v5, "deviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("subscriberDeviceType"));

  }
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wakeState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "BOOLValue"))
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("waking"));
    v9 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastChangedDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v11);
    v13 = v12;

    if (v13 == 0.0)
    {
      __biome_log_for_category();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_2((uint64_t)v8, a1);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 / 60.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, CFSTR("duration"));

    }
  }
  __biome_log_for_category();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_1();

  return v2;
}

- (void)logMetricsForMessage:(id)a3 andContext:(id)a4 fromDevice:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v8;
    v12 = v7;
    v13 = v9;
    AnalyticsSendEventLazy();

  }
}

id __74__BMDistributedContextService_logMetricsForMessage_andContext_fromDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serverReceivedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceNow");
  if (fabs(v4) < 1.0)
    v4 = 0.0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("latencySeconds"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("messageType"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("type"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v7 == CFSTR("subscription"))
  {
    v8 = CFSTR("None");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("streamIdentifier"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("contextIdentifier"));
  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    +[BMDistributedContextService stringForIDSDeviceType:](BMDistributedContextService, "stringForIDSDeviceType:", objc_msgSend(v9, "deviceType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("subscriberDeviceType"));

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("waking"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("waking"));

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("version"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("messageVersion"));

  __biome_log_for_category();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    __74__BMDistributedContextService_logMetricsForMessage_andContext_fromDevice___block_invoke_cold_1();

  return v2;
}

- (IDSService)localService
{
  return self->_localService;
}

- (void)setLocalService:(id)a3
{
  objc_storeStrong((id *)&self->_localService, a3);
}

- (IDSService)internetService
{
  return self->_internetService;
}

- (void)setInternetService:(id)a3
{
  objc_storeStrong((id *)&self->_internetService, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSString)deviceUUID
{
  return self->_deviceUUID;
}

- (void)setDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceUUID, a3);
}

- (NSUserDefaults)subscriptionDefaults
{
  return self->_subscriptionDefaults;
}

- (void)setSubscriptionDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionDefaults, a3);
}

- (BMDistributedContextSubscriptionStorage)subscriptionStorage
{
  return self->_subscriptionStorage;
}

- (void)setSubscriptionStorage:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionStorage, a3);
}

- (BMDistributedContextSubscriptionManager)subscriptionManager
{
  return self->_subscriptionManager;
}

- (void)setSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionManager, a3);
}

- (NSMutableDictionary)subscriptionSinks
{
  return self->_subscriptionSinks;
}

- (void)setSubscriptionSinks:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionSinks, a3);
}

- (BMDistributedContextEventTranslation)eventTranslator
{
  return self->_eventTranslator;
}

- (void)setEventTranslator:(id)a3
{
  objc_storeStrong((id *)&self->_eventTranslator, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)idsQueue
{
  return self->_idsQueue;
}

- (void)setIdsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_idsQueue, a3);
}

- (OS_dispatch_queue)biomeQueue
{
  return self->_biomeQueue;
}

- (void)setBiomeQueue:(id)a3
{
  objc_storeStrong((id *)&self->_biomeQueue, a3);
}

- (BOOL)rebootNotificationDelivered
{
  return self->_rebootNotificationDelivered;
}

- (void)setRebootNotificationDelivered:(BOOL)a3
{
  self->_rebootNotificationDelivered = a3;
}

- (NSMutableDictionary)lockedUpdates
{
  return self->_lockedUpdates;
}

- (void)setLockedUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_lockedUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockedUpdates, 0);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventTranslator, 0);
  objc_storeStrong((id *)&self->_subscriptionSinks, 0);
  objc_storeStrong((id *)&self->_subscriptionManager, 0);
  objc_storeStrong((id *)&self->_subscriptionStorage, 0);
  objc_storeStrong((id *)&self->_subscriptionDefaults, 0);
  objc_storeStrong((id *)&self->_deviceUUID, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_internetService, 0);
  objc_storeStrong((id *)&self->_localService, 0);
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6_0(&dword_214A1F000, a2, a3, "Did not successfully set up sink with identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __66__BMDistributedContextService_registerSinkWithIdentifier_withDSL___block_invoke_39_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_214A1F000, v0, v1, "New event was not whitelisted, missing streamIdentifier, eventData, or dataVersion %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cancelSubscriptionForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_214A1F000, v0, v1, "Could not find a dsl for identifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __76__BMDistributedContextService_handleIncomingContextChangeMessage_forDevice___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "Received a context change for which we have no active subscription, re-asserting our subscriptions to subscribed device %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_214A1F000, v0, v1, "Failed to send over internet service: %@ because %@");
  OUTLINED_FUNCTION_2();
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_214A1F000, v0, v1, "Failed to send over local service: %@ because %@");
  OUTLINED_FUNCTION_2();
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_214A1F000, v0, v1, "Failed to send %@: No queue identifier %@ / options");
  OUTLINED_FUNCTION_2();
}

- (void)sendIDSMessageWithContent:asWaking:toDevice:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_214A1F000, v0, v1, "Cannot find %@ in device set %@");
  OUTLINED_FUNCTION_2();
}

- (void)service:account:incomingMessage:fromID:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6_0(&dword_214A1F000, v0, v1, "Received new message but dropping because could not find device %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __57__BMDistributedContextService_connection_devicesChanged___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "subscribingDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_214A1F000, a4, OS_LOG_TYPE_ERROR, "Disconnected subscribing device %@", a1, 0xCu);

}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(a1, "executableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_3();
}

- (void)unregisterForUpdates:withIdentifier:forUseCase:forDevices:withErrorHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0(&dword_214A1F000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)logMetricsForSubscription:(void *)a1 uponReboot:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;

  objc_msgSend(a1, "subscribingDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0xCu);

}

void __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_214A1F000, v0, v1, "Logged stream end: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __68__BMDistributedContextService_logMetricsForSubscription_uponReboot___block_invoke_cold_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  os_log_t v4;
  os_log_type_t v5;
  const char *v6;
  uint8_t *v7;
  void *v8;

  objc_msgSend(*(id *)(a2 + 64), "subscriptionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allSubscriptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x16u);

  OUTLINED_FUNCTION_3();
}

void __74__BMDistributedContextService_logMetricsForMessage_andContext_fromDevice___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_214A1F000, v0, v1, "Logged new message: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
