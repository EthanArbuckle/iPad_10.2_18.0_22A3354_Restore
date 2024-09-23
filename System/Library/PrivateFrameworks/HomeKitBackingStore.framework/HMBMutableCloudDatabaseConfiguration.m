@implementation HMBMutableCloudDatabaseConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  HMBCloudDatabaseConfiguration *v4;
  void *v5;
  HMBCloudDatabaseConfiguration *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = [HMBCloudDatabaseConfiguration alloc];
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

@end
