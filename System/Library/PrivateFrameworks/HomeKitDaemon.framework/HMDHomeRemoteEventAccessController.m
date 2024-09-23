@implementation HMDHomeRemoteEventAccessController

- (HMDHomeRemoteEventAccessController)initWithDataSource:(id)a3
{
  id v4;
  HMDHomeRemoteEventAccessController *v5;
  HMDHomeRemoteEventAccessController *v6;
  HMDAccessorySettingsEventHelper *v7;
  HMDAccessorySettingsEventHelper *settingsHelper;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDHomeRemoteEventAccessController;
  v5 = -[HMDHomeRemoteEventAccessController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v7 = objc_alloc_init(HMDAccessorySettingsEventHelper);
    settingsHelper = v6->_settingsHelper;
    v6->_settingsHelper = v7;

  }
  return v6;
}

- (BOOL)remoteEventAllowedForTopic:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  HMDHomeRemoteEventAccessController *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDHomeRemoteEventAccessController *v20;
  NSObject *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "asAccessoryTopic");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[HMDHomeRemoteEventAccessController remoteEventAllowedForAccessoryEventTopic:parsedEventTopic:deviceType:userType:](self, "remoteEventAllowedForAccessoryEventTopic:parsedEventTopic:deviceType:userType:", v11, v10, a4, a5);
    }
    else
    {
      objc_msgSend(v10, "asMediaSystemSettingTopic");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v12 = -[HMDHomeRemoteEventAccessController remoteEventAllowForMediaSystemSettingEventTopic:deviceType:userType:](self, "remoteEventAllowForMediaSystemSettingEventTopic:deviceType:userType:", v17, a4, a5);
      }
      else
      {
        objc_msgSend(v10, "asHomeEventTopic");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v12 = -[HMDHomeRemoteEventAccessController remoteEventAllowedForHomeEventTopic:parsedEventTopic:deviceType:userType:](self, "remoteEventAllowedForHomeEventTopic:parsedEventTopic:deviceType:userType:", v18, v10, a4, a5);
        }
        else
        {
          v19 = (void *)MEMORY[0x227676638]();
          v20 = self;
          HMFGetOSLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 138543874;
            v25 = v22;
            v26 = 2112;
            v27 = v10;
            v28 = 2112;
            v29 = v8;
            _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine remote event allowed due to unknown parsed topic: %@ with topic: %@", (uint8_t *)&v24, 0x20u);

          }
          objc_autoreleasePoolPop(v19);
          v12 = 0;
        }

      }
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543618;
      v25 = v16;
      v26 = 2112;
      v27 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Failed to determine allowed remote event due to unparsable topic: %@", (uint8_t *)&v24, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (BOOL)remoteEventAllowForMediaSystemSettingEventTopic:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  HMDHomeRemoteEventAccessController *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  void *v20;
  char v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "mediaSystemUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v10 = -[HMDHomeRemoteEventAccessController isMediaSystemUUID:error:](self, "isMediaSystemUUID:error:", v9, &v23);
  v11 = v23;
  if (v11)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v15;
      v26 = 2112;
      v27 = v11;
      v16 = "%{public}@Failed to get remote event allowed for media system with error: %@";
      v17 = v14;
      v18 = 22;
LABEL_8:
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (!v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v15;
      v16 = "%{public}@Failed to determine remote event allowed for unknown media system";
      v17 = v14;
      v18 = 12;
      goto LABEL_8;
    }
LABEL_9:

    objc_autoreleasePoolPop(v12);
    v21 = 0;
    goto LABEL_10;
  }
  -[HMDHomeRemoteEventAccessController settingsHelper](self, "settingsHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaSystemSettingKeyPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "remoteEventAllowedForKeyPath:deviceType:userType:", v20, a4, a5);

LABEL_10:
  return v21;
}

- (BOOL)remoteEventAllowedForAccessoryEventTopic:(id)a3 parsedEventTopic:(id)a4 deviceType:(unint64_t)a5 userType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  HMDHomeRemoteEventAccessController *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  HMDHomeRemoteEventAccessController *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  HMDHomeRemoteEventAccessController *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "accessoryUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v13 = -[HMDHomeRemoteEventAccessController isAppleMediaAccessoryUUID:error:](self, "isAppleMediaAccessoryUUID:error:", v12, &v50);
  v14 = v50;
  v49 = v14;
  v15 = -[HMDHomeRemoteEventAccessController isSiriEndpointAccessoryUUID:error:](self, "isSiriEndpointAccessoryUUID:error:", v12, &v49);
  v16 = v49;

  if (v16)
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v52 = v20;
      v53 = 2112;
      v54 = v16;
      v21 = "%{public}@Failed to get remote event allowed due to known accessory type with error: %@";
      v22 = v19;
      v23 = 22;
LABEL_9:
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v13 || v15)
  {
    objc_msgSend(v11, "asAccessorySettingTopic");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      -[HMDHomeRemoteEventAccessController settingsHelper](self, "settingsHelper");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "accessorySettingKeyPath");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v25, "remoteEventAllowedForKeyPath:deviceType:userType:", v26, a5, a6);

