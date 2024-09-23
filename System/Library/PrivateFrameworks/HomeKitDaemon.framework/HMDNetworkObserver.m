@implementation HMDNetworkObserver

- (HMDNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HMDNetworkObserver *v21;

  v12 = (void *)MEMORY[0x24BE3F2B8];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 0, 1.0);
  v21 = -[HMDNetworkObserver initWithLogEventDispatcher:countersManager:dailyScheduler:currentHomeDataSource:dateProvider:wifiManager:notificationCenter:changeDebounceTimer:tickBlock:](self, "initWithLogEventDispatcher:countersManager:dailyScheduler:currentHomeDataSource:dateProvider:wifiManager:notificationCenter:changeDebounceTimer:tickBlock:", v17, v16, v15, v14, v13, v18, v19, v20, &__block_literal_global_30_73381);

  return v21;
}

- (HMDNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7 wifiManager:(id)a8 notificationCenter:(id)a9 changeDebounceTimer:(id)a10 tickBlock:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HMDNetworkObserver *v23;
  HMDNetworkObserver *v24;
  void *v25;
  id tickBlock;
  NSMutableDictionary *v27;
  NSMutableDictionary *topWriteErrors;
  NSMutableDictionary *v29;
  NSMutableDictionary *topSessionErrors;
  id v33;
  id obj;
  objc_super v35;

  v16 = a3;
  v17 = a4;
  obj = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v33 = a10;
  v22 = a11;
  v35.receiver = self;
  v35.super_class = (Class)HMDNetworkObserver;
  v23 = -[HMDNetworkObserver init](&v35, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_logEventDispatcher, v16);
    objc_storeWeak((id *)&v24->_countersManager, v17);
    objc_storeWeak((id *)&v24->_wifiManager, v20);
    objc_storeWeak((id *)&v24->_notificationCenter, v21);
    v24->_wifiAssociated = 0;
    objc_storeWeak((id *)&v24->_currentHomeDataSource, v18);
    objc_storeWeak((id *)&v24->_dateProvider, v19);
    objc_storeWeak((id *)&v24->_dailyScheduler, obj);
    v25 = _Block_copy(v22);
    tickBlock = v24->_tickBlock;
    v24->_tickBlock = v25;

    v24->_networkAssociationLock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&v24->_numWifiAssociations = 0u;
    *(_OWORD *)&v24->_numAPChanges = 0u;
    *(_OWORD *)&v24->_numReadWrites = 0u;
    v24->_numWriteErrors = 0;
    objc_storeStrong((id *)&v24->_changeDebounceTimer, a10);
    -[HMFTimer setDelegate:](v24->_changeDebounceTimer, "setDelegate:", v24);
    v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    topWriteErrors = v24->_topWriteErrors;
    v24->_topWriteErrors = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    topSessionErrors = v24->_topSessionErrors;
    v24->_topSessionErrors = v29;

    v24->_started = 0;
  }

  return v24;
}

- (void)start
{
  void *v3;
  HMDNetworkObserver *v4;
  NSObject *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t (**v12)(void);
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!self->_started)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    v7 = (_QWORD *)MEMORY[0x24BE3F130];
    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", *MEMORY[0x24BE3F130], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkObserver _handleCurrentNetworkChangedNotification:](v4, "_handleCurrentNetworkChangedNotification:", v8);

    -[HMDNetworkObserver logEventDispatcher](v4, "logEventDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedEventClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:forEventClasses:", v4, v10);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v4, sel__handleCurrentNetworkChangedNotification_, *v7, 0);

    -[HMDNetworkObserver tickBlock](v4, "tickBlock");
    v12 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v4->_collectionStartSeconds = v12[2]();

    self->_started = 1;
    -[HMDNetworkObserver dailyScheduler](v4, "dailyScheduler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerDailyTaskRunner:", v4);

  }
}

