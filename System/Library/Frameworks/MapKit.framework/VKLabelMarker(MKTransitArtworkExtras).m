@implementation VKLabelMarker(MKTransitArtworkExtras)

- (uint64_t)artworkSourceType
{
  return 1;
}

- (uint64_t)artworkUseType
{
  return 0;
}

- (id)shieldDataSource
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "shields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)iconDataSource
{
  return 0;
}

- (uint64_t)iconFallbackShieldDataSource
{
  return 0;
}

- (uint64_t)hasRoutingIncidentBadge
{
  return 0;
}

- (uint64_t)textDataSource
{
  return 0;
}

@end
