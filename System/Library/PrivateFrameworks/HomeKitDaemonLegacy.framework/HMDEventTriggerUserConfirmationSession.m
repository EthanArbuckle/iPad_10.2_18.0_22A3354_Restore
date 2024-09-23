@implementation HMDEventTriggerUserConfirmationSession

- (HMDEventTriggerUserConfirmationSession)initWithSessionID:(id)a3 eventTrigger:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6 requestingDevice:(id)a7
{
  id v13;
  HMDEventTriggerUserConfirmationSession *v14;
  HMDEventTriggerUserConfirmationSession *v15;
  uint64_t v16;
  NSMutableArray *analyticsSendEvents;
  objc_super v19;

  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HMDEventTriggerUserConfirmationSession;
  v14 = -[HMDEventTriggerSession initWithSessionID:eventTrigger:workQueue:msgDispatcher:](&v19, sel_initWithSessionID_eventTrigger_workQueue_msgDispatcher_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_requestingDevice, a7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_claimAutoreleasedReturnValue();
    analyticsSendEvents = v15->_analyticsSendEvents;
    v15->_analyticsSendEvents = (NSMutableArray *)v16;

  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventTriggerUserConfirmationSession analyticsEvent](self, "analyticsEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "submitLogEvent:", v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDEventTriggerUserConfirmationSession analyticsSendEvents](self, "analyticsSendEvents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "submitLogEvent:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)HMDEventTriggerUserConfirmationSession;
  -[HMDEventTriggerSession dealloc](&v12, sel_dealloc);
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDEventTriggerSession msgDispatcher](self, "msgDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForMessage:receiver:policies:selector:", CFSTR("kEventTriggerUserPermissionRemoveDialogKey"), self, v8, sel__handleUserPermissionRemoveDialogRequest_);

  -[HMDEventTriggerSession msgDispatcher](self, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", CFSTR("kEventTriggerUserPermissionResponseKey"), self, v11, sel__handleUserPermissionRemoteResponse_);

}

- (void)askForUserPermission:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__HMDEventTriggerUserConfirmationSession_askForUserPermission___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_askForUserPermissionFromDevice:(id)a3 executionSessionID:(id)a4
{
  id v6;
  HomeKitEventTriggerUserConfirmationSendLogEvent *v7;
  void *v8;
  void *v9;
  HomeKitEventTriggerUserConfirmationSendLogEvent *v10;
  uint64_t v11;
  HomeKitEventTriggerUserConfirmationSendLogEvent *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDEventTriggerUserConfirmationSession *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HMDEventTriggerUserConfirmationSession *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD aBlock[4];
  HomeKitEventTriggerUserConfirmationSendLogEvent *v31;
  id v32;
  id v33;
  id location;
  const __CFString *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = [HomeKitEventTriggerUserConfirmationSendLogEvent alloc];
    -[HMDEventTriggerSession sessionID](self, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HomeKitEventTriggerUserConfirmationSendLogEvent initWithSessionID:](v7, "initWithSessionID:", v9);

    -[HMDEventTriggerUserConfirmationSession analyticsSendEvents](self, "analyticsSendEvents");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "addObject:", v10);

    v35 = CFSTR("kEventTriggerExecutionSessionIdentifierKey");
    v36 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __93__HMDEventTriggerUserConfirmationSession__askForUserPermissionFromDevice_executionSessionID___block_invoke;
    aBlock[3] = &unk_1E89C1698;
    objc_copyWeak(&v33, &location);
    v12 = v10;
    v31 = v12;
    v13 = v29;
    v32 = v13;
    v14 = _Block_copy(aBlock);
    objc_msgSend(v13, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = -[HMDEventTriggerSession sendMessage:payload:device:target:responseHandler:](self, "sendMessage:payload:device:target:responseHandler:", CFSTR("kEventTriggerUserPermissionRequestKey"), v28, v15, v17, v14);

    if ((v11 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v21;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Cannot find the compatible resident to send the permission request, marking it as failure", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      -[HMDEventTriggerUserConfirmationSession executionSession](v19, "executionSession");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "userResponse:device:completionHandler:", 4, v13, 0);

      -[HomeKitEventTriggerUserConfirmationSendLogEvent analyticsData](v12, "analyticsData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setResultErrorCode:", 3007);

    }
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  else
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = self;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v27;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_ERROR, "%{public}@Cannot ask for permission without execution session identifier", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)createBulletinNotification
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HMDEventTriggerUserConfirmationSession_createBulletinNotification__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_createBulletinNotification
{
  void *v3;
  HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent *v4;
  void *v5;
  void *v6;
  HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent *v7;
  void *v8;
  id v9;
  HMDTriggerConfirmationTimer *v10;
  void *v11;
  HMDTriggerConfirmationTimer *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDEventTriggerUserConfirmationSession *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent alloc];
    -[HMDEventTriggerSession sessionID](self, "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent initWithSessionID:](v4, "initWithSessionID:", v6);
    -[HMDEventTriggerUserConfirmationSession setAnalyticsEvent:](self, "setAnalyticsEvent:", v7);

    +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v8, "insertBulletinForSecureTrigger:", v3);

    v10 = [HMDTriggerConfirmationTimer alloc];
    -[HMDEventTriggerSession sessionID](self, "sessionID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HMDTriggerConfirmationTimer initWithExecutionSessionID:timeoutInterval:](v10, "initWithExecutionSessionID:timeoutInterval:", v11, (double)(unint64_t)bulletinSecureTriggerTimeoutInSeconds);
    -[HMDEventTriggerUserConfirmationSession setUserResponseTimer:](self, "setUserResponseTimer:", v12);

    -[HMDEventTriggerUserConfirmationSession userResponseTimer](self, "userResponseTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[HMDEventTriggerUserConfirmationSession userResponseTimer](self, "userResponseTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resume");

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Not creating a bulletin because event trigger is nil", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDEventTriggerUserConfirmationSession *v9;

  v4 = a3;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMDEventTriggerUserConfirmationSession_timerDidFire___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)userDidConfirmExecute:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[HMDEventTriggerSession workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__HMDEventTriggerUserConfirmationSession_userDidConfirmExecute_completionHandler___block_invoke;
  block[3] = &unk_1E89B6038;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_userResponse:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  HMDEventTriggerUserConfirmationSession *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  HMDEventTriggerUserConfirmationSession *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  HMDEventTriggerUserConfirmationSession *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  _QWORD aBlock[4];
  id v47;
  id v48;
  id location;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    HMDUserConfirmationResponseAsString(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    v54 = 2112;
    v55 = v11;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Bulletin notification response ended with %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  if (a3 - 2 >= 2)
  {
    if (a3 == 1)
    {
      -[HMDEventTriggerUserConfirmationSession analyticsEvent](v8, "analyticsEvent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "analyticsData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setResultErrorCode:", 3000);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D33490], "currentTime");
    v13 = v12;
    -[HMDEventTriggerUserConfirmationSession analyticsEvent](v8, "analyticsEvent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startTime");
    v16 = v15;
    -[HMDEventTriggerUserConfirmationSession analyticsEvent](v8, "analyticsEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "analyticsData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setUserResponseDelay:", (unint64_t)((v13 - v16) / 1000.0));

    v19 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0CB37E8];
      -[HMDEventTriggerUserConfirmationSession analyticsEvent](v8, "analyticsEvent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "analyticsData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "numberWithUnsignedLongLong:", objc_msgSend(v24, "userResponseDelay"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v21;
      v54 = 2112;
      v55 = v25;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@self.metricEvent.metric.userResponseDelay %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v19);
  }
  -[HMDEventTriggerUserConfirmationSession requestingDevice](v8, "requestingDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isCurrentDevice");

  if (v29)
  {
    v30 = (void *)MEMORY[0x1D17BA0A0]();
    v31 = v8;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v33;
      _os_log_impl(&dword_1CD062000, v32, OS_LOG_TYPE_INFO, "%{public}@Issuing trigger reponse to local execution session", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
    -[HMDEventTriggerUserConfirmationSession executionSession](v31, "executionSession");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventTriggerUserConfirmationSession requestingDevice](v31, "requestingDevice");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "userResponse:device:completionHandler:", a3, v35, v6);

  }
  else
  {
    v50[0] = CFSTR("kEventTriggerExecutionSessionIdentifierKey");
    -[HMDEventTriggerSession sessionID](v8, "sessionID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "UUIDString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = CFSTR("kEventTriggerUserPermissionKey");
    v51[0] = v37;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v51[1] = v38;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v8);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__HMDEventTriggerUserConfirmationSession__userResponse_completionHandler___block_invoke;
    aBlock[3] = &unk_1E89C1B70;
    objc_copyWeak(&v48, &location);
    v39 = v6;
    v47 = v39;
    v40 = _Block_copy(aBlock);
    if (!-[HMDEventTriggerSession sendResidentMessage:payload:responseHandler:](v8, "sendResidentMessage:payload:responseHandler:", CFSTR("kEventTriggerUserPermissionResponseKey"), v34, v40))
    {
      v41 = (void *)MEMORY[0x1D17BA0A0]();
      v42 = v8;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v53 = v44;
        _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@Could not find compatible resident, Cannot send response", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v41);
      if (v39)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v39 + 2))(v39, v45);

      }
      -[HMDEventTriggerUserConfirmationSession _sessionComplete](v42, "_sessionComplete");
    }

    objc_destroyWeak(&v48);
    objc_destroyWeak(&location);
  }

  -[HMDEventTriggerUserConfirmationSession setUserResponseTimer:](v8, "setUserResponseTimer:", 0);
}

- (void)_handleUserPermissionRemoteResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMDEventTriggerUserConfirmationSession *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDEventTriggerDevice *v13;
  void *v14;
  void *v15;
  HMDEventTriggerDevice *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("kEventTriggerUserPermissionKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  objc_msgSend(v4, "remoteSourceDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMDUserConfirmationResponseAsString(v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Received response %@ from the device %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = [HMDEventTriggerDevice alloc];
  -[HMDEventTriggerSession eventTrigger](v9, "eventTrigger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMDEventTriggerDevice initWithDevice:forHome:](v13, "initWithDevice:forHome:", v7, v15);

  -[HMDEventTriggerUserConfirmationSession executionSession](v9, "executionSession");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__HMDEventTriggerUserConfirmationSession__handleUserPermissionRemoteResponse___block_invoke;
  v19[3] = &unk_1E89C2350;
  v20 = v4;
  v18 = v4;
  objc_msgSend(v17, "userResponse:device:completionHandler:", v6, v16, v19);

}

- (void)_removeUserDialog:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDEventTriggerUserConfirmationSession *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v21;
    *(_QWORD *)&v6 = 138543618;
    v19 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isCurrentDevice", v19, (_QWORD)v20) & 1) != 0)
        {
          +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDEventTriggerSession eventTrigger](self, "eventTrigger");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeBulletinsForTrigger:", v14);

        }
        else
        {
          v15 = (void *)MEMORY[0x1D17BA0A0]();
          v16 = self;
          HMFGetOSLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v19;
            v25 = v18;
            v26 = 2112;
            v27 = v10;
            _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending the remove dialog message to %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v15);
          objc_msgSend(v10, "device");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDEventTriggerSession sendMessage:payload:device:responseHandler:](v16, "sendMessage:payload:device:responseHandler:", CFSTR("kEventTriggerUserPermissionRemoveDialogKey"), 0, v11, 0);
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }

}

- (void)_handleUserPermissionRemoveDialogRequest:(id)a3
{
  id v4;
  void *v5;
  HMDEventTriggerUserConfirmationSession *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Received user confirmation remove dialog request", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDEventTriggerUserConfirmationSession _sessionComplete](v6, "_sessionComplete");
  objc_msgSend(v4, "respondWithPayload:", 0);

}

- (void)_sessionComplete
{
  void *v3;
  HMDEventTriggerUserConfirmationSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Declaring session is complete", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDEventTriggerSession eventTrigger](v4, "eventTrigger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetExecutionState");

}

- (HMDEventTriggerExecutionSession)executionSession
{
  return (HMDEventTriggerExecutionSession *)objc_loadWeakRetained((id *)&self->_executionSession);
}

- (void)setExecutionSession:(id)a3
{
  objc_storeWeak((id *)&self->_executionSession, a3);
}

- (HMDEventTriggerDevice)requestingDevice
{
  return self->_requestingDevice;
}

- (HMDTriggerConfirmationTimer)userResponseTimer
{
  return self->_userResponseTimer;
}

- (void)setUserResponseTimer:(id)a3
{
  objc_storeStrong((id *)&self->_userResponseTimer, a3);
}

- (HomeKitEventTriggerUserConfirmationReceiverSessionLogEvent)analyticsEvent
{
  return self->_analyticsEvent;
}

- (void)setAnalyticsEvent:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsEvent, a3);
}

