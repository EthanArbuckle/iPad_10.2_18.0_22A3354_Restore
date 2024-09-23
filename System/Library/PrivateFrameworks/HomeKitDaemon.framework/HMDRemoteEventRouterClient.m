@implementation HMDRemoteEventRouterClient

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  id v29;
  HMDRemoteEventRouterClient *v30;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;

  v17 = a4;
  v18 = a11;
  v19 = a12;
  v37 = a10;
  v35 = a9;
  v36 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a3;
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("RemoteEventRouter.Client."), "stringByAppendingString:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_retainAutorelease(v25);
  v27 = objc_msgSend(v26, "UTF8String");
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __213__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle___block_invoke;
  v39[3] = &unk_24E7786F8;
  v40 = v17;
  v41 = v18;
  v42 = v19;
  v43 = v26;
  v34 = v26;
  v33 = v19;
  v32 = v18;
  v29 = v17;
  v30 = -[HMDRemoteEventRouterClient initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:](self, "initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:", v23, v29, v22, v21, v20, v36, v35, v37, v27, v28, v39);

  return v30;
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12 logCategory:(const char *)a13
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  HMDRemoteEventRouterClient *v27;
  id v29;
  id v30;
  id v31;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  const char *v39;

  v17 = a4;
  v18 = a11;
  v19 = a12;
  v30 = a10;
  v29 = a9;
  v20 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __225__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_logCategory___block_invoke;
  v35[3] = &unk_24E778720;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v39 = a13;
  v33 = v19;
  v31 = v18;
  v26 = v17;
  v27 = -[HMDRemoteEventRouterClient initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:](self, "initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:", v24, v26, v23, v22, v21, v20, v29, v30, a13, v25, v35);

  return v27;
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 storeReadHandle:(id)a11 storeWriteHandle:(id)a12 retryIntervalProvider:(id)a13 logCategory:(const char *)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  HMDRemoteEventRouterClient *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v36;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  const char *v43;

  v29 = a4;
  v18 = a11;
  v19 = a12;
  v20 = a13;
  v32 = a10;
  v30 = a9;
  v31 = a8;
  v21 = a7;
  v22 = a6;
  v23 = a5;
  v24 = a3;
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __247__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke;
  v38[3] = &unk_24E77A050;
  v39 = v29;
  v40 = v18;
  v41 = v19;
  v42 = v20;
  v43 = a14;
  v36 = v20;
  v34 = v19;
  v33 = v18;
  v26 = v29;
  v27 = -[HMDRemoteEventRouterClient initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:](self, "initWithMessageTargetUUID:queue:dataSource:messageDispatcher:notificationCenter:requestMessageName:updateMessageName:multiHopFetchResponseMessageName:logCategory:logEventSubmitter:eventRouterClientFactory:", v24, v26, v23, v22, v21, v31, v30, v32, a14, v25, v38);

  return v27;
}

- (HMDRemoteEventRouterClient)initWithMessageTargetUUID:(id)a3 queue:(id)a4 dataSource:(id)a5 messageDispatcher:(id)a6 notificationCenter:(id)a7 requestMessageName:(id)a8 updateMessageName:(id)a9 multiHopFetchResponseMessageName:(id)a10 logCategory:(const char *)a11 logEventSubmitter:(id)a12 eventRouterClientFactory:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD);
  HMDRemoteEventRouterClient *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  os_log_t v35;
  OS_os_log *logger;
  os_log_t v37;
  uint64_t v38;
  HMEMessageDatagramClient *eventRouterClient;
  void (**v41)(_QWORD);
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v43 = a4;
  v47 = a4;
  v19 = a5;
  v44 = a6;
  v20 = a6;
  v45 = a7;
  v21 = a7;
  v46 = a8;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v26 = (void (**)(_QWORD))a13;
  v49.receiver = self;
  v49.super_class = (Class)HMDRemoteEventRouterClient;
  v27 = -[HMDRemoteEventRouterClient init](&v49, sel_init);
  if (v27)
  {
    v41 = v26;
    v28 = v23;
    v29 = v22;
    v30 = v21;
    v31 = v20;
    v32 = v19;
    v33 = v25;
    v34 = v24;
    v35 = os_log_create("com.apple.HomeKitDaemon", a11);
    logger = v27->_logger;
    v27->_logger = (OS_os_log *)v35;

    v37 = v35;
    v24 = v34;
    v25 = v33;
    v19 = v32;
    v20 = v31;
    v21 = v30;
    v22 = v29;
    v23 = v28;
    v26 = v41;
    objc_storeStrong((id *)&v27->_logger, v37);
    objc_storeStrong((id *)&v27->_identifier, a3);
    objc_storeStrong((id *)&v27->_workQueue, v43);
    objc_storeWeak((id *)&v27->_dataSource, v19);
    objc_storeStrong((id *)&v27->_messageDispatcher, v44);
    objc_storeStrong((id *)&v27->_notificationCenter, v45);
    objc_storeStrong((id *)&v27->_requestMessageName, v46);
    objc_storeStrong((id *)&v27->_updateMessageName, a9);
    objc_storeStrong((id *)&v27->_multiHopFetchResponseMessageName, a10);
    v26[2](v26);
    v38 = objc_claimAutoreleasedReturnValue();
    eventRouterClient = v27->_eventRouterClient;
    v27->_eventRouterClient = (HMEMessageDatagramClient *)v38;

    -[HMEMessageDatagramClient setDelegate:](v27->_eventRouterClient, "setDelegate:", v27);
    -[HMEMessageDatagramClient setDataSource:](v27->_eventRouterClient, "setDataSource:", v27);
    v27->_isPrimaryResident = 0;
    objc_storeWeak((id *)&v27->_logEventSubmitter, v25);
    v27->_lock._os_unfair_lock_opaque = 0;
  }

  return v27;
}

