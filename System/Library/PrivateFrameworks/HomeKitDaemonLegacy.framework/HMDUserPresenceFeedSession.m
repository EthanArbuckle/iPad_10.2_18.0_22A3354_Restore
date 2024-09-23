@implementation HMDUserPresenceFeedSession

- (HMDUserPresenceFeedSession)initWithDelegate:(id)a3 workQueue:(id)a4 targetUUID:(id)a5 messageDispatcher:(id)a6 user:(id)a7 presenceAuthStatus:(id)a8 presenceComputeStatus:(id)a9 presenceRegionStatus:(id)a10 reason:(id)a11
{
  id v17;
  id v18;
  id v19;
  HMDUserPresenceFeedSession *v20;
  uint64_t v21;
  NSUUID *sessionID;
  uint64_t v23;
  void *v24;
  id v25;
  HMDUserPresenceFeedRetryTimer *v26;
  HMDUserPresenceFeedRetryTimer *statusUpdateRetryTimer;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSString *logIdentifierString;
  id obj;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;

  v17 = a3;
  v41 = a4;
  v40 = a5;
  v39 = a6;
  obj = a7;
  v18 = a7;
  v38 = a8;
  v37 = a9;
  v36 = a10;
  v19 = a11;
  v42.receiver = self;
  v42.super_class = (Class)HMDUserPresenceFeedSession;
  v20 = -[HMDUserPresenceFeedSession init](&v42, sel_init);
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    sessionID = v20->_sessionID;
    v20->_sessionID = (NSUUID *)v21;

    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v20->_workQueue, a4);
    objc_storeStrong((id *)&v20->_targetUUID, a5);
    objc_storeStrong((id *)&v20->_messageDispatcher, a6);
    objc_storeStrong((id *)&v20->_user, obj);
    objc_storeStrong((id *)&v20->_presenceAuthStatus, a8);
    objc_storeStrong((id *)&v20->_presenceComputeStatus, a9);
    objc_storeStrong((id *)&v20->_presenceRegionStatus, a10);
    objc_storeStrong((id *)&v20->_reason, a11);
    v23 = objc_msgSend(v19, "value");
    if (v23 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v25 = v19;
    objc_storeStrong((id *)&v20->_statusChangeDate, v24);
    if (v23 == 2)

    v26 = objc_alloc_init(HMDUserPresenceFeedRetryTimer);
    statusUpdateRetryTimer = v20->_statusUpdateRetryTimer;
    v20->_statusUpdateRetryTimer = v26;

    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "home");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "name");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v20->_sessionID, "UUIDString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%@/%@"), v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    logIdentifierString = v20->_logIdentifierString;
    v20->_logIdentifierString = (NSString *)v32;

    v19 = v25;
  }

  return v20;
}

