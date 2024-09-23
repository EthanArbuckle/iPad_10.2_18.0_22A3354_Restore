@implementation HMAccessoryInfoDataProvider

- (HMAccessoryInfoDataProvider)initWithEventStoreReadHandle:(id)a3 subscriptionProvider:(id)a4
{
  id v7;
  id v8;
  HMAccessoryInfoDataProvider *v9;
  HMAccessoryInfoDataProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryInfoDataProvider;
  v9 = -[HMAccessoryInfoDataProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStoreReadHandle, a3);
    objc_storeStrong((id *)&v10->_eventSubscriptionProvider, a4);
  }

  return v10;
}

- (id)homeUUIDForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HMAccessoryInfoDataProvider dataSourceHomeWithHomeIdentifier:](self, "dataSourceHomeWithHomeIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessoryUUIDForIdentifier:(id)a3 homeIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[HMAccessoryInfoDataProvider dataSourceHomeWithHomeIdentifier:](self, "dataSourceHomeWithHomeIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "accessoryWithUniqueIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)subscribeToAccessoryInfoWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  HMAccessoryInfoDataProvider *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMAccessoryInfoDataProvider *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  HMAccessoryInfoDataProvider *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  HMAccessoryInfoDataProvider *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[5];
  id v40;
  void (**v41)(id, void *);
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    HMAccessoryInfoOptionAsString(a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v43 = v16;
    v44 = 2112;
    v45 = v10;
    v46 = 2112;
    v47 = v11;
    v48 = 2112;
    v49 = v17;
    _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory info with home identifier: %@ accessory identifier: %@ options: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v13);
  -[HMAccessoryInfoDataProvider homeUUIDForIdentifier:](v14, "homeUUIDForIdentifier:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[HMAccessoryInfoDataProvider accessoryUUIDForIdentifier:homeIdentifier:](v14, "accessoryUUIDForIdentifier:homeIdentifier:", v11, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1A1AC1AAC]();
    v21 = v14;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v19)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v38 = v11;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        HMAccessoryInfoOptionAsString(a5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v43 = v24;
        v44 = 2112;
        v45 = v18;
        v46 = 2112;
        v47 = v19;
        v48 = 2112;
        v49 = v25;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessory info with home uuid: %@ accessory uuid: %@ options: %@", buf, 0x2Au);

        v11 = v38;
      }

      objc_autoreleasePoolPop(v20);
      HMAccessoryInfoEventTopicsFromOption(a5, v18, v19);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v26, "hmf_isEmpty"))
      {
        v27 = (void *)MEMORY[0x1A1AC1AAC]();
        v28 = v21;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v30;
          _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Topics array is empty", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v31);

      }
      else
      {
        -[HMAccessoryInfoDataProvider notifyOfEventStoreLastEventsForTopics:](v21, "notifyOfEventStoreLastEventsForTopics:", v26);
        -[HMAccessoryInfoDataProvider eventSubscriptionProvider](v21, "eventSubscriptionProvider");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __131__HMAccessoryInfoDataProvider_subscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke;
        v39[3] = &unk_1E3AB0968;
        v39[4] = v21;
        v26 = v26;
        v40 = v26;
        v41 = v12;
        objc_msgSend(v37, "registerConsumer:topicFilters:completion:", v21, v26, v39);

      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v36;
        v44 = 2112;
        v45 = v11;
        _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to accessory info due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v26);
    }

  }
  else
  {
    v32 = (void *)MEMORY[0x1A1AC1AAC]();
    v33 = v14;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v35;
      v44 = 2112;
      v45 = v10;
      _os_log_impl(&dword_19B1B0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Failed to subscribe to accessory info due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v19);
  }

}

- (void)notifyOfCachedEvents:(id)a3
{
  _QWORD v3[5];

  if (a3)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__HMAccessoryInfoDataProvider_notifyOfCachedEvents___block_invoke;
    v3[3] = &unk_1E3AB1D60;
    v3[4] = self;
    objc_msgSend(a3, "na_each:", v3);
  }
}

