@implementation HMDSiriServer

- (HMDSiriServer)init
{
  id v2;
  NSObject *inactive;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;
  HMDNotificationRegistration *v8;
  void *v9;
  HMDSiriAccessoryMonitor *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HMDSiriServer;
  v2 = -[HMDSiriServer init](&v13, sel_init);
  if (v2)
  {
    inactive = dispatch_workloop_create_inactive("HMDSiriServer-Audio");
    dispatch_workloop_set_autorelease_frequency(inactive, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_workloop_set_scheduler_priority();
    dispatch_workloop_set_cpupercent();
    dispatch_set_qos_class_fallback();
    dispatch_activate(inactive);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = inactive;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create_with_target_V2("HMDSiriServer", v5, *((dispatch_queue_t *)v2 + 3));
    v7 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v6;

    v8 = -[HMDNotificationRegistration initWithRegisterer:]([HMDNotificationRegistration alloc], "initWithRegisterer:", v2);
    v9 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v8;

    v10 = -[HMDSiriAccessoryMonitor initWithDelegate:]([HMDSiriAccessoryMonitor alloc], "initWithDelegate:", v2);
    v11 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v10;

    *((_DWORD *)v2 + 2) = 0;
  }
  return (HMDSiriServer *)v2;
}

- (void)setTargetableAccessory:(id)a3 withControllers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDSiriServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HMDSiriServer_setTargetableAccessory_withControllers___block_invoke;
  block[3] = &unk_1E89C20C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)registerForMessages
{
  void *v3;
  HMDSiriServer *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Registering for messages.", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDSiriServer notificationRegistration](v4, "notificationRegistration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:name:object:", sel_handleAccessoryHasBulkSendDataStream_, CFSTR("HMDAccessoryDoesSupportBulkSendDataStreamNotification"), 0);

  -[HMDSiriServer notificationRegistration](v4, "notificationRegistration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:name:object:", sel_handleAccessoryConfigured_, CFSTR("HMDAccessoryConnectedNotification"), 0);

  -[HMDSiriServer notificationRegistration](v4, "notificationRegistration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:name:object:", sel_handleAccessoryUnconfigured_, CFSTR("HMDAccessoryDisconnectedNotification"), 0);

  -[HMDSiriServer notificationRegistration](v4, "notificationRegistration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:name:object:", sel_handleAccessoryRemoved_, CFSTR("HMDHomeAccessoryRemovedNotification"), 0);

}

- (void)handleAccessoryHasBulkSendDataStream:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDSiriServer queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__HMDSiriServer_handleAccessoryHasBulkSendDataStream___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)handleAccessoryConfigured:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDSiriServer queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __43__HMDSiriServer_handleAccessoryConfigured___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)handleAccessoryUnconfigured:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDSiriServer _handleDisconnectForAccessory:](self, "_handleDisconnectForAccessory:", v4);

}

- (void)handleAccessoryRemoved:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDSiriServer _handleDisconnectForAccessory:](self, "_handleDisconnectForAccessory:", v4);

}

- (void)_handleDisconnectForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDSiriServer *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling disconnect for %@/%@.", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    -[HMDSiriServer queue](v8, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__HMDSiriServer__handleDisconnectForAccessory___block_invoke;
    v14[3] = &unk_1E89C2328;
    v14[4] = v8;
    v15 = v6;
    dispatch_async(v13, v14);

  }
}

