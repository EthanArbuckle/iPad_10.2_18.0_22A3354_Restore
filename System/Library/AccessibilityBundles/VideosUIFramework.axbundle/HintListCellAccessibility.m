@implementation HintListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosUI.HintListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("VideosUI.HintListCell"), CFSTR("titleLabel"), "Optional<VUILabel>");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VUILabel"), CFSTR("UILabel"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HintListCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HintListCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[HintListCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
