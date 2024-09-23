@implementation AXQuicktimePluginGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_195, 0, &__block_literal_global_201);

  if (!_Failover)
  {
    v3 = objc_msgSend(objc_allocWithZone((Class)AXQuicktimePluginGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __54__AXQuicktimePluginGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("FigPluginView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FigPluginView"), CFSTR("setAllowPlayback:"), "v", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FigPluginView"), CFSTR("webPlugInStart"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("FigPluginView"), CFSTR("_playButton"), "UIButton");

  return 1;
}

uint64_t __54__AXQuicktimePluginGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("QuickTime Plugin AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("QuickTimePlugin"));

  return AXPerformValidationChecks();
}

uint64_t __54__AXQuicktimePluginGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("FigPluginViewAccessibility"), 1);
}

@end
