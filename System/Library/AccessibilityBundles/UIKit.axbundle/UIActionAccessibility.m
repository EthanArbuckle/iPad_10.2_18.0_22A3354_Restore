@implementation UIActionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIAction");
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
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAction"), CFSTR("initWithAction:"), "@", 0);
  objc_storeStrong(v4, obj);
}

- (UIActionAccessibility)initWithAction:(id)a3
{
  UIActionAccessibility *v3;
  UIActionAccessibility *v5;
  id v6;
  UIActionAccessibility *v7;
  id v8;
  UIActionAccessibility *v9;
  id v10;
  UIActionAccessibility *v11;
  id v12;
  UIActionAccessibility *v13;
  objc_super v14;
  UIActionAccessibility *v15;
  id location[2];
  UIActionAccessibility *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v17;
  v17 = 0;
  v14.receiver = v3;
  v14.super_class = (Class)UIActionAccessibility;
  v17 = -[UIActionAccessibility initWithAction:](&v14, sel_initWithAction_, location[0]);
  v15 = v17;
  v5 = v15;
  v6 = (id)objc_msgSend(location[0], "accessibilityLabel");
  -[UIActionAccessibility setAccessibilityLabel:](v5, "setAccessibilityLabel:");

  v7 = v15;
  v8 = (id)objc_msgSend(location[0], "accessibilityValue");
  -[UIActionAccessibility setAccessibilityValue:](v7, "setAccessibilityValue:");

  v9 = v15;
  v10 = (id)objc_msgSend(location[0], "accessibilityHint");
  -[UIActionAccessibility setAccessibilityHint:](v9, "setAccessibilityHint:");

  -[UIActionAccessibility setAccessibilityTraits:](v15, "setAccessibilityTraits:", objc_msgSend(location[0], "accessibilityTraits"));
  v11 = v15;
  v12 = (id)objc_msgSend(location[0], "accessibilityUserInputLabels");
  -[UIActionAccessibility setAccessibilityUserInputLabels:](v11, "setAccessibilityUserInputLabels:");

  -[UIActionAccessibility setAccessibilityElementsHidden:](v15, "setAccessibilityElementsHidden:", objc_msgSend(location[0], "accessibilityElementsHidden") & 1);
  v13 = v15;
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v13;
}

@end
