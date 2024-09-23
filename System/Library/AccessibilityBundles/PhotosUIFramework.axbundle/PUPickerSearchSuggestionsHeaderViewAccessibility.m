@implementation PUPickerSearchSuggestionsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PUPickerSearchSuggestionsHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PUPickerSearchSuggestionsHeaderView"), CFSTR("collectionView"), "@", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPickerSearchSuggestionsHeaderViewAccessibility;
  -[PUPickerSearchSuggestionsHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PUPickerSearchSuggestionsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityContainerType:", 0);

}

@end
