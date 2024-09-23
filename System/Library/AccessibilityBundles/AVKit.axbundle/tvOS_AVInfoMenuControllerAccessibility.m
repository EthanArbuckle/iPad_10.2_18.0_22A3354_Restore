@implementation tvOS_AVInfoMenuControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVInfoMenuController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVInfoMenuController"), CFSTR("viewControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AVInfoPanelMetadataViewController"), CFSTR("UIViewController"));

}

- (id)accessibilityHeaderElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[tvOS_AVInfoMenuControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewControllers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "axFilterObjectsUsingBlock:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilityHeaderElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
