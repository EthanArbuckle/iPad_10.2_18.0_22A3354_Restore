@implementation HMDBackingStoreDispatchModelChange

- (HMDBackingStoreDispatchModelChange)initWithModelChange:(id)a3
{
  id v5;
  HMDBackingStoreDispatchModelChange *v6;
  HMDBackingStoreDispatchModelChange *v7;
  HMDBackingStoreDispatchModelChange *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDBackingStoreDispatchModelChange;
  v6 = -[HMDBackingStoreDispatchModelChange init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelChange, a3);
    v8 = v7;
  }

  return v7;
}

- (void)main
{
  void *v3;
  HMDBackingStoreDispatchModelChange *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x227676638](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBackingStoreDispatchModelChange modelChange](v4, "modelChange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@MODEL CHANGE: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
}

- (HMDBackingStoreModelObject)modelChange
{
  return self->_modelChange;
}

- (void)setModelChange:(id)a3
{
  objc_storeStrong((id *)&self->_modelChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelChange, 0);
}

@end
