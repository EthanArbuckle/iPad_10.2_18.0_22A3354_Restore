@implementation CKAvatarContactNameCollectionReusableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKAvatarContactNameCollectionReusableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarContactNameCollectionReusableView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAvatarContactNameCollectionReusableView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAvatarContactNameCollectionReusableViewAccessibility;
  -[CKAvatarContactNameCollectionReusableViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[CKAvatarContactNameCollectionReusableViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 0);
}

- (CKAvatarContactNameCollectionReusableViewAccessibility)initWithFrame:(CGRect)a3
{
  CKAvatarContactNameCollectionReusableViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKAvatarContactNameCollectionReusableViewAccessibility;
  v3 = -[CKAvatarContactNameCollectionReusableViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CKAvatarContactNameCollectionReusableViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
