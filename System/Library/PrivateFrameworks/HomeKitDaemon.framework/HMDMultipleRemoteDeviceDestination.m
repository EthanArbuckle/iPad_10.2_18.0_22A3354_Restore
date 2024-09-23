@implementation HMDMultipleRemoteDeviceDestination

- (HMDMultipleRemoteDeviceDestination)init
{
  HMDMultipleRemoteDeviceDestination *v2;
  HMDMultipleRemoteDeviceDestination *v3;
  NSArray *devices;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDMultipleRemoteDeviceDestination;
  v2 = -[HMDMultipleRemoteDeviceDestination init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    devices = v2->_devices;
    v2->_devices = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v3;
}

- (HMDMultipleRemoteDeviceDestination)initWithTarget:(id)a3 devices:(id)a4
{
  id v6;
  id v7;
  HMDMultipleRemoteDeviceDestination *v8;
  HMDMultipleRemoteDeviceDestination *v9;
  HMDMultipleRemoteDeviceDestination *v11;
  SEL v12;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDMultipleRemoteDeviceDestination;
    v8 = -[HMFMessageDestination initWithTarget:](&v13, sel_initWithTarget_, v6);
    v9 = v8;
    if (v8)
      objc_storeStrong((id *)&v8->_devices, a4);

    return v9;
  }
  else
  {
    v11 = (HMDMultipleRemoteDeviceDestination *)_HMFPreconditionFailure();
    return (HMDMultipleRemoteDeviceDestination *)-[HMDMultipleRemoteDeviceDestination remoteDestinationString](v11, v12);
  }
}

- (id)remoteDestinationString
{
  void *v3;
  HMDMultipleRemoteDeviceDestination *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_FAULT, "%{public}@Cannot get remoteDestinationString for HMDMultipleRemoteDeviceDestination", (uint8_t *)&v8, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  return 0;
}

- (id)remoteDestinationStringForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  objc_msgSend(v3, "remoteDestinationString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "hasSuffix:", CFSTR("inbox.appleid.apple.com")) & 1) == 0)
  {
    v11 = v5;
    goto LABEL_8;
  }
  objc_msgSend(v3, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCurrentAccount");

  if (!v7
    || (objc_msgSend(v3, "localHandles"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "firstObject"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    objc_msgSend(v3, "remoteDestinationString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v10 = v11;
    goto LABEL_9;
  }
  objc_msgSend(v9, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

- (id)allRemoteDestinationStrings
{
  NSArray *devices;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[5];

  devices = self->_devices;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__HMDMultipleRemoteDeviceDestination_allRemoteDestinationStrings__block_invoke;
  v7[3] = &unk_24E78AE50;
  v7[4] = self;
  -[NSArray na_map:](devices, "na_map:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (NSArray)devices
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDevices:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

id __65__HMDMultipleRemoteDeviceDestination_allRemoteDestinationStrings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "remoteDestinationStringForDevice:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Device is not addressable: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

@end
