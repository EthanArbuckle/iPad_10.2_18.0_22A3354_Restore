@implementation AXBaseBoardUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  __CFString *v6;
  __CFString *v7;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke_2;
    v5[3] = &unk_2501900C0;
    v6 = CFSTR("BaseBoardUI AX Bundle");
    v7 = CFSTR("BaseBoardUI");
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, v5, 0, &__block_literal_global_181);

    v3 = objc_msgSend(objc_allocWithZone((Class)AXBaseBoardUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke()
{
  return 1;
}

uint64_t __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setValidationTargetName:", v3);
  objc_msgSend(v4, "setOverrideProcessName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __50__AXBaseBoardUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BSUIRelativeDateLabelAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BSUIEmojiLabelViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BSUIVibrancyEffectViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("BSUIOrientationTransformWrapperViewAccessibility"), 1);

}

@end
