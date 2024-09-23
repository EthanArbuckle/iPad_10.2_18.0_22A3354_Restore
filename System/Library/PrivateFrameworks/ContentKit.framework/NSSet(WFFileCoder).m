@implementation NSSet(WFFileCoder)

+ (id)wf_classSetFromArray:()WFFileCoder
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithArray:", v4);

  return v5;
}

@end
