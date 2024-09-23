@implementation HMDMediaActionRouter

- (HMDMediaActionRouter)initWithDataSource:(id)a3
{
  id v4;
  HMDMediaActionRouter *v5;
  HMDMPCSessionController *v6;
  void *v7;
  uint64_t v8;
  HMDMPCSessionController *mpcSessionController;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  void *v27;
  HMDMediaActionRouter *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  HMDMediaActionRouter *v48;
  id obj;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  objc_super v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)HMDMediaActionRouter;
  v5 = -[HMDMediaActionRouter init](&v54, sel_init);
  if (v5)
  {
    v6 = [HMDMPCSessionController alloc];
    objc_msgSend(v4, "logEventSubmitter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HMDMPCSessionController initWithLogEventSubmitter:](v6, "initWithLogEventSubmitter:", v7);
    mpcSessionController = v5->_mpcSessionController;
    v5->_mpcSessionController = (HMDMPCSessionController *)v8;

    objc_storeWeak((id *)&v5->_dataSource, v4);
    -[HMDMediaActionRouter _registerForMessages](v5, "_registerForMessages");
    if (isInternalBuild())
    {
      objc_msgSend(v4, "home");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "preferenceForKey:", CFSTR("TargetResidentDeviceForMediaActions"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringValue");
      v13 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v13;
      v48 = v5;
      if (v13)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v47 = v4;
        objc_msgSend(v4, "enabledResidents");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v51;
          v46 = v10;
LABEL_6:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v51 != v17)
              objc_enumerationMutation(obj);
            v19 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v18);
            objc_msgSend(v19, "device");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "isEqualToString:", v14))
              break;
            objc_msgSend(v19, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "UUIDString");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v14;
            v25 = objc_msgSend(v23, "isEqualToString:", v14);

            if (v25)
              goto LABEL_19;
            ++v18;
            v14 = v24;
            if (v16 == v18)
            {
              v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
              v10 = v46;
              if (v16)
                goto LABEL_6;
              goto LABEL_13;
            }
          }
          v24 = v14;

LABEL_19:
          v35 = (void *)MEMORY[0x1D17BA0A0]();
          v36 = v48;
          HMFGetOSLogHandle();
          v37 = objc_claimAutoreleasedReturnValue();
          v10 = v46;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            HMFGetLogIdentifier();
            v45 = v35;
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "name");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "device");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "name");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "UUIDString");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v56 = v38;
            v57 = 2112;
            v58 = v39;
            v59 = 2112;
            v60 = v40;
            v61 = 2112;
            v62 = v42;
            _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@For home %@, always using resident %@:%@ to execute Media Action scenes", buf, 0x2Au);

            v35 = v45;
          }

          objc_autoreleasePoolPop(v35);
          v34 = v19;

          v26 = objc_storeWeak(v36 + 3, v34);
          v4 = v47;
          v5 = v48;
          if (!v34)
            goto LABEL_15;
          goto LABEL_22;
        }
LABEL_13:

        v4 = v47;
        v5 = v48;
      }
      v24 = v14;
      v26 = objc_storeWeak((id *)&v5->_targetResidentDeviceOverride, 0);
LABEL_15:
      v27 = (void *)MEMORY[0x1D17BA0A0](v26);
      v28 = v5;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "UUIDString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v56 = v30;
        v57 = 2112;
        v58 = v24;
        v59 = 2112;
        v60 = v31;
        v61 = 2112;
        v62 = v33;
        _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Couldn't find TargetResidentDevice %@ in home %@:%@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v27);
      v34 = 0;
      v5 = v48;
LABEL_22:

    }
  }

  return v5;
}

- (HMDMediaActionRouter)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!isWatch())
  {
    -[HMDMediaActionRouter dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "msgDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deregisterForMessage:receiver:", CFSTR("HMDMAR.RouteMediaAction"), self);

  }
  v5.receiver = self;
  v5.super_class = (Class)HMDMediaActionRouter;
  -[HMDMediaActionRouter dealloc](&v5, sel_dealloc);
}

- (void)_registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[HMDMediaActionRouter dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!isWatch() && v4)
  {
    objc_msgSend(v3, "msgDispatcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "registerForMessage:receiver:policies:selector:", CFSTR("HMDMAR.RouteMediaAction"), self, v8, sel_routeMessage_);

  }
}

