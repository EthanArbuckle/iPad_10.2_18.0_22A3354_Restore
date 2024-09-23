@implementation _UIButtonBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIButtonBarButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id obj;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIButtonBarButton");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIButtonBarButton"), CFSTR("UIControl"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIButtonBarButton"), CFSTR("_visualProvider"), "_UIButtonBarButtonVisualProvider");
  v3 = CFSTR("_UIButtonBarButtonVisualProviderIOS");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIButtonBarButtonVisualProviderIOS"), CFSTR("_barButtonItem"), "UIBarButtonItem");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIButtonBarButtonVisualProviderIOS"), CFSTR("backIndicatorView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_backButton"), "B");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("visualProvider"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIButtonBarButtonVisualProvider"), CFSTR("contentView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("imageView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageView"), CFSTR("image"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImage"), CFSTR("imageAsset"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationBarAccessibility"), CFSTR("_accessibilityFauxBackButton"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIAccessibilityBackButtonElement"), CFSTR("associatedViews"), v5, 0);
  objc_storeStrong(v7, obj);
}

- (unint64_t)_accessibilityAutomationType
{
  return 9;
}

- (uint64_t)_axIsInvisibleButton
{
  id v2;
  id v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  char v8;

  v7[1] = a1;
  if (a1)
  {
    v6 = 0;
    objc_opt_class();
    v5 = (id)__UIAccessibilityCastAsClass();
    v4 = v5;
    objc_storeStrong(&v5, 0);
    v7[0] = v4;
    v3 = (id)objc_msgSend(v4, "tintColor");
    v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v8 = objc_msgSend(v3, "isEqual:") & 1;

    objc_storeStrong(v7, 0);
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

- (BOOL)_accessibilityElementHasImage
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  char v3;
  objc_super v4;
  id location;
  char v6;
  SEL v7;
  _UIButtonBarButtonAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 1;
  v4.receiver = self;
  v4.super_class = (Class)_UIButtonBarButtonAccessibility;
  location = -[_UIButtonBarButtonAccessibility isAccessibilityUserDefinedElement](&v4, sel_isAccessibilityUserDefinedElement);
  if (location)
    v6 = objc_msgSend(location, "BOOLValue") & 1;
  v3 = v6;
  objc_storeStrong(&location, 0);
  return v3 & 1;
}

- (BOOL)accessibilityElementsHidden
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  _UIButtonBarButtonAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIButtonBarButtonAccessibility;
  v4 = -[_UIButtonBarButtonAccessibility accessibilityElementsHidden](&v3, sel_accessibilityElementsHidden);
  if (!v4)
    return -[_UIButtonBarButtonAccessibility _axIsInvisibleButton](v6) & 1;
  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  char v3;
  char v4;
  id v5;
  char v6;
  id v7;
  objc_super v8;
  unint64_t v9;
  SEL v10;
  _UIButtonBarButtonAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v8.receiver = self;
  v8.super_class = (Class)_UIButtonBarButtonAccessibility;
  v9 = -[_UIButtonBarButtonAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  v6 = 0;
  v4 = 0;
  v3 = 1;
  if ((-[_UIButtonBarButtonAccessibility safeBoolForKey:](v11, "safeBoolForKey:", CFSTR("_backButton")) & 1) == 0)
  {
    v7 = (id)-[_UIButtonBarButtonAccessibility safeValueForKey:](v11, "safeValueForKey:", CFSTR("_visualProvider"));
    v6 = 1;
    v5 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("backIndicatorView"));
    v4 = 1;
    v3 = objc_msgSend(v5, "_accessibilityViewIsVisible");
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if ((v3 & 1) != 0)
    v9 |= *MEMORY[0x24BEBB100];
  else
    v9 |= *MEMORY[0x24BDF73B0];
  return v9;
}

- (id)accessibilityIdentifier
{
  uint64_t v2;
  objc_super v4;
  id location[2];
  _UIButtonBarButtonAccessibility *v6;
  __CFString *v7;

  v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIButtonBarButtonAccessibility;
  location[0] = -[_UIButtonBarButtonAccessibility accessibilityIdentifier](&v4, sel_accessibilityIdentifier);
  if (location[0])
  {
    v7 = (__CFString *)location[0];
  }
  else
  {
    v2 = -[_UIButtonBarButtonAccessibility accessibilityTraits](v6, "accessibilityTraits");
    if ((v2 & *MEMORY[0x24BEBB100]) == *MEMORY[0x24BEBB100])
      v7 = CFSTR("BackButton");
    else
      v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
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
  id v10;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  uint64_t v21;
  char v22;
  char v23;
  id v24;
  id v25;
  id v26;
  id location;
  objc_super v28;
  int v29;
  objc_super v30;
  id v31[2];
  _UIButtonBarButtonAccessibility *v32;
  id v33;

  v32 = self;
  v31[1] = (id)a2;
  v30.receiver = self;
  v30.super_class = (Class)_UIButtonBarButtonAccessibility;
  v31[0] = -[_UIButtonBarButtonAccessibility accessibilityUserDefinedLabel](&v30, sel_accessibilityUserDefinedLabel);
  if (!objc_msgSend(v31[0], "length"))
  {
    v28.receiver = v32;
    v28.super_class = (Class)_UIButtonBarButtonAccessibility;
    v2 = -[_UIButtonBarButtonAccessibility accessibilityLabel](&v28, sel_accessibilityLabel);
    v3 = v31[0];
    v31[0] = v2;

    location = 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v31[0], "hasAttribute:", *MEMORY[0x24BDFEB80]) & 1) != 0)
    {
      objc_storeStrong(&location, v31[0]);
      objc_storeStrong(v31, 0);
    }
    v15 = (id)-[_UIButtonBarButtonAccessibility safeValueForKey:](v32, "safeValueForKey:", CFSTR("_visualProvider"));
    v26 = (id)objc_msgSend(v15, "safeValueForKey:", CFSTR("_titleButton"));

    v23 = 0;
    if (v26)
    {
      v24 = (id)objc_msgSend(v26, "accessibilityLabel");
      v23 = 1;
      v4 = v24;
    }
    else
    {
      v4 = 0;
    }
    v25 = v4;
    if ((v23 & 1) != 0)

    if (v25 && objc_msgSend(v25, "length"))
    {
      objc_storeStrong(v31, v25);
    }
    else if (objc_msgSend(v31[0], "length"))
    {
      v33 = v31[0];
      v29 = 1;
LABEL_29:
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
      objc_storeStrong(&location, 0);
      goto LABEL_30;
    }
    if (!objc_msgSend(v31[0], "length"))
    {
      v22 = 0;
      v13 = (id)-[_UIButtonBarButtonAccessibility safeValueForKey:](v32, "safeValueForKey:", CFSTR("tag"));
      v14 = objc_msgSend(v13, "integerValue");

      v21 = v14;
      if (v14)
      {
        v22 = 1;
      }
      else
      {
        v20 = (id)-[_UIButtonBarButtonAccessibility accessibilityIdentification](v32, "accessibilityIdentification");
        if (objc_msgSend(v20, "length"))
        {
          v21 = objc_msgSend(v20, "integerValue");
          v22 = 1;
        }
        objc_storeStrong(&v20, 0);
      }
      if ((v22 & 1) != 0)
      {
        v5 = (id)objc_msgSend(MEMORY[0x24BDF6F90], "_accessibilityTitleForSystemTag:", v21);
        v6 = v31[0];
        v31[0] = v5;

      }
    }
    if (objc_msgSend(location, "length"))
    {
      v7 = (id)AXSSAccessibilityDescriptionForSymbolName();
      v8 = v31[0];
      v31[0] = v7;

    }
    if (!v31[0])
    {
      v18 = 0;
      objc_opt_class();
      v12 = (id)-[_UIButtonBarButtonAccessibility safeValueForKeyPath:](v32, "safeValueForKeyPath:", CFSTR("_visualProvider._barButtonItem"));
      v17 = (id)__UIAccessibilityCastAsClass();

      v16 = v17;
      objc_storeStrong(&v17, 0);
      v19 = v16;
      v9 = (id)objc_msgSend(v16, "accessibilityLabel");
      v10 = v31[0];
      v31[0] = v9;

      objc_storeStrong(&v19, 0);
    }
    v33 = v31[0];
    v29 = 1;
    goto LABEL_29;
  }
  v33 = v31[0];
  v29 = 1;
LABEL_30:
  objc_storeStrong(v31, 0);
  return v33;
}

