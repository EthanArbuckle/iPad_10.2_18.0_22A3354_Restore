@implementation CATSharingDeviceDiscovery

- (CATSharingDeviceDiscovery)initWithDiscoveryPrimitives:(id)a3 delegate:(id)a4 delegateOperationQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  CATSharingDeviceDiscovery *v12;
  CATSharingDeviceDiscovery *v13;
  NSArray *nearbyDevices;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CATSharingDeviceDiscovery;
  v12 = -[CATSharingDeviceDiscovery init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->mDiscoveryPrimitives, a3);
    objc_storeWeak((id *)&v13->mDelegate, v10);
    objc_storeStrong((id *)&v13->mDelegationQueue, a5);
    nearbyDevices = v13->_nearbyDevices;
    v13->_nearbyDevices = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  return v13;
}

- (void)activate
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__CATSharingDeviceDiscovery_activate__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __37__CATSharingDeviceDiscovery_activate__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_activate");

}

- (void)invalidate
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;
  _QWORD block[4];
  id v9;

  objc_initWeak(&location, self);
  v2 = MEMORY[0x24BDAC760];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__CATSharingDeviceDiscovery_invalidate__block_invoke;
  v5[3] = &unk_24C1C58B0;
  objc_copyWeak(&v6, &location);
  v3 = v5;
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_24C1C5998;
  v9 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__CATSharingDeviceDiscovery_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CATErrorWithCodeAndUserInfo(701, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_invalidateWithError:", v1);

}

- (id)pairingTerminalForDevice:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  CATDeviceSessionBackedDevicePairingTerminal *v9;
  void *v11;

  v5 = a3;
  -[CATSharingDeviceDiscovery nearbyDevices](self, "nearbyDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingDeviceDiscovery.m"), 82, CFSTR("Device is not present in nearbyDevices"));

  }
  -[CATSharingDiscoveryPrimitives sessionForDevice:](self->mDiscoveryPrimitives, "sessionForDevice:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CATDeviceSessionBackedDevicePairingTerminal initWithDeviceSession:]([CATDeviceSessionBackedDevicePairingTerminal alloc], "initWithDeviceSession:", v8);

  return v9;
}

- (void)_activate
{
  NSObject *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  CATSharingDiscoveryPrimitives *mDiscoveryPrimitives;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CATGetCatalystQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v4);

  if (-[CATSharingDeviceDiscovery invalidated](self, "invalidated"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CATSharingDeviceDiscovery.m"), 96, CFSTR("Terminal must not be invalidated"));

  }
  _CATLogGeneral_4();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v7;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_209592000, v5, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  mDiscoveryPrimitives = self->mDiscoveryPrimitives;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__CATSharingDeviceDiscovery__activate__block_invoke;
  v11[3] = &unk_24C1C5C28;
  objc_copyWeak(&v12, (id *)buf);
  -[CATSharingDiscoveryPrimitives activateWithCompletion:](mDiscoveryPrimitives, "activateWithCompletion:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __38__CATSharingDeviceDiscovery__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (!v3)
      objc_msgSend(WeakRetained, "addPrimitiveHandlers");
    v6 = (void *)v5[3];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__CATSharingDeviceDiscovery__activate__block_invoke_2;
    v7[3] = &unk_24C1C5C00;
    v7[4] = v5;
    v8 = v3;
    objc_msgSend(v6, "addOperationWithBlock:", v7);

  }
}

