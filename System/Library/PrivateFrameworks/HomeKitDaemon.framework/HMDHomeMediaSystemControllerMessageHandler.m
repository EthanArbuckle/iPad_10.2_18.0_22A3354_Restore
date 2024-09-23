@implementation HMDHomeMediaSystemControllerMessageHandler

- (HMDHomeMediaSystemControllerMessageHandler)initWithQueue:(id)a3 home:(id)a4 messageDispatcher:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDFeaturesDataSource *v14;
  HMDHomeMediaSystemControllerMessageHandler *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(HMDFeaturesDataSource);
  v15 = -[HMDHomeMediaSystemControllerMessageHandler initWithQueue:home:messageDispatcher:delegate:featuresDataSource:](self, "initWithQueue:home:messageDispatcher:delegate:featuresDataSource:", v13, v12, v11, v10, v14);

  return v15;
}

- (HMDHomeMediaSystemControllerMessageHandler)initWithQueue:(id)a3 home:(id)a4 messageDispatcher:(id)a5 delegate:(id)a6 featuresDataSource:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMDHomeMediaSystemControllerMessageHandler *v18;
  HMDHomeMediaSystemControllerMessageHandler *v19;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMDHomeMediaSystemControllerMessageHandler;
  v18 = -[HMDHomeMediaSystemControllerMessageHandler init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeWeak((id *)&v19->_home, v14);
    objc_storeStrong((id *)&v19->_messageDispatcher, a5);
    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_featuresDataSource, a7);
    -[HMDHomeMediaSystemControllerMessageHandler _registerForMessages](v19, "_registerForMessages");
  }

  return v19;
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v3, 4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler messageDispatcher](self, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7BE8], self, v7, sel_routeAddMediaSystem_);
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", *MEMORY[0x24BDD7D38], self, v7, sel_routeRemoveMediaSystem_);

}

- (id)preProcessMediaSystemMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDHomeMediaSystemControllerMessageHandler *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDHomeMediaSystemControllerMessageHandler *v20;
  void *v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id v25;
  _BYTE location[12];
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isSharedAdmin"))
    goto LABEL_6;
  objc_msgSend(v5, "primaryResident");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6 || (objc_msgSend(v6, "isReachable") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v16;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident device isn't available or reachable: %@", location, 0x16u);

    }
    v17 = 91;
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "supportsMediaSystem") & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v21;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Resident device does not support media system: %@", location, 0x16u);

    }
    v17 = 92;
LABEL_10:

    objc_autoreleasePoolPop(v13);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v18);

    v12 = 0;
    goto LABEL_11;
  }

LABEL_6:
  objc_initWeak((id *)location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__HMDHomeMediaSystemControllerMessageHandler_preProcessMediaSystemMessage___block_invoke;
  aBlock[3] = &unk_24E79ACA8;
  objc_copyWeak(&v25, (id *)location);
  v8 = v4;
  v23 = v8;
  v24 = v5;
  v9 = _Block_copy(aBlock);
  v10 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIdentifier:", v11);

  objc_msgSend(v10, "setResponseHandler:", v9);
  objc_msgSend(v10, "setRemote:", objc_msgSend(v8, "isRemote"));
  v12 = (void *)objc_msgSend(v10, "copy");

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)location);
LABEL_11:

  return v12;
}

- (void)routeAddMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeMediaSystemControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Routing add media system message: %@(%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home theater QFA is not enabled using legacy flows", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDHomeMediaSystemControllerMessageHandler _legacyHandleAddMediaSystem:](v12, "_legacyHandleAddMediaSystem:", v4);
  }
  else
  {
    -[HMDHomeMediaSystemControllerMessageHandler _logAddMediaSystemMetricsUsingMessage:](v6, "_logAddMediaSystemMetricsUsingMessage:", v4);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __66__HMDHomeMediaSystemControllerMessageHandler_routeAddMediaSystem___block_invoke;
    v15[3] = &unk_24E795E50;
    v15[4] = v6;
    v16 = v4;
    -[HMDHomeMediaSystemControllerMessageHandler _routeMessage:localHandler:](v6, "_routeMessage:localHandler:", v16, v15);

  }
}

