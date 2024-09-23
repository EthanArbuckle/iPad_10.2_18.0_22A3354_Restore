@implementation HMDMatterSoftwareUpdateProviderDelegate

- (HMDMatterSoftwareUpdateProviderDelegate)initWithHomeManager:(id)a3 accessoryFirmwareUpdateManager:(id)a4
{
  id v6;
  id v7;
  HMDMatterSoftwareUpdateProviderDelegateDataSource *v8;
  HMDMatterSoftwareUpdateProviderDelegate *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HMDMatterSoftwareUpdateProviderDelegateDataSource);
  v9 = -[HMDMatterSoftwareUpdateProviderDelegate initWithHomeManager:accessoryFirmwareUpdateManager:dataSource:](self, "initWithHomeManager:accessoryFirmwareUpdateManager:dataSource:", v7, v6, v8);

  return v9;
}

- (HMDMatterSoftwareUpdateProviderDelegate)initWithHomeManager:(id)a3 accessoryFirmwareUpdateManager:(id)a4 dataSource:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDMatterSoftwareUpdateProviderDelegate *v11;
  HMDMatterSoftwareUpdateProviderDelegate *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDMatterSoftwareUpdateProviderDelegate;
  v11 = -[HMDMatterSoftwareUpdateProviderDelegate init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_homeManager, v8);
    objc_storeWeak((id *)&v12->_accessoryFirmwareUpdateManager, v9);
    objc_storeStrong((id *)&v12->_dataSource, a5);
  }

  return v12;
}

- (void)configureWithSoftwareUpdateProvider:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  HMDMatterSoftwareUpdateProviderDelegate *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMatterSoftwareUpdateProviderDelegate dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMatterAccessorySoftwareUpdateEnabled");

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Configuring with matter software update provider", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "setDelegate:", v8);
    -[HMDMatterSoftwareUpdateProviderDelegate setSoftwareUpdateProvider:](v8, "setSoftwareUpdateProvider:", v4);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v12;
      v15 = 2080;
      v16 = "-[HMDMatterSoftwareUpdateProviderDelegate configureWithSoftwareUpdateProvider:]";
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@%s: Matter Accessory Software Update not enabled.", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)applyUpdateWithPairing:(id)a3 requestParams:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;

  v9 = a3;
  v10 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__HMDMatterSoftwareUpdateProviderDelegate_applyUpdateWithPairing_requestParams_queue_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  dispatch_async((dispatch_queue_t)a5, block);

}

- (void)notifyUpdateWithPairing:(id)a3 params:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__HMDMatterSoftwareUpdateProviderDelegate_notifyUpdateWithPairing_params_queue_completionHandler___block_invoke;
  v16[3] = &unk_24E79B3F0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  dispatch_async((dispatch_queue_t)a5, v16);

}

- (void)notifyCheckFirmwareUpdateSessionWithPairing:(id)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __111__HMDMatterSoftwareUpdateProviderDelegate_notifyCheckFirmwareUpdateSessionWithPairing_queue_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
  block[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  dispatch_async((dispatch_queue_t)a4, block);

}

- (id)_queryImageResponseWithStatus:(id)a3 delayedActionTime:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE4EF98];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithStatus:delayedActionTime:imageURI:softwareVersion:softwareVersionString:updateToken:userConsentNeeded:metadataForRequestor:", v7, v6, 0, 0, 0, 0, 0, 0);

  return v8;
}

- (BOOL)updateUARPFirmwareVersionForAccessory:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  void *v16;
  HMDMatterSoftwareUpdateProviderDelegate *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMatterSoftwareUpdateProviderDelegate accessoryFirmwareUpdateManager](self, "accessoryFirmwareUpdateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UARPAccessoryForHMDAccessory:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firmwareVersion");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11
    && (v12 = (void *)v11,
        objc_msgSend(v9, "firmwareVersion"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", v10),
        v13,
        v12,
        (v14 & 1) != 0))
  {
    v15 = 0;
  }
  else
  {
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firmwareVersion");
      v23 = v16;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v25 = v19;
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_INFO, "%{public}@%@ Firmware version from uarpAccessory (%@) doesn't match accessory version (%@)", buf, 0x2Au);

      v16 = v23;
    }

    objc_autoreleasePoolPop(v16);
    v15 = 1;
  }

  return v15;
}

