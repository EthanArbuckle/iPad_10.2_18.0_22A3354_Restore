@implementation LPCollaborationFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LPCollaborationFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCollaborationFooterView"), CFSTR("_optionsView"), "LPTextView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPCollaborationFooterView"), CFSTR("_subtitleView"), "LPTextView");

}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LPCollaborationFooterViewAccessibility;
  v3 = -[LPCollaborationFooterViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[LPCollaborationFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_optionsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[LPCollaborationFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_optionsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LPCollaborationFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