- (void)stop
{
  void *v3;
  HMDNetworkObserver *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_started)
  {
    v3 = (void *)MEMORY[0x227676638]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    -[HMDNetworkObserver changeDebounceTimer](v4, "changeDebounceTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "suspend");

    -[HMDNetworkObserver logEventDispatcher](v4, "logEventDispatcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:", v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", v4, *MEMORY[0x24BE3F130], 0);

    self->_started = 0;
  }
}

- (id)counterGroupForName:(id)a3 homeUUID:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4)
  {
    v8 = a5;
    v9 = a4;
    v10 = a3;
    -[HMDNetworkObserver countersManager](self, "countersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", v10, v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_handleCurrentNetworkChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[HMDNetworkObserver wifiManager](self, "wifiManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentNetworkAssociation");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDNetworkObserver countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkObserver dateProvider](self, "dateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startOfCurrentDay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDateCounterGroupSpecifier specifierWithGroupName:date:](HMDDateCounterGroupSpecifier, "specifierWithGroupName:date:", CFSTR("NetworkStatusEventGroup"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v12, "SSID"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    -[HMDNetworkObserver changeDebounceTimer](self, "changeDebounceTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  else if (self->_wifiAssociated)
  {
    self->_wifiAssociated = 0;
    objc_msgSend(v9, "incrementEventCounterForEventName:", CFSTR("WifiDissociationCount"));
    ++self->_numWifiDisassociations;
  }

}

- (void)_incrementError:(id)a3 forHistogram:(id)a4 byValue:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v9)
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v9, "unsignedLongValue") + a5);
  else
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);

}

