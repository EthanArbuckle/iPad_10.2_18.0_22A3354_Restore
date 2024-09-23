@implementation FCUIActivityPickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FCUIActivityPickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityPickerViewController"), CFSTR("_dismissHeader"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityPickerViewController"), CFSTR("_activityListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FCUIActivityListView"), CFSTR("activityViews"), "@", 0);

}

- (void)_dismissHeader
{
  void *v3;
  void *v4;
  UIAccessibilityNotifications v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FCUIActivityPickerViewControllerAccessibility;
  -[FCUIActivityPickerViewControllerAccessibility _dismissHeader](&v7, sel__dismissHeader);
  -[FCUIActivityPickerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_activityListView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("activityViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF72C8];
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v5, v6);

}

@end
