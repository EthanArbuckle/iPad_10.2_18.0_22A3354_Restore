@implementation NSObject(CALExtensions)

- (BOOL)isNull
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == a1;

  return v3;
}

@end