- (void)_setupSiriPlugin
{
  void *v3;
  HMDSiriRemoteInputServer *v4;
  HMDSiriRemoteInputServer *v5;
  id v6;

  -[HMDSiriServer siriInputServer](self, "siriInputServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [HMDSiriRemoteInputServer alloc];
    -[HMDSiriServer queue](self, "queue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5 = -[HMDSiriRemoteInputServer initWithQueue:](v4, "initWithQueue:", v6);
    -[HMDSiriServer setSiriInputServer:](self, "setSiriInputServer:", v5);

  }
}

- (void)_maybeTearDownSiriPlugin
{
  void *v3;
  void *v4;
  id v5;

  -[HMDSiriServer siriUISession](self, "siriUISession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[HMDSiriServer siriInputServer](self, "siriInputServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    -[HMDSiriServer siriInputServer](self, "siriInputServer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");
    v3 = v5;
  }

}

- (void)_setupSiriUIContext
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  HMDSiriServer *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMDSiriServer siriUISession](self, "siriUISession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[HMDSiriSession siriSessionForUI](HMDSiriSession, "siriSessionForUI");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HMDSiriServer siriInputServer](self, "siriInputServer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "registerSiriSession:", v4);

      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if ((v6 & 1) != 0)
      {
        if (v10)
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = 138543618;
          v16 = v11;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Created UI session with session id %@", (uint8_t *)&v15, 0x16u);

        }
        objc_autoreleasePoolPop(v7);
        -[HMDSiriServer setSiriUISession:](v8, "setSiriUISession:", v4);
        goto LABEL_13;
      }
      if (v10)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        v14 = "%{public}@Created UI session but it failed to register properly; aborting.";
        goto LABEL_11;
      }
    }
    else
    {
      v7 = (void *)MEMORY[0x1D17BA0A0]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        v14 = "%{public}@Unable to create UI session; aborting.";
LABEL_11:
        _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v15, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v7);
LABEL_13:

  }
}

- (void)_tearDownSiriUIContext
{
  void *v3;
  void *v4;
  id v5;

  -[HMDSiriServer siriUISession](self, "siriUISession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDSiriServer siriUISession](self, "siriUISession");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HMDSiriServer setSiriUISession:](self, "setSiriUISession:", 0);
    -[HMDSiriServer siriInputServer](self, "siriInputServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deregisterSiriSession:", v5);

    -[HMDSiriServer _maybeTearDownSiriPlugin](self, "_maybeTearDownSiriPlugin");
  }
}

- (void)_checkSiriSupportByAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDSiriServer *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "canAcceptBulkSendListeners") & 1) != 0)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke;
    v13[3] = &unk_1E89AEDE8;
    v13[4] = self;
    v14 = v4;
    objc_msgSend(v14, "getSupportedSiriAudioConfiguration:", v13);

  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Marking accessory not ready for connection due to missing HDS (%@/%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDSiriServer siriAccessoryMonitor](v6, "siriAccessoryMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessory:setSupportsDragonSiri:", v4, 0);

  }
}

- (BOOL)_isSiriInputType:(int64_t)a3 supportedOnAccessory:(id)a4 siriAudioConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  HMDSiriServer *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  HMDSiriServer *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDSiriServer *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  HMDSiriServer *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  _BYTE v61[28];
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v9
    || (objc_msgSend(v9, "supportedConfigurations"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "UUIDString");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v35;
      v60 = 2112;
      *(_QWORD *)v61 = v36;
      *(_WORD *)&v61[8] = 2112;
      *(_QWORD *)&v61[10] = v38;
      _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_DEBUG, "%{public}@Marking accessory not ready for connection due to missing Siri/Audio ability (%@/%@)", buf, 0x20u);

    }
    goto LABEL_17;
  }
  if (objc_msgSend(v10, "siriInputType") != a3)
  {
    v32 = (void *)MEMORY[0x1D17BA0A0]();
    v33 = self;
    HMFGetOSLogHandle();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v10, "siriInputType");
      objc_msgSend(v8, "name");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "UUIDString");
      v56 = v32;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v59 = v40;
      v60 = 2048;
      *(_QWORD *)v61 = a3;
      *(_WORD *)&v61[8] = 2048;
      *(_QWORD *)&v61[10] = v41;
      *(_WORD *)&v61[18] = 2112;
      *(_QWORD *)&v61[20] = v42;
      v62 = 2112;
      v63 = (uint64_t)v44;
      _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_INFO, "%{public}@Checking for input type %ld, but accessory has input type %ld (%@/%@)", buf, 0x34u);

      v32 = v56;
    }

