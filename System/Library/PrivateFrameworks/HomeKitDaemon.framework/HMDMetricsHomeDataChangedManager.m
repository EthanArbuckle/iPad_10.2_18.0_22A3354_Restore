@implementation HMDMetricsHomeDataChangedManager

- (HMDMetricsHomeDataChangedManager)initWithCountersManager:(id)a3 currentHomeDataSource:(id)a4 dateProvider:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  HMDMetricsHomeDataChangedManager *v14;

  v8 = (void *)MEMORY[0x24BDD16D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(-32768, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDMetricsHomeDataChangedManager initWithCountersManager:currentHomeDataSource:dateProvider:notificationCenter:maxNumberEventsToReport:workQueue:](self, "initWithCountersManager:currentHomeDataSource:dateProvider:notificationCenter:maxNumberEventsToReport:workQueue:", v11, v10, v9, v12, 50, v13);

  return v14;
}

- (HMDMetricsHomeDataChangedManager)initWithCountersManager:(id)a3 currentHomeDataSource:(id)a4 dateProvider:(id)a5 notificationCenter:(id)a6 maxNumberEventsToReport:(unint64_t)a7 workQueue:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HMDMetricsHomeDataChangedManager *v19;
  HMDMetricsHomeDataChangedManager *v20;
  objc_super v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HMDMetricsHomeDataChangedManager;
  v19 = -[HMDMetricsHomeDataChangedManager init](&v22, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_countersManager, v14);
    objc_storeWeak((id *)&v20->_currentHomeDataSource, v15);
    objc_storeWeak((id *)&v20->_notificationCenter, v17);
    objc_storeWeak((id *)&v20->_dateProvider, v16);
    v20->_maxNumberEventsToReport = a7;
    objc_storeStrong((id *)&v20->_workQueue, a8);
  }

  return v20;
}

- (void)start
{
  void *v3;
  HMDMetricsHomeDataChangedManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
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
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v4, sel__handleGeneratedHomeDataChangedNotification_, CFSTR("HMDGeneratedHomeDataChangedNotification"), 0);

    self->_started = 1;
  }
}