- (NSMutableArray)analyticsSendEvents
{
  return self->_analyticsSendEvents;
}

- (void)setAnalyticsSendEvents:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsSendEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsSendEvents, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_userResponseTimer, 0);
  objc_storeStrong((id *)&self->_requestingDevice, 0);
  objc_destroyWeak((id *)&self->_executionSession);
}

void __78__HMDEventTriggerUserConfirmationSession__handleUserPermissionRemoteResponse___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v4)[2](v4, v5, 0);

  }
}

void __74__HMDEventTriggerUserConfirmationSession__userResponse_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = WeakRetained;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v11;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Sending user permission response resulted with error %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v5);
  objc_msgSend(v9, "_sessionComplete");

}

uint64_t __82__HMDEventTriggerUserConfirmationSession_userDidConfirmExecute_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 2;
  else
    v1 = 3;
  return objc_msgSend(*(id *)(a1 + 32), "_userResponse:completionHandler:", v1, *(_QWORD *)(a1 + 40));
}

void __55__HMDEventTriggerUserConfirmationSession_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "userResponseTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((_DWORD)v2)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
    v5 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@User did not respond to confirm trigger execution", (uint8_t *)&v8, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 40), "_userResponse:completionHandler:", 1, 0);
    objc_msgSend(*(id *)(a1 + 40), "setUserResponseTimer:", 0);
  }
}