- (void)_logAddMediaSystemMetricsUsingMessage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HMDHomeMediaSystemControllerMessageHandler *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDHomeMediaSystemControllerMessageHandler *v18;
  NSObject *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDD77D8]);
  objc_msgSend(v4, "messagePayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPayload:", v7);

  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5 && v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      v28 = 2112;
      v29 = v14;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Received %@ message for media system builder payload %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(v5, "homeManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0.0;
    objc_msgSend(v15, "firstSetupSessionIdentifierOutputStartTime:", &v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x227676638]();
    v18 = v10;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v20;
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Found associated setup session identifier %@ during media system grouping", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v21 = 1000 * (unint64_t)v25;
    objc_msgSend(v5, "mediaSystemSetupMetricDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "markRequestReceivedForGroupIdentifier:metricType:setupSessionIdentifier:setupSessionStartTimeMS:", v23, 1, v16, v21);

  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v27 = v24;
      v28 = 2112;
      v29 = v5;
      v30 = 2112;
      v31 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Home: %@ or media system builder payload: %@ is nil", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

}

- (void)_logRemoveMediaSystemMetricsUsingMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  HMDHomeMediaSystemControllerMessageHandler *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDHomeMediaSystemControllerMessageHandler *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messagePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 && v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD7D20]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543874;
        v25 = v16;
        v26 = 2112;
        v27 = v17;
        v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Received %@ message for media system UUID: %@", (uint8_t *)&v24, 0x20u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v5, "mediaSystemSetupMetricDispatcher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "markRequestReceivedForGroupIdentifier:metricType:setupSessionIdentifier:setupSessionStartTimeMS:", v11, 2, 0, 0);

    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = 138543618;
        v25 = v23;
        v26 = 2112;
        v27 = v4;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Message %@ payload does not contain valid media system UUID", (uint8_t *)&v24, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
    }

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
      v27 = v5;
      v28 = 2112;
      v29 = v7;
      _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@home: %@ or payload: %@ is nil", (uint8_t *)&v24, 0x20u);

    }
    objc_autoreleasePoolPop(v19);
  }

}

- (void)locallyAddMediaSystemUsingRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  HMDHomeMediaSystemControllerMessageHandler *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v57 = v8;
    v58 = 2112;
    v59 = v9;
    v60 = 2112;
    v61 = v10;
    v62 = 2112;
    v63 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Locally add media system using request message: %@(%@) payload: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  v12 = objc_alloc(MEMORY[0x24BDD77D8]);
  objc_msgSend(v4, "messagePayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithPayload:", v13);

  -[HMDHomeMediaSystemControllerMessageHandler homeUUID](v6, "homeUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler mediaGroupsAggregator](v6, "mediaGroupsAggregator");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (!v14 || !v15 || !v16)
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = v6;
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v57 = v25;
      v58 = 2112;
      v59 = v14;
      v60 = 2112;
      v61 = v17;
      v62 = 2112;
      v63 = v15;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_INFO, "%{public}@Failed to add media system due to missing dependencies payload: %@ aggregator: %@ homeUUID: %@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v22);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[HMDHomeMediaSystemControllerMessageHandler validatePayload:](v6, "validatePayload:", v14);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
LABEL_12:
    v26 = (void *)v18;
    objc_msgSend(v4, "respondWithError:", v18);
    goto LABEL_13;
  }
  objc_msgSend(v14, "configuredName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v51 = v17;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD77E8], "roomNameSentinel");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v52 = v21;

  objc_msgSend(v14, "configuredName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27 == 0;

  v29 = objc_alloc(MEMORY[0x24BDD77E8]);
  objc_msgSend(v14, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler preferredAssociatedGroupIdentifierForMediaSystemBuilderPayload:](v6, "preferredAssociatedGroupIdentifierForMediaSystemBuilderPayload:", v14);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leftAccessoryUUID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rightAccessoryUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v29, "initWithIdentifier:parentIdentifier:name:defaultName:associatedGroupIdentifier:leftDestinationIdentifier:rightDestinationIdentifier:", v30, v15, v52, v28, v31, v32, v33);

  objc_msgSend(v14, "leftAccessoryUUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v34;
  objc_msgSend(v14, "rightAccessoryUUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v35;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v51;
  objc_msgSend(v51, "updateGroup:participantAccessoryUUIDs:", v50, v36);

  objc_msgSend(v14, "leftAccessoryUUID");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithAccessoryUUID:associatedGroupIdentifier:](v6, "updateParticipantWithAccessoryUUID:associatedGroupIdentifier:", v48, v47);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v37;
  objc_msgSend(v14, "rightAccessoryUUID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uuid");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithAccessoryUUID:associatedGroupIdentifier:](v6, "updateParticipantWithAccessoryUUID:associatedGroupIdentifier:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v49);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leftAccessoryUUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v42;
  objc_msgSend(v14, "rightAccessoryUUID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler updateMediaSystemCompletionBlockWithMessage:data:accessoryUUIDs:](v6, "updateMediaSystemCompletionBlockWithMessage:data:accessoryUUIDs:", v4, v50, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (id)objc_msgSend(v41, "addCompletionBlock:", v45);

  v26 = 0;
LABEL_13:

}

- (id)preferredAssociatedGroupIdentifierForMediaSystemBuilderPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeMediaSystemControllerMessageHandler *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  HMDHomeMediaSystemControllerMessageHandler *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  HMDHomeMediaSystemControllerMessageHandler *v26;
  NSObject *v27;
  id v28;
  void *v29;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leftAccessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationManagerWithParentIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v7;
  objc_msgSend(v7, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "audioGroupIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightAccessoryUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "destinationManagerWithParentIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v11;
  objc_msgSend(v11, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "audioGroupIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || !v12)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = v4;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v17;
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v5;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Preferred associated group will be derived without influence from missing left destination: %@ right destination: %@ in home: %@", buf, 0x2Au);

      v4 = v31;
    }

    objc_autoreleasePoolPop(v14);
  }
  if (v9 && v13 && (objc_msgSend(v9, "isEqual:", v13) & 1) == 0)
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = v4;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v29;
      v37 = 2112;
      v38 = v8;
      v39 = 2112;
      v40 = v12;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_INFO, "%{public}@Not setting a preferred group identifier due to miss matching groups on left destination: %@ right destination: %@", buf, 0x20u);

      v4 = v28;
    }

    objc_autoreleasePoolPop(v25);
    v19 = 0;
  }
  else
  {
    if (v9)
      v18 = v9;
    else
      v18 = v13;
    v19 = v18;
    if (v19)
    {
      v20 = (void *)MEMORY[0x227676638]();
      v21 = self;
      HMFGetOSLogHandle();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v32 = v4;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v23;
        v37 = 2112;
        v38 = v19;
        _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Setting preferred associated group identifier: %@", buf, 0x16u);

        v4 = v32;
      }

      objc_autoreleasePoolPop(v20);
      v24 = v19;
    }

  }
  return v19;
}

