@implementation __HMDHomeAdministratorRemoteReceiver

- (void)registerForMessage:(id)a3 policies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)__HMDHomeAdministratorRemoteReceiver;
  v6 = a4;
  v7 = a3;
  -[__HMDHomeAdministratorReceiver registerForMessage:policies:](&v15, sel_registerForMessage_policies_, v7, v6);
  v8 = (void *)objc_msgSend(v6, "mutableCopy", v15.receiver, v15.super_class);

  objc_msgSend(v8, "indexesOfObjectsPassingTest:", &__block_literal_global_154);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v8, "removeObjectsAtIndexes:", v9);
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRoles:", 4);
  v11 = (void *)objc_msgSend(v10, "copy");
  v12 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_157_162037);
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v8, "addObject:", v11);
  else
    objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v12, v11);
  -[__HMDHomeAdministratorReceiver handler](self, "handler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerForMessage:receiver:policies:selector:", v7, self, v8, sel___handleRemoteMessage_);

}

- (void)__handleRemoteMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __HMDHomeAdministratorRemoteReceiver *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[__HMDHomeAdministratorReceiver receiver](self, "receiver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Locally dispatching remote configuration message: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    -[__HMDHomeAdministratorReceiver handler](v7, "handler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchMessage:", v4);

  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_162040 != -1)
    dispatch_once(&logCategory__hmf_once_t19_162040, &__block_literal_global_160_162041);
  return (id)logCategory__hmf_once_v20_162042;
}

@end
