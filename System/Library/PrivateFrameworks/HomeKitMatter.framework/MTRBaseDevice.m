@implementation MTRBaseDevice

void __110__MTRBaseDevice_HMMTRPairing___fetchPairingsWithCallbackQueue_filtered_vendorMetadataStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  HMMTRPairing *v13;
  void *v14;
  void *v15;
  void *v16;
  HMMTRPairing *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v25 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v5;
    v9 = v5;
    v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v28)
    {
      v10 = *(_QWORD *)v30;
      v27 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v9);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v13 = [HMMTRPairing alloc];
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v12, "vendorId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_vendorNameForVendorID:vendorMetadataStore:", v15, *(_QWORD *)(a1 + 40));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[HMMTRPairing initWithFabricDescriptor:vendorName:](v13, "initWithFabricDescriptor:vendorName:", v12, v16);

          if (v17)
          {
            objc_msgSend(v8, "addObject:", v17);
          }
          else
          {
            v18 = (void *)MEMORY[0x242656984]();
            v19 = *(id *)(a1 + 32);
            HMFGetOSLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v21 = v9;
              v22 = v8;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v34 = v23;
              v35 = 2112;
              v36 = v12;
              _os_log_impl(&dword_23E95B000, v20, OS_LOG_TYPE_ERROR, "%{public}@Could not construct HMMTRPairing from fetched fabricDescriptor: %@", buf, 0x16u);

              v8 = v22;
              v9 = v21;
              v10 = v27;
            }

            objc_autoreleasePoolPop(v18);
          }

        }
        v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v28);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v7 = v25;
    v5 = v26;
  }
  else
  {
    +[HMMTRAccessoryPairingEndContext mtrContextWithStep:error:](HMMTRAccessoryPairingEndContext, "mtrContextWithStep:error:", 10, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
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
      v20 = v10;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to find current fabric Index, unpairing might not complete deterministically. Error: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  v11 = a1[4];
  v12 = a1[5];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_14;
  v14[3] = &unk_250F24100;
  v14[4] = v11;
  v18 = a1[7];
  v15 = v5;
  v16 = a1[6];
  v17 = a1[5];
  v13 = v5;
  objc_msgSend(v11, "fetchFabricDescriptorsWithCallbackQueue:filtered:completionHandler:", v12, 0, v14);

}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  HMMTRPairing *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id obj;
  _QWORD block[5];
  id v33;
  id v34;
  id v35;
  id v36;
  _BYTE *v37;
  _QWORD v38[6];
  NSObject *v39;
  _BYTE *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v29 = v5;
  v30 = a3;
  if (v30)
  {
    v6 = (void *)MEMORY[0x242656984]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_ERROR, "%{public}@Remove all pairings error: Could not retrieve Fabrics List. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v10 = dispatch_group_create();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v47 = __Block_byref_object_copy__10078;
    v48 = __Block_byref_object_dispose__10079;
    v49 = 0;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v5;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    v12 = 0;
    if (v11)
    {
      v13 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v42 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v15, "fabricIndex");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v16) = objc_msgSend(v16, "isEqualToNumber:", v17);

          if ((_DWORD)v16)
          {
            v18 = [HMMTRPairing alloc];
            v19 = *(void **)(a1 + 32);
            objc_msgSend(v15, "vendorId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "_vendorNameForVendorID:vendorMetadataStore:", v20, *(_QWORD *)(a1 + 48));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[HMMTRPairing initWithFabricDescriptor:vendorName:](v18, "initWithFabricDescriptor:vendorName:", v15, v21);

            v12 = (void *)v22;
          }
          else
          {
            dispatch_group_enter(v10);
            v23 = *(void **)(a1 + 32);
            objc_msgSend(v15, "fabricIndex");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)(a1 + 56);
            v38[0] = MEMORY[0x24BDAC760];
            v38[1] = 3221225472;
            v38[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_15;
            v38[3] = &unk_250F241C8;
            v38[4] = *(_QWORD *)(a1 + 32);
            v38[5] = v15;
            v40 = buf;
            v39 = v10;
            objc_msgSend(v23, "_removeFabricWithIndex:callbackQueue:completionHandler:", v24, v25, v38);

          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v11);
    }

    v26 = *(NSObject **)(a1 + 56);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_17;
    block[3] = &unk_250F24218;
    v27 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v33 = v12;
    v34 = v27;
    v35 = *(id *)(a1 + 56);
    v37 = buf;
    v36 = *(id *)(a1 + 64);
    v28 = v12;
    dispatch_group_notify(v10, v26, block);

    _Block_object_dispose(buf, 8);
  }

}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "fabricID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543874;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove fabric ID %@ with Error %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_17(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Removing current pairing %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_18;
  v12[3] = &unk_250F241F0;
  v9 = *(void **)(a1 + 40);
  v13 = *(id *)(a1 + 32);
  v14 = v9;
  v11 = *(_OWORD *)(a1 + 64);
  v10 = (id)v11;
  v15 = v11;
  objc_msgSend(v13, "_removeFabricWithIndex:callbackQueue:completionHandler:", v7, v8, v12);

}

