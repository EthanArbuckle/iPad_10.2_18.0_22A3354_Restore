@implementation PBFPosterGallerySectionHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PBFPosterGallerySectionHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasProperty:withType:", CFSTR("PBFPosterGallerySectionHeaderView"), CFSTR("label"), "@");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFPosterGallerySectionHeaderViewAccessibility;
  -[PBFPosterGallerySectionHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PBFPosterGallerySectionHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
