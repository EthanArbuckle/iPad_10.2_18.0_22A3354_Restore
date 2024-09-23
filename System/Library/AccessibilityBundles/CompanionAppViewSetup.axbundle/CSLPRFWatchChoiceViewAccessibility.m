@implementation CSLPRFWatchChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLPRFWatchChoiceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSLPRFWatchChoiceView"), CFSTR("_button"), "CSLPRFAppViewChoiceButton");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSLPRFAppViewChoiceButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLPRFWatchChoiceView"), CFSTR("choice"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  -[CSLPRFWatchChoiceViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v8 = (void *)v5;
    goto LABEL_10;
  }
  v6 = -[CSLPRFWatchChoiceViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("choice"));
  if (v6 == 1)
  {
    v7 = CFSTR("CHOICE_GRID_VIEW");
  }
  else
  {
    if (v6 != 2)
    {
LABEL_8:
      v10.receiver = self;
      v10.super_class = (Class)CSLPRFWatchChoiceViewAccessibility;
      -[CSLPRFWatchChoiceViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v7 = CFSTR("CHOICE_LIST_VIEW");
  }
  accessibilityLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
LABEL_10:

  return v8;
}

uint64_t __56__CSLPRFWatchChoiceViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  -[CSLPRFWatchChoiceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "isSelected");
    v6 = objc_msgSend(v4, "accessibilityTraits");
    v7 = v6;
    if (v5)
      v7 = *MEMORY[0x24BDF7400] | v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSLPRFWatchChoiceViewAccessibility;
    v7 = -[CSLPRFWatchChoiceViewAccessibility accessibilityTraits](&v9, sel_accessibilityTraits);
  }

  return v7;
}

@end
