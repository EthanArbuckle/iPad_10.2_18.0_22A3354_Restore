@implementation HMDAppleMediaProfile

- (HMDAppleMediaProfile)initWithAccessory:(id)a3 uniqueIdentifier:(id)a4 services:(id)a5 workQueue:(id)a6
{
  id v10;
  HMDAppleMediaProfile *v11;
  uint64_t v12;
  MPRequestResponseController *controller;
  void *v14;
  void *v15;
  objc_super v17;

  v10 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDAppleMediaProfile;
  v11 = -[HMDMediaProfile initWithAccessory:uniqueIdentifier:services:workQueue:](&v17, sel_initWithAccessory_uniqueIdentifier_services_workQueue_, v10, a4, a5, a6);
  if (v11 && objc_msgSend(v10, "isCurrentAccessory"))
  {
    v12 = objc_opt_new();
    controller = v11->_controller;
    v11->_controller = (MPRequestResponseController *)v12;

    v14 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D4B370], "deviceActivePlayerPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPlayerPath:", v15);

    -[MPRequestResponseController setRequest:](v11->_controller, "setRequest:", v14);
    -[MPRequestResponseController setDelegate:](v11->_controller, "setDelegate:", v11);
    -[MPRequestResponseController beginAutomaticResponseLoading](v11->_controller, "beginAutomaticResponseLoading");

  }
  return v11;
}

- (void)configureWithMessageDispatcher:(id)a3 configurationTracker:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  NSObject *v14;
  HMDAppleMediaProfile *v15;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    dispatch_group_enter(v7);
  -[HMDAccessoryProfile workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__HMDAppleMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke;
  block[3] = &unk_1E89C20C8;
  v13 = v6;
  v14 = v8;
  v15 = self;
  v10 = v8;
  v11 = v6;
  dispatch_async(v9, block);

}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)HMDAppleMediaProfile;
  -[HMDMediaProfile registerForMessages](&v9, sel_registerForMessages);
  -[HMDAccessoryProfile msgDispatcher](self, "msgDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryProfile accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", CFSTR("HMDMediaProfileSetPowerRequestKey"), self, v8, sel__handleSetPower_);

}

- (HMDAppleMediaAccessory)mediaAccessory
{
  void *v2;
  void *v3;
  id v4;

  -[HMDAccessoryProfile accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return (HMDAppleMediaAccessory *)v4;
}

- (void)setMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaProfile *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  HMDAppleMediaProfile *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Setting media system %@ on profile %@", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  objc_storeWeak((id *)&v6->_mediaSystem, v4);
  os_unfair_lock_unlock(&v6->super._lock.lock);
  -[HMDAccessoryProfile msgDispatcher](v6, "msgDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaProfile configureWithMessageDispatcher:configurationTracker:](v6, "configureWithMessageDispatcher:configurationTracker:", v9, 0);

}

- (HMDMediaSystem)mediaSystem
{
  hmf_unfair_data_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->super._lock;
  os_unfair_lock_lock_with_options();
  WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSystem);
  os_unfair_lock_unlock(&p_lock->lock);
  return (HMDMediaSystem *)WeakRetained;
}

- (void)setMediaSession:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = HMFEqualObjects();

  if ((v6 & 1) == 0)
  {
    v11.receiver = self;
    v11.super_class = (Class)HMDAppleMediaProfile;
    -[HMDMediaProfile setMediaSession:](&v11, sel_setMediaSession_, v4);
    os_unfair_lock_lock_with_options();
    WeakRetained = objc_loadWeakRetained((id *)&self->_mediaSystem);
    objc_msgSend(WeakRetained, "setMediaSession:", v4);

    os_unfair_lock_unlock(&self->super._lock.lock);
    -[HMDAppleMediaProfile controller](self, "controller");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HMDAppleMediaProfile controller](self, "controller");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAppleMediaProfile didFinishLoadingRequestForController:](self, "didFinishLoadingRequestForController:", v10);

    }
  }

}

- (BOOL)_updatePlayback:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  HMDAppleMediaProfile *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  objc_super v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HMDAppleMediaProfile;
  if (!-[HMDMediaProfile _updatePlayback:](&v23, sel__updatePlayback_, v4))
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@No local session for mediaProfile - attempting to redispatch the command to resident/device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v10 = *MEMORY[0x1E0CB9580];
    objc_msgSend(v4, "numberForKey:", *MEMORY[0x1E0CB9580]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v22 = 0;
      v12 = __lookupDeviceForRemoteCommands(v7, &v22);
      v13 = v22;
      if (!v12)
      {
        v5 = 0;
        goto LABEL_11;
      }
      +[HMDMediaPropertyWriteRequest writeRequestWithProperty:value:mediaProfile:](HMDMediaPropertyWriteRequest, "writeRequestWithProperty:value:mediaProfile:", v10, v11, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessoryProfile accessory](v7, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v7);
      v24 = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __40__HMDAppleMediaProfile__updatePlayback___block_invoke;
      v19[3] = &unk_1E89C18A8;
      objc_copyWeak(&v21, (id *)buf);
      v20 = v4;
      objc_msgSend(v16, "redispatchMediaWriteRequests:viaDevice:completion:", v17, v13, v19);

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 27);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v13);
    }
    v5 = 1;