- (id)accessibilityPath
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v11;
  BOOL v12;
  objc_super v13;
  int v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  id location[2];
  _UIButtonBarButtonAccessibility *v20;
  id v21;
  CGRect v22;

  v20 = self;
  location[1] = (id)a2;
  location[0] = (id)-[_UIButtonBarButtonAccessibility _accessibilityDescendantOfType:](self, "_accessibilityDescendantOfType:", objc_opt_class());
  v11 = (id)objc_msgSend(location[0], "accessibilityLabel");
  v12 = objc_msgSend(v11, "length") == 0;

  if (v12)
  {
    v13.receiver = v20;
    v13.super_class = (Class)_UIButtonBarButtonAccessibility;
    v21 = -[_UIButtonBarButtonAccessibility accessibilityPath](&v13, sel_accessibilityPath);
  }
  else
  {
    objc_msgSend(location[0], "accessibilityFrame");
    v18.origin.x = v2;
    v18.origin.y = v3;
    v18.size.width = v4;
    v18.size.height = v5;
    -[_UIButtonBarButtonAccessibility accessibilityFrame](v20, "accessibilityFrame");
    v17.origin.x = v6;
    v17.origin.y = v7;
    v17.size.width = v8;
    v17.size.height = v9;
    v16 = CGRectInset(v18, -10.0, 0.0);
    v18 = v16;
    v22 = CGRectUnion(v17, v16);
    v15 = v22;
    v17 = v22;
    v21 = (id)objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, 8.0);
  }
  v14 = 1;
  objc_storeStrong(location, 0);
  return v21;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v3;
  char v4;
  objc_super v5;
  int v6;
  id location;
  id v8[2];
  _UIButtonBarButtonAccessibility *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = (id)-[_UIButtonBarButtonAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  location = (id)objc_msgSend(v8[0], "safeValueForKey:", CFSTR("_accessibilityFauxBackButton"));
  v3 = (id)objc_msgSend(location, "safeArrayForKey:", CFSTR("associatedViews"));
  v4 = objc_msgSend(v3, "containsObject:", v9);

  if ((v4 & 1) != 0)
  {
    v10 = location;
  }
  else
  {
    v5.receiver = v9;
    v5.super_class = (Class)_UIButtonBarButtonAccessibility;
    v10 = -[_UIButtonBarButtonAccessibility _accessibilityNativeFocusPreferredElement](&v5, sel__accessibilityNativeFocusPreferredElement);
  }
  v6 = 1;
  objc_storeStrong(&location, 0);
  objc_storeStrong(v8, 0);
  return v10;
}

@end
