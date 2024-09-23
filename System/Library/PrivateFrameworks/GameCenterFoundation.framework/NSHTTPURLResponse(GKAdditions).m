@implementation NSHTTPURLResponse(GKAdditions)

- (id)getSAPSignature
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allHeaderFields");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("x-gk-sap-signature"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
