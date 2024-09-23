@implementation AXSocialFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  AXSocialFrameworkGlue *v3;
  void *v4;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BE00758], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_196, 0, &__block_literal_global_202);

    v3 = objc_alloc_init(AXSocialFrameworkGlue);
    v4 = (void *)_Failover;
    _Failover = (uint64_t)v3;

  }
}

uint64_t __54__AXSocialFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("SLComposeServiceViewController"));
  objc_msgSend(v2, "validateClass:", CFSTR("SLMicroBlogComposeViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SLComposeServiceViewController"), CFSTR("UIViewController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("SLMicroBlogComposeViewController"), CFSTR("SLComposeServiceViewController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLSheetTextComposeView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SLSheetTextComposeView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

  return 1;
}

uint64_t __54__AXSocialFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("SocialFramework"));
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("Social Framework AX"));

  return 1;
}

void __54__AXSocialFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIButtonAccessibility__Social__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewAccessibility__Social__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextViewAccessibility__Social__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SLMicroBlogComposeViewControllerAccessibility"), 1);

}

@end
