@implementation EDMigrateServerMetadataFromPListUpgradeStep

+ (int)runWithConnection:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D30FEAD8((uint64_t)v3);

  return 0;
}

- (EDMigrateServerMetadataFromPListUpgradeStep)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDMigrateServerMetadataFromPListUpgradeStep;
  return -[EDMigrateServerMetadataFromPListUpgradeStep init](&v3, sel_init);
}

@end
