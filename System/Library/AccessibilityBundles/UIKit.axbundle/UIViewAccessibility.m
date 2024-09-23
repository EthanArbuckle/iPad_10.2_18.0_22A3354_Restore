@implementation UIViewAccessibility

- (id)accessibilityContainer
{
  objc_super v3;
  id location[2];
  UIViewAccessibility *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  v3.receiver = self;
  v3.super_class = (Class)UIViewAccessibility;
  location[0] = -[UIViewAccessibility accessibilityContainer](&v3, sel_accessibilityContainer);
  if (location[0])
    v6 = location[0];
  else
    v6 = (id)-[UIViewAccessibility superview](v5, "superview");
  objc_storeStrong(location, 0);
  return v6;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  id v3;
  objc_super v4;
  id location;
  char v6;
  BOOL v7;
  SEL v8;
  UIViewAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = -[UIViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AXIsElementCheckingStatus")) & 1;
  if ((v6 & 1) == 0)
  {
    -[UIViewAccessibility _accessibilitySetBoolValue:forKey:](v9, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXIsElementCheckingStatus"));
    location = (id)-[UIViewAccessibility _accessibilityViewAncestorIsKindOf:](v9, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    if (location && v7 != -[UIViewAccessibility isAccessibilityElement](v9, "isAccessibilityElement"))
      v3 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));
    objc_storeStrong(&location, 0);
  }
  v4.receiver = v9;
  v4.super_class = (Class)UIViewAccessibility;
  -[UIViewAccessibility setIsAccessibilityElement:](&v4, sel_setIsAccessibilityElement_, v7);
}

- (void)setHidden:(BOOL)a3
{
  objc_super v3;
  id location;
  BOOL v5;
  BOOL v6;
  SEL v7;
  UIViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  location = self;
  v5 = (objc_msgSend(location, "isHidden") & 1) != v6;
  v3.receiver = v8;
  v3.super_class = (Class)UIViewAccessibility;
  -[UIViewAccessibility setHidden:](&v3, sel_setHidden_, v6);
  if (v5)
    -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v8, 0);
  objc_storeStrong(&location, 0);
}

- (void)setBackgroundColor:(id)a3
{
  id v3;
  char v4;
  objc_super v5;
  id v6;
  BOOL v7;
  id location[2];
  UIViewAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = v9;
  v3 = (id)objc_msgSend(v6, "backgroundColor");
  v4 = AXColorsProbablyEqual();

  v7 = (v4 & 1) == 0;
  v5.receiver = v9;
  v5.super_class = (Class)UIViewAccessibility;
  -[UIViewAccessibility setBackgroundColor:](&v5, sel_setBackgroundColor_, location[0]);
  if (v7)
    -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v9, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)setAlpha:(double)a3
{
  double v3;
  objc_super v4;
  id location;
  BOOL v6;
  double v7;
  SEL v8;
  UIViewAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  location = self;
  objc_msgSend(location, "alpha");
  v6 = AXCGFAbs_2(v3 - v7) >= 0.001;
  v4.receiver = v9;
  v4.super_class = (Class)UIViewAccessibility;
  -[UIViewAccessibility setAlpha:](&v4, sel_setAlpha_, v7);
  if (v6)
    -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v9, 0);
  objc_storeStrong(&location, 0);
}

- (void)_notifyReferenceViewSizeChange
{
  objc_super v2;
  SEL v3;
  UIViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIViewAccessibility;
  -[UIViewAccessibility _notifyReferenceViewSizeChange](&v2, sel__notifyReferenceViewSizeChange);
  -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v4, 0);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v3;
  id location[2];
  UIViewAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UIViewAccessibility;
  -[UIViewAccessibility willMoveToWindow:](&v3, sel_willMoveToWindow_, location[0]);
  if (location[0] && (-[UIViewAccessibility _accessibilityDidLoadAccessibilityInformation]((uint64_t)v5) & 1) == 0)
  {
    -[UIViewAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
    -[UIViewAccessibility _setAccessibilityDidLoadAccessibilityInformation:]((uint64_t)v5);
  }
  objc_storeStrong(location, 0);
}

- (void)_axSetViewIsProbablyDimmingView:(void *)a1
{
  id v2;
  void *v3;
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
  id obj;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL (*v20)(uint64_t, void *);
  void *v21;
  id v22[2];
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  char v27;
  _QWORD v28[8];
  id v29;
  _QWORD __b[8];
  void *v31;
  id v32;
  BOOL v33;
  id v34;
  BOOL v35;
  int v36;
  id location;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v38 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v38)
  {
    v35 = 0;
    v34 = -[UIViewAccessibility _axViewIsProbablyDimmingViewCachedValue](v38);
    if (v34)
    {
      v16 = objc_msgSend(v34, "BOOLValue") & 1;
      v35 = v16 != (objc_msgSend(location, "BOOLValue") & 1);
    }
    else if (location)
    {
      v35 = (objc_msgSend(location, "BOOLValue") & 1) != 0;
    }
    objc_setAssociatedObject(v38, &AXViewIsProbablyDimmingView, location, (void *)1);
    if (v35)
    {
      v33 = 1;
      v32 = (id)objc_msgSend(v38, "_accessibilityObscuredScreenAllowedViews");
      memset(__b, 0, sizeof(__b));
      obj = (id)_UIAccessibilityFocusedElements();
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
      if (v15)
      {
        v11 = *(_QWORD *)__b[2];
        v12 = 0;
        v13 = v15;
        while (1)
        {
          v10 = v12;
          if (*(_QWORD *)__b[2] != v11)
            objc_enumerationMutation(obj);
          v31 = *(void **)(__b[1] + 8 * v12);
          memset(v28, 0, sizeof(v28));
          v8 = v32;
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v28, v39, 16);
          if (v9)
          {
            v5 = *(_QWORD *)v28[2];
            v6 = 0;
            v7 = v9;
            while (1)
            {
              v4 = v6;
              if (*(_QWORD *)v28[2] != v5)
                objc_enumerationMutation(v8);
              v29 = *(id *)(v28[1] + 8 * v6);
              v23 = 0;
              v24 = &v23;
              v25 = 0x20000000;
              v26 = 32;
              v27 = 0;
              v3 = v31;
              v17 = MEMORY[0x24BDAC760];
              v18 = -1073741824;
              v19 = 0;
              v20 = __55__UIViewAccessibility__axSetViewIsProbablyDimmingView___block_invoke;
              v21 = &unk_24FF3F8D0;
              v22[0] = v29;
              v22[1] = &v23;
              v2 = (id)objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", &v17, 1);
              v33 = v2 == 0;

              v36 = (v24[3] & 1) != 0 ? 4 : 0;
              objc_storeStrong(v22, 0);
              _Block_object_dispose(&v23, 8);
              if (v36)
                break;
              ++v6;
              if (v4 + 1 >= v7)
              {
                v6 = 0;
                v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v28, v39, 16);
                if (!v7)
                  goto LABEL_22;
              }
            }
          }
          else
          {
LABEL_22:
            v36 = 0;
          }

          if (!v33)
            break;
          ++v12;
          if (v10 + 1 >= v13)
          {
            v12 = 0;
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v40, 16);
            if (!v13)
              goto LABEL_27;
          }
        }
        v36 = 2;
      }
      else
      {
LABEL_27:
        v36 = 0;
      }

      if (v33)
        UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
      objc_storeStrong(&v32, 0);
    }
    objc_storeStrong(&v34, 0);
    v36 = 0;
  }
  else
  {
    v36 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_axViewIsProbablyDimmingViewCachedValue
{
  if (a1)
    return objc_getAssociatedObject(a1, &AXViewIsProbablyDimmingView);
  else
    return 0;
}

- (uint64_t)_accessibilityDidLoadAccessibilityInformation
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_setAccessibilityDidLoadAccessibilityInformation:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (void)_accessibilityFinalize
{
  -[UIViewAccessibility _accessibilityUnregister](self, "_accessibilityUnregister", a2, self);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
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
  const char *v6;
  const __CFString *v7;
  const __CFString *v8;
  const char *v9;
  id v10;
  id *v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = CFSTR("UIView");
  v9 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_childFocusViews"), v9, 0);
  v3 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("canBecomeFocused"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_isEligibleForFocusInteraction"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_isFocusInteractionEnabled"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_defaultFocusRegionFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  v4 = CFSTR("_UIFocusItemInternal");
  objc_msgSend(location[0], "validateProtocol:hasOptionalInstanceMethod:");
  objc_msgSend(location[0], "validateProtocol:hasOptionalInstanceMethod:", v4, CFSTR("_drawsFocusRingWhenChildrenFocused"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("preferredFocusEnvironments"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_normalInheritedTintColor"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("focusGroupIdentifier"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_systemDefaultFocusGroupIdentifier"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_containingScrollView"), v9, 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("didUpdateFocusInContext:withAnimationCoordinator:"), v9, v9, 0);
  v5 = CFSTR("UIContextMenuInteraction");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("presentationsByIdentifier"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_interactionShouldBeginAtPoint:completion:"), v6, "{CAPoint3D=ddd}", "@?", 0);
  v7 = CFSTR("_UIContextMenuUIController");
  objc_msgSend(location[0], "validateClass:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("platterContainerView"), v9, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_clippedViewHierarchyDescription"), v9, 0);
  objc_storeStrong(v11, v10);
}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (BOOL)_accessibilityIsKindOfUIView
{
  return 1;
}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  id obj;
  uint64_t v10;
  objc_super v11;
  int v12;
  _QWORD __b[8];
  UIViewAccessibility *v14;
  id location;
  objc_super v16;
  SEL v17;
  UIViewAccessibility *v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  v17 = a2;
  if ((-[UIViewAccessibility _accessibilityViewIsProbablyDimmingView](self) & 1) != 0)
  {
    location = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    v8 = (id)-[UIViewAccessibility superview](v18, "superview");
    v7 = (id)objc_msgSend(v8, "subviews");
    obj = (id)objc_msgSend(v7, "reverseObjectEnumerator");

    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
    if (v10)
    {
      v4 = *(_QWORD *)__b[2];
      v5 = 0;
      v6 = v10;
      while (1)
      {
        v3 = v5;
        if (*(_QWORD *)__b[2] != v4)
          objc_enumerationMutation(obj);
        v14 = *(UIViewAccessibility **)(__b[1] + 8 * v5);
        if (v14 == v18)
          break;
        objc_msgSend(location, "addObject:", v14);
        ++v5;
        if (v3 + 1 >= v6)
        {
          v5 = 0;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
          if (!v6)
            goto LABEL_11;
        }
      }
      v12 = 2;
    }
    else
    {
LABEL_11:
      v12 = 0;
    }

    if (objc_msgSend(location, "count"))
    {
      v19 = location;
    }
    else
    {
      v11.receiver = v18;
      v11.super_class = (Class)UIViewAccessibility;
      v19 = -[UIViewAccessibility _accessibilityObscuredScreenAllowedViews](&v11, sel__accessibilityObscuredScreenAllowedViews);
    }
    v12 = 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v16.receiver = v18;
    v16.super_class = (Class)UIViewAccessibility;
    v19 = -[UIViewAccessibility _accessibilityObscuredScreenAllowedViews](&v16, sel__accessibilityObscuredScreenAllowedViews);
  }
  return v19;
}

- (uint64_t)_accessibilityViewIsProbablyDimmingView
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  float v10;
  void *v12;
  id v13;
  uint64_t (**v14)(id, _QWORD);
  int v15;
  id v16;
  BOOL v17;
  uint64_t (**v18)(id, _QWORD);
  int v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  BOOL v23;
  id v24;
  BOOL v25;
  id location;
  id v27;
  char v28;
  id v29;
  char v30;
  id v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t (*v35)(id *);
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t (*v42)(_QWORD *, void *);
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  int v47;
  int v48;
  double (*v49)(uint64_t, double);
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t (*v56)(uint64_t, char);
  void *v57;
  id v58;
  id v59;
  int v60;
  CGRect v61;
  CGRect v62;
  id v63;
  void *v64;
  char v65;

  v64 = a1;
  if (a1)
  {
    v63 = v64;
    objc_msgSend(v63, "bounds");
    v62.origin.x = v1;
    v62.origin.y = v2;
    v62.size.width = v3;
    v62.size.height = v4;
    v24 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    objc_msgSend(v24, "bounds");
    v61.origin.x = v5;
    v61.origin.y = v6;
    v61.size.width = v7;
    v61.size.height = v8;
    v25 = CGRectEqualToRect(v62, v61);

    if (v25)
    {
      v9 = -[UIViewAccessibility _axViewIsProbablyDimmingViewCachedValue](v64);
      v23 = v9 == 0;

      if (!v23)
      {
        v22 = -[UIViewAccessibility _axViewIsProbablyDimmingViewCachedValue](v64);
        v65 = objc_msgSend(v22, "BOOLValue") & 1;

        v60 = 1;
LABEL_27:
        objc_storeStrong(&v63, 0);
        return v65 & 1;
      }
      v20 = MEMORY[0x24BDAC760];
      v53 = MEMORY[0x24BDAC760];
      v54 = -1073741824;
      v55 = 0;
      v56 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke;
      v57 = &unk_24FF3FC08;
      v58 = v64;
      v59 = (id)MEMORY[0x2348C3D88](&v53);
      v46 = v20;
      v47 = -1073741824;
      v48 = 0;
      v49 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_2;
      v50 = &unk_24FF3FC30;
      v51 = v63;
      v52 = (id)MEMORY[0x2348C3D88](&v46);
      v39 = v20;
      v40 = -1073741824;
      v41 = 0;
      v42 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_3;
      v43 = &unk_24FF3FC58;
      v44 = v52;
      v45 = (id)MEMORY[0x2348C3D88](&v39);
      v32 = v20;
      v33 = -1073741824;
      v34 = 0;
      v35 = __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_4;
      v36 = &unk_24FF3E0C0;
      v37 = v63;
      v38 = (id)MEMORY[0x2348C3D88](&v32);
      v30 = 0;
      v28 = 0;
      v21 = 1;
      if ((objc_msgSend(v63, "isHidden") & 1) == 0)
      {
        v31 = (id)objc_msgSend(v63, "layer");
        v30 = 1;
        v21 = 1;
        if ((objc_msgSend(v31, "isHidden") & 1) == 0)
        {
          v29 = (id)objc_msgSend(v63, "layer");
          v28 = 1;
          objc_msgSend(v29, "opacity");
          v21 = v10 == 0.0;
        }
      }
      if ((v28 & 1) != 0)

      if ((v30 & 1) != 0)
      if (v21)
      {
        v65 = (*((uint64_t (**)(id, _QWORD))v59 + 2))(v59, 0) & 1;
        v60 = 1;
      }
      else
      {
        v27 = (id)objc_msgSend(v63, "backgroundColor");
        if (v27)
        {
          v18 = (uint64_t (**)(id, _QWORD))v59;
          LOBYTE(v19) = 0;
          if (((*((uint64_t (**)(id, id))v45 + 2))(v45, v27) & 1) != 0)
            v19 = (*((uint64_t (**)(void))v38 + 2))() ^ 1;
          v65 = v18[2](v18, v19 & 1) & 1;
          v60 = 1;
        }
        else
        {
          v16 = (id)objc_msgSend(v63, "layer");
          v17 = objc_msgSend(v16, "backgroundColor") == 0;

          if (v17)
          {
            v60 = 0;
          }
          else
          {
            v12 = (void *)MEMORY[0x24BDF6950];
            v13 = (id)objc_msgSend(v63, "layer");
            location = (id)objc_msgSend(v12, "colorWithCGColor:", objc_msgSend(v13, "backgroundColor"));

            v14 = (uint64_t (**)(id, _QWORD))v59;
            LOBYTE(v15) = 0;
            if (((*((uint64_t (**)(id, id))v45 + 2))(v45, location) & 1) != 0)
              v15 = (*((uint64_t (**)(void))v38 + 2))() ^ 1;
            v65 = v14[2](v14, v15 & 1) & 1;
            v60 = 1;
            objc_storeStrong(&location, 0);
          }
        }
        objc_storeStrong(&v27, 0);
      }
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v37, 0);
      objc_storeStrong(&v45, 0);
      objc_storeStrong(&v44, 0);
      objc_storeStrong(&v52, 0);
      objc_storeStrong(&v51, 0);
      objc_storeStrong(&v59, 0);
      objc_storeStrong(&v58, 0);
      if (v60)
        goto LABEL_27;
    }
    v65 = 0;
    v60 = 1;
    goto LABEL_27;
  }
  v65 = 0;
  return v65 & 1;
}

- (id)_accessibilityViewController
{
  id v3;
  id obj;
  id location[2];
  UIViewAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", self);
  if (!location[0])
  {
    obj = (id)-[UIViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("viewDelegate"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong(location, obj);
    objc_storeStrong(&obj, 0);
  }
  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (BOOL)accessibilityElementIsFocused
{
  UIViewAccessibility *v2;
  UIViewAccessibility *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id obj;
  uint64_t v10;
  objc_super v11;
  int v12;
  _QWORD __b[8];
  UIViewAccessibility *v14;
  id location[2];
  UIViewAccessibility *v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = (id)_UIAccessibilityFocusedElements();
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
  if (v10)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v10;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v14 = *(UIViewAccessibility **)(__b[1] + 8 * v7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v16;
        v2 = (UIViewAccessibility *)(id)-[UIAccessibilityElementMockView view]((uint64_t)v14);
        v17 = v4 == v2;

        v12 = 1;
        goto LABEL_12;
      }
      if (v16 == v14)
        break;
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v18, 16);
        if (!v8)
          goto LABEL_11;
      }
    }
    v17 = 1;
    v12 = 1;
  }
  else
  {
LABEL_11:
    v12 = 0;
  }
LABEL_12:

  if (!v12)
  {
    v11.receiver = v16;
    v11.super_class = (Class)UIViewAccessibility;
    v17 = -[UIViewAccessibility accessibilityElementIsFocused](&v11, sel_accessibilityElementIsFocused);
    v12 = 1;
  }
  objc_storeStrong(location, 0);
  return v17 & 1;
}

- (void)_accessibilityPostNotification:(id)a3
{
  UIAccessibilityNotifications notification;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  notification = 0;
  if ((objc_msgSend(location[0], "isEqualToString:", CFSTR("AXLayoutChange")) & 1) != 0)
    notification = *MEMORY[0x24BDF72C8];
  if (notification)
    UIAccessibilityPostNotification(notification, 0);
  objc_storeStrong(location, 0);
}

- (double)_accessibilityFrameForView:(uint64_t)a1
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect rect;
  id location;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v15 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v15)
  {
    objc_msgSend(location, "bounds");
    rect.origin.x = v2;
    rect.origin.y = v3;
    rect.size.width = v4;
    rect.size.height = v5;
    objc_msgSend(location, "_accessibilityFrameExpansion");
    CGRectInset(rect, -v6, -v7);
    UIAccessibilityFrameForBounds();
    *(_QWORD *)&v16 = v8;
    *((_QWORD *)&v16 + 1) = v9;
    *(_QWORD *)&v17 = v10;
    *((_QWORD *)&v17 + 1) = v11;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  objc_storeStrong(&location, 0);
  return *(double *)&v16;
}

- (id)_accessibilityProxyView
{
  return self;
}

