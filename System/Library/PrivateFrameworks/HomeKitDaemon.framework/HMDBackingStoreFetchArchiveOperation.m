@implementation HMDBackingStoreFetchArchiveOperation

- (HMDBackingStoreFetchArchiveOperation)initWithFetchResult:(id)a3
{
  id v4;
  HMDBackingStoreFetchArchiveOperation *v5;
  void *v6;
  id fetchResult;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDBackingStoreFetchArchiveOperation;
  v5 = -[HMDBackingStoreOperation init](&v9, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    fetchResult = v5->_fetchResult;
    v5->_fetchResult = v6;

  }
  return v5;
}

- (id)mainReturningError
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  HMDBackingStoreFetchArchiveOperation *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v14;
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HMDBackingStoreOperation store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  v16 = 0;
  v5 = objc_msgSend(v4, "_selectArchiveWithIdentifier:archive:controllerUserName:error:", CFSTR("homedata"), &v18, &v17, &v16);
  v6 = v18;
  v7 = v17;
  v8 = v16;

  if ((v5 & 1) == 0 && !v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not select archive", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[HMDBackingStoreFetchArchiveOperation fetchResult](self, "fetchResult");
  v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id, id))v13)[2](v13, v6, v7, v8);

  v14 = v8;
  return v14;
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (void)setFetchResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 288, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 288);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_fetchResult, 0);
}

@end
