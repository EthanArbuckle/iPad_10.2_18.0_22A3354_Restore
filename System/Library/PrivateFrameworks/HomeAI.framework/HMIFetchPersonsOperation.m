@implementation HMIFetchPersonsOperation

- (HMIFetchPersonsOperation)initWithDataSource:(id)a3
{
  id v5;
  HMIFetchPersonsOperation *v6;
  HMIFetchPersonsOperation *v7;
  uint64_t v8;
  NSSet *persons;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMIFetchPersonsOperation;
  v6 = -[HMFOperation initWithTimeout:](&v11, sel_initWithTimeout_, 20.0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSource, a3);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    persons = v7->_persons;
    v7->_persons = (NSSet *)v8;

  }
  return v7;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIFetchPersonsOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HMIFetchPersonsOperation dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__HMIFetchPersonsOperation_mainInsideAutoreleasePool__block_invoke;
  v4[3] = &unk_24DBEB858;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "fetchAllPersonsWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__HMIFetchPersonsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
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
        v14 = 138543618;
        v15 = v13;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_219D45000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error fetching persons:%@", (uint8_t *)&v14, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
      objc_msgSend(v11, "cancelWithError:", v7);
    }
    else
    {
      objc_storeStrong(WeakRetained + 40, a2);
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

- (NSSet)persons
{
  return (NSSet *)objc_getProperty(self, a2, 320, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
