@implementation HMAccessorySoftwareUpdateControllerV2

- (HMAccessorySoftwareUpdateControllerV2)initWithContext:(id)a3 home:(id)a4 subscriptionProvider:(id)a5 documentationManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMAccessorySoftwareUpdateControllerV2 *v15;
  HMAccessorySoftwareUpdateControllerV2 *v16;
  uint64_t v17;
  NSMutableDictionary *softwareUpdateByAccessory;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMAccessorySoftwareUpdateControllerV2;
  v15 = -[HMAccessorySoftwareUpdateControllerV2 init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_context, a3);
    objc_storeStrong((id *)&v16->_subscriptionProvider, a5);
    objc_storeWeak((id *)&v16->_home, v12);
    objc_storeStrong((id *)&v16->_documentationManager, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    softwareUpdateByAccessory = v16->_softwareUpdateByAccessory;
    v16->_softwareUpdateByAccessory = (NSMutableDictionary *)v17;

  }
  return v16;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)subscribe:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySoftwareUpdateControllerV2 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessorySoftwareUpdateControllerV2 *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribing to accessories with identifiers: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)objc_opt_class();
  -[HMAccessorySoftwareUpdateControllerV2 home](v9, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topicFiltersForAccessoryIdentifiers:home:", v6, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v18;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Subscribing to topicFilters: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  -[HMAccessorySoftwareUpdateControllerV2 subscriptionProvider](v16, "subscriptionProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke;
  v21[3] = &unk_1E3AB1D88;
  v21[4] = v16;
  v22 = v7;
  v20 = v7;
  objc_msgSend(v19, "registerConsumer:topicFilters:completion:", v16, v14, v21);

}

- (void)scanForSoftwareUpdateOnAccessories:(id)a3 withOptions:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HMAccessorySoftwareUpdateControllerV2 *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[6];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v32 = v13;
    v33 = 2112;
    v34 = v8;
    v35 = 2048;
    v36 = a4;
    _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Scanning for software update on accessories: %@ with options: %lu", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v10);
  v14 = (void *)objc_opt_class();
  -[HMAccessorySoftwareUpdateControllerV2 home](v11, "home");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessoryUUIDsForAccessoryIdentifiers:home:", v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_map:", &__block_literal_global_22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_2;
  v30[3] = &unk_1E3AAE410;
  v30[4] = v11;
  v30[5] = a4;
  objc_msgSend(v17, "na_map:", v30);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0D519C0];
  v21 = (void *)MEMORY[0x1E0D519E8];
  -[HMAccessorySoftwareUpdateControllerV2 context](v11, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "queue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "schedulerWithDispatchQueue:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "combineAllFutures:scheduler:", v19, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v18;
  v28[1] = 3221225472;
  v28[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_31;
  v28[3] = &unk_1E3AAE478;
  v28[4] = v11;
  v29 = v9;
  v26 = v9;
  v27 = (id)objc_msgSend(v25, "addCompletionBlock:", v28);

}

- (void)applySoftwareUpdate:(id)a3 accessory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMAccessorySoftwareUpdateControllerV2 *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  HMAccessorySoftwareUpdateControllerV2 *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[4];
  id v36;
  const __CFString *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v40 = v14;
    v41 = 2112;
    v42 = v8;
    v43 = 2112;
    v44 = v9;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Applying software update: %@ on accessory with identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend((id)objc_opt_class(), "softwareUpdateFromSoftwareUpdateV2:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySoftwareUpdateControllerV2 home](v12, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessoryWithUniqueIdentifier:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v37 = CFSTR("update");
    encodeRootObject(v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0D285F8];
    -[HMAccessorySoftwareUpdateControllerV2 messageDestinationForAccessory:](v12, "messageDestinationForAccessory:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "messageWithName:destination:payload:", CFSTR("HMSU.su"), v22, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_2;
    v33[3] = &unk_1E3AB59B8;
    v33[4] = v12;
    v34 = v10;
    v24 = v10;
    objc_msgSend(v23, "setResponseHandler:", v33);
    -[HMAccessorySoftwareUpdateControllerV2 context](v12, "context");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "messageDispatcher");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sendMessage:", v23);

  }
  else
  {
    v27 = (void *)MEMORY[0x1A1AC1AAC]();
    v28 = v12;
    HMFGetOSLogHandle();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v40 = v30;
      v41 = 2112;
      v42 = v9;
      _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory for uniqueIdentifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v27);
    -[HMAccessorySoftwareUpdateControllerV2 context](v28, "context");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "delegateCaller");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke;
    v35[3] = &unk_1E3AB6078;
    v36 = v10;
    v20 = v10;
    objc_msgSend(v32, "invokeBlock:", v35);

    v23 = v36;
  }

}