- (void)notifyOfEventStoreLastEventsForTopics:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  -[HMAccessoryInfoDataProvider eventStoreReadHandle](self, "eventStoreReadHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v7, "count");

    if (v6)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __69__HMAccessoryInfoDataProvider_notifyOfEventStoreLastEventsForTopics___block_invoke;
      v8[3] = &unk_1E3AB0990;
      v8[4] = self;
      objc_msgSend(v7, "na_each:", v8);
    }
  }

}

- (void)notifyOfEventStoreLastEventForTopic:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HMAccessoryInfoDataProvider eventStoreReadHandle](self, "eventStoreReadHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastEventForTopic:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[HMAccessoryInfoDataProvider didReceiveEvent:topic:logMessage:](self, "didReceiveEvent:topic:logMessage:", v5, v6, CFSTR("last event store"));

}

- (void)unsubscribeToAccessoryInfoWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  void *v15;
  HMAccessoryInfoDataProvider *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  HMAccessoryInfoDataProvider *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  HMAccessoryInfoDataProvider *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[5];
  void (**v35)(id, void *);
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  -[HMAccessoryInfoDataProvider homeUUIDForIdentifier:](self, "homeUUIDForIdentifier:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[HMAccessoryInfoDataProvider accessoryUUIDForIdentifier:homeIdentifier:](self, "accessoryUUIDForIdentifier:homeIdentifier:", v11, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1A1AC1AAC]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v14)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v33 = v11;
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        HMAccessoryInfoOptionAsString(a5);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v37 = v19;
        v38 = 2112;
        v39 = v13;
        v40 = 2112;
        v41 = v14;
        v42 = 2112;
        v43 = v20;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing to accessory info with home uuid: %@ accessory uuid: %@ options: %@", buf, 0x2Au);

        v11 = v33;
      }

      objc_autoreleasePoolPop(v15);
      HMAccessoryInfoEventTopicsFromOption(a5, v13, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "hmf_isEmpty"))
      {
        v22 = (void *)MEMORY[0x1A1AC1AAC]();
        v23 = v16;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v37 = v25;
          _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Topics array is empty", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v22);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, v26);

      }
      else
      {
        -[HMAccessoryInfoDataProvider eventSubscriptionProvider](v16, "eventSubscriptionProvider");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __133__HMAccessoryInfoDataProvider_unsubscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke;
        v34[3] = &unk_1E3AB5380;
        v34[4] = v16;
        v35 = v12;
        objc_msgSend(v32, "unregisterConsumer:topicFilters:completion:", v16, v21, v34);

      }
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v31;
        v38 = 2112;
        v39 = v11;
        _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Failed to unsubscribe to accessory info due to unknown accessory identifier: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v21);
    }

  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = self;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v30;
      v38 = 2112;
      v39 = v10;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Failed to unsubscribe to accessory info due to unknown home identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v14);
  }

}

