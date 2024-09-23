@implementation NSURLSessionConfiguration(Network)

- (id)proxyConfigurations
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_proxyConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "_proxyConfigurations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

@end