- (void)fetchDocumentationFromMetadata:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMAccessorySoftwareUpdateControllerV2 documentationManager](self, "documentationManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentationForMetadata:completion:", v7, v6);

}

- (void)unsubscribe:(id)a3
{
  id v4;
  void *v5;
  HMAccessorySoftwareUpdateControllerV2 *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  HMAccessorySoftwareUpdateControllerV2 *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMAccessorySoftwareUpdateControllerV2 *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v8;
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from accessories with identifiers: %@", (uint8_t *)&v21, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  if (objc_msgSend(v4, "hmf_isEmpty"))
  {
    v9 = (void *)MEMORY[0x1A1AC1AAC]();
    v10 = v6;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v12;
      _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from all topics", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    -[HMAccessorySoftwareUpdateControllerV2 subscriptionProvider](v10, "subscriptionProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unregisterConsumer:completion:", v10, 0);
  }
  else
  {
    v14 = (void *)objc_opt_class();
    -[HMAccessorySoftwareUpdateControllerV2 home](v6, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "topicFiltersForAccessoryIdentifiers:home:", v4, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = v6;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v19;
      v23 = 2112;
      v24 = v13;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Unsubscribing from topicFilters: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    -[HMAccessorySoftwareUpdateControllerV2 subscriptionProvider](v17, "subscriptionProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unregisterConsumer:topicFilters:completion:", v17, v13, 0);

  }
}

- (void)scanForSoftwareUpdateRepeatedlyOnAccessory:(id)a3 andInstallUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  HMAccessorySoftwareUpdateControllerV2 *v8;
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
  void *v21;
  HMAccessorySoftwareUpdateControllerV2 *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  const __CFString *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v31 = v10;
    v32 = 2112;
    v33 = v6;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@SRAISU: Scanning for software update repeatedly on accessory with identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  -[HMAccessorySoftwareUpdateControllerV2 home](v8, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessoryWithUniqueIdentifier:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v28 = CFSTR("HMAccessorySoftwareUpdateControllerV2MessageKeyShouldApplyUpdate");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D285F8];
    -[HMAccessorySoftwareUpdateControllerV2 messageDestinationForAccessory:](v8, "messageDestinationForAccessory:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageWithName:destination:payload:", CFSTR("HMAccessorySoftwareUpdateControllerV2ScanRepeatedlyAndApplyMessage"), v17, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __101__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateRepeatedlyOnAccessory_andInstallUpdate___block_invoke;
    v25[3] = &unk_1E3AB5C08;
    v25[4] = v8;
    v26 = v6;
    v27 = v13;
    objc_msgSend(v18, "setResponseHandler:", v25);
    -[HMAccessorySoftwareUpdateControllerV2 context](v8, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "messageDispatcher");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sendMessage:", v18);

  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = v8;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v24;
      v32 = 2112;
      v33 = v6;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@SRAISU: Failed to find accessory for uniqueIdentifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
  }

}

