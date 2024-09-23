@implementation HMDMediaGroupsAggregateConsumer

- (HMDMediaGroupsAggregateConsumer)initWithIdentifier:(id)a3 subscriptionProvider:(id)a4 notificationCenter:(id)a5 stageManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDMediaGroupsAggregateConsumer *v16;
  uint64_t v17;
  OS_os_log *logger;
  HMDMediaGroupsAggregateConsumer *result;
  HMDMediaGroupsAggregateConsumer *v20;
  SEL v21;
  id v22;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v20 = (HMDMediaGroupsAggregateConsumer *)_HMFPreconditionFailure();
    -[HMDMediaGroupsAggregateConsumer commitAggregationData:](v20, v21, v22);
    return result;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDMediaGroupsAggregateConsumer;
  v16 = -[HMDMediaGroupsAggregateConsumer init](&v23, sel_init);
  if (v16)
  {
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    logger = v16->_logger;
    v16->_logger = (OS_os_log *)v17;

    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v16->_subscriptionProvider, a4);
    objc_storeStrong((id *)&v16->_notificationCenter, a5);
    objc_storeStrong((id *)&v16->_stageManager, a6);
  }

  return v16;
}

- (void)commitAggregationData:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregateConsumer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Committing aggregation data %@ for consumer", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsAggregateConsumer stageManager](v6, "stageManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitAggregateData:", v4);

  -[HMDMediaGroupsAggregateConsumer _trackMediaSystemMetricsInAggregateData:](v6, "_trackMediaSystemMetricsInAggregateData:", v4);
  -[HMDMediaGroupsAggregateConsumer _trackHomeTheaterMetricsInAggregateData:](v6, "_trackHomeTheaterMetricsInAggregateData:", v4);

}

- (void)_trackMediaSystemMetricsInAggregateData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregateConsumer *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDMediaGroupsAggregateConsumer *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer mediaSystemSetupMetricDispatcher](self, "mediaSystemSetupMetricDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "activeGroupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x227676638]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v11;
        _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Check committed media system in aggregate data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      objc_msgSend(v6, "activeGroupIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "groups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __75__HMDMediaGroupsAggregateConsumer__trackMediaSystemMetricsInAggregateData___block_invoke;
      v22[3] = &unk_24E7885B0;
      v14 = v12;
      v23 = v14;
      objc_msgSend(v13, "na_firstObjectPassingTest:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v6, "activeMetricType");
      if (v15 && v16 == 1)
      {
        v17 = 1;
      }
      else
      {
        if (v15 || v16 != 2)
          goto LABEL_15;
        v17 = 2;
      }
      objc_msgSend(v6, "markRequestCommittedForGroupIdentifier:metricType:error:", v14, v17, 0);
LABEL_15:

      goto LABEL_16;
    }
  }
  v18 = (void *)MEMORY[0x227676638]();
  v19 = self;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v25 = v21;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@No media system setup metric has been tracked", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v18);
LABEL_16:

}

- (void)_trackHomeTheaterMetricsInAggregateData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMDMediaGroupsAggregateConsumer *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMDMediaGroupsAggregateConsumer *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  HMDMediaGroupsAggregateConsumer *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, void *);
  void *v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer homeTheaterSetupMetricDispatcher](self, "homeTheaterSetupMetricDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "activeGroupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "activeGroupIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x227676638]();
      v10 = self;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v12;
        v40 = 2112;
        v41 = v8;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Check committed home theater UUID: %@ in aggregate data", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v4, "destinationControllersData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = MEMORY[0x24BDAC760];
      v34 = 3221225472;
      v35 = __75__HMDMediaGroupsAggregateConsumer__trackHomeTheaterMetricsInAggregateData___block_invoke;
      v36 = &unk_24E788588;
      v14 = v8;
      v37 = v14;
      objc_msgSend(v13, "na_firstObjectPassingTest:", &v33);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_18;
      v16 = objc_msgSend(v6, "activeMetricType");
      v17 = (void *)MEMORY[0x227676638]();
      v18 = v10;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v16);
        v32 = v17;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v20;
        v40 = 2112;
        v41 = v21;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Attempting to mark request committed for metric type: %@", buf, 0x16u);

        v17 = v32;
      }

      objc_autoreleasePoolPop(v17);
      if (v16 == 4)
      {
        objc_msgSend(v15, "destinationIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
LABEL_18:

          goto LABEL_19;
        }
        objc_msgSend(v15, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v6;
        v25 = v23;
        v26 = 4;
      }
      else
      {
        if (v16 != 3)
          goto LABEL_18;
        objc_msgSend(v15, "destinationIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
          goto LABEL_18;
        objc_msgSend(v15, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v6;
        v25 = v23;
        v26 = 3;
      }
      objc_msgSend(v24, "markRequestCommittedForGroupIdentifier:metricType:error:", v25, v26, 0, v32, v33, v34, v35, v36);

      goto LABEL_18;
    }
  }
  v27 = (void *)MEMORY[0x227676638]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v39 = v30;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@No home theater setup metric has been tracked", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v27);
LABEL_19:

}

