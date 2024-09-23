@implementation HMAccessory(TestingMatterExtensions)

- (id)hdm_createDeviceWithController:()TestingMatterExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "matterNodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDDB678];
    objc_msgSend(a1, "matterNodeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceWithNodeID:controller:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
