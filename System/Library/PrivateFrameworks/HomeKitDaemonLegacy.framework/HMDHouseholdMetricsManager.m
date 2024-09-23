@implementation HMDHouseholdMetricsManager

- (HMDHouseholdMetricsManager)initWithCountersManager:(id)a3 dataSource:(id)a4 accessoryDetailsManager:(id)a5 dailyScheduler:(id)a6 logEventSubmitter:(id)a7 dateProvider:(id)a8 activityContributors:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  HMDHouseholdActivityLogEventFactory *v19;
  HMDHouseholdActivityLogEventFactory *v20;
  HMDSiriEndpointEnablementLogEventFactory *v21;
  HMDHouseholdNetworkStabilityLogEventFactory *v22;
  void *v23;
  HMDHouseholdNetworkStabilityLogEventFactory *v24;
  HMDHouseholdThreadNetworkStabilityLogEventFactory *v25;
  void *v26;
  HMDHouseholdThreadNetworkStabilityLogEventFactory *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HMDHouseholdMetricsManager *v32;
  void *v34;
  void *v35;
  HMDHouseholdMetricsRequestContributor *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[5];
  _QWORD v44[7];

  v44[5] = *MEMORY[0x1E0C80C00];
  v15 = a9;
  v38 = a8;
  v41 = a7;
  v40 = a6;
  v16 = a5;
  v17 = a4;
  v37 = a3;
  v36 = -[HMDHouseholdMetricsRequestContributor initWithCountersManager:dateProvider:]([HMDHouseholdMetricsRequestContributor alloc], "initWithCountersManager:dateProvider:", v37, v38);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v18;
  objc_msgSend(v18, "addObject:", v36);
  v34 = (void *)MEMORY[0x1E0C99E08];
  v43[0] = CFSTR("householdData");
  v19 = [HMDHouseholdActivityLogEventFactory alloc];
  v35 = (void *)objc_msgSend(v18, "copy");
  v20 = -[HMDHouseholdActivityLogEventFactory initWithContributors:](v19, "initWithContributors:", v35);
  v44[0] = v20;
  v43[1] = CFSTR("siriEndpointEnablement");
  v21 = -[HMDSiriEndpointEnablementLogEventFactory initWithDataSource:]([HMDSiriEndpointEnablementLogEventFactory alloc], "initWithDataSource:", v17);
  v44[1] = v21;
  v43[2] = CFSTR("networkStability");
  v22 = [HMDHouseholdNetworkStabilityLogEventFactory alloc];
  objc_msgSend(v17, "networkObserver");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMDHouseholdNetworkStabilityLogEventFactory initWithNetworkObserver:](v22, "initWithNetworkObserver:", v23);
  v44[2] = v24;
  v43[3] = CFSTR("threadNetworkStability");
  v25 = [HMDHouseholdThreadNetworkStabilityLogEventFactory alloc];
  objc_msgSend(v17, "threadNetworkObserver");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HMDHouseholdThreadNetworkStabilityLogEventFactory initWithThreadNetworkObserver:](v25, "initWithThreadNetworkObserver:", v26);
  v44[3] = v27;
  v43[4] = CFSTR("accessoryCategoriesKey");
  objc_msgSend(v16, "householdMetricsLogEventFactory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v44[4] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryWithDictionary:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)objc_msgSend(v30, "copy");
  v32 = -[HMDHouseholdMetricsManager initWithCountersManager:dataSource:dailyScheduler:logEventSubmitter:dateProvider:requestCountProvider:logEventFactories:](self, "initWithCountersManager:dataSource:dailyScheduler:logEventSubmitter:dateProvider:requestCountProvider:logEventFactories:", v37, v17, v40, v41, v38, v36, v31);

  return v32;
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
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("810360B7-987E-4A25-BEC7-9CC06CDDA0F2"));
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
  if (logCategory__hmf_once_t0_92806 != -1)
    dispatch_once(&logCategory__hmf_once_t0_92806, &__block_literal_global_92807);
  return (id)logCategory__hmf_once_v1_92808;
}

void __41__HMDHouseholdMetricsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_92808;
  logCategory__hmf_once_v1_92808 = v0;

}

@end
