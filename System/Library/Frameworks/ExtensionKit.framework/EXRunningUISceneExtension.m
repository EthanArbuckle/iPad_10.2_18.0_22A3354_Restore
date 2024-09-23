@implementation EXRunningUISceneExtension

void __55___EXRunningUISceneExtension_startWithArguments_count___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("XPCService"));
  objc_msgSend(v3, "setService:", CFSTR("MainService"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "setDelegate:", WeakRetained);

}

void __112___EXRunningUISceneExtension_UIApplicationDelegate__application_configurationForConnectingSceneSession_options___block_invoke()
{
  void *v0;
  uint64_t v1;
  objc_class *v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x24BEBD8D8];
  v1 = objc_opt_class();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithValue:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_registerSceneComponentClass:withKey:predicate:", v1, v4, v3);

}

@end
