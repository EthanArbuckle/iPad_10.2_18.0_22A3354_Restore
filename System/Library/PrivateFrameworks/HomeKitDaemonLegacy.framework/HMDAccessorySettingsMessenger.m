@implementation HMDAccessorySettingsMessenger

- (HMDAccessorySettingsMessenger)initWithMessageTargetUUID:(id)a3 messageDispatcher:(id)a4 messageRouter:(id)a5 messageHandler:(id)a6 logEventSubmitter:(id)a7 legacyMessageReceiver:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  HMDAccessorySettingsMessenger *v22;
  HMDAccessorySettingsMessenger *v23;
  HMDAccessorySettingsMessenger *result;
  HMDAccessorySettingsMessenger *v25;
  SEL v26;
  id v27;
  id obj;
  id v29;
  id v30;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  obj = a6;
  v18 = a6;
  v29 = a7;
  v19 = a7;
  v30 = a8;
  v20 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v19)
  {
LABEL_13:
    v25 = (HMDAccessorySettingsMessenger *)_HMFPreconditionFailure();
    -[HMDAccessorySettingsMessenger registerForMessagesWithHome:](v25, v26, v27);
    return result;
  }
  v21 = v20;
  v31.receiver = self;
  v31.super_class = (Class)HMDAccessorySettingsMessenger;
  v22 = -[HMDAccessorySettingsMessenger init](&v31, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_messageDispatcher, a4);
    objc_storeStrong((id *)&v23->_messageTargetUUID, a3);
    objc_storeStrong((id *)&v23->_messageRouter, a5);
    objc_storeStrong((id *)&v23->_messageHandler, obj);
    objc_storeStrong((id *)&v23->_logEventSubmitter, v29);
    objc_storeStrong((id *)&v23->_legacyMessageReceiver, v30);
  }

  return v23;
}

- (void)registerForMessagesWithHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v4, 4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsMessenger messageDispatcher](self, "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CB7EF0];
  v17[0] = v5;
  v17[1] = v6;
  v17[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerForMessage:receiver:policies:selector:", v10, self, v11, sel_routeAccessorySettingsFetchRequestMessage_);

  -[HMDAccessorySettingsMessenger messageDispatcher](self, "messageDispatcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CB7F00];
  v16[0] = v5;
  v16[1] = v6;
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerForMessage:receiver:policies:selector:", v13, self, v14, sel_routeAccessorySettingsUpdateRequestMessage_);

  -[HMDAccessorySettingsMessenger legacyMessageReceiver](self, "legacyMessageReceiver");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerForMessagesWithHome:", v4);

}

- (void)sendFetchAccessorySettingsRequestWithAccessoryUUID:(id)a3 keyPaths:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDAccessorySettingsMessenger *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v29 = v14;
    v30 = 2112;
    v31 = v8;
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending fetch request with accessoryUUID: %@ keypaths: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2E0]), "initWithAccessoryUUID:keyPaths:", v8, v9);
  v16 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessorySettingsMessenger messageTargetUUID](v12, "messageTargetUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithTarget:", v17);

  v19 = objc_alloc(MEMORY[0x1E0D285F8]);
  v20 = *MEMORY[0x1E0CB7EF0];
  objc_msgSend(v15, "payloadCopy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v19, "initWithName:destination:payload:", v20, v18, v21);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __111__HMDAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke;
  v25[3] = &unk_1E89BDE10;
  v26 = v9;
  v27 = v10;
  v25[4] = v12;
  v23 = v9;
  v24 = v10;
  objc_msgSend(v22, "setResponseHandler:", v25);
  -[HMDAccessorySettingsMessenger routeAccessorySettingsFetchRequestMessage:](v12, "routeAccessorySettingsFetchRequestMessage:", v22);

}

- (id)fetchLogEventFromMessage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  HMDFetchAccessorySettingsLogEvent *v14;
  void *v15;
  HMDFetchAccessorySettingsLogEvent *v16;
  void *v17;
  HMDAccessorySettingsMessenger *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  mach_absolute_time();
  v5 = UpTicksToMilliseconds();
  objc_msgSend(v4, "transport");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
      v10 = (__CFString *)v9;
    else
      v10 = CFSTR("unknown xpc client");
  }
  else
  {
    v10 = CFSTR("homed");
  }
  v11 = objc_alloc(MEMORY[0x1E0CBA2E0]);
  objc_msgSend(v4, "messagePayload");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithPayload:", v12);

  if (v13)
  {
    v14 = [HMDFetchAccessorySettingsLogEvent alloc];
    objc_msgSend(v13, "keyPaths");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HMDFetchAccessorySettingsLogEvent initWithKeyPaths:startTime:requestingClientName:error:](v14, "initWithKeyPaths:startTime:requestingClientName:error:", v15, v5, v10, 0);

  }
  else
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to decode fetch request payload for metric generation", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v16 = 0;
  }

  return v16;
}

