@implementation HMDIDSProxyMessageTransport

- (HMDIDSProxyMessageTransport)initWithAccountRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDIDSProxyMessageTransport *v7;
  HMDIDSProxyMessageTransport *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  HMDIDSProxyMessageTransport *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "proxyService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDIDSProxyMessageTransport;
    v7 = -[HMDIDSMessageTransport initWithAccountRegistry:](&v19, sel_initWithAccountRegistry_, v4);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->super._service, v6);
      if (+[HMDDeviceCapabilities isCompanionCapable](HMDDeviceCapabilities, "isCompanionCapable"))
      {
        +[HMDWatchManager sharedManager](HMDWatchManager, "sharedManager");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = 176;
LABEL_10:
        v17 = *(Class *)((char *)&v8->super.super.super.super.super.isa + v10);
        *(Class *)((char *)&v8->super.super.super.super.super.isa + v10) = (Class)v9;

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "productPlatform");

      if (v16 == 3)
      {
        +[HMDCompanionManager sharedManager](HMDCompanionManager, "sharedManager");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = 184;
        goto LABEL_10;
      }
    }
LABEL_11:
    self = v8;
    v14 = self;
    goto LABEL_12;
  }
  v11 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v13;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@A proxy service is required", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v14 = 0;
LABEL_12:

  return v14;
}

- (BOOL)isSecure
{
  return 1;
}

- (int64_t)qualityOfService
{
  return 1;
}

- (id)remoteMessageFromMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HMDRemoteDeviceMessageDestination *v15;
  void *v16;
  HMDRemoteDeviceMessageDestination *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "remoteMessageFromMessage:secure:accountRegistry:", v4, -[HMDIDSProxyMessageTransport isSecure](self, "isSecure"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDIDSProxyMessageTransport watchDeviceForDevice:](self, "watchDeviceForDevice:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = (void *)MEMORY[0x227676638]();
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543874;
        v20 = v13;
        v21 = 2112;
        v22 = v14;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Replacing device destination, %@, with device: %@", (uint8_t *)&v19, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v15 = [HMDRemoteDeviceMessageDestination alloc];
      objc_msgSend(v8, "target");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[HMDRemoteDeviceMessageDestination initWithTarget:device:](v15, "initWithTarget:device:", v16, v10);

      objc_msgSend(v5, "setDestination:", v17);
    }

  }
  return v5;
}

- (id)deviceForSenderContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "deviceHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSProxyMessageTransport deviceForHandle:](self, "deviceForHandle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)deviceForHandle:(id)a3
{
  void *v4;
  void *v5;

  +[HMDDevice deviceWithHandle:](HMDDevice, "deviceWithHandle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSProxyMessageTransport watchDeviceForDevice:](self, "watchDeviceForDevice:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)watchDeviceForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDIDSProxyMessageTransport companionManager](self, "companionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[HMDIDSProxyMessageTransport watchManager](self, "watchManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      -[HMDIDSProxyMessageTransport watchManager](self, "watchManager", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "watches");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v9);
            v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if ((objc_msgSend(v17, "isRelatedToDevice:", v4) & 1) != 0)
            {
              v10 = v17;
              goto LABEL_16;
            }
          }
          v14 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v14)
            continue;
          break;
        }
      }

    }
    goto LABEL_14;
  }
  -[HMDIDSProxyMessageTransport companionManager](self, "companionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "companion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRelatedToDevice:", v4);

  if (!v8)
  {
LABEL_14:
    v18 = v4;
    goto LABEL_17;
  }
  -[HMDIDSProxyMessageTransport companionManager](self, "companionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "companion");
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v18 = v10;

LABEL_17:
  return v18;
}

- (int)transportType
{
  return 4;
}

- (BOOL)canSendMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7 || (objc_msgSend(v4, "restriction") & 4) == 0)
  {
LABEL_15:
    v12 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDIDSProxyMessageTransport isDeviceConnected:](self, "isDeviceConnected:", v8);

  if (!v9)
  {
    v17 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v19;
      v24 = 2112;
      v25 = v20;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@Cannot send message, the device, %@, is not currently connected", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    goto LABEL_15;
  }
  objc_msgSend(v7, "device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDIDSProxyMessageTransport watchDeviceForDevice:](self, "watchDeviceForDevice:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend((id)objc_opt_class(), "transportSupportsDevice:", v11);
  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Cannot send message, the device, %@, is not supported", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

LABEL_16:
  return v12;
}

- (BOOL)isDeviceConnected:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDIDSMessageTransport service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceForIDSService:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isConnected");
  return (char)v4;
}

- (id)sendMessage:(id)a3 fromHandle:(id)a4 destination:(id)a5 priority:(int64_t)a6 timeout:(double)a7 options:(unint64_t)a8 queueOneID:(id)a9 error:(id *)a10
{
  objc_super v11;

  if (a6 != 100 && a7 == 0.0)
    a7 = 180.0;
  v11.receiver = self;
  v11.super_class = (Class)HMDIDSProxyMessageTransport;
  -[HMDIDSMessageTransport sendMessage:fromHandle:destination:priority:timeout:options:queueOneID:error:](&v11, sel_sendMessage_fromHandle_destination_priority_timeout_options_queueOneID_error_, a3, 0, a5, a7, a10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v15)
    goto LABEL_7;
  +[HMDDeviceHandle deviceHandleForDestination:](HMDDeviceHandle, "deviceHandleForDestination:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_6:

LABEL_7:
    v22.receiver = self;
    v22.super_class = (Class)HMDIDSProxyMessageTransport;
    -[HMDIDSMessageTransport service:account:incomingMessage:fromID:context:](&v22, sel_service_account_incomingMessage_fromID_context_, v12, v13, v14, v15, v16);
    goto LABEL_8;
  }
  -[HMDIDSProxyMessageTransport deviceForHandle:](self, "deviceForHandle:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18 || (objc_msgSend((id)objc_opt_class(), "transportSupportsDevice:", v18) & 1) != 0)
  {

    goto LABEL_6;
  }
  v19 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v21;
    v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@Dropping incoming message from unsupported device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);

LABEL_8:
}

- (HMDWatchManager)watchManager
{
  return self->_watchManager;
}

- (HMDCompanionManager)companionManager
{
  return self->_companionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companionManager, 0);
  objc_storeStrong((id *)&self->_watchManager, 0);
}

+ (unint64_t)restriction
{
  return 4;
}

+ (int64_t)priorityForMessage:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "qualityOfService");
  switch(v3)
  {
    case 17:
      return 200;
    case 9:
      return 100;
    case -1:
      return 200;
  }
  return 300;
}

+ (BOOL)transportSupportsDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  HMDHomeKitVersion *v6;
  char v7;

  v3 = a3;
  objc_msgSend(v3, "version");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "version");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("3.0"));
    v7 = objc_msgSend(v5, "isAtLeastVersion:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_233723 != -1)
    dispatch_once(&logCategory__hmf_once_t3_233723, &__block_literal_global_233724);
  return (id)logCategory__hmf_once_v4_233725;
}

void __42__HMDIDSProxyMessageTransport_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_233725;
  logCategory__hmf_once_v4_233725 = v0;

}

@end
