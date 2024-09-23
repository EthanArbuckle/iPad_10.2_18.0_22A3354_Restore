@implementation HMDUserDeviceCapabilitiesRequestManager

- (HMDUserDeviceCapabilitiesRequestManager)initWithHomeManager:(id)a3 accountRegistry:(id)a4 messageDispatcher:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HMDUserDeviceCapabilitiesRequestManager *v13;

  v8 = (objc_class *)MEMORY[0x24BE3F2A0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithOptions:", 0);
  v13 = -[HMDUserDeviceCapabilitiesRequestManager initWithHomeManager:accountRegistry:messageDispatcher:timerManager:](self, "initWithHomeManager:accountRegistry:messageDispatcher:timerManager:", v11, v10, v9, v12);

  return v13;
}

- (HMDUserDeviceCapabilitiesRequestManager)initWithHomeManager:(id)a3 accountRegistry:(id)a4 messageDispatcher:(id)a5 timerManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  HMDUserDeviceCapabilitiesRequestManager *v13;
  HMDUserDeviceCapabilitiesRequestManager *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *requestContexts;
  NSMutableArray *v17;
  NSMutableArray *timerContextsToCancel;
  objc_super v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDUserDeviceCapabilitiesRequestManager;
  v13 = -[HMDRemoteMessageTransport initWithAccountRegistry:](&v20, sel_initWithAccountRegistry_, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_homeManager, v10);
    objc_storeStrong((id *)&v14->_messageDispatcher, a5);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    requestContexts = v14->_requestContexts;
    v14->_requestContexts = v15;

    objc_storeStrong((id *)&v14->_timerManager, a6);
    -[HMFTimerManager setDelegate:](v14->_timerManager, "setDelegate:", v14);
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    timerContextsToCancel = v14->_timerContextsToCancel;
    v14->_timerContextsToCancel = v17;

  }
  return v14;
}

- (void)registerForMessages
{
  HMDMessageDispatcher *messageDispatcher;
  HMDMessageDispatcher *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (isInternalBuild())
  {
    if (self)
      messageDispatcher = self->_messageDispatcher;
    else
      messageDispatcher = 0;
    v4 = messageDispatcher;
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v4, "registerForMessage:receiver:policies:selector:", CFSTR("hm.reqcap"), self, v6, sel__handleRequestCapabilitiesXPCRequest_);

  }
}

