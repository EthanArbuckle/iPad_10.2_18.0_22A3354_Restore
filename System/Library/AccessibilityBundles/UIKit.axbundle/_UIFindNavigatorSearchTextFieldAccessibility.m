@implementation _UIFindNavigatorSearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIFindNavigatorSearchTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIFindNavigatorSearchTextField"), CFSTR("UITextField"));
  objc_storeStrong(location, 0);
}

- (unint64_t)accessibilityTraits
{
  BOOL v3;
  id v4;
  id v5;
  char v6;
  objc_super v7;
  unint64_t v8;
  SEL v9;
  _UIFindNavigatorSearchTextFieldAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIFindNavigatorSearchTextFieldAccessibility;
  v8 = -[_UIFindNavigatorSearchTextFieldAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v6 = 0;
  objc_opt_class();
  v5 = (id)__UIAccessibilityCastAsClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v3 = objc_msgSend(v4, "returnKeyType") != 6;

  if (!v3)
    v8 |= *MEMORY[0x24BDF73F8];
  return v8;
}

- (id)automationElements
{
  id v3;
  objc_super v4;
  id v5[3];
  id v6;

  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIFindNavigatorSearchTextFieldAccessibility;
  v5[0] = -[_UIFindNavigatorSearchTextFieldAccessibility automationElements](&v4, sel_automationElements);
  if (objc_msgSend(v5[0], "count"))
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithArray:", v5[0]);
    v6 = (id)objc_msgSend(v3, "array");
    objc_storeStrong(&v3, 0);
  }
  else
  {
    v6 = v5[0];
  }
  objc_storeStrong(v5, 0);
  return v6;
}

@end