- (void)queryImageWithPairing:(id)a3 requestParams:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __103__HMDMatterSoftwareUpdateProviderDelegate_queryImageWithPairing_requestParams_queue_completionHandler___block_invoke;
  v16[3] = &unk_24E79B3F0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v13 = v11;
  v14 = v12;
  v15 = v10;
  dispatch_async((dispatch_queue_t)a5, v16);

}

- (void)notifyUpdateRequestedForHMDHAPAccessory:(id)a3 isUserTriggered:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMDMatterSoftwareUpdateProviderDelegate *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDMatterSoftwareUpdateProviderDelegate *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  HMDMatterSoftwareUpdateProviderDelegate *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138543874;
    v31 = v10;
    v32 = 2112;
    v33 = v11;
    v34 = 2112;
    v35 = v12;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ notifyUpdateRequestedForHMDHAPAccessory, isUserTriggered: %@", (uint8_t *)&v30, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if ((objc_msgSend(v6, "supportsCHIP") & 1) != 0)
  {
    -[HMDMatterSoftwareUpdateProviderDelegate softwareUpdateProvider](v8, "softwareUpdateProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "firmwareUpdateProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "matterFirmwareUpdateProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v6, "firmwareUpdateProfile");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "matterFirmwareUpdateProfile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "configureWithMatterSoftwareUpdateProviderDelegate:", v8);

      }
      objc_msgSend(v6, "chipStorage");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nodeID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "notifyUpdateRequestedForNodeID:isUserTriggered:", v19, v4);

    }
    else
    {
      v25 = (void *)MEMORY[0x227676638]();
      v26 = v8;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543618;
        v31 = v28;
        v32 = 2112;
        v33 = v29;
        _os_log_impl(&dword_2218F0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@ Couldn't get a strong ref to the software update provider", (uint8_t *)&v30, 0x16u);

      }
      objc_autoreleasePoolPop(v25);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = v8;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "shortDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v23;
      v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_ERROR, "%{public}@%@ Not a matter accessory", (uint8_t *)&v30, 0x16u);

    }
    objc_autoreleasePoolPop(v20);
  }

}

- (BOOL)canEstablishConnectionForHMDHAPAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDMatterSoftwareUpdateProviderDelegate *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  HMDMatterSoftwareUpdateProviderDelegate *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDMatterSoftwareUpdateProviderDelegate *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543618;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ canEstablishConnectionForHMDHAPAccessory", (uint8_t *)&v25, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if ((objc_msgSend(v4, "supportsCHIP") & 1) != 0)
  {
    -[HMDMatterSoftwareUpdateProviderDelegate softwareUpdateProvider](v6, "softwareUpdateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "chipStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nodeID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "canEstablishConnectionForNodeID:", v12);

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = v6;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543618;
        v26 = v22;
        v27 = 2112;
        v28 = v23;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@%@ Couldn't get a strong ref to the software update provider", (uint8_t *)&v25, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v13 = 0;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543618;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@%@ Not a matter accessory", (uint8_t *)&v25, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    v13 = 0;
  }

  return v13;
}

