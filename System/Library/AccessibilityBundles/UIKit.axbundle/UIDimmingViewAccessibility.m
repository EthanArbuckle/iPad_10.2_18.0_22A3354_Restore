@implementation UIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIDimmingView");
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
  id obj;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("_childFocusViews"), 0);
  v4 = CFSTR("UIDimmingView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v5 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_ignoresTouches"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPresentationController"), CFSTR("_shouldDismiss"), v5, 0);
  objc_storeStrong(v7, obj);
}

- (BOOL)_accessibilityCoversScreen
{
  return a1
      && (objc_msgSend(a1, "safeBoolForKey:", CFSTR("_ignoresTouches")) & 1) == 0
      && (objc_msgSend(a1, "isUserInteractionEnabled") & 1) != 0
      && (objc_msgSend(a1, "_accessibilityViewIsVisible") & 1) != 0;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  id obj;
  uint64_t v18;
  _QWORD v19[8];
  uint64_t v20;
  int v21;
  _QWORD __b[8];
  UIDimmingViewAccessibility *v23;
  id v24;
  id v25;
  id v26[2];
  UIDimmingViewAccessibility *v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26[1] = (id)a2;
  v26[0] = (id)-[UIDimmingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("passthroughViews"));
  v16 = (id)-[UIDimmingViewAccessibility superview](v27, "superview");
  v15 = (id)objc_msgSend(v16, "subviews");
  v14 = (id)objc_msgSend(v15, "reverseObjectEnumerator");
  v25 = (id)objc_msgSend(v14, "allObjects");

  v24 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  memset(__b, 0, sizeof(__b));
  obj = v25;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v18)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v18;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v23 = *(UIDimmingViewAccessibility **)(__b[1] + 8 * v12);
      if (v23 == v27)
        break;
      objc_msgSend(v24, "addObject:", v23);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v13)
          goto LABEL_9;
      }
    }
    v21 = 2;
  }
  else
  {
LABEL_9:
    v21 = 0;
  }

  memset(v19, 0, sizeof(v19));
  v8 = v26[0];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v28, 16);
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
      v20 = *(_QWORD *)(v19[1] + 8 * v6);
      if ((objc_msgSend(v24, "containsObject:", v20) & 1) == 0)
        objc_msgSend(v24, "addObject:", v20);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v19, v28, 16);
        if (!v7)
          break;
      }
    }
  }

  v3 = v24;
  v21 = 1;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
  return v3;
}

- (BOOL)accessibilityViewIsModal
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIDimmingViewAccessibility storedAccessibilityViewIsModal](self, "storedAccessibilityViewIsModal");
  v5 = v2 == 0;

  if (v5)
    return -[UIDimmingViewAccessibility _accessibilityCoversScreen](self);
  v4 = (id)-[UIDimmingViewAccessibility storedAccessibilityViewIsModal](self, "storedAccessibilityViewIsModal");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (uint64_t)_accessibilityCanDismiss
{
  int v2;
  id location;
  id v4;
  id v5;
  char v6;

  v5 = a1;
  if (a1)
  {
    v4 = (id)objc_msgSend(v5, "safeValueForKey:", CFSTR("_delegate"));
    NSClassFromString(CFSTR("UIPopoverController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      location = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_delegate"));
      if (location)
      {
        v6 = objc_msgSend(location, "_accessibilityCanDismissPopoverController:", v4) & 1;
        v2 = 1;
      }
      else
      {
        v2 = 0;
      }
      objc_storeStrong(&location, 0);
      if (v2)
        goto LABEL_12;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("_shouldDismiss")) & 1;
LABEL_12:
        objc_storeStrong(&v4, 0);
        return v6 & 1;
      }
    }
    v6 = 1;
    goto LABEL_12;
  }
  v6 = 0;
  return v6 & 1;
}

- (BOOL)accessibilityActivate
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __51__UIDimmingViewAccessibility_accessibilityActivate__block_invoke;
  v7 = &unk_24FF3DA40;
  v8[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v8, 0);
  return 1;
}

uint64_t __51__UIDimmingViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mouseUp:", 0, a1, a1);
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CGRect v26;
  id location;
  id v28[2];
  UIDimmingViewAccessibility *v29;
  double v30;
  double v31;
  CGPoint result;
  CGRect v33;

  v29 = self;
  v28[1] = (id)a2;
  if (!AXDoesRequestingClientDeserveAutomation())
    goto LABEL_10;
  v28[0] = (id)-[UIDimmingViewAccessibility safeValueForKey:](v29, "safeValueForKey:", CFSTR("_delegate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  location = (id)objc_msgSend(v28[0], "presentedView");
  if (!location)
    goto LABEL_6;
  -[UIDimmingViewAccessibility accessibilityFrame](v29, "accessibilityFrame");
  v22 = v2;
  v23 = v3;
  v24 = v4;
  v25 = v5;
  objc_msgSend(location, "accessibilityFrame");
  v18 = v6;
  v19 = v7;
  v20 = v8;
  v21 = v9;
  AX_CGRectBySubtractingRect();
  v26 = v33;
  if (CGRectIsEmpty(v33))
  {
LABEL_6:
    v17 = 0;
  }
  else
  {
    AX_CGRectGetCenter();
    v30 = v10;
    v31 = v11;
    v17 = 1;
  }
  objc_storeStrong(&location, 0);
  if (!v17)
LABEL_8:
    v17 = 0;
  objc_storeStrong(v28, 0);
  if (!v17)
  {
LABEL_10:
    v16.receiver = v29;
    v16.super_class = (Class)UIDimmingViewAccessibility;
    -[UIDimmingViewAccessibility accessibilityActivationPoint](&v16, sel_accessibilityActivationPoint);
    v30 = v12;
    v31 = v13;
  }
  v14 = v30;
  v15 = v31;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  return -[UIDimmingViewAccessibility accessibilityActivate](self, "accessibilityActivate", a2, self);
}

- (int64_t)accessibilityContainerType
{
  id v2;
  BOOL v4;
  objc_super v5;
  SEL v6;
  UIDimmingViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v2 = (id)-[UIDimmingViewAccessibility storedAccessibilityContainerType](self, "storedAccessibilityContainerType");
  v4 = v2 == 0;

  if (v4)
  {
    if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](v7)
      && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](v7) & 1) != 0)
    {
      return 4;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v5.receiver = v7;
    v5.super_class = (Class)UIDimmingViewAccessibility;
    return -[UIDimmingViewAccessibility accessibilityContainerType](&v5, sel_accessibilityContainerType);
  }
}

