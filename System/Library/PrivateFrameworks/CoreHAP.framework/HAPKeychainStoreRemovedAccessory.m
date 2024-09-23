@implementation HAPKeychainStoreRemovedAccessory

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HAPKeychainStoreRemovedAccessory accessoryName](self, "accessoryName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainStoreRemovedAccessory creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAPKeychainStoreRemovedAccessory removeError](self, "removeError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("accessoryName: %@, creationDate: %@, error: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (HAPKeychainStoreRemovedAccessory)initWithName:(id)a3 creationDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HAPKeychainStoreRemovedAccessory *v10;
  id *p_isa;
  HAPKeychainStoreRemovedAccessory *v12;
  HAPKeychainStoreRemovedAccessory *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "%{public}@The name is required";
LABEL_10:
      _os_log_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, v17, buf, 0xCu);

    }
LABEL_11:

    objc_autoreleasePoolPop(v14);
    v13 = 0;
    goto LABEL_12;
  }
  if (!v8)
  {
    v14 = (void *)MEMORY[0x1D17B7244]();
    v12 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v16;
      v17 = "%{public}@The creation date is required";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)HAPKeychainStoreRemovedAccessory;
  v10 = -[HAPKeychainStoreRemovedAccessory init](&v19, sel_init);
  p_isa = (id *)&v10->super.super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessoryName, a3);
    objc_storeStrong(p_isa + 2, a4);
  }
  v12 = p_isa;
  v13 = v12;
LABEL_12:

  return v13;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSError)removeError
{
  return self->_removeError;
}

- (void)setRemoveError:(id)a3
{
  objc_storeStrong((id *)&self->_removeError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeError, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3 != -1)
    dispatch_once(&logCategory__hmf_once_t3, &__block_literal_global_4859);
  return (id)logCategory__hmf_once_v4;
}

void __47__HAPKeychainStoreRemovedAccessory_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4;
  logCategory__hmf_once_v4 = v0;

}

@end
