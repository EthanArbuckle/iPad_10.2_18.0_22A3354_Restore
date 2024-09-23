@implementation UINavigationBarAccessibility_UIViewAccessibilityAdditions

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_accessibilityNavigationViewInfo
{
  return objc_getAssociatedObject(self, &__UINavigationBarAccessibility_UIViewAccessibilityAdditions___accessibilityNavigationViewInfo);
}

- (void)_accessibilitySetNavigationViewInfo:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityIsNavigationView
{
  id v1;
  BOOL v3;

  if (a1)
  {
    v1 = (id)objc_msgSend(a1, "_accessibilityNavigationViewInfo");
    v3 = v1 != 0;

  }
  else
  {
    return 0;
  }
  return v3;
}

- (id)_accessibilityAXAttributedLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  BOOL v14;
  objc_super v15;
  id location;
  id v17;
  int v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v28;
  id v29;

  v28 = self;
  v27[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
    goto LABEL_31;
  v27[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v28, "_accessibilityNavigationViewInfo");
  v25 = 0;
  v23 = 0;
  v21 = 0;
  v19 = 0;
  v14 = 0;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsTitleElement](v28, "_accessibilityIsTitleElement"))
  {
    v26 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v27[0]);
    v25 = 1;
    v24 = (id)objc_msgSend(v26, "_accessibilityAXAttributedLabel");
    v23 = 1;
    v14 = 0;
    if (v24)
    {
      v22 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v27[0]);
      v21 = 1;
      v20 = (id)objc_msgSend(v22, "titleView");
      v19 = 1;
      v14 = v20 == 0;
    }
  }
  if ((v19 & 1) != 0)

  if ((v21 & 1) != 0)
  if ((v23 & 1) != 0)

  if ((v25 & 1) != 0)
  if (v14)
  {
    v13 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v27[0]);
    v29 = (id)objc_msgSend(v13, "_accessibilityAXAttributedLabel");

    v18 = 1;
  }
  else
  {
    v17 = (id)-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:](v28, "_accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:", sel_accessibilityLabel, sel_accessibilityAttributedLabel);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", v17);
      v18 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v17;
        v18 = 1;
      }
      else
      {
        v2 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)v27[0]);
        v12 = v2 == 0;

        if (v12)
        {
          v3 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v27[0]);
          v9 = v3 == 0;

          if (v9)
            goto LABEL_28;
          location = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v27[0]);
          v4 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
          v8 = v4 == 0;

          if (v8)
          {
            v5 = (id)objc_msgSend(location, "title");
            v7 = v5 == 0;

            if (v7)
            {
              v18 = 0;
            }
            else
            {
              v29 = (id)objc_msgSend(location, "title");
              v18 = 1;
            }
          }
          else
          {
            v29 = (id)objc_msgSend(location, "_accessibilityAXAttributedLabel");
            v18 = 1;
          }
          objc_storeStrong(&location, 0);
          if (!v18)
LABEL_28:
            v18 = 0;
        }
        else
        {
          v11 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v28, "_accessibilityNavigationViewInfo");
          v10 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)v11);
          v29 = (id)-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:](v28, "_accessibilityComputedLabelForNavigationBarWithAssociatedBarButtonItem:");

          v18 = 1;
        }
      }
    }
    objc_storeStrong(&v17, 0);
  }
  objc_storeStrong(v27, 0);
  if (!v18)
  {
LABEL_31:
    v15.receiver = v28;
    v15.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v29 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityAXAttributedLabel](&v15, sel__accessibilityAXAttributedLabel);
  }
  return v29;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  id v3;
  unint64_t v4;
  id v6;
  id v7;
  char v8;
  BOOL v9;
  id v10;
  BOOL v11;
  BOOL v12;
  objc_super v13;
  objc_super v14;
  id location;
  id v16;
  uint64_t v17;
  id v18[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v19;
  unint64_t v20;

  v19 = self;
  v18[1] = (id)a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v18[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v19, "_accessibilityNavigationViewInfo");
    v17 = 0;
    v2 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)v18[0]);
    v12 = v2 == 0;

    if (v12)
    {
      v16 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v18[0]);
      v10 = (id)objc_msgSend(v16, "title");
      v11 = objc_msgSend(v10, "length") == 0;

      if (v11)
      {
        v3 = (id)objc_msgSend(v16, "titleView");
        v9 = v3 == 0;

        if (!v9)
        {
          location = (id)objc_msgSend(v16, "titleView");
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 |= *MEMORY[0x24BDF73B0];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = *MEMORY[0x24BDF73C8];
              v7 = (id)objc_msgSend(location, "gestureRecognizers");
              v8 = 1;
              if (!objc_msgSend(v7, "count"))
                v8 = objc_msgSend(location, "isUserInteractionEnabled");

              if ((v8 & 1) != 0)
                v17 |= *MEMORY[0x24BDF73B0];
            }
            else
            {
              v6 = location;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v17 |= *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0];
            }
          }
          objc_storeStrong(&location, 0);
        }
      }
      else
      {
        v17 |= *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF73C0];
      }
      objc_storeStrong(&v16, 0);
    }
    else
    {
      v17 |= *MEMORY[0x24BDF73B0];
    }
    v14.receiver = v19;
    v14.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v4 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions accessibilityTraits](&v14, sel_accessibilityTraits, v6);
    v20 = v4 | v17;
    objc_storeStrong(v18, 0);
  }
  else
  {
    v13.receiver = v19;
    v13.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    return -[UINavigationBarAccessibility_UIViewAccessibilityAdditions accessibilityTraits](&v13, sel_accessibilityTraits);
  }
  return v20;
}

