@implementation _CRSServiceBundleManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42___CRSServiceBundleManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sServiceBundleManager;
}

+ (id)bundleDirectoryName
{
  return CFSTR("CardServices");
}

+ (Class)bundleClass
{
  return (Class)objc_opt_class();
}

- (void)getServiceBundlesWithCompletion:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __60___CRSServiceBundleManager_getServiceBundlesWithCompletion___block_invoke;
  v6[3] = &unk_24DB6FF18;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_CRSServiceBundleManager;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[CRBundleManager getBundlesWithCompletion:](&v5, sel_getBundlesWithCompletion_, v6);

}

@end