- (void)handleDidReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySoftwareUpdateControllerV2 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v11;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling did receive event", (uint8_t *)&v15, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  +[HMEventTopicHelper decodeTopic:](HMEventTopicHelper, "decodeTopic:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "asAccessoryTopic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (objc_msgSend(v13, "accessoryEventTopicSuffixID") == 506)
    {
      objc_msgSend(v13, "accessoryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySoftwareUpdateControllerV2 handleDidReceiveDescriptorEvent:forAccessory:](v9, "handleDidReceiveDescriptorEvent:forAccessory:", v6, v14);
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend(v13, "accessoryEventTopicSuffixID") == 507)
    {
      objc_msgSend(v13, "accessoryUUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySoftwareUpdateControllerV2 handleDidReceiveProgressEvent:forAccessory:](v9, "handleDidReceiveProgressEvent:forAccessory:", v6, v14);
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)handleDidReceiveDescriptorEvent:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySoftwareUpdateControllerV2 *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMAccessorySoftwareUpdateControllerV2 *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  HMAccessorySoftwareUpdateControllerV2 *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMAccessorySoftwareUpdateControllerV2 *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v11;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Handling did receive descriptor event", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  +[HMSoftwareUpdateDescriptor descriptorFromEvent:](HMSoftwareUpdateDescriptor, "descriptorFromEvent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMAccessorySoftwareUpdateControllerV2 home](v9, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessoryWithUUID:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[HMAccessorySoftwareUpdateControllerV2 softwareUpdateForAccessory:withDescriptor:](v9, "softwareUpdateForAccessory:withDescriptor:", v7, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = v9;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v20;
        v37 = 2112;
        v38 = v15;
        v39 = 2112;
        v40 = v16;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Telling delegate that accessory did receive software update. Accessory: %@, update:\n%@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMAccessorySoftwareUpdateControllerV2 context](v18, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "delegateCaller");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __86__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveDescriptorEvent_forAccessory___block_invoke;
      v32[3] = &unk_1E3AB5CD0;
      v32[4] = v18;
      v33 = v15;
      v34 = v16;
      v23 = v16;
      objc_msgSend(v22, "invokeBlock:", v32);

    }
    else
    {
      v28 = (void *)MEMORY[0x1A1AC1AAC]();
      v29 = v9;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v31;
        v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with uuid: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v28);
    }

  }
  else
  {
    v24 = (void *)MEMORY[0x1A1AC1AAC]();
    v25 = v9;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v27;
      v37 = 2112;
      v38 = v6;
      _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse descriptor from event: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v24);
  }

}

