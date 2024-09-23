@implementation AXPreferencesGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_212, 0, &__block_literal_global_218);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXPreferencesGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_226, CFSTR("CoreRecognition"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_235, CFSTR("PassKit"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHandler:forFramework:", &__block_literal_global_241, CFSTR("VoiceTriggerUI"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addHandler:forFramework:", &__block_literal_global_247, CFSTR("SetupAssistantUI"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addHandler:forBundleName:", &__block_literal_global_253, CFSTR("StorageSettings"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addHandler:forFramework:", &__block_literal_global_259, CFSTR("BiometricKitUI"));

  }
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("FailureBarView"));
  objc_msgSend(v2, "validateClass:", CFSTR("PINView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("setPINPolicyString: visible:"), "v", "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FailureBarView"), CFSTR("setFailureCount:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSBadgedTableCell"), CFSTR("badgeWithInteger:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSSpecifier"), CFSTR("values"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PINView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("FailureBarView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("DevicePINPane"), CFSTR("_pinView"), "UIView<PINEntryView>");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINController"), CFSTR("_updateErrorTextAndFailureCount:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PSTableCell"), CFSTR("PreferencesTableCell"));

  return 1;
}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Preferences AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Preferences"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreferencesSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreferencesUITextFieldAccessibility"), 1);

}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_5()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CoreRecognition"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_6()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_7()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PassKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_8()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_9()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.VoiceTriggerUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_10()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_11()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.SetupAssistantUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_12()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_13()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.settings.storage"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_14()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __50__AXPreferencesGlue_accessibilityInitializeBundle__block_invoke_15()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.BiometricKitUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

@end
