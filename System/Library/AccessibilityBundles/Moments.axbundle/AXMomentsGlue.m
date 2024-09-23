@implementation AXMomentsGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_176, 0, &__block_literal_global_182);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXMomentsGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __46__AXMomentsGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __46__AXMomentsGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Moments AX"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Moments"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __46__AXMomentsGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (AXProcessIsMomentsUIService())
  {
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionCollectionViewCellAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ReflectionPromptViewAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MapImageViewAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionCollectionViewHeaderAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionCollectionViewListCellAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionSheetAssetViewAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionSheetMosaicCellAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionSheetInterstitialViewAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionCollectionViewSingleAssetCellAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionInterstitialExpandableListViewCellAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionActivityRouteAssetViewAccessibility"), 1);
    objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MOSuggestionActivityIconAssetViewAccessibility"), 1);
  }

}

@end