- (BOOL)isPrimaryResident
{
  NSObject *v3;

  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_isPrimaryResident;
}

- (unint64_t)messageTransportRestriction
{
  return 8;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDRemoteEventRouterClient identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_registerForMessages:(id)a3
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
  NSObject *logger;
  void *v15;
  int v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDRemoteEventRouterClient messageDispatcher](self, "messageDispatcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterClient updateMessageName](self, "updateMessageName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerForMessage:receiver:policies:selector:", v9, self, v7, sel__handleUpdateMessage_);

  -[HMDRemoteEventRouterClient messageDispatcher](self, "messageDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterClient multiHopFetchResponseMessageName](self, "multiHopFetchResponseMessageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerForMessage:receiver:policies:selector:", v11, self, v7, sel__handleUpdateMessage_);

  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryResidentChangeMonitorForRouterClient:", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v13;
    _os_log_impl(&dword_2218F0000, logger, OS_LOG_TYPE_DEFAULT, "Registering for primary resident change notification %@", (uint8_t *)&v16, 0xCu);
  }
  -[HMDRemoteEventRouterClient notificationCenter](self, "notificationCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification_, CFSTR("HMDPrimaryResidentChangeMonitorConfirmedDeviceIdentifierChangeNotification"), v13);

}

- (void)handlePrimaryResidentConfirmedDeviceIdentifierChangeNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *logger;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl(&dword_2218F0000, logger, OS_LOG_TYPE_DEFAULT, "Received primary resident change notification %@", (uint8_t *)&v13, 0xCu);
  }
  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCurrentDevicePrimaryResident");
  if ((_DWORD)v8 != -[HMDRemoteEventRouterClient isPrimaryResident](self, "isPrimaryResident"))
  {
    v9 = self->_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x24BDD16E0];
      v11 = v9;
      objc_msgSend(v10, "numberWithBool:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "Primary resident status changed to %@", (uint8_t *)&v13, 0xCu);

    }
    self->_isPrimaryResident = v8;
  }

}

- (void)_handleUpdateMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDRemoteEventRouterClient *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  id v14;
  NSObject *logger;
  HMDRemoteEventRouterProtoServerMessage *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v9;
    v28 = 2112;
    v29 = v10;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling update message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v4, "dataForKey:", CFSTR("message.payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "BOOLForKey:", CFSTR("isFragmented"));
  if (!v11)
  {
    logger = v7->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2218F0000, logger, OS_LOG_TYPE_ERROR, "Did not find message payload.", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 27);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!v12)
  {
    v14 = v11;
    goto LABEL_12;
  }
  v25 = 0;
  -[HMDRemoteEventRouterClient _underlyingMessageDataFromFragmentMessageData:error:](v7, "_underlyingMessageDataFromFragmentMessageData:error:", v11, &v25);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v25;

  if (!v13)
  {
    v22 = v7->_logger;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "Unable to decode payload from fragment message.", buf, 2u);
      if (!v14)
        goto LABEL_23;
    }
    else if (!v14)
    {
LABEL_23:
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v23);

      v14 = 0;
      goto LABEL_20;
    }
LABEL_10:
    objc_msgSend(v4, "respondWithError:", v14);
    goto LABEL_20;
  }

  v14 = (id)v13;
LABEL_12:
  v16 = -[HMDRemoteEventRouterProtoServerMessage initWithData:]([HMDRemoteEventRouterProtoServerMessage alloc], "initWithData:", v14);
  if (-[HMDRemoteEventRouterProtoServerMessage hasMessage](v16, "hasMessage"))
  {
    switch(-[HMDRemoteEventRouterProtoServerMessage message](v16, "message"))
    {
      case 0:
        v17 = v7->_logger;
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        *(_WORD *)buf = 0;
        v18 = "Unable to find request type.";
        goto LABEL_30;
      case 1:
        -[HMDRemoteEventRouterProtoServerMessage updatedEvents](v16, "updatedEvents");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteEventRouterClient _handleUpdatedEventsRequest:originalMessage:](v7, "_handleUpdatedEventsRequest:originalMessage:", v21, v4);
        goto LABEL_19;
      case 2:
      case 3:
        goto LABEL_17;
      case 4:
        -[HMDRemoteEventRouterProtoServerMessage multiHopFetchEventsResponse](v16, "multiHopFetchEventsResponse");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDRemoteEventRouterClient _handleMultiHopFetchResponse:originalMessage:](v7, "_handleMultiHopFetchResponse:originalMessage:", v21, v4);
        goto LABEL_19;
      default:
        v24 = v7->_logger;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_2218F0000, v24, OS_LOG_TYPE_ERROR, "Received an unrecognized request type.", buf, 2u);
        }
        v19 = (void *)MEMORY[0x24BDD1540];
        v20 = -1;
        goto LABEL_18;
    }
  }
  v17 = v7->_logger;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v18 = "Decoded payload does not have request.";
LABEL_30:
    _os_log_error_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
  }
LABEL_17:
  v19 = (void *)MEMORY[0x24BDD1540];
  v20 = 3;
LABEL_18:
  objc_msgSend(v19, "hmErrorWithCode:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondWithError:", v21);
LABEL_19:

LABEL_20:
}

