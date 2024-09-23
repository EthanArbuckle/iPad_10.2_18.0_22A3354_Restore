@implementation UpNextQueueViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.UpNextQueueViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SeymourUI.UpNextQueueViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("view"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UpNextQueueViewControllerAccessibility;
  -[UpNextQueueViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[UpNextQueueViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ax_filteredArrayUsingBlock:", &__block_literal_global_2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_190);
    objc_opt_class();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setIsAccessibilityElement:", 1);
  }

}

uint64_t __84__UpNextQueueViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x23491D424](CFSTR("_UIGrabber"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __84__UpNextQueueViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UpNextQueueViewControllerAccessibility;
  -[UpNextQueueViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[UpNextQueueViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
