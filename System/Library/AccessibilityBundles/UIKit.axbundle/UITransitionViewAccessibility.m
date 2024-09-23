@implementation UITransitionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITransitionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axPresentationController
{
  if (a1)
    return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
  else
    return 0;
}

- (void)_axSetPresentationController:(uint64_t)a1
{
  id location;
  uint64_t v3;

  v3 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v3)
    __UIAccessibilitySetAssociatedNonRetainedObject();
  objc_storeStrong(&location, 0);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const __CFString *v9;
  const char *v10;
  id v11;
  id *v12;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v12 = location;
  v11 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UITransitionView");
  v5 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v10 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITransitionView"), CFSTR("_delegate"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIAlertControllerPresentationController"), CFSTR("_dimmingView"), "UIView");
  v6 = CFSTR("UIPresentationController");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UISearchPresentationController"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIDimmingView"), CFSTR("passthroughViews"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIGestureRecognizer"), CFSTR("_targets"), "NSMutableArray");
  v4 = CFSTR("UIGestureRecognizerTarget");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("target"), v10, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_presentationControllerToNotifyOnLayoutSubviews"), v10, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIPageSheetPresentationController"));
  v9 = CFSTR("UISheetPresentationController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = CFSTR("_UISheetLayoutInfo");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_layoutInfo"), v10, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v9, v6);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_shouldDismiss"), "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("delegate"), v10, 0);
  v8 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("_indexOfCurrentActiveDetent"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISheetPresentationControllerDetent"), CFSTR("_type"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v9, CFSTR("_childSheetPresentationController"), v10, 0);
  objc_storeStrong(v12, v11);
}

- (id)_accessibilityRetrieveDelegate
{
  if (a1)
    return (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("delegate"));
  else
    return 0;
}

- (void)_didCompleteTransition:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UITransitionViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UITransitionViewAccessibility;
  -[UITransitionViewAccessibility _didCompleteTransition:](&v3, sel__didCompleteTransition_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (id)_accessibilityDimmingView
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id obj;
  uint64_t v8;
  id location;
  int v10;
  _QWORD __b[8];
  id v12;
  id v13;
  void *v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  if (a1)
  {
    objc_opt_class();
    v6 = (id)__UIAccessibilityCastAsClass();
    v13 = (id)objc_msgSend(v6, "subviews");

    memset(__b, 0, sizeof(__b));
    obj = v13;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
    if (v8)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v8;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v12 = *(id *)(__b[1] + 8 * v4);
        NSClassFromString(CFSTR("UIDimmingView"));
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v12, "_accessibilityViewIsVisible") & 1) != 0)
          break;
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
          if (!v5)
            goto LABEL_12;
        }
      }
      v15 = v12;
      v10 = 1;
    }
    else
    {
LABEL_12:
      v10 = 0;
    }

    if (!v10)
    {
      location = -[UITransitionViewAccessibility _accessibilityRetrieveDelegate](v14);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_dimmingView"));
      else
        v15 = 0;
      v10 = 1;
      objc_storeStrong(&location, 0);
    }
    objc_storeStrong(&v13, 0);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)_accessibilityPresentationController
{
  if (a1)
    return (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("_presentationControllerToNotifyOnLayoutSubviews"));
  else
    return 0;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  uint64_t v23;
  int v24;
  int v25;
  BOOL (*v26)(uint64_t, void *, uint64_t, _BYTE *);
  void *v27;
  UITransitionViewAccessibility *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  id v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  id v37[2];
  UITransitionViewAccessibility *v38;

  v38 = self;
  v37[1] = (id)a2;
  v37[0] = -[UITransitionViewAccessibility _axPresentationController]((uint64_t)self);
  v18 = (id)objc_msgSend(v37[0], "presentingViewController");
  v36 = (id)objc_msgSend(v18, "view");

  v35 = (id)objc_opt_new();
  if (v36)
  {
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v36, "accessibilityFrame");
    *(_QWORD *)&v33 = v2;
    *((_QWORD *)&v33 + 1) = v3;
    *(_QWORD *)&v34 = v4;
    *((_QWORD *)&v34 + 1) = v5;
    v15 = (id)-[UITransitionViewAccessibility superview](v38, "superview");
    v14 = (id)objc_msgSend(v15, "_accessibilitySubviews");
    v13 = (id)objc_msgSend(v14, "reverseObjectEnumerator");
    v32 = (id)objc_msgSend(v13, "allObjects");

    v16 = v32;
    v23 = MEMORY[0x24BDAC760];
    v24 = -1073741824;
    v25 = 0;
    v26 = __73__UITransitionViewAccessibility__accessibilityObscuredScreenAllowedViews__block_invoke;
    v27 = &unk_24FF3FBC0;
    v28 = v38;
    v29 = v36;
    v30 = v33;
    v31 = v34;
    v17 = (id)objc_msgSend(v16, "ax_filteredArrayUsingBlock:", &v23);
    v6 = (void *)objc_msgSend(v17, "mutableCopy");
    v7 = v35;
    v35 = v6;

    objc_storeStrong(&v29, 0);
    objc_storeStrong((id *)&v28, 0);
    objc_storeStrong(&v32, 0);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0;
    objc_opt_class();
    v12 = (id)objc_msgSend(v37[0], "safeValueForKey:", CFSTR("_childSheetPresentationController"));
    v20 = (id)__UIAccessibilityCastAsSafeCategory();

    v19 = v20;
    objc_storeStrong(&v20, 0);
    v22 = v19;
    if (v19 && (objc_msgSend(v22, "_accessibilityPresentationControllerModalizes") & 1) == 0)
    {
      v10 = v35;
      v11 = (id)objc_msgSend(v22, "containerView");
      objc_msgSend(v10, "axSafelyAddObject:");

    }
    objc_storeStrong(&v22, 0);
  }
  v9 = v35;
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v37, 0);
  return v9;
}

