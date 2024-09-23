@implementation HMBLocalDatabaseConfiguration

- (HMBLocalDatabaseConfiguration)init
{
  HMBLocalDatabaseConfiguration *v2;
  HMBModelContainer *v3;
  HMBModelContainer *modelContainer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMBLocalDatabaseConfiguration;
  v2 = -[HMBLocalDatabaseConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HMBModelContainer);
    modelContainer = v2->_modelContainer;
    v2->_modelContainer = v3;

  }
  return v2;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMBMutableLocalDatabaseConfiguration *v4;
  void *v5;

  v4 = -[HMBLocalDatabaseConfiguration init](+[HMBMutableLocalDatabaseConfiguration allocWithZone:](HMBMutableLocalDatabaseConfiguration, "allocWithZone:", a3), "init");
  -[HMBLocalDatabaseConfiguration modelContainer](self, "modelContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalDatabaseConfiguration setModelContainer:](v4, "setModelContainer:", v5);

  return v4;
}

- (HMBModelContainer)modelContainer
{
  return self->_modelContainer;
}

- (void)setModelContainer:(id)a3
{
  objc_storeStrong((id *)&self->_modelContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelContainer, 0);
}

@end