- (void)stop
{
  void *v3;
  HMDMetricsHomeDataChangedManager *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
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
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", v4, CFSTR("HMDGeneratedHomeDataChangedNotification"), 0);

    self->_started = 0;
  }
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HMDMetricsHomeDataChangedManager *v26;
  NSObject *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *context;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMetricsHomeDataChangedManager currentHomeDataSource](self, "currentHomeDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeUUIDForCurrentResidentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "hmf_isEqualToUUID:", v9);

  if (v10)
  {
    +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", CFSTR("HMDHomeDataChangedReasonsInsertedEventGroup"), v6, v7);
    v11 = objc_claimAutoreleasedReturnValue();
    +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", CFSTR("HMDHomeDataChangedReasonsUpdatedEventGroup"), v6, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", CFSTR("HMDHomeDataChangedReasonsBecamePrimaryEventGroup"), v6, v7);
    v13 = objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x227676638]();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMetricsHomeDataChangedManager countersManager](self, "countersManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v11;
    objc_msgSend(v15, "objectForKeyedSubscript:", v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "eventCounters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke;
    v44[3] = &unk_24E77ADF8;
    v18 = v6;
    v45 = v18;
    v19 = v14;
    v46 = v19;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v44);

    objc_msgSend(v15, "objectForKeyedSubscript:", v12);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "eventCounters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v17;
    v41[1] = 3221225472;
    v41[2] = __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke_2;
    v41[3] = &unk_24E78F028;
    v41[4] = self;
    v21 = v18;
    v42 = v21;
    v22 = v19;
    v43 = v22;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v41);

    objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_19554);
    v37 = v15;
    v40 = (void *)v13;
    objc_msgSend(v15, "objectForKeyedSubscript:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HMDHouseholdHomeDataChangedLogEvent initAsBecamePrimaryEventWithCount:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsBecamePrimaryEventWithCount:homeUUID:", objc_msgSend(v23, "fetchEventCounterForEventName:", CFSTR("becamePrimary")), v21);
    v25 = (void *)MEMORY[0x227676638](objc_msgSend(v22, "insertObject:atIndex:", v24, 0));
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v34 = v7;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v28;
      v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_DEBUG, "%{public}@PopulatedLogEvents before truncating: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    v29 = -[HMDMetricsHomeDataChangedManager maxNumberEventsToReport](v26, "maxNumberEventsToReport");
    v30 = objc_msgSend(v22, "count");
    if (v29 >= v30)
      v31 = v30;
    else
      v31 = v29;
    objc_msgSend(v22, "subarrayWithRange:", 0, v31, v34);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(context);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = CFSTR("HMDHomeDataChangedReasonsInsertedEventGroup");
  v14[1] = CFSTR("HMDHomeDataChangedReasonsUpdatedEventGroup");
  v14[2] = CFSTR("HMDHomeDataChangedReasonsBecamePrimaryEventGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMetricsHomeDataChangedManager countersManager](self, "countersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__HMDMetricsHomeDataChangedManager_deleteCountersAfterDate___block_invoke;
  v11[3] = &unk_24E779F80;
  v12 = v4;
  v13 = v7;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "removeCounterGroupsBasedOnPredicate:", v11);

}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = CFSTR("HMDHomeDataChangedReasonsInsertedEventGroup");
  v14[1] = CFSTR("HMDHomeDataChangedReasonsUpdatedEventGroup");
  v14[2] = CFSTR("HMDHomeDataChangedReasonsBecamePrimaryEventGroup");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMetricsHomeDataChangedManager countersManager](self, "countersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__HMDMetricsHomeDataChangedManager_deleteCountersBeforeDate___block_invoke;
  v11[3] = &unk_24E779F80;
  v12 = v4;
  v13 = v7;
  v9 = v7;
  v10 = v4;
  objc_msgSend(v8, "removeCounterGroupsBasedOnPredicate:", v11);

}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  HMDMetricsHomeDataChangedManager *v21;
  NSObject *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __77__HMDMetricsHomeDataChangedManager_coalescedLogEventsFromLogEvents_homeUUID___block_invoke;
  v30[3] = &unk_24E777F70;
  v30[4] = self;
  v11 = v8;
  v31 = v11;
  v12 = v7;
  v32 = v12;
  v13 = v9;
  v33 = v13;
  v14 = v10;
  v34 = v14;
  v29 = v6;
  objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v30);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  objc_msgSend(v13, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v17);

  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_26_19547);
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("becamePrimary"));
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v18 = objc_msgSend(v15, "insertObject:atIndex:", v18, 0);
  v20 = (void *)MEMORY[0x227676638](v18);
  v21 = self;
  HMFGetOSLogHandle();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v23;
    v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_DEBUG, "%{public}@CoalescedLogEvents before truncating: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v20);
  v24 = -[HMDMetricsHomeDataChangedManager maxNumberEventsToReport](v21, "maxNumberEventsToReport");
  v25 = objc_msgSend(v15, "count");
  if (v24 >= v25)
    v26 = v25;
  else
    v26 = v24;
  objc_msgSend(v15, "subarrayWithRange:", 0, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)logEventsFromDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  HMDMetricsHomeDataChangedManager *v15;
  id v16;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("HMDMetricsHomeDataChangedLogEvents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __60__HMDMetricsHomeDataChangedManager_logEventsFromDictionary___block_invoke;
    v14 = &unk_24E79B878;
    v15 = self;
    v16 = v7;
    v8 = v7;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", &v11);
    v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14, v15);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)serializeLogEvents:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__HMDMetricsHomeDataChangedManager_serializeLogEvents___block_invoke;
  v11[3] = &unk_24E777FB8;
  v11[4] = self;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  if (objc_msgSend(v7, "count"))
  {
    v13 = CFSTR("HMDMetricsHomeDataChangedLogEvents");
    v8 = (void *)objc_msgSend(v7, "copy");
    v14[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_handleGeneratedHomeDataChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMetricsHomeDataChangedManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__HMDMetricsHomeDataChangedManager__handleGeneratedHomeDataChangedNotification___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_handleChangeSetSummary:(id)a3 homeUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v6 = a4;
  v7 = a3;
  -[HMDMetricsHomeDataChangedManager dateProvider](self, "dateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startOfCurrentDay");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", CFSTR("HMDHomeDataChangedReasonsInsertedEventGroup"), v6, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", CFSTR("HMDHomeDataChangedReasonsUpdatedEventGroup"), v6, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMetricsHomeDataChangedManager countersManager](self, "countersManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertedObjectNames");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke;
  v22[3] = &unk_24E793640;
  v23 = v12;
  v15 = v12;
  objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v22);

  objc_msgSend(v11, "objectForKeyedSubscript:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modifiedObjectPropertyNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke_2;
  v20[3] = &unk_24E793640;
  v21 = v16;
  v18 = v16;
  objc_msgSend(v17, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v20);

}

