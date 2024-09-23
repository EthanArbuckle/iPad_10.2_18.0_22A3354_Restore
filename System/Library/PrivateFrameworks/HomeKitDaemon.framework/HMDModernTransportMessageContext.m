@implementation HMDModernTransportMessageContext

- (HMDModernTransportMessageContext)initWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7 activityFactory:(id)a8 logEventSubmitter:(id)a9
{
  id v16;
  id v17;
  id v18;
  HMDModernTransportMessageContext *v19;
  HMDModernTransportMessageContext *v20;
  uint64_t v21;
  NSString *messageName;
  uint64_t v23;
  NSUUID *messageID;
  uint64_t v25;
  id messageResponseHandler;
  double v27;
  uint64_t v28;
  NSUUID *identifier;
  void *v30;
  void *v31;
  NSUUID *v32;
  HMDAssertionLogEvent *v33;
  uint64_t v34;
  HMFMessageDestination *destination;
  uint64_t v36;
  id completionHandler;
  void *v38;
  uint64_t v39;
  NSMutableSet *remainingTransports;
  uint64_t v41;
  NSMapTable *inProgressTransportToStartTimeMap;
  uint64_t v43;
  HMDNetworkActivityWrapper *messageNetworkActivity;
  HMDModernTransportMessageContext *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  HMDModernTransportMessageContext *v50;
  void *context;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v56 = a6;
  v55 = a7;
  v54 = a8;
  v53 = a9;
  v57.receiver = self;
  v57.super_class = (Class)HMDModernTransportMessageContext;
  v19 = -[HMDModernTransportMessageContext init](&v57, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_message, a3);
    objc_msgSend(v16, "name");
    v21 = objc_claimAutoreleasedReturnValue();
    messageName = v20->_messageName;
    v20->_messageName = (NSString *)v21;

    v20->_messageType = objc_msgSend(v16, "type");
    objc_msgSend(v16, "identifier");
    v23 = objc_claimAutoreleasedReturnValue();
    messageID = v20->_messageID;
    v20->_messageID = (NSUUID *)v23;

    objc_msgSend(v16, "responseHandler");
    v25 = objc_claimAutoreleasedReturnValue();
    messageResponseHandler = v20->_messageResponseHandler;
    v20->_messageResponseHandler = (id)v25;

    objc_msgSend(v16, "timeout");
    v20->_messageTimeout = v27;
    objc_msgSend(v16, "identifier");
    v28 = objc_claimAutoreleasedReturnValue();
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v28;

    if (!objc_msgSend(v16, "type"))
    {
      v52 = v17;
      objc_msgSend(v16, "transactionIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = v30;
        v32 = v30;
        v33 = (HMDAssertionLogEvent *)v20->_identifier;
        v20->_identifier = v32;
      }
      else
      {
        context = (void *)MEMORY[0x227676638]();
        v46 = v20;
        HMFGetOSLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          HMFGetLogIdentifier();
          v50 = v46;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v59 = v48;
          _os_log_impl(&dword_2218F0000, v47, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Transaction ID should not be nil for a request message", buf, 0xCu);

          v46 = v50;
        }

        objc_autoreleasePoolPop(context);
        v33 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Transaction ID should not be nil for a request message"));
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "submitLogEvent:", v33);

        v31 = 0;
      }

      v17 = v52;
    }
    objc_msgSend(v16, "destination", v50);
    v34 = objc_claimAutoreleasedReturnValue();
    destination = v20->_destination;
    v20->_destination = (HMFMessageDestination *)v34;

    v20->_messageQualityOfService = objc_msgSend(v16, "qualityOfService");
    objc_storeStrong((id *)&v20->_options, a4);
    v36 = objc_msgSend(v18, "copy");
    completionHandler = v20->_completionHandler;
    v20->_completionHandler = (id)v36;

    objc_storeStrong((id *)&v20->_dateProvider, a6);
    objc_storeStrong((id *)&v20->_timerProvider, a7);
    objc_msgSend(v17, "transports");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "mutableCopy");
    remainingTransports = v20->_remainingTransports;
    v20->_remainingTransports = (NSMutableSet *)v39;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v41 = objc_claimAutoreleasedReturnValue();
    inProgressTransportToStartTimeMap = v20->_inProgressTransportToStartTimeMap;
    v20->_inProgressTransportToStartTimeMap = (NSMapTable *)v41;

    objc_storeStrong((id *)&v20->_activityFactory, a8);
    objc_storeStrong((id *)&v20->_logEventSubmitter, a9);
    -[HMDNetworkActivityWrapperFactory networkActivityWrapperWithLabel:](v20->_activityFactory, "networkActivityWrapperWithLabel:", 1);
    v43 = objc_claimAutoreleasedReturnValue();
    messageNetworkActivity = v20->_messageNetworkActivity;
    v20->_messageNetworkActivity = (HMDNetworkActivityWrapper *)v43;

  }
  return v20;
}

