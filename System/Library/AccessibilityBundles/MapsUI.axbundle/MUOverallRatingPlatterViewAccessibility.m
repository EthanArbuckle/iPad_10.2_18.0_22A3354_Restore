@implementation MUOverallRatingPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUOverallRatingPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUOverallRatingPlatterView"), CFSTR("_attributionLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUOverallRatingPlatterView"), CFSTR("_viewModel"), "<MUOverallRatingPlatterViewModel>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  float v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MUOverallRatingPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("attributionText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "attribute:atIndex:effectiveRange:", CFSTR("AXAttributeDisplayName"), 0, 0);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_25026A470;
  }
  objc_msgSend(v2, "safeFloatForKey:", CFSTR("rating"));
  v7 = round(v6 + v6) * 0.5;
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("stars.rating"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, *(_QWORD *)&v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("numberOfVotes"));
  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("total.reviews"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