- (void)resetOTAProviderStateForHMDHAPAccessory:(id)a3
{
  id v4;
  void *v5;
  HMDMatterSoftwareUpdateProviderDelegate *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMatterSoftwareUpdateProviderDelegate *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  HMDMatterSoftwareUpdateProviderDelegate *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@%@ Resetting OTA provider state for %@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if ((objc_msgSend(v4, "supportsCHIP") & 1) != 0)
  {
    -[HMDMatterSoftwareUpdateProviderDelegate softwareUpdateProvider](v6, "softwareUpdateProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v4, "chipStorage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "nodeID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "updateOTAProviderStateForNodeID:otaProviderState:", v12, 1);

    }
    else
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "shortDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v22;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@ Couldn't get a strong ref to the software update provider", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = v6;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@%@ Not a matter accessory", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (id)_accessoryWithPairing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id obj;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[HMDMatterSoftwareUpdateProviderDelegate homeManager](self, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v64;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v64 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v10, "matterFabricID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "fabricID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

        if (v13)
        {
          v61 = 0u;
          v62 = 0u;
          v59 = 0u;
          v60 = 0u;
          objc_msgSend(v10, "hapAccessories");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
          if (!v40)
            goto LABEL_29;
          v15 = *(_QWORD *)v60;
          v38 = v7;
          v39 = v8;
          v36 = *(_QWORD *)v60;
          v37 = i;
          v48 = v11;
          v43 = v14;
          while (1)
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v60 != v15)
                objc_enumerationMutation(v14);
              v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v16);
              v55 = 0u;
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              v41 = v16;
              v42 = v17;
              objc_msgSend(v17, "chipStorage");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "pairings");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = v19;
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
              if (v20)
              {
                v21 = v20;
                v22 = *(_QWORD *)v56;
                v51 = *(_QWORD *)v56;
                do
                {
                  v23 = 0;
                  v52 = v21;
                  do
                  {
                    if (*(_QWORD *)v56 != v22)
                      objc_enumerationMutation(v53);
                    v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v23);
                    objc_msgSend(v54, "nodeID");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "chipPluginPairing");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "nodeID");
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v25, "isEqualToNumber:", v27))
                      goto LABEL_24;
                    objc_msgSend(v54, "fabricID");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "chipPluginPairing");
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "fabricID");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!objc_msgSend(v28, "isEqualToNumber:", v30))
                      goto LABEL_23;
                    objc_msgSend(v54, "rootPublicKey");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "chipPluginPairing");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v49, "rootPublicKey");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    v50 = v31;
                    if (!objc_msgSend(v31, "isEqualToData:", v32))
                    {

                      v11 = v48;
LABEL_23:

                      v22 = v51;
                      v21 = v52;
LABEL_24:

                      goto LABEL_25;
                    }
                    objc_msgSend(v54, "vendorID");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v24, "chipPluginPairing");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "vendorID");
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v45, "isEqualToNumber:", v33);

                    v11 = v48;
                    v22 = v51;
                    v21 = v52;
                    if ((v47 & 1) != 0)
                    {
                      v34 = v42;

                      goto LABEL_34;
                    }
LABEL_25:
                    ++v23;
                  }
                  while (v21 != v23);
                  v21 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
                }
                while (v21);
              }

              v16 = v41 + 1;
              v7 = v38;
              v8 = v39;
              v15 = v36;
              i = v37;
              v14 = v43;
            }
            while (v41 + 1 != v40);
            v40 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
            if (!v40)
            {
LABEL_29:

              break;
            }
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      v34 = 0;
      if (!v7)
        goto LABEL_34;
    }
  }
  v34 = 0;
LABEL_34:

  return v34;
}

- (HMDHomeManager)homeManager
{
  return (HMDHomeManager *)objc_loadWeakRetained((id *)&self->_homeManager);
}

- (void)setHomeManager:(id)a3
{
  objc_storeWeak((id *)&self->_homeManager, a3);
}

- (HMDAccessoryFirmwareUpdateManager)accessoryFirmwareUpdateManager
{
  return (HMDAccessoryFirmwareUpdateManager *)objc_loadWeakRetained((id *)&self->_accessoryFirmwareUpdateManager);
}

- (void)setAccessoryFirmwareUpdateManager:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryFirmwareUpdateManager, a3);
}

- (HMDMatterSoftwareUpdateProviderDelegateDataSource)dataSource
{
  return (HMDMatterSoftwareUpdateProviderDelegateDataSource *)objc_getProperty(self, a2, 24, 1);
}