LABEL_11:

    goto LABEL_12;
  }
  v5 = 1;
LABEL_12:

  return v5;
}

- (BOOL)_updateRefreshPlayback:(id)a3
{
  id v4;
  void *v5;
  HMDAppleMediaProfile *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  objc_super v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)HMDAppleMediaProfile;
  if (!-[HMDMediaProfile _updateRefreshPlayback:](&v29, sel__updateRefreshPlayback_, v4))
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@No local session for mediaProfile - attempting to redispatch the command to resident/device", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v28 = 0;
    v9 = __lookupDeviceForRemoteCommands(v6, &v28);
    v20 = v28;
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayForKey:", *MEMORY[0x1E0CB9590]);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v25;
        v14 = *MEMORY[0x1E0CB9580];
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v11);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "isEqual:", v14))
            {
              +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v14, v6);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v16);

            }
            ++v15;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v12);
      }

      -[HMDAccessoryProfile accessory](v6, "accessory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v6);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __47__HMDAppleMediaProfile__updateRefreshPlayback___block_invoke;
      v21[3] = &unk_1E89C18A8;
      objc_copyWeak(&v23, (id *)buf);
      v22 = v4;
      objc_msgSend(v18, "redispatchMediaReadRequests:viaDevice:completion:", v10, v20, v21);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v10);
    }

  }
  return 1;
}

- (void)_handleSetValue:(id)a3 withRequestProperty:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  __CFString *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  HMDAppleMediaProfile *v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  HMDRemoteDeviceMessageDestination *v24;
  void *v25;
  HMDRemoteDeviceMessageDestination *v26;
  void *v27;
  void *v28;
  HMDAppleMediaProfile *v29;
  NSObject *v30;
  void *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  HMDAppleMediaProfile *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  HMDAppleMediaProfile *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  __CFString *v49;
  void *v50;
  __CFString *v51;
  __CFString *v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  const __CFString *v57;
  __int16 v58;
  __CFString *v59;
  _QWORD v60[2];

  v60[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  v10 = a5;
  if (!v10)
    _HMFPreconditionFailure();
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  -[HMDAppleMediaProfile mediaAccessory](self, "mediaAccessory");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString device](v12, "device");
  v13 = objc_claimAutoreleasedReturnValue();
  v50 = (void *)v13;
  if (v13)
  {
    v14 = (__CFString *)v13;
    if ((-[__CFString isDeviceReachable](v12, "isDeviceReachable") & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1D17BA0A0]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v55 = v18;
        v56 = 2112;
        v57 = CFSTR("HMDMediaProfileSetPowerRequestKey");
        v58 = 2112;
        v59 = v12;
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Attempting to send message: %@ to unreachable accessory: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v15);
    }
    v19 = (__CFString *)v8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    if (v21)
    {
      v48 = v8;
      v49 = v9;
      v51 = v9;
      v52 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0D285F8];
      v24 = [HMDRemoteDeviceMessageDestination alloc];
      -[HMDAccessoryProfile uniqueIdentifier](self, "uniqueIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v24, "initWithTarget:device:", v25, v14);
      objc_msgSend(v23, "messageWithName:destination:payload:", CFSTR("HMDMediaProfileSetPowerRequestKey"), v26, v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setResponseHandler:", v11);
      if (-[__CFString isCurrentDevice](v14, "isCurrentDevice"))
      {
        -[HMDAppleMediaProfile _handleSetPower:](self, "_handleSetPower:", v27);
      }
      else
      {
        v42 = (void *)MEMORY[0x1D17BA0A0]();
        v43 = self;
        HMFGetOSLogHandle();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v55 = v45;
          v56 = 2112;
          v57 = v14;
          v58 = 2112;
          v59 = v49;
          _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_INFO, "%{public}@Sending remote message to device (%@) for set value execution with request property %@", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v42);
        objc_msgSend(v27, "setSecureRemote:", 1);
        +[HMDSecureRemoteMessageTransport defaultTransport](HMDSecureRemoteMessageTransport, "defaultTransport");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = (void *)objc_msgSend(v27, "copy");
        objc_msgSend(v46, "sendMessage:completionHandler:", v47, 0);

      }
      v8 = v48;
      v32 = v49;
    }
    else
    {
      v35 = (void *)MEMORY[0x1D17BA0A0]();
      v36 = self;
      HMFGetOSLogHandle();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v38;
        v56 = 2112;
        v57 = v19;
        _os_log_impl(&dword_1CD062000, v37, OS_LOG_TYPE_ERROR, "%{public}@The value %@ passed in is either nil or non NSNumber", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v35);
      +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v9, v36);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v9;
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", v22, v39);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDMediaPropertyResponse serializeResponses:](HMDMediaPropertyResponse, "serializeResponses:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v41);

      v21 = 0;
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v31;
      v56 = 2112;
      v57 = v12;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_ERROR, "%{public}@The device of Media Accessory %@ is not found", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v28);
    +[HMDMediaPropertyRequest requestWithProperty:mediaProfile:](HMDMediaPropertyRequest, "requestWithProperty:mediaProfile:", v9, v29);
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = v9;
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyResponse responseWithRequest:error:](HMDMediaPropertyResponse, "responseWithRequest:error:", v21, v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v60[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMediaPropertyResponse serializeResponses:](HMDMediaPropertyResponse, "serializeResponses:", v27);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v34);

  }
}

