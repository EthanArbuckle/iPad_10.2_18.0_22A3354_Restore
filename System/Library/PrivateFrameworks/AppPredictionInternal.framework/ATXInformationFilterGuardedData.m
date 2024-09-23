@implementation ATXInformationFilterGuardedData

- (ATXInformationFilterGuardedData)init
{
  ATXInformationFilterGuardedData *v2;
  uint64_t v3;
  NSMutableDictionary *dismissRecordsCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXInformationFilterGuardedData;
  v2 = -[ATXInformationFilterGuardedData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    dismissRecordsCache = v2->dismissRecordsCache;
    v2->dismissRecordsCache = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->dismissRecordsCache, 0);
}

@end
