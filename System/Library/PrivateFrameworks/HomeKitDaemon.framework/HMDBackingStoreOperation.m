@implementation HMDBackingStoreOperation

- (HMDBackingStoreOperation)initWithResultBlock:(id)a3
{
  id v4;
  HMDBackingStoreOperation *v5;
  void *v6;
  id resultBlock;
  uint64_t v8;
  NSUUID *operationUUID;
  id operationFinishBlock;
  HMDBackingStoreOperation *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDBackingStoreOperation;
  v5 = -[HMDBackingStoreOperation init](&v13, sel_init);
  if (v5)
  {
    v6 = _Block_copy(v4);
    resultBlock = v5->_resultBlock;
    v5->_resultBlock = v6;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v8 = objc_claimAutoreleasedReturnValue();
    operationUUID = v5->_operationUUID;
    v5->_operationUUID = (NSUUID *)v8;

    operationFinishBlock = v5->_operationFinishBlock;
    v5->_operationFinishBlock = &__block_literal_global_178589;

    v11 = v5;
  }

  return v5;
}

- (HMDBackingStoreOperation)init
{
  return -[HMDBackingStoreOperation initWithResultBlock:](self, "initWithResultBlock:", 0);
}

- (id)mainReturningError
{
  return 0;
}

- (void)main
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  id v5;

  -[HMDBackingStoreOperation mainReturningError](self, "mainReturningError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreOperation resultBlock](self, "resultBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HMDBackingStoreOperation resultBlock](self, "resultBlock");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v4)[2](v4, v5);

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreOperation operationUUID](self, "operationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackingStoreOperation operationUUID](self, "operationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)resultBlock
{
  return self->_resultBlock;
}

- (void)setResultBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSUUID)operationUUID
{
  return self->_operationUUID;
}

- (id)operationFinishBlock
{
  return objc_getProperty(self, a2, 264, 1);
}

- (void)setOperationFinishBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 264);
}

- (HMDBackingStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong(&self->_operationFinishBlock, 0);
  objc_storeStrong((id *)&self->_operationUUID, 0);
  objc_storeStrong(&self->_resultBlock, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_178591 != -1)
    dispatch_once(&logCategory__hmf_once_t0_178591, &__block_literal_global_4_178592);
  return (id)logCategory__hmf_once_v1_178593;
}

void __39__HMDBackingStoreOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_178593;
  logCategory__hmf_once_v1_178593 = v0;

}

@end
