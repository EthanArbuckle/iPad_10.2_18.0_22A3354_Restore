@implementation HMDAccessoryDiagnosticsSessionInternal

- (HMDAccessoryDiagnosticsSessionInternal)initWithAccessory:(id)a3
{
  id v4;
  HMDAccessoryDiagnosticsSessionInternal *v5;
  HMDAccessoryDiagnosticsSessionInternal *v6;
  uint64_t v7;
  OS_dispatch_queue *workQueue;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDAccessoryDiagnosticsSessionInternal;
  v5 = -[HMDAccessoryDiagnosticsSessionInternal init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    objc_msgSend(v4, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

    v6->_maxBytes = 5242880;
    v6->_bytesWritten = 0;
  }

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDAccessoryDiagnosticsSessionInternal filePath](self, "filePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("filePath"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)shutDown
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setUpWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  v10 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v12, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v13);
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDAccessoryDiagnosticsSessionInternal accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDAccessory)accessory
{
  return (HMDAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (unint64_t)maxBytes
{
  return self->_maxBytes;
}

- (void)setMaxBytes:(unint64_t)a3
{
  self->_maxBytes = a3;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (void)setBytesWritten:(unint64_t)a3
{
  self->_bytesWritten = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_42293 != -1)
    dispatch_once(&logCategory__hmf_once_t5_42293, &__block_literal_global_123);
  return (id)logCategory__hmf_once_v6_42294;
}

void __53__HMDAccessoryDiagnosticsSessionInternal_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_42294;
  logCategory__hmf_once_v6_42294 = v0;

}

@end
