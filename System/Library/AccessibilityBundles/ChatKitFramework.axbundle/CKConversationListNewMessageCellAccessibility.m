@implementation CKConversationListNewMessageCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationListNewMessageCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListNewMessageCell"), CFSTR("_closeButton"), "UIButton");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListNewMessageCellAccessibility;
  -[CKConversationListNewMessageCellAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKConversationListNewMessageCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

@end