- (void)configureWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 accessoryInfoTypes:(unint64_t)a5 dataProviderDelegate:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMAccessoryInfoDataProvider *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = (void *)MEMORY[0x1A1AC1AAC]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    HMAccessoryInfoOptionAsString(a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544130;
    v22 = v19;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Configuring accessoryInfoDataProvider with home identifier: %@ accessory identifier: %@ options: %@", (uint8_t *)&v21, 0x2Au);

  }
  objc_autoreleasePoolPop(v16);
  -[HMAccessoryInfoDataProvider setDelegate:](v17, "setDelegate:", v14);
  -[HMAccessoryInfoDataProvider subscribeToAccessoryInfoWithHomeIdentifier:accessoryIdentifier:accessoryInfoTypes:completionHandler:](v17, "subscribeToAccessoryInfoWithHomeIdentifier:accessoryIdentifier:accessoryInfoTypes:completionHandler:", v12, v13, a5, v15);

}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  -[HMAccessoryInfoDataProvider didReceiveEvent:topic:logMessage:](self, "didReceiveEvent:topic:logMessage:", a3, a4, CFSTR("cache"));
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  -[HMAccessoryInfoDataProvider didReceiveEvent:topic:logMessage:](self, "didReceiveEvent:topic:logMessage:", a3, a4, 0);
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4 logMessage:(id)a5
{
  HMAccessoryInfoAccount *v8;
  HMAccessoryInfoAccount *v9;
  id v10;
  void *v11;
  HMAccessoryInfoDataProvider *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMAccessoryInfoWifiInfo *v18;
  void *v19;
  HMAccessoryInfoWifiInfo *v20;
  HMAccessoryInfoAccount *v21;
  void *v22;
  HMAccessoryInfoDataProvider *v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  id v34;
  id v35;
  void *v36;
  HMAccessoryInfoDataProvider *v37;
  NSObject *v38;
  void *v39;
  HMAccessoryInfoAccount *v40;
  void *v41;
  HMAccessoryInfoAccount *v42;
  void *v43;
  HMAccessoryInfoDataProvider *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  id v52;
  id v53;
  HMAccessoryInfoPrimaryUser *v54;
  void *v55;
  HMAccessoryInfoDataProvider *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  HMAccessoryInfoDataProvider *v62;
  void *v63;
  void *v64;
  void *v65;
  const char *v66;
  HMAccessoryInfoAccount *v67;
  void *v68;
  id v69;
  id v70;
  HMAccessoryInfoAccount *v71;
  HMAccessoryInfoAccount *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  HMAccessoryInfoAccount *v82;
  __int16 v83;
  HMAccessoryInfoAccount *v84;
  __int16 v85;
  id v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = (HMAccessoryInfoAccount *)a3;
  v9 = (HMAccessoryInfoAccount *)a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v80 = v14;
    v81 = 2112;
    v82 = v8;
    v83 = 2112;
    v84 = v9;
    v85 = 2112;
    v86 = v10;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received event: %@, topic: %@ %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  +[HMEventTopicHelper decodeTopic:](HMEventTopicHelper, "decodeTopic:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asAccessoryTopic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[HMAccessoryInfoDataProvider dataSource](v12, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "accessoryEventTopicSuffixID") == 504)
    {
      v18 = [HMAccessoryInfoWifiInfo alloc];
      -[HMAccessoryInfoAccount encodedData](v8, "encodedData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[HMAccessoryInfoWifiInfo initWithProtoData:](v18, "initWithProtoData:", v19);

      if (v20)
      {
        v71 = v8;
        -[HMAccessoryInfoWifiInfo hmfWifiNetworkInfo](v20, "hmfWifiNetworkInfo");
        v21 = (HMAccessoryInfoAccount *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x1A1AC1AAC]();
        v23 = v12;
        HMFGetOSLogHandle();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v68 = v17;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMAccessoryInfoDataProvider delegate](v23, "delegate");
          v26 = v10;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v80 = v25;
          v81 = 2112;
          v82 = v21;
          v83 = 2112;
          v84 = 0;
          v85 = 2112;
          v86 = v27;
          _os_log_impl(&dword_19B1B0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Modified setting:%@, error:%@, delegate:%@", buf, 0x2Au);

          v10 = v26;
          v17 = v68;
        }

        objc_autoreleasePoolPop(v22);
        if (v21)
        {
          v67 = v9;
          v69 = v10;
          objc_msgSend(v16, "homeUUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "accessoryUUID");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = v17;
          v31 = (void *)v29;
          v77 = 0;
          v78 = 0;
          v32 = v30;
          v33 = objc_msgSend(v30, "accessoryInfoDataProvider:transformHomeUUID:accessoryUUID:toClientHomeIdentifier:clientAccessoryIdentifier:", v23, v28, v29, &v78, &v77);
          v34 = v78;
          v35 = v77;

          if (v33)
            -[HMAccessoryInfoDataProvider notifyDelegateDidReceiveWifiNetworkInfoUpdatesForAccessoryWithIdentifier:wifiNetworkInfo:](v23, "notifyDelegateDidReceiveWifiNetworkInfoUpdatesForAccessoryWithIdentifier:wifiNetworkInfo:", v35, v21);
          v17 = v32;
          v9 = v67;
          v10 = v69;
        }
        else
        {
          v34 = 0;
          v35 = 0;
        }

        v8 = v71;
        goto LABEL_41;
      }
      v43 = (void *)MEMORY[0x1A1AC1AAC]();
      v62 = v12;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v80 = v63;
        _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Received event cannot be decoded to wifi network info object", buf, 0xCu);

      }
      goto LABEL_40;
    }
    if (objc_msgSend(v16, "accessoryEventTopicSuffixID") == 510)
    {
      v70 = v10;
      v40 = [HMAccessoryInfoAccount alloc];
      v72 = v8;
      -[HMAccessoryInfoAccount encodedData](v8, "encodedData");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[HMAccessoryInfoAccount initWithProtoData:](v40, "initWithProtoData:", v41);

      v43 = (void *)MEMORY[0x1A1AC1AAC]();
      v44 = v12;
      HMFGetOSLogHandle();
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = v45;
      if (v42)
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v47;
          v81 = 2112;
          v82 = v42;
          _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_INFO, "%{public}@Received event for account info: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        objc_msgSend(v16, "homeUUID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "accessoryUUID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = 0;
        v76 = 0;
        v50 = v17;
        v51 = objc_msgSend(v17, "accessoryInfoDataProvider:transformHomeUUID:accessoryUUID:toClientHomeIdentifier:clientAccessoryIdentifier:", v44, v48, v49, &v76, &v75);
        v52 = v76;
        v53 = v75;

        if (v51)
          -[HMAccessoryInfoDataProvider notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:accountInfo:](v44, "notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:accountInfo:", v53, v42);
LABEL_27:

        v10 = v70;
        v8 = v72;
        v17 = v50;
LABEL_41:

        goto LABEL_42;
      }
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v65;
      v66 = "%{public}@Received event cannot be decoded to accountInfo object";
    }
    else
    {
      if (objc_msgSend(v16, "accessoryEventTopicSuffixID") != 503)
      {
        v43 = (void *)MEMORY[0x1A1AC1AAC]();
        v12 = v12;
        HMFGetOSLogHandle();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v64;
          v81 = 2112;
          v82 = v9;
          _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Received event with unknown topic: %@", buf, 0x16u);

        }
        goto LABEL_40;
      }
      v70 = v10;
      v54 = [HMAccessoryInfoPrimaryUser alloc];
      v72 = v8;
      -[HMAccessoryInfoAccount encodedData](v8, "encodedData");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[HMAccessoryInfoPrimaryUser initWithProtoData:](v54, "initWithProtoData:", v55);

      v43 = (void *)MEMORY[0x1A1AC1AAC]();
      v56 = v12;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      v46 = v57;
      if (v42)
      {
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v80 = v58;
          v81 = 2112;
          v82 = v42;
          _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_INFO, "%{public}@Received event for primaryUserInfo: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v43);
        objc_msgSend(v16, "homeUUID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "accessoryUUID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0;
        v74 = 0;
        v50 = v17;
        v61 = objc_msgSend(v17, "accessoryInfoDataProvider:transformHomeUUID:accessoryUUID:toClientHomeIdentifier:clientAccessoryIdentifier:", v56, v59, v60, &v74, &v73);
        v52 = v74;
        v53 = v73;

        if (v61)
          -[HMAccessoryInfoDataProvider notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:primaryUserInfo:](v56, "notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:primaryUserInfo:", v53, v42);
        goto LABEL_27;
      }
      if (!os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
LABEL_39:
        v10 = v70;
        v8 = v72;
LABEL_40:

        objc_autoreleasePoolPop(v43);
        goto LABEL_41;
      }
      HMFGetLogIdentifier();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v80 = v65;
      v66 = "%{public}@Received event cannot be decoded to primaryUserInfo object";
    }
    _os_log_impl(&dword_19B1B0000, v46, OS_LOG_TYPE_ERROR, v66, buf, 0xCu);

    goto LABEL_39;
  }
  v36 = (void *)MEMORY[0x1A1AC1AAC]();
  v37 = v12;
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v80 = v39;
    v81 = 2112;
    v82 = v9;
    _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse topic: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v36);