- (HMDMediaGroupsAggregateData)aggregationData
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregateConsumer stageManager](self, "stageManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aggregateData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDMediaGroupsAggregateData *)v3;
}

- (void)configureWithHome:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregateConsumer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Configuring media groups aggregate consumer", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsAggregateConsumer stageManager](v6, "stageManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configure");

  -[HMDMediaGroupsAggregateConsumer startSubscriptionForHome:](v6, "startSubscriptionForHome:", v4);
  objc_msgSend(v4, "mediaSystemSetupMetricDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateConsumer setMediaSystemSetupMetricDispatcher:](v6, "setMediaSystemSetupMetricDispatcher:", v10);

  objc_msgSend(v4, "homeTheaterSetupMetricDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregateConsumer setHomeTheaterSetupMetricDispatcher:](v6, "setHomeTheaterSetupMetricDispatcher:", v11);

}

- (void)unconfigure
{
  void *v3;
  HMDMediaGroupsAggregateConsumer *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Unconfiguring media groups aggregate consumer", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaGroupsAggregateConsumer stopSubscription](v4, "stopSubscription");
}

- (void)stopSubscription
{
  void *v3;
  _QWORD v4[5];

  -[HMDMediaGroupsAggregateConsumer subscriptionProvider](self, "subscriptionProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__HMDMediaGroupsAggregateConsumer_stopSubscription__block_invoke;
  v4[3] = &unk_24E79BD80;
  v4[4] = self;
  objc_msgSend(v3, "unregisterConsumer:completion:", self, v4);

}

- (void)startSubscriptionForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregateConsumer *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "mediaGroupsAggregateDataTopicName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Subscribing to aggregated media group data with topic: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDMediaGroupsAggregateConsumer subscriptionProvider](v7, "subscriptionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke;
  v12[3] = &unk_24E79A980;
  v12[4] = v7;
  objc_msgSend(v10, "registerConsumer:topicFilters:completion:", v7, v11, v12);

}

- (void)stageNullDestinationForCurrentDestinationControllerIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer stageManager](self, "stageManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stageNullDestinationForCurrentDestinationControllerIdentifier:", v4);

}

- (void)unstageNullDestinationForCurrentDestinationController
{
  id v2;

  -[HMDMediaGroupsAggregateConsumer stageManager](self, "stageManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unstageNullDestinationForCurrentDestinationController");

}

- (void)notifyOfUpdatedAggregateData
{
  void *v3;
  HMDMediaGroupsAggregateConsumer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregateConsumer *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Notifying of updated aggregate data", (uint8_t *)&v14, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDMediaGroupsAggregateConsumer delegate](v4, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "didUpdateAggregateDataForMediaGroupsAggregateConsumer:", v4);
    -[HMDMediaGroupsAggregateConsumer notificationCenter](v4, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("HMDMediaGroupsAggregateConsumerUpdatedAggregateDataNotification"), v4);

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v4;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of update aggregate data due to no delegate", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  HMDMediaGroupsAggregateData *v8;
  void *v9;
  HMDMediaGroupsAggregateData *v10;
  void *v11;
  HMDMediaGroupsAggregateConsumer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaGroupsAggregateConsumer *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (-[HMDMediaGroupsAggregateConsumer isAggregateTopic:](self, "isAggregateTopic:", v7))
  {
    v8 = [HMDMediaGroupsAggregateData alloc];
    objc_msgSend(v6, "encodedData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDMediaGroupsAggregateData initWithProtoBufferData:](v8, "initWithProtoBufferData:", v9);

    if (v10)
    {
      -[HMDMediaGroupsAggregateConsumer commitAggregationData:](self, "commitAggregationData:", v10);
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v18;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Error deserializing event encoded aggregation data for topic: %@", (uint8_t *)&v19, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
    }

  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to handle received event due to unexpected topic: %@", (uint8_t *)&v19, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (BOOL)isAggregateTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  HMDMediaGroupsAggregateConsumer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  HMDMediaGroupsAggregateConsumer *v16;
  NSObject *v17;
  void *v18;
  HMDMediaGroupsAggregateConsumer *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "asHomeEventTopic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "homeEventTopicSuffixID");
      if (v9 == *MEMORY[0x24BDD5D40])
      {
        v10 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v15 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v8, "homeEventTopicSuffixID"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v18;
        v24 = 2112;
        v25 = v20;
        v26 = 2112;
        v27 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Received unexpected topic id: %@ topic: %@", (uint8_t *)&v22, 0x20u);

        goto LABEL_12;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v18;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert to parsed home topic using topic: %@", (uint8_t *)&v22, 0x16u);
LABEL_12:

      }
    }

    objc_autoreleasePoolPop(v15);
    v10 = 0;
    goto LABEL_14;
  }
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543618;
    v23 = v14;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", (uint8_t *)&v22, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  v10 = 0;
LABEL_15:

  return v10;
}