- (void)updateAndPostFetchSettingsEvent:(id)a3 responsePayload:(id)a4 responseError:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessorySettingsMessenger *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  HMDAccessorySettingsMessenger *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDAccessorySettingsMessenger *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  mach_absolute_time();
  v11 = objc_msgSend(v8, "setResponseTimeStamp:", UpTicksToMilliseconds());
  if (v10)
  {
    objc_msgSend(v8, "setError:", v10);
LABEL_3:
    objc_msgSend(v8, "keyPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFailedKeyPaths:", v12);

LABEL_4:
    -[HMDAccessorySettingsMessenger logEventSubmitter](self, "logEventSubmitter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "submitLogEvent:", v8);
    goto LABEL_5;
  }
  if (!v9)
  {
    v32 = (void *)MEMORY[0x1D17BA0A0](v11);
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v35;
      v52 = 2112;
      v53 = 0;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Send fetch request responded with error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v36);

    goto LABEL_3;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2E8]), "initWithPayload:", v9);
  if (v14)
  {
    v15 = v14;
    v43 = self;
    v44 = v9;
    v16 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v14, "fetchResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v15, "fetchResults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "arrayWithCapacity:", objc_msgSend(v20, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v42 = v15;
    objc_msgSend(v15, "fetchResults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v27, "setting");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "keyPath");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v18, "addObject:", v29);
          }
          else
          {
            objc_msgSend(v21, "addObject:", v29);

            objc_msgSend(v27, "error");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setError:", v29);
          }

        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v24);
    }

    v30 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v8, "setSucceededKeyPaths:", v30);

    v31 = (void *)objc_msgSend(v21, "copy");
    objc_msgSend(v8, "setFailedKeyPaths:", v31);

    v10 = 0;
    v9 = v44;
    self = v43;
    goto LABEL_4;
  }
  v37 = (void *)MEMORY[0x1D17BA0A0]();
  v38 = self;
  HMFGetOSLogHandle();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v40;
    v52 = 2112;
    v53 = v9;
    _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode fetch request response payload: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v37);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setError:", v41);

  objc_msgSend(v8, "keyPaths");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFailedKeyPaths:", v13);
LABEL_5:

}

- (void)sendUpdateAccessorySettingRequestWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDAccessorySettingsMessenger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  HMDAccessorySettingsMessenger *v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v34 = v17;
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v39 = 2112;
    v40 = v12;
    _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_INFO, "%{public}@Sending update request with accessoryUUID: %@ keypath: %@ value: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v14);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2F8]), "initWithAccessoryUUID:keyPath:settingValue:", v10, v11, v12);
  v19 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessorySettingsMessenger messageTargetUUID](v15, "messageTargetUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithTarget:", v20);

  v22 = objc_alloc(MEMORY[0x1E0D285F8]);
  v23 = *MEMORY[0x1E0CB7F00];
  objc_msgSend(v18, "payloadCopy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v22, "initWithName:destination:payload:", v23, v21, v24);

  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __123__HMDAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke;
  v30 = &unk_1E89BE018;
  v31 = v15;
  v32 = v13;
  v26 = v13;
  objc_msgSend(v25, "setResponseHandler:", &v27);
  -[HMDAccessorySettingsMessenger routeAccessorySettingsUpdateRequestMessage:](v15, "routeAccessorySettingsUpdateRequestMessage:", v25, v27, v28, v29, v30, v31);

}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessorySettingsMessenger messageTargetUUID](self, "messageTargetUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)routeAccessorySettingsFetchRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingsMessenger *v6;
  NSObject *v7;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v32 = v8;
    v33 = 2112;
    v34 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing accessory settings fetch request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = v4;
  v10 = objc_msgSend(v9, "isRemote");
  v11 = MEMORY[0x1E0C809B0];
  if ((v10 & 1) != 0 || (objc_msgSend(v9, "isSecureRemote") & 1) != 0)
  {
    v12 = 0;
    v13 = v9;
  }
  else
  {
    -[HMDAccessorySettingsMessenger fetchLogEventFromMessage:](v6, "fetchLogEventFromMessage:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (v17)
      v18 = v15;
    else
      v18 = (id)objc_msgSend(v15, "mutableCopy");
    v19 = v18;

    objc_msgSend(v15, "responseHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)buf, v6);
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke;
    v27[3] = &unk_1E89BCDD0;
    objc_copyWeak(&v30, (id *)buf);
    v12 = v14;
    v28 = v12;
    v21 = v20;
    v29 = v21;
    objc_msgSend(v19, "setResponseHandler:", v27);
    v13 = v19;

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

  }
  -[HMDAccessorySettingsMessenger legacyMessageForMessage:](v6, "legacyMessageForMessage:", v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsMessenger messageRouter](v6, "messageRouter");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke_2;
  v25[3] = &unk_1E89BC828;
  v25[4] = v6;
  v26 = v13;
  v24 = v13;
  objc_msgSend(v23, "routeMessage:localHandler:", v22, v25);

}

- (void)routeAccessorySettingsUpdateRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingsMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing accessory settings update request message: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDAccessorySettingsMessenger legacyMessageForMessage:](v6, "legacyMessageForMessage:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingsMessenger messageRouter](v6, "messageRouter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__HMDAccessorySettingsMessenger_routeAccessorySettingsUpdateRequestMessage___block_invoke;
  v12[3] = &unk_1E89BC828;
  v12[4] = v6;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "routeMessage:localHandler:", v9, v12);

}

- (id)legacyMessageForMessage:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDAccessorySettingsMessenger legacyMessageReceiver](self, "legacyMessageReceiver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageTargetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithTarget:", v8);
  objc_msgSend(v5, "setDestination:", v9);

  return v5;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (HMDMessageRouter)messageRouter
{
  return (HMDMessageRouter *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAccessorySettingsLocalMessageHandler)messageHandler
{
  return (HMDAccessorySettingsLocalMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (HMDAccessorySettingsLegacyMessageReceiver)legacyMessageReceiver
{
  return (HMDAccessorySettingsLegacyMessageReceiver *)objc_getProperty(self, a2, 40, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_legacyMessageReceiver, 0);
  objc_storeStrong((id *)&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_messageRouter, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

void __76__HMDAccessorySettingsMessenger_routeAccessorySettingsUpdateRequestMessage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAccessorySettingsUpdateRequestMessage:", *(_QWORD *)(a1 + 40));

}

void __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    objc_msgSend(WeakRetained, "updateAndPostFetchSettingsEvent:responsePayload:responseError:", v8, v5, v10);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v10, v5);

}

void __75__HMDAccessorySettingsMessenger_routeAccessorySettingsFetchRequestMessage___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "messageHandler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleAccessorySettingsFetchRequestMessage:", *(_QWORD *)(a1 + 40));

}

void __123__HMDAccessorySettingsMessenger_sendUpdateAccessorySettingRequestWithAccessoryUUID_keyPath_settingValue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_ERROR, "%{public}@Send update request responded with error: %@", (uint8_t *)&v13, 0x16u);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Send update request responded", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __111__HMDAccessorySettingsMessenger_sendFetchAccessorySettingsRequestWithAccessoryUUID_keyPaths_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA2E8]), "initWithPayload:", v6);
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v7)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543362;
        v23 = v12;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Send fetch request responded", (uint8_t *)&v22, 0xCu);

      }
      objc_autoreleasePoolPop(v8);
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v7, "fetchResults");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v6;
        _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode fetch request response payload: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CBA2C8], "fetchResultsWithKeyPaths:failureType:", *(_QWORD *)(a1 + 40), 3);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v14;
    (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, v14);

  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Send fetch request responded with error: %@", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CBA2C8], "fetchResultsWithKeyPaths:failureType:", *(_QWORD *)(a1 + 40), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v7);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_163668 != -1)
    dispatch_once(&logCategory__hmf_once_t11_163668, &__block_literal_global_163669);
  return (id)logCategory__hmf_once_v12_163670;
}

void __44__HMDAccessorySettingsMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_163670;
  logCategory__hmf_once_v12_163670 = v0;

}

@end