BOOL __73__UITransitionViewAccessibility__accessibilityObscuredScreenAllowedViews__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGRect rect2;
  id location[2];
  BOOL v13;

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
  {
    *a4 = 1;
    v13 = 0;
  }
  else if (location[0] != *(id *)(a1 + 40) && (objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1) != 0)
  {
    objc_msgSend(location[0], "accessibilityFrame");
    rect2.origin.x = v4;
    rect2.origin.y = v5;
    rect2.size.width = v6;
    rect2.size.height = v7;
    v13 = !CGRectIntersectsRect(*(CGRect *)(a1 + 48), rect2);
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_accessibilityHitTestingObscuredScreenAllowedViews
{
  id location[2];
  UITransitionViewAccessibility *v4;
  id v5;

  v4 = self;
  location[1] = (id)a2;
  location[0] = -[UITransitionViewAccessibility _accessibilityDimmingView](self);
  NSClassFromString(CFSTR("UIDimmingView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("passthroughViews"));
  else
    v5 = -[UITransitionViewAccessibility _accessibilityObscuredScreenAllowedViews](v4, "_accessibilityObscuredScreenAllowedViews");
  objc_storeStrong(location, 0);
  return v5;
}

- (BOOL)accessibilityViewIsModal
{
  id v2;
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  char v15;
  id v16;
  int v17;
  id v18[2];
  UITransitionViewAccessibility *v19;
  char v20;

  v19 = self;
  v18[1] = (id)a2;
  v18[0] = -[UITransitionViewAccessibility _accessibilityRetrieveDelegate](self);
  NSClassFromString(CFSTR("_UISearchPresentationController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v8 = (id)objc_msgSend(v18[0], "safeValueForKey:", CFSTR("presentedViewController"));
    v7 = (id)__UIAccessibilityCastAsClass();
    v2 = (id)objc_msgSend(v7, "searchResultsController");
    v9 = v2 != 0;

    if (!v9)
    {
      v20 = 0;
      v17 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = 0;
      v17 = 1;
      goto LABEL_21;
    }
    v5 = (id)-[UITransitionViewAccessibility accessibilityIdentifier](v19, "accessibilityIdentifier");
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("UIColorPickerView"));

    if ((v6 & 1) != 0)
    {
      v20 = 1;
      v17 = 1;
      goto LABEL_21;
    }
  }
  v15 = 0;
  objc_opt_class();
  v4 = -[UITransitionViewAccessibility _axPresentationController]((uint64_t)v19);
  v12 = 0;
  if (!v4)
  {
    v13 = -[UITransitionViewAccessibility _accessibilityPresentationController](v19);
    v12 = 1;
  }
  v14 = (id)__UIAccessibilityCastAsSafeCategory();
  if ((v12 & 1) != 0)

  v11 = v14;
  objc_storeStrong(&v14, 0);
  v16 = v11;
  if (!v11 || (objc_msgSend(v16, "_accessibilityPresentationControllerModalizes") & 1) != 0)
  {
    v10 = (id)-[UITransitionViewAccessibility storedAccessibilityViewIsModal](v19, "storedAccessibilityViewIsModal");
    if (v10)
      v20 = objc_msgSend(v10, "BOOLValue") & 1;
    else
      v20 = 1;
    v17 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v20 = 0;
    v17 = 1;
  }
  objc_storeStrong(&v16, 0);
LABEL_21:
  objc_storeStrong(v18, 0);
  return v20 & 1;
}

- (BOOL)accessibilityPerformEscape
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id obj;
  uint64_t v16;
  int v17;
  id v18;
  _QWORD v19[8];
  id v20;
  id v21;
  id v22;
  char v23;
  id v24;
  _QWORD __b[8];
  id v26;
  id v27;
  id v28;
  char v29;
  id v30[2];
  UITransitionViewAccessibility *v31;
  char v32;
  id v33;
  dispatch_once_t *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  v30[1] = (id)a2;
  v29 = 0;
  objc_opt_class();
  v28 = (id)__UIAccessibilityCastAsClass();
  v27 = v28;
  objc_storeStrong(&v28, 0);
  v30[0] = v27;
  v34 = (dispatch_once_t *)&accessibilityPerformEscape_onceToken;
  v33 = 0;
  objc_storeStrong(&v33, &__block_literal_global_50);
  if (*v34 != -1)
    dispatch_once(v34, v33);
  objc_storeStrong(&v33, 0);
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v30[0], "gestureRecognizers");
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
  if (v16)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v16;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(obj);
      v26 = *(id *)(__b[1] + 8 * v13);
      v23 = 0;
      objc_opt_class();
      v10 = (id)objc_msgSend(v26, "safeValueForKey:", CFSTR("_targets"));
      v22 = (id)__UIAccessibilityCastAsClass();

      if ((v23 & 1) != 0)
        abort();
      v21 = v22;
      objc_storeStrong(&v22, 0);
      v24 = v21;
      memset(v19, 0, sizeof(v19));
      v8 = v21;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v35, 16);
      if (v9)
      {
        v5 = *(_QWORD *)v19[2];
        v6 = 0;
        v7 = v9;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)v19[2] != v5)
            objc_enumerationMutation(v8);
          v20 = *(id *)(v19[1] + 8 * v6);
          v18 = (id)objc_msgSend(v20, "safeValueForKey:", CFSTR("target"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v32 = objc_msgSend(v18, "accessibilityPerformEscape") & 1;
            v17 = 1;
          }
          else
          {
            v17 = 0;
          }
          objc_storeStrong(&v18, 0);
          if (v17)
            break;
          ++v6;
          if (v4 + 1 >= v7)
          {
            v6 = 0;
            v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v35, 16);
            if (!v7)
              goto LABEL_19;
          }
        }
      }
      else
      {
LABEL_19:
        v17 = 0;
      }

      if (!v17)
        v17 = 0;
      objc_storeStrong(&v24, 0);
      if (v17)
        break;
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
        if (!v14)
          goto LABEL_25;
      }
    }
  }
  else
  {
LABEL_25:
    v17 = 0;
  }

  if (!v17)
  {
    v3 = -[UITransitionViewAccessibility _accessibilityDimmingView](v31);
    v32 = objc_msgSend(v3, "accessibilityActivate") & 1;

  }
  objc_storeStrong(v30, 0);
  return v32 & 1;
}