- (HMMTRSoftwareUpdateProvider)softwareUpdateProvider
{
  return (HMMTRSoftwareUpdateProvider *)objc_loadWeakRetained((id *)&self->_softwareUpdateProvider);
}

- (void)setSoftwareUpdateProvider:(id)a3
{
  objc_storeWeak((id *)&self->_softwareUpdateProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_softwareUpdateProvider);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_accessoryFirmwareUpdateManager);
  objc_destroyWeak((id *)&self->_homeManager);
}

void __103__HMDMatterSoftwareUpdateProviderDelegate_queryImageWithPairing_requestParams_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  id v63;
  NSObject *v64;
  int v65;
  void *v66;
  void *v67;
  const char *v68;
  void *v69;
  uint64_t v70;
  _BOOL4 v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  unint64_t v78;
  void *v79;
  unint64_t v80;
  void *v81;
  char v82;
  void *v83;
  id v84;
  NSObject *v85;
  _BOOL4 v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  NSObject *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  uint64_t v110;
  void *v111;
  void *v112;
  id v113;
  uint8_t buf[4];
  void *v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  void *v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_accessoryWithPairing:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryFirmwareUpdateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      v5 = (id)objc_msgSend(v3, "registerAndCreateSessionForAccessory:updateUARPParameters:", v2, 1);
      objc_msgSend(*(id *)(a1 + 48), "protocolsSupported");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", &unk_24E96D160);

      if ((v7 & 1) != 0)
      {
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "softwareVersion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v8) = objc_msgSend(v8, "updateUARPFirmwareVersionForAccessory:version:", v2, v9);

        if ((_DWORD)v8)
        {
          v10 = (void *)MEMORY[0x227676638]();
          v11 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "shortDescription");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v115 = v13;
            v116 = 2112;
            v117 = v14;
            v118 = 2048;
            v119 = 0x405E000000000000;
            _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@%@ Version has changed, request accessory to check back in %f secs", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v10);
          v15 = *(_QWORD *)(a1 + 56);
          objc_msgSend(*(id *)(a1 + 32), "_queryImageResponseWithStatus:delayedActionTime:", &unk_24E96D178, &unk_24E9714E8);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, id, _QWORD))(v15 + 16))(v15, v16, 0);
          goto LABEL_46;
        }
        v113 = 0;
        objc_msgSend(v4, "availableSoftwareAssetForMatterAccessory:error:", v2, &v113);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v113;
        switch(objc_msgSend(v16, "code"))
        {
          case 1:
          case 4:
            v38 = *(_QWORD *)(a1 + 56);
            v39 = *(void **)(a1 + 32);
            v40 = &unk_24E96D148;
            v41 = 0;
            goto LABEL_23;
          case 2:
            v42 = (void *)MEMORY[0x227676638]();
            v43 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "shortDescription");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v115 = v45;
              v116 = 2112;
              v117 = v46;
              v118 = 2048;
              v119 = 0x405E000000000000;
              _os_log_impl(&dword_2218F0000, v44, OS_LOG_TYPE_INFO, "%{public}@%@ Software image is busy downloading. Request accessory to check back in %f secs", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v42);
            v38 = *(_QWORD *)(a1 + 56);
            v39 = *(void **)(a1 + 32);
            v40 = &unk_24E96D178;
            v41 = &unk_24E9714E8;
LABEL_23:
            objc_msgSend(v39, "_queryImageResponseWithStatus:delayedActionTime:", v40, v41);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, void *, _QWORD))(v38 + 16))(v38, v47, 0);
            goto LABEL_45;
          case 3:
            v48 = (void *)MEMORY[0x227676638]();
            v49 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v50 = objc_claimAutoreleasedReturnValue();
            v51 = v50;
            if (!v37)
            {
              if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
              {
                HMFGetLogIdentifier();
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "shortDescription");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v115 = v74;
                v116 = 2112;
                v117 = v75;
                v118 = 2112;
                v119 = (uint64_t)v16;
                _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_ERROR, "%{public}@%@ Received nil asset ID even though status is OnLocalStorage, Error:%@", buf, 0x20u);

              }
              objc_autoreleasePoolPop(v48);
              if (!v16)
              {
                objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 11);
                v16 = (id)objc_claimAutoreleasedReturnValue();
              }