uint64_t __68__HMDEventTriggerUserConfirmationSession_createBulletinNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createBulletinNotification");
}

void __93__HMDEventTriggerUserConfirmationSession__askForUserPermissionFromDevice_executionSessionID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = objc_msgSend(v5, "code");
  objc_msgSend(*(id *)(a1 + 32), "analyticsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResultErrorCode:", v8);

  if (v5)
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = WeakRetained;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Received error for user permission request: %@, marking user permission as denied", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(v11, "executionSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "userResponse:device:completionHandler:", 4, *(_QWORD *)(a1 + 40), 0);

  }
}

void __63__HMDEventTriggerUserConfirmationSession_askForUserPermission___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "executionSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "isCurrentDevice");
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v9)
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543362;
        v18 = v10;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@This device owns the trigger, asking the permission locally", (uint8_t *)&v17, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "_createBulletinNotification");
    }
    else
    {
      if (v9)
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v16;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@This device does not own the trigger, asking the permission with the device %@", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "_askForUserPermissionFromDevice:executionSessionID:", *(_QWORD *)(a1 + 40), v4);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_ERROR, "%{public}@Confirmation session is missing associated execution session identifier", (uint8_t *)&v17, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_128369 != -1)
    dispatch_once(&logCategory__hmf_once_t0_128369, &__block_literal_global_128370);
  return (id)logCategory__hmf_once_v1_128371;
}

void __53__HMDEventTriggerUserConfirmationSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_128371;
  logCategory__hmf_once_v1_128371 = v0;

}

@end
