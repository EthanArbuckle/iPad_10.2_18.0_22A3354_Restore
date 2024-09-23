@implementation PXTitleSubtitleUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXTitleSubtitleUILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXTitleSubtitleUILabel"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXTitleSubtitleUILabel"), CFSTR("subtitleText"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[PXTitleSubtitleUILabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXMemoryTileHeadingLabel"));

  return v3 ^ 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class();
  -[PXTitleSubtitleUILabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[PXTitleSubtitleUILabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __AXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleUILabelAccessibility;
  return *MEMORY[0x24BDF73C0] | -[PXTitleSubtitleUILabelAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
