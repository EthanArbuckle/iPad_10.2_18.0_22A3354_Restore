@implementation PlatformSelectorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.PlatformSelectorView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.PlatformSelectorView"), CFSTR("accessibilityDescriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AppStoreKit.DynamicTypeLabel"), CFSTR("UILabel"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[PlatformSelectorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDescriptionLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PlatformSelectorViewAccessibility;
  return *MEMORY[0x24BDF73B0] | -[PlatformSelectorViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
