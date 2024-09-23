@implementation HMMTRSyncClusterWindowCovering

- (void)writeAttributePluginTargetPositionWithSetValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMMTRSyncClusterWindowCovering *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HMMTRSyncClusterWindowCovering *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMMTRSyncClusterWindowCovering *v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterWindowCovering readAttributeFeatureMapWithParams:](self, "readAttributeFeatureMapWithParams:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = *MEMORY[0x24BDDB518];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    v19 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      v40 = 2048;
      v41 = v15;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Window covering Feature Map from device %tu, set value %@", buf, 0x20u);

      v7 = v22;
    }

    objc_autoreleasePoolPop(v19);
    if ((~(_DWORD)v15 & 5) != 0)
    {
      if (objc_msgSend(v18, "unsignedIntValue") < 0x1389)
      {
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_5;
        v35[3] = &unk_250F223C0;
        v35[4] = v20;
        -[MTRClusterWindowCovering upOrOpenWithExpectedValues:expectedValueInterval:completionHandler:](v20, "upOrOpenWithExpectedValues:expectedValueInterval:completionHandler:", MEMORY[0x24BDBD1A8], v7, v35);
      }
      else
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_4;
        v36[3] = &unk_250F223C0;
        v36[4] = v20;
        -[MTRClusterWindowCovering downOrCloseWithExpectedValues:expectedValueInterval:completionHandler:](v20, "downOrCloseWithExpectedValues:expectedValueInterval:completionHandler:", MEMORY[0x24BDBD1A8], v7, v36);
      }
    }
    else
    {
      v24 = objc_alloc_init(MEMORY[0x24BDDB828]);
      v25 = (void *)MEMORY[0x242656984](objc_msgSend(v24, "setLiftPercent100thsValue:", v18));
      v26 = v20;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v34 = v7;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "liftPercent100thsValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2112;
        v41 = (uint64_t)v29;
        _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_DEBUG, "%{public}@liftPercent100thsValue %@", buf, 0x16u);

        v7 = v34;
      }

      objc_autoreleasePoolPop(v25);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke;
      v37[3] = &unk_250F223C0;
      v37[4] = v26;
      -[MTRClusterWindowCovering goToLiftPercentageWithParams:expectedValues:expectedValueInterval:completionHandler:](v26, "goToLiftPercentageWithParams:expectedValues:expectedValueInterval:completionHandler:", v24, 0, 0, v37);

    }
  }
  else
  {
    v30 = (void *)MEMORY[0x242656984]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the window covering cluster's feature map", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
  }

}

- (void)writeAttributePluginTargetPositionTiltWithSetValue:(id)a3 expectedValueInterval:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  HMMTRSyncClusterWindowCovering *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  HMMTRSyncClusterWindowCovering *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  HMMTRSyncClusterWindowCovering *v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDDB7F0]);
  -[MTRClusterWindowCovering readAttributeFeatureMapWithParams:](self, "readAttributeFeatureMapWithParams:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = *MEMORY[0x24BDDB518];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDDB518]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v6, "objectForKeyedSubscript:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
    v18 = v17;

    v19 = (void *)MEMORY[0x242656984]();
    v20 = self;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v22 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      v40 = 2048;
      v41 = v15;
      v42 = 2112;
      v43 = v6;
      _os_log_impl(&dword_23E95B000, v21, OS_LOG_TYPE_DEBUG, "%{public}@Window covering Feature Map from device %tu, set value %@", buf, 0x20u);

      v7 = v22;
    }

    objc_autoreleasePoolPop(v19);
    if ((~(_DWORD)v15 & 0x12) != 0)
    {
      if (objc_msgSend(v18, "unsignedIntValue") < 0x1389)
      {
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_8;
        v35[3] = &unk_250F223C0;
        v35[4] = v20;
        -[MTRClusterWindowCovering upOrOpenWithExpectedValues:expectedValueInterval:completionHandler:](v20, "upOrOpenWithExpectedValues:expectedValueInterval:completionHandler:", MEMORY[0x24BDBD1A8], v7, v35);
      }
      else
      {
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_7;
        v36[3] = &unk_250F223C0;
        v36[4] = v20;
        -[MTRClusterWindowCovering downOrCloseWithExpectedValues:expectedValueInterval:completionHandler:](v20, "downOrCloseWithExpectedValues:expectedValueInterval:completionHandler:", MEMORY[0x24BDBD1A8], v7, v36);
      }
    }
    else
    {
      v24 = objc_alloc_init(MEMORY[0x24BDDB830]);
      v25 = (void *)MEMORY[0x242656984](objc_msgSend(v24, "setTiltPercent100thsValue:", v18));
      v26 = v20;
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v34 = v7;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "tiltPercent100thsValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        v40 = 2112;
        v41 = (uint64_t)v29;
        _os_log_impl(&dword_23E95B000, v27, OS_LOG_TYPE_DEBUG, "%{public}@tiltPercent100thsValue %@", buf, 0x16u);

        v7 = v34;
      }

      objc_autoreleasePoolPop(v25);
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke;
      v37[3] = &unk_250F223C0;
      v37[4] = v26;
      -[MTRClusterWindowCovering goToTiltPercentageWithParams:expectedValues:expectedValueInterval:completionHandler:](v26, "goToTiltPercentageWithParams:expectedValues:expectedValueInterval:completionHandler:", v24, 0, 0, v37);

    }
  }
  else
  {
    v30 = (void *)MEMORY[0x242656984]();
    v31 = self;
    HMFGetOSLogHandle();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v33;
      _os_log_impl(&dword_23E95B000, v32, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the window covering cluster's feature map", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v30);
  }

}

void __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to GoToTiltPercentage. Result: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to DownOrClose: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = 0;
    v9 = "%{public}@Wrote to DownOrClose. Result: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __107__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_expectedValueInterval___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to UpOrOpen: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = 0;
    v9 = "%{public}@Wrote to UpOrOpen. Result: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_23E95B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to GoToLiftPercentage. Result: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);

}

void __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to DownOrClose: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = 0;
    v9 = "%{public}@Wrote to DownOrClose. Result: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

void __103__HMMTRSyncClusterWindowCovering_writeAttributePluginTargetPositionWithSetValue_expectedValueInterval___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x242656984]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      v9 = "%{public}@An error occurred while trying to write to UpOrOpen: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23E95B000, v10, v11, v9, (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = 0;
    v9 = "%{public}@Wrote to UpOrOpen. Result: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEBUG;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

@end
