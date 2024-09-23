@implementation AXProcessIsSetup

void __AXProcessIsSetup_block_invoke()
{
  void *v0;
  id v1;

  AXApplicationGetMainBundleIdentifier();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[AXUtilitiesCommonStringRuntimeOverrides setupProcessName](AXUtilitiesCommonStringRuntimeOverrides, "setupProcessName");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  AXProcessIsSetup_AXIsSetupProcess = objc_msgSend(v1, "isEqualToString:", v0);

}

@end
