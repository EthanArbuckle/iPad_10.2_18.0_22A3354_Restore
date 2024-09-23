@implementation UIStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStackView");
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
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIStackView"), CFSTR("UIView"));
  objc_storeStrong(location, 0);
}

- (BOOL)shouldGroupAccessibilityChildren
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v6;

  v6 = 1;
  v2 = (id)-[UIStackViewAccessibility accessibilityUserDefinedShouldGroupChildren](self, "accessibilityUserDefinedShouldGroupChildren");
  v5 = v2 == 0;

  if (!v5)
  {
    v4 = (id)-[UIStackViewAccessibility accessibilityUserDefinedShouldGroupChildren](self, "accessibilityUserDefinedShouldGroupChildren");
    v6 = objc_msgSend(v4, "BOOLValue") & 1;

  }
  return v6;
}

@end
