@implementation CNPhotoPickerSectionHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPhotoPickerSectionHeader");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPhotoPickerSectionHeader"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNPhotoPickerSectionHeader"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNPhotoPickerSectionHeader"), CFSTR("_actionButton"), "UIButton");

}

- (CNPhotoPickerSectionHeaderAccessibility)initWithFrame:(CGRect)a3
{
  CNPhotoPickerSectionHeaderAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerSectionHeaderAccessibility;
  v3 = -[CNPhotoPickerSectionHeaderAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CNPhotoPickerSectionHeaderAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPhotoPickerSectionHeaderAccessibility;
  -[CNPhotoPickerSectionHeaderAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF73C0];
  -[CNPhotoPickerSectionHeaderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPhotoPickerSectionHeaderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  -[CNPhotoPickerSectionHeaderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[CNPhotoPickerSectionHeaderAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_actionButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v8);

  }
  return v3;
}

@end