- (void)_handleUpdatedEventsRequest:(id)a3 originalMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  OS_os_log *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *logger;
  void *v22;
  void *v23;
  OS_os_log *v24;
  _QWORD *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD *v34;
  _QWORD v35[5];
  NSObject *v36;
  _QWORD *v37;
  _QWORD v38[5];
  NSObject *v39;
  _QWORD *v40;
  _QWORD v41[5];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  objc_msgSend(v7, "remoteSourceDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__24212;
  v41[4] = __Block_byref_object_dispose__24213;
  v42 = 0;
  v11 = dispatch_group_create();
  v12 = objc_msgSend(v6, "eventsCount");
  v13 = MEMORY[0x24BDAC760];
  v14 = (_QWORD *)&unk_22269F000;
  if (v12)
  {
    objc_msgSend(v6, "events");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "na_map:", &__block_literal_global_26_24214);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && objc_msgSend(v16, "count"))
    {
      v17 = self->_logger;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "dataForKey:", CFSTR("message.payload"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v19, "length"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v16;
        v45 = 2112;
        v46 = v20;
        _os_log_impl(&dword_2218F0000, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Received update events request %@, payloadSize: %@", buf, 0x16u);

        v14 = &unk_22269F000;
      }

      logger = self->_logger;
      if (os_signpost_enabled(logger))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v10;
        _os_signpost_emit_with_name_impl(&dword_2218F0000, logger, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterClientHandleUpdatedEvents", "serverIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
      }
      dispatch_group_enter(v11);
      v38[0] = v13;
      v38[1] = v14[398];
      v38[2] = __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_28;
      v38[3] = &unk_24E795E08;
      v38[4] = self;
      v40 = v41;
      v39 = v11;
      -[HMDRemoteEventRouterClient _handleEventUpdateMessage:fromServer:events:completion:](self, "_handleEventUpdateMessage:fromServer:events:completion:", v7, v10, v16, v38);

    }
  }
  if (objc_msgSend(v6, "cachedEventsCount"))
  {
    objc_msgSend(v6, "cachedEvents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "na_map:", &__block_literal_global_30_24218);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && objc_msgSend(v23, "count"))
    {
      v24 = self->_logger;
      if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v14;
        v26 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v7, "dataForKey:", CFSTR("message.payload"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v27, "length"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v44 = v23;
        v45 = 2112;
        v46 = v28;
        _os_log_impl(&dword_2218F0000, (os_log_t)v24, OS_LOG_TYPE_DEFAULT, "Received cached events request %@, payloadSize: %@", buf, 0x16u);

        v14 = v25;
        v13 = MEMORY[0x24BDAC760];

      }
      v29 = self->_logger;
      if (os_signpost_enabled(v29))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v10;
        _os_signpost_emit_with_name_impl(&dword_2218F0000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterClientHandleCachedEvents", "serverIdentifier=%{signpost.description:attribute}@ ", buf, 0xCu);
      }
      dispatch_group_enter(v11);
      v35[0] = v13;
      v35[1] = v14[398];
      v35[2] = __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_31;
      v35[3] = &unk_24E795E08;
      v35[4] = self;
      v37 = v41;
      v36 = v11;
      -[HMDRemoteEventRouterClient _handleCachedEventMessage:fromServer:events:completion:](self, "_handleCachedEventMessage:fromServer:events:completion:", v7, v10, v23, v35);

    }
  }
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v30 = objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  v32[1] = v14[398];
  v32[2] = __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_2_32;
  v32[3] = &unk_24E79B698;
  v33 = v7;
  v34 = v41;
  v31 = v7;
  dispatch_group_notify(v11, v30, v32);

  _Block_object_dispose(v41, 8);
}

- (void)_handleEventUpdateMessage:(id)a3 fromServer:(id)a4 events:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didReceiveMessageWithEvents:serverIdentifier:completion:", v10, v11, v9);

}

- (void)_handleCachedEventMessage:(id)a3 fromServer:(id)a4 events:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  -[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didReceiveMessageWithCachedEvents:serverIdentifier:completion:", v10, v11, v9);

}

- (void)_handleMultiHopFetchResponse:(id)a3 originalMessage:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  id v19;
  void *v20;
  void *v21;
  HMDRemoteEventRouterClient *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteSourceDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "routerClientPrimaryResidentDeviceIdentifier:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "hmf_isEqualToUUID:", v12) & 1) != 0)
  {
    if (objc_msgSend(v6, "changedEventsCount"))
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = (void *)MEMORY[0x24BE4ED88];
      objc_msgSend(v6, "changedEvents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eventsMapFromProtoEvents:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "didReceiveFetchResponseWithCachedEvents:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __75__HMDRemoteEventRouterClient__handleMultiHopFetchResponse_originalMessage___block_invoke;
      v26[3] = &unk_24E7787C8;
      v19 = v18;
      v27 = v19;
      objc_msgSend(v16, "na_filter:", v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "count"))
        objc_msgSend(v9, "client:didReceiveFetchedCachedEvents:", self, v20);

      objc_autoreleasePoolPop(v13);
    }
    objc_msgSend(v7, "respondWithSuccess");
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
      v29 = v24;
      v30 = 2112;
      v31 = v11;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Received fetch response from non-primary: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2037);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithError:", v25);

  }
}

