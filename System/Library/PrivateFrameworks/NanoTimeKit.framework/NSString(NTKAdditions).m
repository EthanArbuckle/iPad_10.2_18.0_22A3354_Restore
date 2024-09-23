@implementation NSString(NTKAdditions)

- (id)ntk_extractFileName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "pathComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