Class __59__UITransitionViewAccessibility_accessibilityPerformEscape__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("UIPreviewPresentationController"));
  accessibilityPerformEscape_UIPreviewPresentationControllerClass = (uint64_t)result;
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  UITransitionViewAccessibility *v3;
  id v4;
  objc_super v5;
  SEL v6;
  UITransitionViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UITransitionViewAccessibility;
  -[UITransitionViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v2 = -[UITransitionViewAccessibility _accessibilityPresentationController](v7);
  objc_msgSend(v2, "_accessibilityLoadAccessibilityInformation");

  v3 = v7;
  v4 = -[UITransitionViewAccessibility axAdditionalElements](v7, "axAdditionalElements");
  -[UITransitionViewAccessibility _accessibilitySetAdditionalElements:](v3, "_accessibilitySetAdditionalElements:");

}

- (id)axAdditionalElements
{
  id v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(id *);
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  double (*v22)(id *);
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  BOOL (*v28)(id *);
  void *v29;
  id v30;
  id location;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  objc_super v37;
  id v38[2];
  UITransitionViewAccessibility *v39;

  v39 = self;
  v38[1] = (id)a2;
  v38[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = v38[0];
  v37.receiver = v39;
  v37.super_class = (Class)UITransitionViewAccessibility;
  v10 = -[UITransitionViewAccessibility accessibilityElements](&v37, sel_accessibilityElements);
  objc_msgSend(v9, "axSafelyAddObjectsFromArray:");

  v11 = -[UITransitionViewAccessibility _accessibilityPresentationController](v39);
  NSClassFromString(CFSTR("_UIPageSheetPresentationController"));
  v35 = 0;
  v33 = 0;
  v12 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = -[UITransitionViewAccessibility _accessibilityPresentationController](v39);
    v35 = 1;
    v34 = (id)objc_msgSend(v36, "safeValueForKey:", CFSTR("delegate"));
    v33 = 1;
    v12 = objc_msgSend(v34, "_accessibilityShouldAttemptToAddDismissalElement");
  }
  if ((v33 & 1) != 0)

  if ((v35 & 1) != 0)
  if ((v12 & 1) != 0)
  {
    v2 = objc_alloc(MEMORY[0x24BDF67A0]);
    v32 = (id)objc_msgSend(v2, "initWithAccessibilityContainer:", v39);
    objc_initWeak(&location, v39);
    v8 = v32;
    v25 = MEMORY[0x24BDAC760];
    v26 = -1073741824;
    v27 = 0;
    v28 = __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke;
    v29 = &unk_24FF3DA88;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v8, "_setIsAccessibilityElementBlock:", &v25);
    v7 = v32;
    v19 = MEMORY[0x24BDAC760];
    v20 = -1073741824;
    v21 = 0;
    v22 = __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_2;
    v23 = &unk_24FF3DD28;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v7, "_setAccessibilityFrameBlock:", &v19);
    v6 = v32;
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_3;
    v17 = &unk_24FF3DA88;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v6, "_setAccessibilityActivateBlock:", &v13);
    objc_msgSend(v32, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    v5 = accessibilityLocalizedString(CFSTR("popover.view.dimiss.region.hint"));
    objc_msgSend(v32, "setAccessibilityLabel:");

    objc_msgSend(v38[0], "axSafelyAddObject:", v32);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_storeStrong(&v32, 0);
  }
  v4 = v38[0];
  objc_storeStrong(v38, 0);
  return v4;
}