- (void)handleDidReceiveProgressEvent:(id)a3 forAccessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  HMAccessorySoftwareUpdateControllerV2 *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HMAccessorySoftwareUpdateControllerV2 *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  HMAccessorySoftwareUpdateControllerV2 *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  HMAccessorySoftwareUpdateControllerV2 *v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessorySoftwareUpdateControllerV2 delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if ((v9 & 1) != 0)
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v41 = v14;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Handling did receive progress event", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    +[HMSoftwareUpdateProgress progressFromEvent:](HMSoftwareUpdateProgress, "progressFromEvent:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[HMAccessorySoftwareUpdateControllerV2 home](v11, "home");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessoryWithUUID:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uniqueIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        -[HMAccessorySoftwareUpdateControllerV2 softwareUpdateProgressForAccessory:withProgress:](v11, "softwareUpdateProgressForAccessory:withProgress:", v7, v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)MEMORY[0x1A1AC1AAC]();
          v21 = v11;
          HMFGetOSLogHandle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v41 = v23;
            v42 = 2112;
            v43 = v18;
            v44 = 2112;
            v45 = v19;
            _os_log_impl(&dword_19B1B0000, v22, OS_LOG_TYPE_INFO, "%{public}@Telling delegate that accessory did receive software update progress. Accessory: %@, progress:\n%@", buf, 0x20u);

          }
          objc_autoreleasePoolPop(v20);
          -[HMAccessorySoftwareUpdateControllerV2 context](v21, "context");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "delegateCaller");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __84__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveProgressEvent_forAccessory___block_invoke;
          v37[3] = &unk_1E3AB5CD0;
          v37[4] = v21;
          v38 = v18;
          v39 = v19;
          objc_msgSend(v25, "invokeBlock:", v37);

        }
      }
      else
      {
        v33 = (void *)MEMORY[0x1A1AC1AAC]();
        v34 = v11;
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v41 = v36;
          v42 = 2112;
          v43 = v7;
          _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory with uuid: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v33);
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1A1AC1AAC]();
      v30 = v11;
      HMFGetOSLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v41 = v32;
        v42 = 2112;
        v43 = v6;
        _os_log_impl(&dword_19B1B0000, v31, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse progress from event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v29);
    }

  }
  else
  {
    if (v13)
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_softwareUpdateController_accessory_didUpdateProgress_);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySoftwareUpdateControllerV2 delegate](v11, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v41 = v26;
      v42 = 2112;
      v43 = v27;
      v44 = 2112;
      v45 = v28;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Delegate does not respond to %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (id)softwareUpdateProgressForAccessory:(id)a3 withProgress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySoftwareUpdateControllerV2 *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  void *v14;
  HMSoftwareUpdateProgressV2 *v15;
  int v16;
  int v17;
  double v18;
  double v19;
  HMSoftwareUpdateProgressV2 *v20;
  void *v21;
  HMAccessorySoftwareUpdateControllerV2 *v22;
  NSObject *v23;
  void *v24;
  int v26;
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543874;
    v27 = v11;
    v28 = 2112;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for accessory: %@, progress: %@", (uint8_t *)&v26, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  -[HMAccessorySoftwareUpdateControllerV2 softwareUpdateByAccessory](v9, "softwareUpdateByAccessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = [HMSoftwareUpdateProgressV2 alloc];
    objc_msgSend(v7, "percentageComplete");
    v17 = v16;
    objc_msgSend(v7, "estimatedTimeRemaining");
    v19 = v18;
    LODWORD(v18) = v17;
    v20 = -[HMSoftwareUpdateProgressV2 initWithPercentageComplete:estimatedTimeRemaining:](v15, "initWithPercentageComplete:estimatedTimeRemaining:", v18, v19);
  }
  else
  {
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = v9;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543618;
      v27 = v24;
      v28 = 2112;
      v29 = v6;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Attempted to update progress without existing software update for accessory: %@", (uint8_t *)&v26, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  os_unfair_lock_unlock(p_lock);
  return v20;
}

- (id)softwareUpdateForAccessory:(id)a3 withDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySoftwareUpdateControllerV2 *v9;
  NSObject *v10;
  void *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v11;
    v18 = 2112;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Creating HMSoftwareUpdateV2 for accessory: %@, descriptor: %@", (uint8_t *)&v16, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  +[HMSoftwareUpdateV2 softwareUpdateFromDescriptor:](HMSoftwareUpdateV2, "softwareUpdateFromDescriptor:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySoftwareUpdateControllerV2 softwareUpdateByAccessory](v9, "softwareUpdateByAccessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v6);

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (id)messageDestinationForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMAccessorySoftwareUpdateControllerV2 home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryWithUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0D285D8]);
  objc_msgSend(v6, "messageTargetUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithTarget:", v8);

  return v9;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMAccessorySoftwareUpdateControllerV2 *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Did receive event: %@, topic: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMAccessorySoftwareUpdateControllerV2 handleDidReceiveEvent:topic:](v9, "handleDidReceiveEvent:topic:", v6, v7);

}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMAccessorySoftwareUpdateControllerV2 *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1A1AC1AAC]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v14;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Did receive cached event: %@, topic: %@, source: %@", (uint8_t *)&v15, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  -[HMAccessorySoftwareUpdateControllerV2 handleDidReceiveEvent:topic:](v12, "handleDidReceiveEvent:topic:", v8, v9);

}

