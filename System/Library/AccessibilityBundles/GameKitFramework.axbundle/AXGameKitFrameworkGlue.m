@implementation AXGameKitFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_0);
}

void __55__AXGameKitFrameworkGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_205, 0, &__block_literal_global_211);

}

uint64_t __55__AXGameKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("GKAchievementViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("GKLocalPlayer"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("GKLocalPlayer"), CFSTR("localPlayer"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKPlayer"), CFSTR("internal"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKPlayerInternal"), CFSTR("alias"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKScore"), CFSTR("internal"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKScoreInternal"), CFSTR("formattedValue"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKScoreInternal"), CFSTR("rank"), "I", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GKScoreInternal"), CFSTR("value"), "q", 0);

  return 1;
}

uint64_t __55__AXGameKitFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("GameKitFramework"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("GameKitFramework Accessibility Bundle"));

  return AXPerformValidationChecks();
}

@end
