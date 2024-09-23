@implementation CKRemotePeoplePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKRemotePeoplePickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKRemotePeoplePickerViewControllerAccessibility;
  -[CKRemotePeoplePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CKRemotePeoplePickerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccessibilityViewIsModalBlock:", &__block_literal_global_1);
}

uint64_t __93__CKRemotePeoplePickerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

@end