- (void)electDeviceForUserID:(id)a3 destination:(id)a4 deviceCapabilities:(id)a5 responseTimeout:(double)a6 responseQueue:(id)a7 completionHandler:(id)a8
{
  id v14;
  void *v15;
  HMDUserDeviceCapabilitiesRequestManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDRemoteMessage *v22;
  void *v23;
  void *v24;
  __HMDRequestedCapabilitiesContext *v25;
  void *v26;
  __HMDRequestedCapabilitiesContext *v27;
  NSMutableDictionary *requestContexts;
  NSMutableDictionary *v29;
  void *v30;
  HMDUserDeviceCapabilitiesRequestManager *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  HMDMessageDispatcher *messageDispatcher;
  void *v38;
  HMDUserDeviceCapabilitiesRequestManager *v39;
  NSObject *v40;
  void *v41;
  HMDAssertionLogEvent *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v14 = a4;
  v45 = a7;
  v46 = a8;
  v48 = v14;
  -[HMDUserDeviceCapabilitiesRequestManager _updateDeviceCapabilities:withDestination:](self, "_updateDeviceCapabilities:withDestination:", a5, v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 == 0.0)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v18;
      v54 = 2048;
      v55 = 0x404E000000000000;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Response timeout is not set. Defaulting to %.0f", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    a6 = 60.0;
  }
  -[HMDUserDeviceCapabilitiesRequestManager messageTargetUUID](self, "messageTargetUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessageTransport accountRegistry](self, "accountRegistry");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMessageDispatcher destinationWithTarget:userID:destination:multicast:accountRegistry:](HMDMessageDispatcher, "destinationWithTarget:userID:destination:multicast:accountRegistry:", v19, v47, v48, 1, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:]([HMDRemoteMessage alloc], "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:", CFSTR("kElectDeviceForIDSSessionKey"), 9, v21, v51, 0, 0, a6, -1, 2);
  -[HMDRemoteMessage transactionIdentifier](v22, "transactionIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v50;
  else
    v24 = 0;
  v49 = v24;

  if (!v49)
  {
    v38 = (void *)MEMORY[0x227676638]();
    v39 = self;
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Destination is not for a remote type", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
    v42 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Destination is not for a remote type"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "submitLogEvent:", v42);

  }
  objc_msgSend(v51, "hmf_dictionaryForKey:", CFSTR("kRequestedCapabilitiesKey"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = [__HMDRequestedCapabilitiesContext alloc];
  objc_msgSend(v49, "remoteDestinationString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[__HMDRequestedCapabilitiesContext initWithTransactionID:requestedCapabilities:destinationAddress:responseQueue:completionHandler:](v25, "initWithTransactionID:requestedCapabilities:destinationAddress:responseQueue:completionHandler:", v23, v44, v26, v45, v46);

  os_unfair_lock_lock_with_options();
  if (self)
    requestContexts = self->_requestContexts;
  else
    requestContexts = 0;
  v29 = requestContexts;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v27, v23);

  os_unfair_lock_unlock(&self->_lock);
  v30 = (void *)MEMORY[0x227676638]();
  v31 = self;
  HMFGetOSLogHandle();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessage identifier](v22, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "shortDescription");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v53 = v33;
    v54 = 2114;
    v55 = (uint64_t)v23;
    v56 = 2114;
    v57 = v34;
    v58 = 2114;
    v59 = v35;
    _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Sending message %{public}@ to elect device with capabilities: %{public}@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v30);
  -[HMDUserDeviceCapabilitiesRequestManager _responseHandlerForTransactionID:](v31, "_responseHandlerForTransactionID:", v23);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage setResponseHandler:](v22, "setResponseHandler:", v36);

  if (self)
    messageDispatcher = v31->_messageDispatcher;
  else
    messageDispatcher = 0;
  -[HMDMessageDispatcher sendMessage:completionHandler:](messageDispatcher, "sendMessage:completionHandler:", v22, 0);

}