- (HMAccessorySoftwareUpdateControllerV2Delegate)delegate
{
  return (HMAccessorySoftwareUpdateControllerV2Delegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (_HMContext)context
{
  return (_HMContext *)objc_getProperty(self, a2, 24, 1);
}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (HMESubscriptionProviding)subscriptionProvider
{
  return (HMESubscriptionProviding *)objc_getProperty(self, a2, 40, 1);
}

- (HMSoftwareUpdateDocumentationManager)documentationManager
{
  return self->_documentationManager;
}

- (NSMutableDictionary)softwareUpdateByAccessory
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_softwareUpdateByAccessory, 0);
  objc_storeStrong((id *)&self->_documentationManager, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __84__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveProgressEvent_forAccessory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateController:accessory:didUpdateProgress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __86__HMAccessorySoftwareUpdateControllerV2_handleDidReceiveDescriptorEvent_forAccessory___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareUpdateController:accessory:didReceiveUpdate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __101__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateRepeatedlyOnAccessory_andInstallUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v19 = 138544130;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v5;
      v14 = "%{public}@SRAISU: Failed to initiate scanning for updates repeatedly on accessory with identifier: %@ UUID: %@ error: %@";
      v15 = v10;
      v16 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v15, v16, v14, (uint8_t *)&v19, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v19 = 138544130;
    v20 = v11;
    v21 = 2112;
    v22 = v17;
    v23 = 2112;
    v24 = v18;
    v25 = 2112;
    v26 = 0;
    v14 = "%{public}@SRAISU: Successfully started scanning for updates repeatedly on accessory with identifier: %@ UUID: %@ error: %@";
    v15 = v10;
    v16 = OS_LOG_TYPE_INFO;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
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
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v5;
      v12 = "%{public}@Failed to start software update with error: %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
LABEL_6:
      _os_log_impl(&dword_19B1B0000, v13, v14, v12, buf, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v24 = v11;
    v12 = "%{public}@Successfully started software update";
    v13 = v10;
    v14 = OS_LOG_TYPE_INFO;
    v15 = 12;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "delegateCaller");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_38;
  v20[3] = &unk_1E3AB60A0;
  v18 = *(id *)(a1 + 40);
  v21 = v5;
  v22 = v18;
  v19 = v5;
  objc_msgSend(v17, "invokeBlock:", v20);

}

uint64_t __82__HMAccessorySoftwareUpdateControllerV2_applySoftwareUpdate_accessory_completion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D285F8];
  v19 = CFSTR("HMAccessorySoftwareUpdateControllerV2MessageKeyScanOptions");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithName:destination:payload:", CFSTR("HMAccessorySoftwareUpdateControllerV2ScanMessage"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3;
  v17[3] = &unk_1E3AB6200;
  v17[4] = *(_QWORD *)(a1 + 32);
  v11 = v10;
  v18 = v11;
  objc_msgSend(v9, "setResponseHandler:", v17);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageDispatcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendMessage:", v9);

  v14 = v18;
  v15 = v11;

  return v15;
}

void __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_31(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v3 = objc_msgSend(a2, "na_any:", &__block_literal_global_34);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegateCaller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3_35;
  v7[3] = &unk_1E3AB15D0;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v8 = v6;
  objc_msgSend(v5, "invokeBlock:", v7);

}

uint64_t __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3_35(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_INFO, "%{public}@Calling completion with didFindUpdate: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_2_32(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "BOOLValue");
}

void __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543362;
    v22 = v10;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_INFO, "%{public}@Received response for HMAccessorySoftwareUpdateControllerV2ScanMessage", (uint8_t *)&v21, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  if (v5)
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Scan message failed with error: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AAA0]);
  }
  else
  {
    objc_msgSend(v6, "hmf_numberForKey:", CFSTR("HMAccessorySoftwareUpdateControllerV2MessageKeyScanDidFindUpdate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v20;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Message did not contain required key in response: HMAccessorySoftwareUpdateControllerV2MessageKeyScanDidFindUpdate", (uint8_t *)&v21, 0xCu);

      }
      objc_autoreleasePoolPop(v17);
      v16 = (void *)MEMORY[0x1E0C9AAA0];
    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v16);

  }
}

id __99__HMAccessorySoftwareUpdateControllerV2_scanForSoftwareUpdateOnAccessories_withOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D285D8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithTarget:", v3);

  return v4;
}

