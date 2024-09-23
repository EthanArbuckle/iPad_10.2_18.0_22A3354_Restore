@implementation FlyoverTrayHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FlyoverTrayHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FlyoverTrayHeader"), CFSTR("_setupViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FlyoverTrayHeader"), CFSTR("button"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FlyoverTrayHeaderAccessibility;
  -[FlyoverTrayHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  AXMapsLocString(CFSTR("CLOSE_BUTTON"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FlyoverTrayHeaderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (void)_setupViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FlyoverTrayHeaderAccessibility;
  -[FlyoverTrayHeaderAccessibility _setupViews](&v3, sel__setupViews);
  -[FlyoverTrayHeaderAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