- (HMDModernTransportMessageContext)initWithMessage:(id)a3 options:(id)a4 completionHandler:(id)a5 dateProvider:(id)a6 timerProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  HMDModernTransportMessageContext *v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  +[HMDNetworkActivityWrapperFactory sharedInstance](HMDNetworkActivityWrapperFactory, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HMDModernTransportMessageContext initWithMessage:options:completionHandler:dateProvider:timerProvider:activityFactory:logEventSubmitter:](self, "initWithMessage:options:completionHandler:dateProvider:timerProvider:activityFactory:logEventSubmitter:", v16, v15, v14, v13, v12, v17, v18);

  return v19;
}

- (double)timeout
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double result;

  -[HMDModernTransportMessageContext options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeoutOverride");
  v5 = v4;

  if (v5 <= 0.0)
  {
    -[HMDModernTransportMessageContext messageTimeout](self, "messageTimeout");
  }
  else
  {
    -[HMDModernTransportMessageContext options](self, "options");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeoutOverride");
    v8 = v7;

    return v8;
  }
  return result;
}

- (BOOL)expectsResponse
{
  void *v2;
  BOOL v3;

  -[HMDModernTransportMessageContext messageResponseHandler](self, "messageResponseHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSSet)inProgressTransports
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[HMDModernTransportMessageContext inProgressTransportToStartTimeMap](self, "inProgressTransportToStartTimeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

- (void)startSendingOverTransport:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  void *v15;
  NSMapTable *inProgressTransportToStartTimeMap;
  void *v17;
  void *v18;
  HMDModernTransportMessageContext *v19;
  NSObject *v20;
  void *v21;
  HMDAssertionLogEvent *v22;
  void *v23;
  void *v24;
  HMDModernTransportMessageContext *v25;
  NSObject *v26;
  void *v27;
  HMDAssertionLogEvent *v28;
  void *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDModernTransportMessageContext options](self, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transports");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v21;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Invalid transport", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v18);
    v22 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Invalid transport"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "submitLogEvent:", v22);

  }
  if ((-[NSMutableSet containsObject:](self->_remainingTransports, "containsObject:", v4) & 1) == 0)
  {
    v24 = (void *)MEMORY[0x227676638]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v27;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Transport already started", (uint8_t *)&v30, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
    v28 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Transport already started"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "submitLogEvent:", v28);

  }
  -[HMDModernTransportMessageContext dateProvider](self, "dateProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  -[HMDModernTransportMessageContext messageNetworkActivity](self, "messageNetworkActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isActivated");

  if ((v12 & 1) == 0)
  {
    -[HMDModernTransportMessageContext messageNetworkActivity](self, "messageNetworkActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activate");

  }
  -[HMDModernTransportMessageContext requestStartTime](self, "requestStartTime");
  if (v14 < 2.22044605e-16)
    -[HMDModernTransportMessageContext setRequestStartTime:](self, "setRequestStartTime:", v10);
  -[HMDModernTransportMessageContext _activityForTransport:](self, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "isActivated") & 1) == 0)
    objc_msgSend(v15, "activate");
  -[NSMutableSet removeObject:](self->_remainingTransports, "removeObject:", v4);
  inProgressTransportToStartTimeMap = self->_inProgressTransportToStartTimeMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](inProgressTransportToStartTimeMap, "setObject:forKey:", v17, v4);

}