- (id)validatePayload:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "configuredName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDHomeMediaSystemControllerMessageHandler validateConfiguredName:](self, "validateConfiguredName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)validateConfiguredName:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  HMDHomeMediaSystemControllerMessageHandler *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  HMDHomeMediaSystemControllerMessageHandler *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeMediaSystemControllerMessageHandler *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  HMDHomeMediaSystemControllerMessageHandler *v27;
  NSObject *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get name to validate", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 2;
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "length") || (v6 = objc_msgSend(v5, "length"), v6 > HMMaxLengthForNaming()))
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v10;
      v32 = 2112;
      v33 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get valid name due length of name: %@", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = 3;
LABEL_10:
    objc_msgSend(v11, "hmErrorWithCode:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "validateName:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v24;
        v32 = 2112;
        v33 = v5;
        v34 = 2112;
        v35 = v17;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to get valid name: %@ error: %@", (uint8_t *)&v30, 0x20u);

      }
      objc_autoreleasePoolPop(v21);
      v25 = v17;
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
      v30 = 138543362;
      v31 = v29;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to get home during name validation", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v26);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v17;
}

- (id)updateMediaSystemCompletionBlockWithMessage:(id)a3 data:(id)a4 accessoryUUIDs:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __110__HMDHomeMediaSystemControllerMessageHandler_updateMediaSystemCompletionBlockWithMessage_data_accessoryUUIDs___block_invoke;
  v16[3] = &unk_24E77D628;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = _Block_copy(v16);

  return v14;
}

- (id)stagingMediaSystemDataFromData:(id)a3 accessoryUUIDs:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD77E8], "roomNameSentinel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
    -[HMDHomeMediaSystemControllerMessageHandler mediaSystemNameFromRoomWithAccessoryUUIDs:](self, "mediaSystemNameFromRoomWithAccessoryUUIDs:", v6);
  else
    objc_msgSend(v7, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setName:", v10);

  return v7;
}

