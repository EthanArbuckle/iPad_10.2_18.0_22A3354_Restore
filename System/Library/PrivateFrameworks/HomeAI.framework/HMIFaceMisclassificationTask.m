@implementation HMIFaceMisclassificationTask

- (HMIFaceMisclassificationTask)initWithTaskID:(int)a3 dataSource:(id)a4 faceCrop:(id)a5
{
  uint64_t v7;
  id v9;
  id v10;
  HMIFaceMisclassificationTask *v11;
  HMIFaceMisclassificationTask *v12;
  objc_super v14;

  v7 = *(_QWORD *)&a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMIFaceMisclassificationTask;
  v11 = -[HMITask initWithTaskID:](&v14, sel_initWithTaskID_, v7);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_faceCrop, a5);
    objc_storeStrong((id *)&v12->_dataSource, a4);
  }

  return v12;
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[HMIFaceMisclassificationTask dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  -[HMIFaceMisclassificationTask faceCrop](self, "faceCrop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke;
  v8[3] = &unk_24DBEB858;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "fetchFaceCropsForPersonsWithUUIDs:completion:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _BYTE location[12];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(v5, "na_map:", &__block_literal_global_19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)location, WeakRetained);
      objc_msgSend(WeakRetained, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke_2;
      v14[3] = &unk_24DBEBEE0;
      objc_copyWeak(&v16, (id *)location);
      v15 = v5;
      objc_msgSend(v9, "fetchFaceprintsForFaceCropsWithUUIDs:completion:", v8, v14);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)location);

    }
    else
    {
      v10 = (void *)MEMORY[0x220735570]();
      v11 = WeakRetained;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138543618;
        *(_QWORD *)&location[4] = v13;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch face crops with error: %@", location, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "cancelWithError:", v6);
    }
  }

}

uint64_t __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke_23(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __57__HMIFaceMisclassificationTask_mainInsideAutoreleasePool__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      objc_msgSend(WeakRetained, "removeNearestFaceprint:withFaceCrops:", v5, *(_QWORD *)(a1 + 32));
    }
    else
    {
      v9 = (void *)MEMORY[0x220735570]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch faceprints with error: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "cancelWithError:", v6);
    }
  }

}

- (void)removeNearestFaceprint:(id)a3 withFaceCrops:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  HMIFaceMisclassificationTask *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMIFaceMisclassificationTask *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  double v30;
  id v31;
  void *v32;
  HMIFaceMisclassificationTask *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  HMIFaceprinter *v46;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  uint8_t v59[128];
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v58 = 0;
  v46 = objc_alloc_init(HMIFaceprinter);
  v44 = v6;
  -[HMIFaceprinter updatedFaceprintsForFaceCrops:withExistingFaceprints:error:](v46, "updatedFaceprintsForFaceCrops:withExistingFaceprints:error:", v6, v5, &v58);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v58;
  if (v48)
  {
    objc_msgSend(v48, "allAtCurrentVersion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "hmf_isEmpty"))
    {
      v8 = (void *)MEMORY[0x220735570]();
      v9 = self;
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMIFaceMisclassificationTask faceCrop](v9, "faceCrop");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "personUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v11;
        v62 = 2112;
        v63 = v13;
        _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_INFO, "%{public}@Person (%@) has no faceprints -- nothing to remove", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      -[HMFOperation finish](v9, "finish");
    }
    else
    {
      -[HMIFaceMisclassificationTask faceCrop](self, "faceCrop");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v7;
      -[HMIFaceprinter generateFaceprintForFaceCrop:error:](v46, "generateFaceprintForFaceCrop:error:", v18, &v57);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v57;

      objc_msgSend(v43, "faceprint");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v19 = v45;
      v20 = 0;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v54;
        v23 = 1.79769313e308;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v54 != v22)
              objc_enumerationMutation(v19);
            v25 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
            objc_msgSend(v49, "descriptorData");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "data");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[HMIGreedyClustering faceDistanceFromDescriptor:toDescriptor:](HMIGreedyClustering, "faceDistanceFromDescriptor:toDescriptor:", v26, v27);
            v29 = v28;

            v30 = v29;
            if (v23 > v30)
            {
              v31 = v25;

              v23 = v30;
              v20 = v31;
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        }
        while (v21);
      }

      v32 = (void *)MEMORY[0x220735570]();
      v33 = self;
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "faceCropUUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v61 = v35;
        v62 = 2112;
        v63 = v36;
        _os_log_impl(&dword_219D45000, v34, OS_LOG_TYPE_INFO, "%{public}@Nearest face crop to be removed: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      objc_initWeak((id *)buf, v33);
      -[HMIFaceMisclassificationTask dataSource](v33, "dataSource");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v20, "faceCropUUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setWithObject:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = __69__HMIFaceMisclassificationTask_removeNearestFaceprint_withFaceCrops___block_invoke;
      v50[3] = &unk_24DBEBF08;
      objc_copyWeak(&v52, (id *)buf);
      v41 = v20;
      v51 = v41;
      objc_msgSend(v37, "removeFaceCropsWithUUIDs:completion:", v40, v50);

      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)buf);

      v7 = v42;
    }

  }
  else
  {
    v14 = (void *)MEMORY[0x220735570]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v61 = v17;
      v62 = 2112;
      v63 = v7;
      _os_log_impl(&dword_219D45000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error faceprinting face crops:%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    -[HMFOperation cancelWithError:](v15, "cancelWithError:", v7);
  }

}

void __69__HMIFaceMisclassificationTask_removeNearestFaceprint_withFaceCrops___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)MEMORY[0x220735570]();
    v6 = WeakRetained;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v9;
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to remove face crop with error: %@", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "cancelWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "faceCropUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543618;
        v13 = v10;
        v14 = 2112;
        v15 = v11;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully removed face crop (%@) via user indicated misclassification", (uint8_t *)&v12, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "finish");
    }
  }

}

- (HMIPersonFaceCrop)faceCrop
{
  return (HMIPersonFaceCrop *)objc_getProperty(self, a2, 328, 1);
}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 336, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_faceCrop, 0);
}

@end