- (id)_updateDeviceCapabilities:(id)a3 withDestination:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = v5;
  }
  else
  {
    if (v5)
    {
      v8 = (void *)objc_msgSend(v5, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v8;
    objc_msgSend(v8, "hmf_dictionaryForKey:", CFSTR("kRequestedCapabilitiesKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_24E96B660, CFSTR("kHomedVersionKey"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("kRequestedCapabilitiesKey"));

  }
  return v7;
}

- (id)_responseHandlerForTransactionID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HMDUserDeviceCapabilitiesRequestManager__responseHandlerForTransactionID___block_invoke;
  aBlock[3] = &unk_24E798D90;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_handleResponsePayload:(id)a3 error:(id)a4 transactionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *requestContexts;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDUserDeviceCapabilitiesRequestManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  HMDUserDeviceCapabilitiesRequestManager *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  HMDUserDeviceCapabilitiesRequestManager *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  HMDUserDeviceCapabilitiesRequestManager *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  HMDUserDeviceCapabilitiesRequestManager *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  if (self)
    requestContexts = self->_requestContexts;
  else
    requestContexts = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](requestContexts, "objectForKeyedSubscript:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v57 = v10;
    v13 = v9;
    v14 = objc_msgSend(v8, "hmf_BOOLForKey:", CFSTR("kRemoteMessageIsFinalResponseKey"));
    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("kIDSMessageSourceIDKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("kRemoteMessageIsFinalResponseKey"));
    v17 = (void *)objc_msgSend(v16, "copy");

    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = v15;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544899;
      v59 = v22;
      v60 = 2114;
      v61 = v57;
      v62 = 2160;
      v63 = 1752392040;
      v64 = 2112;
      v65 = v21;
      v66 = 2112;
      v67 = v23;
      v68 = 2113;
      v69 = v17;
      v70 = 2112;
      v71 = v13;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received response from %{mask.hash}@, isFinal: %@, payload: %{private}@, error: %@", buf, 0x48u);

      v15 = v21;
    }

    objc_autoreleasePoolPop(v18);
    objc_msgSend(v12, "destinationAddress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", v15);

    if (v25)
    {
      v26 = (void *)MEMORY[0x227676638]();
      v27 = v19;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      v10 = v57;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v59 = v29;
        v60 = 2114;
        v61 = v57;
        _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received response to directed message", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v26);
      v9 = v13;
      -[HMDUserDeviceCapabilitiesRequestManager _completeWithResponse:error:context:](v27, "_completeWithResponse:error:context:", v17, v13, v12);
    }
    else
    {
      v10 = v57;
      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v12, "receivedResponses");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addObject:", v17);

      }
      objc_msgSend(v12, "requestedCapabilities");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[HMDRemoteMessageTransport doesResponse:matchAllCapabilities:](v19, "doesResponse:matchAllCapabilities:", v17, v31);

      v9 = v13;
      if (v32)
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = v19;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v59 = v36;
          v60 = 2114;
          v61 = v57;
          _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Response matched all capabilities", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
        -[HMDUserDeviceCapabilitiesRequestManager _selectBestResponseForContext:](v34, "_selectBestResponseForContext:", v12);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
        v38 = objc_claimAutoreleasedReturnValue();

        -[HMDUserDeviceCapabilitiesRequestManager _completeWithResponse:error:context:](v34, "_completeWithResponse:error:context:", v37, v38, v12);
        v9 = (id)v38;
        v17 = v37;
      }
      else if ((v14 & 1) != 0)
      {
        -[HMDUserDeviceCapabilitiesRequestManager _selectBestResponseForContext:](v19, "_selectBestResponseForContext:", v12);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (v39)
        {
          v41 = v39;

          objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
          v42 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v42;
          v17 = v41;
        }
        v43 = (void *)MEMORY[0x227676638]();
        v44 = v19;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "receivedResponses");
          v47 = v9;
          v48 = v15;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");
          *(_DWORD *)buf = 138544387;
          v59 = v46;
          v60 = 2114;
          v61 = v57;
          v62 = 2048;
          v63 = v50;
          v64 = 2113;
          v65 = v17;
          v66 = 2112;
          v67 = v47;
          _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received %lu responses and is final. Responding with payload: %{private}@, error: %@", buf, 0x34u);

          v15 = v48;
          v9 = v47;

        }
        objc_autoreleasePoolPop(v43);
        -[HMDUserDeviceCapabilitiesRequestManager _completeWithResponse:error:context:](v44, "_completeWithResponse:error:context:", v17, v9, v12);

        v10 = v57;
      }
      else
      {
        v51 = (void *)MEMORY[0x227676638]();
        v52 = v19;
        HMFGetOSLogHandle();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "receivedResponses");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "count");
          *(_DWORD *)buf = 138543874;
          v59 = v54;
          v60 = 2114;
          v61 = v57;
          v62 = 2048;
          v63 = v56;
          _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Received %lu responses so far but they do not match all capabilities", buf, 0x20u);

          v10 = v57;
        }

        objc_autoreleasePoolPop(v51);
        -[HMDUserDeviceCapabilitiesRequestManager _updateResponseTimeoutForContext:](v52, "_updateResponseTimeoutForContext:", v12);
      }
    }

    v8 = v17;
  }

}

