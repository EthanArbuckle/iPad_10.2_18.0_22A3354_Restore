@implementation MRUActivityMirroringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUActivityMirroringView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityMirroringView"), CFSTR("leadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityMirroringView"), CFSTR("trailingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityMirroringView"), CFSTR("deviceImageView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MRUActivityMirroringViewAccessibility;
  -[MRUActivityMirroringViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  -[MRUActivityMirroringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leadingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("airplay.video"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[MRUActivityMirroringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUActivityMirroringViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deviceImageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

}

@end
