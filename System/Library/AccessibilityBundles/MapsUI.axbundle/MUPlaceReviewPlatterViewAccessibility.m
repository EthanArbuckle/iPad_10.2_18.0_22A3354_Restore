@implementation MUPlaceReviewPlatterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlaceReviewPlatterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceReviewPlatterView"), CFSTR("_reviewTextView"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceReviewPlatterView"), CFSTR("_userLabel"), "UIView<MULabelViewProtocol>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlaceReviewPlatterView"), CFSTR("_viewModel"), "MUPlaceReviewViewModel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  float v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[MUPlaceReviewPlatterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeFloatForKey:", CFSTR("normalizedScore"));
  v5 = round(v4 + v4) * 0.5;
  v6 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("stars.rating"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v7, *(_QWORD *)&v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUPlaceReviewPlatterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_userLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlaceReviewPlatterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_reviewTextView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