- (void)_handleHDCDueToBecamePrimaryForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMDMetricsHomeDataChangedManager dateProvider](self, "dateProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfCurrentDay");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:homeUUID:date:](HMDHouseholdDataEventCounterGroupSpecifier, "specifierWithGroupName:homeUUID:date:", CFSTR("HMDHomeDataChangedReasonsBecamePrimaryEventGroup"), v4, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDMetricsHomeDataChangedManager countersManager](self, "countersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "incrementEventCounterForEventName:", CFSTR("becamePrimary"));
}

- (void)_handleHomeDataChangedReasonInsertedLogEvent:(id)a3 insertedHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v12, "modelName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, "incrementCountWithValue:", objc_msgSend(v12, "count"));
  }
  else
  {
    v11 = -[HMDHouseholdHomeDataChangedLogEvent initAsInsertEventForModelName:count:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsInsertEventForModelName:count:homeUUID:", v9, objc_msgSend(v12, "count"), v8);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v9);
  }

}

- (void)_handleHomeDataChangedReasonUpdatedLogEvent:(id)a3 updatedHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v14, "modelName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "propertyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "incrementCountWithValue:", objc_msgSend(v14, "count"));
  }
  else
  {
    v13 = -[HMDHouseholdHomeDataChangedLogEvent initAsUpdateEventForModelName:propertyName:count:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsUpdateEventForModelName:propertyName:count:homeUUID:", v9, v10, objc_msgSend(v14, "count"), v8);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v11);
  }

}

- (void)_handleHomeDataChangedReasonBecamePrimaryLogEvent:(id)a3 becamePrimaryHouseholdLogEventsByName:(id)a4 homeUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("becamePrimary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, "incrementCountWithValue:", objc_msgSend(v11, "count"));
  }
  else
  {
    v10 = -[HMDHouseholdHomeDataChangedLogEvent initAsBecamePrimaryEventWithCount:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsBecamePrimaryEventWithCount:homeUUID:", objc_msgSend(v11, "count"), v8);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("becamePrimary"));
  }

}

- (BOOL)_shouldExcludeUpdateForModelName:(id)a3 propertyName:(id)a4
{
  uint64_t v4;
  id v5;
  char v6;

  v4 = _shouldExcludeUpdateForModelName_propertyName__onceToken;
  v5 = a4;
  if (v4 != -1)
    dispatch_once(&_shouldExcludeUpdateForModelName_propertyName__onceToken, &__block_literal_global_36);
  v6 = objc_msgSend((id)_shouldExcludeUpdateForModelName_propertyName__propertyNamesToExclude, "containsObject:", v5);

  return v6;
}

- (HMDEventCountersManager)countersManager
{
  return (HMDEventCountersManager *)objc_loadWeakRetained((id *)&self->_countersManager);
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

- (unint64_t)maxNumberEventsToReport
{
  return self->_maxNumberEventsToReport;
}

- (BOOL)started
{
  return self->_started;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_destroyWeak((id *)&self->_currentHomeDataSource);
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_countersManager);
}

void __82__HMDMetricsHomeDataChangedManager__shouldExcludeUpdateForModelName_propertyName___block_invoke()
{
  void *v0;

  v0 = (void *)_shouldExcludeUpdateForModelName_propertyName__propertyNamesToExclude;
  _shouldExcludeUpdateForModelName_propertyName__propertyNamesToExclude = (uint64_t)&unk_24E970C10;

}

