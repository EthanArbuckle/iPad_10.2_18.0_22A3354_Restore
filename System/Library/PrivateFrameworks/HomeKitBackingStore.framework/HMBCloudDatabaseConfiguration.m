@implementation HMBCloudDatabaseConfiguration

- (HMBCloudDatabaseConfiguration)initWithContainerID:(id)a3
{
  id v4;
  void *v5;
  HMBCloudDatabaseConfiguration *v6;
  uint64_t v7;
  CKContainerID *containerID;
  NSString *sourceApplicationBundleIdentifier;
  uint64_t v10;
  OS_dispatch_queue *operationQueue;
  CKOperationConfiguration *v12;
  CKOperationConfiguration *defaultOperationConfiguration;
  HMBCloudDatabaseConfiguration *v15;
  SEL v16;
  objc_super v17;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)HMBCloudDatabaseConfiguration;
    v6 = -[HMBCloudDatabaseConfiguration init](&v17, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      containerID = v6->_containerID;
      v6->_containerID = (CKContainerID *)v7;

      sourceApplicationBundleIdentifier = v6->_sourceApplicationBundleIdentifier;
      v6->_sourceApplicationBundleIdentifier = (NSString *)CFSTR("com.apple.willowd");

      v6->_subscriptionPushRegistrationAction = 0;
      dispatch_get_global_queue(21, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      operationQueue = v6->_operationQueue;
      v6->_operationQueue = (OS_dispatch_queue *)v10;

      v12 = (CKOperationConfiguration *)objc_alloc_init(MEMORY[0x1E0C94F80]);
      defaultOperationConfiguration = v6->_defaultOperationConfiguration;
      v6->_defaultOperationConfiguration = v12;

      -[CKOperationConfiguration setQualityOfService:](v6->_defaultOperationConfiguration, "setQualityOfService:", 17);
    }

    return v6;
  }
  else
  {
    v15 = (HMBCloudDatabaseConfiguration *)_HMFPreconditionFailure();
    return (HMBCloudDatabaseConfiguration *)-[HMBCloudDatabaseConfiguration attributeDescriptions](v15, v16);
  }
}

- (id)attributeDescriptions
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudDatabaseConfiguration containerID](self, "containerID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Container ID"), v22);
  v23[0] = v21;
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudDatabaseConfiguration sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Bundle ID"), v20);
  v23[1] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudDatabaseConfiguration isManateeContainer](self, "isManateeContainer");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Manatee Container"), v7);
  v23[2] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudDatabaseConfiguration defaultOperationConfiguration](self, "defaultOperationConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Default Operation Configuration"), v10);
  v23[3] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMBCloudDatabaseConfiguration subscriptionPushRegistrationAction](self, "subscriptionPushRegistrationAction"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Subscription Push Registration Action"), v13);
  v23[4] = v14;
  v15 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBCloudDatabaseConfiguration operationQueue](self, "operationQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithName:value:", CFSTR("Operations Queue"), v16);
  v23[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableCloudDatabaseConfiguration *v4;
  void *v5;
  HMBMutableCloudDatabaseConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = [HMBMutableCloudDatabaseConfiguration alloc];
  -[HMBCloudDatabaseConfiguration containerID](self, "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMBCloudDatabaseConfiguration initWithContainerID:](v4, "initWithContainerID:", v5);

  -[HMBCloudDatabaseConfiguration sourceApplicationBundleIdentifier](self, "sourceApplicationBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabaseConfiguration setSourceApplicationBundleIdentifier:](v6, "setSourceApplicationBundleIdentifier:", v7);

  -[HMBCloudDatabaseConfiguration setManateeContainer:](v6, "setManateeContainer:", -[HMBCloudDatabaseConfiguration isManateeContainer](self, "isManateeContainer"));
  -[HMBCloudDatabaseConfiguration defaultOperationConfiguration](self, "defaultOperationConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabaseConfiguration setDefaultOperationConfiguration:](v6, "setDefaultOperationConfiguration:", v8);

  -[HMBCloudDatabaseConfiguration setSubscriptionPushRegistrationAction:](v6, "setSubscriptionPushRegistrationAction:", -[HMBCloudDatabaseConfiguration subscriptionPushRegistrationAction](self, "subscriptionPushRegistrationAction"));
  -[HMBCloudDatabaseConfiguration operationQueue](self, "operationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBCloudDatabaseConfiguration setOperationQueue:](v6, "setOperationQueue:", v9);

  return v6;
}

- (CKContainerID)containerID
{
  return (CKContainerID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)sourceApplicationBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)isManateeContainer
{
  return self->_manateeContainer;
}

- (void)setManateeContainer:(BOOL)a3
{
  self->_manateeContainer = a3;
}

- (CKOperationConfiguration)defaultOperationConfiguration
{
  return (CKOperationConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDefaultOperationConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)subscriptionPushRegistrationAction
{
  return self->_subscriptionPushRegistrationAction;
}

- (void)setSubscriptionPushRegistrationAction:(int64_t)a3
{
  self->_subscriptionPushRegistrationAction = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_defaultOperationConfiguration, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
}

@end
