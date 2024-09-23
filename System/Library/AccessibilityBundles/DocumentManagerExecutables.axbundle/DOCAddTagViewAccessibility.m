@implementation DOCAddTagViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DOCAddTagView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DOCAddTagView"), CFSTR("_tagNameTextField"), "DOCAddTagViewTextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DOCAddTagView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (DOCAddTagViewAccessibility)initWithFrame:(CGRect)a3
{
  DOCAddTagViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCAddTagViewAccessibility;
  v3 = -[DOCAddTagViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[DOCAddTagViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCAddTagViewAccessibility;
  -[DOCAddTagViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[DOCAddTagViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tagNameTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("add.tag.text.field"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

@end
