@implementation HMIAssociateFaceCropsOperation

- (HMIAssociateFaceCropsOperation)initWithDataSource:(id)a3 faceCropUUIDs:(id)a4 personUUID:(id)a5 source:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  HMIAssociateFaceCropsOperation *v14;
  HMIAssociateFaceCropsOperation *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HMIAssociateFaceCropsOperation;
  v14 = -[HMFOperation initWithTimeout:](&v17, sel_initWithTimeout_, 20.0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dataSource, a3);
    objc_storeStrong((id *)&v15->_faceCropUUIDs, a4);
    objc_storeStrong((id *)&v15->_personUUID, a5);
    v15->_source = a6;
  }

  return v15;
}

- (void)main
{
  void *v3;

  v3 = (void *)MEMORY[0x220735570](self, a2);
  -[HMIAssociateFaceCropsOperation mainInsideAutoreleasePool](self, "mainInsideAutoreleasePool");
  objc_autoreleasePoolPop(v3);
}

- (void)mainInsideAutoreleasePool
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[HMIAssociateFaceCropsOperation dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIAssociateFaceCropsOperation faceCropUUIDs](self, "faceCropUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMIAssociateFaceCropsOperation personUUID](self, "personUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMIAssociateFaceCropsOperation source](self, "source");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__HMIAssociateFaceCropsOperation_mainInsideAutoreleasePool__block_invoke;
  v7[3] = &unk_24DBE9D08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "associateFaceCropsWithUUIDs:toPersonWithUUID:forSource:completion:", v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __59__HMIAssociateFaceCropsOperation_mainInsideAutoreleasePool__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
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
        v11 = objc_msgSend(v10, "count");
        objc_msgSend(v6, "personUUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        HMIPersonFaceCropSourceAsString(objc_msgSend(v6, "source"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138544386;
        v20 = v9;
        v21 = 2048;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v3;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Error associating face crops (num UUIDs:%lu), to personUUID: %@ with source: %@ error:%@", (uint8_t *)&v19, 0x34u);

      }
      objc_autoreleasePoolPop(v5);
      objc_msgSend(v6, "cancelWithError:", v3);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "faceCropUUIDs");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        objc_msgSend(v6, "personUUID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        HMIPersonFaceCropSourceAsString(objc_msgSend(v6, "source"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138544130;
        v20 = v14;
        v21 = 2048;
        v22 = v16;
        v23 = 2112;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_INFO, "%{public}@Succesfully associated face crops (num UUIDs %lu) to person UUID: %@ for source: %@", (uint8_t *)&v19, 0x2Au);

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

- (NSUUID)personUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 328, 1);
}

- (int64_t)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personUUID, 0);
  objc_storeStrong((id *)&self->_faceCropUUIDs, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
