@implementation MKTransitFilterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKTransitFilterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKTransitFilterCell"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKTransitFilterCell"), CFSTR("_label"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[MKTransitFilterCellAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("titleText"));
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_opt_class();
  -[MKTransitFilterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v4, "textColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BDF7400];
  if (v6 != v7)
    v8 = 0;
  return v8 | v5;
}

@end
