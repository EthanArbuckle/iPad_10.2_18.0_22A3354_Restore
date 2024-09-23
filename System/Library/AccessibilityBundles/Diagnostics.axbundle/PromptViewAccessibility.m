@implementation PromptViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Diagnostics.PromptView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.PromptView"), CFSTR("buttonStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.PromptView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.PromptView"), CFSTR("subtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("Diagnostics.PromptView"), CFSTR("infoProgressIndicatorView"), "@", 0);

}

- (id)subviewsForStackViewElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[PromptViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PromptViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObject:", v6);

  -[PromptViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObject:", v7);

  -[PromptViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoProgressIndicatorView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObject:", v8);

  objc_msgSend(v4, "arrangedSubviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v9);

  return v5;
}

@end
