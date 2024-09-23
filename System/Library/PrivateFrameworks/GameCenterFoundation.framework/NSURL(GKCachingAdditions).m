@implementation NSURL(GKCachingAdditions)

- (id)cacheKeyRepresentation
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cacheKeyRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
