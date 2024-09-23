@implementation GridItemButtonCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.GridItemButtonCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.GridItemButtonCell"), CFSTR("buttonTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.GridItemButtonCell"), CFSTR("buttonSubtitle"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[GridItemButtonCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("buttonTitle, buttonSubtitle"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GridItemButtonCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[GridItemButtonCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
