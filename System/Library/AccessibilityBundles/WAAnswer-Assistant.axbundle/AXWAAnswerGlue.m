@implementation AXWAAnswerGlue

+ (id)accessibilityBundles
{
  return 0;
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1)
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global);
}

void __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global_177, &__block_literal_global_202, 0, &__block_literal_global_208);

}

uint64_t __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAAnswerSnippet"), CFSTR("answers"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAAnswerObject"), CFSTR("title"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAAnswerObject"), CFSTR("lines"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAAnswerObjectLine"), CFSTR("text"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("WADetailedSnippetViewController"), CFSTR("_answerViews"), "NSMutableArray");
  objc_msgSend(v2, "validateClass:", CFSTR("WATextHeaderView"));
  objc_msgSend(v2, "validateClass:", CFSTR("WAImageView"));

  return 1;
}

uint64_t __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Siri Wolfram Alpha AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("Siri Wolfram Alpha"));

  return AXPerformValidationChecks();
}

void __47__AXWAAnswerGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WADetailedSnippetViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WAAttributionViewAccessibility"), 1);

}

@end
