@implementation HMDHouseholdMetricsManager

- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 accessoryDetailsManager:(id)a5 metricsHomeDataChangedManager:(id)a6 dailyScheduler:(id)a7 logEventSubmitter:(id)a8 dateProvider:(id)a9 activityContributors:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMDHouseholdMetricsRequestContributor *v20;
  void *v21;
  HMDHouseholdActivityLogEventFactory *v22;
  void *v23;
  HMDHouseholdActivityLogEventFactory *v24;
  HMDSiriEndpointEnablementLogEventFactory *v25;
  HMDHouseholdNetworkStabilityLogEventFactory *v26;
  void *v27;
  HMDHouseholdNetworkStabilityLogEventFactory *v28;
  HMDHouseholdThreadNetworkStabilityLogEventFactory *v29;
  void *v30;
  HMDHouseholdThreadNetworkStabilityLogEventFactory *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDHouseholdMetricsManager *v37;
  void *v39;
  id v40;
  void *v41;
  HMDHouseholdMetricsRequestContributor *v42;
  id v43;
  id v44;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  _QWORD v50[7];

  v50[5] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v40 = a6;
  v17 = a9;
  v18 = a10;
  v44 = a8;
  v43 = a7;
  v19 = a5;
  v48 = v15;
  v46 = v17;
  v20 = -[HMDHouseholdMetricsRequestContributor initWithCountersManager:dateProvider:]([HMDHouseholdMetricsRequestContributor alloc], "initWithCountersManager:dateProvider:", v15, v17);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v20;
  objc_msgSend(v21, "addObject:", v20);
  v39 = (void *)MEMORY[0x24BDBCED8];
  v49[0] = CFSTR("householdData");
  v22 = [HMDHouseholdActivityLogEventFactory alloc];
  v41 = v21;
  v23 = (void *)objc_msgSend(v21, "copy");
  v24 = -[HMDHouseholdActivityLogEventFactory initWithContributors:](v22, "initWithContributors:", v23);
  v50[0] = v24;
  v49[1] = CFSTR("siriEndpointEnablement");
  v25 = -[HMDSiriEndpointEnablementLogEventFactory initWithDataSource:]([HMDSiriEndpointEnablementLogEventFactory alloc], "initWithDataSource:", v16);
  v50[1] = v25;
  v49[2] = CFSTR("networkStability");
  v26 = [HMDHouseholdNetworkStabilityLogEventFactory alloc];
  objc_msgSend(v16, "networkObserver");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[HMDHouseholdNetworkStabilityLogEventFactory initWithNetworkObserver:](v26, "initWithNetworkObserver:", v27);
  v50[2] = v28;
  v49[3] = CFSTR("threadNetworkStability");
  v29 = [HMDHouseholdThreadNetworkStabilityLogEventFactory alloc];
  v47 = v16;
  objc_msgSend(v16, "threadNetworkObserver");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HMDHouseholdThreadNetworkStabilityLogEventFactory initWithThreadNetworkObserver:](v29, "initWithThreadNetworkObserver:", v30);
  v50[3] = v31;
  v49[4] = CFSTR("accessoryCategoriesKey");
  objc_msgSend(v19, "householdMetricsLogEventFactory");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v50[4] = v32;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "dictionaryWithDictionary:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (isInternalBuild())
  {
    objc_msgSend(v40, "householdMetricsLogEventFactory");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v35, CFSTR("homeDataChangedKey"));

  }
  v36 = (void *)objc_msgSend(v34, "copy");
  v37 = -[HMDHouseholdMetricsManager initWithCountersManager:dataSource:dailyScheduler:logEventSubmitter:dateProvider:requestCountProvider:logEventFactories:](self, "initWithCountersManager:dataSource:dailyScheduler:logEventSubmitter:dateProvider:requestCountProvider:logEventFactories:", v48, v47, v43, v44, v46, v42, v36);

  return v37;
}

- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 dailyScheduler:(id)a5 logEventSubmitter:(id)a6 dateProvider:(id)a7 requestCountProvider:(id)a8 logEventFactories:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HMDHouseholdMetricsManager *v21;
  HMDHouseholdMetricsManager *v22;
  uint64_t v23;
  NSUUID *messageTargetUUID;
  HMDHouseholdMetricsMessagingProvider *v25;
  HMDHouseholdMetricsMessagingProvider *messagingProvider;
  id v27;
  const char *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  dispatch_queue_t v36;
  OS_dispatch_queue *workQueue;
  HMDHouseholdMetricsClient *v38;
  HMDHouseholdMetricsClient *client;
  HMDHouseholdMetricsServer *v40;
  HMDHouseholdMetricsServer *server;
  HMDHouseholdMetricsManager *v42;
  void *v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v46.receiver = self;
  v46.super_class = (Class)HMDHouseholdMetricsManager;
  v21 = -[HMDHouseholdMetricsManager init](&v46, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_dateProvider, a7);
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("810360B7-987E-4A25-BEC7-9CC06CDDA0F2"));
    messageTargetUUID = v22->_messageTargetUUID;
    v22->_messageTargetUUID = (NSUUID *)v23;

    v25 = -[HMDHouseholdMetricsMessagingProvider initWithReceiver:]([HMDHouseholdMetricsMessagingProvider alloc], "initWithReceiver:", v22);
    v44 = v16;
    messagingProvider = v22->_messagingProvider;
    v22->_messagingProvider = v25;

    HMDispatchQueueNameString();
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28 = (const char *)objc_msgSend(v27, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v29, QOS_CLASS_BACKGROUND, 0);
    v30 = v20;
    v31 = v19;
    v32 = v18;
    v33 = v17;
    v34 = v15;
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = dispatch_queue_create(v28, v35);
    workQueue = v22->_workQueue;
    v22->_workQueue = (OS_dispatch_queue *)v36;

    v15 = v34;
    v17 = v33;
    v18 = v32;
    v19 = v31;
    v20 = v30;

    v38 = -[HMDHouseholdMetricsClient initWithCountersManager:dateProvider:remoteMessageDispatcher:requestCountProvider:logEventFactories:]([HMDHouseholdMetricsClient alloc], "initWithCountersManager:dateProvider:remoteMessageDispatcher:requestCountProvider:logEventFactories:", v45, v18, v22->_messagingProvider, v19, v30);
    client = v22->_client;
    v22->_client = v38;

    v16 = v44;
    v40 = -[HMDHouseholdMetricsServer initWithDataSource:logEventSubmitter:householdMetricsProvider:remoteMessageDispatcher:logEventFactories:workQueue:]([HMDHouseholdMetricsServer alloc], "initWithDataSource:logEventSubmitter:householdMetricsProvider:remoteMessageDispatcher:logEventFactories:workQueue:", v15, v17, v22->_client, v22->_messagingProvider, v20, v22->_workQueue);
    server = v22->_server;
    v22->_server = v40;

    objc_msgSend(v44, "registerDailyTaskRunner:", v22);
    v42 = v22;
  }

  return v22;
}

- (void)runDailyTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDHouseholdMetricsManager dateProvider](self, "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayByAddingDayCount:", -1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDHouseholdMetricsManager server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runHouseholdMetricsDataCollectionAssociatedToDate:forceSubmit:", v6, 0);

  -[HMDHouseholdMetricsManager client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteExpiredCounters");

}

- (void)runHomeutilTask
{
  void *v3;
  void *v4;
  id v5;

  -[HMDHouseholdMetricsManager dateProvider](self, "dateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startOfDayByAddingDayCount:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HMDHouseholdMetricsManager server](self, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "runHouseholdMetricsDataCollectionAssociatedToDate:forceSubmit:", v5, 1);

}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMDHouseholdMetricsClient)client
{
  return self->_client;
}

- (HMDHouseholdMetricsServer)server
{
  return self->_server;
}

- (HMDHouseholdMetricsMessagingProvider)messagingProvider
{
  return self->_messagingProvider;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_messagingProvider, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_105479 != -1)
    dispatch_once(&logCategory__hmf_once_t0_105479, &__block_literal_global_105480);
  return (id)logCategory__hmf_once_v1_105481;
}

void __41__HMDHouseholdMetricsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_105481;
  logCategory__hmf_once_v1_105481 = v0;

}

@end
