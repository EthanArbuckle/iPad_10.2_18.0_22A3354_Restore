@implementation AVTStickerConfiguration(AVTCacheableResourceScope)

- (id)cacheableResourceAssociatedIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("_%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)cacheableResourceAssociatedCost
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "size");
  return (unint64_t)(v3 * v4);
}

@end