void __103__MTRBaseDevice_HMMTRPairing__removeAllPairingsForCallbackQueue_vendorMetadataStore_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (v4)
  {
    v5 = (void *)MEMORY[0x242656984]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 138543874;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove our own pairing %@ with Error %@", (uint8_t *)&v10, 0x20u);

    }
    objc_autoreleasePoolPop(v5);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __81__MTRBaseDevice_HMMTRPairing__updateFabricLabel_callbackQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __90__MTRBaseDevice_HMMTRPairing__fetchCurrentFabricIndexWithCallbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Current Fabric Index: %@ Error: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_autoreleasePoolPop(v7);
  if (v6)
  {
    v11 = 0;
    v12 = v6;
  }
  else
  {
    v11 = v5;
    v12 = 0;
  }
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v11, v12);

}

void __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_retrieveFabricClusterWithQueue:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BDDB7D0]);
    objc_msgSend(v7, "setFabricIndex:", v5);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke_2;
    v8[3] = &unk_250F24128;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "removeFabricWithParams:completionHandler:", v7, v8);

  }
}

void __62__MTRBaseDevice_HMMTRPairing__unpairDevice_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Unpair Status: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __86__MTRBaseDevice_HMMTRPairing___removeFabricWithIndex_callbackQueue_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x242656984]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v10;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_INFO, "%{public}@Remove pairing Status: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  HMMTRPairing *v17;
  void *v18;
  void *v19;
  void *v20;
  HMMTRPairing *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (void *)MEMORY[0x242656984]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v10;
      v36 = 2112;
      v37 = v6;
      _os_log_impl(&dword_23E95B000, v9, OS_LOG_TYPE_ERROR, "%{public}@Remove pairing error: Could not retrieve Fabrics List. %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v25 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v17 = [HMMTRPairing alloc];
          v18 = *(void **)(a1 + 32);
          objc_msgSend(v16, "vendorId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "_vendorNameForVendorID:vendorMetadataStore:", v19, *(_QWORD *)(a1 + 40));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[HMMTRPairing initWithFabricDescriptor:vendorName:](v17, "initWithFabricDescriptor:vendorName:", v16, v20);

          if (objc_msgSend(*(id *)(a1 + 48), "isEqual:", v21))
          {
            v23 = *(void **)(a1 + 32);
            objc_msgSend(v16, "fabricIndex");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "_removeFabricWithIndex:callbackQueue:completionHandler:", v24, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

            goto LABEL_15;
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v13)
          continue;
        break;
      }
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke_6;
    block[3] = &unk_250F240D8;
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = *(NSObject **)(a1 + 56);
    v27 = *(id *)(a1 + 48);
    v28 = *(id *)(a1 + 64);
    dispatch_async(v22, block);

LABEL_15:
    v6 = 0;
    v5 = v25;
  }

}

void __97__MTRBaseDevice_HMMTRPairing__removePairing_callbackQueue_vendorMetadataStore_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_ERROR, "%{public}@Remove pairing error: Could not find pairing matching %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

@end