- (id)accessibilityLabel
{
  if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](self)
    && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](self) & 1) != 0)
  {
    return (id)UIKitAccessibilityLocalizedString();
  }
  else
  {
    return 0;
  }
}

- (id)accessibilityIdentifier
{
  if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](self)
    && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](self) & 1) != 0)
  {
    return CFSTR("PopoverDismissRegion");
  }
  else
  {
    return 0;
  }
}

- (id)accessibilityHint
{
  if (-[UIDimmingViewAccessibility _accessibilityCoversScreen](self)
    && (-[UIDimmingViewAccessibility _accessibilityCanDismiss](self) & 1) != 0)
  {
    return (id)UIKitAccessibilityLocalizedString();
  }
  else
  {
    return 0;
  }
}

- (id)_childFocusViews
{
  id v2;
  id v3;
  id v4;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  UIDimmingViewAccessibility *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(id *, void *);
  void *v21;
  id v22;
  id v23;
  int v24;
  objc_super v25;
  id v26[2];
  UIDimmingViewAccessibility *v27;
  id v28;

  v27 = self;
  v26[1] = (id)a2;
  v25.receiver = self;
  v25.super_class = (Class)UIDimmingViewAccessibility;
  v26[0] = -[UIDimmingViewAccessibility _childFocusViews](&v25, sel__childFocusViews);
  if ((-[UIDimmingViewAccessibility _accessibilityIsFKARunningForFocusItem](v27, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    if ((-[UIDimmingViewAccessibility accessibilityElementsHidden](v27, "accessibilityElementsHidden") & 1) != 0)
    {
      v28 = MEMORY[0x24BDBD1A8];
      v24 = 1;
    }
    else
    {
      v16 = (id)-[UIDimmingViewAccessibility safeArrayForKey:](v27, "safeArrayForKey:", CFSTR("passthroughViews"));
      v23 = (id)objc_msgSend(v16, "mutableCopy");

      if (objc_msgSend(v23, "count"))
      {
        v12 = v27;
        v17 = MEMORY[0x24BDAC760];
        v18 = -1073741824;
        v19 = 0;
        v20 = __46__UIDimmingViewAccessibility__childFocusViews__block_invoke;
        v21 = &unk_24FF3E2D0;
        v22 = v23;
        v2 = (id)-[UIDimmingViewAccessibility _accessibilityFindAncestor:startWithSelf:](v12, "_accessibilityFindAncestor:startWithSelf:", &v17, 0);
        v13 = (void *)MEMORY[0x24BDBCE30];
        v15 = (id)objc_msgSend(v23, "reverseObjectEnumerator");
        v14 = (id)objc_msgSend(v15, "allObjects");
        v3 = (id)objc_msgSend(v13, "axArrayWithPossiblyNilArrays:", 2, v14, v26[0]);
        v4 = v26[0];
        v26[0] = v3;

        objc_storeStrong(&v22, 0);
      }
      v6 = (void *)MEMORY[0x24BDF6F90];
      v11 = (id)objc_msgSend(v26[0], "reverseObjectEnumerator");
      v10 = (id)objc_msgSend(v11, "allObjects");
      v9 = (id)objc_msgSend(v6, "_subviewsReplacedByModalViewSubviewsIfNecessary:");
      v8 = (id)objc_msgSend(v9, "reverseObjectEnumerator");
      v7 = (id)objc_msgSend(v8, "allObjects");
      v28 = (id)objc_msgSend(v7, "ax_filteredArrayUsingBlock:", &__block_literal_global_19);

      v24 = 1;
      objc_storeStrong(&v23, 0);
    }
  }
  else
  {
    v28 = v26[0];
    v24 = 1;
  }
  objc_storeStrong(v26, 0);
  return v28;
}

uint64_t __46__UIDimmingViewAccessibility__childFocusViews__block_invoke(id *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(a1[4], "containsObject:", location[0]) & 1) != 0)
    objc_msgSend(a1[4], "removeObject:", location[0]);
  objc_storeStrong(location, 0);
  return 0;
}

uint64_t __46__UIDimmingViewAccessibility__childFocusViews__block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityFKAShouldBeProcessed");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

@end
