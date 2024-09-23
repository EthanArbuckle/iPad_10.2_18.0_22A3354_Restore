@implementation NSProcessInfo(BaseBoard)

- (id)bs_jobLabel
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("XPC_SERVICE_NAME"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
