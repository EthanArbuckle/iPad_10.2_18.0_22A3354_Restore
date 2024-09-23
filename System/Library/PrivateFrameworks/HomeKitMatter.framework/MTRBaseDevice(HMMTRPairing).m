@implementation MTRBaseDevice(HMMTRPairing)

- (id)_retrieveFabricClusterWithQueue:()HMMTRPairing
{
  objc_class *v4;
  id v5;
  void *v6;

  v4 = (objc_class *)MEMORY[0x24BDDB590];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDevice:endpoint:queue:", a1, 0, v5);

  return v6;
}

- (void)removePairing:()HMMTRPairing callbackQueue:vendorMetadataStore:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x242656984]();
  v15 = a1;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v17;
    v29 = 2112;
    v30 = v10;
    _os_log_impl(&dword_23E95B000, v16, OS_LOG_TYPE_INFO, "%{public}@Remove pairing: Iterating over fabrics table list to find FabricIndex for pairing %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v14);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke;
  v22[3] = &unk_250F24100;
  v25 = v11;
  v26 = v13;
  v22[4] = v15;
  v23 = v12;
  v24 = v10;
  v18 = v11;
  v19 = v10;
  v20 = v12;
  v21 = v13;
  objc_msgSend(v15, "fetchFabricDescriptorsWithCallbackQueue:filtered:completionHandler:", v18, 0, v22);

}

- (void)_removeFabricWithIndex:()HMMTRPairing callbackQueue:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v14;
    v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Attempting to remove fabric index: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(v12, "_retrieveFabricClusterWithQueue:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BDDB7D0]);
  objc_msgSend(v16, "setFabricIndex:", v8);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __86__MTRBaseDevice_HMMTRPairing___removeFabricWithIndex_callbackQueue_completionHandler___block_invoke;
  v18[3] = &unk_250F24128;
  v18[4] = v12;
  v19 = v10;
  v17 = v10;
  objc_msgSend(v15, "removeFabricWithParams:completionHandler:", v16, v18);

}

- (void)unpairDevice:()HMMTRPairing completionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Attempting to unpair device: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke;
  v14[3] = &unk_250F24150;
  v15 = v6;
  v16 = v7;
  v14[4] = v9;
  v12 = v6;
  v13 = v7;
  objc_msgSend(v9, "fetchCurrentFabricIndexWithCallbackQueue:completionHandler:", v12, v14);

}

- (void)fetchCurrentFabricIndexWithCallbackQueue:()HMMTRPairing completionHandler:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x242656984]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_INFO, "%{public}@Getting current fabric index: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v9, "_retrieveFabricClusterWithQueue:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __90__MTRBaseDevice_HMMTRPairing__fetchCurrentFabricIndexWithCallbackQueue_completionHandler___block_invoke;
  v14[3] = &unk_250F24178;
  v14[4] = v9;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "readAttributeCurrentFabricIndexWithCompletionHandler:", v14);

}

- (void)updateFabricLabel:()HMMTRPairing callbackQueue:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "_retrieveFabricClusterWithQueue:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDDB7D8]);
  objc_msgSend(v11, "setLabel:", v9);

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __81__MTRBaseDevice_HMMTRPairing__updateFabricLabel_callbackQueue_completionHandler___block_invoke;
  v13[3] = &unk_250F241A0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "updateFabricLabelWithParams:completionHandler:", v11, v13);

}

- (void)removeAllPairingsForCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x242656984]();
  v12 = a1;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v23 = v14;
    _os_log_impl(&dword_23E95B000, v13, OS_LOG_TYPE_INFO, "%{public}@Remove all pairings: Collecting fabrics table list", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v11);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke;
  v18[3] = &unk_250F24240;
  v18[4] = v12;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  objc_msgSend(v12, "fetchCurrentFabricIndexWithCallbackQueue:completionHandler:", v17, v18);

}

- (void)fetchSerialNumberWithCallbackQueue:()HMMTRPairing completionHandler:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BDDB558];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithDevice:endpoint:queue:", a1, 0, v8);

  objc_msgSend(v9, "readAttributeSerialNumberWithCompletionHandler:", v7);
}

- (uint64_t)fetchPairingsWithCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:
{
  return objc_msgSend(a1, "_fetchPairingsWithCallbackQueue:filtered:vendorMetadataStore:completionHandler:", a3, 0, a4, a5);
}

- (uint64_t)fetchCurrentPairingWithCallbackQueue:()HMMTRPairing vendorMetadataStore:completionHandler:
{
  return objc_msgSend(a1, "_fetchPairingsWithCallbackQueue:filtered:vendorMetadataStore:completionHandler:", a3, 1, a4, a5);
}

- (void)fetchFabricDescriptorsWithCallbackQueue:()HMMTRPairing filtered:completionHandler:
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  objc_msgSend(a1, "_retrieveFabricClusterWithQueue:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFabricFiltered:", v10);

  objc_msgSend(v11, "readAttributeFabricsWithParams:completionHandler:", v9, v8);
}

- (void)_fetchPairingsWithCallbackQueue:()HMMTRPairing filtered:vendorMetadataStore:completionHandler:
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v10 = a5;
  v11 = a6;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __110__MTRBaseDevice_HMMTRPairing___fetchPairingsWithCallbackQueue_filtered_vendorMetadataStore_completionHandler___block_invoke;
  v14[3] = &unk_250F24268;
  v15 = v10;
  v16 = v11;
  v14[4] = a1;
  v12 = v10;
  v13 = v11;
  objc_msgSend(a1, "fetchFabricDescriptorsWithCallbackQueue:filtered:completionHandler:", a3, a4, v14);

}

- (__CFString)_vendorNameForVendorID:()HMMTRPairing vendorMetadataStore:
{
  id v6;
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "unsignedShortValue") == 65522)
  {
    v8 = CFSTR("Chai");
  }
  else if (objc_msgSend(v6, "unsignedShortValue") == 65521)
  {
    v8 = CFSTR("Matter Test");
  }
  else
  {
    objc_msgSend(v7, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vendorWithID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "name");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x242656984]();
      v13 = a1;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v6;
        _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Cannot find vendor name for vendorID %@, returning vendorID as vendor name.", (uint8_t *)&v17, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v6, "stringValue");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (__CFString *)v11;

  }
  return v8;
}

@end
