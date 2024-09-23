@implementation AXRemoteUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_189, 0, &__block_literal_global_193);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXRemoteUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __47__AXRemoteUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("RemoteUITableViewCell"), CFSTR("_remoteUIAccessoryType"), "q");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RemoteUITableViewCell"), CFSTR("setRemoteUIAccessoryView:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RemoteUITableViewCell"), CFSTR("_accessoriesChanged"), "v", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("RUITableViewRow"));

  return 1;
}

uint64_t __47__AXRemoteUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("RemoteUIFramework"));
  objc_msgSend(v2, "setDebugBuild:", 0);
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("RemoteUIFramework"));

  return AXPerformValidationChecks();
}

void __47__AXRemoteUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("RemoteUITableViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("RUITableViewRowAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("RUIPageAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("RUIWebContainerViewAccessibility"), 1);

}

@end