- (id)mediaSystemNameFromRoomWithAccessoryUUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "accessoryWithUUID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "room");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v14 = v12;
            objc_msgSend(v12, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  objc_msgSend(MEMORY[0x24BDD77E8], "defaultGroupName", (_QWORD)v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v13;
}

- (void)updateParticipantWithDestinationIdentifiers:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __116__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationIdentifiers_associatedGroupIdentifier___block_invoke;
  v8[3] = &unk_24E782620;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "na_each:", v8);

}

- (void)updateParticipantWithDestinationIdentifier:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDHomeMediaSystemControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationManagerWithDestinationIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    || (objc_msgSend(v8, "destinationManagerWithParentIdentifier:", v6),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithDestinationManager:associatedGroupIdentifier:](self, "updateParticipantWithDestinationManager:associatedGroupIdentifier:", v9, v7);

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
      v15 = 138543874;
      v16 = v14;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to update participant with destination identifier: %@ due to no destination manager found in home: %@", (uint8_t *)&v15, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
  }

}

- (id)updateParticipantWithAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "destinationManagerWithParentIdentifier:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithDestinationManager:associatedGroupIdentifier:](self, "updateParticipantWithDestinationManager:associatedGroupIdentifier:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HMDHomeMediaSystemControllerMessageHandler queueOnboardingForUnconfiguredParticipantWithAccessoryUUID:associatedGroupIdentifier:](self, "queueOnboardingForUnconfiguredParticipantWithAccessoryUUID:associatedGroupIdentifier:", v6, v7);

    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)updateParticipantWithDestinationManager:(id)a3 associatedGroupIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v6 = (objc_class *)MEMORY[0x24BE6B608];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __112__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationManager_associatedGroupIdentifier___block_invoke;
  v14[3] = &unk_24E79BCC8;
  v14[4] = self;
  v10 = v9;
  v15 = v10;
  objc_msgSend(v8, "requestToUpdateAudioGroupIdentifier:completion:", v7, v14);

  v11 = v15;
  v12 = v10;

  return v12;
}

- (void)queueOnboardingForUnconfiguredParticipantWithAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDHomeMediaSystemControllerMessageHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDHomeMediaSystemControllerMessageHandler *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v11;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Queueing onboarding participant accessory uuid: %@ associated group identifier: %@", (uint8_t *)&v18, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDHomeMediaSystemControllerMessageHandler unconfiguredParticipantOnboardingManager](v9, "unconfiguredParticipantOnboardingManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "queueOnboardingParticipantWithAccessoryUUID:withAssociatedGroupIdentifier:", v6, v7);
  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v9;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543874;
      v19 = v17;
      v20 = 2112;
      v21 = v6;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to queue participant accessory uuid: %@ associated group identifier: %@ due to no onboarding manager", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v14);
  }

}

- (id)unconfiguredParticipantOnboardingManager
{
  void *v2;
  void *v3;

  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaGroupsUnconfiguredParticipantOnboardingManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)messageRouter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDHomeMediaSystemControllerMessageHandler *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryResidentMessageRouter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get primary message router in home: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

- (id)mediaGroupsAggregator
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDHomeMediaSystemControllerMessageHandler *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaGroupsAggregator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media groups aggregator from home: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

- (id)homeUUID
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  HMDHomeMediaSystemControllerMessageHandler *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to get home uuid from home: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

- (void)_legacyHandleAddMediaSystem:(id)a3
{
  void *v4;
  void *v5;

  -[HMDHomeMediaSystemControllerMessageHandler preProcessMediaSystemMessage:](self, "preProcessMediaSystemMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[HMDHomeMediaSystemControllerMessageHandler _legacyHandleAddMediaSystemWithPreProcessedMessage:](self, "_legacyHandleAddMediaSystemWithPreProcessedMessage:", v4);
    v4 = v5;
  }

}

