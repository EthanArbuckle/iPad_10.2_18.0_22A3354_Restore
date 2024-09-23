@implementation UIView(AutomationAccessibility)

- (uint64_t)_accessibilityUserTestingIsDefaultButton
{
  id v1;
  BOOL v3;
  char v5;

  v1 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIsDefaultButton"));
  v3 = v1 == 0;

  if (v3)
    v5 = -[UIView _accessibilityUserTestingIsTypeOfButton:](a1, CFSTR("default"));
  else
    v5 = objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXIsDefaultButton")) & 1;
  return v5 & 1;
}

- (uint64_t)_accessibilitySetUserTestingIsDefaultButton:()AutomationAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3 & 1, CFSTR("AXIsDefaultButton"));
}

- (uint64_t)_accessibilitySetUserTestingIsCancelButton:()AutomationAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3 & 1, CFSTR("AXIsCancelButton"));
}

- (uint64_t)_accessibilityUserTestingIsCancelButton
{
  id v1;
  BOOL v3;
  char v5;

  v1 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIsCancelButton"));
  v3 = v1 == 0;

  if (v3)
    v5 = -[UIView _accessibilityUserTestingIsTypeOfButton:](a1, CFSTR("cancel"));
  else
    v5 = objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXIsCancelButton")) & 1;
  return v5 & 1;
}

- (uint64_t)_accessibilityUserTestingIsDestructiveButton
{
  id v2;
  BOOL v4;
  objc_super v5;
  uint64_t v6;
  id v7;
  char v8;

  v7 = a1;
  v6 = a2;
  v2 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIsDestructiveButton"));
  v4 = v2 == 0;

  if (v4)
  {
    v5.receiver = v7;
    v5.super_class = (Class)&off_255EC6948;
    v8 = objc_msgSendSuper2(&v5, sel__accessibilityUserTestingIsDestructiveButton) & 1;
  }
  else
  {
    v8 = objc_msgSend(v7, "_accessibilityBoolValueForKey:", CFSTR("AXIsDestructiveButton")) & 1;
  }
  return v8 & 1;
}

- (uint64_t)_accessibilitySetUserTestingIsDestructiveButton:()AutomationAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3 & 1, CFSTR("AXIsDestructiveButton"));
}

- (uint64_t)_accessibilityUserTestingIsPreferredButton
{
  id v2;
  BOOL v4;
  objc_super v5;
  uint64_t v6;
  id v7;
  char v8;

  v7 = a1;
  v6 = a2;
  v2 = (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIsPreferredButton"));
  v4 = v2 == 0;

  if (v4)
  {
    v5.receiver = v7;
    v5.super_class = (Class)&off_255EC6948;
    v8 = objc_msgSendSuper2(&v5, sel__accessibilityUserTestingIsPreferredButton) & 1;
  }
  else
  {
    v8 = objc_msgSend(v7, "_accessibilityBoolValueForKey:", CFSTR("AXIsPreferredButton")) & 1;
  }
  return v8 & 1;
}

- (uint64_t)_accessibilitySetUserTestingIsPreferredButton:()AutomationAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3 & 1, CFSTR("AXIsPreferredButton"));
}

- (uint64_t)_accessibilityUserTestingIsBackNavButton
{
  id v2;
  id v3;
  id v4;
  char v6;
  char v7;
  id v8;
  char isKindOfClass;
  id v10;
  objc_super v11;
  char v12;
  id v13;
  char v14;
  id v15;
  id location;
  int v17;
  id v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  char v24;

  v23 = a1;
  v22 = a2;
  if ((objc_msgSend(a1, "isAccessibilityElement") & 1) != 0
    && (objc_msgSend(v23, "_accessibilityViewIsVisible") & 1) != 0)
  {
    if ((objc_msgSend(v23, "_accessibilityIsFrameOutOfBounds") & 1) != 0)
    {
      v24 = 0;
    }
    else
    {
      NSClassFromString(CFSTR("_UINavigationItemView"));
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (NSClassFromString(CFSTR("UINavigationItemView")), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = (id)objc_msgSend(v23, "safeValueForKey:", CFSTR("_item"));
        v2 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("_backButtonView"));
        v24 = v23 == v2;

      }
      else
      {
        NSClassFromString(CFSTR("UINavigationButton"));
        v20 = 0;
        isKindOfClass = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = (id)objc_msgSend(v23, "superview");
          v20 = 1;
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
        }
        if ((v20 & 1) != 0)

        if ((isKindOfClass & 1) != 0)
        {
          v8 = (id)objc_msgSend(v23, "superview");
          v19 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_visualProvider"));

          v18 = 0;
          NSClassFromString(CFSTR("_UINavigationBarVisualProviderLegacyIOS"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v3 = (id)objc_msgSend(v19, "safeValueForKey:", CFSTR("_leftViews"));
            v4 = v18;
            v18 = v3;

          }
          if (v18)
          {
            location = (id)objc_msgSend(v23, "_accessibilityAncestorIsKindOf:", objc_opt_class());
            v14 = 0;
            v12 = 0;
            v7 = 0;
            if (objc_msgSend(v18, "indexOfObjectIdenticalTo:", v23) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = (id)objc_msgSend(location, "currentBackButton");
              v14 = 1;
              v6 = 1;
              if (v15 != v23)
              {
                v13 = (id)objc_msgSend(location, "topItem");
                v12 = 1;
                v6 = objc_msgSend(v13, "leftItemsSupplementBackButton");
              }
              v7 = v6;
            }
            v24 = v7 & 1;
            if ((v12 & 1) != 0)

            if ((v14 & 1) != 0)
            v17 = 1;
            objc_storeStrong(&location, 0);
          }
          else
          {
            v24 = 0;
            v17 = 1;
          }
          objc_storeStrong(&v18, 0);
          objc_storeStrong(&v19, 0);
        }
        else
        {
          v11.receiver = v23;
          v11.super_class = (Class)&off_255EC6948;
          v24 = objc_msgSendSuper2(&v11, sel__accessibilityUserTestingIsBackNavButton) & 1;
        }
      }
    }
  }
  else
  {
    v24 = 0;
  }
  return v24 & 1;
}

- (uint64_t)_accessibilityUserTestingIsRightNavButton
{
  return 0;
}

@end
