@implementation HMDFeaturesDataSource

- (BOOL)isHH2AutoMigrationEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)isHH2MigrationDryRunEnabled
{
  return _os_feature_enabled_impl();
}

+ (id)defaultDataSource
{
  if (defaultDataSource_onceToken != -1)
    dispatch_once(&defaultDataSource_onceToken, &__block_literal_global_161006);
  return (id)defaultDataSource_dataSource;
}

void __42__HMDFeaturesDataSource_defaultDataSource__block_invoke()
{
  HMDFeaturesDataSource *v0;
  void *v1;

  v0 = objc_alloc_init(HMDFeaturesDataSource);
  v1 = (void *)defaultDataSource_dataSource;
  defaultDataSource_dataSource = (uint64_t)v0;

}

@end
