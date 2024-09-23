@implementation NSSet(HMB)

- (id)hmbDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(CFSTR("{"), "mutableCopy");
  objc_msgSend(a1, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v4);

  objc_msgSend(v2, "appendString:", CFSTR("}"));
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

@end
