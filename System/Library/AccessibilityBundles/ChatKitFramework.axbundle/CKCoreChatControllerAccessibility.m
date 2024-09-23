@implementation CKCoreChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKCoreChatController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("CKFullScreenBalloonViewControllerDelegate"), CFSTR("fullScreenBalloonViewControllerHandleDismissTap:"));
}

@end
