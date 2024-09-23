@implementation TwoLinesContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TwoLinesContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoLinesContentView"), CFSTR("_mainTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoLinesContentView"), CFSTR("_secondTitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TwoLinesContentView"), CFSTR("_thirdTitleLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  __int16 v15;

  -[TwoLinesContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mainTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TwoLinesContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondTitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_25025B660);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TwoLinesContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_thirdTitleLabel"), v6, CFSTR("__AXStringForVariablesSentinel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v10, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  AXStringByReplacingMiddleDots(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
