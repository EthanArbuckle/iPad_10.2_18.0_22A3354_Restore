@implementation SPUITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SPUITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SPUICompletionStringView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUICompletionStringView"), CFSTR("labelsStackView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUICompletionStringView"), CFSTR("completionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUICompletionStringView"), CFSTR("bridgeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SPUICompletionStringView"), CFSTR("extensionLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[SPUITextFieldAccessibility axCompletionStrings](self, "axCompletionStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("labelsStackView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("completionLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("text"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLocalizedString(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SPUITextFieldAccessibility;
    -[SPUITextFieldAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)accessibilityValue
{
  unint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_super v23;
  objc_super v24;
  objc_super v25;

  v3 = AXRequestingClient();
  if (v3 <= 7 && ((1 << v3) & 0x86) != 0)
  {
    v25.receiver = self;
    v25.super_class = (Class)SPUITextFieldAccessibility;
    -[SPUITextFieldAccessibility accessibilityValue](&v25, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SPUITextFieldAccessibility axCompletionStrings](self, "axCompletionStrings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("labelsStackView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "safeValueForKey:", CFSTR("completionLabel"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeStringForKey:", CFSTR("text"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "safeValueForKey:", CFSTR("bridgeLabel"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeStringForKey:", CFSTR("text"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "safeValueForKey:", CFSTR("extensionLabel"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeStringForKey:", CFSTR("text"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v23.receiver = self;
      v23.super_class = (Class)SPUITextFieldAccessibility;
      -[SPUITextFieldAccessibility accessibilityValue](&v23, sel_accessibilityValue);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "_accessibilityViewIsVisible")
        && objc_msgSend(v9, "length")
        && objc_msgSend(v11, "length")
        && objc_msgSend(v13, "length"))
      {
        __UIAXStringForVariables();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SPUITextFieldAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"), v13, CFSTR("__AXStringForVariablesSentinel"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v9);

        if ((v17 & 1) == 0)
        {
          __UIAXStringForVariables();
          v18 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v18;
        }
        v19 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("search.suggestion.format"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringWithFormat:", v20, v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        __UIAXStringForVariables();
        v22 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v22;
      }

    }
    else
    {
      v24.receiver = self;
      v24.super_class = (Class)SPUITextFieldAccessibility;
      -[SPUITextFieldAccessibility accessibilityValue](&v24, sel_accessibilityValue);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v14;
  }
}

- (id)accessibilityIdentifier
{
  return CFSTR("SpotlightSearchField");
}

- (BOOL)_accessibilityHoverTypingShouldAdjustDockedMode
{
  return 1;
}

- (id)automationElements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPUITextFieldAccessibility;
  -[SPUITextFieldAccessibility automationElements](&v8, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[SPUITextFieldAccessibility axCompletionStrings](self, "axCompletionStrings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObjectsFromArray:", v6);

  return v5;
}

- (id)axCompletionStrings
{
  if (axCompletionStrings_onceToken != -1)
    dispatch_once(&axCompletionStrings_onceToken, &__block_literal_global_0);
  return (id)-[SPUITextFieldAccessibility _accessibilityFindSubviewDescendantsPassingTest:](self, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_208);
}

uint64_t __49__SPUITextFieldAccessibility_axCompletionStrings__block_invoke()
{
  uint64_t result;

  result = MEMORY[0x23491EFE8](CFSTR("SPUICompletionStringView"));
  axCompletionStrings_completionView = result;
  return result;
}

uint64_t __49__SPUITextFieldAccessibility_axCompletionStrings__block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

@end