- (void)_legacyHandleAddMediaSystemWithPreProcessedMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;
  HMDHomeMediaSystemControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  char v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDHomeMediaSystemControllerMessageHandler *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  HMDHomeMediaSystemControllerMessageHandler *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD7D20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7CF8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD7CF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7CC8]);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v14;
      v46 = 2112;
      v47 = v5;
      v48 = 2112;
      v49 = v9;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Message is missing required information uuid: %@, builderID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "validateName:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v6 == 0;
  else
    v17 = 1;
  if (!v17)
  {
    v25 = (void *)MEMORY[0x227676638]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v29;
      v46 = 2112;
      v47 = v6;
      _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Name already exists %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
LABEL_19:
    objc_msgSend(v4, "respondWithError:", v16);
    goto LABEL_24;
  }
  v42 = 0;
  v43 = 0;
  v40 = 0;
  v41 = 0;
  v36 = v7;
  v18 = objc_msgSend(MEMORY[0x24BDD77D8], "decodeComponentData:leftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:", v7, &v43, &v42, &v41, &v40);
  v37 = v43;
  v19 = v42;
  v20 = v41;
  v21 = v40;
  v22 = v21;
  if ((v18 & 1) != 0)
  {
    -[HMDHomeMediaSystemControllerMessageHandler delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __97__HMDHomeMediaSystemControllerMessageHandler__legacyHandleAddMediaSystemWithPreProcessedMessage___block_invoke;
    v38[3] = &unk_24E79A980;
    v39 = v4;
    objc_msgSend(v23, "messageHandlerAddMediaSystem:configuredName:leftUUID:leftAccessoryUUID:rightUUID:rightAccessoryUUID:builderSession:completion:", v5, v6, v37, v19, v20, v22, v9, v38);

    v24 = v39;
  }
  else
  {
    v34 = v21;
    v35 = v20;
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v33;
      v46 = 2112;
      v47 = v36;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not decode components %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v24);
    v22 = v34;
    v20 = v35;
  }

  v7 = v36;
LABEL_24:

}

- (void)routeRemoveMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Home theater QFA is not enabled using legacy flows", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDHomeMediaSystemControllerMessageHandler _legacyHandleRemoveMediaSystem:](v6, "_legacyHandleRemoveMediaSystem:", v4);
  }
  else
  {
    -[HMDHomeMediaSystemControllerMessageHandler _logRemoveMediaSystemMetricsUsingMessage:](self, "_logRemoveMediaSystemMetricsUsingMessage:", v4);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__HMDHomeMediaSystemControllerMessageHandler_routeRemoveMediaSystem___block_invoke;
    v9[3] = &unk_24E795E50;
    v9[4] = self;
    v10 = v4;
    -[HMDHomeMediaSystemControllerMessageHandler _routeMessage:localHandler:](self, "_routeMessage:localHandler:", v10, v9);

  }
}

- (void)locallyRemoveMediaSystemUsingRemoveRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemControllerMessageHandler *v6;
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
  HMDHomeMediaSystemControllerMessageHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDHomeMediaSystemControllerMessageHandler *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  HMDHomeMediaSystemControllerMessageHandler *v33;
  NSObject *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 138544130;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    v40 = 2112;
    v41 = v10;
    v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locallying remove media system using request message: %@(%@) payload: %@", (uint8_t *)&v36, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hmf_UUIDForKey:", *MEMORY[0x24BDD7D20]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[HMDHomeMediaSystemControllerMessageHandler mediaGroupsAggregator](v6, "mediaGroupsAggregator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "localGroupWithIdentifier:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "mediaSystemData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        objc_msgSend(v17, "associatedGroupIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "destinationUniqueIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithDestinationIdentifiers:associatedGroupIdentifier:](v6, "updateParticipantWithDestinationIdentifiers:associatedGroupIdentifier:", v20, v19);

        objc_msgSend(v15, "removeGroupWithIdentifier:", v13);
        objc_msgSend(v4, "respondWithSuccess");
      }
      else
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v6;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 138543618;
          v37 = v35;
          v38 = 2112;
          v39 = v16;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Failed to remove media system due to missing media system group: %@", (uint8_t *)&v36, 0x16u);

        }
        objc_autoreleasePoolPop(v32);
        objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "respondWithError:", v19);
      }

    }
    else
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v6;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543362;
        v37 = v31;
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove media system due to no aggregator", (uint8_t *)&v36, 0xCu);

      }
      objc_autoreleasePoolPop(v28);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v16);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = v6;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "messagePayload");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138544130;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      v40 = 2112;
      v41 = v26;
      v42 = 2112;
      v43 = v27;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove media system due to invalid payload in request message: %@(%@) payload: %@", (uint8_t *)&v36, 0x2Au);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
  }

}