- (CGRect)_accessibilityBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIViewAccessibility bounds](self, "bounds", a2, self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)_accessibilityCirclePathBasedOnBoundsWidth
{
  UIBezierPath *v2;
  UIBezierPath *v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v9;
  UIBezierPath *v10;
  UIBezierPath *path[3];
  double v12;
  uint64_t v13;
  SEL v14;
  UIView *v15;

  v15 = (UIView *)self;
  v14 = a2;
  -[UIViewAccessibility _accessibilityBounds](self, "_accessibilityBounds");
  path[1] = v2;
  path[2] = v3;
  v12 = v4;
  v13 = v5;
  v9 = (void *)MEMORY[0x24BDF6870];
  AX_CGRectGetCenter();
  path[0] = (UIBezierPath *)(id)objc_msgSend(v9, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v7, v12 / 2.0, 0.0, 6.28318531);
  v10 = UIAccessibilityConvertPathToScreenCoordinates(path[0], v15);
  objc_storeStrong((id *)path, 0);
  return v10;
}

- (id)accessibilityPath
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  id v16;
  void *v17;
  id v18;
  BOOL v19;
  objc_super v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  id v26;
  int v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  id v34;
  char v35;
  id v36;
  objc_super v37;
  objc_super v38;
  SEL v39;
  UIViewAccessibility *v40;
  id v41;

  v40 = self;
  v39 = a2;
  v38.receiver = self;
  v38.super_class = (Class)UIViewAccessibility;
  v2 = -[UIViewAccessibility accessibilityPath](&v38, sel_accessibilityPath);
  v19 = v2 == 0;

  if (v19)
  {
    v35 = 0;
    objc_opt_class();
    v18 = (id)-[UIViewAccessibility safeValueForKey:](v40, "safeValueForKey:", CFSTR("layer"));
    v34 = (id)__UIAccessibilityCastAsClass();

    v33 = v34;
    objc_storeStrong(&v34, 0);
    v36 = v33;
    objc_msgSend(v33, "cornerRadius");
    if (v3 > 0.0 && (-[UIViewAccessibility clipsToBounds](v40, "clipsToBounds") & 1) != 0)
    {
      v17 = (void *)MEMORY[0x24BDF6870];
      -[UIViewAccessibility accessibilityFrame](v40, "accessibilityFrame");
      v28 = v4;
      v29 = v5;
      v30 = v6;
      v31 = v7;
      objc_msgSend(v36, "cornerRadius");
      v32 = (id)objc_msgSend(v17, "_bezierPathWithArcRoundedRect:cornerRadius:", v28, v29, v30, v31, v8);
      v41 = v32;
      v27 = 1;
      objc_storeStrong(&v32, 0);
    }
    else
    {
      v26 = -[UIViewAccessibility _axBackgroundViewForCornerRadius]((uint64_t)v40);
      if (v26)
      {
        v15 = (void *)MEMORY[0x24BDF6870];
        objc_msgSend(v26, "accessibilityFrame");
        v21 = v9;
        v22 = v10;
        v23 = v11;
        v24 = v12;
        v16 = (id)objc_msgSend(v26, "layer");
        objc_msgSend(v16, "cornerRadius");
        v25 = (id)objc_msgSend(v15, "_bezierPathWithArcRoundedRect:cornerRadius:", v21, v22, v23, v24, v13);

        v41 = v25;
        v27 = 1;
        objc_storeStrong(&v25, 0);
      }
      else
      {
        v27 = 0;
      }
      objc_storeStrong(&v26, 0);
      if (!v27)
      {
        v20.receiver = v40;
        v20.super_class = (Class)UIViewAccessibility;
        v41 = -[UIViewAccessibility accessibilityPath](&v20, sel_accessibilityPath);
        v27 = 1;
      }
    }
    objc_storeStrong(&v36, 0);
  }
  else
  {
    v37.receiver = v40;
    v37.super_class = (Class)UIViewAccessibility;
    v41 = -[UIViewAccessibility accessibilityPath](&v37, sel_accessibilityPath);
  }
  return v41;
}

- (id)_axBackgroundViewForCornerRadius
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  BOOL v14;
  int v15;
  double v16;
  double v17;
  _QWORD __b[8];
  id v19;
  char v20;
  id v21;
  id v22;
  id location;
  uint64_t v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v24 = a1;
  if (a1)
  {
    location = 0;
    v22 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEB8]), "init");
    objc_msgSend(v22, "addObject:", v24);
    do
    {
      if (!objc_msgSend(v22, "count"))
        break;
      v21 = (id)objc_msgSend(v22, "firstObject");
      objc_msgSend(v22, "removeObjectAtIndex:", 0);
      v20 = 0;
      v13 = (id)objc_msgSend(v21, "layer");
      objc_msgSend(v13, "cornerRadius");
      v14 = v1 <= 0.0;

      if (v14)
      {
        memset(__b, 0, sizeof(__b));
        obj = (id)objc_msgSend(v21, "subviews");
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
        if (v12)
        {
          v8 = *(_QWORD *)__b[2];
          v9 = 0;
          v10 = v12;
          while (1)
          {
            if (*(_QWORD *)__b[2] != v8)
              objc_enumerationMutation(obj);
            v19 = *(id *)(__b[1] + 8 * v9);
            objc_msgSend(v19, "frame");
            v16 = v2;
            v17 = v3;
            objc_msgSend(v21, "frame");
            if (!__CGSizeEqualToSize_3(v16, v17, v4, v5))
              break;
            objc_msgSend(v22, "addObject:", v19);
            if (++v9 >= v10)
            {
              v9 = 0;
              v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
              if (!v10)
                break;
            }
          }
        }

      }
      else
      {
        objc_storeStrong(&location, v21);
        v20 = 1;
      }
      v15 = (v20 & 1) != 0 ? 3 : 0;
      objc_storeStrong(&v21, 0);
    }
    while (!v15);
    v25 = location;
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    v25 = 0;
  }
  return v25;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  id v2;
  id v4;
  BOOL v5;
  objc_super v6;
  SEL v7;
  UIViewAccessibility *v8;
  BOOL v9;

  v8 = self;
  v7 = a2;
  v2 = (id)-[UIViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_accessibilityOnlyComparesByXAxis"));
  v5 = v2 == 0;

  if (v5)
  {
    v4 = -[UIViewAccessibility _accessibilityViewController](v8, "_accessibilityViewController");
    v9 = objc_msgSend(v4, "_accessibilityOnlyComparesByXAxis") & 1;

  }
  else
  {
    v6.receiver = v8;
    v6.super_class = (Class)UIViewAccessibility;
    return -[UIViewAccessibility _accessibilityOnlyComparesByXAxis](&v6, sel__accessibilityOnlyComparesByXAxis);
  }
  return v9;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id location[2];
  UIViewAccessibility *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v11 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIViewAccessibility accessibilityUserDefinedFrame](self, "accessibilityUserDefinedFrame");
  if (location[0])
  {
    objc_msgSend(location[0], "rectValue");
    v12 = v5;
  }
  else
  {
    v12 = -[UIViewAccessibility _accessibilityFrameForView:]((uint64_t)v11, v11);
  }
  v13 = v2;
  v14 = v3;
  v15 = v4;
  objc_storeStrong(location, 0);
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = v15;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (uint64_t)_accessibilityIsSiblingOfModalizingBlocker
{
  BOOL v2;
  id v3;
  char v4;
  id v5;
  id v6;
  char v7;
  id location;
  dispatch_once_t *v9;

  v6 = a1;
  if (a1)
  {
    v9 = (dispatch_once_t *)&_accessibilityIsSiblingOfModalizingBlocker_onceToken;
    location = 0;
    objc_storeStrong(&location, &__block_literal_global_51);
    if (*v9 != -1)
      dispatch_once(v9, location);
    objc_storeStrong(&location, 0);
    v3 = (id)objc_msgSend(v6, "superview");
    v5 = (id)objc_msgSend(v3, "subviews");

    v4 = 1;
    if ((objc_msgSend(v5, "ax_containsObjectUsingBlock:", &__block_literal_global_274_0) & 1) == 0)
    {
      v2 = 0;
      if (!objc_msgSend(v5, "indexOfObject:", v6))
        v2 = (unint64_t)objc_msgSend(v5, "count") > 1;
      v4 = v2;
    }
    v7 = v4;
    objc_storeStrong(&v5, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7 & 1;
}

void __65__UIViewAccessibility__accessibilityIsSiblingOfModalizingBlocker__block_invoke()
{
  id v0;
  void *v1;
  Class v2;
  void *v3;
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v3 = (void *)MEMORY[0x24BDBCE30];
  v2 = NSClassFromString(CFSTR("_UIAlertControllerView"));
  v5 = (id)objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 2, v2, NSClassFromString(CFSTR("_UIPopoverView")));
  v0 = (id)objc_msgSend(v4, "setWithArray:");
  v1 = (void *)_accessibilityIsSiblingOfModalizingBlocker_ClassSet;
  _accessibilityIsSiblingOfModalizingBlocker_ClassSet = (uint64_t)v0;

}

uint64_t __65__UIViewAccessibility__accessibilityIsSiblingOfModalizingBlocker__block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend((id)_accessibilityIsSiblingOfModalizingBlocker_ClassSet, "containsObject:", objc_opt_class());
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)accessibilityViewIsModal
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UIViewAccessibility storedAccessibilityViewIsModal](self, "storedAccessibilityViewIsModal");
  v5 = v2 == 0;

  if (v5)
    return (-[UIViewAccessibility _accessibilityViewIsProbablyDimmingView](self) & 1) != 0
        && (-[UIViewAccessibility _accessibilityIsSiblingOfModalizingBlocker](self) & 1) == 0;
  v4 = (id)-[UIViewAccessibility storedAccessibilityViewIsModal](self, "storedAccessibilityViewIsModal");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (BOOL)_accessibilityShouldHitTestLayers
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  unint64_t v4;
  id location;
  objc_super v6;
  unint64_t v7;
  SEL v8;
  UIViewAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = 0;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility;
  v7 = -[UIViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  location = (id)-[UIViewAccessibility accessibilityUserDefinedTraits](v9, "accessibilityUserDefinedTraits");
  if (location)
  {
    v2 = objc_msgSend(location, "unsignedLongLongValue");
    v7 |= v2;
  }
  v4 = v7;
  objc_storeStrong(&location, 0);
  return v4;
}

- (uint64_t)_accessibilityHasButtonLikeGestureRecognizer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  int v8;
  _QWORD __b[8];
  id v10;
  id location;
  id v12;
  char v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12 = a1;
  if (a1)
  {
    location = (id)objc_msgSend(v12, "gestureRecognizers");
    memset(__b, 0, sizeof(__b));
    obj = location;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
    if (v7)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v7;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v10 = *(id *)(__b[1] + 8 * v4);
        if ((objc_msgSend(v10, "isEnabled") & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
        }
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
          if (!v5)
            goto LABEL_13;
        }
      }
      v13 = 1;
      v8 = 1;
    }
    else
    {
LABEL_13:
      v8 = 0;
    }

    if (!v8)
      v13 = 0;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v13 = 0;
  }
  return v13 & 1;
}

- (BOOL)isAccessibilityElement
{
  char v3;
  objc_super v4;
  SEL v5;
  UIViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  if (UIAccessibilityIsSwitchControlRunning()
    && (-[UIViewAccessibility _accessibilityShouldBeScannedIfAncestorCanScroll](v6, "_accessibilityShouldBeScannedIfAncestorCanScroll") & 1) != 0)
  {
    v3 = 0;
    if (-[UIViewAccessibility _axHasNoVisibleAxElements](v6))
      v3 = -[UIViewAccessibility _accessibilityCanScrollInAtLeastOneDirection](v6, "_accessibilityCanScrollInAtLeastOneDirection");
    return v3 & 1;
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIViewAccessibility;
    return -[UIViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
  }
}

- (BOOL)_axHasNoVisibleAxElements
{
  id v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t *, void *);
  void *v7;
  id v8;
  id location;
  id v10;
  BOOL v11;

  v10 = a1;
  if (a1)
  {
    v2 = v10;
    v3 = MEMORY[0x24BDAC760];
    v4 = -1073741824;
    v5 = 0;
    v6 = __48__UIViewAccessibility__axHasNoVisibleAxElements__block_invoke;
    v7 = &unk_24FF3E2D0;
    v8 = v10;
    location = (id)objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", &v3);
    v11 = location == 0;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  char v3;
  objc_super v4;
  SEL v5;
  UIViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  if (UIAccessibilityIsSwitchControlRunning()
    && (-[UIViewAccessibility _accessibilityShouldBeScannedIfAncestorCanScroll](v6, "_accessibilityShouldBeScannedIfAncestorCanScroll") & 1) != 0)
  {
    v3 = 0;
    if (-[UIViewAccessibility _axHasNoVisibleAxElements](v6))
      v3 = -[UIViewAccessibility _accessibilityCanScrollInAtLeastOneDirection](v6, "_accessibilityCanScrollInAtLeastOneDirection");
    return v3 & 1;
  }
  else
  {
    v4.receiver = v6;
    v4.super_class = (Class)UIViewAccessibility;
    return -[UIViewAccessibility accessibilityRespondsToUserInteraction](&v4, sel_accessibilityRespondsToUserInteraction);
  }
}

- (BOOL)_accessibilityViewIsActive
{
  return a1
      && (objc_msgSend(a1, "_accessibilityViewIsVisible") & 1) != 0
      && (objc_msgSend(a1, "isUserInteractionEnabled") & 1) != 0;
}

uint64_t __48__UIViewAccessibility__axHasNoVisibleAxElements__block_invoke(uint64_t *a1, void *a2)
{
  char isKindOfClass;
  char v4;
  id v6;
  id v7;
  char v8;
  id v9[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[1] = a1;
  v8 = 0;
  objc_opt_class();
  v7 = (id)__UIAccessibilityCastAsClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v9[0] = v6;
  v4 = 0;
  if (location[0] != (id)a1[4])
  {
    v4 = 0;
    if ((objc_msgSend(v9[0], "_accessibilityViewIsVisible") & 1) != 0)
    {
      v4 = 0;
      if (!-[UIViewAccessibility _axViewIsOffScreen:](a1[4], v9[0]))
      {
        if ((objc_msgSend(v9[0], "isAccessibilityElement") & 1) == 0
          || (isKindOfClass = 1, (objc_msgSend(v9[0], "accessibilityRespondsToUserInteraction") & 1) == 0))
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
        }
        v4 = isKindOfClass;
      }
    }
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)_axViewIsOffScreen:(uint64_t)a1
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGRect rect2;
  id location;
  uint64_t v9;
  BOOL v10;

  v9 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v9)
  {
    objc_msgSend(location, "_accessibilityVisibleFrame");
    rect2.origin.x = v2;
    rect2.origin.y = v3;
    rect2.size.width = v4;
    rect2.size.height = v5;
    v10 = CGRectEqualToRect(*MEMORY[0x24BDBF090], rect2);
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(&location, 0);
  return v10;
}

- (BOOL)_accessibilityBlocksInteraction
{
  return 0;
}

- (uint64_t)_accessibilityIsIgnored
{
  return 0;
}

- (id)_accessibilityAutomaticIdentifier
{
  id v3;
  uint64_t v4;

  v3 = (id)-[UIViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tag"));
  v4 = objc_msgSend(v3, "integerValue");

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v4);
}

- (int64_t)_accessibilityHorizontalSizeClass
{
  int64_t v3;
  id v4;
  id v5;
  char v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v6 = 0;
  v5 = (id)__UIAccessibilitySafeClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = (id)objc_msgSend(v4, "traitCollection");

  v3 = objc_msgSend(v7[0], "horizontalSizeClass");
  objc_storeStrong(v7, 0);
  return v3;
}

- (int64_t)_accessibilityVerticalSizeClass
{
  int64_t v3;
  id v4;
  id v5;
  char v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v6 = 0;
  v5 = (id)__UIAccessibilitySafeClass();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v7[0] = (id)objc_msgSend(v4, "traitCollection");

  v3 = objc_msgSend(v7[0], "verticalSizeClass");
  objc_storeStrong(v7, 0);
  return v3;
}

- (BOOL)_accessibilityAvoidsMockViewContainers
{
  return 0;
}

- (BOOL)_accessibilityObscuredScreenAllowsView:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (uint64_t)_accessibilityModalViewBlocksView:(_QWORD *)a3 blockerView:
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  id v21;
  id obj;
  uint64_t v23;
  _QWORD v25[8];
  uint64_t v26;
  id v27;
  id v28;
  _QWORD __b[8];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int v35;
  _QWORD *v36;
  id location;
  uint64_t v38;
  char v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v38 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v36 = a3;
  if (v38)
  {
    v34 = location;
    v33 = (id)objc_msgSend(location, "_accessibilityParentView");
    while (v33)
    {
      v21 = (id)objc_msgSend(v33, "superview");
      v20 = (id)objc_msgSend(v21, "subviews");
      v19 = (id)objc_msgSend(v20, "reverseObjectEnumerator");
      v32 = (id)objc_msgSend(v19, "allObjects");

      v31 = 0;
      memset(__b, 0, sizeof(__b));
      obj = v32;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
      if (v23)
      {
        v16 = *(_QWORD *)__b[2];
        v17 = 0;
        v18 = v23;
        while (1)
        {
          v15 = v17;
          if (*(_QWORD *)__b[2] != v16)
            objc_enumerationMutation(obj);
          v30 = *(id *)(__b[1] + 8 * v17);
          if ((objc_msgSend(v30, "accessibilityViewIsModal") & 1) != 0
            && (objc_msgSend(v30, "_accessibilityViewIsVisible") & 1) != 0)
          {
            break;
          }
          ++v17;
          if (v15 + 1 >= v18)
          {
            v17 = 0;
            v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
            if (!v18)
              goto LABEL_14;
          }
        }
        objc_storeStrong(&v31, v30);
        v35 = 4;
      }
      else
      {
LABEL_14:
        v35 = 0;
      }

      if (v31)
      {
        if ((objc_msgSend(v31, "_accessibilityObscuredScreenAllowsView:", location) & 1) != 0)
        {
          v39 = 0;
          v35 = 1;
        }
        else if ((objc_msgSend(v33, "_accessibilityIsViewDescendantOfElement:", v31) & 1) != 0)
        {
          v39 = 0;
          v35 = 1;
        }
        else
        {
          v28 = (id)objc_msgSend(v31, "_accessibilityObscuredScreenAllowedViews");
          v27 = (id)objc_msgSend(v31, "_accessibilityHitTestingObscuredScreenAllowedViews");
          if (v27)
          {
            if (v28)
            {
              v3 = (id)objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v27);
              v4 = v28;
              v28 = v3;

            }
            else
            {
              objc_storeStrong(&v28, v27);
            }
          }
          memset(v25, 0, sizeof(v25));
          v13 = v28;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v25, v40, 16);
          if (v14)
          {
            v10 = *(_QWORD *)v25[2];
            v11 = 0;
            v12 = v14;
            while (1)
            {
              v9 = v11;
              if (*(_QWORD *)v25[2] != v10)
                objc_enumerationMutation(v13);
              v26 = *(_QWORD *)(v25[1] + 8 * v11);
              if ((objc_msgSend(v34, "_accessibilityIsDescendantOfElement:", v26) & 1) != 0)
                break;
              ++v11;
              if (v9 + 1 >= v12)
              {
                v11 = 0;
                v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v25, v40, 16);
                if (!v12)
                  goto LABEL_32;
              }
            }
            v39 = 0;
            v35 = 1;
          }
          else
          {
LABEL_32:
            v35 = 0;
          }

          if (!v35)
          {
            v5 = objc_retainAutorelease(v31);
            *v36 = v5;
            v39 = 1;
            v35 = 1;
          }
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
        }
      }
      else
      {
        v6 = (id)objc_msgSend(v33, "superview");
        v7 = v33;
        v33 = v6;

        v35 = 0;
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      if (v35)
        goto LABEL_40;
    }
    v39 = 0;
    v35 = 1;
LABEL_40:
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    v39 = 0;
    v35 = 1;
  }
  objc_storeStrong(&location, 0);
  return v39 & 1;
}

