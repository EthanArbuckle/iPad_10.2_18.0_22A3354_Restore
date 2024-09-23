@implementation NSString(IKJSRWIDependencyCamelCase)

- (id)ikrwi_camelCase
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "substringToIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uppercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "substringFromIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
