@implementation ArcadeDownloadPackCategoryButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.ArcadeDownloadPackCategoryButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.ArcadeDownloadPackCategoryButton"), CFSTR("titleLabel"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AppInstallExtension.ArcadeDownloadPackCategoryButton"), CFSTR("UIControl"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[ArcadeDownloadPackCategoryButtonAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unint64_t v4;
  objc_super v6;
  objc_super v7;

  if (-[ArcadeDownloadPackCategoryButtonAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("isSelected")))
  {
    v7.receiver = self;
    v7.super_class = (Class)ArcadeDownloadPackCategoryButtonAccessibility;
    v3 = *MEMORY[0x24BDF73B0] | -[ArcadeDownloadPackCategoryButtonAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
    v4 = *MEMORY[0x24BDF7400];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ArcadeDownloadPackCategoryButtonAccessibility;
    v4 = -[ArcadeDownloadPackCategoryButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
    v3 = *MEMORY[0x24BDF73B0];
  }
  return v3 | v4;
}

@end