- (void)completeSendingOverTransport:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  HMDModernTransportMessageContext *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;
  HMDModernTransportMessageContext *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDModernTransportMessageContext *v36;
  NSObject *v37;
  void *v38;
  HMDAssertionLogEvent *v39;
  void *v40;
  void *v41;
  HMDModernTransportMessageContext *v42;
  NSObject *v43;
  void *v44;
  HMDAssertionLogEvent *v45;
  void *v46;
  int v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDModernTransportMessageContext options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transports");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v6);

  if ((v10 & 1) == 0)
  {
    v35 = (void *)MEMORY[0x227676638]();
    v36 = self;
    HMFGetOSLogHandle();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543362;
      v48 = v38;
      _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Invalid transport", (uint8_t *)&v47, 0xCu);

    }
    objc_autoreleasePoolPop(v35);
    v39 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Invalid transport"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "submitLogEvent:", v39);

  }
  -[HMDModernTransportMessageContext inProgressTransports](self, "inProgressTransports");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v6);

  if ((v12 & 1) == 0)
  {
    v41 = (void *)MEMORY[0x227676638]();
    v42 = self;
    HMFGetOSLogHandle();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543362;
      v48 = v44;
      _os_log_impl(&dword_2218F0000, v43, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Transport has not started", (uint8_t *)&v47, 0xCu);

    }
    objc_autoreleasePoolPop(v41);
    v45 = -[HMDAssertionLogEvent initWithReason:]([HMDAssertionLogEvent alloc], "initWithReason:", CFSTR("Transport has not started"));
    +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "submitLogEvent:", v45);

  }
  -[HMDModernTransportMessageContext dateProvider](self, "dateProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v15 = v14;
  -[NSMapTable objectForKey:](self->_inProgressTransportToStartTimeMap, "objectForKey:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  v19 = objc_msgSend(v6, "transportType");
  -[NSMapTable removeObjectForKey:](self->_inProgressTransportToStartTimeMap, "removeObjectForKey:", v6);
  if (v7)
  {
    -[HMDModernTransportMessageContext _activityForTransport:](self, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self;
    v22 = v20;
    v23 = v7;
LABEL_7:
    -[HMDModernTransportMessageContext _completeTransportActivity:txError:rxError:]((uint64_t)v21, v22, v23, 0);

    goto LABEL_8;
  }
  self->_didSucceedSending = 1;
  if (!-[HMDModernTransportMessageContext expectsResponse](self, "expectsResponse"))
  {
    -[HMDModernTransportMessageContext _activityForTransport:](self, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = self;
    v22 = v20;
    v23 = 0;
    goto LABEL_7;
  }
LABEL_8:
  if ((_DWORD)v19 != 6
    || (-[HMDModernTransportMessageContext options](self, "options"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        v25 = objc_msgSend(v24, "expectRapportSuccess"),
        v24,
        v25))
  {
    -[HMDModernTransportMessageContext logEventSubmitter](self, "logEventSubmitter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessageTxReportLogEvent txReportForTransport:latency:](HMDRemoteMessageTxReportLogEvent, "txReportForTransport:latency:", v19, v15 - v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "submitLogEvent:error:", v27, v7);

  }
  -[HMDModernTransportMessageContext completionHandler](self, "completionHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28
    && (!v7
     || !-[NSMutableSet count](self->_remainingTransports, "count")
     && !-[NSMapTable count](self->_inProgressTransportToStartTimeMap, "count")))
  {
    -[HMDModernTransportMessageContext completionHandler](self, "completionHandler");
    v29 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v29)[2](v29, v7);

    -[HMDModernTransportMessageContext setCompletionHandler:](self, "setCompletionHandler:", 0);
  }
  if (!-[NSMutableSet count](self->_remainingTransports, "count")
    && !-[NSMapTable count](self->_inProgressTransportToStartTimeMap, "count")
    || self->_didSucceedSending)
  {
    v30 = (void *)MEMORY[0x227676638]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDModernTransportMessageContext messageID](v31, "messageID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 138543618;
      v48 = v33;
      v49 = 2114;
      v50 = v34;
      _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ no longer needed, clearing message.", (uint8_t *)&v47, 0x16u);

    }
    objc_autoreleasePoolPop(v30);
    -[HMDModernTransportMessageContext setMessage:](v31, "setMessage:", 0);
  }

}

- (void)receivedResponseOverTransport:(id)a3 withError:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = -[HMDModernTransportMessageContextOptions expectsMultipleResponses](self->_options, "expectsMultipleResponses");
  if (!v6 || !v7)
  {
    -[HMDModernTransportMessageContext _activityForTransport:](self, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isActivated") & 1) == 0)
      objc_msgSend(v8, "activate");
    -[HMDModernTransportMessageContext _completeTransportActivity:txError:rxError:]((uint64_t)self, v8, 0, v6);

    if (!v6)
      ++self->_successfulResponseCount;
  }

}

- (id)preparedMessageWithTimeout:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  HMDRemoteMessage *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HMDRemoteMessage *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  void *v31;

  -[HMDModernTransportMessageContext message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDModernTransportMessageContext options](self, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "headers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = v10;

  v12 = (void *)MEMORY[0x24BDD16E0];
  -[HMDModernTransportMessageContext requestStartTime](self, "requestStartTime");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestStartTimeHeaderKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v14);

  objc_msgSend(v6, "timeToLive");
  if (v15 >= 2.22044605e-16)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeToLiveHeaderKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v17);

  }
  v31 = v6;
  v18 = [HMDRemoteMessage alloc];
  objc_msgSend(v5, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "qualityOfService");
  objc_msgSend(v5, "destination");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messagePayload");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v5, "type");
  LOBYTE(v30) = objc_msgSend(v5, "isSecure");
  v24 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:](v18, "initWithName:qualityOfService:destination:payload:headers:type:timeout:secure:restriction:sendOptions:", v19, v20, v21, v22, v11, v23, a3, v30, objc_msgSend(v5, "restriction"), objc_msgSend(v5, "sendOptions"));

  objc_msgSend(v5, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage setIdentifier:](v24, "setIdentifier:", v25);

  objc_msgSend(v5, "userInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage internal](v24, "internal");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setUserInfo:", v26);

  -[HMDRemoteMessage setResponseHandler:](v24, "setResponseHandler:", 0);
  objc_msgSend(v5, "transactionIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessage setTransactionIdentifier:](v24, "setTransactionIdentifier:", v28);

  if (!-[HMDRemoteMessage type](v24, "type"))
    -[HMDRemoteMessage setResponseRestriction:](v24, "setResponseRestriction:", -[HMDRemoteMessage restriction](v24, "restriction"));

  return v24;
}