- (void)routeMediaActionForExecution:(id)a3 source:(unint64_t)a4 clientName:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  HMDMPCSessionData *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaPlaybackActionEvent *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMediaPlaybackActionEvent *v21;
  HMDMediaPlaybackActionEvent *v22;
  id v23;
  void *v24;
  HMDMPCSessionData *v25;
  id v27;
  _QWORD aBlock[4];
  HMDMediaPlaybackActionEvent *v29;
  id v30;
  id v31;
  id location;

  v9 = a3;
  v10 = a5;
  v27 = a6;
  v11 = [HMDMPCSessionData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HMDMPCSessionData initWithMediaAction:source:clientName:](v11, "initWithMediaAction:source:clientName:", v9, v12, v10);

  objc_msgSend(v9, "mediaProfiles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_map:", &__block_literal_global_85962);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [HMDMediaPlaybackActionEvent alloc];
  objc_msgSend(v9, "playbackArchive");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "state"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "volume");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HMDMediaPlaybackActionEvent initWithIsPlaybackArchivePresent:playbackStateNumber:volumeNumber:sourceNumber:sourceClientName:accessories:](v15, "initWithIsPlaybackArchivePresent:playbackStateNumber:volumeNumber:sourceNumber:sourceClientName:accessories:", v16 != 0, v17, v18, v19, v10, v20);

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__HMDMediaActionRouter_routeMediaActionForExecution_source_clientName_completion___block_invoke_2;
  aBlock[3] = &unk_1E89C0650;
  objc_copyWeak(&v31, &location);
  v22 = v21;
  v29 = v22;
  v23 = v27;
  v30 = v23;
  v24 = _Block_copy(aBlock);
  -[HMDMediaActionRouter routeSessionDataForExecution:encodePlaybackArchive:completion:](self, "routeSessionDataForExecution:encodePlaybackArchive:completion:", v25, objc_msgSend(v9, "encodePlaybackArchiveForExecution"), v24);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);

}

- (void)routeSessionDataForExecution:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, void *);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDMediaActionRouter *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *))a5;
  if (v8)
  {
    v10 = objc_msgSend(v8, "playbackArchiveTargetsSystemMediaApplication");
    objc_msgSend(v8, "mediaProfiles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaActionRouter targetResidentDeviceForExecutingMediaActionWithProfiles:targetSystemMediaApplication:](self, "targetResidentDeviceForExecutingMediaActionWithProfiles:targetSystemMediaApplication:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && !objc_msgSend(v12, "isCurrentDevice"))
      -[HMDMediaActionRouter sendMediaActionMessageToResident:sessionData:encodePlaybackArchive:completion:](self, "sendMediaActionMessageToResident:sessionData:encodePlaybackArchive:completion:", v12, v8, v6, v9);
    else
      -[HMDMediaActionRouter handleNonResidentMediaActionExecutionWithSessionData:encodePlaybackArchive:completion:](self, "handleNonResidentMediaActionExecutionWithSessionData:encodePlaybackArchive:completion:", v8, v6, v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Session Data is nil, could not send action"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to package media action for execution, invalid message payload", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    v9[2](v9, v13);

  }
}

- (void)handleNonResidentMediaActionExecutionWithSessionData:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[HMDMediaActionRouter dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (isWatch()
    && objc_msgSend(v10, "isCompanionReachable")
    && (objc_msgSend(v10, "companionDevice"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __110__HMDMediaActionRouter_handleNonResidentMediaActionExecutionWithSessionData_encodePlaybackArchive_completion___block_invoke;
    v12[3] = &unk_1E89C1558;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    -[HMDMediaActionRouter sendMediaActionMessageToCompanionWithSessionData:encodePlaybackArchive:completion:](self, "sendMediaActionMessageToCompanionWithSessionData:encodePlaybackArchive:completion:", v13, v6, v12);

  }
  else
  {
    -[HMDMediaActionRouter executeMediaActionWithSessionData:completion:](self, "executeMediaActionWithSessionData:completion:", v8, v9);
  }

}

- (void)sendMediaActionMessageToResident:(id)a3 sessionData:(id)a4 encodePlaybackArchive:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __102__HMDMediaActionRouter_sendMediaActionMessageToResident_sessionData_encodePlaybackArchive_completion___block_invoke;
  v17[3] = &unk_1E89B0500;
  v17[4] = self;
  v18 = v10;
  v21 = v7;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  -[HMDMediaActionRouter sendMediaActionMessageToDevice:sessionData:encodePlaybackArchive:canForwardMessage:completion:](self, "sendMediaActionMessageToDevice:sessionData:encodePlaybackArchive:canForwardMessage:completion:", v13, v15, v7, 0, v17);

}

- (void)sendMediaActionMessageToCompanionWithSessionData:(id)a3 encodePlaybackArchive:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  HMDMediaActionRouter *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Running media action on companion", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  -[HMDMediaActionRouter dataSource](v11, "dataSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "companionDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __106__HMDMediaActionRouter_sendMediaActionMessageToCompanionWithSessionData_encodePlaybackArchive_completion___block_invoke;
  v17[3] = &unk_1E89BFC88;
  v17[4] = v11;
  v18 = v9;
  v16 = v9;
  -[HMDMediaActionRouter sendMediaActionMessageToDevice:sessionData:encodePlaybackArchive:canForwardMessage:completion:](v11, "sendMediaActionMessageToDevice:sessionData:encodePlaybackArchive:canForwardMessage:completion:", v15, v8, v6, 1, v17);

}

