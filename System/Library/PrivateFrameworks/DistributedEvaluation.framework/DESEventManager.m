@implementation DESEventManager

+ (BOOL)allowEventForBundleID:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (allowEventForBundleID__onceToken != -1)
  {
    dispatch_once(&allowEventForBundleID__onceToken, &__block_literal_global_4);
    if (v4)
      goto LABEL_3;
LABEL_5:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  if (!v3)
    goto LABEL_5;
LABEL_3:
  v5 = objc_msgSend((id)allowEventForBundleID__disalllowedBundles, "containsObject:", v4) ^ 1;
LABEL_6:

  return v5;
}

void __41__DESEventManager_allowEventForBundleID___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[12];

  v4[11] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.apple.dodml.TestPlugin");
  v4[1] = CFSTR("com.apple.dp.PrivateFederatedLearning.DPMLRuntimePluginNonDnU");
  v4[2] = CFSTR("com.apple.dp.PrivateFederatedLearning.DPMLRuntimePlugin");
  v4[3] = CFSTR("com.apple.dp.PrivateFederatedLearning.DPMLRuntimePluginClassB");
  v4[4] = CFSTR("com.apple.aiml.mlpt.PriML.FedStats.Plugin");
  v4[5] = CFSTR("com.apple.aiml.mlpt.PriML.FedStats.PluginClassB");
  v4[6] = CFSTR("com.apple.aiml.mlpt.PriML.FedStats.PluginNonDnU");
  v4[7] = CFSTR("com.apple.MLRuntime.ExtensionXCTestHigh");
  v4[8] = CFSTR("com.apple.MLRuntime.ExtensionXCTestOnDemand");
  v4[9] = CFSTR("com.apple.MLRuntime.ExtensionXCTestRestricted");
  v4[10] = CFSTR("com.apple.MLRuntime.XCTest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowEventForBundleID__disalllowedBundles;
  allowEventForBundleID__disalllowedBundles = v2;

}

@end
