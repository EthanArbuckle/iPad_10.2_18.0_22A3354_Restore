@implementation UIFont(CSAdditions_Private)

- (id)cs_cachedVariantWeight
{
  return objc_getAssociatedObject(a1, &CSCachedVariantWeightAssociationKey);
}

- (void)cs_setCachedVariantWeight:()CSAdditions_Private
{
  objc_setAssociatedObject(a1, &CSCachedVariantWeightAssociationKey, a3, (void *)1);
}

@end