- (void)_legacyHandleRemoveMediaSystem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "uuidForKey:", *MEMORY[0x24BDD7D20]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringForKey:", *MEMORY[0x24BDD7CC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler preProcessMediaSystemMessage:](self, "preProcessMediaSystemMessage:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HMDHomeMediaSystemControllerMessageHandler delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageHandlerRemoveMediaSystem:builderSession:message:", v4, v5, v8);

  }
}

- (void)routeUpdateMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDHomeMediaSystemControllerMessageHandler *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Routing update media system message: %@(%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (isFeatureHomeTheaterQFAEnabledForTests
    && (objc_msgSend((id)isFeatureHomeTheaterQFAEnabledForTests, "BOOLValue") & 1) == 0)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = v6;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Home theater QFA is not enabled using legacy flows", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDHomeMediaSystemControllerMessageHandler _legacyHandleUpdateMediaSystem:](v12, "_legacyHandleUpdateMediaSystem:", v4);
  }
  else
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__HMDHomeMediaSystemControllerMessageHandler_routeUpdateMediaSystem___block_invoke;
    v15[3] = &unk_24E795E50;
    v15[4] = v6;
    v16 = v4;
    -[HMDHomeMediaSystemControllerMessageHandler _routeMessage:localHandler:](v6, "_routeMessage:localHandler:", v16, v15);

  }
}

- (void)locallyUpdateMediaSystemUsingRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDHomeMediaSystemControllerMessageHandler *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  HMDHomeMediaSystemControllerMessageHandler *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDHomeMediaSystemControllerMessageHandler *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messagePayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v58 = v8;
    v59 = 2112;
    v60 = v9;
    v61 = 2112;
    v62 = v10;
    v63 = 2112;
    v64 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locally update media system using request message: %@(%@) payload: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  v12 = objc_alloc(MEMORY[0x24BDD77D8]);
  objc_msgSend(v4, "messagePayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithPayload:", v13);

  -[HMDHomeMediaSystemControllerMessageHandler mediaGroupsAggregator](v6, "mediaGroupsAggregator");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v14 && v15)
  {
    objc_msgSend(v14, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localGroupWithIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "mediaSystemData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[HMDHomeMediaSystemControllerMessageHandler validatePayload:](v6, "validatePayload:", v14);
      v20 = objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v21 = (void *)objc_msgSend(v19, "mutableCopy");
        objc_msgSend(v14, "configuredName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v19;
        if (v22)
        {
          objc_msgSend(v21, "setName:", v22);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD77E8], "roomNameSentinel");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setName:", v32);

        }
        objc_msgSend(v14, "configuredName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDefaultName:", v33 == 0);

        objc_msgSend(v14, "leftAccessoryUUID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLeftDestinationIdentifier:", v34);

        objc_msgSend(v14, "rightAccessoryUUID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setRightDestinationIdentifier:", v35);

        objc_msgSend(v14, "leftAccessoryUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v56[0] = v36;
        objc_msgSend(v14, "rightAccessoryUUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v56[1] = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateGroup:participantAccessoryUUIDs:", v21, v38);

        objc_msgSend(v14, "leftAccessoryUUID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithAccessoryUUID:associatedGroupIdentifier:](v6, "updateParticipantWithAccessoryUUID:associatedGroupIdentifier:", v50, v49);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v39;
        objc_msgSend(v14, "rightAccessoryUUID");
        v52 = v21;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaSystemControllerMessageHandler updateParticipantWithAccessoryUUID:associatedGroupIdentifier:](v6, "updateParticipantWithAccessoryUUID:associatedGroupIdentifier:", v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v42;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 2);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v51);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "leftAccessoryUUID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v44;
        objc_msgSend(v14, "rightAccessoryUUID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v45;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 2);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDHomeMediaSystemControllerMessageHandler updateMediaSystemCompletionBlockWithMessage:data:accessoryUUIDs:](v6, "updateMediaSystemCompletionBlockWithMessage:data:accessoryUUIDs:", v4, v52, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = (id)objc_msgSend(v43, "addCompletionBlock:", v47);

        v31 = 0;
        v19 = v53;
        goto LABEL_18;
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x227676638]();
      v28 = v6;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v58 = v30;
        v59 = 2112;
        v60 = v18;
        _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to update media system due to missing media system group: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v31 = (void *)v20;
    objc_msgSend(v4, "respondWithError:", v20);
LABEL_18:

    goto LABEL_19;
  }
  v23 = (void *)MEMORY[0x227676638]();
  v24 = v6;
  HMFGetOSLogHandle();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v58 = v26;
    v59 = 2112;
    v60 = v14;
    v61 = 2112;
    v62 = v16;
    _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to update media system due to missing dependencies payload: %@ aggregator: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v23);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v18);
