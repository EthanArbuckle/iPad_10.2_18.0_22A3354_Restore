@implementation RiverTodayCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.RiverTodayCardCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.RiverTodayCardCollectionViewCell"), CFSTR("labelsView"), "TodayCardLabelsView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.TodayCardLabelsView"), CFSTR("badgeTransitioningContainer"), "TodayTransitioningLabelView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.TodayCardLabelsView"), CFSTR("titleTransitioningContainer"), "TodayTransitioningLabelView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.TodayCardLabelsView"), CFSTR("descriptionTransitioningContainer"), "TodayTransitioningLabelView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.TodayTransitioningLabelView"), CFSTR("label"), "DynamicTypeLabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RiverTodayCardCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[RiverTodayCardCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[RiverTodayCardCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("labelsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("badgeTransitioningContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("titleTransitioningContainer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftValueForKey:", CFSTR("descriptionTransitioningContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeSwiftValueForKey:", CFSTR("label"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
