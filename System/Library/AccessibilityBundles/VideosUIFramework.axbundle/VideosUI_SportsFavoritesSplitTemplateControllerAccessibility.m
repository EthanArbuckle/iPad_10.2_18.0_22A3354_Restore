@implementation VideosUI_SportsFavoritesSplitTemplateControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.SportsFavoritesSplitTemplateController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("VideosUI.ErrorContentView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.ErrorContentView"), CFSTR("accessibilityTitleView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("VideosUI.ErrorContentView"), CFSTR("accessibilityDescriptionView"), "@");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VideosUI_SportsFavoritesSplitTemplateControllerAccessibility;
  -[VideosUI_SportsFavoritesSplitTemplateControllerAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
}

- (id)accessibilityHeaderElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityDescendantOfType:", MEMORY[0x2349244BC](CFSTR("VideosUI.ErrorContentView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityTitleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityDescriptionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axArrayByIgnoringNilElementsWithCount:", 2, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
