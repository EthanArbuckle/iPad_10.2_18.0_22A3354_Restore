@implementation FlowcaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.FlowcaseCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FlowcaseCell"), CFSTR("headline"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FlowcaseCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FlowcaseCell"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FlowcaseCell"), CFSTR("descriptionText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[FlowcaseCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headline"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FlowcaseCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FlowcaseCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FlowcaseCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("descriptionText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FlowcaseCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FlowcaseCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