LABEL_44:
              v76 = *(_QWORD *)(a1 + 56);
              objc_msgSend(*(id *)(a1 + 32), "_queryImageResponseWithStatus:delayedActionTime:", &unk_24E96D148, 0);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, void *, id))(v76 + 16))(v76, v47, v16);
              goto LABEL_45;
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "shortDescription");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v115 = v52;
              v116 = 2112;
              v117 = v53;
              v118 = 2112;
              v119 = (uint64_t)v37;
              _os_log_impl(&dword_2218F0000, v51, OS_LOG_TYPE_INFO, "%{public}@%@ A software image is available for accessory with asset = %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v48);
LABEL_28:
            v112 = v37;
            v54 = (void *)MEMORY[0x227676638]();
            v55 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 48), "softwareVersion");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "assetVersionNumber");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v115 = v57;
              v116 = 2112;
              v117 = v58;
              v118 = 2112;
              v119 = (uint64_t)v59;
              _os_log_impl(&dword_2218F0000, v56, OS_LOG_TYPE_INFO, "%{public}@Accessory software version: %@. Software update version: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v54);
            objc_msgSend(v2, "home");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");

            if (v61)
            {
              v62 = (void *)MEMORY[0x227676638]();
              v63 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v64 = objc_claimAutoreleasedReturnValue();
              v65 = 1;
              if (!os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
              {
LABEL_48:

                objc_autoreleasePoolPop(v62);
                objc_msgSend(v112, "assetVersionNumber");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = objc_msgSend(v77, "unsignedLongValue");
                objc_msgSend(*(id *)(a1 + 48), "softwareVersion");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = objc_msgSend(v79, "unsignedLongValue");

                if (v78 <= v80)
                {
                  v95 = (void *)MEMORY[0x227676638]();
                  v96 = *(id *)(a1 + 32);
                  HMFGetOSLogHandle();
                  v97 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
                  {
                    HMFGetLogIdentifier();
                    v98 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v2, "shortDescription");
                    v111 = v95;
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(a1 + 48), "softwareVersion");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v112, "assetVersionNumber");
                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544130;
                    v115 = v98;
                    v116 = 2112;
                    v117 = v99;
                    v118 = 2112;
                    v119 = (uint64_t)v100;
                    v120 = 2112;
                    v121 = v101;
                    _os_log_impl(&dword_2218F0000, v97, OS_LOG_TYPE_ERROR, "%{public}@%@ Accessory software version (%@) is already at latest available version (%@).", buf, 0x2Au);

                    v95 = v111;
                  }

                  objc_autoreleasePoolPop(v95);
                  v102 = *(_QWORD *)(a1 + 56);
                  v103 = *(void **)(a1 + 32);
                  v104 = &unk_24E96D148;
                  v105 = 0;
                }
                else
                {
                  if ((v65 & 1) != 0)
                  {
LABEL_54:
                    v89 = v65 ^ 1u;
                    v110 = *(_QWORD *)(a1 + 56);
                    v109 = objc_alloc(MEMORY[0x24BE4EF98]);
                    objc_msgSend(v112, "localURL");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v47, "path");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v112, "assetVersionNumber");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v112, "assetVersion");
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(&unk_24E96D130, "unsignedIntValue");
                    HMFRandomDataWithLength();
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v89);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v94 = (void *)objc_msgSend(v109, "initWithStatus:delayedActionTime:imageURI:softwareVersion:softwareVersionString:updateToken:userConsentNeeded:metadataForRequestor:", &unk_24E96D160, &unk_24E9714D8, v108, v90, v91, v92, v93, 0);
                    (*(void (**)(uint64_t, void *, _QWORD))(v110 + 16))(v110, v94, 0);

                    v37 = v112;
                    goto LABEL_45;
                  }
                  objc_msgSend(*(id *)(a1 + 48), "requestorCanConsent");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  v82 = objc_msgSend(v81, "BOOLValue");

                  v83 = (void *)MEMORY[0x227676638]();
                  v84 = *(id *)(a1 + 32);
                  HMFGetOSLogHandle();
                  v85 = objc_claimAutoreleasedReturnValue();
                  v86 = os_log_type_enabled(v85, OS_LOG_TYPE_INFO);
                  if ((v82 & 1) != 0)
                  {
                    if (v86)
                    {
                      HMFGetLogIdentifier();
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v2, "shortDescription");
                      v88 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v115 = v87;
                      v116 = 2112;
                      v117 = v88;
                      _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_INFO, "%{public}@%@ User has not consented yet but requestor can consent. Delegating consent to requestor", buf, 0x16u);

                    }
                    objc_autoreleasePoolPop(v83);
                    goto LABEL_54;
                  }
                  if (v86)
                  {
                    HMFGetLogIdentifier();
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v2, "shortDescription");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543874;
                    v115 = v106;
                    v116 = 2112;
                    v117 = v107;
                    v118 = 2048;
                    v119 = 0x405E000000000000;
                    _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_INFO, "%{public}@%@ User has not consented to firmware update and requestor cannot consent. Request accessory to check back in %f secs", buf, 0x20u);

                  }
                  objc_autoreleasePoolPop(v83);
                  v102 = *(_QWORD *)(a1 + 56);
                  v103 = *(void **)(a1 + 32);
                  v104 = &unk_24E96D178;
                  v105 = &unk_24E9714E8;
                }
                objc_msgSend(v103, "_queryImageResponseWithStatus:delayedActionTime:", v104, v105);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, _QWORD))(v102 + 16))(v102, v47, 0);
                v37 = v112;
