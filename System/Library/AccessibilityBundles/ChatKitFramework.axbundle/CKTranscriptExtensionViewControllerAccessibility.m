@implementation CKTranscriptExtensionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptExtensionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptExtensionViewControllerAccessibility;
  -[CKTranscriptExtensionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKTranscriptExtensionViewControllerAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AXMessagesExtensionWindow"));

}

@end
