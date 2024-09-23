@implementation HMIFetchPersonFaceCropsOperation

- (HMIFetchPersonFaceCropsOperation)initWithDataSource:(id)a3 person:(id)a4
{
  id v7;
  id v8;
  HMIFetchPersonFaceCropsOperation *v9;
  HMIFetchPersonFaceCropsOperation *v10;
  uint64_t v11;
  NSSet *personFaceCrops;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMIFetchPersonFaceCropsOperation;
  v9 = -[HMFOperation initWithTimeout:](&v14, sel_initWithTimeout_, 20.0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_person, a4);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    personFaceCrops = v10->_personFaceCrops;
    v10->_personFaceCrops = (NSSet *)v11;

  }
  return v10;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIFetchPersonFaceCropsOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
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
  -[HMIFetchPersonFaceCropsOperation dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  -[HMIFetchPersonFaceCropsOperation person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HMIFetchPersonFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v8[3] = &unk_24DBEB858;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "fetchFaceCropsForPersonsWithUUIDs:completion:", v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __61__HMIFetchPersonFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      v10 = (void *)MEMORY[0x220735570]();
      v11 = v9;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "person");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = v13;
        v17 = 2112;
        v18 = v14;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error fetching face crops for person:%@, error:%@", (uint8_t *)&v15, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "cancelWithError:", v7);
    }
    else
    {
      objc_storeStrong(WeakRetained + 41, a2);
      objc_msgSend(v9, "finish");
    }
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (HMIPersonManagerDataSource)dataSource
{
  return (HMIPersonManagerDataSource *)objc_getProperty(self, a2, 312, 1);
}

- (HMIPerson)person
{
  return (HMIPerson *)objc_getProperty(self, a2, 320, 1);
}

- (NSSet)personFaceCrops
{
  return (NSSet *)objc_getProperty(self, a2, 328, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personFaceCrops, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