- (id)_underlyingMessageDataFromFragmentMessageData:(id)a3 error:(id *)a4
{
  id v6;
  HMDRemoteEventRouterProtoFragmentedMessage *v7;
  HMDRemoteEventRouterProtoFragmentedMessage *v8;
  void *v9;
  void *v10;
  NSObject *logger;
  uint8_t v13[16];

  v6 = a3;
  v7 = -[HMDRemoteEventRouterProtoFragmentedMessage initWithData:]([HMDRemoteEventRouterProtoFragmentedMessage alloc], "initWithData:", v6);
  v8 = v7;
  if (v7)
  {
    if (-[HMDRemoteEventRouterProtoFragmentedMessage fragmentNumber](v7, "fragmentNumber")
      || -[HMDRemoteEventRouterProtoFragmentedMessage totalFragments](v8, "totalFragments") != 1)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_2218F0000, logger, OS_LOG_TYPE_ERROR, "Cannot decode fragmented data yet.", v13, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = (void *)MEMORY[0x227676638]();
      -[HMDRemoteEventRouterProtoFragmentedMessage fragmentData](v8, "fragmentData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v9);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)clientIsEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)client:(id)a3 upstreamTopicsForTopic:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[HMDRemoteEventRouterClient messageTargetUUID](self, "messageTargetUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDHomeEventsGenerated upstreamHomeTopicForTopic:homeUUID:](HMDHomeEventsGenerated, "upstreamHomeTopicForTopic:homeUUID:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)client:(id)a3 forwardingTopicsForTopics:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "client:forwardingTopicsForTopics:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)client:(id)a3 isConnectionTerminatingError:(id)a4
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  int v11;

  v4 = a4;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD5BD8]);

  if (!v6)
  {
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE3EBB0]);

    if (v9
      || (objc_msgSend(v4, "domain"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE4ED68]),
          v10,
          v11)
      && objc_msgSend(v4, "code") != 4
      && objc_msgSend(v4, "code") != 1)
    {
      objc_msgSend(v4, "code");
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v4, "code") == 2
    || objc_msgSend(v4, "code") == 27
    || objc_msgSend(v4, "code") == 3
    || objc_msgSend(v4, "code") != 54 && objc_msgSend(v4, "code") != 78)
  {
LABEL_13:
    v7 = 1;
    goto LABEL_14;
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterClient sendChangeRegistrationsMessageWithAddedFilters:removedFilters:client:completion:](self, "sendChangeRegistrationsMessageWithAddedFilters:removedFilters:client:completion:", v10, v9, v11, v8);

}

- (void)sendChangeRegistrationsMessageWithAddedFilters:(id)a3 removedFilters:(id)a4 client:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  HMDRemoteEventRouterProtoMessage *v14;
  void *v15;
  void *v16;
  HMDRemoteEventRouterProtoChangeRegistrationsMessage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoMessage setIdentifier:](v14, "setIdentifier:", v16);

  v17 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsMessage);
  -[HMDRemoteEventRouterProtoMessage setChangeRegistrations:](v14, "setChangeRegistrations:", v17);

  v18 = (void *)objc_msgSend(v13, "mutableCopy");
  -[HMDRemoteEventRouterProtoMessage changeRegistrations](v14, "changeRegistrations");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTopicFilterAdditions:", v18);

  v20 = (void *)objc_msgSend(v12, "mutableCopy");
  -[HMDRemoteEventRouterProtoMessage changeRegistrations](v14, "changeRegistrations");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTopicFilterRemovals:", v20);

  -[HMDRemoteEventRouterProtoMessage data](v14, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __110__HMDRemoteEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_client_completion___block_invoke;
  v25[3] = &unk_24E7787F0;
  v25[4] = self;
  v26 = v11;
  v23 = v11;
  v24 = -[HMDRemoteEventRouterClient sendMessageWithPayloadMessage:client:messageType:completion:](self, "sendMessageWithPayloadMessage:client:messageType:completion:", v22, v10, 3, v25);

}

- (void)client:(id)a3 sendChangeRegistrationsWithAddedFilters:(id)a4 removedFilters:(id)a5 completion:(id)a6
{
  -[HMDRemoteEventRouterClient sendChangeRegistrationsMessageWithAddedFilters:removedFilters:client:completion:](self, "sendChangeRegistrationsMessageWithAddedFilters:removedFilters:client:completion:", a4, a5, a3, a6);
}

- (id)client:(id)a3 sendConnectWithAddedFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDRemoteEventRouterProtoMessage *v11;
  void *v12;
  void *v13;
  HMDRemoteEventRouterProtoConnectMessage *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[5];
  id v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoMessage setIdentifier:](v11, "setIdentifier:", v13);

  v14 = objc_alloc_init(HMDRemoteEventRouterProtoConnectMessage);
  -[HMDRemoteEventRouterProtoConnectMessage setRouterVersion:](v14, "setRouterVersion:", 0);
  v15 = (void *)objc_msgSend(v9, "mutableCopy");

  -[HMDRemoteEventRouterProtoConnectMessage setTopicFilterAdditions:](v14, "setTopicFilterAdditions:", v15);
  -[HMDRemoteEventRouterProtoMessage setConnect:](v11, "setConnect:", v14);
  -[HMDRemoteEventRouterProtoMessage data](v11, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __76__HMDRemoteEventRouterClient_client_sendConnectWithAddedFilters_completion___block_invoke;
  v20[3] = &unk_24E7787F0;
  v20[4] = self;
  v21 = v8;
  v17 = v8;
  -[HMDRemoteEventRouterClient sendMessageWithPayloadMessage:client:messageType:completion:](self, "sendMessageWithPayloadMessage:client:messageType:completion:", v16, v10, 1, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)sendKeepAliveForClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDRemoteEventRouterProtoMessage *v8;
  void *v9;
  void *v10;
  HMDRemoteEventRouterProtoKeepAliveMessage *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoMessage setIdentifier:](v8, "setIdentifier:", v10);

  v11 = objc_alloc_init(HMDRemoteEventRouterProtoKeepAliveMessage);
  -[HMDRemoteEventRouterProtoMessage setKeepAlive:](v8, "setKeepAlive:", v11);

  -[HMDRemoteEventRouterProtoMessage data](v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__HMDRemoteEventRouterClient_sendKeepAliveForClient_completion___block_invoke;
  v15[3] = &unk_24E778818;
  v16 = v7;
  v13 = v7;
  v14 = -[HMDRemoteEventRouterClient sendMessageWithPayloadMessage:client:messageType:completion:](self, "sendMessageWithPayloadMessage:client:messageType:completion:", v12, v6, 2, v15);

}

