@implementation ACSportsTeamStandingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsTeamStandingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ACSportsTeamStandingView"), CFSTR("ACSportsEntityView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsEntityView"), CFSTR("entity"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SASportsEntity"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ACSportsStandingColumnView"), CFSTR("_snippetColumnHeaders"), "NSArray");

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
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  _QWORD v13[4];
  void *v14;
  id v15;

  -[ACSportsTeamStandingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("entity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACSportsTeamStandingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_snippetColumnHeaders"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSportsTeamStandingViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXStandingsColumns"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 == objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__ACSportsTeamStandingViewAccessibility_accessibilityLabel__block_invoke;
    v13[3] = &unk_250361F18;
    v14 = v8;
    v15 = v5;
    v9 = v8;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v14;
  }
  else
  {
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __59__ACSportsTeamStandingViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ax_enqueueObject:", v7, v8, CFSTR("__AXStringForVariablesSentinel"));
}

@end
