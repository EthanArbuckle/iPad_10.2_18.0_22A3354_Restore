@implementation HMDPhotoLibrary

- (HMDPhotoLibrary)initWithWorkQueue:(id)a3
{
  id v5;
  HMDPhotoLibrary *v6;
  HMDPhotoLibrary *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDPhotoLibrary;
  v6 = -[HMDPhotoLibrary init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_workQueue, a3);

  return v7;
}

- (NSSet)persons
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDPhotoLibrary *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDPhotoLibrary suggestedPersonsFetchResult](self, "suggestedPersonsFetchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v4, "objects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "na_map:", &__block_literal_global_51457);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@suggestedPersonsFetchResult is nil, returning nil", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    v9 = 0;
  }

  return (NSSet *)v9;
}

- (HMDPhotoLibraryDelegate)delegate
{
  NSObject *v3;

  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return (HMDPhotoLibraryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_storeWeak((id *)&self->_delegate, v4);
  -[HMDPhotoLibrary photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "registerChangeObserver:", self);
  else
    objc_msgSend(v6, "unregisterChangeObserver:", self);

}

- (void)fetchPersons
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x24BDE35E0];
  -[HMDPhotoLibrary fetchOptions](self, "fetchOptions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchSuggestedPersonsForClient:options:", 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPhotoLibrary setSuggestedPersonsFetchResult:](self, "setSuggestedPersonsFetchResult:", v5);

}

- (id)fetchFaceCropDataByUUIDForPersonUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HMDPhotoLibrary *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDPhotoLibrary *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPhotoLibrary suggestedPersonsFetchResult](self, "suggestedPersonsFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[HMDPhotoLibrary _phPersonWithUUID:fromSuggestedPersonsFetchResult:](HMDPhotoLibrary, "_phPersonWithUUID:fromSuggestedPersonsFetchResult:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMDPhotoLibrary fetchOptions](self, "fetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFetchLimit:", 20);
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSortDescriptors:", v10);

      objc_msgSend(MEMORY[0x24BDE3558], "fetchTransientTrainingFaceCropsForPerson:options:", v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "faceCropDataByUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v20;
        v25 = 2112;
        v26 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find person with UUID: %@, returning empty dictionary", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v12 = (void *)MEMORY[0x24BDBD1B8];
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@suggestedPersonsFetchResult is nil, returning nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (unint64_t)numberOfFaceCropsForPersonWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  HMDPhotoLibrary *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  HMDPhotoLibrary *v18;
  NSObject *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDPhotoLibrary suggestedPersonsFetchResult](self, "suggestedPersonsFetchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[HMDPhotoLibrary _phPersonWithUUID:fromSuggestedPersonsFetchResult:](HMDPhotoLibrary, "_phPersonWithUUID:fromSuggestedPersonsFetchResult:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[HMDPhotoLibrary fetchOptions](self, "fetchOptions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("isInVIPModel == YES"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPredicate:", v9);

      objc_msgSend(MEMORY[0x24BDE3548], "fetchFacesForPerson:options:", v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    else
    {
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v20;
        v24 = 2112;
        v25 = v4;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find person with UUID: %@, returning 0", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      v12 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543362;
      v23 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@suggestedPersonsFetchResult is nil, returning 0", (uint8_t *)&v22, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (id)faceCropFromFaceCropData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE4D1D0], "faceCropFromPhotosFaceCropImageData:", a3);
}

- (PHPhotoLibrary)photoLibrary
{
  NSObject *v3;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v5;
  PHPhotoLibrary *v6;

  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  photoLibrary = self->_photoLibrary;
  if (!photoLibrary)
  {
    objc_msgSend(MEMORY[0x24BDE35F0], "sharedPhotoLibrary");
    v5 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_photoLibrary;
    self->_photoLibrary = v5;

    photoLibrary = self->_photoLibrary;
  }
  return photoLibrary;
}

- (id)fetchOptions
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDPhotoLibrary photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setIncludeNonvisibleFaces:", 0);
  return v5;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDPhotoLibrary workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HMDPhotoLibrary_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (PHFetchResult)suggestedPersonsFetchResult
{
  return (PHFetchResult *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestedPersonsFetchResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPersonsFetchResult, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __41__HMDPhotoLibrary_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543362;
    v26 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Photo Library did change", (uint8_t *)&v25, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 40), "changedLocalIdentifiersForEntityClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE3818];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDE3818]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hmf_isEmpty") ^ 1;

  }
  else
  {
    v10 = 0;
  }

  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "suggestedPersonsFetchResult");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeDetailsForFetchResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x227676638]();
  v15 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v17;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v13;
    _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_DEBUG, "%{public}@anyPersonWasAdded: %@, changeDetails: %@", (uint8_t *)&v25, 0x20u);

  }
  objc_autoreleasePoolPop(v14);
  if (v13)
    v19 = 1;
  else
    v19 = v10;
  if (v19 == 1)
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138543362;
      v26 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@Found changes for photo library persons", (uint8_t *)&v25, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "photoLibraryPersonsDidChange");

  }
}

uint64_t __26__HMDPhotoLibrary_persons__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "createPhotoLibraryPerson");
}

+ (id)_phPersonWithUUID:(id)a3 fromSuggestedPersonsFetchResult:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  objc_msgSend(a4, "objects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__HMDPhotoLibrary__phPersonWithUUID_fromSuggestedPersonsFetchResult___block_invoke;
  v10[3] = &unk_24E77CA10;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_51465 != -1)
    dispatch_once(&logCategory__hmf_once_t8_51465, &__block_literal_global_174);
  return (id)logCategory__hmf_once_v9_51466;
}

void __30__HMDPhotoLibrary_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_51466;
  logCategory__hmf_once_v9_51466 = v0;

}

uint64_t __69__HMDPhotoLibrary__phPersonWithUUID_fromSuggestedPersonsFetchResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

@end
