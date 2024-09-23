@implementation BCSNetworkInfo

+ (BOOL)isExpensiveNetwork
{
  id v2;
  void *v3;
  char v4;

  v2 = objc_alloc_init(MEMORY[0x24BDE07E8]);
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isExpensive");

  return v4;
}

@end
