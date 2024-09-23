@implementation AXPreferencesFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_241, 0, &__block_literal_global_247);

    objc_msgSend(MEMORY[0x24BE005D8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addHandler:forFramework:", &__block_literal_global_314, CFSTR("Preferences"));

    v4 = objc_msgSend(objc_allocWithZone((Class)AXPreferencesFrameworkGlue), "init");
    v5 = (void *)_Failover;
    _Failover = v4;

  }
}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("PSSpecifier"));
  objc_msgSend(v2, "validateClass:", CFSTR("PSTableCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("PSControlTableCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("PSTextViewTableCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("PSSetupController"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTableCell"), CFSTR("_checked"), "BOOL");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PSTextViewTableCell"), CFSTR("_textView"), "PSTextView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PSControlTableCell"), CFSTR("_control"), "UIControl");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PSListController"), CFSTR("_specifiers"), "NSArray");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PSListController"), CFSTR("_table"), "UITableView");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("PSListController"), CFSTR("_cachesCells"), "BOOL");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSTableCell"), CFSTR("cellEnabled"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSTableCell"), CFSTR("cellTarget"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSListController"), CFSTR("loadSpecifiersFromPlistName: target:"), "@", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSListController"), CFSTR("bundle"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSControlTableCell"), CFSTR("control"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSSpecifier"), CFSTR("values"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSListController"), CFSTR("reloadSpecifierAtIndex: animated:"), "v", "q", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSListController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSListController"), CFSTR("_updateSectionContentInsetWithAnimation:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSTableCell"), CFSTR("initWithStyle: reuseIdentifier: specifier:"), "@", "q", "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSEditableTableCell"), CFSTR("textField"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSEditableTableCell"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_viewDelegate"), "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("PSTableCell"), CFSTR("UITableViewCell"));

  return 1;
}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Preferences Framework Accessibility Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Preferences Framework"));

  return AXPerformValidationChecks();
}

void __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSpecifierAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewAccessibility__Preferences__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewCellAccessibility__Preferences__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSControlTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSliderTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSegmentTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSEditableTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSRootControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSListControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSetupControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSPasscodeFieldAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSegmentableSliderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSUsageSizeHeaderAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSUsageBundleCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSubtitleSwitchTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSTimeRangeCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSDateTimePickerCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSKeychainSyncSecurityCodeControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSFooterHyperlinkViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSBadgedTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DevicePINPaneAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSCapacityBarCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PrefsUILinkLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PINViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FailureBarViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DevicePINKeypadAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AlphanumericPINTextFieldAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSKeyboardNavigationSearchBarAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SUIKSearchResultCollectionViewListCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSReversedSubtitleDisclosureTableCellAccessibility"), 1);

}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_316, CFSTR("Preferences Framework Accessibility Bundle"), 0, 0.25);

}

uint64_t __59__AXPreferencesFrameworkGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreferencesPSTableCellAccessibility"), 1);
}

- (id)_formatTime:(double)a3 showHours:(BOOL *)a4 showSubseconds:(BOOL)a5
{
  return 0;
}

@end
