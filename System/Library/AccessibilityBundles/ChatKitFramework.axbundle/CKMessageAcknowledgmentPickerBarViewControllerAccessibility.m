@implementation CKMessageAcknowledgmentPickerBarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageAcknowledgmentPickerBarViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageAcknowledgmentPickerBarViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKPickerBarView"), CFSTR("acknowledgmentViews"));

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  char v3;

  -[CKMessageAcknowledgmentPickerBarViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKFullScreenBalloonViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "accessibilityPerformEscape");
  else
    v3 = 0;

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKMessageAcknowledgmentPickerBarViewControllerAccessibility;
  -[CKMessageAcknowledgmentPickerBarViewControllerAccessibility viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  -[CKMessageAcknowledgmentPickerBarViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("acknowledgmentViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v7);

}

@end