- (void)dealloc
{
  void *v3;
  HMDUserPresenceFeedSession *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeedSession sessionID](v4, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating session %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  v9.receiver = v4;
  v9.super_class = (Class)HMDUserPresenceFeedSession;
  -[HMDUserPresenceFeedSession dealloc](&v9, sel_dealloc);
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserPresenceFeedSession sessionID](self, "sessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("SID"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserPresenceFeedSession presenceAuthStatus](self, "presenceAuthStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("PAS"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserPresenceFeedSession presenceRegionStatus](self, "presenceRegionStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("PRS"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserPresenceFeedSession reason](self, "reason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("RSN"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDUserPresenceFeedSession statusUpdateRetryTimer](self, "statusUpdateRetryTimer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("RT"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)send
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDUserPresenceFeedSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__HMDUserPresenceFeedSession_send__block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_send
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  HMDUserPresenceFeedSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDUserPresenceFeedSession *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  HMDUserPresenceFeedSession *v30;
  NSObject *v31;
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
  HMDUserPresenceFeedSession *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDUserPresenceFeedSession *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  HMDUserPresenceFeedSession *v57;
  NSObject *v58;
  void *v59;
  HMDRemoteDeviceMessageDestination *v60;
  void *v61;
  HMDRemoteDeviceMessageDestination *v62;
  void *v63;
  void *v64;
  void *v65;
  HMDUserPresenceFeedSession *v66;
  NSObject *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  HMDRemoteDeviceMessageDestination *v73;
  void *v74;
  void *v75;
  id v76;
  void *context;
  id v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  id v83;
  id location;
  uint8_t buf[4];
  id v86;
  __int16 v87;
  id v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  -[HMDUserPresenceFeedSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserPresenceFeedSession user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "residentDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryResidentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HMDLostModeManager sharedManager](HMDLostModeManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLost");

    if (v10)
    {
      v11 = (void *)MEMORY[0x1D17BA0A0]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v86 = v14;
        _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Device Lost. Not sending presence update", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserPresenceFeedSession _handleStatusUpdateMessageError:responseTime:](v12, "_handleStatusUpdateMessageError:responseTime:", v15, 0.0);

    }
    else
    {
      -[HMDUserPresenceFeedSession presenceAuthStatus](self, "presenceAuthStatus");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HMDUserPresenceFeedSession reason](self, "reason");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "value");

        if (v22 == 2)
        {
          -[HMDUserPresenceFeedSession statusChangeDate](self, "statusChangeDate");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserPresenceFeedSession statusChangeDate](self, "statusChangeDate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timeIntervalSinceDate:", v25);
            v27 = v26;

            if (v27 > 120.0)
            {
              +[HMDUserPresenceUpdateReason reasonWithValue:](HMDUserPresenceUpdateReason, "reasonWithValue:", 6);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[HMDUserPresenceFeedSession setReason:](self, "setReason:", v28);

              v29 = (void *)MEMORY[0x1D17BA0A0]();
              v30 = self;
              HMFGetOSLogHandle();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[HMDUserPresenceFeedSession reason](v30, "reason");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v86 = v32;
                v87 = 2112;
                v88 = v33;
                _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Resetting the reason to %@ as it is well past the validity period", buf, 0x16u);

              }
              objc_autoreleasePoolPop(v29);
            }
          }
        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPresenceFeedSession user](self, "user");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "uuid");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "UUIDString");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, CFSTR("kUserPresenceUserKey"));

        v38 = (void *)MEMORY[0x1E0CB37E8];
        -[HMDUserPresenceFeedSession presenceAuthStatus](self, "presenceAuthStatus");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "value"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v40, CFSTR("kUserPresenceAuthStatusKey"));

        -[HMDUserPresenceFeedSession presenceAuthStatus](self, "presenceAuthStatus");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addToPayload:", v34);

        -[HMDUserPresenceFeedSession presenceRegionStatus](self, "presenceRegionStatus");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addToPayload:", v34);

        -[HMDUserPresenceFeedSession reason](self, "reason");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addToPayload:", v34);

        if (objc_msgSend(v8, "isCurrentDevice"))
        {
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = self;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v86 = v47;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@This device is the resident device itself", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v44);
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDUserPresenceFeedSession delegate](v45, "delegate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "postNotificationName:object:userInfo:", CFSTR("HMDUserPresenceUpdateLocalNotification"), v49, v34);

          -[HMDUserPresenceFeedSession _callDelegate](v45, "_callDelegate");
        }
        else
        {
          if ((objc_msgSend(v7, "isReachable") & 1) != 0)
          {
            v55 = -1;
          }
          else
          {
            v56 = (void *)MEMORY[0x1D17BA0A0]();
            v57 = self;
            HMFGetOSLogHandle();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v86 = v59;
              v87 = 2112;
              v88 = v7;
              _os_log_impl(&dword_1CD062000, v58, OS_LOG_TYPE_INFO, "%{public}@Restricting message to local transports as the primary resident is likely not reachable over IDS: %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v56);
            v55 = 14;
          }
          v60 = [HMDRemoteDeviceMessageDestination alloc];
          -[HMDUserPresenceFeedSession targetUUID](self, "targetUUID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v60, "initWithTarget:device:", v61, v8);

          v63 = (void *)objc_msgSend(v34, "copy");
          +[HMDRemoteMessage secureMessageWithName:qualityOfService:destination:messagePayload:restriction:](HMDRemoteMessage, "secureMessageWithName:qualityOfService:destination:messagePayload:restriction:", CFSTR("kRemoteUpdateUserPresenceNotificationKey"), 17, v62, v63, v55);
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, self);
          v80[0] = MEMORY[0x1E0C809B0];
          v80[1] = 3221225472;
          v80[2] = __35__HMDUserPresenceFeedSession__send__block_invoke;
          v80[3] = &unk_1E89C1698;
          objc_copyWeak(&v83, &location);
          v78 = v65;
          v81 = v78;
          v76 = v64;
          v82 = v76;
          context = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v79, "setResponseHandler:", v80));
          v66 = self;
          HMFGetOSLogHandle();
          v67 = (id)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
          {
            v73 = v62;
            HMFGetLogIdentifier();
            v68 = (id)objc_claimAutoreleasedReturnValue();
            -[HMDUserPresenceFeedSession presenceAuthStatus](v66, "presenceAuthStatus");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserPresenceFeedSession presenceRegionStatus](v66, "presenceRegionStatus");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserPresenceFeedSession reason](v66, "reason");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDUserPresenceFeedSession user](v66, "user");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "uuid");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544898;
            v86 = v68;
            v87 = 2114;
            v88 = v78;
            v89 = 2112;
            v90 = v8;
            v91 = 2114;
            v92 = v75;
            v93 = 2114;
            v94 = v74;
            v95 = 2114;
            v96 = v69;
            v97 = 2114;
            v98 = v71;
            _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@Sending message with identifier %{public}@ to inform presence status to resident: [%@], with : auth: %{public}@, region: %{public}@, reason: %{public}@, UUID: %{public}@", buf, 0x48u);

            v62 = v73;
          }

          objc_autoreleasePoolPop(context);
          -[HMDUserPresenceFeedSession messageDispatcher](v66, "messageDispatcher");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "sendMessage:completionHandler:", v79, 0);

          objc_destroyWeak(&v83);
          objc_destroyWeak(&location);

        }
      }
      else
      {
        v50 = (void *)MEMORY[0x1D17BA0A0]();
        v51 = self;
        HMFGetOSLogHandle();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v86 = v53;
          _os_log_impl(&dword_1CD062000, v52, OS_LOG_TYPE_INFO, "%{public}@Presence authorization is nil, cannot send report.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v50);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserPresenceFeedSession _handleStatusUpdateMessageError:responseTime:](v51, "_handleStatusUpdateMessageError:responseTime:", v54, 0.0);

      }
    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v86 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@No HMDDevice found for HMDResidenceDevice. Not sending the presence update.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
  }

}

