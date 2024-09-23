@implementation NikeSettingsWeightControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NikeSettingsWeightController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NikeSettingsWeightController"), CFSTR("_layoutViews"), "v", 0);
}

- (void)_layoutViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NikeSettingsWeightControllerAccessibility;
  -[NikeSettingsWeightControllerAccessibility _layoutViews](&v8, sel__layoutViews);
  -[NikeSettingsWeightControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_promptLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NikeSettingsWeightControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("TableWithFakeHeaderFooter"));

  -[NikeSettingsWeightControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("_axHeader"));

  -[NikeSettingsWeightControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_weightPicker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NikeSettingsWeightControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("_axFooter"));

}

@end