- (void)sendDisconnectForClient:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  HMDRemoteEventRouterProtoMessage *v8;
  void *v9;
  void *v10;
  HMDRemoteEventRouterProtoDisconnectMessage *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoMessage setIdentifier:](v8, "setIdentifier:", v10);

  v11 = objc_alloc_init(HMDRemoteEventRouterProtoDisconnectMessage);
  -[HMDRemoteEventRouterProtoMessage setDisconnect:](v8, "setDisconnect:", v11);

  -[HMDRemoteEventRouterProtoMessage data](v8, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __65__HMDRemoteEventRouterClient_sendDisconnectForClient_completion___block_invoke;
  v15[3] = &unk_24E778818;
  v16 = v7;
  v13 = v7;
  v14 = -[HMDRemoteEventRouterClient sendMessageWithPayloadMessage:client:messageType:completion:](self, "sendMessageWithPayloadMessage:client:messageType:completion:", v12, v6, 4, v15);

}

- (void)client:(id)a3 fetchWithFilters:(id)a4 isMultiHop:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  HMDRemoteEventRouterProtoMessage *v14;
  void *v15;
  void *v16;
  HMDRemoteEventRouterProtoFetchEventsMessage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v12 = a4;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v14 = objc_alloc_init(HMDRemoteEventRouterProtoMessage);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterProtoMessage setIdentifier:](v14, "setIdentifier:", v16);

  v17 = objc_alloc_init(HMDRemoteEventRouterProtoFetchEventsMessage);
  -[HMDRemoteEventRouterProtoMessage setFetchEvents:](v14, "setFetchEvents:", v17);

  -[HMDRemoteEventRouterProtoMessage fetchEvents](v14, "fetchEvents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFetchType:", v7);

  objc_msgSend(v12, "na_map:", &__block_literal_global_52);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v19, "mutableCopy");
  -[HMDRemoteEventRouterProtoMessage fetchEvents](v14, "fetchEvents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTopics:", v20);

  -[HMDRemoteEventRouterProtoMessage data](v14, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_2;
  v26[3] = &unk_24E778880;
  v26[4] = self;
  v27 = v10;
  v28 = v11;
  v23 = v11;
  v24 = v10;
  v25 = -[HMDRemoteEventRouterClient sendMessageWithPayloadMessage:client:messageType:completion:](self, "sendMessageWithPayloadMessage:client:messageType:completion:", v22, v24, 1, v26);

}

- (void)clientDidConnect:(id)a3 serverIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *logger;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_2218F0000, logger, OS_LOG_TYPE_DEFAULT, "Client did connect to server %@", buf, 0xCu);
  }
  if (!-[HMDRemoteEventRouterClient isConnected](self, "isConnected"))
  {
    -[HMDRemoteEventRouterClient notificationCenter](self, "notificationCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterClient identifier](self, "identifier", CFSTR("HMDRemoteEventRouterClientHomeUUIDKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("HMDRemoteEventRouterClientDidConnect"), self, v10);

  }
  -[HMDRemoteEventRouterClient setIsConnected:](self, "setIsConnected:", 1);
  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "client:connectionStatusDidChange:", self, -[HMDRemoteEventRouterClient isConnected](self, "isConnected"));

}

- (void)clientDidDisconnect:(id)a3
{
  NSObject *v4;
  NSObject *logger;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2218F0000, logger, OS_LOG_TYPE_DEFAULT, "Client disconnected from server", v10, 2u);
  }
  if (-[HMDRemoteEventRouterClient isConnected](self, "isConnected"))
  {
    -[HMDRemoteEventRouterClient notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = CFSTR("HMDRemoteEventRouterClientHomeUUIDKey");
    -[HMDRemoteEventRouterClient identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("HMDRemoteEventRouterClientDidDisconnect"), self, v8);

  }
  -[HMDRemoteEventRouterClient setIsConnected:](self, "setIsConnected:", 0);
  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "client:connectionStatusDidChange:", self, -[HMDRemoteEventRouterClient isConnected](self, "isConnected"));

}

- (id)sendMessageWithPayloadMessage:(id)a3 client:(id)a4 messageType:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *logger;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v12, "routerClientMessageDestination:serverIdentifier:", self, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  v15 = v14;
  if (!v13 || !v14)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v15;
      _os_log_error_impl(&dword_2218F0000, logger, OS_LOG_TYPE_ERROR, "Did not find resident destination for server identifier %@.", buf, 0xCu);
      if (!v10)
        goto LABEL_7;
    }
    else if (!v10)
    {
LABEL_7:
      v16 = 0;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v18);

    goto LABEL_7;
  }
  -[HMDRemoteEventRouterClient sendMessageWithPayloadMessage:messageType:destination:serverIdentifier:completion:](self, "sendMessageWithPayloadMessage:messageType:destination:serverIdentifier:completion:", v9, a5, v13, v14, v10);
  v16 = v15;
LABEL_8:

  return v16;
}

