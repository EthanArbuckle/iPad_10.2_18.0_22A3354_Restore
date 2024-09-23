@implementation UIToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIToolbarButton");
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
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIToolbarButton"), CFSTR("_onState"), "B");
  objc_storeStrong(location, 0);
}

- (CGRect)accessibilityFrame
{
  double x;
  double y;
  double width;
  double height;
  id v6;
  CGRect v7;
  CGRect v8;
  CGRect result;

  v6 = (id)-[UIToolbarButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_info"));
  objc_msgSend(v6, "accessibilityFrame");
  v7 = CGRectInset(v8, -5.0, -5.0);

  y = v7.origin.y;
  x = v7.origin.x;
  height = v7.size.height;
  width = v7.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
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
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  BOOL v15;
  objc_super v16;
  uint64_t v17;
  id v18[2];
  UIToolbarButtonAccessibility *v19;
  id v20;

  v19 = self;
  v18[1] = (id)a2;
  v2 = (id)-[UIToolbarButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v15 = v2 == 0;

  if (v15)
  {
    v14 = (id)-[UIToolbarButtonAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("label"));
    v18[0] = (id)objc_msgSend(v14, "accessibilityLabel");

    if (!objc_msgSend(v18[0], "length"))
    {
      v12 = (id)-[UIToolbarButtonAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("tag"));
      v13 = objc_msgSend(v12, "integerValue");

      v17 = v13;
      if (!v13)
      {
        v11 = (id)-[UIToolbarButtonAccessibility accessibilityIdentification](v19, "accessibilityIdentification");
        v17 = objc_msgSend(v11, "integerValue");

      }
      v3 = (id)objc_msgSend(MEMORY[0x24BDF6F90], "_accessibilityTitleForSystemTag:", v17);
      v4 = v18[0];
      v18[0] = v3;

    }
    if (!objc_msgSend(v18[0], "length"))
    {
      v10 = (id)-[UIToolbarButtonAccessibility safeValueForKey:](v19, "safeValueForKey:", CFSTR("_info"));
      v5 = (id)objc_msgSend(v10, "_accessibilityAXAttributedLabel");
      v6 = v18[0];
      v18[0] = v5;

      if (!objc_msgSend(v18[0], "length"))
      {
        v16.receiver = v19;
        v16.super_class = (Class)UIToolbarButtonAccessibility;
        v7 = -[UIToolbarButtonAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
        v8 = v18[0];
        v18[0] = v7;

      }
    }
    v20 = v18[0];
    objc_storeStrong(v18, 0);
  }
  else
  {
    v20 = (id)-[UIToolbarButtonAccessibility accessibilityUserDefinedLabel](v19, "accessibilityUserDefinedLabel");
  }
  return v20;
}

- (id)accessibilityLocalizedStringKey
{
  return (id)-[UIToolbarButtonAccessibility _accessibilityAttributedLocalizedString](self, "_accessibilityAttributedLocalizedString", a2, self);
}

- (id)accessibilityLocalizationBundleID
{
  return (id)-[UIToolbarButtonAccessibility _accessibilityRetrieveLocalizationBundleID](self, "_accessibilityRetrieveLocalizationBundleID", a2, self);
}

- (id)accessibilityLocalizationBundlePath
{
  return (id)-[UIToolbarButtonAccessibility _accessibilityRetrieveLocalizationBundlePath](self, "_accessibilityRetrieveLocalizationBundlePath", a2, self);
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)-[UIToolbarButtonAccessibility _accessibilityRetrieveLocalizedStringTableName](self, "_accessibilityRetrieveLocalizedStringTableName", a2, self);
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIToolbarButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return 1;
  v4 = (id)-[UIToolbarButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  objc_super v6;
  SEL v7;
  UIToolbarButtonAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)UIToolbarButtonAccessibility;
  v4 = -[UIToolbarButtonAccessibility accessibilityTraits](&v6, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
  v5 = (id)-[UIToolbarButtonAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_onState"));
  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
    v3 = *MEMORY[0x24BDF7400];
  else
    v3 = 0;

  return v4 | v3;
}

@end
