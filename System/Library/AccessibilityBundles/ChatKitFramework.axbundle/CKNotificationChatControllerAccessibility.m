@implementation CKNotificationChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNotificationChatController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("CKNotificationChatController"), CFSTR("UIViewController"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNotificationChatControllerAccessibility;
  -[CKNotificationChatControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKNotificationChatControllerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXTranscriptIsInNotification"));
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNotificationChatControllerAccessibility;
  -[CKNotificationChatControllerAccessibility loadView](&v3, sel_loadView);
  -[CKNotificationChatControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
