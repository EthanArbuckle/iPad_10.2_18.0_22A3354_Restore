@implementation LabeledButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationKit.LabeledButtonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ConversationKit.LabeledButtonView"), CFSTR("control"), "Optional<UIControl>");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[LabeledButtonViewAccessibility controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  unint64_t v3;

  -[LabeledButtonViewAccessibility controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityTraits");

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[LabeledButtonViewAccessibility controlView](self, "controlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)controlView
{
  return (id)-[LabeledButtonViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("control"));
}

@end