- (void)sendMessageWithPayloadMessage:(id)a3 messageType:(int64_t)a4 destination:(id)a5 serverIdentifier:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HMDRemoteEventRouterProtoFragmentedMessage *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  -[HMDRemoteEventRouterClient dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "routerClientSupportsFragmentMessageForServerIdentifier:", v13))
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = objc_alloc_init(HMDRemoteEventRouterProtoFragmentedMessage);
    -[HMDRemoteEventRouterProtoFragmentedMessage setFragmentNumber:](v17, "setFragmentNumber:", 0);
    -[HMDRemoteEventRouterProtoFragmentedMessage setFragmentData:](v17, "setFragmentData:", v11);
    -[HMDRemoteEventRouterProtoFragmentedMessage setTotalFragments:](v17, "setTotalFragments:", 1);
    -[HMDRemoteEventRouterProtoFragmentedMessage fragmentData](v17, "fragmentData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDRemoteEventRouterProtoFragmentedMessage setTotalSize:](v17, "setTotalSize:", objc_msgSend(v18, "length"));

    -[HMDRemoteEventRouterProtoFragmentedMessage setRouterVersion:](v17, "setRouterVersion:", 0);
    -[HMDRemoteEventRouterProtoFragmentedMessage data](v17, "data");
    v19 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v16);
    v11 = (id)v19;
  }
  -[HMDRemoteEventRouterClient requestMessageName](self, "requestMessageName", a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = CFSTR("message.payload");
  v21 = (void *)objc_msgSend(v11, "copy");
  v29[1] = CFSTR("isFragmented");
  v30[0] = v21;
  v30[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:restriction:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:restriction:", v20, -1, v12, v22, -[HMDRemoteEventRouterClient messageTransportRestriction](self, "messageTransportRestriction"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "identifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterClient responseHandlerForMessageIdentifier:serverIdentifier:messageType:completion:](self, "responseHandlerForMessageIdentifier:serverIdentifier:messageType:completion:", v24, v13, v28, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setResponseHandler:", v25);

  -[HMDRemoteEventRouterClient messageDispatcher](self, "messageDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "sendMessage:", v23);

}

- (id)responseHandlerForMessageIdentifier:(id)a3 serverIdentifier:(id)a4 messageType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke;
  v18[3] = &unk_24E7788A8;
  objc_copyWeak(v22, &location);
  v22[1] = (id)a5;
  v20 = v11;
  v21 = v12;
  v19 = v10;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  v16 = _Block_copy(v18);

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  return v16;
}

- (void)configureIsPrimaryResident:(BOOL)a3 networkAvailable:(BOOL)a4 additionalPolicies:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSObject *logger;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v5 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v10 = logger;
    HMFBooleanToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "Configuring isPrimaryResident: %@, networkAvailable: %@", (uint8_t *)&v13, 0x16u);

  }
  self->_isPrimaryResident = a3;
  -[HMDRemoteEventRouterClient setIsNetworkAvailable:](self, "setIsNetworkAvailable:", v5);
  -[HMDRemoteEventRouterClient _registerForMessages:](self, "_registerForMessages:", v8);

}

- (void)networkAvailabilityDidChange:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__HMDRemoteEventRouterClient_networkAvailabilityDidChange___block_invoke;
  v6[3] = &unk_24E7968C8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)didChangeHasForegroundClient:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__HMDRemoteEventRouterClient_didChangeHasForegroundClient___block_invoke;
  v6[3] = &unk_24E7968C8;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)didChangeFetchAvailableCondition:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMDRemoteEventRouterClient workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__HMDRemoteEventRouterClient_didChangeFetchAvailableCondition___block_invoke;
  v6[3] = &unk_24E7968C8;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (id)dumpStateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterClient messageTargetUUID](self, "messageTargetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteEventRouterClient eventRouterClient](self, "eventRouterClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dumpStateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMDRemoteEventRouterClient primary: %@, messageTarget: %@, client: %@]"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)requestMessageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)updateMessageName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)multiHopFetchResponseMessageName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isNetworkAvailable
{
  return self->_isNetworkAvailable;
}

- (void)setIsNetworkAvailable:(BOOL)a3
{
  self->_isNetworkAvailable = a3;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_loadWeakRetained((id *)&self->_logEventSubmitter);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 88, 1);
}

- (HMDRemoteEventRouterClientDataSource)dataSource
{
  return (HMDRemoteEventRouterClientDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMEMessageDatagramClient)eventRouterClient
{
  return (HMEMessageDatagramClient *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventRouterClient, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_logEventSubmitter);
  objc_storeStrong((id *)&self->_multiHopFetchResponseMessageName, 0);
  objc_storeStrong((id *)&self->_updateMessageName, 0);
  objc_storeStrong((id *)&self->_requestMessageName, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __63__HMDRemoteEventRouterClient_didChangeFetchAvailableCondition___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1;
  else
    v1 = 2;
  objc_msgSend(*(id *)(a1 + 32), "eventRouterClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDormantFetchCondition:completion:", v1, &__block_literal_global_60);

}

void __59__HMDRemoteEventRouterClient_didChangeHasForegroundClient___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  if (*(_BYTE *)(a1 + 40))
    v1 = 1;
  else
    v1 = 2;
  objc_msgSend(*(id *)(a1 + 32), "eventRouterClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateConnectionMode:completion:", v1, &__block_literal_global_59);

}

void __59__HMDRemoteEventRouterClient_networkAvailabilityDidChange___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isNetworkAvailable");
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 != v2)
  {
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[1];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      HMFBooleanToString();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "Network availability changed to %@", (uint8_t *)&v11, 0xCu);

      v3 = *(unsigned __int8 *)(a1 + 40);
      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "setIsNetworkAvailable:", v3 != 0);
    v3 = *(unsigned __int8 *)(a1 + 40);
  }
  if (v3)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "eventRouterClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "clientIsEnabled:", v9);

    if ((_DWORD)v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "eventRouterClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "connectionCapabilityDidChange");

    }
  }
}