LABEL_19:

}

- (void)_legacyHandleUpdateMediaSystem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeMediaSystemControllerMessageHandler *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  HMDHomeMediaSystemControllerMessageHandler *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  HMDHomeMediaSystemControllerMessageHandler *v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDHomeMediaSystemControllerMessageHandler preProcessMediaSystemMessage:](self, "preProcessMediaSystemMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "uuidForKey:", *MEMORY[0x24BDD7D20]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7CF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForKey:", *MEMORY[0x24BDD7CC8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayForKey:", *MEMORY[0x24BDD7CF0]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "validateName:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v11 = v7 == 0;
      else
        v11 = 1;
      if (v11)
      {
        v36 = v6;
        v37 = v8;
        v43 = 0;
        v44 = 0;
        v41 = 0;
        v42 = 0;
        v12 = objc_msgSend(MEMORY[0x24BDD77D8], "decodeComponentData:leftComponentUUID:leftAccessoryUUID:rightComponentUUID:rightAccessoryUUID:", v38, &v44, &v43, &v42, &v41);
        v13 = v44;
        v14 = v43;
        v15 = v42;
        v16 = v41;
        v17 = v16;
        if ((v12 & 1) != 0)
        {
          -[HMDHomeMediaSystemControllerMessageHandler delegate](self, "delegate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __77__HMDHomeMediaSystemControllerMessageHandler__legacyHandleUpdateMediaSystem___block_invoke;
          v39[3] = &unk_24E79A980;
          v40 = v4;
          objc_msgSend(v18, "messageHandlerUpdateMediaSystem:configuredName:leftUUID:leftAccessoryUUID:rightUUID:rightAccessoryUUID:builderSession:completion:", v36, v7, v13, v14, v15, v17, v37, v39);

          v19 = v13;
          v20 = v40;
        }
        else
        {
          v34 = v16;
          v35 = v13;
          v30 = (void *)MEMORY[0x227676638]();
          v31 = self;
          HMFGetOSLogHandle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v46 = v33;
            v47 = 2112;
            v48 = v38;
            _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not decode components %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v30);
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "respondWithError:", v20);
          v17 = v34;
          v19 = v35;
        }

        v6 = v36;
        v8 = v37;
        goto LABEL_21;
      }
      v25 = (void *)MEMORY[0x227676638]();
      v26 = self;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v29;
        v47 = 2112;
        v48 = v7;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@Name already exists %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }
    else
    {
      v21 = (void *)MEMORY[0x227676638]();
      v22 = self;
      HMFGetOSLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v46 = v24;
        v47 = 2112;
        v48 = 0;
        _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Message is missing mediaSystemUUID %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v21);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "respondWithError:", v10);
LABEL_21:

  }
}

- (void)_routeMessage:(id)a3 localHandler:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  HMDHomeMediaSystemControllerMessageHandler *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HMDHomeMediaSystemControllerMessageHandler *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  HMDRemoteHomeMessageDestination *v27;
  void *v28;
  void *v29;
  void *v30;
  HMDRemoteHomeMessageDestination *v31;
  void *v32;
  HMDHomeMediaSystemControllerMessageHandler *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, id))a4;
  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543362;
      v40 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Cannot route the message: home is nil", (uint8_t *)&v39, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2018);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  objc_msgSend(v8, "primaryResident");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isConfirmed");

  objc_msgSend(v9, "primaryResident");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCurrentDevice");

  if (v11 && v14)
  {
    v7[2](v7, v6);
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "isRemote"))
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 138543618;
      v40 = v23;
      v41 = 2112;
      v42 = v6;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@Only primary resident can handle remote message: %@", (uint8_t *)&v39, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3202);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v24 = (void *)v19;
    objc_msgSend(v6, "respondWithError:", v19);

    goto LABEL_16;
  }
  v25 = (void *)objc_msgSend(v6, "copy");
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v26, "setRemote:", 1);
  objc_msgSend(v26, "setSecureRemote:", 1);
  objc_msgSend(v26, "setTimeout:", 45.0);
  v27 = [HMDRemoteHomeMessageDestination alloc];
  objc_msgSend(v6, "destination");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "target");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHomeMediaSystemControllerMessageHandler homeUUID](self, "homeUUID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HMDRemoteHomeMessageDestination initWithTarget:homeUUID:](v27, "initWithTarget:homeUUID:", v29, v30);
  objc_msgSend(v26, "setDestination:", v31);

  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "identifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 138543874;
    v40 = v35;
    v41 = 2112;
    v42 = v36;
    v43 = 2112;
    v44 = v37;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Sending remote home message with identifier: %@ from local message identifier: %@", (uint8_t *)&v39, 0x20u);

  }
  objc_autoreleasePoolPop(v32);
  -[HMDHomeMediaSystemControllerMessageHandler messageDispatcher](v33, "messageDispatcher");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "sendMessage:", v26);