LABEL_17:
    objc_autoreleasePoolPop(v32);
    v14 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v10, "supportedConfigurations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSiriServer _getBestAudioCodecConfiguration:](self, "_getBestAudioCodecConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13 != 0;
  if (v13)
  {
    objc_msgSend(v10, "selectedConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqual:", v15);

    if ((v16 & 1) == 0)
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = v18;
        objc_msgSend(v52, "UUIDString");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "selectedConfiguration");
        *(_DWORD *)buf = 138544386;
        v59 = v50;
        v60 = 2112;
        *(_QWORD *)v61 = v21;
        *(_WORD *)&v61[8] = 2112;
        *(_QWORD *)&v61[10] = v22;
        v23 = (void *)v22;
        *(_WORD *)&v61[18] = 2112;
        *(_QWORD *)&v61[20] = v13;
        v62 = 2112;
        v63 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v63;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Need to set the audio configuration (%@/%@) %@ != %@", buf, 0x34u);

        v18 = v54;
      }

      objc_autoreleasePoolPop(v18);
      v17 = objc_msgSend(v8, "setSelectedSiriAudioConfiguration:", v13);
    }
    v25 = (void *)MEMORY[0x1D17BA0A0](v17);
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v55 = v25;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v59 = v28;
      v60 = 2112;
      *(_QWORD *)v61 = v29;
      *(_WORD *)&v61[8] = 2112;
      *(_QWORD *)&v61[10] = v31;
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Marking accessory READY for connection (%@/%@)", buf, 0x20u);

      v25 = v55;
    }
  }
  else
  {
    v25 = (void *)MEMORY[0x1D17BA0A0]();
    v46 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "supportedConfigurations");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v57, "count");
      objc_msgSend(v8, "name");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "UUIDString");
      *(_DWORD *)buf = 138544130;
      v59 = v53;
      v60 = 1024;
      *(_DWORD *)v61 = v51;
      *(_WORD *)&v61[4] = 2112;
      *(_QWORD *)&v61[6] = v47;
      *(_WORD *)&v61[14] = 2112;
      *(_QWORD *)&v61[16] = objc_claimAutoreleasedReturnValue();
      v49 = *(void **)&v61[16];
      _os_log_impl(&dword_1CD062000, v27, OS_LOG_TYPE_INFO, "%{public}@Marking accessory not ready for connection due to none of the %u codecs allowed (%@/%@)", buf, 0x26u);

    }
  }

  objc_autoreleasePoolPop(v25);
LABEL_18:

  return v14;
}

- (id)_getBestAudioCodecConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[HMDSiriServer _isAudioCodecSupported:](self, "_isAudioCodecSupported:", v9, (_QWORD)v12))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_isAudioCodecSupported:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "codecType");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_7;
  v5 = (void *)v4;
  objc_msgSend(v3, "codecParameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "codecParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bitRate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "codecParameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sampleRate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_7;
      objc_msgSend(v3, "codecType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "value");

      if (v11 != 3
        || (objc_msgSend(v3, "codecParameters"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v12, "bitRate"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "value"),
            v13,
            v12,
            v14))
      {
LABEL_7:
        LOBYTE(v6) = 0;
        goto LABEL_10;
      }
      objc_msgSend(v3, "codecParameters");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sampleRate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v15, "value") == 1;

    }
  }
LABEL_10:

  return (char)v6;
}

- (void)_removeDataStreamListenerForAccessory:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDSiriServer queue](self, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__HMDSiriServer__removeDataStreamListenerForAccessory___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (id)_getSiriSessionForAccessory:(id)a3
{
  -[HMDSiriServer _setupSiriUIContext](self, "_setupSiriUIContext", a3);
  return -[HMDSiriServer siriUISession](self, "siriUISession");
}

- (void)monitor:(id)a3 needsSiriCapabilityForAccessory:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    -[HMDSiriServer queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__HMDSiriServer_monitor_needsSiriCapabilityForAccessory___block_invoke;
    v9[3] = &unk_1E89C2328;
    v9[4] = self;
    v10 = v7;
    dispatch_async(v8, v9);

  }
}

