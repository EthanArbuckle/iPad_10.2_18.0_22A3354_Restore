@implementation AXSB_SBSceneManagerSafeCategory

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSceneManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBSceneManager"), CFSTR("SBUserInterfaceStyleObserver"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBUserInterfaceStyleObserver"), CFSTR("userInterfaceStyleProvider:didUpdateStyle:preferredAnimationSettings:completion:"));

}

- (void)userInterfaceStyleProvider:(id)a3 didUpdateStyle:(int64_t)a4 preferredAnimationSettings:(id)a5 completion:(id)a6
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)AXSB_SBSceneManagerSafeCategory;
  -[AXSB_SBSceneManagerSafeCategory userInterfaceStyleProvider:didUpdateStyle:preferredAnimationSettings:completion:](&v11, sel_userInterfaceStyleProvider_didUpdateStyle_preferredAnimationSettings_completion_, a3, a4, a5, a6);
  +[AXSpringBoardServerHelper sharedServerHelper](AXSpringBoardServerHelper, "sharedServerHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_isDarkModeActive"))
    v7 = 2;
  else
    v7 = 1;

  +[_AXSpringBoardServerInstance springBoardServerInstance](_AXSpringBoardServerInstance, "springBoardServerInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x24BE003C0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "springBoardActionOccurred:withPayload:", 13, v10);

}

@end
