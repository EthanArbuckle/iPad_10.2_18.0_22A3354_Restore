@implementation TVShowCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.TVShowCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.TVShowCell"), CFSTR("subtitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[TVShowCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("title, subtitle"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVShowCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[TVShowCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
