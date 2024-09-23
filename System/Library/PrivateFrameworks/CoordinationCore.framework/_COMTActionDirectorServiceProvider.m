@implementation _COMTActionDirectorServiceProvider

- (id)clusterRoleMonitorWithCluster:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE19E20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCluster:", v4);

  return v5;
}

- (id)messageChannelWithTopic:(id)a3 cluster:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE19E40];
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithTopic:cluster:", v7, v6);

  return v8;
}

@end
