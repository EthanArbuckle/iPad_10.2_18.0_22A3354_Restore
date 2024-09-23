@implementation BLServiceProxyConnectionFactory

+ (id)connectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x24BDD1988];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:options:", v6, a4);

  return v7;
}

@end