void __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke_2;
    block[3] = &unk_24E791498;
    block[4] = v8;
    v13 = v5;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 64);
    v14 = v10;
    v18 = v11;
    v15 = v6;
    v17 = *(id *)(a1 + 48);
    v16 = *(id *)(a1 + 40);
    dispatch_async(v9, block);

  }
}

void __106__HMDRemoteEventRouterClient_responseHandlerForMessageIdentifier_serverIdentifier_messageType_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 8), OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v21 = v17;
      v22 = 2112;
      v23 = v3;
      _os_log_error_impl(&dword_2218F0000, v5, OS_LOG_TYPE_ERROR, "Failed to send message: %@ error: %@", buf, 0x16u);
    }
    if (*(_QWORD *)(a1 + 80) == 1)
      objc_msgSend(v2, "client:connectDidFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 8), OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 48);
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "Successfully sent message: %@", buf, 0xCu);
  }
  if (objc_msgSend(v3, "isHMError") && objc_msgSend(v3, "code") == 3202)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Event router message rejected by remote due to it being non-primary, kicking primary discovery", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v2, "discoverPrimaryResidentForEventRouterClient:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 56), "hmf_dataForKey:", CFSTR("message.payload"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (objc_msgSend(*(id *)(a1 + 56), "hmf_BOOLForKey:", CFSTR("isFragmented")) && v11)
  {
    v13 = *(void **)(a1 + 32);
    v19 = 0;
    objc_msgSend(v13, "_underlyingMessageDataFromFragmentMessageData:error:", v11, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v19;

    if (!v14 || v12)
    {
      v15 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        if (!v12)
          goto LABEL_21;
        goto LABEL_19;
      }
      v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v21 = v18;
      _os_log_error_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "Unable to decode fragment payload with error: %@", buf, 0xCu);
      if (v12)
      {
LABEL_19:
        v12 = v12;

        v3 = v12;
      }
    }
  }
  else
  {
    v14 = v11;
  }
LABEL_21:
  v16 = *(_QWORD *)(a1 + 72);
  if (v16)
    (*(void (**)(uint64_t, _QWORD, void *, id))(v16 + 16))(v16, *(_QWORD *)(a1 + 64), v14, v3);

}

void __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDRemoteEventRouterProtoFetchEventsResponse *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x227676638]();
  v11 = (void *)MEMORY[0x24BDBD1B8];
  if (v8 && !v9)
  {
    v12 = -[HMDRemoteEventRouterProtoFetchEventsResponse initWithData:]([HMDRemoteEventRouterProtoFetchEventsResponse alloc], "initWithData:", v8);
    if (v12)
    {
      v9 = 0;
    }
    else
    {
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "Did not find fetch response", buf, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v34 = v10;
    if (-[HMDRemoteEventRouterProtoFetchEventsResponse changedEventsCount](v12, "changedEventsCount"))
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)MEMORY[0x24BDD16E0];
        v16 = v14;
        objc_msgSend(v15, "numberWithUnsignedInteger:", -[HMDRemoteEventRouterProtoFetchEventsResponse changedEventsCount](v12, "changedEventsCount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v17;
        v39 = 2112;
        v40 = (uint64_t)v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "Received %@ events in fetch response of size %@", buf, 0x16u);

      }
      v19 = (void *)MEMORY[0x24BE4ED88];
      -[HMDRemoteEventRouterProtoFetchEventsResponse changedEvents](v12, "changedEvents", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "eventsMapFromProtoEvents:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = (void *)MEMORY[0x24BDBD1B8];
    }
    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v21, "count");
      *(_DWORD *)buf = 138543618;
      v38 = v25;
      v39 = 2048;
      v40 = v26;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch got topics %ld", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v22);
    v27 = (void *)MEMORY[0x227676638]();
    v28 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v38 = v30;
      v39 = 2112;
      v40 = (uint64_t)v21;
      _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Fetch got topics %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    objc_msgSend(*(id *)(a1 + 40), "didReceiveFetchResponseWithCachedEvents:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_55;
    v35[3] = &unk_24E7787C8;
    v32 = v31;
    v36 = v32;
    objc_msgSend(v21, "na_filter:", v35);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "dataSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "client:didReceiveFetchedCachedEvents:", *(_QWORD *)(a1 + 32), v11);

    }
    v10 = v34;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  objc_autoreleasePoolPop(v10);
}

uint64_t __76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke_55(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

HMDRemoteEventRouterProtoTopic *__76__HMDRemoteEventRouterClient_client_fetchWithFilters_isMultiHop_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMDRemoteEventRouterProtoTopic *v3;

  v2 = a2;
  v3 = objc_alloc_init(HMDRemoteEventRouterProtoTopic);
  -[HMDRemoteEventRouterProtoTopic setTopic:](v3, "setTopic:", v2);

  return v3;
}

