@implementation ATXDigitalHealthBlacklistGuardedData

- (ATXDigitalHealthBlacklistGuardedData)init
{
  ATXDigitalHealthBlacklistGuardedData *v2;
  uint64_t v3;
  NSSet *blacklistedBundleIds;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXDigitalHealthBlacklistGuardedData;
  v2 = -[ATXDigitalHealthBlacklistGuardedData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    blacklistedBundleIds = v2->_blacklistedBundleIds;
    v2->_blacklistedBundleIds = (NSSet *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklistedBundleIds, 0);
}

@end