LABEL_16:
}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDHomeMediaSystemControllerMessageHandler home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDHomeMediaSystemControllerMessageHandler messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDHomeMediaSystemControllerMessageHandler messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDFeaturesDataSource)featuresDataSource
{
  return (HMDFeaturesDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMDHomeMediaSystemControllerMessageHandlerDelegate)delegate
{
  return (HMDHomeMediaSystemControllerMessageHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_featuresDataSource, 0);
}

void __77__HMDHomeMediaSystemControllerMessageHandler__legacyHandleUpdateMediaSystem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v6);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      v9 = *MEMORY[0x24BDD7CD0];
      v10[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithPayload:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v8);
    }

  }
}

uint64_t __69__HMDHomeMediaSystemControllerMessageHandler_routeUpdateMediaSystem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locallyUpdateMediaSystemUsingRequestMessage:", *(_QWORD *)(a1 + 40));
}

uint64_t __69__HMDHomeMediaSystemControllerMessageHandler_routeRemoveMediaSystem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locallyRemoveMediaSystemUsingRemoveRequestMessage:", *(_QWORD *)(a1 + 40));
}

void __97__HMDHomeMediaSystemControllerMessageHandler__legacyHandleAddMediaSystemWithPreProcessedMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v6);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    if (v5)
    {
      v9 = *MEMORY[0x24BDD7CD0];
      v10[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithPayload:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 52);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "respondWithError:", v8);
    }

  }
}

void __112__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationManager_associatedGroupIdentifier___block_invoke(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Request to update audio groups completed with error: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

uint64_t __116__HMDHomeMediaSystemControllerMessageHandler_updateParticipantWithDestinationIdentifiers_associatedGroupIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateParticipantWithDestinationIdentifier:associatedGroupIdentifier:", a2, *(_QWORD *)(a1 + 40));
}

void __110__HMDHomeMediaSystemControllerMessageHandler_updateMediaSystemCompletionBlockWithMessage_data_accessoryUUIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaSystem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
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
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Update media system participants completed with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 40), "respondWithError:", v6);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Update media system participants completed", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "stagingMediaSystemDataFromData:accessoryUUIDs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[HMDMediaSystem initWithMediaSystemData:home:]([HMDMediaSystem alloc], "initWithMediaSystemData:home:", v14, v13);
      v16 = *(void **)(a1 + 40);
      -[HMDMediaSystem serialize](v15, "serialize", *MEMORY[0x24BDD7CD0]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "respondWithPayload:", v18);

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v27 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to create update media system response due to no home", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      v23 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "respondWithError:", v14);
    }

  }
}

uint64_t __66__HMDHomeMediaSystemControllerMessageHandler_routeAddMediaSystem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locallyAddMediaSystemUsingRequestMessage:", *(_QWORD *)(a1 + 40));
}

void __75__HMDHomeMediaSystemControllerMessageHandler_preProcessMediaSystemMessage___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained && !v5 && objc_msgSend(a1[5], "isSharedAdmin"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = a1[4];
      v17 = 138543618;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Relaying the message %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    objc_msgSend(a1[5], "administratorHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "operationForMessage:error:", a1[4], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v13, "addOperation:", v14);

  }
  objc_msgSend(a1[4], "responseHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(a1[4], "responseHandler");
    v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v16)[2](v16, v5, v6);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50_55153 != -1)
    dispatch_once(&logCategory__hmf_once_t50_55153, &__block_literal_global_55154);
  return (id)logCategory__hmf_once_v51_55155;
}

void __57__HMDHomeMediaSystemControllerMessageHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v51_55155;
  logCategory__hmf_once_v51_55155 = v0;

}

@end