- (double)timeoutRemaining
{
  double v3;
  double v4;
  double result;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[HMDModernTransportMessageContext timeout](self, "timeout");
  v4 = v3;
  result = 0.0;
  if (v4 >= 2.22044605e-16)
  {
    -[HMDModernTransportMessageContext requestStartTime](self, "requestStartTime", 0.0);
    if (v6 >= 2.22044605e-16)
    {
      -[HMDModernTransportMessageContext dateProvider](self, "dateProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSince1970");
      v9 = v8;
      -[HMDModernTransportMessageContext requestStartTime](self, "requestStartTime");
      v11 = v9 - v10;

      -[HMDModernTransportMessageContext timeout](self, "timeout");
      return v12 - v11;
    }
    else
    {
      -[HMDModernTransportMessageContext timeout](self, "timeout");
    }
  }
  return result;
}

- (void)startResponseTimerWithTimeInterval:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  -[HMDModernTransportMessageContext responseTimer](self, "responseTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[HMDModernTransportMessageContext setResponseCompletionBlock:](self, "setResponseCompletionBlock:", v8);
    -[HMDModernTransportMessageContext timerProvider](self, "timerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timerWithTimeInterval:options:", 0, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernTransportMessageContext setResponseTimer:](self, "setResponseTimer:", v11);

    -[HMDModernTransportMessageContext responseTimer](self, "responseTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[HMDModernTransportMessageContext responseTimer](self, "responseTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegateQueue:", v15);

    -[HMDModernTransportMessageContext responseTimer](self, "responseTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
}

- (void)startTransportFallbackTimerWithTimeInterval:(double)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  -[HMDModernTransportMessageContext fallbackTimer](self, "fallbackTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[HMDModernTransportMessageContext setFallbackCompletionBlock:](self, "setFallbackCompletionBlock:", v8);
    -[HMDModernTransportMessageContext timerProvider](self, "timerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timerWithTimeInterval:options:", 0, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDModernTransportMessageContext setFallbackTimer:](self, "setFallbackTimer:", v11);

    -[HMDModernTransportMessageContext fallbackTimer](self, "fallbackTimer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", self);

    -[HMDModernTransportMessageContext fallbackTimer](self, "fallbackTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegateQueue:", v15);

    -[HMDModernTransportMessageContext fallbackTimer](self, "fallbackTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
}

- (void)done
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
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
  _BOOL4 v23;
  _QWORD v24[7];
  _QWORD v25[8];

  v25[7] = *MEMORY[0x24BDAC8D0];
  -[HMDModernTransportMessageContext responseTimer](self, "responseTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  -[HMDModernTransportMessageContext setResponseTimer:](self, "setResponseTimer:", 0);
  -[HMDModernTransportMessageContext setResponseCompletionBlock:](self, "setResponseCompletionBlock:", 0);
  -[HMDModernTransportMessageContext fallbackTimer](self, "fallbackTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suspend");

  -[HMDModernTransportMessageContext setFallbackTimer:](self, "setFallbackTimer:", 0);
  -[HMDModernTransportMessageContext setFallbackCompletionBlock:](self, "setFallbackCompletionBlock:", 0);
  if (self->_didSucceedSending)
  {
    if (!-[HMDModernTransportMessageContext expectsResponse](self, "expectsResponse"))
    {
      v5 = 1;
      goto LABEL_7;
    }
    if (-[HMDModernTransportMessageContext expectsResponse](self, "expectsResponse"))
    {
      v5 = self->_successfulResponseCount != 0;
LABEL_7:
      v23 = v5;
      goto LABEL_8;
    }
  }
  v23 = 0;
LABEL_8:
  -[HMDModernTransportMessageContext dateProvider](self, "dateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;
  -[HMDModernTransportMessageContext requestStartTime](self, "requestStartTime");
  v10 = v8 - v9;

  v24[0] = CFSTR("remoteMessageName");
  -[HMDModernTransportMessageContext messageName](self, "messageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v24[1] = CFSTR("messageType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDModernTransportMessageContext messageType](self, "messageType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v12;
  v24[2] = CFSTR("messageCompletionTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v13;
  v24[3] = CFSTR("messageExpectsResponse");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDModernTransportMessageContext expectsResponse](self, "expectsResponse"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v14;
  v24[4] = CFSTR("messageTimedOut");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDModernTransportMessageContext didTimeout](self, "didTimeout"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v15;
  v24[5] = CFSTR("attemptedFallback");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HMDModernTransportMessageContext didFallback](self, "didFallback"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[5] = v16;
  v24[6] = CFSTR("numTransportsAttempted");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[HMDModernTransportMessageContext _attemptedTransports]((id *)&self->super.isa);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[6] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDModernTransportMessageContext messageNetworkActivity](self, "messageNetworkActivity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "submitMetrics:withName:", v20, CFSTR("modernTransportNetworkActivityMetrics"));

  -[HMDModernTransportMessageContext messageNetworkActivity](self, "messageNetworkActivity");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "completeWithSuccess:", v23);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void (**v8)(void);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(void);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDModernTransportMessageContext responseTimer](self, "responseTimer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[HMDModernTransportMessageContext responseCompletionBlock](self, "responseCompletionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!-[HMDModernTransportMessageContext successfulResponseCount](self, "successfulResponseCount"))
      {
        -[HMDModernTransportMessageContext setDidTimeout:](self, "setDidTimeout:", 1);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        -[HMDModernTransportMessageContext _attemptedTransports]((id *)&self->super.isa);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v20 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8, (_QWORD)v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDModernTransportMessageContext _activityForTransport:](self, v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDModernTransportMessageContext _completeTransportActivity:txError:rxError:]((uint64_t)self, v17, 0, v16);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          }
          while (v12);
        }

      }
      -[HMDModernTransportMessageContext responseCompletionBlock](self, "responseCompletionBlock", (_QWORD)v19);
      v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v18[2]();

      -[HMDModernTransportMessageContext setResponseCompletionBlock:](self, "setResponseCompletionBlock:", 0);
    }
    -[HMDModernTransportMessageContext setResponseTimer:](self, "setResponseTimer:", 0);
  }
  else
  {
    -[HMDModernTransportMessageContext fallbackTimer](self, "fallbackTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      -[HMDModernTransportMessageContext fallbackCompletionBlock](self, "fallbackCompletionBlock");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[HMDModernTransportMessageContext setDidFallback:](self, "setDidFallback:", 1);
        -[HMDModernTransportMessageContext fallbackCompletionBlock](self, "fallbackCompletionBlock");
        v8 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v8[2]();

        -[HMDModernTransportMessageContext setFallbackCompletionBlock:](self, "setFallbackCompletionBlock:", 0);
      }
      -[HMDModernTransportMessageContext setFallbackTimer:](self, "setFallbackTimer:", 0);
    }
  }

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)messageID
{
  return self->_messageID;
}

