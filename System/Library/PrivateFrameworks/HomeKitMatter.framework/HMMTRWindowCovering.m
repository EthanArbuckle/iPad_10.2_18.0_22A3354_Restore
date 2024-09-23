@implementation HMMTRWindowCovering

- (void)writeAttributePluginTargetPositionWithSetValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke;
  v10[3] = &unk_250F24150;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[MTRBaseClusterWindowCovering readAttributeFeatureMapWithCompletionHandler:](self, "readAttributeFeatureMapWithCompletionHandler:", v10);

}

- (void)writeAttributePluginTargetPositionTiltWithSetValue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke;
  v10[3] = &unk_250F24150;
  v11 = v6;
  v12 = v7;
  v10[4] = self;
  v8 = v6;
  v9 = v7;
  -[MTRBaseClusterWindowCovering readAttributeFeatureMapWithCompletionHandler:](self, "readAttributeFeatureMapWithCompletionHandler:", v10);

}

void __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  unsigned int v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2112;
      v36 = (uint64_t)v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the window covering cluster's feature map: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v11 = objc_msgSend(v5, "unsignedIntegerValue");
    v12 = (void *)MEMORY[0x242656984]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1[5];
      *(_DWORD *)buf = 138543874;
      v34 = v15;
      v35 = 2048;
      v36 = v11;
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Window covering Feature Map from device %tu, set value %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    if ((~(_DWORD)v11 & 0x12) != 0)
    {
      v24 = objc_msgSend(a1[5], "unsignedIntValue");
      v25 = a1[4];
      if (v24 < 0x1389)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke_9;
        v27[3] = &unk_250F23CD0;
        v27[4] = v25;
        v28 = a1[6];
        objc_msgSend(v25, "upOrOpenWithCompletionHandler:", v27);
        v26 = v28;
      }
      else
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke_8;
        v29[3] = &unk_250F23CD0;
        v29[4] = v25;
        v30 = a1[6];
        objc_msgSend(v25, "downOrCloseWithCompletionHandler:", v29);
        v26 = v30;
      }

    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x24BDDB830]);
      v18 = (void *)MEMORY[0x242656984](objc_msgSend(v17, "setTiltPercent100thsValue:", a1[5]));
      v19 = a1[4];
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "tiltPercent100thsValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v21;
        v35 = 2112;
        v36 = (uint64_t)v22;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@tiltPercent100thsValue %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = a1[4];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke_7;
      v31[3] = &unk_250F23CD0;
      v31[4] = v23;
      v32 = a1[6];
      objc_msgSend(v23, "goToTiltPercentageWithParams:completionHandler:", v17, v31);

    }
  }

}

void __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke_7(uint64_t a1, void *a2)
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
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to write to DownOrClose: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = 0;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to DownOrClose. Result: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __92__HMMTRWindowCovering_writeAttributePluginTargetPositionTiltWithSetValue_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to write to UpOrOpen: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = 0;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to UpOrOpen. Result: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  unsigned int v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = a1[4];
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v10;
      v35 = 2112;
      v36 = (uint64_t)v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to read the window covering cluster's feature map: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    v11 = objc_msgSend(v5, "unsignedIntegerValue");
    v12 = (void *)MEMORY[0x242656984]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = a1[5];
      *(_DWORD *)buf = 138543874;
      v34 = v15;
      v35 = 2048;
      v36 = v11;
      v37 = 2112;
      v38 = v16;
      _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Window covering Feature Map from device %tu, set value %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v12);
    if ((~(_DWORD)v11 & 5) != 0)
    {
      v24 = objc_msgSend(a1[5], "unsignedIntValue");
      v25 = a1[4];
      if (v24 < 0x1389)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke_4;
        v27[3] = &unk_250F23CD0;
        v27[4] = v25;
        v28 = a1[6];
        objc_msgSend(v25, "upOrOpenWithCompletionHandler:", v27);
        v26 = v28;
      }
      else
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke_3;
        v29[3] = &unk_250F23CD0;
        v29[4] = v25;
        v30 = a1[6];
        objc_msgSend(v25, "downOrCloseWithCompletionHandler:", v29);
        v26 = v30;
      }

    }
    else
    {
      v17 = objc_alloc_init(MEMORY[0x24BDDB828]);
      v18 = (void *)MEMORY[0x242656984](objc_msgSend(v17, "setLiftPercent100thsValue:", a1[5]));
      v19 = a1[4];
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "liftPercent100thsValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v34 = v21;
        v35 = 2112;
        v36 = (uint64_t)v22;
        _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_DEBUG, "%{public}@liftPercent100thsValue %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = a1[4];
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke_1;
      v31[3] = &unk_250F23CD0;
      v31[4] = v23;
      v32 = a1[6];
      objc_msgSend(v23, "goToLiftPercentageWithParams:completionHandler:", v17, v31);

    }
  }

}

void __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke_1(uint64_t a1, void *a2)
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
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to write to DownOrClose: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = 0;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to DownOrClose. Result: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88__HMMTRWindowCovering_writeAttributePluginTargetPositionWithSetValue_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
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
      v10 = 138543618;
      v11 = v8;
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@An error occurred while trying to write to UpOrOpen: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = 0;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Wrote to UpOrOpen. Result: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