- (void)monitor:(id)a3 willAllowAccessoryForDragonSiri:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    -[HMDSiriServer queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__HMDSiriServer_monitor_willAllowAccessoryForDragonSiri___block_invoke;
    v9[3] = &unk_1E89C2328;
    v9[4] = self;
    v10 = v7;
    dispatch_async(v8, v9);

  }
}

- (void)monitor:(id)a3 willNotAllowAccessoryForDragonSiri:(id)a4
{
  -[HMDSiriServer _removeDataStreamListenerForAccessory:](self, "_removeDataStreamListenerForAccessory:", a4);
}

- (void)monitorHasNoAccessoriesForDragonSiri:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  -[HMDSiriServer queue](self, "queue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HMDSiriServer_monitorHasNoAccessoriesForDragonSiri___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)accessory:(id)a3 didReceiveBulkSessionCandidate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  HMDSiriServer *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMDSiriServer queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke;
    block[3] = &unk_1E89C20C8;
    block[4] = self;
    v17 = v10;
    v18 = v7;
    dispatch_async(v11, block);

  }
  else
  {
    v12 = (void *)MEMORY[0x1D17BA0A0]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Accessory provided is not a HMDHAPAccessory; cannot activate corresponding siri session.",
        buf,
        0xCu);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)accessoryDidStartListening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSiriServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HMDSiriServer_accessoryDidStartListening___block_invoke;
  v7[3] = &unk_1E89C2328;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)accessory:(id)a3 didCloseDataStreamWithError:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDSiriServer *v10;

  v5 = a3;
  -[HMDSiriServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__HMDSiriServer_accessory_didCloseDataStreamWithError___block_invoke;
  v8[3] = &unk_1E89C2328;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_workloop)audioWorkloop
{
  return self->_audioWorkloop;
}

- (void)setAudioWorkloop:(id)a3
{
  objc_storeStrong((id *)&self->_audioWorkloop, a3);
}

- (HMDNotificationRegistration)notificationRegistration
{
  return self->_notificationRegistration;
}

- (HMDSiriRemoteInputServer)siriInputServer
{
  return self->_siriInputServer;
}

- (void)setSiriInputServer:(id)a3
{
  objc_storeStrong((id *)&self->_siriInputServer, a3);
}

- (HMDSiriAccessoryMonitor)siriAccessoryMonitor
{
  return self->_siriAccessoryMonitor;
}

- (void)setSiriAccessoryMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_siriAccessoryMonitor, a3);
}

- (HMDSiriSession)siriUISession
{
  return self->_siriUISession;
}

- (void)setSiriUISession:(id)a3
{
  objc_storeStrong((id *)&self->_siriUISession, a3);
}

- (unsigned)targetControlIdentifier
{
  return self->_targetControlIdentifier;
}

- (void)setTargetControlIdentifier:(unsigned int)a3
{
  self->_targetControlIdentifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriUISession, 0);
  objc_storeStrong((id *)&self->_siriAccessoryMonitor, 0);
  objc_storeStrong((id *)&self->_siriInputServer, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_audioWorkloop, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __55__HMDSiriServer_accessory_didCloseDataStreamWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@DataStream closed for accessory %@/%@.", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);

}

void __44__HMDSiriServer_accessoryDidStartListening___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543362;
    v14 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory's DataStream started.", (uint8_t *)&v13, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  v6 = *(id *)(a1 + 40);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "targetControlIdentifier"))
      objc_msgSend(v8, "sendTargetControlWhoAmIWithIdentifier:", objc_msgSend(*(id *)(a1 + 32), "targetControlIdentifier"));
  }
  else
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory provided is not a HMDHAPAccessory; cannot send targetControl identifier.",
        (uint8_t *)&v13,
        0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_getSiriSessionForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v17 = (void *)MEMORY[0x1D17BA0A0]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_ERROR, "%{public}@Received new Siri Audio stream but unable to create local context", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v17);
    v21 = *(void **)(a1 + 48);
    v22 = 2;
    goto LABEL_12;
  }
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "activateWithAccessory:metadata:", v3, v4);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v23;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Received new Siri Audio stream but unable to activate Siri.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v21 = *(void **)(a1 + 48);
    v22 = 5;