- (void)sendMediaActionMessageToDevice:(id)a3 sessionData:(id)a4 encodePlaybackArchive:(BOOL)a5 canForwardMessage:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMDMediaActionRouter *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDRemoteDeviceMessageDestination *v29;
  void *v30;
  HMDRemoteDeviceMessageDestination *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v8 = a6;
  v9 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = self;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v37 = v8;
    v21 = v12;
    v22 = v14;
    v23 = v9;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v42 = v18;
    v43 = 2112;
    v44 = v19;
    v45 = 2112;
    v46 = v20;
    v47 = 2112;
    v48 = v24;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Sending media action to < %@ : %@ > canForward: %@", buf, 0x2Au);

    v9 = v23;
    v14 = v22;
    v12 = v21;
    v8 = v37;

    v13 = v38;
  }

  objc_autoreleasePoolPop(v15);
  objc_msgSend(v13, "dictionaryRepresentation:", v9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKey:", v27, CFSTR("kDoNotForwardMessageKey"));

  -[HMDMediaActionRouter dataSource](v16, "dataSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = [HMDRemoteDeviceMessageDestination alloc];
  objc_msgSend(v28, "uuid");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v29, "initWithTarget:device:", v30, v12);

  v32 = (void *)MEMORY[0x1E0D285F8];
  v33 = (void *)objc_msgSend(v26, "copy");
  objc_msgSend(v32, "messageWithName:qualityOfService:destination:payload:", CFSTR("HMDMAR.RouteMediaAction"), 25, v31, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __118__HMDMediaActionRouter_sendMediaActionMessageToDevice_sessionData_encodePlaybackArchive_canForwardMessage_completion___block_invoke;
  v39[3] = &unk_1E89B0528;
  v40 = v14;
  v35 = v14;
  objc_msgSend(v34, "setResponseHandler:", v39);
  objc_msgSend(v34, "setSecureRemote:", 1);
  objc_msgSend(v28, "msgDispatcher");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sendMessage:completionHandler:", v34, 0);

}

- (void)routeMessage:(id)a3
{
  id v4;
  HMDMPCSessionData *v5;
  void *v6;
  HMDMPCSessionData *v7;
  id v8;
  void (**v9)(void *, void *);
  void *v10;
  void *v11;
  void *v12;
  HMDMediaActionRouter *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDMediaActionRouter *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD aBlock[4];
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [HMDMPCSessionData alloc];
  objc_msgSend(v4, "messagePayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDMPCSessionData initWithDictionaryRepresentation:profileSource:](v5, "initWithDictionaryRepresentation:profileSource:", v6, self);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__HMDMediaActionRouter_routeMessage___block_invoke;
  aBlock[3] = &unk_1E89C2350;
  v8 = v4;
  v24 = v8;
  v9 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v7)
  {
    objc_msgSend(v8, "messagePayload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "hmf_BOOLForKey:", CFSTR("kDoNotForwardMessageKey")))
    {

LABEL_11:
      -[HMDMediaActionRouter executeMediaActionWithSessionData:completion:](self, "executeMediaActionWithSessionData:completion:", v7, v9);
      goto LABEL_12;
    }
    objc_msgSend(v8, "messagePayload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kDoNotForwardMessageKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_11;
    v18 = (void *)MEMORY[0x1D17BA0A0]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "remoteSourceDevice");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Forwarding media action for remote device: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDMediaActionRouter routeSessionDataForExecution:encodePlaybackArchive:completion:](v19, "routeSessionDataForExecution:encodePlaybackArchive:completion:", v7, 1, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 3, CFSTR("Session Data nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to route media action for execution, invalid message payload", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
    v9[2](v9, v11);

  }
LABEL_12:

}

- (void)gatherTargetDevicesForExecutingMediaActionWithProfiles:(id)a3 targetSystemMediaApplication:(BOOL)a4 outResidentDevicesInMediaAction:(id *)a5 outHomePodsInMediaAction:(id *)a6 outResidentDevicesSupportingMediaActions:(id *)a7 outHomePodsSupportingMediaActions:(id *)a8 outNonOdeonHomePodsSupportingMediaActions:(id *)a9 outNonOdeonResidentDevicesSupportingMediaActions:(id *)a10 outNonOdeonResidentDevicesInMediaAction:(id *)a11 outNonOdeonHomePodsInMediaAction:(id *)a12 dataSource:(id)a13
{
  id v15;
  id v16;
  void *v17;
  HMDMediaActionRouter *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v57;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  _QWORD v79[4];
  id v80;
  BOOL v81;
  uint8_t buf[4];
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a13;
  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = self;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enabledResidents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v83 = v20;
    v84 = 2112;
    v85 = v21;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEBUG, "%{public}@Available residents: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v16, "enabledResidents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke;
  v79[3] = &unk_1E89B0550;
  v81 = a4;
  v80 = v16;
  v57 = v16;
  objc_msgSend(v22, "na_filter:", v79);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v57, "appleMediaAccessories");
  v77[0] = v23;
  v77[1] = 3221225472;
  v77[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_2;
  v77[3] = &unk_1E89B27D8;
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v78 = v25;
  objc_msgSend(v24, "na_filter:", v77);
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v75[0] = v23;
  v75[1] = 3221225472;
  v75[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_4;
  v75[3] = &unk_1E89B27D8;
  v26 = v15;
  v76 = v26;
  objc_msgSend(v24, "na_filter:", v75);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v23;
  v73[1] = 3221225472;
  v73[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_6;
  v73[3] = &unk_1E89B27D8;
  v28 = v26;
  v74 = v28;
  objc_msgSend(v27, "na_filter:", v73);
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v25, "na_map:", &__block_literal_global_34_85940);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = (void *)MEMORY[0x1E0C99E60];
  v71[0] = v23;
  v71[1] = 3221225472;
  v71[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_9;
  v71[3] = &unk_1E89B05B8;
  v72 = v31;
  v55 = v31;
  objc_msgSend(v25, "na_map:", v71);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithArray:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v68[0] = v23;
  v68[1] = 3221225472;
  v68[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_10;
  v68[3] = &unk_1E89B0608;
  v35 = v28;
  v69 = v35;
  v36 = v34;
  v70 = v36;
  objc_msgSend(v27, "na_filter:", v68);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v23;
  v66[1] = 3221225472;
  v66[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_12;
  v66[3] = &unk_1E89B27D8;
  v67 = v35;
  v54 = v35;
  objc_msgSend(v37, "na_filter:", v66);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v23;
  v63[1] = 3221225472;
  v63[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_14;
  v63[3] = &unk_1E89B0608;
  v39 = v25;
  v64 = v39;
  v65 = v36;
  v40 = v36;
  objc_msgSend(v24, "na_filter:", v63);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v23;
  v61[1] = 3221225472;
  v61[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_16;
  v61[3] = &unk_1E89B27D8;
  v62 = v39;
  v52 = v39;
  objc_msgSend(v41, "na_filter:", v61);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_retainAutorelease(v24);
  *a7 = v43;
  v44 = objc_retainAutorelease(v53);
  *a8 = v44;
  v45 = objc_retainAutorelease(v27);
  *a5 = v45;
  v46 = objc_retainAutorelease(v51);
  *a6 = v46;
  v47 = objc_retainAutorelease(v37);
  *a11 = v47;
  v48 = objc_retainAutorelease(v38);
  *a12 = v48;
  v49 = objc_retainAutorelease(v41);
  *a10 = v49;
  v50 = objc_retainAutorelease(v42);
  *a9 = v50;

}

- (id)targetResidentDeviceForExecutingMediaActionWithProfiles:(id)a3 targetSystemMediaApplication:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  HMDMediaActionRouter *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  HMDMediaActionRouter *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  HMDMediaActionRouter *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  char v34;
  char v35;
  void *v36;
  void *v37;
  HMDMediaActionRouter *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  HMDMediaActionRouter *v45;
  NSObject *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  HMDMediaActionRouter *v53;
  NSObject *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  HMDMediaActionRouter *v60;
  NSObject *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  HMDMediaActionRouter *v67;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  HMDMediaActionRouter *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  HMDMediaActionRouter *v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  HMDMediaActionRouter *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  HMDMediaActionRouter *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  HMDMediaActionRouter *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  HMDMediaActionRouter *v106;
  NSObject *v107;
  _BOOL4 v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  uint64_t v113;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *context;
  void *contextb;
  void *contextc;
  void *contextd;
  void *contexte;
  void *contextf;
  void *contexta;
  void *v135;
  id v136;
  id v137;
  id v138;
  id v139;
  _QWORD v140[4];
  char v141;
  _QWORD v142[4];
  char v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  id v151;
  uint8_t buf[4];
  void *v153;
  __int16 v154;
  uint64_t v155;
  __int16 v156;
  uint64_t v157;
  uint64_t v158;

  v4 = a4;
  v158 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    -[HMDMediaActionRouter targetResidentDeviceOverride](self, "targetResidentDeviceOverride");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v153 = v13;
        v154 = 2112;
        v155 = (uint64_t)v14;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[Target Device] Picking resident device override: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v15 = v8;
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "enabledResidents");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v153 = v20;
        v154 = 2112;
        v155 = (uint64_t)v21;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Available residents: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      v150 = 0;
      v151 = 0;
      v148 = 0;
      v149 = 0;
      v146 = 0;
      v147 = 0;
      v144 = 0;
      v145 = 0;
      -[HMDMediaActionRouter gatherTargetDevicesForExecutingMediaActionWithProfiles:targetSystemMediaApplication:outResidentDevicesInMediaAction:outHomePodsInMediaAction:outResidentDevicesSupportingMediaActions:outHomePodsSupportingMediaActions:outNonOdeonHomePodsSupportingMediaActions:outNonOdeonResidentDevicesSupportingMediaActions:outNonOdeonResidentDevicesInMediaAction:outNonOdeonHomePodsInMediaAction:dataSource:](v10, "gatherTargetDevicesForExecutingMediaActionWithProfiles:targetSystemMediaApplication:outResidentDevicesInMediaAction:outHomePodsInMediaAction:outResidentDevicesSupportingMediaActions:outHomePodsSupportingMediaActions:outNonOdeonHomePodsSupportingMediaActions:outNonOdeonResidentDevicesSupportingMediaActions:outNonOdeonResidentDevicesInMediaAction:outNonOdeonHomePodsInMediaAction:dataSource:", v6, v4, &v151, &v150, &v149, &v148, &v147, &v146, &v145, &v144, WeakRetained);
      v22 = v151;
      v23 = v150;
      v138 = v149;
      v24 = v148;
      v25 = v147;
      v139 = v146;
      v136 = v145;
      v137 = v144;
      context = (void *)MEMORY[0x1D17BA0A0]();
      v26 = v10;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v6;
        v30 = v23;
        v31 = objc_msgSend(v138, "count");
        v32 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 138543874;
        v153 = v28;
        v154 = 2048;
        v155 = v31;
        v23 = v30;
        v6 = v29;
        v8 = 0;
        v156 = 2048;
        v157 = v32;
        _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Number of reachable residents: %lu, number of residents in action: %lu", buf, 0x20u);

      }
      v135 = v24;

      objc_autoreleasePoolPop(context);
      v33 = objc_msgSend(v139, "na_any:", &__block_literal_global_35_85923);
      v34 = v33;
      if (v33)
        v35 = objc_msgSend(v25, "na_any:", &__block_literal_global_36);
      else
        v35 = 0;
      objc_msgSend(v22, "na_firstObjectPassingTest:", &__block_literal_global_37);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
      {
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v38 = v26;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v123 = v8;
          contextb = v23;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "identifier");
          v41 = v25;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v153 = v40;
          v154 = 2112;
          v155 = (uint64_t)v42;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking current device since it is a resident and part of action: %@", buf, 0x16u);

          v25 = v41;
          v8 = v123;
          v23 = contextb;
        }

        objc_autoreleasePoolPop(v37);
        v15 = v36;
      }
      else
      {
        v120 = v22;
        objc_msgSend(v137, "firstObject");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (v43)
        {
          v44 = (void *)MEMORY[0x1D17BA0A0]();
          v45 = v26;
          HMFGetOSLogHandle();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v124 = v8;
            contextc = v23;
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "identifier");
            v48 = v25;
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v153 = v47;
            v154 = 2112;
            v155 = (uint64_t)v49;
            _os_log_impl(&dword_1CD062000, v46, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking non-odeon HomePod in action: %@", buf, 0x16u);

            v25 = v48;
            v8 = v124;
            v23 = contextc;
          }

          objc_autoreleasePoolPop(v44);
          v15 = v43;
        }
        else
        {
          objc_msgSend(v136, "firstObject");
          v50 = objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            v51 = (void *)v50;
            v52 = (void *)MEMORY[0x1D17BA0A0]();
            v53 = v26;
            HMFGetOSLogHandle();
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v125 = v8;
              contextd = v23;
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "identifier");
              v56 = v25;
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v153 = v55;
              v154 = 2112;
              v155 = (uint64_t)v57;
              _os_log_impl(&dword_1CD062000, v54, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking non-odeon resident device in action: %@", buf, 0x16u);

              v25 = v56;
              v8 = v125;
              v23 = contextd;
            }

            objc_autoreleasePoolPop(v52);
            v58 = v51;
            v15 = v51;
            v43 = 0;
          }
          else
          {
            objc_msgSend(v23, "firstObject");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            if (v119)
            {
              v59 = (void *)MEMORY[0x1D17BA0A0]();
              v60 = v26;
              HMFGetOSLogHandle();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v126 = v8;
                contexte = v23;
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "identifier");
                v63 = v25;
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v153 = v62;
                v154 = 2112;
                v155 = (uint64_t)v64;
                _os_log_impl(&dword_1CD062000, v61, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking HomePod in action: %@", buf, 0x16u);

                v25 = v63;
                v8 = v126;
                v23 = contexte;
              }

              objc_autoreleasePoolPop(v59);
              v65 = v119;
              v15 = v119;
              v43 = 0;
              v58 = 0;
            }
            else
            {
              objc_msgSend(v120, "firstObject");
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              if (v118)
              {
                v66 = (void *)MEMORY[0x1D17BA0A0]();
                v67 = v26;
                HMFGetOSLogHandle();
                v68 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v127 = v8;
                  contextf = v23;
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v118, "identifier");
                  v70 = v25;
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v153 = v69;
                  v154 = 2112;
                  v155 = (uint64_t)v71;
                  _os_log_impl(&dword_1CD062000, v68, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking resident device in action: %@", buf, 0x16u);

                  v25 = v70;
                  v8 = v127;
                  v23 = contextf;
                }

                objc_autoreleasePoolPop(v66);
                v72 = v118;
                v73 = v118;
                v15 = v72;
                v65 = 0;
                v43 = 0;
                v58 = 0;
              }
              else
              {
                v121 = v25;
                contexta = v23;
                v74 = MEMORY[0x1E0C809B0];
                v142[0] = MEMORY[0x1E0C809B0];
                v142[1] = 3221225472;
                v142[2] = __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_38;
                v142[3] = &__block_descriptor_33_e27_B16__0__HMDResidentDevice_8l;
                v143 = v35;
                objc_msgSend(v138, "na_firstObjectPassingTest:", v142);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                if (v75)
                {
                  v76 = (void *)MEMORY[0x1D17BA0A0]();
                  v77 = v26;
                  HMFGetOSLogHandle();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "identifier");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543618;
                    v153 = v79;
                    v154 = 2112;
                    v155 = (uint64_t)v80;
                    _os_log_impl(&dword_1CD062000, v78, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking current device since it is a HomePod and not part of action and is non-odeon: %@", buf, 0x16u);

                  }
                  objc_autoreleasePoolPop(v76);
                  v81 = v75;
                  v82 = v75;
                  v15 = v81;
                  v23 = contexta;
                  v25 = v121;
                  v36 = 0;
                  v58 = 0;
                  v65 = 0;
                }
                else
                {
                  objc_msgSend(v25, "firstObject");
                  v117 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v117)
                  {
                    v83 = (void *)MEMORY[0x1D17BA0A0]();
                    v84 = v26;
                    HMFGetOSLogHandle();
                    v85 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v86 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v117, "identifier");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v153 = v86;
                      v154 = 2112;
                      v155 = (uint64_t)v87;
                      _os_log_impl(&dword_1CD062000, v85, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any non-odeon HomePod: %@", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v83);
                    v15 = v117;
                    v23 = contexta;
                    v25 = v121;
                    v88 = v117;
                    v36 = 0;
                    v58 = 0;
                    v65 = 0;
                  }
                  else
                  {
                    v140[0] = v74;
                    v140[1] = 3221225472;
                    v140[2] = __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_39;
                    v140[3] = &__block_descriptor_33_e27_B16__0__HMDResidentDevice_8l;
                    v141 = v34;
                    objc_msgSend(v138, "na_firstObjectPassingTest:", v140);
                    v89 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v89)
                    {
                      v90 = (void *)MEMORY[0x1D17BA0A0]();
                      v91 = v26;
                      HMFGetOSLogHandle();
                      v92 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
                      {
                        HMFGetLogIdentifier();
                        v93 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v89, "identifier");
                        v94 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543618;
                        v153 = v93;
                        v154 = 2112;
                        v155 = (uint64_t)v94;
                        _os_log_impl(&dword_1CD062000, v92, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking current device since it is a resident and not part of action and is non-odeon: %@", buf, 0x16u);

                      }
                      objc_autoreleasePoolPop(v90);
                      v15 = v89;
                      v23 = contexta;
                    }
                    else
                    {
                      v122 = WeakRetained;
                      objc_msgSend(v135, "firstObject");
                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v95)
                      {
                        v96 = (void *)MEMORY[0x1D17BA0A0]();
                        v97 = v26;
                        HMFGetOSLogHandle();
                        v98 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
                        {
                          HMFGetLogIdentifier();
                          v99 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v95, "identifier");
                          v100 = (void *)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138543618;
                          v153 = v99;
                          v154 = 2112;
                          v155 = (uint64_t)v100;
                          _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any HomePod resident: %@", buf, 0x16u);

                        }
                        objc_autoreleasePoolPop(v96);
                        v15 = v95;
                      }
                      else
                      {
                        objc_msgSend(v139, "firstObject");
                        v116 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v116)
                        {
                          v101 = (void *)MEMORY[0x1D17BA0A0]();
                          v102 = v26;
                          HMFGetOSLogHandle();
                          v103 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                          {
                            HMFGetLogIdentifier();
                            v104 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v116, "identifier");
                            v105 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543618;
                            v153 = v104;
                            v154 = 2112;
                            v155 = (uint64_t)v105;
                            _os_log_impl(&dword_1CD062000, v103, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any non-odeon resident: %@", buf, 0x16u);

                          }
                          objc_autoreleasePoolPop(v101);
                          v15 = v116;
                        }
                        else
                        {
                          objc_msgSend(v138, "firstObject");
                          v15 = (id)objc_claimAutoreleasedReturnValue();
                          v115 = (void *)MEMORY[0x1D17BA0A0]();
                          v106 = v26;
                          HMFGetOSLogHandle();
                          v107 = objc_claimAutoreleasedReturnValue();
                          v108 = os_log_type_enabled(v107, OS_LOG_TYPE_INFO);
                          if (v15)
                          {
                            if (v108)
                            {
                              HMFGetLogIdentifier();
                              v109 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v15, "identifier");
                              v110 = (void *)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138543618;
                              v153 = v109;
                              v154 = 2112;
                              v155 = (uint64_t)v110;
                              _os_log_impl(&dword_1CD062000, v107, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Picking any resident: %@", buf, 0x16u);

                            }
                            objc_autoreleasePoolPop(v115);
                            v111 = v15;
                          }
                          else
                          {
                            if (v108)
                            {
                              HMFGetLogIdentifier();
                              v112 = (void *)objc_claimAutoreleasedReturnValue();
                              v113 = objc_msgSend(v138, "count");
                              *(_DWORD *)buf = 138543618;
                              v153 = v112;
                              v154 = 2048;
                              v155 = v113;
                              _os_log_impl(&dword_1CD062000, v107, OS_LOG_TYPE_INFO, "%{public}@[Target Device] Couldn't find media action resident to route to, out of %lu candidates", buf, 0x16u);

                            }
                            objc_autoreleasePoolPop(v115);
                          }

                        }
                      }

                      v23 = contexta;
                      WeakRetained = v122;
                    }
                    v25 = v121;

                    v36 = 0;
                    v58 = 0;
                    v65 = 0;
                    v88 = 0;
                  }

                  v82 = 0;
                }

                v73 = 0;
              }

            }
          }

        }
        v22 = v120;
      }

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v153 = v19;
      _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid data source", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v15 = 0;
  }

  return v15;
}

