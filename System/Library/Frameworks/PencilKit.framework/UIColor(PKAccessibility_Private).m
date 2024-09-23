@implementation UIColor(PKAccessibility_Private)

- (id)_pkaxCachedApproximateColorDescription
{
  return objc_getAssociatedObject(a1, &cachedColorDescriptionKey);
}

- (void)_pkaxSetCachedApproximateColorDescription:()PKAccessibility_Private
{
  objc_setAssociatedObject(a1, &cachedColorDescriptionKey, a3, (void *)3);
}

@end
