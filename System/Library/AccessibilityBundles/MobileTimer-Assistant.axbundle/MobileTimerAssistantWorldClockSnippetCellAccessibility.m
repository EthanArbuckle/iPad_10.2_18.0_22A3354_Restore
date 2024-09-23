@implementation MobileTimerAssistantWorldClockSnippetCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileTimerAssistantWorldClockSnippetCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MobileTimerAssistantWorldClockSnippetCell"), CFSTR("_clockCellView"), "MTUIWorldClockCellView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIWorldClockCellView"), CFSTR("digitalClock"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MTUIDateLabel"), CFSTR("dateLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  -[MobileTimerAssistantWorldClockSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_clockCellView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("digitalClock"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("nameLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("combinedLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("dateLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MobileTimerAssistantWorldClockSnippetCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_clockCellView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("digitalClock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("dateLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