uint64_t __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "incrementEventCounterForEventName:", a2);
}

uint64_t __69__HMDMetricsHomeDataChangedManager__handleChangeSetSummary_homeUUID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "incrementEventCounterForEventName:", a2);
}

void __80__HMDMetricsHomeDataChangedManager__handleGeneratedHomeDataChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Handling HMDGeneratedHomeDataChangedNotification with userInfo: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HMDGeneratedHomeDataChangedSummaryNotificationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 40), "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HMDGeneratedHomeDataChangedHomeUUIDNotificationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  v15 = *(void **)(a1 + 32);
  if (v10)
    objc_msgSend(v15, "_handleChangeSetSummary:homeUUID:", v10, v14);
  else
    objc_msgSend(v15, "_handleHDCDueToBecamePrimaryForHome:", v14);

}

void __55__HMDMetricsHomeDataChangedManager_serializeLogEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(v5, "serializedLogEvent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Skipping unexpected log event during encoding: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }

}

void __60__HMDMetricsHomeDataChangedManager_logEventsFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HMDHouseholdHomeDataChangedLogEvent *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[HMDHouseholdHomeDataChangedLogEvent initWithDictionary:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initWithDictionary:", v3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode log event: %@", (uint8_t *)&v9, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __77__HMDMetricsHomeDataChangedManager_coalescedLogEventsFromLogEvents_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    v6 = objc_msgSend(v5, "changeType");
    if (v6)
    {
      if (v6 == 2)
      {
        objc_msgSend(*(id *)(a1 + 32), "_handleHomeDataChangedReasonUpdatedLogEvent:updatedHouseholdLogEventsByName:homeUUID:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
      }
      else if (v6 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "_handleHomeDataChangedReasonInsertedLogEvent:insertedHouseholdLogEventsByName:homeUUID:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleHomeDataChangedReasonBecamePrimaryLogEvent:becamePrimaryHouseholdLogEventsByName:homeUUID:", v5, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Skipping unexpected log event during coalescing: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

uint64_t __77__HMDMetricsHomeDataChangedManager_coalescedLogEventsFromLogEvents_homeUUID___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 <= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 < objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __61__HMDMetricsHomeDataChangedManager_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
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
      v8 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __60__HMDMetricsHomeDataChangedManager_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
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
      v8 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v6);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMDHouseholdHomeDataChangedLogEvent *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = a2;
  v7 = [HMDHouseholdHomeDataChangedLogEvent alloc];
  v8 = objc_msgSend(v5, "unsignedIntegerValue");

  v9 = -[HMDHouseholdHomeDataChangedLogEvent initAsInsertEventForModelName:count:homeUUID:](v7, "initAsInsertEventForModelName:count:homeUUID:", v6, v8, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

}

void __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("_"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldExcludeUpdateForModelName:propertyName:", v8, v9))
    {
      v10 = (void *)MEMORY[0x227676638]();
      v11 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v13;
        v21 = 2112;
        v22 = v8;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Excluding update for modelName: %@ propertyName: %@ from HMDHomeDataChangedLogEvent", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
    }
    else
    {
      v18 = -[HMDHouseholdHomeDataChangedLogEvent initAsUpdateEventForModelName:propertyName:count:homeUUID:]([HMDHouseholdHomeDataChangedLogEvent alloc], "initAsUpdateEventForModelName:propertyName:count:homeUUID:", v8, v9, objc_msgSend(v6, "unsignedIntegerValue"), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v18);

    }
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Expected 2 event name components from eventName: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

uint64_t __89__HMDMetricsHomeDataChangedManager_logEventsPopulatedForHomeWithUUID_associatedWithDate___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 <= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 < objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_19569 != -1)
    dispatch_once(&logCategory__hmf_once_t19_19569, &__block_literal_global_39_19570);
  return (id)logCategory__hmf_once_v20_19571;
}

void __47__HMDMetricsHomeDataChangedManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_19571;
  logCategory__hmf_once_v20_19571 = v0;

}

@end