uint64_t __65__HMDRemoteEventRouterClient_sendDisconnectForClient_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__HMDRemoteEventRouterClient_sendKeepAliveForClient_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__HMDRemoteEventRouterClient_client_sendConnectWithAddedFilters_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  HMDRemoteEventRouterProtoConnectResponse *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = (void *)MEMORY[0x24BDBD1B8];
  if (v8 && !v9)
  {
    v12 = -[HMDRemoteEventRouterProtoConnectResponse initWithData:]([HMDRemoteEventRouterProtoConnectResponse alloc], "initWithData:", v8);
    if (v12)
    {
      v10 = 0;
    }
    else
    {
      v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "Did not find connect response", (uint8_t *)&v22, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[HMDRemoteEventRouterProtoConnectResponse cachedEventsCount](v12, "cachedEventsCount"))
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)MEMORY[0x24BDD16E0];
        v16 = v14;
        objc_msgSend(v15, "numberWithUnsignedInteger:", -[HMDRemoteEventRouterProtoConnectResponse cachedEventsCount](v12, "cachedEventsCount"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "length"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEFAULT, "Received %@ events in connect response of size %@", (uint8_t *)&v22, 0x16u);

      }
      v19 = (void *)MEMORY[0x24BE4ED88];
      -[HMDRemoteEventRouterProtoConnectResponse cachedEvents](v12, "cachedEvents");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "eventsMapFromProtoEvents:", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v7)
    {
      if (!v10)
      {
        v21 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        if (os_signpost_enabled(v21))
        {
          v22 = 138412290;
          v23 = v7;
          _os_signpost_emit_with_name_impl(&dword_2218F0000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EventRouterClientConnected", "serverIdentifier=%{signpost.description:attribute}@ ", (uint8_t *)&v22, 0xCu);
        }
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __110__HMDRemoteEventRouterClient_sendChangeRegistrationsMessageWithAddedFilters_removedFilters_client_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDRemoteEventRouterProtoChangeRegistrationsResponse *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x24BDBD1B8];
  if (v6 && !v7)
  {
    v10 = -[HMDRemoteEventRouterProtoChangeRegistrationsResponse initWithData:]([HMDRemoteEventRouterProtoChangeRegistrationsResponse alloc], "initWithData:", v6);
    if (v10)
    {
      v8 = 0;
    }
    else
    {
      v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "Did not find change registrations response", (uint8_t *)&v19, 2u);
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[HMDRemoteEventRouterProtoChangeRegistrationsResponse cachedEventsCount](v10, "cachedEventsCount"))
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = (void *)MEMORY[0x24BDD16E0];
        v14 = v12;
        objc_msgSend(v13, "numberWithUnsignedInteger:", -[HMDRemoteEventRouterProtoChangeRegistrationsResponse cachedEventsCount](v10, "cachedEventsCount"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412546;
        v20 = v15;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEFAULT, "Received %@ events in change registrations response of size %@", (uint8_t *)&v19, 0x16u);

      }
      v17 = (void *)MEMORY[0x24BE4ED88];
      -[HMDRemoteEventRouterProtoChangeRegistrationsResponse cachedEvents](v10, "cachedEvents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventsMapFromProtoEvents:", v18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __75__HMDRemoteEventRouterClient__handleMultiHopFetchResponse_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_28(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 20);
  os_unfair_lock_lock_with_options();
  if (v8)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v5 + 40);
    v6 = (id *)(v5 + 40);
    if (!v7)
      objc_storeStrong(v6, a2);
  }
  os_unfair_lock_unlock(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_31(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v4 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 20);
  os_unfair_lock_lock_with_options();
  if (v8)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(_QWORD *)(v5 + 40);
    v6 = (id *)(v5 + 40);
    if (!v7)
      objc_storeStrong(v6, a2);
  }
  os_unfair_lock_unlock(v4);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_2_32(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = a1 + 32;
  v1 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 8) + 8) + 40))
    return objc_msgSend(v1, "respondWithError:");
  else
    return objc_msgSend(v1, "respondWithSuccess");
}

uint64_t __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE4ED88], "fromProtobuff:", a2);
}

uint64_t __74__HMDRemoteEventRouterClient__handleUpdatedEventsRequest_originalMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BE4ED88], "fromProtobuff:", a2);
}

HMDRemoteEventRouterClient *__247__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_retryIntervalProvider_logCategory___block_invoke(_QWORD *a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:](HMDRemoteEventRouterClient, "routerClientWithQueue:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:", a1[4], a1[5], a1[6], a1[7], a1[8]);
}

HMDRemoteEventRouterClient *__225__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle_logCategory___block_invoke(_QWORD *a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:storeReadHandle:storeWriteHandle:logCategory:](HMDRemoteEventRouterClient, "routerClientWithQueue:storeReadHandle:storeWriteHandle:logCategory:", a1[4], a1[5], a1[6], a1[7]);
}

HMDRemoteEventRouterClient *__213__HMDRemoteEventRouterClient_initWithMessageTargetUUID_queue_dataSource_messageDispatcher_notificationCenter_requestMessageName_updateMessageName_multiHopFetchResponseMessageName_storeReadHandle_storeWriteHandle___block_invoke(uint64_t a1)
{
  return +[HMDRemoteEventRouterClient routerClientWithQueue:storeReadHandle:storeWriteHandle:logCategory:](HMDRemoteEventRouterClient, "routerClientWithQueue:storeReadHandle:storeWriteHandle:logCategory:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "UTF8String"));
}

+ (id)routerClientWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 retryIntervalProvider:(id)a6 logCategory:(const char *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMDEventRouterTimerProvider *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(HMDEventRouterTimerProvider);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4EDA8]), "initWithQueue:timerProvider:keepAliveInterval:dormantFetchTimerInterval:retryIntervalProvider:storeReadHandle:storeWriteHandle:logCategory:", v14, v15, v11, v13, v12, a7, 420.0, 28800.0);

  return v16;
}

+ (id)routerClientWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logCategory:(const char *)a6
{
  id v10;
  id v11;
  id v12;
  HMDRemoteEventRouterClientRetryIntervals *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(HMDRemoteEventRouterClientRetryIntervals);
  objc_msgSend(a1, "routerClientWithQueue:storeReadHandle:storeWriteHandle:retryIntervalProvider:logCategory:", v12, v11, v10, v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_24252 != -1)
    dispatch_once(&logCategory__hmf_once_t0_24252, &__block_literal_global_24253);
  return (id)logCategory__hmf_once_v1_24254;
}

void __41__HMDRemoteEventRouterClient_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_24254;
  logCategory__hmf_once_v1_24254 = v0;

}

@end
