@implementation CNContactHeaderEditViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNContactHeaderEditView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactHeaderEditView"), CFSTR("editButton"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNContactHeaderEditViewAccessibility;
  -[CNContactHeaderEditViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CNContactHeaderEditViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("editButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

}

@end