- (void)_handleStatusUpdateMessageError:(id)a3 responseTime:(double)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDUserPresenceFeedSession workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (a3)
  {
    -[HMDUserPresenceFeedSession statusUpdateRetryTimer](self, "statusUpdateRetryTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRetryCount:", objc_msgSend(v8, "retryCount") + 1);

    -[HMDUserPresenceFeedSession statusUpdateRetryTimer](self, "statusUpdateRetryTimer");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDUserPresenceFeedSession workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startWithDelegate:delegateQueue:responseTime:", self, v9, a4);

  }
  else
  {
    -[HMDUserPresenceFeedSession _callDelegate](self, "_callDelegate");
  }
}

- (void)_callDelegate
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDUserPresenceFeedSession workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDUserPresenceFeedSession delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFAA8A40))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "didEndFeedSession:", self);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  HMDUserPresenceFeedSession *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDUserPresenceFeedSession workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDUserPresenceFeedSession statusUpdateRetryTimer](self, "statusUpdateRetryTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retryTimer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v4)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Retrying to send the report to the resident", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDUserPresenceFeedSession _send](v9, "_send");
  }

}

- (HMDUserPresenceFeedSessionDelegate)delegate
{
  return (HMDUserPresenceFeedSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSUUID)targetUUID
{
  return self->_targetUUID;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return self->_messageDispatcher;
}

- (HMDUser)user
{
  return self->_user;
}

- (HMUserPresenceAuthorization)presenceAuthStatus
{
  return self->_presenceAuthStatus;
}

- (HMUserPresenceCompute)presenceComputeStatus
{
  return self->_presenceComputeStatus;
}

- (HMDUserPresenceRegion)presenceRegionStatus
{
  return self->_presenceRegionStatus;
}

- (HMDUserPresenceUpdateReason)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (NSDate)statusChangeDate
{
  return self->_statusChangeDate;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (HMDUserPresenceFeedRetryTimer)statusUpdateRetryTimer
{
  return self->_statusUpdateRetryTimer;
}

- (void)setStatusUpdateRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusUpdateRetryTimer, a3);
}

- (NSString)logIdentifierString
{
  return self->_logIdentifierString;
}

- (void)setLogIdentifierString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifierString, 0);
  objc_storeStrong((id *)&self->_statusUpdateRetryTimer, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_statusChangeDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_presenceRegionStatus, 0);
  objc_storeStrong((id *)&self->_presenceComputeStatus, 0);
  objc_storeStrong((id *)&self->_presenceAuthStatus, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_targetUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __35__HMDUserPresenceFeedSession__send__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = WeakRetained;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v9, "presenceAuthStatus");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presenceRegionStatus");
      v24 = v5;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reason");
      v23 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "user");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v22 = v8;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      v29 = v11;
      v30 = 2114;
      v31 = v21;
      v32 = 2114;
      v33 = v12;
      v34 = 2114;
      v35 = v13;
      v36 = 2114;
      v37 = v14;
      v38 = 2114;
      v39 = v16;
      v40 = 2114;
      v41 = v24;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Message %{public}@ to inform presence status has been sent with : auth: %{public}@, region: %{public}@, reason: %{public}@, UUID: %{public}@, error: %{public}@", buf, 0x48u);

      v8 = v22;
      v6 = v23;

      v5 = v24;
    }

    objc_autoreleasePoolPop(v8);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    v19 = v18;
    objc_msgSend(v9, "workQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__HMDUserPresenceFeedSession__send__block_invoke_27;
    block[3] = &unk_1E89BE2F0;
    block[4] = v9;
    v26 = v5;
    v27 = v19;
    dispatch_async(v20, block);

  }
}

uint64_t __35__HMDUserPresenceFeedSession__send__block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStatusUpdateMessageError:responseTime:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __34__HMDUserPresenceFeedSession_send__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_send");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t10_46165 != -1)
    dispatch_once(&logCategory__hmf_once_t10_46165, &__block_literal_global_46166);
  return (id)logCategory__hmf_once_v11_46167;
}

void __41__HMDUserPresenceFeedSession_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v11_46167;
  logCategory__hmf_once_v11_46167 = v0;

}

@end
