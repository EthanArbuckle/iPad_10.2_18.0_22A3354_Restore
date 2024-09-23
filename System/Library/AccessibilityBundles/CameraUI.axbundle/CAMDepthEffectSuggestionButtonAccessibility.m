@implementation CAMDepthEffectSuggestionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMDepthEffectSuggestionButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDepthEffectSuggestionButton"), CFSTR("mode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDepthEffectSuggestionButton"), CFSTR("setMode:animated:"), "v", "q", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("depth.button"));
}

- (id)accessibilityValue
{
  uint64_t v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  v2 = -[CAMDepthEffectSuggestionButtonAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("mode"));
  if ((unint64_t)(v2 - 1) < 2)
  {
    v3 = CFSTR("depth.on");
LABEL_5:
    accessibilityCameraUILocalizedString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  v4 = v2;
  if (!v2)
  {
    v3 = CFSTR("depth.off");
    goto LABEL_5;
  }
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CAMDepthEffectSuggestionButtonAccessibility accessibilityValue].cold.1(v4, v6);

  v5 = 0;
  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMDepthEffectSuggestionButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMDepthEffectSuggestionButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

void __68__CAMDepthEffectSuggestionButtonAccessibility_accessibilityActivate__block_invoke()
{
  void *v0;

  __UIAccessibilitySafeClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "sendActionsForControlEvents:", 64);

}

- (void)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_230B33000, a2, OS_LOG_TYPE_ERROR, "Missing value for depth effect suggestion button mode: %@", (uint8_t *)&v4, 0xCu);

}

@end
