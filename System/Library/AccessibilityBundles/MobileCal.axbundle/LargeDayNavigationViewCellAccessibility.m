@implementation LargeDayNavigationViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LargeDayNavigationViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DayNavigationViewCell"), CFSTR("date"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("LargeDayNavigationViewCell"), CFSTR("DayNavigationViewCell"));

}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_opt_class();
  -[LargeDayNavigationViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    MEMORY[0x2349148A0](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)MEMORY[0x24BDBCE30];
  -[LargeDayNavigationViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_leftString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LargeDayNavigationViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_centerString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LargeDayNavigationViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rightString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "axArrayByIgnoringNilElementsWithCount:", 3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(" "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