LABEL_45:

                goto LABEL_46;
              }
              HMFGetLogIdentifier();
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "shortDescription");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v115 = v66;
              v116 = 2112;
              v117 = v67;
              v68 = "%{public}@%@ Automatic third party accessory software update is enabled, granting consent.";
            }
            else
            {
              objc_msgSend(v2, "softwareUpdate");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = objc_msgSend(v69, "state");

              v62 = (void *)MEMORY[0x227676638]();
              v63 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v64 = objc_claimAutoreleasedReturnValue();
              v71 = os_log_type_enabled(v64, OS_LOG_TYPE_INFO);
              if (v70 != 5)
              {
                if (v71)
                {
                  HMFGetLogIdentifier();
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v2, "shortDescription");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v115 = v72;
                  v116 = 2112;
                  v117 = v73;
                  _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, "%{public}@%@ User consent pending.", buf, 0x16u);

                }
                v65 = 0;
                goto LABEL_48;
              }
              if (!v71)
              {
                v65 = 1;
                goto LABEL_48;
              }
              HMFGetLogIdentifier();
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "shortDescription");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v115 = v66;
              v116 = 2112;
              v117 = v67;
              v68 = "%{public}@%@ User requested update for this accessory, granting consent.";
              v65 = 1;
            }
            _os_log_impl(&dword_2218F0000, v64, OS_LOG_TYPE_INFO, v68, buf, 0x16u);

            goto LABEL_48;
          case 5:
            goto LABEL_44;
          default:
            goto LABEL_28;
        }
      }
      v29 = (void *)MEMORY[0x227676638]();
      v30 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "shortDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "protocolsSupported");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v115 = v32;
        v116 = 2112;
        v117 = v33;
        v118 = 2112;
        v119 = (uint64_t)v34;
        _os_log_impl(&dword_2218F0000, v31, OS_LOG_TYPE_ERROR, "%{public}@%@ Transfer protocols not supported in request: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v29);
      v35 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "_queryImageResponseWithStatus:delayedActionTime:", &unk_24E96D190, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 5);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v35 + 16))(v35, v16, v36);

    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v115 = v26;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, firmware update manager not found", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      v27 = *(_QWORD *)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 32), "_queryImageResponseWithStatus:delayedActionTime:", &unk_24E96D148, 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *))(v27 + 16))(v27, v16, v28);

      v4 = 0;
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v115 = v20;
      v116 = 2112;
      v117 = v21;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Cannot proceed with software update. Accessory not found for pairing : %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    v22 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_queryImageResponseWithStatus:delayedActionTime:", &unk_24E96D148, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v22 + 16))(v22, v4, v16);
  }
