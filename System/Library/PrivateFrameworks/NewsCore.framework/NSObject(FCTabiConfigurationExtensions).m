@implementation NSObject(FCTabiConfigurationExtensions)

- (id)indentedDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n\t"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