uint64_t __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  char v5;

  v5 = a2 & 1;
  v3 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2 & 1);
  -[UIViewAccessibility _axSetViewIsProbablyDimmingView:](v3, v4);

  return v5 & 1;
}

double __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_2(uint64_t a1, double a2)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  return a2 * v2;
}

uint64_t __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_3(_QWORD *a1, void *a2)
{
  id v2;
  double v3;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  _QWORD *v17;
  id location[2];
  char v19;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = a1;
  v6 = location[0];
  v2 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = v6 != v2;

  if (v7)
  {
    v15 = 0.0;
    v14 = 0.0;
    v13 = 0.0;
    v12 = 0.0;
    if ((objc_msgSend(location[0], "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12) & 1) == 0)
      goto LABEL_13;
    if ((*(double (**)(double))(a1[4] + 16))(v12) == 0.0)
    {
      v19 = 0;
      v16 = 1;
      goto LABEL_14;
    }
    v11 = (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", v15, v14, v13, v12);
    v10 = 0;
    v9 = 0;
    v8 = 0;
    if ((objc_msgSend(v11, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, &v12) & 1) != 0
      && (AXColorGetLuma(), v3 < 0.00999999978)
      && (*(double (**)(double))(a1[4] + 16))(v12) >= 0.100000001
      && (*(double (**)(double))(a1[4] + 16))(v12) <= 0.899999976)
    {
      v19 = 1;
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    objc_storeStrong(&v11, 0);
    if (!v16)
    {
LABEL_13:
      v19 = 0;
      v16 = 1;
    }
  }
  else
  {
    v19 = 0;
    v16 = 1;
  }
LABEL_14:
  objc_storeStrong(location, 0);
  return v19 & 1;
}

uint64_t __62__UIViewAccessibility__accessibilityViewIsProbablyDimmingView__block_invoke_4(id *a1)
{
  id v1;
  id v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  id v14;
  id v15;
  BOOL v16;
  BOOL v17;
  id v18;
  BOOL v19;
  char v20;
  id v21;
  CGRect rect2;
  CGRect v23;
  id location[3];
  char v25;

  location[2] = a1;
  location[1] = a1;
  location[0] = a1[4];
  while (1)
  {
    v18 = (id)objc_msgSend(location[0], "subviews");
    v19 = objc_msgSend(v18, "count") != 1;

    if (v19)
      break;
    v14 = (id)objc_msgSend(location[0], "subviews");
    v1 = (id)objc_msgSend(v14, "firstObject");
    v2 = location[0];
    location[0] = v1;

    objc_msgSend(location[0], "bounds");
    v23.origin.x = v3;
    v23.origin.y = v4;
    v23.size.width = v5;
    v23.size.height = v6;
    v15 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    objc_msgSend(v15, "bounds");
    rect2.origin.x = v7;
    rect2.origin.y = v8;
    rect2.size.width = v9;
    rect2.size.height = v10;
    v16 = CGRectEqualToRect(v23, rect2);

    v20 = 0;
    v17 = 0;
    if (v16)
    {
      v17 = 0;
      if ((objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1) != 0)
      {
        v21 = (id)objc_msgSend(location[0], "backgroundColor");
        v20 = 1;
        objc_msgSend(v21, "alphaComponent");
        v17 = v11 == 1.0;
      }
    }
    if ((v20 & 1) != 0)

    if (v17)
    {
      v25 = 1;
      goto LABEL_16;
    }
    if (v16 || (objc_msgSend(location[0], "clipsToBounds") & 1) == 0)
    {
      objc_msgSend(location[0], "alpha");
      if (v12 >= 1.0)
        continue;
    }
    v25 = 0;
    goto LABEL_16;
  }
  v25 = 0;
LABEL_16:
  objc_storeStrong(location, 0);
  return v25 & 1;
}

BOOL __55__UIViewAccessibility__axSetViewIsProbablyDimmingView___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = location[0] == *(id *)(a1 + 32);
  objc_storeStrong(location, 0);
  return v3;
}

- (id)_accessibilityHitTestSubviews
{
  return (id)-[UIViewAccessibility _accessibilitySubviews](self, "_accessibilitySubviews", a2, self);
}

- (BOOL)_accessibilityPointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v9;
  id v10;
  id v11;
  char v12;
  CGPoint point;
  int v14;
  CGRect v15;
  id v16;
  id v17;
  char v18;
  CGPoint v19;
  id location[2];
  UIViewAccessibility *v21;
  CGPoint v22;
  char v23;
  CGRect v24;
  CGRect v25;

  v22 = a3;
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  if (-[UIViewAccessibility _accessibilityUseAccessibilityFrameForHittest](v21, "_accessibilityUseAccessibilityFrameForHittest"))
  {
    v19.x = 0.0;
    v19.y = 0.0;
    v18 = 0;
    objc_opt_class();
    v17 = (id)__UIAccessibilityCastAsClass();
    v16 = v17;
    objc_storeStrong(&v17, 0);
    UIAccessibilityPointForPoint();
    v19.x = v4;
    v19.y = v5;

    -[UIViewAccessibility accessibilityFrame](v21, "accessibilityFrame");
    v15 = v24;
    v23 = CGRectContainsPoint(v24, v19);
    v14 = 1;
  }
  else if (-[UIViewAccessibility isAccessibilityElement](v21, "isAccessibilityElement")
         || (-[UIViewAccessibility _accessibilityOverridesInvalidFrames](v21, "_accessibilityOverridesInvalidFrames") & 1) == 0)
  {
    v23 = -[UIViewAccessibility pointInside:withEvent:](v21, "pointInside:withEvent:", location[0], v22.x, v22.y) & 1;
    v14 = 1;
  }
  else
  {
    point.x = 0.0;
    point.y = 0.0;
    v12 = 0;
    objc_opt_class();
    v11 = (id)__UIAccessibilityCastAsClass();
    v10 = v11;
    objc_storeStrong(&v11, 0);
    UIAccessibilityPointForPoint();
    point.x = v6;
    point.y = v7;

    v9 = (id)-[UIViewAccessibility subviews](v21, "subviews");
    objc_msgSend(v9, "accessibilityFrame");
    v23 = CGRectContainsPoint(v25, point);

    v14 = 1;
  }
  objc_storeStrong(location, 0);
  return v23 & 1;
}

- (BOOL)_accessibilityUseAccessibilityFrameForHittest
{
  return 0;
}

- (double)_accessibilityMaxFuzzyHitTestDistance
{
  return 3.40282347e38;
}

- (BOOL)_accessibilityIsUserInteractionEnabledChain
{
  id v1;
  BOOL v3;

  if (a1)
  {
    v1 = (id)objc_msgSend(a1, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_303, 1);
    v3 = v1 != 0;

    return !v3;
  }
  else
  {
    return 0;
  }
}

uint64_t __66__UIViewAccessibility__accessibilityIsUserInteractionEnabledChain__block_invoke(void *a1, void *a2)
{
  int v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  LOBYTE(v3) = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(location[0], "isUserInteractionEnabled") ^ 1;
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (BOOL)_acceessibilityUIKitIsUserInteractionDisabled
{
  return (-[UIViewAccessibility isUserInteractionEnabled](self, "isUserInteractionEnabled", a2, self) ^ 1) & 1;
}

+ (void)_axTriggerNextContextMenuInteractionInQueue:(void *)a3 forElement:(void *)a4 targetPointValue:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *log;
  os_log_type_t type;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  int v32;
  uint8_t v33[15];
  os_log_type_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location;
  uint64_t v40;

  v40 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v38 = 0;
  objc_storeStrong(&v38, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  v40 = objc_opt_self();
  v36 = (id)objc_msgSend(location, "firstObject");
  v18 = (id)objc_msgSend(v36, "safeDictionaryForKey:", CFSTR("presentationsByIdentifier"));
  v19 = objc_msgSend(v18, "count") == 0;

  if (v19)
  {
    v13 = (id)objc_msgSend(v36, "view");
    objc_msgSend(v38, "accessibilityActivationPoint");
    v29 = v4;
    v30 = v5;
    UIAccessibilityPointToPoint();
    *(_QWORD *)&v31 = v6;
    *((_QWORD *)&v31 + 1) = v7;

    if (v37)
    {
      objc_msgSend(v37, "pointValue");
      v27 = v8;
      v28 = v9;
      v12 = (id)objc_msgSend(v36, "view");
      UIAccessibilityPointToPoint();
      *(_QWORD *)&v26 = v10;
      *((_QWORD *)&v26 + 1) = v11;
      v31 = v26;

    }
    v20 = v36;
    v24 = v31;
    v21 = location;
    v25 = v40;
    v22 = v38;
    v23 = v37;
    AXPerformSafeBlock();
    objc_storeStrong(&v23, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v20, 0);
    v32 = 0;
  }
  else
  {
    v35 = (id)AXLogAppAccessibility();
    v34 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      log = v35;
      type = v34;
      __os_log_helper_16_0_0(v33);
      _os_log_impl(&dword_230C4A000, log, type, "Already showing a presentation for this interaction. Skipping attempt to fast-track context menu.", v33, 2u);
    }
    objc_storeStrong(&v35, 0);
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAED0], &unk_24FF85B38);
    v32 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
}

void __95__UIViewAccessibility__axTriggerNextContextMenuInteractionInQueue_forElement_targetPointValue___block_invoke(id *a1)
{
  double v1;
  double v2;
  double v3;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14[2];
  double v15;
  double v16;
  double v17;
  id *v18;
  id *v19;

  v19 = a1;
  v18 = a1;
  v5 = a1[4];
  CAPoint3DMakeWithCGPoint();
  v15 = v1;
  v16 = v2;
  v17 = v3;
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __95__UIViewAccessibility__axTriggerNextContextMenuInteractionInQueue_forElement_targetPointValue___block_invoke_2;
  v10 = &unk_24FF3FCA0;
  v11 = a1[4];
  v12 = a1[5];
  v14[1] = a1[10];
  v13 = a1[6];
  v14[0] = a1[7];
  objc_msgSend(v5, "_interactionShouldBeginAtPoint:completion:", v15, v16, v17);
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
}

void __95__UIViewAccessibility__axTriggerNextContextMenuInteractionInQueue_forElement_targetPointValue___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  UIAccessibilityNotifications notification;
  id v6;
  void *v7;
  id v8;
  BOOL v9;
  id v10;
  id v12[3];
  id v13;
  BOOL v14;
  id v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v20 = a1;
  v19 = a2;
  v18 = a1;
  if (a2)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") <= 1)
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BEBAED0], &unk_24FF85B38);
    }
    else
    {
      v4 = *(void **)(a1 + 40);
      v22 = 1;
      v21 = objc_msgSend(v4, "count") - 1;
      v23 = 1;
      v24 = v21;
      v12[0] = (id)objc_msgSend(v4, "subarrayWithRange:", 1, v21);
      +[UIViewAccessibility _axTriggerNextContextMenuInteractionInQueue:forElement:targetPointValue:](*(_QWORD *)(a1 + 64), v12[0], *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_storeStrong(v12, 0);
    }
  }
  else
  {
    v17 = 0;
    objc_opt_class();
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("presentationInteraction"));
    v16 = (id)__UIAccessibilityCastAsClass();

    v15 = v16;
    objc_storeStrong(&v16, 0);
    objc_msgSend(v15, "present");

    v14 = 0;
    v8 = (id)objc_msgSend(*(id *)(a1 + 32), "safeDictionaryForKey:", CFSTR("presentationsByIdentifier"));
    v9 = objc_msgSend(v8, "count") != 0;

    v14 = v9;
    if (v9 || (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") <= 1)
    {
      notification = *MEMORY[0x24BEBAED0];
      if (v14)
        v3 = 2;
      else
        v3 = 1;
      v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      UIAccessibilityPostNotification(notification, v6);

    }
    else
    {
      v7 = *(void **)(a1 + 40);
      v2 = objc_msgSend(v7, "count");
      v26 = 1;
      v25 = v2 - 1;
      v27 = 1;
      v28 = v2 - 1;
      v12[1] = (id)1;
      v12[2] = (id)(v2 - 1);
      v13 = (id)objc_msgSend(v7, "subarrayWithRange:", 1, v2 - 1);
      +[UIViewAccessibility _axTriggerNextContextMenuInteractionInQueue:forElement:targetPointValue:](*(_QWORD *)(a1 + 64), v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      objc_storeStrong(&v13, 0);
    }
  }
}

- (BOOL)_accessibilityShowContextMenuForElement:(id)a3 targetPointValue:(id)a4
{
  id v4;
  id v5;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v16;
  _QWORD __b[8];
  id v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id location[2];
  UIViewAccessibility *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  v20 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = v24;
  while (v19)
  {
    memset(__b, 0, sizeof(__b));
    v13 = (id)objc_msgSend(v19, "interactions");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(v13);
        v18 = *(id *)(__b[1] + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v18;
          objc_msgSend(v20, "addObject:", v16);
          objc_storeStrong(&v16, 0);
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", __b, v25, 16);
          if (!v12)
            break;
        }
      }
    }

    v4 = (id)objc_msgSend(v19, "superview");
    v5 = v19;
    v19 = v4;

  }
  objc_storeStrong(&v19, 0);
  if (objc_msgSend(v20, "count") != 0)
  {
    v21 = 1;
    +[UIViewAccessibility _axTriggerNextContextMenuInteractionInQueue:forElement:targetPointValue:]((uint64_t)UIViewAccessibility, v20, location[0], v22);
  }
  v8 = v21;
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (id)_accessibilityUserTestingChildrenInAccessibilitySortedOrder:(BOOL)a3
{
  return -[UIViewAccessibility automationElements](self, "automationElements");
}