- (HMFMessageDestination)destination
{
  return self->_destination;
}

- (HMDModernTransportMessageContextOptions)options
{
  return self->_options;
}

- (NSSet)remainingTransports
{
  return &self->_remainingTransports->super;
}

- (BOOL)didSucceedSending
{
  return self->_didSucceedSending;
}

- (unint64_t)successfulResponseCount
{
  return self->_successfulResponseCount;
}

- (BOOL)didNotifyDeviceReachability
{
  return self->_didNotifyDeviceReachability;
}

- (void)setDidNotifyDeviceReachability:(BOOL)a3
{
  self->_didNotifyDeviceReachability = a3;
}

- (HMDNetworkActivityWrapper)messageNetworkActivity
{
  return self->_messageNetworkActivity;
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (HMDDateProvider)dateProvider
{
  return (HMDDateProvider *)objc_getProperty(self, a2, 80, 1);
}

- (HMDTimerProvider)timerProvider
{
  return (HMDTimerProvider *)objc_getProperty(self, a2, 88, 1);
}

- (HMDNetworkActivityWrapperFactory)activityFactory
{
  return (HMDNetworkActivityWrapperFactory *)objc_getProperty(self, a2, 96, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)didTimeout
{
  return self->_didTimeout;
}

- (void)setDidTimeout:(BOOL)a3
{
  self->_didTimeout = a3;
}

- (BOOL)didFallback
{
  return self->_didFallback;
}

- (void)setDidFallback:(BOOL)a3
{
  self->_didFallback = a3;
}

- (NSMapTable)inProgressTransportToStartTimeMap
{
  return self->_inProgressTransportToStartTimeMap;
}

- (HMFTimer)responseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 120, 1);
}