- (id)_selectBestResponseForContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "receivedResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    objc_msgSend(v4, "receivedResponses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestedCapabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteMessageTransport matchResponse:requestedCapabilities:](self, "matchResponse:requestedCapabilities:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_completeWithResponse:(id)a3 error:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUserDeviceCapabilitiesRequestManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDHomeKitVersion *v22;
  void *v23;
  HMDHomeKitVersion *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  HMDUserDeviceCapabilitiesRequestManager *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  NSMutableDictionary *requestContexts;
  NSMutableDictionary *v39;
  void *v40;
  void *v41;
  NSMutableArray *timerContextsToCancel;
  NSMutableArray *v43;
  void *v44;
  HMDUserDeviceCapabilitiesRequestManager *v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  id v52;
  char v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _QWORD v62[3];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v11;
  v13 = 0;
  if (!v8 || v9)
  {
    v14 = v11;
  }
  else
  {
    objc_msgSend(v8, "hmf_stringForKey:", CFSTR("kIDSMessageSourceIDKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v8, "mutableCopy");

    v62[0] = CFSTR("kIDSMessageSourceIDKey");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectsForKeys:", v15);

    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transactionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v55 = v19;
      v56 = 2114;
      v57 = v20;
      v58 = 2112;
      v59 = v13;
      v60 = 2114;
      v61 = v14;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@[%{public}@] Elected device %@ with capabilities: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(v8, "hmf_numberForKey:", CFSTR("kHomedVersionKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v46 = v14;
      v22 = [HMDHomeKitVersion alloc];
      objc_msgSend(v21, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[HMDHomeKitVersion initWithVersionString:](v22, "initWithVersionString:", v23);

      v53 = 0;
      -[HMDRemoteMessageTransport accountRegistry](v17, "accountRegistry");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "deviceForHandle:exists:", v13, &v53);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        objc_msgSend(v26, "version");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToVersion:", v24);

        if ((v28 & 1) == 0)
        {
          v29 = (void *)MEMORY[0x227676638]();
          v30 = v17;
          HMFGetOSLogHandle();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v45 = v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v32;
            v56 = 2112;
            v57 = v26;
            _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_INFO, "%{public}@Updating the device, %@, with the election parameters", buf, 0x16u);

            v30 = v45;
          }

          objc_autoreleasePoolPop(v29);
          objc_msgSend(v26, "updateVersion:", v24);
        }
      }

      v14 = v46;
    }

    v9 = 0;
  }
  objc_msgSend(v10, "responseQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__HMDUserDeviceCapabilitiesRequestManager__completeWithResponse_error_context___block_invoke;
  block[3] = &unk_24E79A910;
  v34 = v10;
  v49 = v34;
  v35 = v9;
  v50 = v35;
  v36 = v13;
  v51 = v36;
  v37 = v14;
  v52 = v37;
  dispatch_async(v33, block);

  if (self)
    requestContexts = self->_requestContexts;
  else
    requestContexts = 0;
  v39 = requestContexts;
  objc_msgSend(v34, "transactionID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v39, "removeObjectForKey:", v40);

  objc_msgSend(v34, "timerContext");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    if (self)
      timerContextsToCancel = self->_timerContextsToCancel;
    else
      timerContextsToCancel = 0;
    v43 = timerContextsToCancel;
    objc_msgSend(v34, "timerContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v43, "addObject:", v44);

    objc_msgSend(v34, "setTimerContext:", 0);
  }

}

- (void)_updateResponseTimeoutForContext:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *timerContextsToCancel;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  HMDUserDeviceCapabilitiesRequestManager *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMFTimerManager *timerManager;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(v4, "timerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (self)
      timerContextsToCancel = self->_timerContextsToCancel;
    else
      timerContextsToCancel = 0;
    v7 = timerContextsToCancel;
    objc_msgSend(v4, "timerContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v7, "addObject:", v8);

  }
  objc_msgSend(v4, "receivedResponses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = remotePendingResponseTimerNanoseconds
      / (unint64_t)((1000000000 * v10 + 1000000000) * remotePendingResponseDecayScale);
  v12 = (void *)MEMORY[0x227676638]();
  v13 = self;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transactionID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v15;
    v21 = 2114;
    v22 = v16;
    v23 = 2048;
    v24 = v11;
    _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Updating response timeout to %llu seconds", (uint8_t *)&v19, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  if (v13)
    timerManager = v13->_timerManager;
  else
    timerManager = 0;
  -[HMFTimerManager startTimerWithTimeInterval:object:](timerManager, "startTimerWithTimeInterval:object:", v4, (double)v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimerContext:", v18);

}

- (void)_cancelPendingTimerContexts
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *timerContextsToCancel;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HMFTimerManager *timerManager;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self)
    timerContextsToCancel = self->_timerContextsToCancel;
  else
    timerContextsToCancel = 0;
  v5 = timerContextsToCancel;
  v6 = (void *)-[NSMutableArray copy](v5, "copy");

  if (self)
    v7 = self->_timerContextsToCancel;
  else
    v7 = 0;
  v8 = v7;
  -[NSMutableArray removeAllObjects](v8, "removeAllObjects");

  os_unfair_lock_unlock(p_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v9);
        if (self)
          timerManager = self->_timerManager;
        else
          timerManager = 0;
        -[HMFTimerManager cancelTimerForContext:](timerManager, "cancelTimerForContext:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++), (_QWORD)v15);
      }
      while (v10 != v12);
      v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v10 = v14;
    }
    while (v14);
  }

}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDUserDeviceCapabilitiesRequestManager *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  HMDUserDeviceCapabilitiesRequestManager *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  HMDAssertionLogEvent *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "transactionID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = (uint64_t)v14;
      v27 = 2114;
      v28 = v15;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@[%{public}@] Response timer fired", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    os_unfair_lock_lock_with_options();
    objc_msgSend(v10, "setTimerContext:", 0);
    -[HMDUserDeviceCapabilitiesRequestManager _selectBestResponseForContext:](v12, "_selectBestResponseForContext:", v10);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v16, "objectForKeyedSubscript:", CFSTR("kIDSMessageResponseErrorDataKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (!(v16 | v17))
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v12;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        HMFGetLogIdentifier();
        v21 = objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v21;
        v22 = (void *)v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: We should only get here if we received a response", (uint8_t *)&v25, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v23 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("We should only get here if we received a response"));
      +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "submitLogEvent:", v23);

      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", -1);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    -[HMDUserDeviceCapabilitiesRequestManager _completeWithResponse:error:context:](v12, "_completeWithResponse:error:context:", v16, v17, v10);

    os_unfair_lock_unlock(&v12->_lock);
    -[HMDUserDeviceCapabilitiesRequestManager _cancelPendingTimerContexts](v12, "_cancelPendingTimerContexts");
  }

}