LABEL_46:

}

void __111__HMDMatterSoftwareUpdateProviderDelegate_notifyCheckFirmwareUpdateSessionWithPairing_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_accessoryWithPairing:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "accessoryFirmwareUpdateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      v5 = (id)objc_msgSend(v3, "registerAndCreateSessionForAccessory:updateUARPParameters:", v2, 1);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected, firmware update manager not found", (uint8_t *)&v18, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      v16 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);

      v4 = 0;
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v18 = 138543618;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Accessory not found for pairing : %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v11 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v4);
  }

}

void __98__HMDMatterSoftwareUpdateProviderDelegate_notifyUpdateWithPairing_params_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HMDMatterSoftwareUpdateEndEvent *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDMatterSoftwareUpdateEndEvent *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_accessoryWithPairing:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(void **)(a1 + 40);
      v36 = 138543618;
      v37 = v16;
      v38 = 2112;
      v39 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Accessory not found for pairing : %@", (uint8_t *)&v36, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 2;
    goto LABEL_13;
  }
  if ((objc_msgSend(v2, "supportsCHIP") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x227676638]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v24;
      v38 = 2112;
      v39 = v25;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@%@ Accessory has updated software image, but Accessory does not support Matter", (uint8_t *)&v36, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v18 = *(_QWORD *)(a1 + 56);
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = 5;
LABEL_13:
    objc_msgSend(v19, "hmfErrorWithCode:", v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v18 + 16))(v18, v12);
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 48), "didTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToNumber:", &unk_24E96D178);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v10;
      v38 = 2112;
      v39 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ Accessory update timed out", (uint8_t *)&v36, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE3EBB0], 13, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortDescription");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "softwareVersion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543874;
      v37 = v26;
      v38 = 2112;
      v39 = v27;
      v40 = 2112;
      v41 = v28;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ Accessory has updated software image. New version: %@", (uint8_t *)&v36, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v12 = 0;
  }
  v29 = [HMDMatterSoftwareUpdateEndEvent alloc];
  objc_msgSend(*(id *)(a1 + 48), "transportTypeForMetrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "previousSoftwareVersionNumberForMetrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "softwareVersion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[HMDMatterSoftwareUpdateEndEvent initWithAccessory:transport:accessorySoftwareVersionNumber:updateSoftwareVersionNumber:error:](v29, "initWithAccessory:transport:accessorySoftwareVersionNumber:updateSoftwareVersionNumber:error:", v3, v30, v31, v32, v12);

  objc_msgSend(v3, "home");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "logEventSubmitter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "submitLogEvent:", v33);

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_18:

}

void __104__HMDMatterSoftwareUpdateProviderDelegate_applyUpdateWithPairing_requestParams_queue_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_accessoryWithPairing:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v7;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@%@ Inform accessory to proceed with applying the software image", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4EF90]), "initWithAction:delayedActionTime:", &unk_24E96D160, &unk_24E9714D8);
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(void **)(a1 + 40);
      v15 = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Accessory should not proceed with applying the software image. Accessory not found for pairing : %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    v13 = *(_QWORD *)(a1 + 48);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4EF90]), "initWithAction:delayedActionTime:", &unk_24E96D148, &unk_24E9714D8);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v10, v14);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t34_218821 != -1)
    dispatch_once(&logCategory__hmf_once_t34_218821, &__block_literal_global_218822);
  return (id)logCategory__hmf_once_v35_218823;
}

void __54__HMDMatterSoftwareUpdateProviderDelegate_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v35_218823;
  logCategory__hmf_once_v35_218823 = v0;

}

@end
