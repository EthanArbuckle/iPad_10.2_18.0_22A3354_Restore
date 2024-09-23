@implementation RecentItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RecentsAvocado.RecentItemCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecentsAvocado.RecentItemCell"), CFSTR("accessibilityItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecentsAvocado.RecentItemCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RecentsAvocado.RecentItemCell"), CFSTR("accessibilitySubtitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[RecentItemCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitle, accessibilitySubtitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RecentItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = AXDoesRequestingClientDeserveAutomation();
    objc_msgSend(v5, "filename");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      UIAXFileTypeDescriptionForFileExtension();
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }

  }
  else
  {
    v8 = 0;
  }
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[RecentItemCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
