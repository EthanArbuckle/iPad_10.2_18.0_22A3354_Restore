@implementation HMIRemoveFaceCropsOperation

- (HMIRemoveFaceCropsOperation)initWithDataSource:(id)a3 faceCropUUIDs:(id)a4
{
  id v7;
  id v8;
  HMIRemoveFaceCropsOperation *v9;
  HMIRemoveFaceCropsOperation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIRemoveFaceCropsOperation;
  v9 = -[HMFOperation initWithTimeout:](&v12, sel_initWithTimeout_, 20.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_faceCropUUIDs, a4);
  }

  return v10;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIRemoveFaceCropsOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[HMIRemoveFaceCropsOperation dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIRemoveFaceCropsOperation faceCropUUIDs](self, "faceCropUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__HMIRemoveFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v5[3] = &unk_24DBE9D08;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "removeFaceCropsWithUUIDs:completion:", v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__HMIRemoveFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
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
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
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
        objc_msgSend(v6, "faceCropUUIDs");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543874;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        v17 = 2112;
        v18 = v3;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Removing faceCrops:%@ failed with error:%@", (uint8_t *)&v13, 0x20u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "cancelWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "faceCropUUIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing faceCrops:%@ completed successfully", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "finish");
    }
  }

}

- (HMIHomePersonManagerDataSource)dataSource
{
  return (HMIHomePersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (NSSet)faceCropUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropUUIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