- (void)setResponseTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (id)responseCompletionBlock
{
  return objc_getProperty(self, a2, 128, 1);
}

- (void)setResponseCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (HMFTimer)fallbackTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFallbackTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (id)fallbackCompletionBlock
{
  return objc_getProperty(self, a2, 144, 1);
}

- (void)setFallbackCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (HMDRemoteMessage)message
{
  return (HMDRemoteMessage *)objc_getProperty(self, a2, 152, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSString)messageName
{
  return self->_messageName;
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (double)messageTimeout
{
  return self->_messageTimeout;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (id)messageResponseHandler
{
  return self->_messageResponseHandler;
}

- (int64_t)messageQualityOfService
{
  return self->_messageQualityOfService;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_messageResponseHandler, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_fallbackCompletionBlock, 0);
  objc_storeStrong((id *)&self->_fallbackTimer, 0);
  objc_storeStrong(&self->_responseCompletionBlock, 0);
  objc_storeStrong((id *)&self->_responseTimer, 0);
  objc_storeStrong((id *)&self->_inProgressTransportToStartTimeMap, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_activityFactory, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_messageNetworkActivity, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_remainingTransports, 0);
}

- (id)_attemptedTransports
{
  id *v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1[6], "transports");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v3, "minusSet:", v1[1]);
    v1 = (id *)objc_msgSend(v3, "copy");

  }
  return v1;
}

- (id)_activityForTransport:(id)a1
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    v3 = objc_msgSend(a2, "transportType");
    v4 = 3;
    if (v3 != 6)
      v4 = 0;
    if (v3 == 2)
      v5 = 2;
    else
      v5 = v4;
    objc_msgSend(v2, "messageNetworkActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "childActivityWithLabel:createIfNeeded:", v5, 1);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_completeTransportActivity:(void *)a3 txError:(void *)a4 rxError:
{
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (unint64_t)v9;
  if (a1)
  {
    if (v8)
    {
      v11 = objc_msgSend((id)v8, "code");
      objc_msgSend((id)v8, "domain");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
LABEL_4:
        v13 = objc_msgSend((id)v10, "code");
        objc_msgSend((id)v10, "domain");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_7:
        v18[0] = CFSTR("txErrorCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v15;
        v19[1] = v12;
        v18[1] = CFSTR("txErrorDomain");
        v18[2] = CFSTR("rxErrorCode");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[3] = CFSTR("rxErrorDomain");
        v19[2] = v16;
        v19[3] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "submitMetrics:withName:", v17, CFSTR("transportNetworkActivityMetrics"));
        objc_msgSend(v7, "completeWithSuccess:", (v8 | v10) == 0);

        goto LABEL_8;
      }
    }
    else
    {
      v11 = 0;
      v12 = CFSTR("None");
      if (v9)
        goto LABEL_4;
    }
    v13 = 0;
    v14 = CFSTR("None");
    goto LABEL_7;
  }
LABEL_8:

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_253976 != -1)
    dispatch_once(&logCategory__hmf_once_t6_253976, &__block_literal_global_253977);
  return (id)logCategory__hmf_once_v7_253978;
}

void __47__HMDModernTransportMessageContext_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_253978;
  logCategory__hmf_once_v7_253978 = v0;

}

@end
