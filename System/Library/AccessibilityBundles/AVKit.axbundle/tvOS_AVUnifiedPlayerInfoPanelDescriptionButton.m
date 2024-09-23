@implementation tvOS_AVUnifiedPlayerInfoPanelDescriptionButton

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_AVUnifiedPlayerInfoPanelDescriptionButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_AVUnifiedPlayerInfoPanelDescriptionButton"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_AVUnifiedPlayerInfoPanelDescriptionButton"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIImage"), CFSTR("_imageAsset"), "UIImageAsset");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);

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
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  objc_opt_class();
  -[tvOS_AVUnifiedPlayerInfoPanelDescriptionButton safeValueForKey:](self, "safeValueForKey:", CFSTR("imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[tvOS_AVUnifiedPlayerInfoPanelDescriptionButton safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (MEMORY[0x234904A14](v5)
    && (objc_msgSend(v5, "safeValueForKey:", CFSTR("_imageAsset")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "safeStringForKey:", CFSTR("assetName")),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("play.fill")),
        v9,
        v8,
        v10))
  {
    accessibilityLocalizedString(CFSTR("play.button"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v7;
  }

  return v12;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