- (id)__accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  id v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  id v29;
  char v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  id v48;
  id v49;
  id v51;
  char v52;
  uint64_t (**v53)(id, UIViewAccessibility *);
  char v54;
  BOOL v55;
  char v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  int v68;
  char v69;
  NSObject *v70;
  id v71;
  double v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  os_log_type_t v81;
  NSObject *v82;
  os_log_type_t v83;
  char v84;
  char v85;
  NSObject *v86;
  os_log_type_t v87;
  NSObject *v88;
  os_log_type_t v89;
  char v90;
  NSObject *v91;
  os_log_type_t v92;
  NSObject *v93;
  os_log_type_t v94;
  NSObject *v95;
  os_log_type_t v96;
  id v97;
  BOOL IsUserInteractionEnabled;
  char v99;
  char v100;
  id v101;
  char v102;
  id v103;
  NSObject *v104;
  os_log_type_t v105;
  NSString *v106;
  int v107;
  int v108;
  id v109;
  BOOL v110;
  NSObject *v111;
  os_log_type_t v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  id obj;
  uint64_t v119;
  char v120;
  BOOL v121;
  BOOL v122;
  uint64_t (**v123)(id, UIViewAccessibility *);
  char v124;
  id v125;
  BOOL v126;
  NSObject *v127;
  os_log_type_t v128;
  UIViewAccessibility *v129;
  NSObject *log;
  os_log_type_t v131;
  NSString *v132;
  os_log_t v133;
  os_log_type_t v134;
  os_log_t v135[3];
  os_log_type_t v136;
  os_log_t oslog;
  id v138;
  char v139;
  id v140;
  char v141;
  id v142;
  id v143;
  char v144;
  id v145[3];
  id v146;
  _QWORD v147[8];
  void *v148;
  char v149;
  os_log_type_t v150;
  id v151;
  id v152;
  id v153;
  char v154;
  id v155[7];
  double v156;
  uint64_t v157;
  uint64_t v158;
  char v159;
  _QWORD v160[8];
  id v161;
  id v162;
  os_log_type_t v163;
  id v164;
  os_log_type_t v165;
  id v166;
  char v167;
  uint64_t (**v168)(id, id);
  os_log_type_t v169;
  id v170;
  BOOL v171;
  os_log_type_t v172;
  id v173;
  id v174;
  id v175;
  os_log_type_t v176;
  id v177;
  os_log_type_t v178;
  id v179;
  os_log_type_t v180;
  id v181;
  char v182;
  double v183;
  double v184;
  id v185;
  CGRect v186;
  char v187;
  BOOL v188;
  id v189;
  id v190;
  char v191;
  CGPoint v192;
  NSString *v193;
  os_log_type_t v194;
  id v195;
  id v196;
  CGPoint v197;
  char v198;
  id v199;
  double v200;
  id v201;
  id v202;
  uint64_t v203;
  uint64_t i;
  char v205;
  id v206;
  id v207;
  id v208;
  os_log_type_t v209;
  id v210;
  CGRect v211;
  CGPoint v212;
  id v213;
  double v214;
  double v215;
  _QWORD __b[8];
  id v217;
  char v218;
  id v219;
  char v220;
  id v221;
  char v222;
  id v223;
  char v224;
  id v225;
  id v226;
  char v227;
  id v228;
  char v229;
  UIViewAccessibility *v230;
  char v231;
  char v232;
  id v233;
  id v234[5];
  id v235;
  id v236;
  os_log_type_t v237;
  id v238;
  objc_super v239;
  char v240;
  id v241;
  int v242;
  uint8_t v243[7];
  os_log_type_t v244;
  id v245;
  NSString *v246;
  os_log_type_t type;
  id v248;
  BOOL v249;
  BOOL v250;
  char v251;
  id location[2];
  UIViewAccessibility *v253;
  CGPoint v254;
  UIViewAccessibility *v255;
  int v256;
  int v257;
  int v258;
  uint8_t v259[16];
  uint8_t v260[16];
  uint8_t v261[32];
  _BYTE v262[128];
  uint8_t v263[16];
  _BYTE v264[128];
  uint8_t v265[16];
  uint8_t v266[32];
  uint8_t v267[16];
  uint8_t v268[16];
  uint8_t v269[16];
  uint8_t v270[32];
  uint8_t v271[32];
  uint8_t v272[32];
  uint8_t v273[16];
  _BYTE v274[128];
  uint8_t v275[16];
  uint8_t v276[24];
  uint64_t v277;
  CGRect v278;
  CGRect v279;

  v277 = *MEMORY[0x24BDAC8D0];
  v254 = a3;
  v253 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v251 = objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1;
  v250 = (unsigned __int16)objc_msgSend(location[0], "_accessibilityHitTestType") == 3;
  v249 = _AXSAutomationEnabled() != 0;
  if (v249)
  {
    v248 = (id)AXLogUIA();
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v248, OS_LOG_TYPE_INFO))
    {
      log = v248;
      v131 = type;
      v129 = v253;
      v132 = NSStringFromCGPoint(v254);
      v246 = v132;
      __os_log_helper_16_3_2_8_69_8_64((uint64_t)v276, (uint64_t)v129, (uint64_t)v246);
      _os_log_impl(&dword_230C4A000, log, v131, "Hit test: %{sensitive}@ > %@", v276, 0x16u);

      objc_storeStrong((id *)&v246, 0);
    }
    objc_storeStrong(&v248, 0);
  }
  if (!-[UIViewAccessibility accessibilityElementsHidden](v253, "accessibilityElementsHidden"))
  {
    v241 = (id)-[UIViewAccessibility _accessibilityFuzzyHitTestElements](v253, "_accessibilityFuzzyHitTestElements");
    v240 = -[UIViewAccessibility _accessibilityHitTestShouldFallbackToNearestChild](v253, "_accessibilityHitTestShouldFallbackToNearestChild") & 1;
    if (v240
      && (v251 & 1) == 0
      && (-[UIViewAccessibility isAccessibilityOpaqueElementProvider](v253, "isAccessibilityOpaqueElementProvider") & 1) == 0
      && (v241
       || (-[UIViewAccessibility _accessibilityHasOrderedChildren](v253, "_accessibilityHasOrderedChildren") & 1) != 0))
    {
      v239.receiver = v253;
      v239.super_class = (Class)UIViewAccessibility;
      v255 = (UIViewAccessibility *)-[UIViewAccessibility _accessibilityHitTest:withEvent:](&v239, sel__accessibilityHitTest_withEvent_, location[0], v254.x, v254.y);
      v242 = 1;
      goto LABEL_317;
    }
    if (!-[UIViewAccessibility _accessibilityPointInside:withEvent:](v253, "_accessibilityPointInside:withEvent:", location[0], v254.x, v254.y))
    {
      if (v249)
      {
        v238 = (id)AXLogUIA();
        v237 = OS_LOG_TYPE_INFO;
        if (os_log_type_enabled((os_log_t)v238, OS_LOG_TYPE_INFO))
        {
          __os_log_helper_16_3_1_8_69((uint64_t)v275, (uint64_t)v253);
          _os_log_impl(&dword_230C4A000, (os_log_t)v238, v237, "Point was not inside self %{sensitive}@", v275, 0xCu);
        }
        objc_storeStrong(&v238, 0);
      }
      if (-[UIViewAccessibility _accessibilityBlocksInteraction](v253, "_accessibilityBlocksInteraction"))
      {
        v255 = v253;
        v242 = 1;
        goto LABEL_317;
      }
      v236 = (id)-[UIViewAccessibility hitTest:withEvent:](v253, "hitTest:withEvent:", location[0], v254.x, v254.y);
      if (v236)
      {
        if ((-[UIViewAccessibility isDescendantOfView:](v253, "isDescendantOfView:", v236) & 1) != 0)
        {
          v255 = 0;
          v242 = 1;
        }
        else
        {
          objc_msgSend(v236, "convertPoint:fromView:", v253, v254.x, v254.y);
          v234[3] = v4;
          v234[4] = v5;
          v235 = (id)objc_msgSend(v236, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v4, *(double *)&v5);
          if ((objc_msgSend(v236, "isDescendantOfView:", v253) & 1) != 0)
          {
            v6 = (id)objc_msgSend(v236, "superview");
            v7 = v236;
            v236 = v6;

            while (1)
            {
              v126 = 0;
              if (!v235)
                v126 = v236 != v253;
              if (!v126)
                break;
              objc_msgSend(v236, "convertPoint:fromView:", v253, v254.x, v254.y);
              v234[1] = v8;
              v234[2] = v9;
              v10 = (id)objc_msgSend(v236, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v8, *(double *)&v9);
              v11 = v235;
              v235 = v10;

              v12 = (id)objc_msgSend(v236, "superview");
              v13 = v236;
              v236 = v12;

            }
          }
          v255 = (UIViewAccessibility *)v235;
          v242 = 1;
          objc_storeStrong(&v235, 0);
        }
      }
      else if ((-[UIViewAccessibility _accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:](v253, "_accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:", location[0], v254) & 1) != 0)
      {
        v242 = 0;
      }
      else
      {
        v255 = 0;
        v242 = 1;
      }
      objc_storeStrong(&v236, 0);
      if (v242)
      {
LABEL_317:
        objc_storeStrong(&v241, 0);
        goto LABEL_318;
      }
    }
    v125 = (id)objc_msgSend(location[0], "_accessibilityHitTestOptions");
    v232 = 0;
    if (v125)
    {
      v14 = v125;
    }
    else
    {
      v233 = (id)objc_msgSend(MEMORY[0x24BEBADE0], "defaultOptions");
      v232 = 1;
      v14 = v233;
    }
    v234[0] = v14;
    if ((v232 & 1) != 0)

    v231 = 0;
    v123 = (uint64_t (**)(id, UIViewAccessibility *))(id)objc_msgSend(v234[0], "leafNodePredicate");
    v124 = 1;
    if ((v123[2](v123, v253) & 1) == 0)
    {
      v122 = 0;
      if ((v251 & 1) != 0)
        v122 = -[UIViewAccessibility _accessibilityViewIsBeingHitTested:]((uint64_t)v253, v253);
      v124 = v122;
    }

    v231 = v124 & 1;
    v229 = 0;
    v121 = 0;
    if ((v124 & 1) != 0)
    {
      -[UIViewAccessibility alpha](v253, "alpha");
      if (v15 > 0.0
        || (v121 = 0,
            (-[UIViewAccessibility _accessibilityOverridesInvisibility](v253, "_accessibilityOverridesInvisibility") & 1) != 0))
      {
        v230 = (UIViewAccessibility *)(id)objc_msgSend(location[0], "_accessibilityHitTestStartsAtElement");
        v229 = 1;
        v121 = 0;
        if (v230 != v253)
          v121 = !v250;
      }
    }
    if ((v229 & 1) != 0)

    if (v121)
    {
      v228 = (id)-[UIViewAccessibility _accessibilityHitTestSupplementaryViews:event:](v253, "_accessibilityHitTestSupplementaryViews:event:", location[0], v254.x, v254.y);
      if (v228)
      {
        v255 = (UIViewAccessibility *)v228;
        v242 = 1;
      }
      else
      {
        if ((v251 & 1) == 0)
          goto LABEL_89;
        v227 = 0;
        if ((objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) == 0
          || (v120 = 1,
              (-[UIViewAccessibility _accessibilityAutomationHitTestReverseOrder](v253, "_accessibilityAutomationHitTestReverseOrder") & 1) == 0))
        {
          v120 = -[UIViewAccessibility _accessibilityHitTestReverseOrder](v253, "_accessibilityHitTestReverseOrder");
        }
        v227 = v120 & 1;
        v224 = 0;
        v222 = 0;
        v220 = 0;
        v218 = 0;
        if ((v120 & 1) != 0)
        {
          v225 = -[UIViewAccessibility automationElements](v253, "automationElements");
          v224 = 1;
          v223 = (id)objc_msgSend(v225, "reverseObjectEnumerator");
          v222 = 1;
          v16 = (id)objc_msgSend(v223, "allObjects");
          v221 = v16;
          v220 = 1;
        }
        else
        {
          v16 = -[UIViewAccessibility automationElements](v253, "automationElements");
          v219 = v16;
          v218 = 1;
        }
        v226 = v16;
        if ((v218 & 1) != 0)

        if ((v220 & 1) != 0)
        if ((v222 & 1) != 0)

        if ((v224 & 1) != 0)
        memset(__b, 0, sizeof(__b));
        obj = v226;
        v119 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v274, 16);
        if (v119)
        {
          v115 = *(_QWORD *)__b[2];
          v116 = 0;
          v117 = v119;
          while (1)
          {
            v114 = v116;
            if (*(_QWORD *)__b[2] != v115)
              objc_enumerationMutation(obj);
            v217 = *(id *)(__b[1] + 8 * v116);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v214 = 0.0;
              v215 = 0.0;
              objc_msgSend(v217, "convertPoint:fromView:", v253, v254.x, v254.y);
              v214 = v17;
              v215 = v18;
              v213 = (id)objc_msgSend(v217, "_accessibilityHitTest:withEvent:", location[0], v17, v18);
              if (v213)
              {
                v255 = (UIViewAccessibility *)v213;
                v242 = 1;
              }
              else
              {
                v242 = 0;
              }
              objc_storeStrong(&v213, 0);
              if (v242)
                break;
            }
            UIAccessibilityPointForPoint();
            v212.x = v19;
            v212.y = v20;
            objc_msgSend(v217, "accessibilityFrame");
            v211 = v278;
            if (CGRectContainsPoint(v278, v212))
            {
              v255 = (UIViewAccessibility *)v217;
              v242 = 1;
              break;
            }
            ++v116;
            if (v114 + 1 >= v117)
            {
              v116 = 0;
              v117 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v274, 16);
              if (!v117)
                goto LABEL_85;
            }
          }
        }
        else
        {
LABEL_85:
          v242 = 0;
        }

        if (!v242)
          v242 = 0;
        objc_storeStrong(&v226, 0);
        if (!v242)
        {
LABEL_89:
          if (v249)
          {
            v210 = (id)AXLogUIA();
            v209 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)v210, OS_LOG_TYPE_INFO))
            {
              v111 = v210;
              v112 = v209;
              v113 = (id)UIAXMassageElementDescription();
              v208 = v113;
              __os_log_helper_16_2_1_8_64((uint64_t)v273, (uint64_t)v208);
              _os_log_impl(&dword_230C4A000, v111, v112, "Was valid accessibility element, and everything else checked out, so returning self %@", v273, 0xCu);

              objc_storeStrong(&v208, 0);
            }
            objc_storeStrong(&v210, 0);
          }
          v255 = v253;
          v242 = 1;
        }
      }
      objc_storeStrong(&v228, 0);
      goto LABEL_316;
    }
    v109 = (id)-[UIViewAccessibility _accessibilityAdditionalElements](v253, "_accessibilityAdditionalElements");
    v110 = objc_msgSend(v109, "count") == 0;

    if (!v110)
    {
      v207 = (id)-[UIViewAccessibility _accessibilityHitTestAdditionalElements:event:](v253, "_accessibilityHitTestAdditionalElements:event:", location[0], v254.x, v254.y);
      if (v207)
      {
        v255 = (UIViewAccessibility *)v207;
        v242 = 1;
      }
      else
      {
        v242 = 0;
      }
      objc_storeStrong(&v207, 0);
      if (v242)
        goto LABEL_316;
    }
    v206 = -[UIViewAccessibility _accessibilityHitTestSubviews](v253, "_accessibilityHitTestSubviews");
    if ((-[UIViewAccessibility _accessibilityIsIgnored]() & 1) != 0 && !objc_msgSend(v206, "count"))
    {
      v255 = 0;
      v242 = 1;
      goto LABEL_315;
    }
    v205 = 0;
    v203 = objc_msgSend(v206, "count");
    v202 = 0;
    v201 = 0;
    v200 = 3.40282347e38;
    for (i = v203 - 1; ; --i)
    {
      if (i < 0)
      {
LABEL_231:
        if (v202)
        {
          v149 = 0;
          v69 = 1;
          if ((objc_msgSend(v202, "accessibilityElementsHidden") & 1) == 0)
          {
            LOBYTE(v68) = 0;
            if ((objc_msgSend(v202, "isAccessibilityElement") & 1) == 0)
            {
              LOBYTE(v68) = 0;
              if ((objc_msgSend(v202, "_accessibilityIsTouchContainer") & 1) == 0)
                v68 = objc_msgSend(v202, "accessibilityViewIsModal") ^ 1;
            }
            v69 = v68;
          }
          v149 = v69 & 1;
          if ((-[UIViewAccessibility accessibilityIsWindow](v253, "accessibilityIsWindow") & 1) != 0
            && (v149 & 1) != 0
            && (v251 & 1) != 0)
          {
            v149 = 0;
          }
          if (-[UIViewAccessibility accessibilityViewIsModal](v253, "accessibilityViewIsModal") && (v149 & 1) != 0)
          {
            v255 = v253;
            v242 = 1;
          }
          else
          {
            v255 = (UIViewAccessibility *)v202;
            v242 = 1;
          }
        }
        else
        {
          if (!-[UIViewAccessibility _accessibilityShouldHitTestLayers](v253, "_accessibilityShouldHitTestLayers"))
            goto LABEL_262;
          v65 = (id)-[UIViewAccessibility layer](v253, "layer");
          v42 = (id)objc_msgSend(v65, "sublayers");
          v43 = v206;
          v206 = v42;

          memset(v147, 0, sizeof(v147));
          v66 = (id)objc_msgSend(v206, "reverseObjectEnumerator");
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v147, v262, 16);
          if (v67)
          {
            v62 = *(_QWORD *)v147[2];
            v63 = 0;
            v64 = v67;
            while (1)
            {
              v61 = v63;
              if (*(_QWORD *)v147[2] != v62)
                objc_enumerationMutation(v66);
              v148 = *(void **)(v147[1] + 8 * v63);
              v59 = v148;
              v58 = v148;
              v60 = (id)-[UIViewAccessibility layer](v253, "layer");
              objc_msgSend(v58, "convertPoint:fromLayer:", v254.x, v254.y);
              v145[1] = v44;
              v145[2] = v45;
              v146 = (id)objc_msgSend(v59, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v44, *(double *)&v45);

              if (v146)
              {
                v255 = (UIViewAccessibility *)v146;
                v242 = 1;
              }
              else
              {
                v242 = 0;
              }
              objc_storeStrong(&v146, 0);
              if (v242)
                break;
              ++v63;
              if (v61 + 1 >= v64)
              {
                v63 = 0;
                v64 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v147, v262, 16);
                if (!v64)
                  goto LABEL_256;
              }
            }
          }
          else
          {
LABEL_256:
            v242 = 0;
          }

          if (!v242)
          {
            v57 = (id)-[UIViewAccessibility layer](v253, "layer");
            v145[0] = (id)objc_msgSend(v57, "_accessibilityHitTest:withEvent:", location[0], v254);

            if (v145[0])
            {
              v255 = (UIViewAccessibility *)v145[0];
              v242 = 1;
            }
            else
            {
              v242 = 0;
            }
            objc_storeStrong(v145, 0);
            if (!v242)
            {
LABEL_262:
              v144 = 0;
              v56 = 0;
              if (-[UIViewAccessibility accessibilityViewIsModal](v253, "accessibilityViewIsModal"))
                v56 = -[UIViewAccessibility _accessibilityViewIsVisible](v253, "_accessibilityViewIsVisible");
              v144 = v56 & 1;
              if ((v56 & 1) == 0
                || (-[UIViewAccessibility _accessibilityAllowsSiblingsWhenOvergrown](v253, "_accessibilityAllowsSiblingsWhenOvergrown") & 1) != 0)
              {
                if ((v240 & 1) != 0 && v201)
                {
                  v255 = (UIViewAccessibility *)v201;
                  v242 = 1;
                }
                else
                {
                  v53 = (uint64_t (**)(id, UIViewAccessibility *))(id)objc_msgSend(v234[0], "fallbackPredicate");
                  v54 = 1;
                  if ((v53[2](v53, v253) & 1) == 0)
                  {
                    v52 = 0;
                    if (v250)
                    {
                      objc_opt_class();
                      v52 = 0;
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                        v52 = -[UIViewAccessibility _accessibilityScrollingEnabled](v253, "_accessibilityScrollingEnabled");
                    }
                    v54 = v52;
                  }

                  if ((v54 & 1) != 0)
                  {
                    v255 = v253;
                    v242 = 1;
                  }
                  else if ((v251 & 1) != 0
                         && -[UIViewAccessibility _accessibilityIsUserInteractionEnabledChain](v253)
                         && !-[UIViewAccessibility _accessibilityIsDescendantOfHostingView](v253, "_accessibilityIsDescendantOfHostingView"))
                  {
                    v138 = (id)-[UIViewAccessibility hitTest:withEvent:](v253, "hitTest:withEvent:", location[0], v254.x, v254.y);
                    if (v249)
                    {
                      oslog = (os_log_t)(id)AXLogUIA();
                      v136 = OS_LOG_TYPE_INFO;
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                      {
                        __os_log_helper_16_3_2_8_69_8_69((uint64_t)v261, (uint64_t)v253, (uint64_t)v138);
                        _os_log_impl(&dword_230C4A000, oslog, v136, "Returning self or subview of self (self %{sensitive}@, result %{sensitive}@)", v261, 0x16u);
                      }
                      objc_storeStrong((id *)&oslog, 0);
                    }
                    if ((objc_msgSend(v138, "isEqual:", v253) & 1) == 0
                      && (-[UIViewAccessibility _accessibilityIsViewDescendantOfElement:](v253, "_accessibilityIsViewDescendantOfElement:", v138) & 1) == 0)
                    {
                      v51 = v138;
                      -[UIViewAccessibility convertPoint:toView:](v253, "convertPoint:toView:", v138, v254.x, v254.y);
                      v135[1] = v46;
                      v135[2] = v47;
                      v48 = (id)objc_msgSend(v51, "_accessibilityHitTest:withEvent:", location[0], *(double *)&v46, *(double *)&v47);
                      v49 = v138;
                      v138 = v48;

                      if (v249)
                      {
                        v135[0] = (os_log_t)(id)AXLogUIA();
                        v134 = OS_LOG_TYPE_INFO;
                        if (os_log_type_enabled(v135[0], OS_LOG_TYPE_INFO))
                        {
                          __os_log_helper_16_3_1_8_69((uint64_t)v260, (uint64_t)v138);
                          _os_log_impl(&dword_230C4A000, v135[0], v134, "Performed further axHitTest post process to get (result %{sensitive}@)", v260, 0xCu);
                        }
                        objc_storeStrong((id *)v135, 0);
                      }
                    }
                    v255 = (UIViewAccessibility *)v138;
                    v242 = 1;
                    objc_storeStrong(&v138, 0);
                  }
                  else
                  {
                    if (v249)
                    {
                      v133 = (os_log_t)(id)AXLogUIA();
                      if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
                      {
                        __os_log_helper_16_3_1_8_69((uint64_t)v259, (uint64_t)v253);
                        _os_log_impl(&dword_230C4A000, v133, OS_LOG_TYPE_INFO, "Returning nil because we didn't hit one of our subviews but the point is inside %{sensitive}@", v259, 0xCu);
                      }
                      objc_storeStrong((id *)&v133, 0);
                    }
                    v255 = 0;
                    v242 = 1;
                  }
                }
              }
              else
              {
                v143 = -[UIViewAccessibility _accessibilityCheckForAllowedModalView:event:](v253, location[0], v254.x, v254.y);
                if (v143)
                {
                  v255 = (UIViewAccessibility *)v143;
                  v242 = 1;
                }
                else if ((v144 & 1) != 0
                       || (v205 & 1) != 0
                       || -[UIViewAccessibility isAccessibilityElement](v253, "isAccessibilityElement")
                       || (-[UIViewAccessibility _accessibilityHasOrderedChildren](v253, "_accessibilityHasOrderedChildren") & 1) != 0|| (-[UIViewAccessibility _accessibilityIsTouchContainer](v253, "_accessibilityIsTouchContainer") & 1) != 0)
                {
                  v141 = 0;
                  v139 = 0;
                  v55 = 0;
                  if ((-[UIViewAccessibility _accessibilityAllowsSiblingsWhenOvergrown](v253, "_accessibilityAllowsSiblingsWhenOvergrown") & 1) != 0)
                  {
                    v142 = (id)-[UIViewAccessibility superview](v253, "superview");
                    v141 = 1;
                    v140 = (id)objc_msgSend(v142, "subviews");
                    v139 = 1;
                    v55 = (unint64_t)objc_msgSend(v140, "count") > 1;
                  }
                  if ((v139 & 1) != 0)

                  if ((v141 & 1) != 0)
                  if (v55)
                    v255 = 0;
                  else
                    v255 = v253;
                  v242 = 1;
                }
                else
                {
                  v255 = 0;
                  v242 = 1;
                }
                objc_storeStrong(&v143, 0);
              }
            }
          }
        }
LABEL_314:
        objc_storeStrong(&v201, 0);
        objc_storeStrong(&v202, 0);
LABEL_315:
        objc_storeStrong(&v206, 0);