- (void)executeMediaActionWithSessionData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaActionRouter *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Running media action locally", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaActionRouter mpcSessionController](v9, "mpcSessionController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "executeSessionWithSessionData:completion:", v6, v7);

}

- (NSUUID)messageTargetUUID
{
  void *v2;
  void *v3;

  -[HMDMediaActionRouter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSUUID *)v3;
}

- (OS_dispatch_queue)messageReceiveQueue
{
  void *v2;
  void *v3;

  -[HMDMediaActionRouter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "workQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (HMDHome)home
{
  void *v2;
  void *v3;

  -[HMDMediaActionRouter dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMDHome *)v3;
}

- (id)mediaProfileWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDMediaActionRouter dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaProfileWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMDMediaActionRouterDataSource)dataSource
{
  return (HMDMediaActionRouterDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (BOOL)shouldExecuteOnCurrentDevice
{
  return self->_shouldExecuteOnCurrentDevice;
}

- (HMDResidentDevice)targetResidentDeviceOverride
{
  return (HMDResidentDevice *)objc_loadWeakRetained((id *)&self->_targetResidentDeviceOverride);
}

- (void)setTargetResidentDeviceOverride:(id)a3
{
  objc_storeWeak((id *)&self->_targetResidentDeviceOverride, a3);
}

- (HMDMPCSessionController)mpcSessionController
{
  return self->_mpcSessionController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mpcSessionController, 0);
  objc_destroyWeak((id *)&self->_targetResidentDeviceOverride);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCurrentDevice");
  if ((_DWORD)result)
    return *(_BYTE *)(a1 + 32) != 0;
  return result;
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isCurrentDevice");
  if ((_DWORD)result)
    return *(_BYTE *)(a1 + 32) != 0;
  return result;
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

uint64_t __109__HMDMediaActionRouter_targetResidentDeviceForExecutingMediaActionWithProfiles_targetSystemMediaApplication___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (objc_msgSend(v3, "supportsCustomMediaApplicationDestination"))
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  if ((objc_msgSend(v3, "supportsMediaActions") & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend(*(id *)(a1 + 32), "isResidentReachable:", v4);
LABEL_6:

  return v5;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_3;
  v8[3] = &unk_1E89C1088;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_5;
  v8[3] = &unk_1E89B1258;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_7;
  v8[3] = &unk_1E89B1258;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

id __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "audioDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v5))
  {
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_11;
  v8[3] = &unk_1E89B05E0;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_13;
  v8[3] = &unk_1E89B1258;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_15;
  v8[3] = &unk_1E89B0630;
  v9 = v3;
  v4 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_17;
  v8[3] = &unk_1E89C1088;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "isHomePod"))
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hmf_isEqualToUUID:", v7))
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(v3, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9) ^ 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5 && objc_msgSend(v5, "isHomePod"))
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hmf_isEqualToUUID:", v9))
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v5, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11) ^ 1;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "audioDestinationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "destinationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5 && objc_msgSend(v5, "isHomePod"))
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "hmf_isEqualToUUID:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __415__HMDMediaActionRouter_gatherTargetDevicesForExecutingMediaActionWithProfiles_targetSystemMediaApplication_outResidentDevicesInMediaAction_outHomePodsInMediaAction_outResidentDevicesSupportingMediaActions_outHomePodsSupportingMediaActions_outNonOdeonHomePodsSupportingMediaActions_outNonOdeonResidentDevicesSupportingMediaActions_outNonOdeonResidentDevicesInMediaAction_outNonOdeonHomePodsInMediaAction_dataSource___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "isHomePod"))
  {
    objc_msgSend(*(id *)(a1 + 32), "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "hmf_isEqualToUUID:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __37__HMDMediaActionRouter_routeMessage___block_invoke(uint64_t a1, void *a2)
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

uint64_t __118__HMDMediaActionRouter_sendMediaActionMessageToDevice_sessionData_encodePlaybackArchive_canForwardMessage_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __106__HMDMediaActionRouter_sendMediaActionMessageToCompanionWithSessionData_encodePlaybackArchive_completion___block_invoke(uint64_t a1, void *a2)
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
  if (v3)
  {
    v4 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to execute media action on companion: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __102__HMDMediaActionRouter_sendMediaActionMessageToResident_sessionData_encodePlaybackArchive_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3
    && (objc_msgSend(*(id *)(a1 + 32), "dataSource"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isResidentReachable:", *(_QWORD *)(a1 + 40)),
        v4,
        (v5 & 1) == 0))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "device");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Device < %@ : %@ > unreachable, rerouting", (uint8_t *)&v13, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(*(id *)(a1 + 32), "routeSessionDataForExecution:encodePlaybackArchive:completion:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __110__HMDMediaActionRouter_handleNonResidentMediaActionExecutionWithSessionData_encodePlaybackArchive_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "executeMediaActionWithSessionData:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __82__HMDMediaActionRouter_routeMediaActionForExecution_source_clientName_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v3 = (id *)(a1 + 48);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventSubmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitLogEvent:error:", *(_QWORD *)(a1 + 32), v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __82__HMDMediaActionRouter_routeMediaActionForExecution_source_clientName_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessory");
}

@end
