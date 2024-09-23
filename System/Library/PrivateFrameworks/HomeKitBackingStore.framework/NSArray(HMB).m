@implementation NSArray(HMB)

- (id)hmbDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(CFSTR("["), "mutableCopy");
  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

  objc_msgSend(v2, "appendString:", CFSTR("]"));
  v4 = (void *)objc_msgSend(v2, "copy");

  return v4;
}

@end