void __38__CATSharingDeviceDiscovery__activate__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "deviceDiscovery:didActivateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_invalidateWithError:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CATOperationQueue *mDelegationQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CATGetCatalystQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v6);

  _CATLogGeneral_4();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_209592000, v7, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", buf, 0x16u);

  }
  -[CATSharingDeviceDiscovery setInvalidated:](self, "setInvalidated:", 1);
  -[CATSharingDeviceDiscovery removePrimitiveHandlers](self, "removePrimitiveHandlers");
  -[CATSharingDiscoveryPrimitives deactivate](self->mDiscoveryPrimitives, "deactivate");
  v18 = *MEMORY[0x24BDD1398];
  v19 = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CATErrorWithCodeAndUserInfo(700, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak((id *)buf, self);
  mDelegationQueue = self->mDelegationQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__CATSharingDeviceDiscovery__invalidateWithError___block_invoke;
  v15[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v17, (id *)buf);
  v14 = v12;
  v16 = v14;
  -[CATOperationQueue addOperationWithBlock:](mDelegationQueue, "addOperationWithBlock:", v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __50__CATSharingDeviceDiscovery__invalidateWithError___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "deviceDiscovery:hasInvalidated:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)addPrimitiveHandlers
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke;
  v8[3] = &unk_24C1C5C28;
  objc_copyWeak(&v9, &location);
  -[CATSharingDiscoveryPrimitives setInvalidationHandler:](self->mDiscoveryPrimitives, "setInvalidationHandler:", v8);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_3;
  v6[3] = &unk_24C1C6050;
  objc_copyWeak(&v7, &location);
  -[CATSharingDiscoveryPrimitives setDeviceFoundHandler:](self->mDiscoveryPrimitives, "setDeviceFoundHandler:", v6);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_5;
  v4[3] = &unk_24C1C6050;
  objc_copyWeak(&v5, &location);
  -[CATSharingDiscoveryPrimitives setDeviceLostHandler:](self->mDiscoveryPrimitives, "setDeviceLostHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_2;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateWithError:", *(_QWORD *)(a1 + 32));

}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_4;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceFound:", *(_QWORD *)(a1 + 32));

}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_6;
  v8[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = v3;
  v9 = v5;
  v6 = v8;
  CATGetCatalystQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __CATPerformBlock_block_invoke_10;
  block[3] = &unk_24C1C5998;
  v12 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v10);
}

void __49__CATSharingDeviceDiscovery_addPrimitiveHandlers__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "deviceLost:", *(_QWORD *)(a1 + 32));

}

- (void)deviceFound:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATSharingDeviceDiscovery nearbyDevices](self, "nearbyDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "addObject:", v4);
  v7 = (void *)objc_msgSend(v8, "copy");
  -[CATSharingDeviceDiscovery setNearbyDevices:](self, "setNearbyDevices:", v7);

}

- (void)deviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  CATOperationQueue *mDelegationQueue;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v4 = a3;
  CATGetCatalystQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v5);

  -[CATSharingDeviceDiscovery nearbyDevices](self, "nearbyDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", v4);
  v8 = (void *)objc_msgSend(v7, "copy");
  -[CATSharingDeviceDiscovery setNearbyDevices:](self, "setNearbyDevices:", v8);

  objc_initWeak(&location, self);
  mDelegationQueue = self->mDelegationQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__CATSharingDeviceDiscovery_deviceLost___block_invoke;
  v11[3] = &unk_24C1C5CE0;
  objc_copyWeak(&v13, &location);
  v10 = v4;
  v12 = v10;
  -[CATOperationQueue addOperationWithBlock:](mDelegationQueue, "addOperationWithBlock:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __40__CATSharingDeviceDiscovery_deviceLost___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained(WeakRetained + 2);
    objc_msgSend(v3, "deviceDiscovery:didLoseDevice:", v4, *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

- (void)removePrimitiveHandlers
{
  NSObject *v3;

  CATGetCatalystQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  CATAssertIsQueue(v3);

  -[CATSharingDiscoveryPrimitives setInvalidationHandler:](self->mDiscoveryPrimitives, "setInvalidationHandler:", 0);
  -[CATSharingDiscoveryPrimitives setDeviceFoundHandler:](self->mDiscoveryPrimitives, "setDeviceFoundHandler:", 0);
  -[CATSharingDiscoveryPrimitives setDeviceLostHandler:](self->mDiscoveryPrimitives, "setDeviceLostHandler:", 0);
}

- (NSArray)nearbyDevices
{
  return self->_nearbyDevices;
}

- (void)setNearbyDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyDevices, 0);
  objc_storeStrong((id *)&self->mDelegationQueue, 0);
  objc_destroyWeak((id *)&self->mDelegate);
  objc_storeStrong((id *)&self->mDiscoveryPrimitives, 0);
}

@end