- (BOOL)isAccessibilityElement
{
  id v3;
  char v4;
  char v5;
  id v6;
  char v7;
  char v8;
  id v9;
  objc_super v10;
  int v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  id location;
  id v17;
  id v18[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v19;
  char v20;

  v19 = self;
  v18[1] = (id)a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v18[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v19, "_accessibilityNavigationViewInfo");
    v9 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v18[0]);
    v17 = (id)objc_msgSend(v9, "titleView");

    if (v17)
    {
      location = (id)objc_msgSend(v17, "safeArrayForKey:", CFSTR("gestureRecognizers"));
      v15 = objc_msgSend(location, "count");
      v6 = (id)objc_msgSend(v17, "isAccessibilityUserDefinedElement");
      v7 = objc_msgSend(v6, "BOOLValue");

      v14 = v7 & 1;
      v13 = objc_msgSend(v17, "safeBoolForKey:", CFSTR("userInteractionEnabled")) & 1;
      v12 = 0;
      objc_opt_class();
      v8 = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (v8 = 1, (v14 & 1) == 0))
        {
          if ((objc_msgSend(v17, "safeBoolForKey:", CFSTR("isUserInteractionEnabled")) & 1) == 0
            || (v8 = 1, (v14 & 1) == 0))
          {
            if (!v15 || (v8 = 1, (v14 & 1) == 0))
            {
              v5 = 0;
              if ((v13 & 1) != 0)
                v5 = v14;
              v8 = v5;
            }
          }
        }
      }
      v12 = v8;
      v20 = v8 & 1;
      v11 = 1;
      objc_storeStrong(&location, 0);
    }
    else
    {
      v3 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityAXAttributedLabel](v19, "_accessibilityAXAttributedLabel");
      v4 = 0;
      if (objc_msgSend(v3, "length"))
        v4 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityViewIsVisible](v19, "_accessibilityViewIsVisible");
      v20 = v4 & 1;

      v11 = 1;
    }
    objc_storeStrong(&v17, 0);
    objc_storeStrong(v18, 0);
  }
  else
  {
    v10.receiver = v19;
    v10.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v20 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions isAccessibilityElement](&v10, sel_isAccessibilityElement);
  }
  return v20 & 1;
}

- (BOOL)accessibilityActivate
{
  id v2;
  id v4;
  id v5;
  BOOL v6;
  objc_super v7;
  int v8;
  id location[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
    goto LABEL_6;
  location[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v10, "_accessibilityNavigationViewInfo");
  v2 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)location[0]);
  v6 = v2 == 0;

  if (v6)
  {
    v8 = 0;
  }
  else
  {
    v5 = -[_UIAccessibilityNavigationViewInfo navigationBar]((uint64_t)location[0]);
    v4 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)location[0]);
    objc_msgSend(v5, "_accessibility_triggerBarButtonItem:");

    v11 = 1;
    v8 = 1;
  }
  objc_storeStrong(location, 0);
  if (!v8)
  {
LABEL_6:
    v7.receiver = v10;
    v7.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v11 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions accessibilityActivate](&v7, sel_accessibilityActivate);
  }
  return v11 & 1;
}

- (BOOL)__accessibilitySupportsActivateAction
{
  objc_class *v2;
  id v4;
  objc_super v5;
  char v6;
  SEL v7;
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v8;
  BOOL v9;
  id location;
  dispatch_once_t *v11;

  v8 = self;
  v7 = a2;
  v11 = (dispatch_once_t *)&__accessibilitySupportsActivateAction_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_365);
  if (*v11 != -1)
    dispatch_once(v11, location);
  objc_storeStrong(&location, 0);
  v6 = 0;
  v5.receiver = v8;
  v5.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
  v6 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions __accessibilitySupportsActivateAction](&v5, sel___accessibilitySupportsActivateAction);
  if (v6)
  {
    v4 = (id)-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityGetBlockForAttribute:](v8, "_accessibilityGetBlockForAttribute:", 17);
    v2 = (objc_class *)objc_opt_class();
    v9 = class_getInstanceMethod(v2, sel_accessibilityActivate) != (Method)__accessibilitySupportsActivateAction_categoryMethod
      || v4
      || -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](v8);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    return 0;
  }
  return v9;
}