- (void)_handleRequestCapabilitiesXPCRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HMDUserDeviceCapabilitiesRequestManager *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "stringForKey:", CFSTR("kUserIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v22 = self;
    v23 = v6;
    -[HMDUserDeviceCapabilitiesRequestManager homeManager]((id *)&self->super.super.super.super.isa);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v8, "homes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "users");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hmf_firstObjectWithValue:forKeyPath:", v7, CFSTR("userID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {

            v6 = v23;
            objc_msgSend(v23, "removeObjectForKey:", CFSTR("kUserIDKey"));
            objc_msgSend(v15, "userID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v23, "copy");
            objc_msgSend(v8, "workQueue");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x24BDAC760];
            v24[1] = 3221225472;
            v24[2] = __80__HMDUserDeviceCapabilitiesRequestManager__handleRequestCapabilitiesXPCRequest___block_invoke;
            v24[3] = &unk_24E786690;
            v25 = v4;
            -[HMDUserDeviceCapabilitiesRequestManager electDeviceForUserID:destination:deviceCapabilities:responseTimeout:responseQueue:completionHandler:](v22, "electDeviceForUserID:destination:deviceCapabilities:responseTimeout:responseQueue:completionHandler:", v16, 0, v17, v18, v24, 0.0);

            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v11)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("The specified userID is not known"), 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v15);
    v6 = v23;
LABEL_12:

  }
  else
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UserID must be set in the payload with key \"%@\"."), CFSTR("kUserIDKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Cannot send capabilities request because the userID is missing"), v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "respondWithError:", v21);
  }

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDUserDeviceCapabilitiesRequestManager homeManager]((id *)&self->super.super.super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageTargetUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerContextsToCancel, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_requestContexts, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_homeManager);
}

- (id)homeManager
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
  return WeakRetained;
}

void __80__HMDUserDeviceCapabilitiesRequestManager__handleRequestCapabilitiesXPCRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", a2);
  }
  else
  {
    v7 = (void *)objc_msgSend(a4, "mutableCopy");
    objc_msgSend(v12, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("SenderDeviceHandleIdentifier"));

    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "respondWithPayload:", v11);

  }
}

void __79__HMDUserDeviceCapabilitiesRequestManager__completeWithResponse_error_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v2 + 2))(v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __76__HMDUserDeviceCapabilitiesRequestManager__responseHandlerForTransactionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  os_unfair_lock_s *WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock_with_options();
    -[os_unfair_lock_s _handleResponsePayload:error:transactionID:](WeakRetained, "_handleResponsePayload:error:transactionID:", v5, v7, *(_QWORD *)(a1 + 32));
    os_unfair_lock_unlock(WeakRetained + 18);
    -[os_unfair_lock_s _cancelPendingTimerContexts](WeakRetained, "_cancelPendingTimerContexts");
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_126305 != -1)
    dispatch_once(&logCategory__hmf_once_t19_126305, &__block_literal_global_126306);
  return (id)logCategory__hmf_once_v20_126307;
}

void __54__HMDUserDeviceCapabilitiesRequestManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_126307;
  logCategory__hmf_once_v20_126307 = v0;

}

@end
