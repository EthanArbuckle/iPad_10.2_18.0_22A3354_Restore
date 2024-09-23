@implementation HMBMutableLocalDatabaseConfiguration

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBLocalDatabaseConfiguration *v4;
  void *v5;

  v4 = -[HMBLocalDatabaseConfiguration init](+[HMBLocalDatabaseConfiguration allocWithZone:](HMBLocalDatabaseConfiguration, "allocWithZone:", a3), "init");
  -[HMBLocalDatabaseConfiguration modelContainer](self, "modelContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalDatabaseConfiguration setModelContainer:](v4, "setModelContainer:", v5);

  return v4;
}

@end