LABEL_316:
        objc_storeStrong(v234, 0);
        goto LABEL_317;
      }
      v199 = (id)objc_msgSend(v206, "objectAtIndex:", i);
      v198 = 0;
      v258 = 720896;
      v256 = 2;
      v257 = 720896;
      if ((dyld_program_sdk_at_least() & 1) != 0)
      {
        objc_msgSend(v199, "alpha");
        if (v21 == 0.0
          || (objc_msgSend(v199, "isHidden") & 1) != 0
          || (LOBYTE(v108) = 0, (objc_msgSend(v199, "accessibilityElementsHidden") & 1) != 0))
        {
          v108 = objc_msgSend(v199, "_accessibilityOverridesInvisibility") ^ 1;
        }
        v198 = v108 & 1;
      }
      else
      {
        objc_msgSend(v199, "alpha");
        if (v22 == 0.0 || (LOBYTE(v107) = 0, (objc_msgSend(v199, "isHidden") & 1) != 0))
          v107 = objc_msgSend(v199, "_accessibilityOverridesInvisibility") ^ 1;
        v198 = v107 & 1;
      }
      if ((v198 & 1) != 0)
      {
        v242 = 8;
        goto LABEL_227;
      }
      v205 = 1;
      v197.x = 0.0;
      v197.y = 0.0;
      objc_msgSend(v199, "convertPoint:fromView:", v253, v254.x, v254.y);
      v197.x = v23;
      v197.y = v24;
      v196 = (id)objc_msgSend(v199, "_accessibilityHitTest:withEvent:", location[0], v23, v24);
      if ((objc_msgSend(v196, "_accessibilityIsRemoteElement") & 1) != 0
        && (objc_msgSend(v196, "_accessibilityRemoteElementShouldHitTestHostProcess") & 1) != 0)
      {
        v242 = 8;
      }
      else
      {
        if (v249)
        {
          v195 = (id)AXLogUIA();
          v194 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled((os_log_t)v195, OS_LOG_TYPE_INFO))
          {
            v104 = v195;
            v105 = v194;
            v103 = v196;
            v106 = NSStringFromCGPoint(v197);
            v193 = v106;
            __os_log_helper_16_3_3_8_69_8_64_8_64((uint64_t)v272, (uint64_t)v103, (uint64_t)v193, (uint64_t)v199);
            _os_log_impl(&dword_230C4A000, v104, v105, "AX hit test found %{sensitive}@ at converted point %@ for view: %@", v272, 0x20u);

            objc_storeStrong((id *)&v193, 0);
          }
          objc_storeStrong(&v195, 0);
        }
        if (!v196 || (v251 & 1) == 0)
          goto LABEL_161;
        v192.x = 0.0;
        v192.y = 0.0;
        v191 = 0;
        objc_opt_class();
        v190 = (id)__UIAccessibilityCastAsClass();
        if ((v191 & 1) != 0)
          abort();
        v189 = v190;
        objc_storeStrong(&v190, 0);
        v101 = v189;
        UIAccessibilityPointForPoint();
        v192.x = v25;
        v192.y = v26;

        v188 = 0;
        v188 = -[UIViewAccessibility _accessibilityViewIsBeingHitTested:]((uint64_t)v253, v196);
        v187 = 0;
        objc_msgSend(v196, "accessibilityFrame");
        v186 = v279;
        v102 = 0;
        if (CGRectContainsPoint(v279, v192))
        {
          objc_opt_class();
          v100 = 1;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v99 = 0;
            if ((objc_msgSend(v196, "_accessibilityViewIsVisible") & 1) != 0)
              v99 = objc_msgSend(v196, "isUserInteractionEnabled");
            v100 = v99;
          }
          v102 = v100;
        }
        v187 = v102 & 1;
        if (!v188 && (v187 & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v97 = v199;
            -[UIViewAccessibility convertPoint:toView:](v253, "convertPoint:toView:", v199, v254.x, v254.y);
            v183 = v27;
            v184 = v28;
            v185 = (id)objc_msgSend(v97, "hitTest:withEvent:", location[0], v27, v28);
            IsUserInteractionEnabled = 0;
            if ((objc_msgSend(v185, "_accessibilityViewIsVisible") & 1) != 0)
              IsUserInteractionEnabled = -[UIViewAccessibility _accessibilityIsUserInteractionEnabledChain](v185);
            v187 = IsUserInteractionEnabled;
            v188 = -[UIViewAccessibility _accessibilityViewIsBeingHitTested:]((uint64_t)v253, v185);
            v182 = 0;
            v182 = objc_msgSend(v185, "_accessibilityIsDescendantOfElement:", v196) & 1;
            if (v188 || (v182 & 1) != 0)
            {
              if (!_CFMZEnabled()
                || (v182 & 1) == 0
                || (objc_msgSend(v185, "isAccessibilityElement") & 1) != 0)
              {
                objc_storeStrong(&v196, v185);
                if (v249)
                {
                  v179 = (id)AXLogUIA();
                  v178 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v179, OS_LOG_TYPE_INFO))
                  {
                    v93 = v179;
                    v94 = v178;
                    __os_log_helper_16_3_2_8_69_8_69((uint64_t)v270, (uint64_t)v199, (uint64_t)v185);
                    _os_log_impl(&dword_230C4A000, v93, v94, "Found the view we were looking for through touch forwarding views %{sensitive}@ -> %{sensitive}@", v270, 0x16u);
                  }
                  objc_storeStrong(&v179, 0);
                }
              }
            }
            else
            {
              if (v249)
              {
                v181 = (id)AXLogUIA();
                v180 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v181, OS_LOG_TYPE_INFO))
                {
                  v95 = v181;
                  v96 = v180;
                  __os_log_helper_16_3_3_8_69_8_69_8_69((uint64_t)v271, (uint64_t)v199, (uint64_t)v196, (uint64_t)v185);
                  _os_log_impl(&dword_230C4A000, v95, v96, "Not using this view because it looks like it's a touch forwarding view: parent view: %{sensitive}@, foundView: %{sensitive}@ (forward to: %{sensitive}@)", v271, 0x20u);
                }
                objc_storeStrong(&v181, 0);
              }
              v187 = 0;
            }
            objc_storeStrong(&v185, 0);
          }
        }
        if (v188 || (v187 & 1) != 0)
        {
          if (v249)
          {
            v177 = (id)AXLogUIA();
            v176 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled((os_log_t)v177, OS_LOG_TYPE_INFO))
            {
              v91 = v177;
              v92 = v176;
              __os_log_helper_16_3_1_8_69((uint64_t)v269, (uint64_t)v196);
              _os_log_impl(&dword_230C4A000, v91, v92, "Returning the matching UIA test object: %{sensitive}@", v269, 0xCu);
            }
            objc_storeStrong(&v177, 0);
          }
          v255 = (UIViewAccessibility *)v196;
          v242 = 1;
        }
        else
        {
LABEL_161:
          if (v196)
          {
            if (!v202)
              objc_storeStrong(&v202, v196);
            v175 = 0;
            v174 = 0;
            v90 = -[UIViewAccessibility _accessibilityModalViewBlocksView:blockerView:]((uint64_t)v253, v196, &v174);
            objc_storeStrong(&v175, v174);
            if ((v90 & 1) != 0)
            {
              if (v249)
              {
                v173 = (id)AXLogUIA();
                v172 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v173, OS_LOG_TYPE_INFO))
                {
                  v88 = v173;
                  v89 = v172;
                  __os_log_helper_16_3_1_8_69((uint64_t)v268, (uint64_t)v175);
                  _os_log_impl(&dword_230C4A000, v88, v89, "Something blocks the view we found, so skipping it.  We also uncache our first good view for some reason...: %{sensitive}@", v268, 0xCu);
                }
                objc_storeStrong(&v173, 0);
              }
              objc_storeStrong(&v202, 0);
              v242 = 8;
            }
            else
            {
              v171 = 0;
              if ((v251 & 1) != 0)
              {
                v29 = (id)objc_msgSend(v196, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_310, 1);
                v171 = v29 != 0;

                if (v249)
                {
                  v170 = (id)AXLogUIA();
                  v169 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v170, OS_LOG_TYPE_INFO))
                  {
                    v86 = v170;
                    v87 = v169;
                    __os_log_helper_16_0_1_4_0((uint64_t)v267, v171);
                    _os_log_impl(&dword_230C4A000, v86, v87, "Is this an expected hit test view? %d", v267, 8u);
                  }
                  objc_storeStrong(&v170, 0);
                }
              }
              v30 = objc_msgSend(v196, "accessibilityElementsHidden");
              v167 = 0;
              v85 = 1;
              if ((v30 & 1) == 0)
              {
                v168 = (uint64_t (**)(id, id))(id)objc_msgSend(v234[0], "isEligibleElement");
                v167 = 1;
                v84 = 0;
                if ((v168[2](v168, v196) & 1) == 0)
                  v84 = !v171;
                v85 = v84;
              }
              if ((v167 & 1) != 0)

              if ((v85 & 1) != 0)
              {
                if (v249)
                {
                  v166 = (id)AXLogUIA();
                  v165 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v166, OS_LOG_TYPE_INFO))
                  {
                    v82 = v166;
                    v83 = v165;
                    __os_log_helper_16_3_3_8_69_4_0_4_0((uint64_t)v266, (uint64_t)v196, objc_msgSend(v196, "accessibilityElementsHidden") & 1, objc_msgSend(v196, "isAccessibilityElement") & 1);
                    _os_log_impl(&dword_230C4A000, v82, v83, "Can't use this view, so keep going: %{sensitive}@ hidden: %d iselement: %d", v266, 0x18u);
                  }
                  objc_storeStrong(&v166, 0);
                }
                if (v202 == v196)
                  objc_storeStrong(&v202, 0);
                v242 = 0;
              }
              else
              {
                if (v249)
                {
                  v164 = (id)AXLogUIA();
                  v163 = OS_LOG_TYPE_INFO;
                  if (os_log_type_enabled((os_log_t)v164, OS_LOG_TYPE_INFO))
                  {
                    v80 = v164;
                    v81 = v163;
                    __os_log_helper_16_3_1_8_69((uint64_t)v265, (uint64_t)v196);
                    _os_log_impl(&dword_230C4A000, v80, v81, "Returning the view we found via AX hit test %{sensitive}@", v265, 0xCu);
                  }
                  objc_storeStrong(&v164, 0);
                }
                v255 = (UIViewAccessibility *)v196;
                v242 = 1;
              }
            }
            objc_storeStrong(&v175, 0);
            if (v242)
              goto LABEL_226;
          }
          else if ((v240 & 1) != 0)
          {
            v162 = (id)objc_msgSend(v199, "_accessibilityAccessibleDescendants");
            memset(v160, 0, sizeof(v160));
            v78 = v162;
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", v160, v264, 16);
            if (v79)
            {
              v75 = *(_QWORD *)v160[2];
              v76 = 0;
              v77 = v79;
              while (1)
              {
                v74 = v76;
                if (*(_QWORD *)v160[2] != v75)
                  objc_enumerationMutation(v78);
                v161 = *(id *)(v160[1] + 8 * v76);
                v159 = 0;
                v159 = objc_msgSend(v161, "accessibilityElementsHidden") & 1;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v161, "alpha");
                  if (v31 == 0.0 || (LOBYTE(v73) = 0, (objc_msgSend(v161, "isHidden") & 1) != 0))
                    v73 = objc_msgSend(v161, "_accessibilityOverridesInvisibility") ^ 1;
                  v159 = (v159 & 1 | v73 & 1) != 0;
                }
                if ((v159 & 1) == 0)
                {
                  v157 = 0;
                  v158 = 0;
                  UIAccessibilityPointForPoint();
                  v157 = v32;
                  v158 = v33;
                  v156 = 0.0;
                  objc_msgSend(v161, "accessibilityFrame");
                  v155[1] = v34;
                  v155[2] = v35;
                  v155[3] = v36;
                  v155[4] = v37;
                  AX_CGRectGetCenter();
                  v155[5] = v38;
                  v155[6] = v39;
                  AX_CGPointGetDistanceToPoint();
                  v156 = v40;
                  if (v40 < v200)
                  {
                    v72 = v156;
                    -[UIViewAccessibility _accessibilityMaxFuzzyHitTestDistance](v253, "_accessibilityMaxFuzzyHitTestDistance");
                    if (v72 < v41)
                    {
                      v200 = v156;
                      objc_storeStrong(&v201, v161);
                    }
                  }
                }
                ++v76;
                if (v74 + 1 >= v77)
                {
                  v76 = 0;
                  v77 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", v160, v264, 16);
                  if (!v77)
                    break;
                }
              }
            }

            objc_storeStrong(&v162, 0);
          }
          if ((objc_msgSend(v199, "accessibilityViewIsModal") & 1) != 0
            && (objc_msgSend(v199, "_accessibilityViewIsVisible") & 1) != 0)
          {
            v154 = 0;
            objc_opt_class();
            v153 = (id)__UIAccessibilityCastAsSafeCategory();
            if ((v154 & 1) != 0)
              abort();
            v152 = v153;
            objc_storeStrong(&v153, 0);
            v71 = v152;
            v155[0] = -[UIViewAccessibility _accessibilityCheckForAllowedModalView:event:](v152, location[0], v197.x, v197.y);

            if (v155[0])
            {
              if (v249)
              {
                v151 = (id)AXLogUIA();
                v150 = OS_LOG_TYPE_INFO;
                if (os_log_type_enabled((os_log_t)v151, OS_LOG_TYPE_INFO))
                {
                  v70 = v151;
                  __os_log_helper_16_3_1_8_69((uint64_t)v263, (uint64_t)v155[0]);
                  _os_log_impl(&dword_230C4A000, v70, v150, "Returning our allowed modal view %{sensitive}@", v263, 0xCu);
                }
                objc_storeStrong(&v151, 0);
              }
              v255 = (UIViewAccessibility *)v155[0];
              v242 = 1;
            }
            else
            {
              v242 = 6;
            }
            objc_storeStrong(v155, 0);
          }
          else
          {
            v242 = 0;
          }
        }
      }
LABEL_226:
      objc_storeStrong(&v196, 0);
LABEL_227:
      objc_storeStrong(&v199, 0);
      if (v242)
      {
        if (v242 == 6)
          goto LABEL_231;
        if (v242 != 8)
          goto LABEL_314;
      }
    }
  }
  if (v249)
  {
    v245 = (id)AXLogUIA();
    v244 = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled((os_log_t)v245, OS_LOG_TYPE_INFO))
    {
      v127 = v245;
      v128 = v244;
      __os_log_helper_16_0_0(v243);
      _os_log_impl(&dword_230C4A000, v127, v128, "Elements were hidden, returning nil", v243, 2u);
    }
    objc_storeStrong(&v245, 0);
  }
  v255 = 0;
  v242 = 1;
LABEL_318:
  objc_storeStrong(location, 0);
  return v255;
}

- (BOOL)_accessibilityViewIsBeingHitTested:(uint64_t)a1
{
  id v2;
  id location;
  uint64_t v5;
  BOOL v6;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    v2 = (id)objc_msgSend(location, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_312_0, 1);
    v6 = v2 != 0;

  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(&location, 0);
  return v6;
}

uint64_t __56__UIViewAccessibility___accessibilityHitTest_withEvent___block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityElementIsBeingHitTested");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityCheckForAllowedModalView:(double)a3 event:(double)a4
{
  id v4;
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  __int128 v30;
  _QWORD __b[8];
  id v32;
  id v33;
  id v34;
  id v35;
  int v36;
  id location;
  id v38;
  __int128 v39;
  id v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  *(double *)&v39 = a3;
  *((double *)&v39 + 1) = a4;
  v38 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v38)
  {
    v35 = (id)objc_msgSend(v38, "_accessibilityObscuredScreenAllowedViews");
    v34 = (id)objc_msgSend(v38, "_accessibilityHitTestingObscuredScreenAllowedViews");
    if (v34)
    {
      if (v35)
      {
        v4 = (id)objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v34);
        v5 = v35;
        v35 = v4;

      }
      else
      {
        objc_storeStrong(&v35, v34);
      }
    }
    v33 = (id)objc_msgSend(v38, "_accessibilityWindow");
    memset(__b, 0, sizeof(__b));
    obj = v35;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
    if (v20)
    {
      v16 = *(_QWORD *)__b[2];
      v17 = 0;
      v18 = v20;
      while (1)
      {
        v15 = v17;
        if (*(_QWORD *)__b[2] != v16)
          objc_enumerationMutation(obj);
        v32 = *(id *)(__b[1] + 8 * v17);
        if (v32 != v38 && v32 != v33)
        {
          v30 = v39;
          v29 = (id)objc_msgSend(v32, "_accessibilityWindow");
          v27 = 0;
          v25 = 0;
          v14 = 0;
          if (v33)
          {
            v14 = 0;
            if (v29)
            {
              v13 = (id)objc_msgSend(v38, "_accessibilityWindow");
              v28 = v13;
              v27 = 1;
              v26 = (id)objc_msgSend(v32, "_accessibilityWindow");
              v25 = 1;
              v14 = v13 != v26;
            }
          }
          if ((v25 & 1) != 0)

          if ((v27 & 1) != 0)
          if (v14)
          {
            objc_msgSend(v29, "convertPoint:fromView:", v38, v30);
            *(double *)&v24 = v6;
            *((double *)&v24 + 1) = v7;
            v30 = v24;
            objc_msgSend(v29, "convertPoint:toView:", v32, v6, v7);
            *(_QWORD *)&v23 = v8;
            *((_QWORD *)&v23 + 1) = v9;
            v30 = v23;
          }
          else
          {
            objc_msgSend(v32, "convertPoint:fromView:", v38, v39);
            *(_QWORD *)&v22 = v10;
            *((_QWORD *)&v22 + 1) = v11;
            v30 = v22;
          }
          v21 = (id)objc_msgSend(v32, "_accessibilityHitTest:withEvent:", location, v30);
          if (v21)
          {
            v40 = v21;
            v36 = 1;
          }
          else
          {
            v36 = 0;
          }
          objc_storeStrong(&v21, 0);
          objc_storeStrong(&v29, 0);
          if (v36)
            break;
        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          v17 = 0;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
          if (!v18)
            goto LABEL_30;
        }
      }
    }
    else
    {
LABEL_30:
      v36 = 0;
    }

    if (!v36)
    {
      v40 = 0;
      v36 = 1;
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
  }
  else
  {
    v40 = 0;
    v36 = 1;
  }
  objc_storeStrong(&location, 0);
  return v40;
}

uint64_t __58__UIViewAccessibility__accessibilityViewIsBeingHitTested___block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityBoolValueForKey:", CFSTR("AXPerformingVisiblePointHitTest"));
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  BOOL v9;
  objc_super v10;
  uint64_t v11;
  id v12;
  int v13;
  id v14;
  id *v15;
  char v16;
  uint64_t v17;
  int v18;
  int v19;
  BOOL (*v20)(uint64_t);
  void *v21;
  UIViewAccessibility *v22;
  char v23;
  id location[2];
  UIViewAccessibility *v25;
  CGPoint v26;
  id v27;

  v26 = a3;
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v23 = -[UIViewAccessibility _accessibilityBoolValueForKey:](v25, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v16 = 0;
  v9 = 0;
  if (!v23)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = -1073741824;
    v19 = 0;
    v20 = __55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v21 = &unk_24FF3E0C0;
    v22 = v25;
    v16 = 1;
    v15 = (id *)&v22;
    v9 = v20((uint64_t)&v17);
  }
  if (v9)
  {
    -[UIViewAccessibility _accessibilitySetBoolValue:forKey:](v25, "_accessibilitySetBoolValue:forKey:", 1);
    v14 = (id)-[UIViewAccessibility accessibilityHitTest:withEvent:](v25, "accessibilityHitTest:withEvent:", location[0], v26.x, v26.y);
    -[UIViewAccessibility _accessibilitySetBoolValue:forKey:](v25, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v27 = v14;
    v13 = 1;
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v13 = 0;
  }
  if ((v16 & 1) != 0)
    objc_storeStrong(v15, 0);
  if (!v13)
  {
    v12 = 0;
    v11 = -[UIViewAccessibility accessibilityElementCount](v25, "accessibilityElementCount");
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[UIViewAccessibility __accessibilityHitTest:withEvent:](v25, "__accessibilityHitTest:withEvent:", location[0], v26.x, v26.y);
      v7 = v12;
      v12 = v6;

    }
    else
    {
      v10.receiver = v25;
      v10.super_class = (Class)UIViewAccessibility;
      v4 = -[UIViewAccessibility _accessibilityHitTest:withEvent:](&v10, sel__accessibilityHitTest_withEvent_, location[0], v26.x, v26.y);
      v5 = v12;
      v12 = v4;

    }
    v27 = v12;
    v13 = 1;
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
  return v27;
}

