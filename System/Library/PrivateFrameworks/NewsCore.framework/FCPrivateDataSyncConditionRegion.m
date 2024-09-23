@implementation FCPrivateDataSyncConditionRegion

- (BOOL)isSatisfied
{
  return +[FCGeoUtilities isRunningInSupportedRegion](FCGeoUtilities, "isRunningInSupportedRegion");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[FCGeoUtilities currentRegion](FCGeoUtilities, "currentRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%p condition=Region, region=%@>"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
