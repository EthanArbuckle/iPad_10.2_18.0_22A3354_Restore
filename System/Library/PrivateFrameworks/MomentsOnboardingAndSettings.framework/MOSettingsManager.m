@implementation MOSettingsManager

- (MOSettingsManagerDelegate)delegate
{
  void *v2;
  void *v3;

  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settingsManagerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MOSettingsManagerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSettingsManagerDelegate:", v3);

}

- (MOSettingsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MOSettingsManager;
  return -[MOSettingsManager init](&v3, sel_init);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__MOSettingsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, block);
  return (id)sharedInstance_shared_1;
}

void __35__MOSettingsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_shared_1;
  sharedInstance_shared_1 = (uint64_t)v1;

}

- (BOOL)getStateForSetting:(unint64_t)a3
{
  void *v4;

  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "getStateForSetting:", a3);

  return a3;
}

- (void)setState:(BOOL)a3 forSetting:(unint64_t)a4
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:forSetting:", v5, a4);

}

- (id)getSettingsControllers
{
  return &unk_251344560;
}

@end
