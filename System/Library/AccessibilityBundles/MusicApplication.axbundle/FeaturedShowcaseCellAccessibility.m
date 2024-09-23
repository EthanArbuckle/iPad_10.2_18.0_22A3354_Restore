@implementation FeaturedShowcaseCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.FeaturedShowcaseCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedShowcaseCell"), CFSTR("accessibilityDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedShowcaseCell"), CFSTR("accessibilityHeadline"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedShowcaseCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.FeaturedShowcaseCell"), CFSTR("accessibilitySubtitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[FeaturedShowcaseCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityHeadline, accessibilityTitle, accessibilitySubtitle, accessibilityDescription"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FeaturedShowcaseCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[FeaturedShowcaseCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