- (void)sessionAudioControlUpdated:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAppleMediaProfile *v7;
  NSObject *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDAppleMediaProfile mediaSystem](self, "mediaSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Media profile is part of a media system - passing on handling the audio control  update notification for session", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDAppleMediaProfile;
    -[HMDMediaProfile sessionAudioControlUpdated:](&v10, sel_sessionAudioControlUpdated_, v4);
  }

}

- (void)didFinishLoadingRequestForController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDAppleMediaProfile *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v44 = a3;
  -[HMDMediaProfile mediaSession](self, "mediaSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v44, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB95E0]);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("force-notify"));
    v10 = objc_msgSend(v6, "state");
    if (v10 > 6)
      v11 = 3;
    else
      v11 = qword_1CDB8FB00[v10];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB9580]);

    objc_msgSend(v6, "tracklist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shuffleType");
    if (v14 == 1)
      v15 = 2;
    else
      v15 = 1;
    if (v14 == 2)
      v16 = 3;
    else
      v16 = v15;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CB95D8]);

    objc_msgSend(v6, "tracklist");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "repeatType");
    if (v19 == 1)
      v20 = 2;
    else
      v20 = 1;
    if (v19 == 2)
      v21 = 3;
    else
      v21 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CB95A8]);

    objc_msgSend(v6, "tracklist");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CB9568]);

    objc_msgSend(v4, "state");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "volume");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CB95E8]);

    v27 = (void *)objc_msgSend(v7, "copy");
    -[HMDMediaProfile handleSessionUpdatedNotification:](self, "handleSessionUpdatedNotification:", v27);

    v28 = (void *)MEMORY[0x1D17BA0A0]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "UUIDString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v6, "state");
      objc_msgSend(v6, "tracklist");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v41, "shuffleType");
      objc_msgSend(v6, "tracklist");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v40, "repeatType");
      objc_msgSend(v4, "state");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "volume");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tracklist");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "uniqueIdentifier");
      v43 = v28;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545154;
      v46 = v31;
      v47 = 2112;
      v48 = v32;
      v49 = 2048;
      v50 = v38;
      v51 = 2048;
      v52 = v37;
      v53 = 2048;
      v54 = v36;
      v55 = 2112;
      v56 = v33;
      v57 = 2112;
      v58 = v35;
      v59 = 2112;
      v60 = v7;
      _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@didFinishLoadingRequestForController called for mediaSession:%@ pb:%tu s:%tu r:%tu v:%@ m:%@ userInfo:%@", buf, 0x52u);

      v28 = v43;
    }

    objc_autoreleasePoolPop(v28);
  }

}

- (MPRequestResponseController)controller
{
  return (MPRequestResponseController *)objc_getProperty(self, a2, 88, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_destroyWeak((id *)&self->_mediaSystem);
}

void __47__HMDAppleMediaProfile__updateRefreshPlayback___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(void **)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleMediaResponses:message:", v7, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", v6);

  }
}

void __40__HMDAppleMediaProfile__updatePlayback___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  v5 = *(void **)(a1 + 32);
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleMediaResponses:message:", v7, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "respondWithError:", v6);

  }
}

void __76__HMDAppleMediaProfile_configureWithMessageDispatcher_configurationTracker___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  objc_super v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v5.receiver = *(id *)(a1 + 48);
  v5.super_class = (Class)HMDAppleMediaProfile;
  objc_msgSendSuper2(&v5, sel_configureWithMessageDispatcher_configurationTracker_, v3, v2);
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
    dispatch_group_leave(v4);
}

@end