- (id)destinationControllerDataWithParentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer aggregationData](self, "aggregationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationControllersData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__HMDMediaGroupsAggregateConsumer_destinationControllerDataWithParentIdentifier___block_invoke;
  v10[3] = &unk_24E788588;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)destinationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer aggregationData](self, "aggregationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__HMDMediaGroupsAggregateConsumer_destinationWithIdentifier___block_invoke;
  v10[3] = &unk_24E79A660;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)destinationWithParentIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer aggregationData](self, "aggregationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__HMDMediaGroupsAggregateConsumer_destinationWithParentIdentifier___block_invoke;
  v10[3] = &unk_24E79A660;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)groups
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregateConsumer aggregationData](self, "aggregationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)groupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HMDMediaGroupsAggregateConsumer aggregationData](self, "aggregationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__HMDMediaGroupsAggregateConsumer_groupWithIdentifier___block_invoke;
  v10[3] = &unk_24E7885B0;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allMediaSystemData
{
  void *v2;
  void *v3;
  void *v4;

  -[HMDMediaGroupsAggregateConsumer aggregationData](self, "aggregationData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_52851);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)mediaSystemDataWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMDMediaGroupsAggregateConsumer groupWithIdentifier:](self, "groupWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregateConsumer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsAggregateConsumerDelegate)delegate
{
  return (HMDMediaGroupsAggregateConsumerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 32, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaGroupsStageManager)stageManager
{
  return (HMDMediaGroupsStageManager *)objc_getProperty(self, a2, 48, 1);
}

- (HMDMediaGroupSetupMetricDispatcher)mediaSystemSetupMetricDispatcher
{
  return (HMDMediaGroupSetupMetricDispatcher *)objc_loadWeakRetained((id *)&self->_mediaSystemSetupMetricDispatcher);
}

- (void)setMediaSystemSetupMetricDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_mediaSystemSetupMetricDispatcher, a3);
}

- (HMDMediaGroupSetupMetricDispatcher)homeTheaterSetupMetricDispatcher
{
  return (HMDMediaGroupSetupMetricDispatcher *)objc_loadWeakRetained((id *)&self->_homeTheaterSetupMetricDispatcher);
}

- (void)setHomeTheaterSetupMetricDispatcher:(id)a3
{
  objc_storeWeak((id *)&self->_homeTheaterSetupMetricDispatcher, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeTheaterSetupMetricDispatcher);
  objc_destroyWeak((id *)&self->_mediaSystemSetupMetricDispatcher);
  objc_storeStrong((id *)&self->_stageManager, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

id __53__HMDMediaGroupsAggregateConsumer_allMediaSystemData__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __55__HMDMediaGroupsAggregateConsumer_groupWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __67__HMDMediaGroupsAggregateConsumer_destinationWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "parentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __61__HMDMediaGroupsAggregateConsumer_destinationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __81__HMDMediaGroupsAggregateConsumer_destinationControllerDataWithParentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "parentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Register consumer completed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke_14;
  v13[3] = &unk_24E796918;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "na_each:", v13);

}

void __60__HMDMediaGroupsAggregateConsumer_startSubscriptionForHome___block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveEvent:topic:", v5, v4);

}

void __51__HMDMediaGroupsAggregateConsumer_stopSubscription__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unregister consumer completed with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }

}

uint64_t __75__HMDMediaGroupsAggregateConsumer__trackHomeTheaterMetricsInAggregateData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

uint64_t __75__HMDMediaGroupsAggregateConsumer__trackMediaSystemMetricsInAggregateData___block_invoke(uint64_t a1, void *a2)
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
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "hmf_isEqualToUUID:", v7);
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21 != -1)
    dispatch_once(&logCategory__hmf_once_t21, &__block_literal_global_22_52889);
  return (id)logCategory__hmf_once_v22;
}

void __46__HMDMediaGroupsAggregateConsumer_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22;
  logCategory__hmf_once_v22 = v0;

}

@end