- (id)_keyOfLargestCountInHistogram:(id)a3
{
  id v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  _QWORD v13[4];

  v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__73365;
  v11 = __Block_byref_object_dispose__73366;
  v12 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__HMDNetworkObserver__keyOfLargestCountInHistogram___block_invoke;
  v6[3] = &unk_24E78FF58;
  v6[4] = v13;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

- (void)_clearNonPersistentCounters
{
  uint64_t (**v3)(void);
  void *v4;
  id v5;

  self->_numWriteErrors = 0;
  *(_OWORD *)&self->_numReadWrites = 0u;
  *(_OWORD *)&self->_numAPChanges = 0u;
  *(_OWORD *)&self->_numWifiAssociations = 0u;
  -[HMDNetworkObserver tickBlock](self, "tickBlock");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  self->_collectionStartSeconds = v3[2]();

  -[HMDNetworkObserver topWriteErrors](self, "topWriteErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[HMDNetworkObserver topSessionErrors](self, "topSessionErrors");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (void)_handleReadWriteLogEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  -[HMDNetworkObserver dateProvider](self, "dateProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startOfCurrentDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "homeUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkObserver countersManager](self, "countersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDateCounterGroupSpecifier specifierWithGroupName:date:](HMDDateCounterGroupSpecifier, "specifierWithGroupName:date:", CFSTR("NetworkStatusEventGroup"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("ReadWriteErrorEventGroup"), v6, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "incrementEventCounterForEventName:", CFSTR("ReadWriteCount"));
  ++self->_numReadWrites;
  objc_msgSend(v18, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_msgSend(v18, "isWriteOperation");
    if (v12)
      v13 = CFSTR("WriteErrorCount");
    else
      v13 = CFSTR("ReadErrorCount");
    if (v12)
      v14 = 136;
    else
      v14 = 128;
    objc_msgSend(v9, "incrementEventCounterForEventName:", v13);
    ++*(Class *)((char *)&self->super.isa + v14);
    objc_msgSend(v18, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "incrementEventCounterForEventName:", v16);
    -[HMDNetworkObserver topWriteErrors](self, "topWriteErrors");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkObserver _incrementError:forHistogram:byValue:](self, "_incrementError:forHistogram:byValue:", v16, v17, 1);

  }
}

- (void)_handleAccessorySessionEvent:(id)a3
{
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
  id v14;

  v14 = a3;
  objc_msgSend(v14, "topErrorDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v14, "homeUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkObserver dateProvider](self, "dateProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startOfCurrentDay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("AccessorySessionErrorGroup"), v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v14, "topErrorDomain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v14, "topErrorCode"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:](HMDLogEventErrorEventsAnalyzer, "eventCounterNameForError:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "incrementEventCounterForEventName:withValue:", v12, objc_msgSend(v14, "sessionFailures"));
    -[HMDNetworkObserver topSessionErrors](self, "topSessionErrors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkObserver _incrementError:forHistogram:byValue:](self, "_incrementError:forHistogram:byValue:", v12, v13, objc_msgSend(v14, "sessionFailures"));

  }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    -[HMDNetworkObserver _handleReadWriteLogEvent:](self, "_handleReadWriteLogEvent:", v5);
LABEL_11:

    goto LABEL_12;
  }
  v6 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[HMDNetworkObserver _handleAccessorySessionEvent:](self, "_handleAccessorySessionEvent:", v8);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)runDailyTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  HMFWifiNetworkAssociation *v9;
  HMFWifiNetworkAssociation *networkAssociation;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t (**v19)(void);
  HMDNetworkStabilityLogEvent *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[HMDNetworkObserver topWriteErrors](self, "topWriteErrors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkObserver _keyOfLargestCountInHistogram:](self, "_keyOfLargestCountInHistogram:", v3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNetworkObserver topSessionErrors](self, "topSessionErrors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkObserver _keyOfLargestCountInHistogram:](self, "_keyOfLargestCountInHistogram:", v4);
  v5 = objc_claimAutoreleasedReturnValue();

  v24 = (void *)v5;
  if (v5)
  {
    -[HMDNetworkObserver topSessionErrors](self, "topSessionErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "unsignedIntValue");

  }
  os_unfair_lock_lock_with_options();
  if (!self->_networkAssociation)
  {
    -[HMDNetworkObserver wifiManager](self, "wifiManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentNetworkAssociation");
    v9 = (HMFWifiNetworkAssociation *)objc_claimAutoreleasedReturnValue();
    networkAssociation = self->_networkAssociation;
    self->_networkAssociation = v9;

  }
  -[HMDNetworkObserver networkAssociation](self, "networkAssociation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BSSID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "formattedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "substringToIndex:", 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNetworkObserver networkAssociation](self, "networkAssociation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "SSID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNetworkObserver networkAssociation](self, "networkAssociation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "gatewayMACAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "formattedString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_networkAssociationLock);
  -[HMDNetworkObserver dateProvider](self, "dateProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkObserver currentHomeDataSource](self, "currentHomeDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "homeUUIDForCurrentResidentDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDNetworkObserver tickBlock](self, "tickBlock");
  v19 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v22 = (unint64_t)(double)((v19[2]() - self->_collectionStartSeconds) / 0x3C);

  v20 = -[HMDNetworkStabilityLogEvent initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:]([HMDNetworkStabilityLogEvent alloc], "initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:", v23, -[HMDNetworkObserver numWifiAssociations](self, "numWifiAssociations"), -[HMDNetworkObserver numWifiDisassociations](self, "numWifiDisassociations"), -[HMDNetworkObserver numAPChanges](self, "numAPChanges"), -[HMDNetworkObserver numGatewayChanges](self, "numGatewayChanges"), -[HMDNetworkObserver numReadWrites](self, "numReadWrites"), -[HMDNetworkObserver numReadErrors](self, "numReadErrors"), -[HMDNetworkObserver numWriteErrors](self, "numWriteErrors"), v28, v24, v5, v27, v26, v25, objc_msgSend(v17, "localHourOfDay"),
          v22);
  if (v20)
  {
    -[HMDNetworkObserver logEventDispatcher](self, "logEventDispatcher");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "submitLogEvent:", v20);

  }
  -[HMDNetworkObserver _clearNonPersistentCounters](self, "_clearNonPersistentCounters");

}

- (id)logEventForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  os_unfair_lock_s *p_networkAssociationLock;
  void *v18;
  HMFWifiNetworkAssociation *v19;
  HMFWifiNetworkAssociation *networkAssociation;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMDNetworkStabilityLogEvent *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44[2];

  v6 = a3;
  v7 = a4;
  -[HMDNetworkObserver currentHomeDataSource](self, "currentHomeDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeUUIDForCurrentResidentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hmf_isEqualToUUID:", v9);

  if (v10)
  {
    -[HMDNetworkObserver countersManager](self, "countersManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDateCounterGroupSpecifier specifierWithGroupName:date:](HMDDateCounterGroupSpecifier, "specifierWithGroupName:date:", CFSTR("NetworkStatusEventGroup"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("ReadWriteErrorEventGroup"), v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDNetworkObserver counterGroupForName:homeUUID:date:](self, "counterGroupForName:homeUUID:date:", CFSTR("AccessorySessionErrorGroup"), v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("WifiAssociationCount"));
    v39 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("WifiDissociationCount"));
    v38 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("APChangeCount"));
    v37 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("GatewayChangeCount"));
    v36 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("ReadWriteCount"));
    v34 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("ReadErrorCount"));
    v33 = objc_msgSend(v13, "fetchEventCounterForEventName:", CFSTR("WriteErrorCount"));
    v44[0] = 0;
    v42 = v14;
    objc_msgSend(v14, "maxCounterName:", v44);
    v35 = v44[0];
    v43 = 0;
    objc_msgSend(v15, "maxCounterName:", &v43);
    v16 = v43;
    v41 = v15;
    v32 = objc_msgSend(v15, "fetchEventCounterForEventName:", v16);
    p_networkAssociationLock = &self->_networkAssociationLock;
    os_unfair_lock_lock_with_options();
    if (!self->_networkAssociation)
    {
      -[HMDNetworkObserver wifiManager](self, "wifiManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "currentNetworkAssociation");
      v19 = (HMFWifiNetworkAssociation *)objc_claimAutoreleasedReturnValue();
      networkAssociation = self->_networkAssociation;
      self->_networkAssociation = v19;

    }
    -[HMDNetworkObserver networkAssociation](self, "networkAssociation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "BSSID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "formattedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "substringToIndex:", 8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDNetworkObserver networkAssociation](self, "networkAssociation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "SSID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDNetworkObserver networkAssociation](self, "networkAssociation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "gatewayMACAddress");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "formattedString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(p_networkAssociationLock);
    v30 = -[HMDNetworkStabilityLogEvent initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:]([HMDNetworkStabilityLogEvent alloc], "initWithHomeUUID:numWifiAssociations:wifiDisassociations:apChanges:gatewayChanges:numReadWrites:numReadErrors:numWriteErrors:topReadWriteError:topSessionError:numSessionErrors:apOUI:ssid:gatewayMACAddress:localHourOfDay:collectionDurationMinutes:", v6, v40, v39, v38, v37, v36, v34, v33, v35, v16, v32, v24, v26, v29, 0,
            0);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDNetworkObserver countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDNetworkObserver_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_24E78FF80;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMDNetworkObserver countersManager](self, "countersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__HMDNetworkObserver_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_24E78FF80;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "removeCounterGroupsBasedOnPredicate:", v7);

}