LABEL_42:

}

- (void)notifyDelegateDidReceiveWifiNetworkInfoUpdatesForAccessoryWithIdentifier:(id)a3 wifiNetworkInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMAccessoryInfoDataProvider *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessoryInfoDataProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "SSID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544386;
    v15 = v12;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v13;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Notifying client of did receive wifi network info updates for accessory with identifier: %@ wifi: %@ WiFi SSID: %@ delegate: %@", (uint8_t *)&v14, 0x34u);

  }
  objc_autoreleasePoolPop(v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "accessoryInfoDataProvider:didReceiveUpdatesForAccessoryWithIdentifier:wifiNetworkInfo:", v10, v6, v7);

}

- (void)notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:(id)a3 accountInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMAccessoryInfoDataProvider *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessoryInfoDataProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v12;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive account info updates for accessory with identifier: %@ accountInfo: %@ delegate: %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "accessoryInfoDataProvider:didReceiveUpdatesForAccessoryWithIdentifier:accountInfo:", v10, v6, v7);

}

- (void)notifyDelegateDidReceiveAccountInfoUpdatesForAccessoryWithIdentifier:(id)a3 primaryUserInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMAccessoryInfoDataProvider *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessoryInfoDataProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v12;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did receive primaryUserInfo updates for accessory with identifier: %@ primaryUser: %@ delegate: %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "accessoryInfoDataProvider:didReceiveUpdatesForAccessoryWithIdentifier:primaryUserInfo:", v10, v6, v7);

}

- (id)dataSourceHomeWithHomeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMAccessoryInfoDataProvider *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessoryInfoDataProvider dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accessoryInfoDataProvider:homeWithHomeIdentifier:", self, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source home UUID due to no data source", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (HMAccessoryInfoDataProviderDataSource)dataSource
{
  return (HMAccessoryInfoDataProviderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMAccessoryInfoDataProviderDelegate)delegate
{
  return (HMAccessoryInfoDataProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 24, 1);
}

- (HMESubscriptionProviding)eventSubscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventSubscriptionProvider, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

void __133__HMAccessoryInfoDataProvider_unsubscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke(uint64_t a1, void *a2)
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Unsubscribe topics with result: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __69__HMAccessoryInfoDataProvider_notifyOfEventStoreLastEventsForTopics___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyOfEventStoreLastEventForTopic:", a2);
}

uint64_t __52__HMAccessoryInfoDataProvider_notifyOfCachedEvents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "didReceiveEvent:topic:logMessage:", a3, a2, CFSTR("completion cache"));
}

void __131__HMAccessoryInfoDataProvider_subscribeToAccessoryInfoWithHomeIdentifier_accessoryIdentifier_accessoryInfoTypes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v20 = 138543874;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v6;
      v13 = "%{public}@Error subscribing topics %@ with error: %@";
      v14 = v10;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v14, v15, v13, (uint8_t *)&v20, v16);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v20 = 138543618;
    v21 = v11;
    v22 = 2112;
    v23 = v17;
    v13 = "%{public}@Successfully subscribed to topics: %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "notifyOfCachedEvents:", v5);
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v6, v18, v19);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t26 != -1)
    dispatch_once(&logCategory__hmf_once_t26, &__block_literal_global_22504);
  return (id)logCategory__hmf_once_v27;
}

void __42__HMAccessoryInfoDataProvider_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v27;
  logCategory__hmf_once_v27 = v0;

}

@end
