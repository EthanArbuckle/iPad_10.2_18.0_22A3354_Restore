@implementation HMDSharingDeviceDiscovery

- (void)dealloc
{
  objc_super v3;

  -[HMDSharingDeviceDiscovery stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)HMDSharingDeviceDiscovery;
  -[HMDSharingDeviceDiscovery dealloc](&v3, sel_dealloc);
}

- (SFDeviceDiscovery)deviceDiscovery
{
  SFDeviceDiscovery *deviceDiscovery;
  SFDeviceDiscovery *v4;
  SFDeviceDiscovery *v5;

  deviceDiscovery = self->_deviceDiscovery;
  if (!deviceDiscovery)
  {
    v4 = (SFDeviceDiscovery *)objc_alloc_init(MEMORY[0x1E0D97450]);
    v5 = self->_deviceDiscovery;
    self->_deviceDiscovery = v4;

    deviceDiscovery = self->_deviceDiscovery;
  }
  return deviceDiscovery;
}

- (OS_dispatch_queue)dispatchQueue
{
  void *v2;
  void *v3;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dispatchQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (OS_dispatch_queue *)v3;
}

- (void)setDispatchQueue:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDispatchQueue:", v4);

}

- (unint64_t)discoveryFlags
{
  void *v2;
  unint64_t v3;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "discoveryFlags");

  return v3;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2048;
    v12 = a3;
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Setting device discovery flags to %ld", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscoveryFlags:", a3);

}

- (id)deviceFoundHandler
{
  void *v2;
  void *v3;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceFoundHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceFoundHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceFoundHandler:", v4);

}

- (id)deviceChangedHandler
{
  void *v2;
  void *v3;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceChangedHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceChangedHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceChangedHandler:", v4);

}

- (id)deviceLostHandler
{
  void *v2;
  void *v3;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceLostHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDeviceLostHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeviceLostHandler:", v4);

}

- (void)start
{
  id v2;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateWithCompletion:", &__block_literal_global_73152);

}

- (void)stop
{
  void *v3;

  -[HMDSharingDeviceDiscovery deviceDiscovery](self, "deviceDiscovery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[HMDSharingDeviceDiscovery setDeviceDiscovery:](self, "setDeviceDiscovery:", 0);
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  uint64_t v5;
  id v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = *(_QWORD *)&a4;
  v7 = a5;
  v8 = (objc_class *)MEMORY[0x1E0D973E8];
  v9 = a3;
  v10 = objc_alloc_init(v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__HMDSharingDeviceDiscovery_repairDevice_flags_completion___block_invoke;
  v13[3] = &unk_1E89BFC88;
  v14 = v10;
  v15 = v7;
  v11 = v10;
  v12 = v7;
  objc_msgSend(v11, "repairDevice:flags:completion:", v9, v5, v13);

}

- (void)setDeviceDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDiscovery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDiscovery, 0);
}

uint64_t __59__HMDSharingDeviceDiscovery_repairDevice_flags_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __34__HMDSharingDeviceDiscovery_start__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v6;
      v13 = 2112;
      v14 = v2;
      v7 = "%{public}@Failed to activate SFDeviceDiscovery with error %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v8, v9, v7, (uint8_t *)&v11, v10);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v6;
    v7 = "%{public}@Successfully activated SFDeviceDiscovery.";
    v8 = v5;
    v9 = OS_LOG_TYPE_INFO;
    v10 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v3);
}

@end
