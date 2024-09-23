@implementation _UIAlertControllerActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIAlertControllerActionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  const char *v8;
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIAlertControllerActionView");
  v3 = "UILabel";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerActionView"), CFSTR("_descriptiveLabel"), "UILabel");
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerActionView"), CFSTR("_hasDescriptiveText"));
  v8 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIAlertControllerActionView"), CFSTR("action"), 0);
  v5 = CFSTR("UIAlertAction");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_contentViewController"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("style"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_isPreferred"), v7, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("UIInterfaceActionRepresentationView"));
  v6 = CFSTR("UIInterfaceActionGroupView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIAlertControllerInterfaceActionGroupView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("actionSelectionController"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIInterfaceActionCustomViewRepresentationView"), CFSTR("setHighlighted:"), "v", v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInterfaceActionSelectionTrackingController"), CFSTR("_allActionViewsIncludingCooperatingActionViews"), v8, 0);
  objc_storeStrong(v10, v9);
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v4;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  char v10;
  id v11;
  objc_super v12;
  unint64_t v13;
  SEL v14;
  _UIAlertControllerActionViewAccessibility *v15;

  v15 = self;
  v14 = a2;
  v13 = 0;
  v2 = (id)-[_UIAlertControllerActionViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits");
  v7 = v2 == 0;

  if (v7)
  {
    v12.receiver = v15;
    v12.super_class = (Class)_UIAlertControllerActionViewAccessibility;
    v13 = -[_UIAlertControllerActionViewAccessibility accessibilityTraits](&v12, sel_accessibilityTraits) | *MEMORY[0x24BDF73B0];
  }
  else
  {
    v6 = (id)-[_UIAlertControllerActionViewAccessibility accessibilityUserDefinedTraits](v15, "accessibilityUserDefinedTraits");
    v13 = objc_msgSend(v6, "unsignedLongLongValue");

  }
  v10 = 0;
  objc_opt_class();
  v5 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("action"));
  v9 = (id)__UIAccessibilityCastAsClass();

  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11 = v8;
  if ((objc_msgSend(v8, "safeBoolForKey:", CFSTR("isEnabled")) & 1) != 0)
    v13 &= ~*MEMORY[0x24BDF73E8];
  else
    v13 |= *MEMORY[0x24BDF73E8];
  if ((objc_msgSend(v11, "safeBoolForKey:", CFSTR("_checked")) & 1) != 0)
    v13 |= *MEMORY[0x24BDF7400];
  v4 = v13;
  objc_storeStrong(&v11, 0);
  return v4;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v3;
  BOOL v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  char v11;
  id v12[2];
  _UIAlertControllerActionViewAccessibility *v13;
  char v14;

  v13 = self;
  v12[1] = (id)a2;
  v2 = (id)-[_UIAlertControllerActionViewAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v8 = v2 == 0;

  if (v8)
  {
    v11 = 0;
    objc_opt_class();
    v6 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("action"));
    v10 = (id)__UIAccessibilityCastAsClass();

    v9 = v10;
    objc_storeStrong(&v10, 0);
    v12[0] = v9;
    v3 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("_contentViewController"));
    v5 = v3 == 0;

    v14 = v5
       && (-[_UIAlertControllerActionViewAccessibility accessibilityElementsHidden](v13, "accessibilityElementsHidden") & 1) == 0;
    objc_storeStrong(v12, 0);
  }
  else
  {
    v7 = (id)-[_UIAlertControllerActionViewAccessibility isAccessibilityUserDefinedElement](v13, "isAccessibilityUserDefinedElement");
    v14 = objc_msgSend(v7, "BOOLValue") & 1;

  }
  return v14 & 1;
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  int v12;
  id v13[2];
  _UIAlertControllerActionViewAccessibility *v14;
  id v15;

  v14 = self;
  v13[1] = (id)a2;
  v2 = (id)-[_UIAlertControllerActionViewAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v10 = v2 == 0;

  if (v10)
  {
    v9 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("action"));
    v13[0] = (id)objc_msgSend(v9, "accessibilityLabel");

    if (objc_msgSend(v13[0], "length"))
    {
      v15 = v13[0];
      v12 = 1;
    }
    else
    {
      v8 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("label"));
      v11 = (id)objc_msgSend(v8, "accessibilityLabel");

      if ((-[_UIAlertControllerActionViewAccessibility safeBoolForKey:](v14, "safeBoolForKey:", CFSTR("_hasDescriptiveText")) & 1) != 0)
      {
        v7 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_descriptiveLabel"));
        v6 = (id)objc_msgSend(v7, "accessibilityLabel");
        v3 = (id)__UIAXStringForVariables();
        v4 = v11;
        v11 = v3;

      }
      v15 = v11;
      v12 = 1;
      objc_storeStrong(&v11, 0);
    }
    objc_storeStrong(v13, 0);
  }
  else
  {
    v15 = (id)-[_UIAlertControllerActionViewAccessibility accessibilityUserDefinedLabel](v14, "accessibilityUserDefinedLabel");
  }
  return v15;
}

- (id)accessibilityLocalizedStringTableName
{
  return (id)-[_UIAlertControllerActionViewAccessibility _accessibilityRetrieveLocalizedStringTableName](self, "_accessibilityRetrieveLocalizedStringTableName", a2, self);
}

- (id)accessibilityLanguage
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UIAlertControllerActionViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  location[0] = (id)objc_msgSend(v3, "accessibilityLanguage");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIAlertControllerActionViewAccessibility;
    v8 = -[_UIAlertControllerActionViewAccessibility accessibilityLanguage](&v4, sel_accessibilityLanguage);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)accessibilityIdentifier
{
  id v3;
  objc_super v4;
  int v5;
  id location[2];
  _UIAlertControllerActionViewAccessibility *v7;
  id v8;

  v7 = self;
  location[1] = (id)a2;
  v3 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  location[0] = (id)objc_msgSend(v3, "accessibilityIdentifier");

  if (objc_msgSend(location[0], "length"))
  {
    v8 = location[0];
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)_UIAlertControllerActionViewAccessibility;
    v8 = -[_UIAlertControllerActionViewAccessibility accessibilityIdentifier](&v4, sel_accessibilityIdentifier);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8;
}

- (BOOL)_accessibilityUserTestingIsDefaultButton
{
  id v3;
  BOOL v4;

  v3 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("style")) == 0;

  return v4;
}

- (BOOL)_accessibilityUserTestingIsCancelButton
{
  id v3;
  BOOL v4;

  v3 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("style")) == 1;

  return v4;
}

- (BOOL)_accessibilityUserTestingIsDestructiveButton
{
  id v3;
  BOOL v4;

  v3 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("style")) == 2;

  return v4;
}

- (BOOL)_accessibilityUserTestingIsPreferredButton
{
  id v3;
  char v4;

  v3 = (id)-[_UIAlertControllerActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("_isPreferred"));

  return v4 & 1;
}

@end
