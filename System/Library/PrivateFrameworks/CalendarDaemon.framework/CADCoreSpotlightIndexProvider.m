@implementation CADCoreSpotlightIndexProvider

- (id)newSpotlightIndexForBundleID:(id)a3
{
  id v3;
  CADCoreSpotlightIndex *v4;

  v3 = a3;
  v4 = -[CADCoreSpotlightIndex initWithBundleID:]([CADCoreSpotlightIndex alloc], "initWithBundleID:", v3);

  return v4;
}

@end