LABEL_25:
      goto LABEL_11;
    }
    objc_msgSend(v11, "topicSuffix");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      v37 = (void *)MEMORY[0x227676638]();
      v38 = self;
      HMFGetOSLogHandle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v40;
        _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no accessory topic suffix", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v37);
      v27 = 0;
      goto LABEL_25;
    }
    +[HMDAccessoryEventsGenerated topicMap](HMDAccessoryEventsGenerated, "topicMap");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topicSuffix");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("remoteUserAccessControl"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDAccessoryEventsGenerated topicMap](HMDAccessoryEventsGenerated, "topicMap");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topicSuffix");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("remoteDeviceAccessControl"));
    v35 = objc_claimAutoreleasedReturnValue();

    v36 = (void *)v35;
    if (v48 && v35)
    {
      if ((+[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteUserAccessControlFromNumber:", v48) & a6) != 0)
      {
        v27 = (+[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteDeviceAccessControlFromNumber:", v35) & a5) != 0;
LABEL_24:
        v24 = 0;

        goto LABEL_25;
      }
    }
    else
    {
      v41 = (void *)MEMORY[0x227676638]();
      v42 = self;
      HMFGetOSLogHandle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "topicSuffix");
        v47 = v36;
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v52 = v44;
        v53 = 2112;
        v54 = v45;
        _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no ACL for accessory topic suffix: %@", buf, 0x16u);

        v36 = v47;
      }

      objc_autoreleasePoolPop(v41);
    }
    v27 = 0;
    goto LABEL_24;
  }
  v17 = (void *)MEMORY[0x227676638]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v20;
    v21 = "%{public}@Failed to determine remote event allowed for non-supported accessory";
    v22 = v19;
    v23 = 12;
    goto LABEL_9;
  }
LABEL_10:

  objc_autoreleasePoolPop(v17);
  v27 = 0;
LABEL_11:

  return v27;
}

- (BOOL)remoteEventAllowedForHomeEventTopic:(id)a3 parsedEventTopic:(id)a4 deviceType:(unint64_t)a5 userType:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  HMDHomeRemoteEventAccessController *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  HMDHomeRemoteEventAccessController *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v11, "topicSuffix");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[HMDHomeEventsGenerated topicMap](HMDHomeEventsGenerated, "topicMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topicSuffix");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("remoteUserAccessControl"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDHomeEventsGenerated topicMap](HMDHomeEventsGenerated, "topicMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topicSuffix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("remoteDeviceAccessControl"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && v20)
    {
      if ((+[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteUserAccessControlFromNumber:", v16) & a6) != 0)
      {
        v21 = (+[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteDeviceAccessControlFromNumber:", v20) & a5) != 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "topicSuffix");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138543618;
        v33 = v29;
        v34 = 2112;
        v35 = v30;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no ACL for home topic suffix: %@", (uint8_t *)&v32, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
    }
    v21 = 0;
    goto LABEL_13;
  }
  v22 = (void *)MEMORY[0x227676638]();
  v23 = self;
  HMFGetOSLogHandle();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 138543362;
    v33 = v25;
    _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no accessory topic suffix", (uint8_t *)&v32, 0xCu);

  }
  objc_autoreleasePoolPop(v22);
  v21 = 0;
LABEL_14:

  return v21;
}

- (BOOL)remoteEventAllowedForAccessoryInfoWithTopicSuffix:(id)a3 deviceType:(unint64_t)a4 userType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  HMDHomeRemoteEventAccessController *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  HMDHomeRemoteEventAccessController *v21;
  NSObject *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (v8)
  {
    +[HMDAccessoryEventsGenerated topicMap](HMDAccessoryEventsGenerated, "topicMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("remoteUserAccessControl"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDAccessoryEventsGenerated topicMap](HMDAccessoryEventsGenerated, "topicMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("remoteDeviceAccessControl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v14)
    {
      if ((+[HMDRemoteEventRouterAccessControl remoteUserAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteUserAccessControlFromNumber:", v11) & a5) != 0)
      {
        v15 = (+[HMDRemoteEventRouterAccessControl remoteDeviceAccessControlFromNumber:](HMDRemoteEventRouterAccessControl, "remoteDeviceAccessControlFromNumber:", v14) & a4) != 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v23;
        v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no ACL for accessory info topicSuffix: %@", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v20);
    }
    v15 = 0;
    goto LABEL_13;
  }
  v16 = (void *)MEMORY[0x227676638]();
  v17 = self;
  HMFGetOSLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v19;
    _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remove event allowed due to no topicSuffix", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v16);
  v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)isAppleMediaAccessoryUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMDHomeRemoteEventAccessController *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeRemoteEventAccessController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isAppleMediaAccessory:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine allowed remote event due to no data source", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isSiriEndpointAccessoryUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMDHomeRemoteEventAccessController *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeRemoteEventAccessController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isSidekickAccessory:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine allowed remote event due to no data source", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)isMediaSystemUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  HMDHomeRemoteEventAccessController *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[HMDHomeRemoteEventAccessController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isMediaSystem:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to determine media system existence due to no data source", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (HMDHomeRemoteEventAccessControllerDataSource)dataSource
{
  return (HMDHomeRemoteEventAccessControllerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMDAccessorySettingsEventHelper)settingsHelper
{
  return self->_settingsHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsHelper, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
