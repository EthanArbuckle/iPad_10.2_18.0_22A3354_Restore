@implementation UIFocusSystemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIFocusSystem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIFocusSystem"), CFSTR("_prefersDeferralForFocusUpdateInContext:"), "B", "@", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)_prefersDeferralForFocusUpdateInContext:(id)a3
{
  id v4;
  char v5;
  objc_super v6;
  int v7;
  id location[2];
  UIFocusSystemAccessibility *v9;
  char v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "nextFocusedView");
  v5 = objc_msgSend(v4, "_accessibilityIsFKARunningForFocusItem");

  if ((v5 & 1) != 0)
  {
    v10 = _AXSFullKeyboardAccessFocusRingEnabled() == 0;
  }
  else
  {
    v6.receiver = v9;
    v6.super_class = (Class)UIFocusSystemAccessibility;
    v10 = -[UIFocusSystemAccessibility _prefersDeferralForFocusUpdateInContext:](&v6, sel__prefersDeferralForFocusUpdateInContext_, location[0]);
  }
  v7 = 1;
  objc_storeStrong(location, 0);
  return v10 & 1;
}

@end
