@implementation ListTodayCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.ListTodayCardCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.ListTodayCardCollectionViewCell"), CFSTR("labelsView"), "TodayCardLabelsView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.ListTodayCardCollectionViewCell"), CFSTR("lockupContainer"), "TodayListCardLockupContainer");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ListTodayCardCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("labelsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v3, "axSafelyAddObject:", v4);
  objc_opt_class();
  -[ListTodayCardCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("lockupContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axSafelyAddObject:", v6);
  return v3;
}

@end
