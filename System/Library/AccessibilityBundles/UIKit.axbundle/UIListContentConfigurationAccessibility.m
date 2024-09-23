@implementation UIListContentConfigurationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIListContentConfiguration");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("UIListContentConfiguration");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("attributedText"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("secondaryText"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("secondaryAttributedText"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("prefersSideBySideTextAndSecondaryText"), "B", 0);
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  char v20;
  objc_super v21;
  id v22[2];
  UIListContentConfigurationAccessibility *v23;

  v23 = self;
  v22[1] = (id)a2;
  v21.receiver = self;
  v21.super_class = (Class)UIListContentConfigurationAccessibility;
  v22[0] = -[UIListContentConfigurationAccessibility accessibilityLabel](&v21, sel_accessibilityLabel);
  if (!objc_msgSend(v22[0], "length"))
  {
    v2 = (id)-[UIListContentConfigurationAccessibility safeStringForKey:](v23, "safeStringForKey:", CFSTR("text"));
    v3 = v22[0];
    v22[0] = v2;

    if (!objc_msgSend(v22[0], "length"))
    {
      v20 = 0;
      objc_opt_class();
      v13 = (id)-[UIListContentConfigurationAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("attributedText"));
      v19 = (id)__UIAccessibilityCastAsClass();

      v18 = v19;
      objc_storeStrong(&v19, 0);
      v4 = (id)objc_msgSend(v18, "string");
      v5 = v22[0];
      v22[0] = v4;

    }
    if ((-[UIListContentConfigurationAccessibility safeBoolForKey:](v23, "safeBoolForKey:", CFSTR("prefersSideBySideTextAndSecondaryText")) & 1) == 0)
    {
      v17 = (id)-[UIListContentConfigurationAccessibility safeStringForKey:](v23, "safeStringForKey:", CFSTR("secondaryText"));
      if (!objc_msgSend(v17, "length"))
      {
        v16 = 0;
        objc_opt_class();
        v12 = (id)-[UIListContentConfigurationAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("secondaryAttributedText"));
        v15 = (id)__UIAccessibilityCastAsClass();

        v14 = v15;
        objc_storeStrong(&v15, 0);
        v6 = (id)objc_msgSend(v14, "string");
        v7 = v17;
        v17 = v6;

      }
      v8 = (id)__UIAXStringForVariables();
      v9 = v22[0];
      v22[0] = v8;

      objc_storeStrong(&v17, 0);
    }
  }
  v11 = v22[0];
  objc_storeStrong(v22, 0);
  return v11;
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  objc_super v11;
  id v12[2];
  UIListContentConfigurationAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v11.receiver = self;
  v11.super_class = (Class)UIListContentConfigurationAccessibility;
  v12[0] = -[UIListContentConfigurationAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  if (!objc_msgSend(v12[0], "length")
    && (-[UIListContentConfigurationAccessibility safeBoolForKey:](v13, "safeBoolForKey:", CFSTR("prefersSideBySideTextAndSecondaryText")) & 1) != 0)
  {
    v10 = (id)-[UIListContentConfigurationAccessibility safeStringForKey:](v13, "safeStringForKey:", CFSTR("secondaryText"));
    if (!objc_msgSend(v10, "length"))
    {
      v9 = 0;
      objc_opt_class();
      v6 = (id)-[UIListContentConfigurationAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("secondaryAttributedText"));
      v8 = (id)__UIAccessibilityCastAsClass();

      v7 = v8;
      objc_storeStrong(&v8, 0);
      v2 = (id)objc_msgSend(v7, "string");
      v3 = v10;
      v10 = v2;

    }
    objc_storeStrong(v12, v10);
    objc_storeStrong(&v10, 0);
  }
  v5 = v12[0];
  objc_storeStrong(v12, 0);
  return v5;
}

- (unint64_t)accessibilityTraits
{
  id v3;
  id v4;
  char v5;
  objc_super v6;
  SEL v7;
  UIListContentConfigurationAccessibility *v8;

  v8 = self;
  v7 = a2;
  v4 = (id)-[UIListContentConfigurationAccessibility image](self, "image");
  v3 = (id)objc_msgSend(v4, "accessibilityIdentifier");
  v5 = objc_msgSend(v3, "containsString:", CFSTR("checkmark"));

  if ((v5 & 1) != 0)
    return *MEMORY[0x24BDF7400];
  v6.receiver = v8;
  v6.super_class = (Class)UIListContentConfigurationAccessibility;
  return -[UIListContentConfigurationAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
}

@end