BOOL __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke(id *a1)
{
  id v2;
  BOOL v3;
  id v4;
  id location;
  uint64_t v6;
  id v7;
  id v8;
  id v9[3];
  BOOL v10;

  v9[2] = a1;
  v9[1] = a1;
  v9[0] = objc_loadWeakRetained(a1 + 4);
  v4 = -[UITransitionViewAccessibility _accessibilityPresentationController](v9[0]);
  v8 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_layoutInfo"));

  v7 = (id)objc_msgSend(v8, "safeArrayForKey:", CFSTR("_detents"));
  v6 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("_indexOfCurrentActiveDetent"));
  if (v6 < 0 || v6 >= (unint64_t)objc_msgSend(v7, "count"))
  {
    v10 = 0;
  }
  else
  {
    location = (id)objc_msgSend(v7, "objectAtIndex:", v6);
    v2 = -[UITransitionViewAccessibility _accessibilityPresentationController](v9[0]);
    v3 = 0;
    if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("_shouldDismiss")) & 1) != 0)
      v3 = objc_msgSend(location, "safeIntegerForKey:", CFSTR("_type")) == 1;
    v10 = v3;

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return v10;
}

double __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_2(id *a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  id v7;
  id v8;
  id v9;
  char v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16[3];
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16[2] = a1;
  v16[1] = a1;
  v16[0] = objc_loadWeakRetained(a1 + 4);
  v14 = 0;
  objc_opt_class();
  v7 = -[UITransitionViewAccessibility _accessibilityPresentationController](v16[0]);
  v6 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("dropShadowView"));
  v13 = (id)__UIAccessibilityCastAsClass();

  v12 = v13;
  objc_storeStrong(&v13, 0);
  v15 = v12;
  v10 = 0;
  objc_opt_class();
  v9 = (id)__UIAccessibilityCastAsClass();
  v8 = v9;
  objc_storeStrong(&v9, 0);
  v11 = v8;
  objc_msgSend(v8, "bounds");
  objc_msgSend(v15, "bounds");
  UIAccessibilityFrameForBounds();
  v17 = v1;
  v18 = v2;
  v19 = v3;
  v20 = v4;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v17;
}

uint64_t __53__UITransitionViewAccessibility_axAdditionalElements__block_invoke_3(id *a1)
{
  id v2[3];

  v2[2] = a1;
  v2[1] = a1;
  v2[0] = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(v2[0], "accessibilityPerformEscape");
  objc_storeStrong(v2, 0);
  return 1;
}

@end
