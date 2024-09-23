@implementation AXMobileSafariGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_182, 0, &__block_literal_global_188);

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addHandler:forFramework:", &__block_literal_global_200, CFSTR("AVKit"));

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addHandler:forFramework:", &__block_literal_global_209, CFSTR("StoreKitUI"));

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_215, CFSTR("SearchUI"));

    v6 = objc_msgSend(objc_allocWithZone((Class)AXMobileSafariGlue), "init");
    v7 = (void *)_Failover;
    _Failover = v6;

  }
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v4;

  v4 = a2;
  v2 = v4;
  AXPerformBlockOnMainThreadAfterDelay();

  return 1;
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityTextMarkerRangeForSelection"), "@", 0);
}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Safari AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("MobileSafari"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileSafariUIViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SafariUIApplicationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SafariUIDimmingViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SafariUIPageControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWebBrowserFindOnPageHighlighterAccessibility"), 1);

}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_6()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AVKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_8()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.ios.StoreKitUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

void __51__AXMobileSafariGlue_accessibilityInitializeBundle__block_invoke_9()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SearchUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

@end
