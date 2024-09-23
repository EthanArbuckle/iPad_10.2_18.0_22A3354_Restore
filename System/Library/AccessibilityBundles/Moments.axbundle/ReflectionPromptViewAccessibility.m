@implementation ReflectionPromptViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MomentsUIService.ReflectionPromptView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.ReflectionPromptView"), CFSTR("categoryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MomentsUIService.ReflectionPromptView"), CFSTR("reflectionPrompt"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MomentsUIService.ReflectionPromptView"), CFSTR("updatePromptIndex:"), "v", "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[ReflectionPromptViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("categoryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ReflectionPromptViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("reflectionPrompt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ReflectionPromptViewAccessibility;
  -[ReflectionPromptViewAccessibility accessibilityCustomActions](&v9, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityJurassicLocalizedString(CFSTR("shuffle.reflection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__axShuffle_);
  objc_msgSend(v4, "addObject:", v7);

  return v4;
}

- (BOOL)_axShuffle:(id)a3
{
  AXPerformSafeBlock();
  return 1;
}

void __48__ReflectionPromptViewAccessibility__axShuffle___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updatePromptIndex:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

@end
