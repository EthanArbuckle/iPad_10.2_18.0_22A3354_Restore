@implementation NSURLResponse(AppleAccount)

- (BOOL)aa_isJSON
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "MIMEType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "compare:options:", CFSTR("application/json"), 0) == 0;

  return v2;
}

- (BOOL)aa_isPlist
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "MIMEType");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = !objc_msgSend(v1, "compare:options:", CFSTR("application/x-apple-plist"), 0)
    || !objc_msgSend(v1, "compare:options:", CFSTR("application/x-plist"), 0)
    || objc_msgSend(v1, "compare:options:", CFSTR("application/xml"), 0) == 0;

  return v2;
}

@end