- (void)checkNetworkChange
{
  void *v3;
  void *v4;
  void *v5;
  HMDNetworkObserver *v6;
  NSObject *v7;
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
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  -[HMDNetworkObserver wifiManager](self, "wifiManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentNetworkAssociation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "SSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MACAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "BSSID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gatewayIPAddress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gatewayMACAddress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138544642;
    v29 = v8;
    v30 = 2112;
    v31 = v9;
    v32 = 2112;
    v33 = v10;
    v34 = 2112;
    v35 = v11;
    v36 = 2112;
    v37 = v12;
    v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Network Change Detected.  New Network SSID %@ Local MAC %@, BSSID %@, gatewayIP %@,  gatewayMac %@", (uint8_t *)&v28, 0x3Eu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDNetworkObserver countersManager](v6, "countersManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNetworkObserver dateProvider](v6, "dateProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startOfCurrentDay");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDDateCounterGroupSpecifier specifierWithGroupName:date:](HMDDateCounterGroupSpecifier, "specifierWithGroupName:date:", CFSTR("NetworkStatusEventGroup"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "SSID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (!v6->_wifiAssociated)
      {
        objc_msgSend(v18, "incrementEventCounterForEventName:", CFSTR("WifiAssociationCount"));
        ++v6->_numWifiAssociations;
      }
      v6->_wifiAssociated = 1;
      objc_msgSend(v4, "BSSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkObserver networkAssociation](v6, "networkAssociation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "BSSID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v20, "isEqualToAddress:", v22);

      if ((v23 & 1) == 0)
      {
        objc_msgSend(v18, "incrementEventCounterForEventName:", CFSTR("APChangeCount"));
        ++v6->_numAPChanges;
      }
      objc_msgSend(v4, "gatewayMACAddress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDNetworkObserver networkAssociation](v6, "networkAssociation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "gatewayMACAddress");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "isEqualToAddress:", v26);

      if ((v27 & 1) == 0)
      {
        objc_msgSend(v18, "incrementEventCounterForEventName:", CFSTR("GatewayChangeCount"));
        ++v6->_numGatewayChanges;
      }
      os_unfair_lock_lock_with_options();
      objc_storeStrong((id *)&v6->_networkAssociation, v4);
      os_unfair_lock_unlock(&v6->_networkAssociationLock);
    }
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDNetworkObserver changeDebounceTimer](self, "changeDebounceTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
    -[HMDNetworkObserver checkNetworkChange](self, "checkNetworkChange");
}

- (HMMLogEventDispatching)logEventDispatcher
{
  return (HMMLogEventDispatching *)objc_loadWeakRetained((id *)&self->_logEventDispatcher);
}