BOOL __55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_317);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_BaseImplementation;
}

void __55__UIViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityRetrieveIvarText
{
  uint64_t v1;
  void *v2;
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  _QWORD __b[8];
  objc_class *v15;
  Class Class;
  int v17;
  id v18;
  id v19;
  const char *Name;
  const char *TypeEncoding;
  Ivar v22;
  int i;
  id v24;
  Ivar *v25;
  unsigned int v26;
  id v27;
  id v28;
  id location;
  dispatch_once_t *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = a1;
  if (a1)
  {
    if (!_accessibilityRetrieveIvarText_IgnoreStringSet)
    {
      v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF0]), "init");
      v2 = (void *)_accessibilityRetrieveIvarText_IgnoreStringSet;
      _accessibilityRetrieveIvarText_IgnoreStringSet = v1;

      objc_msgSend((id)_accessibilityRetrieveIvarText_IgnoreStringSet, "addObject:", CFSTR("_reuseIdentifier"));
      objc_msgSend((id)_accessibilityRetrieveIvarText_IgnoreStringSet, "addObject:", CFSTR("_backgroundColorSystemColorName"));
      objc_msgSend((id)_accessibilityRetrieveIvarText_IgnoreStringSet, "addObject:", CFSTR("_contentViewConfigurationIdentifier"));
    }
    v26 = 0;
    v3 = (objc_class *)objc_opt_class();
    v25 = class_copyIvarList(v3, &v26);
    v24 = &stru_24FF484E0;
    for (i = v26 - 1; i >= 0; --i)
    {
      v22 = 0;
      v22 = v25[i];
      TypeEncoding = 0;
      TypeEncoding = ivar_getTypeEncoding(v22);
      if (TypeEncoding && !strcmp(TypeEncoding, "@\"NSString\"))
      {
        Name = 0;
        Name = ivar_getName(v22);
        v19 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", Name, 1);
        if ((objc_msgSend((id)_accessibilityRetrieveIvarText_IgnoreStringSet, "containsObject:", v19) & 1) != 0)
          goto LABEL_26;
        v18 = (id)objc_msgSend(v27, "safeValueForKey:", v19);
        if (v18)
        {
          Class = 0;
          Class = object_getClass(v18);
          if (Class)
          {
            v30 = (dispatch_once_t *)&_accessibilityRetrieveIvarText_onceToken;
            location = 0;
            objc_storeStrong(&location, &__block_literal_global_331);
            if (*v30 != -1)
              dispatch_once(v30, location);
            objc_storeStrong(&location, 0);
            memset(__b, 0, sizeof(__b));
            obj = (id)_accessibilityRetrieveIvarText_AcceptableClasses;
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
            if (v13)
            {
              v9 = *(_QWORD *)__b[2];
              v10 = 0;
              v11 = v13;
              while (1)
              {
                v8 = v10;
                if (*(_QWORD *)__b[2] != v9)
                  objc_enumerationMutation(obj);
                v15 = *(objc_class **)(__b[1] + 8 * v10);
                if (v15 == Class)
                {
                  v4 = (id)__UIAXStringForVariables();
                  v5 = v24;
                  v24 = v4;

                }
                ++v10;
                if (v8 + 1 >= v11)
                {
                  v10 = 0;
                  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v31, 16);
                  if (!v11)
                    break;
                }
              }
            }

            v17 = 0;
          }
          else
          {
            v17 = 4;
          }
        }
        else
        {
          v17 = 4;
        }
        objc_storeStrong(&v18, 0);
        if (!v17)
LABEL_26:
          v17 = 0;
        objc_storeStrong(&v19, 0);
      }
    }
    free(v25);
    if (objc_msgSend(v24, "length"))
      v6 = v24;
    else
      v6 = 0;
    v28 = v6;
    v17 = 1;
    objc_storeStrong(&v24, 0);
  }
  else
  {
    v28 = 0;
  }
  return v28;
}

Class __53__UIViewAccessibility__accessibilityRetrieveIvarText__block_invoke()
{
  uint64_t v0;
  void *v1;
  Class result;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1748]), "initWithOptions:", 256);
  v1 = (void *)_accessibilityRetrieveIvarText_AcceptableClasses;
  _accessibilityRetrieveIvarText_AcceptableClasses = v0;

  objc_msgSend((id)_accessibilityRetrieveIvarText_AcceptableClasses, "addPointer:", objc_opt_class());
  objc_msgSend((id)_accessibilityRetrieveIvarText_AcceptableClasses, "addPointer:", NSClassFromString(CFSTR("__NSCFString")));
  objc_msgSend((id)_accessibilityRetrieveIvarText_AcceptableClasses, "addPointer:", NSClassFromString(CFSTR("__NSCFConstantString")));
  result = NSClassFromString(CFSTR("NSTaggedPointerString"));
  if (result)
    return (Class)objc_msgSend((id)_accessibilityRetrieveIvarText_AcceptableClasses, "addPointer:", result);
  return result;
}

- (id)_accessibilityRetrieveLabelFromTableViewCell
{
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  char IsFetching;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(_QWORD *, void *);
  void *v21;
  uint64_t *v22;
  id location;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  int v30;
  int v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id v35;
  id v36;

  v35 = a1;
  if (a1)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 838860800;
    v31 = 48;
    v32 = __Block_byref_object_copy__25;
    v33 = __Block_byref_object_dispose__25;
    v34 = 0;
    v27 = (id)objc_msgSend(v35, "safeValueForKey:", CFSTR("superview"));
    while (1)
    {
      LOBYTE(v16) = 0;
      if (v27)
      {
        objc_opt_class();
        v16 = objc_opt_isKindOfClass() ^ 1;
      }
      if ((v16 & 1) == 0)
        break;
      v1 = (id)objc_msgSend(v27, "superview");
      v2 = v27;
      v27 = v1;

    }
    if (v27)
    {
      if ((objc_msgSend(v27, "isAccessibilityElement") & 1) != 0)
      {
        v3 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("accessibilityLabel"));
        v4 = (void *)v29[5];
        v29[5] = (uint64_t)v3;

      }
      else
      {
        v5 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("accessibilityTableViewCellText"));
        v6 = (void *)v29[5];
        v29[5] = (uint64_t)v5;

        if (!v29[5])
        {
          v26 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("_accessibilityIndexPath"));
          v25 = (id)objc_msgSend(v27, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
          if (v25)
          {
            v24 = 0;
            if ((objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityWantsOpaqueElementProviders") & 1) != 0)
              v7 = (id)objc_msgSend(v35, "_accessibilityAncestorIsKindOf:", objc_opt_class());
            else
              v7 = (id)objc_msgSend(v25, "accessibilityTableViewCellElementAtGlobalRow:", objc_msgSend(v25, "globalRowForRowAtIndexPath:", v26));
            v8 = v24;
            v24 = v7;

            location = v24;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v9 = (id)objc_msgSend(v24, "tableViewCell");
              v10 = location;
              location = v9;

            }
            objc_opt_class();
            v14 = (id)__UIAccessibilityCastAsSafeCategory();
            IsFetching = -[UITableViewCellAccessibility accessibilityIsFetchingChildren]((uint64_t)v14);

            if ((IsFetching & 1) == 0)
            {
              v17 = MEMORY[0x24BDAC760];
              v18 = -1073741824;
              v19 = 0;
              v20 = __67__UIViewAccessibility__accessibilityRetrieveLabelFromTableViewCell__block_invoke;
              v21 = &unk_24FF3E960;
              v22 = &v28;
              objc_msgSend(v24, "accessibilityEnumerateContainerElementsUsingBlock:", &v17);
            }
            objc_storeStrong(&location, 0);
            objc_storeStrong(&v24, 0);
          }
          objc_storeStrong(&v25, 0);
          objc_storeStrong(&v26, 0);
        }
      }
      if (!v29[5])
      {
        v11 = (id)objc_msgSend(v27, "safeValueForKey:", CFSTR("text"));
        v12 = (void *)v29[5];
        v29[5] = (uint64_t)v11;

      }
    }
    v36 = (id)v29[5];
    objc_storeStrong(&v27, 0);
    _Block_object_dispose(&v28, 8);
    objc_storeStrong(&v34, 0);
  }
  else
  {
    v36 = 0;
  }
  return v36;
}

void __67__UIViewAccessibility__accessibilityRetrieveLabelFromTableViewCell__block_invoke(_QWORD *a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (id)objc_msgSend(location[0], "accessibilityLabel");
    v3 = *(_QWORD *)(a1[4] + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  objc_storeStrong(location, 0);
}

- (BOOL)accessibilityElementsHidden
{
  id v2;
  int v4;
  id v5;
  BOOL v6;
  BOOL v8;

  v2 = (id)-[UIViewAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
  v6 = v2 == 0;

  if (v6)
  {
    LOBYTE(v4) = 0;
    if ((-[UIViewAccessibility isHidden](self, "isHidden") & 1) != 0)
      v4 = -[UIViewAccessibility _accessibilityOverridesInvisibility](self, "_accessibilityOverridesInvisibility") ^ 1;
    return v4 & 1;
  }
  else
  {
    v5 = (id)-[UIViewAccessibility storedAccessibilityElementsHidden](self, "storedAccessibilityElementsHidden");
    v8 = objc_msgSend(v5, "BOOLValue") & 1;

  }
  return v8;
}

- (double)_accessibilityViewAlpha
{
  double result;

  -[UIViewAccessibility alpha](self, "alpha", a2, self);
  return result;
}

- (BOOL)_accessibilityIsInTableCell
{
  id v2;
  BOOL v4;

  v2 = (id)-[UIViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = v2 != 0;

  return v4;
}

- (BOOL)_accessibilityIsInCollectionCell
{
  id v2;
  BOOL v4;

  v2 = (id)-[UIViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = v2 != 0;

  return v4;
}

- (BOOL)_accessibilityIsInFocusableCell
{
  return 0;
}

- (BOOL)_accessibilityIsFKARunningForFocusItem
{
  id v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  SEL v10;
  UIViewAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v8 = 0;
  v7 = (id)__UIAccessibilitySafeClass();
  v6 = v7;
  objc_storeStrong(&v7, 0);
  v3 = (id)objc_msgSend(v6, "traitCollection");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v9 = v4;
  v5 = 0;
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    v5 = 0;
    if (v9 != 3)
      return v9 != 2;
  }
  return v5;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  BOOL v3;

  v3 = 0;
  if (-[UIViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return -[UIViewAccessibility accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction");
  return v3;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  BOOL v3;
  char v4;
  id v5;
  objc_super v6;
  id location[2];
  UIViewAccessibility *v8;
  id v9;

  v8 = self;
  location[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)UIViewAccessibility;
  location[0] = -[UIViewAccessibility _systemDefaultFocusGroupIdentifier](&v6, sel__systemDefaultFocusGroupIdentifier);
  v4 = 0;
  v3 = 0;
  if (!location[0])
  {
    v3 = 0;
    if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v8, "_accessibilityIsFKARunningForFocusItem"))
    {
      v5 = (id)-[UIViewAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_containingScrollView"));
      v4 = 1;
      v3 = 0;
      if (!v5)
        v3 = -[UIViewAccessibility _accessibilityInTopLevelTabLoop](v8, "_accessibilityInTopLevelTabLoop");
    }
  }
  if ((v4 & 1) != 0)

  if (v3)
    v9 = (id)-[UIViewAccessibility _accessibilityDefaultFocusGroupIdentifier](v8, "_accessibilityDefaultFocusGroupIdentifier");
  else
    v9 = location[0];
  objc_storeStrong(location, 0);
  return v9;
}

- (id)focusItemsInRect:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  id v9;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t (*v21)(void *, void *);
  void *v22;
  __int128 v23;
  __int128 v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  int v30;
  objc_super v31;
  id v32[2];
  UIViewAccessibility *v33;
  CGRect v34;
  id v35;

  v34 = a3;
  v33 = self;
  v32[1] = (id)a2;
  v31.receiver = self;
  v31.super_class = (Class)UIViewAccessibility;
  v32[0] = -[UIViewAccessibility focusItemsInRect:](&v31, sel_focusItemsInRect_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v33, "_accessibilityIsFKARunningForFocusItem"))
  {
    -[UIViewAccessibility accessibilityFrame](v33, "accessibilityFrame");
    *(_QWORD *)&v28 = v3;
    *((_QWORD *)&v28 + 1) = v4;
    *(_QWORD *)&v29 = v5;
    *((_QWORD *)&v29 + 1) = v6;
    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v26 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = MEMORY[0x24BDAC760];
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __40__UIViewAccessibility_focusItemsInRect___block_invoke;
    v22 = &__block_descriptor_64_e8_B16__0_8l;
    v23 = v28;
    v24 = v29;
    v25 = (id)MEMORY[0x2348C3D88](&v18);
    v9 = v32[0];
    v10 = v8;
    v11 = -1073741824;
    v12 = 0;
    v13 = __40__UIViewAccessibility_focusItemsInRect___block_invoke_2;
    v14 = &unk_24FF3FD90;
    v17 = v25;
    v15 = v27;
    v16 = v26;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v10);
    v35 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayWithPossiblyNilArrays:", 2, v27, v26);
    v30 = 1;
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v27, 0);
  }
  else
  {
    v35 = v32[0];
    v30 = 1;
  }
  objc_storeStrong(v32, 0);
  return v35;
}

uint64_t __40__UIViewAccessibility_focusItemsInRect___block_invoke(void *a1, void *a2)
{
  id location[2];
  char v4;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "_accessibilityIsKindOfUIView") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(location[0], "accessibilityFrame");
    v4 = AX_CGRectAlmostEqualToRect() & 1;
  }
  objc_storeStrong(location, 0);
  return v4 & 1;
}

void __40__UIViewAccessibility_focusItemsInRect___block_invoke_2(uint64_t a1, void *a2)
{
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", location[0]);
  else
    objc_msgSend(*(id *)(a1 + 40), "addObject:", location[0]);
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupportGesturesAttributes
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  int v26;
  id v27[3];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27[2] = self;
  v27[1] = (id)a2;
  v21 = (id)-[UIViewAccessibility gestureRecognizers](self, "gestureRecognizers");
  v27[0] = (id)objc_msgSend(v21, "ax_filteredArrayUsingBlock:", &__block_literal_global_373);

  if (objc_msgSend(v27[0], "count"))
  {
    v25 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = v27[0];
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
    if (v20)
    {
      v16 = *(_QWORD *)__b[2];
      v17 = 0;
      v18 = v20;
      while (1)
      {
        v15 = v17;
        if (*(_QWORD *)__b[2] != v16)
          objc_enumerationMutation(obj);
        v24 = *(id *)(__b[1] + 8 * v17);
        v22 = (id)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "setObject:forKey:", &unk_24FF85B50, CFSTR("AXSupportedGestureTypeKey"));
          v11 = v22;
          v12 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfTapsRequired"));
          objc_msgSend(v11, "setObject:forKey:");

          v13 = v22;
          v14 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfTouchesRequired"));
          objc_msgSend(v13, "setObject:forKey:");

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v22, "setObject:forKey:", &unk_24FF85B68, CFSTR("AXSupportedGestureTypeKey"));
            v7 = v22;
            v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfTapsRequired"));
            objc_msgSend(v7, "setObject:forKey:");

            v9 = v22;
            v10 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfTouchesRequired"));
            objc_msgSend(v9, "setObject:forKey:");

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v22, "setObject:forKey:", &unk_24FF85B80, CFSTR("AXSupportedGestureTypeKey"));
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v22, "setObject:forKey:", &unk_24FF85B80, CFSTR("AXSupportedGestureTypeKey"));
                v3 = v22;
                v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "direction"));
                objc_msgSend(v3, "setObject:forKey:");

                v5 = v22;
                v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v24, "numberOfTouchesRequired"));
                objc_msgSend(v5, "setObject:forKey:");

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v22, "setObject:forKey:", &unk_24FF85B98, CFSTR("AXSupportedGestureTypeKey"));
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                    objc_msgSend(v22, "setObject:forKey:", &unk_24FF85BB0, CFSTR("AXSupportedGestureTypeKey"));
                }
              }
            }
          }
        }
        objc_msgSend(v25, "addObject:", v22);
        objc_storeStrong(&v22, 0);
        ++v17;
        if (v15 + 1 >= v18)
        {
          v17 = 0;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
          if (!v18)
            break;
        }
      }
    }

    v28 = v25;
    v26 = 1;
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v28 = 0;
    v26 = 1;
  }
  objc_storeStrong(v27, 0);
  return v28;
}

uint64_t __62__UIViewAccessibility__accessibilitySupportGesturesAttributes__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityIsSupportedGestureRecognizer");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (id)_accessibilitySortedElementsWithin
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  UIViewAccessibility *v9;
  id location[2];
  UIViewAccessibility *v11;
  id v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __57__UIViewAccessibility__accessibilitySortedElementsWithin__block_invoke;
  v8 = &unk_24FF3E0C0;
  v9 = v11;
  if (v7((uint64_t)&v4))
  {
    v12 = (id)-[UIViewAccessibility _accessibilityViewChildrenWithOptions:](v11, "_accessibilityViewChildrenWithOptions:", location[0]);
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  objc_storeStrong((id *)&v9, 0);
  if (!v3)
    v12 = -[UIViewAccessibility _accessibilitySortedElementsWithinWithOptions:](v11, "_accessibilitySortedElementsWithinWithOptions:", location[0]);
  objc_storeStrong(location, 0);
  return v12;
}

BOOL __57__UIViewAccessibility__accessibilitySortedElementsWithin__block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_2_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_394);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_2_BaseImplementation;
}

void __57__UIViewAccessibility__accessibilitySortedElementsWithin__block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_2_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilitySortedElementsWithinWithOptions:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  BOOL (*v8)(uint64_t);
  void *v9;
  UIViewAccessibility *v10;
  BOOL v11;
  uint64_t v12;
  int v13;
  int v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  UIViewAccessibility *v17;
  BOOL v18;
  id location[2];
  UIViewAccessibility *v20;
  id v21;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = 0;
  v4 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke;
  v16 = &unk_24FF3E0C0;
  v17 = v20;
  v18 = v15((uint64_t)&v12);
  v11 = 0;
  v5 = v4;
  v6 = -1073741824;
  v7 = 0;
  v8 = __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_398;
  v9 = &unk_24FF3E0C0;
  v10 = v20;
  v11 = v8((uint64_t)&v5);
  if (!v18 || v11)
    v21 = (id)-[UIViewAccessibility _accessibilityViewChildrenWithOptions:](v20, "_accessibilityViewChildrenWithOptions:", location[0]);
  else
    v21 = -[UIViewAccessibility _accessibilitySortedElementsWithin](v20, "_accessibilitySortedElementsWithin");
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
  return v21;
}

BOOL __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_3_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_397);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_3_BaseImplementation;
}

void __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_3_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithin);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

BOOL __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_398(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&AXViewIsProbablyDimmingView_block_invoke_4_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_400);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXViewIsProbablyDimmingView_block_invoke_4_BaseImplementation;
}

