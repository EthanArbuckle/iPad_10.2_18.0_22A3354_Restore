@implementation AXSetupGlue

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

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_230, &__block_literal_global_236, &__block_literal_global_238);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXSetupGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forFramework:", &__block_literal_global_294, CFSTR("WiFiKitUI"));

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_302, CFSTR("VoiceTriggerUI"));

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHandler:forFramework:", &__block_literal_global_308, CFSTR("BiometricKitUI"));

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addHandler:forFramework:", &__block_literal_global_314, CFSTR("PassKit"));

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addHandler:forFramework:", &__block_literal_global_320, CFSTR("PassKitUI"));

    UIAccessibilityIsVoiceOverRunning();
  }
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLanguageController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyLocaleController"), CFSTR("tableView: didSelectRowAtIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("editableTextField"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BuddyAppleIDTableHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SetupChoiceController"), CFSTR("tableView: cellForRowAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BuddyTableViewController"), CFSTR("_containerView"), "UIView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BuddyTableViewController"), CFSTR("_tableView"), "UITableView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("BuddyAppleIDTableHeaderView"), CFSTR("_textLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("BuddyLanguageController"), CFSTR("UIViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PSListController"), CFSTR("UIViewController"));

  return 1;
}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Setup Accessibility"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SetupBundle"));

  return AXPerformValidationChecks();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyUIViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyUITableViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SetupControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyNavigationFlowControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIBuddyApplicationAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyLanguageControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyLocaleControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyTableViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyUIImageViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyFinishedControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SetupChoiceControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyAppleIDTableHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyUINavigationBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyUILabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CDPRemoteSecretEntryViewControllerAccessibility__Setup__CoreCDPUI"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BFFProximityVisualPairingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyPosedDeviceSelectionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyProximitySetupControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyAppleIDServiceViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddySceneDelegateAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyExpressSetupFeatureCardCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyExpressSetupFeatureCardPrimaryCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyAccessibilityUtilitiesAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("LabeledSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BuddyPosedDeviceSelectionItemViewAccessibility"), 1);

}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_6()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.framework.WiFiKitUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_8()
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

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_9()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_10()
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

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_11()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_12()
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

uint64_t __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_13()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __44__AXSetupGlue_accessibilityInitializeBundle__block_invoke_14()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.PassKitUI"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

  objc_msgSend(MEMORY[0x24BEBADE8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsLoadAccessibilityInformation");

}

@end
