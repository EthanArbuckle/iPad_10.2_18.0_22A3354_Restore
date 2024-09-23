@implementation OBTextSectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("OBTextSectionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBTextSectionView"), CFSTR("headerLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("OBTextSectionView"), CFSTR("initWithHeader:content:"), "@", "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OBTextSectionViewAccessibility;
  -[OBTextSectionViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v3 = *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0];
  -[OBTextSectionViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("headerLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", v3);

}

- (OBTextSectionViewAccessibility)initWithHeader:(id)a3 content:(id)a4
{
  OBTextSectionViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBTextSectionViewAccessibility;
  v4 = -[OBTextSectionViewAccessibility initWithHeader:content:](&v6, sel_initWithHeader_content_, a3, a4);
  -[OBTextSectionViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

@end
