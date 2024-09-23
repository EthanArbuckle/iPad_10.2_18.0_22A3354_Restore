@implementation _UIContextMenuCellContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIContextMenuCellContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityStoredLabelFromMenuElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredLabelFromMenuElement);
  else
    return 0;
}

- (void)_accessibilitySetStoredLabelFromMenuElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredValueFromMenuElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredValueFromMenuElement);
  else
    return 0;
}

- (void)_accessibilitySetStoredValueFromMenuElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredHintFromMenuElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredHintFromMenuElement);
  else
    return 0;
}

- (void)_accessibilitySetStoredHintFromMenuElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredIdentifierFromMenuElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredIdentifierFromMenuElement);
  else
    return 0;
}

- (void)_accessibilitySetStoredIdentifierFromMenuElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredTraitsFromMenuElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredTraitsFromMenuElement);
  else
    return 0;
}

- (void)_accessibilitySetStoredTraitsFromMenuElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityStoredUserInputLabelsFromMenuElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &___UIContextMenuCellContentViewAccessibility___accessibilityStoredUserInputLabelsFromMenuElement);
  else
    return 0;
}

- (void)_accessibilitySetStoredUserInputLabelsFromMenuElement:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(&location, 0);
}

- (uint64_t)_accessibilityStoredElementsHidden
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_accessibilitySetStoredElementsHidden:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
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
  v4 = CFSTR("_UIContextMenuCellContentView");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("subtitleLabel"), v5, 0);
  v3 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("options"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_updateForOptionsChangeFromPreviousOptions:"), "v", v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("iconImageView"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  id location;
  uint64_t v5;
  unint64_t v6;
  SEL v7;
  _UIContextMenuCellContentViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v6 = *MEMORY[0x24BDF73B0];
  v5 = -[_UIContextMenuCellContentViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("options"));
  if ((v5 & 4) == 4)
    v6 |= *MEMORY[0x24BDF7400];
  if ((v5 & 1) == 1)
    v6 |= *MEMORY[0x24BDF73E8];
  location = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredTraitsFromMenuElement](v8);
  if (location)
    v6 |= objc_msgSend(location, "unsignedLongLongValue");
  v3 = v6;
  objc_storeStrong(&location, 0);
  return v3;
}

- (int64_t)_accessibilityExpandedStatus
{
  int64_t v2;
  char v4;

  v4 = -[_UIContextMenuCellContentViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("options"), 0, a2, self);
  if ((v4 & 0x10) == 0)
    return 0;
  v2 = 2;
  if ((v4 & 0x40) != 0)
    return 1;
  return v2;
}

- (id)accessibilityLabel
{
  id v3;
  objc_super v4;
  id location;
  id v6;
  int v7;
  id v8[2];
  _UIContextMenuCellContentViewAccessibility *v9;
  id v10;

  v9 = self;
  v8[1] = (id)a2;
  v8[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredLabelFromMenuElement](self);
  if (objc_msgSend(v8[0], "length"))
  {
    v10 = v8[0];
    v7 = 1;
  }
  else
  {
    v6 = (id)-[_UIContextMenuCellContentViewAccessibility _accessibilityStringForLabelKeyValues:](v9, "_accessibilityStringForLabelKeyValues:", CFSTR("titleLabel, subtitleLabel"));
    if (objc_msgSend(v6, "length"))
    {
      v10 = v6;
      v7 = 1;
    }
    else
    {
      v3 = (id)-[_UIContextMenuCellContentViewAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("iconImageView"));
      location = (id)objc_msgSend(v3, "accessibilityLabel");

      if (objc_msgSend(location, "length"))
      {
        v10 = location;
      }
      else
      {
        v4.receiver = v9;
        v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
        v10 = -[_UIContextMenuCellContentViewAccessibility accessibilityLabel](&v4, sel_accessibilityLabel);
      }
      v7 = 1;
      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(v8, 0);
  return v10;
}

- (id)accessibilityValue
{
  objc_super v3;
  int v4;
  id location[2];
  _UIContextMenuCellContentViewAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredValueFromMenuElement](self);
  if (objc_msgSend(location[0], "length"))
  {
    v7 = location[0];
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    v7 = -[_UIContextMenuCellContentViewAccessibility accessibilityValue](&v3, sel_accessibilityValue);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)accessibilityHint
{
  objc_super v3;
  int v4;
  id location[2];
  _UIContextMenuCellContentViewAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredHintFromMenuElement](self);
  if (objc_msgSend(location[0], "length"))
  {
    v7 = location[0];
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    v7 = -[_UIContextMenuCellContentViewAccessibility accessibilityHint](&v3, sel_accessibilityHint);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)accessibilityIdentifier
{
  objc_super v3;
  int v4;
  id location[2];
  _UIContextMenuCellContentViewAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredIdentifierFromMenuElement](self);
  if (objc_msgSend(location[0], "length"))
  {
    v7 = location[0];
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    v7 = -[_UIContextMenuCellContentViewAccessibility accessibilityIdentifier](&v3, sel_accessibilityIdentifier);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (id)accessibilityUserInputLabels
{
  objc_super v3;
  int v4;
  id location[2];
  _UIContextMenuCellContentViewAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredUserInputLabelsFromMenuElement](self);
  if (objc_msgSend(location[0], "count"))
  {
    v7 = location[0];
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
    v7 = -[_UIContextMenuCellContentViewAccessibility accessibilityUserInputLabels](&v3, sel_accessibilityUserInputLabels);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)accessibilityElementsHidden
{
  id v2;
  id v4;
  BOOL v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  _UIContextMenuCellContentViewAccessibility *v9;
  BOOL v10;

  v9 = self;
  v8 = a2;
  v2 = (id)-[_UIContextMenuCellContentViewAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v5 = v2 == 0;

  if (v5)
  {
    v7 = -[_UIContextMenuCellContentViewAccessibility _accessibilityStoredElementsHidden]((uint64_t)v9) & 1;
    if (v7)
    {
      return v7;
    }
    else
    {
      v6.receiver = v9;
      v6.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
      return -[_UIContextMenuCellContentViewAccessibility accessibilityElementsHidden](&v6, sel_accessibilityElementsHidden);
    }
  }
  else
  {
    v4 = (id)-[_UIContextMenuCellContentViewAccessibility storedAccessibilityElementsHidden](v9, "storedAccessibilityElementsHidden");
    v10 = objc_msgSend(v4, "BOOLValue") & 1;

  }
  return v10;
}

- (void)_updateForOptionsChangeFromPreviousOptions:(unint64_t)a3
{
  char v3;
  objc_super v4;
  unint64_t v5;
  SEL v6;
  _UIContextMenuCellContentViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuCellContentViewAccessibility;
  -[_UIContextMenuCellContentViewAccessibility _updateForOptionsChangeFromPreviousOptions:](&v4, sel__updateForOptionsChangeFromPreviousOptions_, a3);
  v3 = -[_UIContextMenuCellContentViewAccessibility safeUnsignedIntegerForKey:](v7, "safeUnsignedIntegerForKey:", CFSTR("options"));
  if ((v5 & 0x40) == 0 && (v3 & 0x40) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