- (BOOL)_accessibilityUIViewCanPerformEscapeAction
{
  int v3;
  id location[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v5;
  char v6;

  v5 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)
    || ((location[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v5, "_accessibilityNavigationViewInfo"), (-[_UIAccessibilityNavigationViewInfo isCancelItem]((uint64_t)location[0]) & 1) == 0)? (v3 = 0): (v6 = 1, v3 = 1), objc_storeStrong(location, 0), !v3))
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  objc_super v3;
  int v4;
  id location[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v6;
  char v7;

  v6 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self)
    || ((location[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v6, "_accessibilityNavigationViewInfo"), (-[_UIAccessibilityNavigationViewInfo isCancelItem]((uint64_t)location[0]) & 1) == 0)? (v4 = 0): (v7 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions accessibilityActivate](v6, "accessibilityActivate"), v4 = 1), objc_storeStrong(location, 0), !v4))
  {
    v3.receiver = v6;
    v3.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v7 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions accessibilityPerformEscape](&v3, sel_accessibilityPerformEscape);
  }
  return v7 & 1;
}

- (BOOL)_accessibilityIsTitleElement
{
  id v3;
  BOOL v4;
  objc_super v5;
  int v6;
  char v7;
  id v8;
  id location[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  if (!-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
    goto LABEL_10;
  location[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v10, "_accessibilityNavigationViewInfo");
  v3 = -[_UIAccessibilityNavigationViewInfo barButtonItem]((uint64_t)location[0]);
  v7 = 0;
  v4 = 0;
  if (!v3)
  {
    v8 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)location[0]);
    v7 = 1;
    v4 = v8 != 0;
  }
  if ((v7 & 1) != 0)

  if (v4)
  {
    v11 = 1;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(location, 0);
  if (!v6)
  {
LABEL_10:
    v5.receiver = v10;
    v5.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v11 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsTitleElement](&v5, sel__accessibilityIsTitleElement);
  }
  return v11 & 1;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  BOOL v3;
  objc_super v4;
  char v5;
  id v6;
  SEL v7;
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v8;
  BOOL v9;

  v8 = self;
  v7 = a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v5 = 0;
    v3 = 0;
    if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsTitleElement](v8, "_accessibilityIsTitleElement"))
    {
      v6 = (id)-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityAncestorIsKindOf:](v8, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("_UIPopoverView")));
      v5 = 1;
      v3 = v6 != 0;
    }
    v9 = v3;
    if ((v5 & 1) != 0)

  }
  else
  {
    v4.receiver = v8;
    v4.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    return -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityServesAsFirstElement](&v4, sel__accessibilityServesAsFirstElement);
  }
  return v9;
}

- (id)accessibilityLanguage
{
  objc_super v3;
  id v4;
  id v5[2];
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v6;
  id v7;

  v6 = self;
  v5[1] = (id)a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v5[0] = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v6, "_accessibilityNavigationViewInfo");
    v4 = -[_UIAccessibilityNavigationViewInfo navigationItem]((uint64_t)v5[0]);
    v7 = (id)objc_msgSend(v4, "accessibilityLanguage");
    objc_storeStrong(&v4, 0);
    objc_storeStrong(v5, 0);
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    v7 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions accessibilityLanguage](&v3, sel_accessibilityLanguage);
  }
  return v7;
}

- (BOOL)_accessibilityUserTestingIsRightNavButton
{
  id v3;
  objc_super v4;
  SEL v5;
  UINavigationBarAccessibility_UIViewAccessibilityAdditions *v6;
  BOOL v7;

  v6 = self;
  v5 = a2;
  if (-[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityIsNavigationView](self))
  {
    v3 = -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityNavigationViewInfo](v6, "_accessibilityNavigationViewInfo");
    v7 = -[_UIAccessibilityNavigationViewInfo isRightItem]((uint64_t)v3) & 1;

  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UINavigationBarAccessibility_UIViewAccessibilityAdditions;
    return -[UINavigationBarAccessibility_UIViewAccessibilityAdditions _accessibilityUserTestingIsRightNavButton](&v4, sel__accessibilityUserTestingIsRightNavButton);
  }
  return v7;
}

@end
