@implementation ChatAssistantUIGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_193, 0, &__block_literal_global_199);

    v3 = objc_msgSend(objc_allocWithZone((Class)ChatAssistantUIGlue), "init");
    v4 = (void *)_Failover;
    _Failover = v3;

  }
}

uint64_t __52__ChatAssistantUIGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("CKMessageSnippetContentView"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKMessageSnippetContentView"), CFSTR("_toLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKMessageSnippetContentView"), CFSTR("_balloonImageView"), "CKTextBalloonView");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageSnippetContentView"), CFSTR("setBalloonType:"), "v", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTextBalloonView"), CFSTR("attributedText"), "@", 0);

  return 1;
}

uint64_t __52__ChatAssistantUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Assistant Chat AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Assistant Chat"));

  return AXPerformValidationChecks();
}

uint64_t __52__ChatAssistantUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageSnippetContentViewAccessibility"), 1);
}

@end
