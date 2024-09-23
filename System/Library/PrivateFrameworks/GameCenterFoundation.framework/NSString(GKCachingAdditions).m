@implementation NSString(GKCachingAdditions)

- (id)cacheKeyRepresentation
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 2, 0, objc_msgSend(a1, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR("_"), 2, 0, objc_msgSend(a1, "length"));
  return v2;
}

@end
