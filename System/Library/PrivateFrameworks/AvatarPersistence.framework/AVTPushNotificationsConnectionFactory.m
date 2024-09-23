@implementation AVTPushNotificationsConnectionFactory

- (id)connectionWithEnvironmentName:(id)a3 namedDelegatePort:(id)a4 queue:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x24BE08738];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithEnvironmentName:namedDelegatePort:queue:", v10, v9, v8);

  return v11;
}

@end