void __69__UIViewAccessibility__accessibilitySortedElementsWithinWithOptions___block_invoke_2_399(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel__accessibilitySortedElementsWithinWithOptions_);
  if (InstanceMethod)
  {
    AXViewIsProbablyDimmingView_block_invoke_4_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel__accessibilitySortedElementsWithinWithOptions_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)automationElements
{
  objc_super v3;
  SEL v4;
  UIViewAccessibility *v5;
  id v6;

  v5 = self;
  v4 = a2;
  if (-[UIViewAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    || (-[UIViewAccessibility _accessibilityHasOrderedChildren](v5, "_accessibilityHasOrderedChildren") & 1) != 0)
  {
    v3.receiver = v5;
    v3.super_class = (Class)UIViewAccessibility;
    v6 = -[UIViewAccessibility automationElements](&v3, sel_automationElements);
  }
  else
  {
    v6 = -[UIViewAccessibility _accessibilityUserTestingSubviewsSorted:](v5, !(-[UIViewAccessibility _accessibilityBoolValueForKey:](v5, "_accessibilityBoolValueForKey:", CFSTR("AXPerformingChildrenCount")) & 1));
  }
  return v6;
}

- (id)_accessibilityUserTestingSubviewsSorted:(void *)a1
{
  id v2;
  id v4;
  char v5;
  id v6;
  id location;
  id v8;
  char v9;
  id v10;
  id v11;

  v10 = a1;
  v9 = a2 & 1;
  if (a1)
  {
    v4 = (id)objc_msgSend(v10, "_accessibilitySubviews");
    v8 = (id)objc_msgSend(v4, "mutableCopy");

    v5 = 0;
    if ((objc_msgSend(v10, "_accessibilityViewIsVisible") & 1) != 0)
    {
      v6 = (id)objc_msgSend(v8, "indexesOfObjectsPassingTest:", &__block_literal_global_408);
      v5 = 1;
      v2 = v6;
    }
    else
    {
      v2 = 0;
    }
    location = v2;
    if ((v5 & 1) != 0)

    if (objc_msgSend(location, "count"))
      objc_msgSend(v8, "removeObjectsAtIndexes:", location);
    if ((v9 & 1) != 0)
      objc_msgSend(v10, "_accessibilitySortElementsUsingGeometry:", v8);
    v11 = v8;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

BOOL __63__UIViewAccessibility__accessibilityUserTestingSubviewsSorted___block_invoke(void *a1, void *a2)
{
  BOOL v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = !(objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1);
  objc_storeStrong(location, 0);
  return v3;
}

- (void)_axPrintSubviews:(int64_t)a3 string:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  char v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id obj;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int i;
  _QWORD __b[8];
  id v36;
  id location;
  int64_t v38;
  SEL v39;
  UIViewAccessibility *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v40 = self;
  v39 = a2;
  v38 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  if (!v38)
  {
    v28 = location;
    v30 = (id)-[UIViewAccessibility description](v40, "description");
    v29 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    objc_msgSend(v28, "appendFormat:", CFSTR("SELF: %@ {%@}\n"), v30, v29);

  }
  memset(__b, 0, sizeof(__b));
  obj = (id)-[UIViewAccessibility subviews](v40, "subviews");
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
  if (v27)
  {
    v23 = *(_QWORD *)__b[2];
    v24 = 0;
    v25 = v27;
    while (1)
    {
      v22 = v24;
      if (*(_QWORD *)__b[2] != v23)
        objc_enumerationMutation(obj);
      v36 = *(id *)(__b[1] + 8 * v24);
      for (i = 0; i < v38; ++i)
        objc_msgSend(location, "appendString:", CFSTR("    "));
      v33 = (id)objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", v36);
      v32 = &stru_24FF484E0;
      if (v33)
      {
        v4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VC:[%@] "), v33);
        v5 = v32;
        v32 = v4;

      }
      v31 = &stru_24FF484E0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = (void *)MEMORY[0x24BDD17C8];
        v21 = (id)objc_msgSend(v36, "safeValueForKey:", CFSTR("delegate"));
        v6 = (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("Delegate:[%@] "), v21);
        v7 = v31;
        v31 = v6;

      }
      v12 = location;
      v17 = (id)objc_msgSend(v36, "description");
      v8 = objc_msgSend(v36, "accessibilityIgnoresInvertColors");
      v16 = (id)objc_msgSend(v36, "layer");
      v15 = (id)objc_msgSend(v16, "filters");
      v9 = objc_msgSend(v15, "ax_containsObjectUsingBlock:", &__block_literal_global_425);
      v14 = (id)objc_msgSend(v36, "backgroundColor");
      v10 = v32;
      v11 = v31;
      v13 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      objc_msgSend(v12, "appendFormat:", CFSTR("%@[INV:%d(L:%d), BG:{%@}] %@%@ {%@}\n"), v17, v8 & 1, v9 & 1, v14, v10, v11, v13);

      v18 = (id)objc_msgSend(v36, "subviews");
      v19 = objc_msgSend(v18, "count") == 0;

      if (!v19)
        objc_msgSend(v36, "_axPrintSubviews:string:", v38 + 1, location);
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v24;
      if (v22 + 1 >= v25)
      {
        v24 = 0;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v41, 16);
        if (!v25)
          break;
      }
    }
  }

  objc_storeStrong(&location, 0);
}

uint64_t __47__UIViewAccessibility__axPrintSubviews_string___block_invoke(void *a1, void *a2)
{
  id v3;
  char v4;
  char v5;
  id v6;
  char v7;
  id v8;
  id location[2];
  char v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = (id)objc_msgSend(location[0], "name");
  v7 = 0;
  v5 = 0;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvertColorsDoubleInvert")) & 1) == 0)
  {
    v8 = (id)objc_msgSend(location[0], "name");
    v7 = 1;
    v4 = 1;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UIInvertColorsDoubleInvertPrivateKey")) & 1) == 0)
    {
      v6 = (id)objc_msgSend(location[0], "name");
      v5 = 1;
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("InvertColorsDarkModeWindowFilter"));
    }
  }
  v10 = v4 & 1;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (id)_axSubviews
{
  id v3;
  id v4[2];
  UIViewAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  -[UIViewAccessibility _axPrintSubviews:string:](v5, "_axPrintSubviews:string:", 0, v4[0]);
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_axResponderChain
{
  id v2;
  id v4;
  id v5;
  id v6;
  unint64_t j;
  uint64_t i;
  id location;
  unint64_t v10;
  id v11;
  id v12[2];
  UIViewAccessibility *v13;
  __CFString *v14;

  v13 = self;
  v12[1] = (id)a2;
  v12[0] = (id)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v10 = 1;
  v6 = (id)-[UIViewAccessibility _accessibilityWindow](v13, "_accessibilityWindow");
  location = (id)objc_msgSend(v6, "safeValueForKey:", CFSTR("firstResponder"));

  if (location)
  {
    objc_msgSend(v12[0], "appendFormat:", CFSTR("First Responder:\n %@\nResponder Chain:\n"), location);
    objc_msgSend(v11, "addObject:", location);
    while (1)
    {
      v5 = (id)objc_msgSend(location, "nextResponder");
      v2 = location;
      location = v5;

      if (!v5)
        break;
      objc_msgSend(v11, "addObject:", location);
    }
    for (i = objc_msgSend(v11, "count") - 1; i >= 0; --i)
    {
      for (j = 0; j < v10; ++j)
        objc_msgSend(v12[0], "appendString:", CFSTR(" "));
      ++v10;
      v4 = (id)objc_msgSend(v11, "objectAtIndex:", i);
      objc_msgSend(v12[0], "appendFormat:", CFSTR("%@\n"), v4);

    }
    v14 = (__CFString *)v12[0];
  }
  else
  {
    v14 = CFSTR("This is no current first responder");
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  return v14;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  return -[UIViewAccessibility isUserInteractionEnabled](self, "isUserInteractionEnabled", a2, self) & 1;
}

- (id)_clippedViewHierarchyDescription
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  id v14[2];
  UIViewAccessibility *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[UIViewAccessibility _iosAccessibilityAttributeValue:](self, "_iosAccessibilityAttributeValue:", 2041);
  v13 = 0;
  v12 = 0;
  v11 = (id)-[UIViewAccessibility superview](v15, "superview");
  while (v11)
  {
    ++v12;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 1;
      break;
    }
    v2 = (id)objc_msgSend(v11, "superview");
    v3 = v11;
    v11 = v2;

  }
  if ((v13 & 1) != 0)
  {
    v10 = (id)objc_msgSend(v14[0], "componentsSeparatedByString:");
    v17 = 0;
    v16 = v12;
    v18 = 0;
    v19 = v12;
    v9 = (id)objc_msgSend(v10, "subarrayWithRange:", 0, v12);
    v8 = (id)objc_msgSend(v9, "componentsJoinedByString:", CFSTR("-"));
    v4 = (id)objc_msgSend(v8, "stringByAppendingString:", CFSTR("-"));
    v5 = v14[0];
    v14[0] = v4;

    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v10, 0);
  }
  v7 = v14[0];
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v14, 0);
  return v7;
}

- (id)_accessibilityAuditIssuesWithOptions:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  char v10;
  id v11;
  objc_super v12;
  id v13;
  id location[2];
  UIViewAccessibility *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12.receiver = v15;
  v12.super_class = (Class)UIViewAccessibility;
  v13 = -[UIViewAccessibility _accessibilityAuditIssuesWithOptions:](&v12, sel__accessibilityAuditIssuesWithOptions_, location[0]);
  if (!v13)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = v13;
    v13 = v3;

  }
  v11 = (id)objc_msgSend(MEMORY[0x24BEBADB0], "optionsDictionaryForAuditTest:inDictionary:", *MEMORY[0x24BDFE858], location[0]);
  v10 = 0;
  v10 = objc_msgSend(MEMORY[0x24BEBADB0], "checkBoolValueForOptionsKey:inDictionary:", *MEMORY[0x24BDFE8B0], v11) & 1;
  v9 = 0;
  if (v10)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BEBAE10], "_axAuditContrastDetectionForView:", v15);
    v6 = v9;
    v9 = v5;

  }
  objc_msgSend(v13, "axSafelyAddObjectsFromArray:", v9);
  v8 = v13;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_accessibilityImageData
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v15;
  id v16;
  double v17;
  uint64_t v18;
  int v19;
  int v20;
  void (*v21)(id *, void *);
  void *v22;
  id v23[3];
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  id v36[3];
  id v37;

  v36[2] = self;
  v36[1] = (id)a2;
  v36[0] = self;
  objc_msgSend(v36[0], "bounds");
  v32 = v2;
  v33 = v3;
  v34 = v4;
  v35 = v5;
  v17 = CGCeiling(v4);
  objc_msgSend(v36[0], "bounds");
  v28 = v6;
  v29 = v7;
  v30 = v8;
  v31 = v9;
  if (v17 * CGCeiling(v9) <= 4096.0)
  {
    v15 = objc_alloc(MEMORY[0x24BDF6A98]);
    objc_msgSend(v36[0], "bounds");
    v23[1] = v10;
    v23[2] = v11;
    *(double *)&v24 = v12;
    *((double *)&v24 + 1) = v13;
    v25 = v24;
    v26 = objc_msgSend(v15, "initWithSize:", v12, v13);
    v16 = (id)v26;
    v18 = MEMORY[0x24BDAC760];
    v19 = -1073741824;
    v20 = 0;
    v21 = __46__UIViewAccessibility__accessibilityImageData__block_invoke;
    v22 = &unk_24FF3FEB8;
    v23[0] = v36[0];
    v37 = (id)objc_msgSend(v16, "imageWithActions:", &v18);
    objc_storeStrong(v23, 0);
    v27 = 1;
    objc_storeStrong((id *)&v26, 0);
  }
  else
  {
    v37 = 0;
    v27 = 1;
  }
  objc_storeStrong(v36, 0);
  return v37;
}

void __46__UIViewAccessibility__accessibilityImageData__block_invoke(id *a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = a1[4];
  objc_msgSend(v7, "bounds");
  objc_msgSend(a1[4], "bounds");
  CGRectMake_4();
  objc_msgSend(v7, "drawViewHierarchyInRect:afterScreenUpdates:", 0, v2, v3, v4, v5);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityCapturedImages
{
  id v3;
  id v4;
  _QWORD v5[2];
  UIViewAccessibility *v6;

  v6 = self;
  v5[1] = a2;
  v5[0] = 0;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  -[UIViewAccessibility _accessibilityCapturedImagesWithDepth:capturedImages:](v6, v5, v4);
  v3 = v4;
  objc_storeStrong(&v4, 0);
  return v3;
}

- (void)_accessibilityCapturedImagesWithDepth:(void *)a3 capturedImages:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  _QWORD __b[8];
  uint64_t v10;
  id v11;
  int v12;
  id location;
  _QWORD *v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = a1;
  v14 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  if (v15)
  {
    if ((_UIApplicationIsExtension() & 1) != 0 || !v14 || *v14 >= 5uLL || objc_msgSend(location, "count"))
    {
      v12 = 1;
    }
    else
    {
      ++*v14;
      v11 = (id)objc_msgSend(v15, "_accessibilityImageData");
      if (v11)
        objc_msgSend(location, "addObject:", v11);
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(v15, "subviews");
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
      if (v8)
      {
        v4 = *(_QWORD *)__b[2];
        v5 = 0;
        v6 = v8;
        while (1)
        {
          v3 = v5;
          if (*(_QWORD *)__b[2] != v4)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(__b[1] + 8 * v5);
          -[UIViewAccessibility _accessibilityCapturedImagesWithDepth:capturedImages:](v10, v14, location);
          ++v5;
          if (v3 + 1 >= v6)
          {
            v5 = 0;
            v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v16, 16);
            if (!v6)
              break;
          }
        }
      }

      objc_storeStrong(&v11, 0);
      v12 = 0;
    }
  }
  else
  {
    v12 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_accessibilityAllDragSourceDescriptors
{
  id v3;
  id location[2];
  UIViewAccessibility *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIViewAccessibility accessibilityDragSourceDescriptors](self, "accessibilityDragSourceDescriptors");
  if (location[0])
  {
    v6 = location[0];
  }
  else
  {
    v3 = (id)-[UIViewAccessibility _accessibilityFindUnsortedSubviewDescendantsPassingTest:](v5, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &__block_literal_global_462);
    v6 = (id)objc_msgSend(v3, "axMapObjectsUsingBlock:", &__block_literal_global_464);

  }
  objc_storeStrong(location, 0);
  return v6;
}

uint64_t __61__UIViewAccessibility__accessibilityAllDragSourceDescriptors__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityHasDragSources");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

id __61__UIViewAccessibility__accessibilityAllDragSourceDescriptors__block_invoke_2(void *a1, void *a2)
{
  id v2;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = objc_alloc(MEMORY[0x24BDF67B0]);
  v4 = (id)objc_msgSend(v2, "initWithName:view:", *MEMORY[0x24BDFE8F0], location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityAllDropPointDescriptors
{
  id v3;
  id location[2];
  UIViewAccessibility *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIViewAccessibility accessibilityDropPointDescriptors](self, "accessibilityDropPointDescriptors");
  if (location[0])
  {
    v6 = location[0];
  }
  else
  {
    v3 = (id)-[UIViewAccessibility _accessibilityFindUnsortedSubviewDescendantsPassingTest:](v5, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &__block_literal_global_466);
    v6 = (id)objc_msgSend(v3, "axMapObjectsUsingBlock:", &__block_literal_global_467);

  }
  objc_storeStrong(location, 0);
  return v6;
}

uint64_t __60__UIViewAccessibility__accessibilityAllDropPointDescriptors__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityHasDragDestinations");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

id __60__UIViewAccessibility__accessibilityAllDropPointDescriptors__block_invoke_2(void *a1, void *a2)
{
  id v2;
  id v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = objc_alloc(MEMORY[0x24BDF67B0]);
  v4 = (id)objc_msgSend(v2, "initWithName:view:", *MEMORY[0x24BDFE8F0], location[0]);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_isEligibleForFocusInteraction
{
  double v2;
  char v4;
  char v5;
  BOOL v6;
  char v7;
  id v8;
  id location;
  objc_super v10;
  char v11;
  SEL v12;
  UIViewAccessibility *v13;
  char v14;

  v13 = self;
  v12 = a2;
  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)UIViewAccessibility;
  v11 = -[UIViewAccessibility _isEligibleForFocusInteraction](&v10, sel__isEligibleForFocusInteraction);
  if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v13, "_accessibilityIsFKARunningForFocusItem")
    || (-[UIViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](v13, "_accessibilityIsFocusForHoverTextRunningForFocusItem") & 1) != 0)
  {
    location = v13;
    v7 = 0;
    v6 = 0;
    if ((objc_msgSend(location, "isHidden") & 1) == 0)
    {
      objc_msgSend(location, "alpha");
      v6 = 0;
      if (CGFAbs_2(v2 - 0.0) >= 2.22044605e-16)
      {
        v8 = (id)objc_msgSend(location, "_window");
        v7 = 1;
        v6 = v8 != 0;
      }
    }
    v11 = v6;
    if ((v7 & 1) != 0)

    if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v13, "_accessibilityIsFKARunningForFocusItem"))
    {
      v5 = 1;
      if ((objc_msgSend(location, "isUserInteractionEnabled") & 1) == 0)
        v5 = objc_msgSend(location, "accessibilityRespondsToUserInteraction");
      v4 = 0;
      if ((v11 & 1) != 0)
      {
        v4 = 0;
        if ((v5 & 1) != 0)
          v4 = objc_msgSend(location, "safeBoolForKey:", CFSTR("_isFocusInteractionEnabled"));
      }
      v11 = v4 & 1;
    }
    v14 = v11 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v14 = v11 & 1;
  }
  return v14 & 1;
}

- (BOOL)canBecomeFocused
{
  BOOL v3;
  char v4;
  id v5;
  id location;
  id v7;
  objc_super v8;
  char v9;
  SEL v10;
  UIViewAccessibility *v11;
  char v12;

  v11 = self;
  v10 = a2;
  v9 = 0;
  v8.receiver = self;
  v8.super_class = (Class)UIViewAccessibility;
  v9 = -[UIViewAccessibility canBecomeFocused](&v8, sel_canBecomeFocused);
  if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v11, "_accessibilityIsFKARunningForFocusItem")
    || (-[UIViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](v11, "_accessibilityIsFocusForHoverTextRunningForFocusItem") & 1) != 0)
  {
    if ((v9 & 1) != 0)
      v9 = (-[UIViewAccessibility _axHasSingleFocusableSubview](v11) ^ 1) & 1;
    if ((v9 & 1) == 0
      && (-[UIViewAccessibility safeBoolForKey:](v11, "safeBoolForKey:", CFSTR("_isFocusedOrAncestorOfFocusedView")) & 1) == 0)
    {
      v7 = (id)-[UIViewAccessibility _accessibilityGetBlockForAttribute:](v11, "_accessibilityGetBlockForAttribute:", 31);
      if (v7)
      {
        v9 = (*((uint64_t (**)(void))v7 + 2))() & 1;
      }
      else if (-[UIViewAccessibility _accessibilityUnfocusableViewCanBeFocusedForHoverText](v11, "_accessibilityUnfocusableViewCanBeFocusedForHoverText"))
      {
        v9 = 1;
      }
      if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v11, "_accessibilityIsFKARunningForFocusItem")
        && (-[UIViewAccessibility _accessibilityRemembersLastFocusedChild](v11, "_accessibilityRemembersLastFocusedChild") & 1) != 0)
      {
        location = -[UIViewAccessibility _accessibilityLastFocusedChild](v11, "_accessibilityLastFocusedChild");
        v4 = 0;
        v3 = 0;
        if (location)
        {
          v5 = (id)objc_msgSend(location, "_accessibilityWindow");
          v4 = 1;
          v3 = v5 != 0;
        }
        if ((v4 & 1) != 0)

        if (v3)
          v9 = 1;
        objc_storeStrong(&location, 0);
      }
      objc_storeStrong(&v7, 0);
    }
    v12 = v9 & 1;
  }
  else
  {
    v12 = v9 & 1;
  }
  return v12 & 1;
}