void __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("error: %@, "), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_1E3AB7688;
  }
  v8 = (void *)MEMORY[0x1A1AC1AAC]();
  v9 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v11;
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Subscribed with %@cachedEvents: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(*(id *)(a1 + 32), "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_14;
  v21[3] = &unk_1E3AB60A0;
  v15 = *(id *)(a1 + 40);
  v22 = v6;
  v23 = v15;
  v16 = v6;
  objc_msgSend(v13, "invokeBlock:", v21);

  objc_msgSend(v5, "na_filter:", &__block_literal_global_7735);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_3;
  v20[3] = &unk_1E3AB1D60;
  v20[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v17, "na_each:", v20);

  objc_msgSend(v5, "na_filter:", &__block_literal_global_19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_5;
  v19[3] = &unk_1E3AB1D60;
  v19[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v18, "na_each:", v19);

}

uint64_t __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDidReceiveEvent:topic:", a3, a2);
}

uint64_t __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDidReceiveEvent:topic:", a3, a2);
}

BOOL __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  +[HMEventTopicHelper decodeTopic:](HMEventTopicHelper, "decodeTopic:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asAccessoryTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "accessoryEventTopicSuffixID") == 507;
  return v4;
}

BOOL __62__HMAccessorySoftwareUpdateControllerV2_subscribe_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  +[HMEventTopicHelper decodeTopic:](HMEventTopicHelper, "decodeTopic:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asAccessoryTopic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "accessoryEventTopicSuffixID") == 506;
  return v4;
}

+ (id)topicFiltersForAccessoryIdentifiers:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(a3, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82__HMAccessorySoftwareUpdateControllerV2_topicFiltersForAccessoryIdentifiers_home___block_invoke;
  v11[3] = &unk_1E3AAE4A0;
  v12 = v6;
  v13 = a1;
  v8 = v6;
  objc_msgSend(v7, "na_flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)accessoryUUIDsForAccessoryIdentifiers:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HMAccessorySoftwareUpdateControllerV2_accessoryUUIDsForAccessoryIdentifiers_home___block_invoke;
  v17[3] = &unk_1E3AAE4C8;
  v9 = v7;
  v18 = v9;
  objc_msgSend(v8, "na_map:", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  if (v11 != objc_msgSend(v6, "count"))
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = a1;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert all identifiers to uuids. Identifiers: %@, uuids: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
  }

  return v10;
}

+ (id)softwareUpdateFromSoftwareUpdateV2:(id)a3
{
  id v3;
  HMSoftwareUpdate *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  HMSoftwareUpdate *v8;

  v3 = a3;
  v4 = [HMSoftwareUpdate alloc];
  objc_msgSend(v3, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "downloadSize");
  objc_msgSend(v3, "documentationMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMSoftwareUpdate initWithVersion:downloadSize:state:documentationMetadata:](v4, "initWithVersion:downloadSize:state:documentationMetadata:", v5, v6, 2, v7);
  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38 != -1)
    dispatch_once(&logCategory__hmf_once_t38, &__block_literal_global_50);
  return (id)logCategory__hmf_once_v39;
}

void __52__HMAccessorySoftwareUpdateControllerV2_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v39;
  logCategory__hmf_once_v39 = v0;

}

id __84__HMAccessorySoftwareUpdateControllerV2_accessoryUUIDsForAccessoryIdentifiers_home___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryWithUniqueIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __82__HMAccessorySoftwareUpdateControllerV2_topicFiltersForAccessoryIdentifiers_home___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[2];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessoryWithUniqueIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMAccessoryEventTopic topicFromSuffixID:homeUUID:accessoryUUID:](HMAccessoryEventTopic, "topicFromSuffixID:homeUUID:accessoryUUID:", 506, v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uuid", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMAccessoryEventTopic topicFromSuffixID:homeUUID:accessoryUUID:](HMAccessoryEventTopic, "topicFromSuffixID:homeUUID:accessoryUUID:", 507, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v14;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to find accessory UUID for uniqueIdentifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    v10 = 0;
  }

  return v10;
}

@end
