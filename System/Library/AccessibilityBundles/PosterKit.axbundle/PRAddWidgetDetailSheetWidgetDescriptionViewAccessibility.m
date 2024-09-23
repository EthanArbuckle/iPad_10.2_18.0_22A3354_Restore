@implementation PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PRAddWidgetDetailSheetWidgetDescriptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PRAddWidgetDetailSheetWidgetDescriptionView"), CFSTR("titleLabel"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PRAddWidgetDetailSheetWidgetDescriptionView"), CFSTR("descriptionLabel"), "@");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRAddWidgetDetailSheetWidgetDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
