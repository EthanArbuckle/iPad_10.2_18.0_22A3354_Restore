@implementation HMHome(TestingMatterExtensions)

- (id)hdm_createMatterController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDDB680];
  objc_msgSend(a1, "matterControllerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "matterControllerXPCConnectBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sharedControllerWithID:xpcConnectBlock:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