- (uint64_t)_axHasSingleFocusableSubview
{
  id v1;
  id v2;
  id v4;
  id v5;
  BOOL v6;
  id location;
  id v8;
  char v9;

  v8 = a1;
  if (a1)
  {
    location = v8;
    while (1)
    {
      v5 = (id)objc_msgSend(location, "subviews");
      v6 = objc_msgSend(v5, "count") != 1;

      if (v6)
        break;
      v4 = (id)objc_msgSend(location, "subviews");
      v1 = (id)objc_msgSend(v4, "firstObject");
      v2 = location;
      location = v1;

      if ((objc_msgSend(location, "safeBoolForKey:", CFSTR("_isEligibleForFocusInteraction")) & 1) != 0
        && ((objc_msgSend(location, "canBecomeFocused") & 1) != 0 || (objc_msgSend(location, "isFocused") & 1) != 0))
      {
        v9 = 1;
        goto LABEL_11;
      }
    }
    v9 = 0;
LABEL_11:
    objc_storeStrong(&location, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9 & 1;
}

- (id)preferredFocusEnvironments
{
  id v2;
  id v3;
  id v5;
  id location;
  objc_super v7;
  id v8[2];
  UIViewAccessibility *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UIViewAccessibility;
  v8[0] = -[UIViewAccessibility preferredFocusEnvironments](&v7, sel_preferredFocusEnvironments);
  if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v9, "_accessibilityIsFKARunningForFocusItem")
    && (-[UIViewAccessibility _accessibilityRemembersLastFocusedChild](v9, "_accessibilityRemembersLastFocusedChild") & 1) != 0)
  {
    location = -[UIViewAccessibility _accessibilityLastFocusedChild](v9, "_accessibilityLastFocusedChild");
    if (location)
    {
      v10[0] = location;
      v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
      v3 = v8[0];
      v8[0] = v2;

    }
    objc_storeStrong(&location, 0);
  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (id)_accessibilityLastFocusedChild
{
  id v3;
  BOOL v4;
  BOOL v5;
  id v6;
  char v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12[2];
  UIViewAccessibility *v13;

  v13 = self;
  v12[1] = (id)a2;
  v11 = 0;
  objc_opt_class();
  v6 = (id)-[UIViewAccessibility _axGetLastFocusedChild](v13, "_axGetLastFocusedChild");
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  v7 = 0;
  v5 = 0;
  if (v9)
  {
    v4 = 1;
    if ((objc_msgSend(v12[0], "isHidden") & 1) == 0)
    {
      v8 = (id)objc_msgSend(v12[0], "window");
      v7 = 1;
      v4 = v8 == 0;
    }
    v5 = v4;
  }
  if ((v7 & 1) != 0)

  if (v5)
    -[UIViewAccessibility _axSetLastFocusedChild:](v13, "_axSetLastFocusedChild:", 0);
  v3 = (id)-[UIViewAccessibility _axGetLastFocusedChild](v13, "_axGetLastFocusedChild");
  objc_storeStrong(v12, 0);
  return v3;
}

- (id)_childFocusViews
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char isKindOfClass;
  id v14;
  id v15;
  id v16;
  id v17;
  UIViewAccessibility *v18;
  id v19;
  BOOL v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  BOOL (*v30)(id *, void *);
  void *v31;
  UIViewAccessibility *v32;
  id v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  BOOL (*v38)(id *, void *);
  void *v39;
  UIViewAccessibility *v40;
  id v41;
  id v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t (*v46)(id *, void *);
  void *v47;
  id v48;
  id v49;
  id v50;
  char v51;
  id v52;
  char v53;
  id v54;
  char v55;
  id v56;
  char v57;
  id v58;
  char v59;
  id v60;
  id v61;
  id v62;
  char v63;
  id v64;
  id v65;
  id v66;
  id v67;
  char v68;
  id v69;
  int v70;
  objc_super v71;
  id v72[2];
  UIViewAccessibility *v73;
  id v74;

  v73 = self;
  v72[1] = (id)a2;
  v71.receiver = self;
  v71.super_class = (Class)UIViewAccessibility;
  v26 = -[UIViewAccessibility _childFocusViews](&v71, sel__childFocusViews);
  v72[0] = (id)objc_msgSend(v26, "mutableCopy");

  if (-[UIViewAccessibility _accessibilityIsFKARunningForFocusItem](v73, "_accessibilityIsFKARunningForFocusItem"))
  {
    if (!-[UIViewAccessibility accessibilityElementsHidden](v73, "accessibilityElementsHidden")
      && (-[UIViewAccessibility _accessibilityFKAShouldProcessChildren](v73, "_accessibilityFKAShouldProcessChildren") & 1) != 0)
    {
      if (!objc_msgSend(v72[0], "count"))
      {
        v68 = 0;
        objc_opt_class();
        v25 = (id)-[UIViewAccessibility safeValueForKey:](v73, "safeValueForKey:", CFSTR("_viewDelegate"));
        v67 = (id)__UIAccessibilityCastAsClass();

        v66 = v67;
        objc_storeStrong(&v67, 0);
        v69 = v66;
        v65 = (id)objc_msgSend(v66, "presentedViewController");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v63 = 0;
          objc_opt_class();
          v62 = (id)__UIAccessibilityCastAsClass();
          v61 = v62;
          objc_storeStrong(&v62, 0);
          v64 = v61;
          if (v61)
          {
            v23 = (id)objc_msgSend(v64, "searchResultsController");
            v59 = 0;
            v57 = 0;
            v55 = 0;
            v53 = 0;
            v51 = 0;
            v24 = 1;
            if (v23)
            {
              v60 = (id)objc_msgSend(v64, "view");
              v59 = 1;
              v58 = (id)objc_msgSend(v64, "searchResultsController");
              v57 = 1;
              v56 = (id)objc_msgSend(v58, "view");
              v55 = 1;
              v24 = 1;
              if ((objc_msgSend(v60, "containsView:") & 1) != 0)
              {
                v54 = (id)objc_msgSend(v64, "searchResultsController");
                v53 = 1;
                v52 = (id)objc_msgSend(v54, "view");
                v51 = 1;
                v24 = objc_msgSend(v52, "isHidden");
              }
            }
            if ((v51 & 1) != 0)

            if ((v53 & 1) != 0)
            if ((v55 & 1) != 0)

            if ((v57 & 1) != 0)
            if ((v59 & 1) != 0)

            if ((v24 & 1) != 0)
            {
              v21 = v72[0];
              v22 = (id)-[UIViewAccessibility subviews](v73, "subviews");
              objc_msgSend(v21, "axSafelyAddObjectsFromArray:");

            }
          }
          objc_storeStrong(&v64, 0);
        }
        else
        {
          v19 = (id)objc_msgSend(v69, "presentedViewController");
          v20 = objc_msgSend(v19, "modalPresentationStyle") != 7;

          if (v20)
          {
            v12 = (id)objc_msgSend(v65, "presentationController");
            NSClassFromString(CFSTR("_UIContextMenuUIController"));
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              v10 = (id)objc_msgSend(v65, "presentationController");
              v42 = (id)objc_msgSend(v10, "safeUIViewForKey:", CFSTR("platterContainerView"));

              v11 = v42;
              v35 = MEMORY[0x24BDAC760];
              v36 = -1073741824;
              v37 = 0;
              v38 = __39__UIViewAccessibility__childFocusViews__block_invoke_2;
              v39 = &unk_24FF3E2D0;
              v40 = v73;
              v41 = (id)objc_msgSend(v11, "_accessibilityFindAncestor:startWithSelf:", &v35, 0);
              if (v41)
                objc_msgSend(v72[0], "axSafelyAddObject:", v42);
              objc_storeStrong(&v41, 0);
              objc_storeStrong((id *)&v40, 0);
              objc_storeStrong(&v42, 0);
            }
            else if (v65)
            {
              v34 = (id)objc_msgSend(v65, "view");
              v9 = v34;
              v27 = MEMORY[0x24BDAC760];
              v28 = -1073741824;
              v29 = 0;
              v30 = __39__UIViewAccessibility__childFocusViews__block_invoke_3;
              v31 = &unk_24FF3E2D0;
              v32 = v73;
              v33 = (id)objc_msgSend(v9, "_accessibilityFindAncestor:startWithSelf:", &v27, 0);
              if (v33)
                objc_msgSend(v72[0], "axSafelyAddObject:", v34);
              objc_storeStrong(&v33, 0);
              objc_storeStrong((id *)&v32, 0);
              objc_storeStrong(&v34, 0);
            }
          }
          else
          {
            v17 = (id)objc_msgSend(v69, "presentedViewController");
            v16 = (id)objc_msgSend(v17, "popoverPresentationController");
            v50 = (id)objc_msgSend(v16, "passthroughViews");

            v18 = v73;
            v43 = MEMORY[0x24BDAC760];
            v44 = -1073741824;
            v45 = 0;
            v46 = __39__UIViewAccessibility__childFocusViews__block_invoke;
            v47 = &unk_24FF3E2D0;
            v48 = v50;
            v49 = (id)-[UIViewAccessibility _accessibilityFindAncestor:startWithSelf:](v18, "_accessibilityFindAncestor:startWithSelf:", &v43, 1);
            if (v49)
            {
              v14 = v72[0];
              v15 = (id)-[UIViewAccessibility subviews](v73, "subviews");
              objc_msgSend(v14, "axSafelyAddObjectsFromArray:");

            }
            objc_storeStrong(&v49, 0);
            objc_storeStrong(&v48, 0);
            objc_storeStrong(&v50, 0);
          }
        }
        objc_storeStrong(&v65, 0);
        objc_storeStrong(&v69, 0);
      }
      v3 = (void *)MEMORY[0x24BDF6F90];
      v8 = (id)objc_msgSend(v72[0], "reverseObjectEnumerator");
      v7 = (id)objc_msgSend(v8, "allObjects");
      v6 = (id)objc_msgSend(v3, "_subviewsReplacedByModalViewSubviewsIfNecessary:");
      v5 = (id)objc_msgSend(v6, "reverseObjectEnumerator");
      v4 = (id)objc_msgSend(v5, "allObjects");
      v74 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &__block_literal_global_480);

      v70 = 1;
    }
    else
    {
      v74 = MEMORY[0x24BDBD1A8];
      v70 = 1;
    }
  }
  else
  {
    v74 = v72[0];
    v70 = 1;
  }
  objc_storeStrong(v72, 0);
  return v74;
}

uint64_t __39__UIViewAccessibility__childFocusViews__block_invoke(id *a1, void *a2)
{
  char v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = objc_msgSend(a1[4], "containsObject:", location[0]);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

BOOL __39__UIViewAccessibility__childFocusViews__block_invoke_2(id *a1, void *a2)
{
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

BOOL __39__UIViewAccessibility__childFocusViews__block_invoke_3(id *a1, void *a2)
{
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

uint64_t __39__UIViewAccessibility__childFocusViews__block_invoke_4(void *a1, void *a2)
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

- (BOOL)_prefersFocusContainment
{
  char v3;

  v3 = 1;
  if ((-[UIViewAccessibility conformsToProtocol:](self, "conformsToProtocol:", &unk_255EC4610) & 1) == 0)
  {
    v3 = 1;
    if ((-[UIViewAccessibility _accessibilityIsTouchContainer](self, "_accessibilityIsTouchContainer") & 1) == 0)
      v3 = -[UIViewAccessibility shouldGroupAccessibilityChildren](self, "shouldGroupAccessibilityChildren");
  }
  return v3 & 1;
}

- (BOOL)_accessibilityUnfocusableViewCanBeFocusedForHoverText
{
  int v3;
  objc_super v4;
  SEL v5;
  UIViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  if ((-[UIViewAccessibility _accessibilityIsFocusForHoverTextRunningForFocusItem](self, "_accessibilityIsFocusForHoverTextRunningForFocusItem") & 1) == 0)return 0;
  v4.receiver = v6;
  v4.super_class = (Class)UIViewAccessibility;
  LOBYTE(v3) = 0;
  if (!-[UIViewAccessibility canBecomeFocused](&v4, sel_canBecomeFocused))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), LOBYTE(v3) = 0, (objc_opt_isKindOfClass() & 1) != 0))
    {
      LOBYTE(v3) = 0;
      if (-[UIViewAccessibility isAccessibilityElement](v6, "isAccessibilityElement"))
        v3 = !-[UIViewAccessibility _accessibilityIsInFocusableCell](v6, "_accessibilityIsInFocusableCell");
    }
  }
  return v3 & 1;
}

- (BOOL)_accessibilityDisplayFocusIndicatorForHoverTextView
{
  id location;
  int v4;
  id v5[2];
  UIViewAccessibility *v6;
  char v7;

  v6 = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UIViewAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 31);
  if (-[UIViewAccessibility _accessibilityUnfocusableViewCanBeFocusedForHoverText](v6, "_accessibilityUnfocusableViewCanBeFocusedForHoverText")|| v5[0] && ((*((uint64_t (**)(void))v5[0] + 2))() & 1) != 0)
  {
    location = (id)-[UIViewAccessibility _accessibilityGetBlockForAttribute:](v6, "_accessibilityGetBlockForAttribute:", 32);
    if (location)
    {
      v7 = (*((uint64_t (**)(void))location + 2))() & 1;
    }
    else
    {
      objc_opt_class();
      v7 = objc_opt_isKindOfClass() & 1;
    }
    v4 = 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v7 = 0;
    v4 = 1;
  }
  objc_storeStrong(v5, 0);
  return v7 & 1;
}

- (BOOL)_accessibilityPreventOcclusionForViewFromAboveFocusRegionForHoverTextView
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UIViewAccessibility _accessibilityGetBlockForAttribute:](self, "_accessibilityGetBlockForAttribute:", 33);
  if (location[0])
    v4 = (*((uint64_t (**)(void))location[0] + 2))() & 1;
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)_accessibilityFKAShouldBeProcessed
{
  id v3;
  char v4;
  BOOL v5;
  BOOL v6;
  char v7;
  id v8;
  char v9;
  id v10;

  if ((-[UIViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v9 = 0;
    v7 = 0;
    v6 = 0;
    if ((UIAccessibilityIsWidgetExtension() & 1) == 0)
    {
      objc_opt_class();
      v5 = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = (id)-[UIViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
        v9 = 1;
        v5 = 1;
        if (!v10)
        {
          objc_opt_class();
          v5 = 1;
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v8 = (id)-[UIViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
            v7 = 1;
            v5 = v8 != 0;
          }
        }
      }
      v6 = v5;
    }
    if ((v7 & 1) != 0)

    if ((v9 & 1) != 0)
    if (v6)
    {
      return 1;
    }
    else
    {
      v3 = (id)objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityContainerToStopVisibilityCheck");
      v4 = 0;
      if (!v3)
        v4 = -[UIViewAccessibility _accessibilityIsFrameOutOfBounds](self, "_accessibilityIsFrameOutOfBounds");

      return (v4 & 1) == 0;
    }
  }
  else
  {
    return 0;
  }
}

- (id)_accessibilityFocusRingTintColor
{
  id v3;
  objc_super v4;
  id location[2];
  UIViewAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIViewAccessibility;
  location[0] = -[UIViewAccessibility _accessibilityFocusRingTintColor](&v4, sel__accessibilityFocusRingTintColor);
  if (location[0])
  {
    v7 = location[0];
  }
  else
  {
    v3 = (id)-[UIViewAccessibility superview](v6, "superview");
    v7 = (id)objc_msgSend(v3, "_accessibilityFocusRingTintColor");

  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)_accessibilitySubviewMatchingFKAView:(void *)a1
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id location;
  id v14;
  id v15;

  v14 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v14)
  {
    v11 = v14;
    v3 = v14;
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __60__UIViewAccessibility__accessibilitySubviewMatchingFKAView___block_invoke;
    v8 = &unk_24FF3FF80;
    v9 = location;
    v10 = v11;
    v15 = (id)objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &v4);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
    v12 = 1;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v15 = 0;
    v12 = 1;
  }
  objc_storeStrong(&location, 0);
  return v15;
}

uint64_t __60__UIViewAccessibility__accessibilitySubviewMatchingFKAView___block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v11;
  id v12;
  id v14;
  id v15;
  char v16;
  id v17;
  char v18;
  uint64_t v19;
  id location[2];
  char v21;

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v19 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 0;
    v16 = 0;
    objc_opt_class();
    v15 = (id)__UIAccessibilityCastAsClass();
    v14 = v15;
    objc_storeStrong(&v15, 0);
    v17 = v14;
    if (v14 && *(_QWORD *)(a1 + 32))
    {
      v11 = v17;
      objc_msgSend(v17, "safeCGRectForKey:");
      objc_msgSend(v11, "convertRect:toView:", *(_QWORD *)(a1 + 40), v2, v3, v4, v5);
      v12 = v17;
      objc_msgSend(*(id *)(a1 + 32), "safeCGRectForKey:", CFSTR("_defaultFocusRegionFrame"));
      objc_msgSend(v12, "convertRect:toView:", *(_QWORD *)(a1 + 40), v6, v7, v8, v9);
      v18 = AX_CGRectAlmostEqualToRect() & 1;
    }
    v21 = v18 & 1;
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v21 = 0;
  }
  objc_storeStrong(location, 0);
  return v21 & 1;
}

- (id)_accessibilityViewMatchingFKAView:(void *)a3 inArray:
{
  id v4;
  id v5;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t (*v10)(id *, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  int v13;
  id v14;
  id location;
  uint64_t v16;
  id v17;

  v16 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  if (v16)
  {
    v4 = v14;
    v7 = MEMORY[0x24BDAC760];
    v8 = -1073741824;
    v9 = 0;
    v10 = __65__UIViewAccessibility__accessibilityViewMatchingFKAView_inArray___block_invoke;
    v11 = &unk_24FF3E640;
    v12 = location;
    v5 = (id)objc_msgSend(v4, "ax_filteredArrayUsingBlock:", &v7);
    v17 = (id)objc_msgSend(v5, "firstObject");

    objc_storeStrong(&v12, 0);
  }
  else
  {
    v17 = 0;
  }
  v13 = 1;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
  return v17;
}

uint64_t __65__UIViewAccessibility__accessibilityViewMatchingFKAView_inArray___block_invoke(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v5;
  id v9;
  id v10;
  char v11;
  id v12;
  char v13;
  id *v14;
  _BYTE *v15;
  uint64_t v16;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v16 = a3;
  v15 = a4;
  v14 = a1;
  v13 = 0;
  v11 = 0;
  objc_opt_class();
  v10 = (id)__UIAccessibilityCastAsClass();
  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12 = v9;
  if (v9)
  {
    objc_msgSend(v12, "frame");
    objc_msgSend(a1[4], "frame");
    v13 = AX_CGRectAlmostEqualToRect() & 1;
  }
  *v15 = v13 & 1;
  v5 = v13;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilityIsDescendantOfHostingView
{
  id v2;
  BOOL v4;

  v2 = (id)-[UIViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_545, 0);
  v4 = v2 != 0;

  return v4;
}

uint64_t __62__UIViewAccessibility__accessibilityIsDescendantOfHostingView__block_invoke(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3 = objc_msgSend(location[0], "_accessibilityIsSwiftUIHostingView");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

@end
