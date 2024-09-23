@implementation UIAccessibilityCustomRotorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAccessibilityCustomRotor");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@?";
  v4 = CFSTR("UIAccessibilityCustomRotor");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", "@?", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("initWithName:itemSearchBlock:"), v5, v3, 0);
  objc_storeStrong(v7, v6);
}

- (void)_accessibilityApplyAttributes
{
  if (result)
    return (void *)objc_msgSend(result, "setVisibleInTouchRotor:", 1);
  return result;
}

- (UIAccessibilityCustomRotorAccessibility)initWithSystemType:(int64_t)a3 itemSearchBlock:(id)a4
{
  UIAccessibilityCustomRotorAccessibility *v4;
  UIAccessibilityCustomRotorAccessibility *v6;
  objc_super v7;
  UIAccessibilityCustomRotorAccessibility *v8;
  id location;
  int64_t v10;
  SEL v11;
  UIAccessibilityCustomRotorAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v4 = v12;
  v12 = 0;
  v7.receiver = v4;
  v7.super_class = (Class)UIAccessibilityCustomRotorAccessibility;
  v12 = -[UIAccessibilityCustomRotorAccessibility initWithSystemType:itemSearchBlock:](&v7, sel_initWithSystemType_itemSearchBlock_, v10, location);
  v8 = v12;
  -[UIAccessibilityCustomRotorAccessibility _accessibilityApplyAttributes](v12);
  v6 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (UIAccessibilityCustomRotorAccessibility)initWithName:(id)a3 itemSearchBlock:(id)a4
{
  UIAccessibilityCustomRotorAccessibility *v4;
  UIAccessibilityCustomRotorAccessibility *v7;
  objc_super v8;
  UIAccessibilityCustomRotorAccessibility *v9;
  id v10;
  id location[2];
  UIAccessibilityCustomRotorAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)UIAccessibilityCustomRotorAccessibility;
  v12 = -[UIAccessibilityCustomRotorAccessibility initWithName:itemSearchBlock:](&v8, sel_initWithName_itemSearchBlock_, location[0], v10);
  v9 = v12;
  -[UIAccessibilityCustomRotorAccessibility _accessibilityApplyAttributes](v12);
  v7 = v9;
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v7;
}

- (UIAccessibilityCustomRotorAccessibility)initWithAttributedName:(id)a3 itemSearchBlock:(id)a4
{
  UIAccessibilityCustomRotorAccessibility *v4;
  UIAccessibilityCustomRotorAccessibility *v7;
  objc_super v8;
  UIAccessibilityCustomRotorAccessibility *v9;
  id v10;
  id location[2];
  UIAccessibilityCustomRotorAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)UIAccessibilityCustomRotorAccessibility;
  v12 = -[UIAccessibilityCustomRotorAccessibility initWithAttributedName:itemSearchBlock:](&v8, sel_initWithAttributedName_itemSearchBlock_, location[0], v10);
  v9 = v12;
  -[UIAccessibilityCustomRotorAccessibility _accessibilityApplyAttributes](v12);
  v7 = v9;
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v7;
}

@end