LABEL_12:
    objc_msgSend(v21, "rejectBulkSendSessionWithStatus:", v22);
    goto LABEL_13;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v10;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@Received new Siri Audio stream; setting it up.",
      buf,
      0xCu);

  }
  objc_autoreleasePoolPop(v6);
  objc_msgSend(v2, "activeSessionToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke_20;
  v24[3] = &unk_1E89AEE10;
  v25 = v11;
  v14 = v2;
  v15 = *(_QWORD *)(a1 + 32);
  v26 = v14;
  v27 = v15;
  v16 = v11;
  objc_msgSend(v12, "acceptBulkSendSessionOnQueue:callback:", v13, v24);

LABEL_13:
}

void __58__HMDSiriServer_accessory_didReceiveBulkSessionCandidate___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activeSessionToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "setActiveBulkSendSession:", v3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = *(id *)(a1 + 48);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Siri session canceled before it began; cleaning up.",
        (uint8_t *)&v10,
        0xCu);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v3, "cancelWithReason:", 2);
  }

}

uint64_t __54__HMDSiriServer_monitorHasNoAccessoriesForDragonSiri___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_tearDownSiriUIContext");
}

uint64_t __57__HMDSiriServer_monitor_willAllowAccessoryForDragonSiri___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory is ready to accept Siri; registering listener (%@/%@)",
      (uint8_t *)&v10,
      0x20u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "_setupSiriPlugin");
  objc_msgSend(*(id *)(a1 + 32), "_setupSiriUIContext");
  return objc_msgSend(*(id *)(a1 + 40), "addDataStreamBulkSendListener:fileType:", *(_QWORD *)(a1 + 32), CFSTR("audio.siri"));
}

uint64_t __57__HMDSiriServer_monitor_needsSiriCapabilityForAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkSiriSupportByAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __55__HMDSiriServer__removeDataStreamListenerForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory no longer able to accept Siri; deregistering listener (%@/%@)",
      (uint8_t *)&v10,
      0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 40), "removeDataStreamBulkSendListener:", *(_QWORD *)(a1 + 32));
}

void __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke_2;
  block[3] = &unk_1E89C20C8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

void __46__HMDSiriServer__checkSiriSupportByAccessory___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isSiriInputType:supportedOnAccessory:siriAudioConfiguration:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)v2)
  {
    v3 = *(void **)(a1 + 40);
    HAPStringFromAccessoryServerSession();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerForSessionRestore:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "siriAccessoryMonitor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessory:setSupportsDragonSiri:", *(_QWORD *)(a1 + 40), v2);

}

void __47__HMDSiriServer__handleDisconnectForAccessory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "siriAccessoryMonitor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory:setSupportsDragonSiri:", *(_QWORD *)(a1 + 40), 0);

}

uint64_t __43__HMDSiriServer_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkSiriSupportByAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__HMDSiriServer_handleAccessoryHasBulkSendDataStream___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory has bulk-send Data Stream capability (%@/%@)", (uint8_t *)&v10, 0x20u);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_checkSiriSupportByAccessory:", *(_QWORD *)(a1 + 40));
}

void __56__HMDSiriServer_setTargetableAccessory_withControllers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "siriAccessoryMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTargetableAccessory:withControllers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  if (!objc_msgSend(*(id *)(a1 + 32), "targetControlIdentifier"))
  {
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTargetControlIdentifier:", identifierForTargetWithUUID(v5, v4));

  }
}

+ (id)sharedSiriServer
{
  return 0;
}

@end
