@implementation SBAssistantControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAssistantController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAssistantController"), CFSTR("_dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:"), "v", "q", "@", "@", "@?", 0);
}

- (void)_dismissAssistantViewIfNecessaryWithAnimation:(int64_t)a3 factory:(id)a4 dismissalOptions:(id)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  id v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v22 = a4;
  v8 = a5;
  v9 = a6;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(MEMORY[0x24BE38070], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allProcesses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    v15 = *MEMORY[0x24BDFE418];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v17, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v15);

        if (v19)
        {
          objc_msgSend(v17, "pid");
          AXProcessIsCarPlay();
          AXTentativePidSuspend();
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  v23.receiver = self;
  v23.super_class = (Class)SBAssistantControllerAccessibility;
  -[SBAssistantControllerAccessibility _dismissAssistantViewIfNecessaryWithAnimation:factory:dismissalOptions:completion:](&v23, sel__dismissAssistantViewIfNecessaryWithAnimation_factory_dismissalOptions_completion_, a3, v22, v8, v9);

}

@end
