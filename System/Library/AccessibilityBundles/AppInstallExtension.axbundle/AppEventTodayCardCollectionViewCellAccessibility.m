@implementation AppEventTodayCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.AppEventTodayCardCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.AppEventTodayCardCollectionViewCell"), CFSTR("formattedDateView"), "AppPromotionFormattedDateView");
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AppEventTodayCardCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("formattedDateView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);
  v7.receiver = self;
  v7.super_class = (Class)AppEventTodayCardCollectionViewCellAccessibility;
  -[AppEventTodayCardCollectionViewCellAccessibility accessibilityElements](&v7, sel_accessibilityElements);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);

  return v3;
}

@end