- (HMDEventCountersManager)countersManager
{
  return (HMDEventCountersManager *)objc_loadWeakRetained((id *)&self->_countersManager);
}

- (HMFWiFiManager)wifiManager
{
  return (HMFWiFiManager *)objc_loadWeakRetained((id *)&self->_wifiManager);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_loadWeakRetained((id *)&self->_notificationCenter);
}

- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource
{
  return (HMDCurrentResidentDeviceDataSource *)objc_loadWeakRetained((id *)&self->_currentHomeDataSource);
}

- (HMMDateProvider)dateProvider
{
  return (HMMDateProvider *)objc_loadWeakRetained((id *)&self->_dateProvider);
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return (HMDLogEventDailyScheduler *)objc_loadWeakRetained((id *)&self->_dailyScheduler);
}

- (os_unfair_lock_s)networkAssociationLock
{
  return self->_networkAssociationLock;
}

- (void)setNetworkAssociationLock:(os_unfair_lock_s)a3
{
  self->_networkAssociationLock = a3;
}

- (HMFWifiNetworkAssociation)networkAssociation
{
  return self->_networkAssociation;
}

- (BOOL)wifiAssociated
{
  return self->_wifiAssociated;
}

- (void)setWifiAssociated:(BOOL)a3
{
  self->_wifiAssociated = a3;
}

- (unint64_t)collectionStartSeconds
{
  return self->_collectionStartSeconds;
}

- (unint64_t)numWifiAssociations
{
  return self->_numWifiAssociations;
}

- (unint64_t)numWifiDisassociations
{
  return self->_numWifiDisassociations;
}

- (unint64_t)numAPChanges
{
  return self->_numAPChanges;
}

- (unint64_t)numGatewayChanges
{
  return self->_numGatewayChanges;
}

- (unint64_t)numReadWrites
{
  return self->_numReadWrites;
}

- (unint64_t)numReadErrors
{
  return self->_numReadErrors;
}

- (unint64_t)numWriteErrors
{
  return self->_numWriteErrors;
}

- (NSMutableDictionary)topWriteErrors
{
  return self->_topWriteErrors;
}

- (NSMutableDictionary)topSessionErrors
{
  return self->_topSessionErrors;
}

- (BOOL)started
{
  return self->_started;
}

- (id)tickBlock
{
  return self->_tickBlock;
}

- (HMFTimer)changeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeDebounceTimer, 0);
  objc_storeStrong(&self->_tickBlock, 0);
  objc_storeStrong((id *)&self->_topSessionErrors, 0);
  objc_storeStrong((id *)&self->_topWriteErrors, 0);
  objc_storeStrong((id *)&self->_networkAssociation, 0);
  objc_destroyWeak((id *)&self->_dailyScheduler);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_destroyWeak((id *)&self->_currentHomeDataSource);
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_wifiManager);
  objc_destroyWeak((id *)&self->_countersManager);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
}

uint64_t __46__HMDNetworkObserver_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == 1)
    {
      if ((objc_msgSend(v6, "isEqual:", CFSTR("NetworkStatusEventGroup")) & 1) != 0
        || (objc_msgSend(v6, "isEqual:", CFSTR("ReadWriteErrorEventGroup")) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", CFSTR("AccessorySessionErrorGroup"));
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __47__HMDNetworkObserver_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  objc_msgSend(v5, "groupName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 32)) == -1)
    {
      if ((objc_msgSend(v6, "isEqual:", CFSTR("NetworkStatusEventGroup")) & 1) != 0
        || (objc_msgSend(v6, "isEqual:", CFSTR("ReadWriteErrorEventGroup")) & 1) != 0)
      {
        v8 = 1;
      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", CFSTR("AccessorySessionErrorGroup"));
      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __52__HMDNetworkObserver__keyOfLargestCountInHistogram___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < (unint64_t)objc_msgSend(v6, "unsignedIntValue"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "unsignedIntValue");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

__uint64_t __115__HMDNetworkObserver_initWithLogEventDispatcher_countersManager_dailyScheduler_currentHomeDataSource_dateProvider___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken_73383 != -1)
    dispatch_once(&supportedEventClasses_onceToken_73383, &__block_literal_global_73384);
  return (id)supportedEventClasses_supportedEventClasses_73385;
}

void __43__HMDNetworkObserver_supportedEventClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x24BDAC8D0];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supportedEventClasses_supportedEventClasses_73385;
  supportedEventClasses_supportedEventClasses_73385 = v0;

}

@end
