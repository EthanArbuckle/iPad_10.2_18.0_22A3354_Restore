@implementation UIInputSetHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSetHostView");
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
  objc_msgSend(location[0], "validateClass:", CFSTR("UIRemoteKeyboardWindow"));
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 1;
}

- (unint64_t)_accessibilityScannerGroupTraits
{
  id v2;
  BOOL v4;
  BOOL v5;
  char v6;
  id v7;
  BOOL v8;
  objc_super v9;
  unint64_t v10;
  SEL v11;
  UIInputSetHostViewAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)UIInputSetHostViewAccessibility;
  v10 = -[UIInputSetHostViewAccessibility _accessibilityScannerGroupTraits](&v9, sel__accessibilityScannerGroupTraits);
  v2 = (id)-[UIInputSetHostViewAccessibility _accessibilityViewAncestorIsKindOf:](v12, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("UIRemoteKeyboardWindow")));
  v5 = v2 != 0;

  v8 = v5;
  if ((AXUIKeyboardIsOOP() & 1) != 0)
  {
    v6 = 0;
    v4 = 1;
    if (!v5)
    {
      v7 = (id)-[UIInputSetHostViewAccessibility _accessibilityViewAncestorIsKindOf:](v12, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("UITextEffectsWindow")));
      v6 = 1;
      v4 = v7 != 0;
    }
    v8 = v4;
    if ((v6 & 1) != 0)

  }
  if (v8)
    v10 |= 1uLL;
  return v10;
}

@end
