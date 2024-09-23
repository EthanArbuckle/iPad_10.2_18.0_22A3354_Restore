@implementation UITextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const char *v4;
  const char *v5;
  const __CFString *v6;
  const char *v7;
  const __CFString *v8;
  id v9;
  id *v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v10 = location;
  v9 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = "@";
  v3 = "{_NSRange=QQ}";
  v8 = CFSTR("UITextField");
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", "{_NSRange=QQ}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("keyboardInput: shouldInsertText: isMarkedText:"), v7, v7, v4, 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("keyboardInputChangedSelection:"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("selectionRange"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("setSelectionRange:"), v5, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("textInputTraits"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_showsLeftView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_showsRightView"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_text"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_updateButtons"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_placeholderView"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_clearButtonClicked:"), v5, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("interactionAssistant"), v7, 0);
  v6 = CFSTR("UITextInteractionAssistant");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("view"), v7, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v8, CFSTR("UIView"));
  objc_msgSend(location[0], "validateProtocol:hasRequiredInstanceMethod:", CFSTR("UITextInputAdditions"), CFSTR("textInputView"));
  objc_storeStrong(v10, v9);
}

- (unint64_t)_accessibilityAutomationType
{
  unint64_t v2;

  v2 = -[UITextFieldAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((v2 & *MEMORY[0x24BEBB168]) != 0)
    return 50;
  else
    return 49;
}

- (BOOL)_axTextFieldIsHidden
{
  return a1 && (objc_msgSend(a1, "accessibilityElementsHidden") & 1) != 0;
}

- (id)_accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:(void *)a1
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id obj;
  uint64_t v23;
  CGRect r2;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect r1;
  _QWORD __b[8];
  id v31;
  double v32;
  id v33;
  id v34;
  id v35;
  char v36;
  id v37;
  int v38;
  id location;
  id v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;
  CGRect v44;

  v43 = *MEMORY[0x24BDAC8D0];
  v40 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v40)
  {
    v36 = 0;
    objc_opt_class();
    v35 = (id)__UIAccessibilityCastAsClass();
    v34 = v35;
    objc_storeStrong(&v35, 0);
    v37 = v34;
    v33 = 0;
    v32 = 0.0;
    memset(__b, 0, sizeof(__b));
    obj = location;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16);
    if (v23)
    {
      v19 = *(_QWORD *)__b[2];
      v20 = 0;
      v21 = v23;
      while (1)
      {
        v18 = v20;
        if (*(_QWORD *)__b[2] != v19)
          objc_enumerationMutation(obj);
        v31 = *(id *)(__b[1] + 8 * v20);
        v16 = v37;
        objc_msgSend(v31, "rect");
        v25 = v2;
        v26 = v3;
        v27 = v4;
        v28 = v5;
        v17 = (id)objc_msgSend(v37, "superview");
        objc_msgSend(v16, "convertRect:toView:", v25, v26, v27, v28);
        r1.origin.x = v6;
        r1.origin.y = v7;
        r1.size.width = v8;
        r1.size.height = v9;

        objc_msgSend(v40, "frame");
        r2.origin.x = v10;
        r2.origin.y = v11;
        r2.size.width = v12;
        r2.size.height = v13;
        v44 = CGRectIntersection(r1, r2);
        v14 = v44.size.width * v44.size.height;
        if (v44.size.width * v44.size.height > v32)
        {
          v32 = v44.size.width * v44.size.height;
          objc_storeStrong(&v33, v31);
        }
        ++v20;
        if (v18 + 1 >= v21)
        {
          v20 = 0;
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v42, 16, v14);
          if (!v21)
            break;
        }
      }
    }

    v41 = v33;
    v38 = 1;
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v37, 0);
  }
  else
  {
    v41 = 0;
    v38 = 1;
  }
  objc_storeStrong(&location, 0);
  return v41;
}

- (id)accessibilityDragSourceDescriptors
{
  double v2;
  double v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  int v15;
  id v16[2];
  UITextFieldAccessibility *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16[1] = (id)a2;
  v16[0] = (id)-[UITextFieldAccessibility accessibilityUserDefinedDragSourceDescriptors](self, "accessibilityUserDefinedDragSourceDescriptors");
  if (v16[0])
  {
    v18 = v16[0];
    v15 = 1;
  }
  else
  {
    v13 = 0;
    objc_opt_class();
    v12 = (id)__UIAccessibilityCastAsClass();
    v11 = v12;
    objc_storeStrong(&v12, 0);
    v14 = v11;
    v10 = (id)objc_msgSend(v11, "selectedTextRange");
    if (v10 && (objc_msgSend(v10, "isEmpty") & 1) == 0)
    {
      v9 = (id)objc_msgSend(v14, "selectionRectsForRange:", v10);
      v8 = -[UITextFieldAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v17, v9);
      if (v8)
      {
        v5 = objc_alloc(MEMORY[0x24BDF67B0]);
        v7 = accessibilityLocalizedString(CFSTR("drag.selection"));
        objc_msgSend(v8, "rect");
        UIRectGetCenter();
        v6 = (id)objc_msgSend(v5, "initWithName:point:inView:", v7, v14, v2, v3);
        v19[0] = v6;
        v18 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);

      }
      else
      {
        v18 = MEMORY[0x24BDBD1A8];
      }
      v15 = 1;
      objc_storeStrong(&v8, 0);
      objc_storeStrong(&v9, 0);
    }
    else
    {
      v18 = MEMORY[0x24BDBD1A8];
      v15 = 1;
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v14, 0);
  }
  objc_storeStrong(v16, 0);
  return v18;
}

- (id)accessibilityDropPointDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  id v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  char v43;
  id v44;
  int v45;
  id v46[2];
  UITextFieldAccessibility *v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v47 = self;
  v46[1] = (id)a2;
  v46[0] = (id)-[UITextFieldAccessibility accessibilityUserDefinedDropPointDescriptors](self, "accessibilityUserDefinedDropPointDescriptors");
  if (!v46[0])
  {
    v43 = 0;
    objc_opt_class();
    v42 = (id)__UIAccessibilityCastAsClass();
    v41 = v42;
    objc_storeStrong(&v42, 0);
    v44 = v41;
    if ((objc_msgSend(v41, "isEnabled") & 1) == 0)
    {
      v48 = MEMORY[0x24BDBD1A8];
      v45 = 1;
LABEL_14:
      objc_storeStrong(&v44, 0);
      goto LABEL_15;
    }
    v40 = (id)objc_msgSend(v44, "selectedTextRange");
    if (v40)
    {
      if ((objc_msgSend(v40, "isEmpty") & 1) != 0)
      {
        v23 = v44;
        v24 = (id)objc_msgSend(v40, "start");
        objc_msgSend(v23, "caretRectForPosition:");
        v36 = v2;
        v37 = v3;
        v38 = v4;
        v39 = v5;

        UIRectGetCenter();
        v34 = v6;
        v35 = v7;
        v25 = objc_alloc(MEMORY[0x24BDF67B0]);
        v27 = accessibilityLocalizedString(CFSTR("drop.at.point"));
        v26 = (id)objc_msgSend(v25, "initWithName:point:inView:", v34, v35);
        v51[0] = v26;
        v48 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);

        v45 = 1;
LABEL_13:
        objc_storeStrong(&v40, 0);
        goto LABEL_14;
      }
      v33 = (id)objc_msgSend(v44, "selectionRectsForRange:", v40);
      v32 = -[UITextFieldAccessibility _accessibilityTextSelectionRectWithLargestVisualRangeFromCandidates:](v47, v33);
      if (v32)
      {
        v20 = objc_alloc(MEMORY[0x24BDF67B0]);
        v22 = accessibilityLocalizedString(CFSTR("drop.on.selection"));
        objc_msgSend(v32, "rect");
        UIRectGetCenter();
        v21 = (id)objc_msgSend(v20, "initWithName:point:inView:", v22, v44, v8, v9);
        v50 = v21;
        v48 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v50, 1);

        v45 = 1;
      }
      else
      {
        v45 = 0;
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      if (v45)
        goto LABEL_13;
    }
    objc_msgSend(v44, "frame");
    UIRectGetCenter();
    v30 = v10;
    v31 = v11;
    v15 = v44;
    v16 = (id)objc_msgSend(v44, "superview");
    objc_msgSend(v15, "convertPoint:fromView:", v30, v31);
    v28 = v12;
    v29 = v13;

    v17 = objc_alloc(MEMORY[0x24BDF67B0]);
    v19 = accessibilityLocalizedString(CFSTR("drop.into.text"));
    v18 = (id)objc_msgSend(v17, "initWithName:point:inView:", v28, v29);
    v49 = v18;
    v48 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);

    v45 = 1;
    goto LABEL_13;
  }
  v48 = v46[0];
  v45 = 1;
LABEL_15:
  objc_storeStrong(v46, 0);
  return v48;
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
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;
  objc_super v25;
  CGRect v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  id v33;
  id v34;
  id v35[2];
  UITextFieldAccessibility *v36;
  double v37;
  double v38;
  CGPoint result;

  v36 = self;
  v35[1] = (id)a2;
  v23 = (id)-[UITextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isEditing"));
  v24 = objc_msgSend(v23, "BOOLValue");

  if ((v24 & 1) != 0)
  {
    v35[0] = (id)-[UITextFieldAccessibility safeValueForKey:](v36, "safeValueForKey:", CFSTR("interactionAssistant"));
    v34 = (id)objc_msgSend(v35[0], "safeUIViewForKey:", CFSTR("_selectionView"));
    v20 = (id)objc_msgSend(v35[0], "safeValueForKey:", CFSTR("view"));
    v33 = (id)objc_msgSend(v20, "safeUIViewForKey:", CFSTR("textInputView"));

    v22 = (id)objc_msgSend(v34, "safeValueForKey:", CFSTR("selection"));
    v21 = (id)objc_msgSend(v22, "safeValueForKey:", CFSTR("caretRect"));
    objc_msgSend(v21, "rectValue");
    *(_QWORD *)&v31 = v2;
    *((_QWORD *)&v31 + 1) = v3;
    *(_QWORD *)&v32 = v4;
    *((_QWORD *)&v32 + 1) = v5;

    objc_msgSend(v34, "convertRect:fromView:", v33, v31, v32);
    v27 = v6;
    v28 = v7;
    v29 = v8;
    v30 = v9;
    UIAccessibilityFrameForBounds();
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = v12;
    v26.size.height = v13;
    CGRectGetMidX(v26);
    CGRectGetMidY(v26);
    CGPointMake_9();
    v37 = v14;
    v38 = v15;
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(v35, 0);
  }
  else
  {
    v25.receiver = v36;
    v25.super_class = (Class)UITextFieldAccessibility;
    -[UITextFieldAccessibility accessibilityActivationPoint](&v25, sel_accessibilityActivationPoint);
    v37 = v16;
    v38 = v17;
  }
  v18 = v37;
  v19 = v38;
  result.y = v19;
  result.x = v18;
  return result;
}

- (uint64_t)_axShowsLeadingView
{
  char v2;
  char v4;

  if (a1)
  {
    if ((objc_msgSend(a1, "_shouldReverseLayoutDirection") & 1) != 0)
      v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("_showsRightView")) & 1;
    else
      v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("_showsLeftView")) & 1;
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (uint64_t)_axShowsTrailingView
{
  char v2;
  char v4;

  if (a1)
  {
    if ((objc_msgSend(a1, "_shouldReverseLayoutDirection") & 1) != 0)
      v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("_showsLeftView")) & 1;
    else
      v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("_showsRightView")) & 1;
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

- (id)_accessibilityLeftButtons
{
  id v2;
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v13 = a1;
  if (a1)
  {
    v12 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    if ((-[UITextFieldAccessibility _axShowsLeadingView](v13) & 1) != 0)
    {
      v11 = (id)objc_msgSend(v13, "leftView");
      if ((objc_msgSend(v11, "isAccessibilityElement") & 1) != 0)
      {
        objc_msgSend(v12, "addObject:", v11);
      }
      else if ((objc_msgSend(v11, "accessibilityElementsHidden") & 1) == 0)
      {
        v2 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
        v10 = (id)objc_msgSend(v11, "_accessibilityLeafDescendantsWithOptions:");

        v3 = v10;
        v4 = MEMORY[0x24BDAC760];
        v5 = -1073741824;
        v6 = 0;
        v7 = __53__UITextFieldAccessibility__accessibilityLeftButtons__block_invoke;
        v8 = &unk_24FF3E490;
        v9 = v13;
        objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v4);
        objc_msgSend(v12, "axSafelyAddObjectsFromArray:", v10);
        objc_storeStrong(&v9, 0);
        objc_storeStrong(&v10, 0);
      }
      objc_storeStrong(&v11, 0);
    }
    v14 = v12;
    objc_storeStrong(&v12, 0);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

void __53__UITextFieldAccessibility__accessibilityLeftButtons__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setAccessibilityContainer:", a1[4]);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityRightButtons
{
  id v2;
  id v4;
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *, void *);
  void *v12;
  UITextFieldAccessibility *v13;
  id v14;
  char v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  id v21[2];
  UITextFieldAccessibility *v22;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v20 = (id)-[UITextFieldAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("_clearButton"));
  v18 = 0;
  v7 = 0;
  if (v20)
  {
    v19 = (id)objc_msgSend(v20, "superview");
    v18 = 1;
    v7 = v19 != 0;
  }
  if ((v18 & 1) != 0)

  if (v7)
  {
    objc_msgSend(v20, "accessibilitySetIdentification:", CFSTR("UIClearButton"));
    objc_msgSend(v21[0], "addObject:", v20);
  }
  v15 = 0;
  if ((-[UITextFieldAccessibility _axShowsTrailingView](v22) & 1) != 0)
  {
    v16 = (id)-[UITextFieldAccessibility rightView](v22, "rightView");
    v15 = 1;
    v2 = v16;
  }
  else
  {
    v2 = 0;
  }
  v17 = v2;
  if ((v15 & 1) != 0)

  if (v20 != v17)
  {
    if ((objc_msgSend(v17, "isAccessibilityElement") & 1) != 0)
    {
      objc_msgSend(v21[0], "addObject:", v17);
    }
    else if ((objc_msgSend(v17, "accessibilityElementsHidden") & 1) == 0)
    {
      v5 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options");
      v14 = (id)objc_msgSend(v17, "_accessibilityLeafDescendantsWithOptions:");

      v6 = v14;
      v8 = MEMORY[0x24BDAC760];
      v9 = -1073741824;
      v10 = 0;
      v11 = __54__UITextFieldAccessibility__accessibilityRightButtons__block_invoke;
      v12 = &unk_24FF3E490;
      v13 = v22;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v8);
      objc_msgSend(v21[0], "axSafelyAddObjectsFromArray:", v14);
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong(&v14, 0);
    }
  }
  v4 = v21[0];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
  return v4;
}

void __54__UITextFieldAccessibility__accessibilityRightButtons__block_invoke(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "setAccessibilityContainer:", a1[4]);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  BOOL v5;
  objc_super v6;
  int v7;
  id v8;
  id *v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL (*v14)(uint64_t);
  void *v15;
  UITextFieldAccessibility *v16;
  char v17;
  id location[2];
  UITextFieldAccessibility *v19;
  CGPoint v20;
  id v21;

  v20 = a3;
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v17 = -[UITextFieldAccessibility _accessibilityBoolValueForKey:](v19, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v10 = 0;
  v5 = 0;
  if (!v17)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v15 = &unk_24FF3E0C0;
    v16 = v19;
    v10 = 1;
    v9 = (id *)&v16;
    v5 = v14((uint64_t)&v11);
  }
  if (v5)
  {
    -[UITextFieldAccessibility _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 1);
    v8 = (id)-[UITextFieldAccessibility accessibilityHitTest:withEvent:](v19, "accessibilityHitTest:withEvent:", location[0], v20.x, v20.y);
    -[UITextFieldAccessibility _accessibilitySetBoolValue:forKey:](v19, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v21 = v8;
    v7 = 1;
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v7 = 0;
  }
  if ((v10 & 1) != 0)
    objc_storeStrong(v9, 0);
  if (!v7)
  {
    if (-[UITextFieldAccessibility _axTextFieldIsHidden](v19))
    {
      v21 = 0;
    }
    else
    {
      v6.receiver = v19;
      v6.super_class = (Class)UITextFieldAccessibility;
      v21 = -[UITextFieldAccessibility _accessibilityHitTest:withEvent:](&v6, sel__accessibilityHitTest_withEvent_, location[0], v20.x, v20.y);
    }
    v7 = 1;
  }
  objc_storeStrong(location, 0);
  return v21;
}

BOOL __60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
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
  v18 = (dispatch_once_t *)&UIKBEmojiZeroWidthJoiner_block_invoke_onceToken_3;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_45);
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
  return Implementation != (IMP)UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_3;
}

void __60__UITextFieldAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
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
    UIKBEmojiZeroWidthJoiner_block_invoke_BaseImplementation_3 = (uint64_t)method_getImplementation(InstanceMethod);
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

- (void)_accessibilitySetValue:(id)a3
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  UITextFieldAccessibility *v8;
  id v9;
  id location[2];
  UITextFieldAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __51__UITextFieldAccessibility__accessibilitySetValue___block_invoke;
  v7 = &unk_24FF3E050;
  v8 = v11;
  v9 = location[0];
  AXPerformSafeBlock();
  objc_storeStrong(&v9, 0);
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong(location, 0);
}

uint64_t __51__UITextFieldAccessibility__accessibilitySetValue___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t result;
  BOOL v4;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "window");
  v4 = v1 != 0;

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  result = objc_msgSend(*(id *)(a1 + 32), "setText:", *(_QWORD *)(a1 + 40));
  if (v4)
    return objc_msgSend(*(id *)(a1 + 32), "fieldEditorDidChange:", 0);
  return result;
}

- (void)_clearButtonClicked:(id)a3
{
  objc_super v3;
  id location[2];
  UITextFieldAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextFieldAccessibility;
  -[UITextFieldAccessibility _clearButtonClicked:](&v3, sel__clearButtonClicked_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  -[UITextFieldAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v5, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF0D8]);
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  return -[UITextFieldAccessibility _accessibilityLeftButtons](self);
}

- (id)_accessibilitySupplementaryFooterViews
{
  return -[UITextFieldAccessibility _accessibilityRightButtons](self, "_accessibilityRightButtons", a2, self);
}

- (BOOL)isAccessibilityElement
{
  id location[3];
  char v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextFieldAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  if (location[0])
    v4 = objc_msgSend(location[0], "BOOLValue") & 1;
  else
    v4 = 1;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)_accessibilityPlaceholderValue:(void *)a1
{
  double v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;

  v21 = a1;
  v20 = a2 & 1;
  if (a1)
  {
    v19 = 0;
    v17 = 0;
    objc_opt_class();
    v13 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("_placeholderView"));
    v16 = (id)__UIAccessibilityCastAsClass();

    v15 = v16;
    objc_storeStrong(&v16, 0);
    v18 = v15;
    v12 = (id)objc_msgSend(v15, "superview");
    if (!v12 || (objc_msgSend(v18, "isHidden") & 1) != 0 || (objc_msgSend(v18, "alpha"), v11 = 1, v2 <= 0.01))
      v11 = v20;

    if ((v11 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (id)objc_msgSend(v18, "attributedText");
        if (objc_msgSend(v14, "length"))
        {
          v3 = (id)UIAccessibilityConvertAttachmentsInAttributedStringToAX();
          v4 = v19;
          v19 = v3;

        }
        objc_storeStrong(&v14, 0);
      }
      if (!objc_msgSend(v19, "length"))
      {
        v5 = (id)objc_msgSend(v18, "accessibilityLabel");
        v6 = v19;
        v19 = v5;

      }
      v7 = objc_alloc(MEMORY[0x24BDFEA60]);
      v8 = (void *)objc_msgSend(v7, "initWithStringOrAttributedString:", v19);
      v9 = v19;
      v19 = v8;

      objc_msgSend(v19, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC10]);
    }
    v22 = v19;
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
  }
  else
  {
    v22 = 0;
  }
  return v22;
}

- (id)accessibilityPlaceholderValue
{
  return -[UITextFieldAccessibility _accessibilityPlaceholderValue:](self, 1);
}

- (id)_accessibilityTextFieldText
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21[2];
  UITextFieldAccessibility *v22;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = (id)-[UITextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributedText"));
  if (v21[0])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithCFAttributedString:", v21[0]);
      v3 = v21[0];
      v21[0] = v2;

    }
  }
  else
  {
    v21[0] = (id)-[UITextFieldAccessibility safeValueForKey:](v22, "safeValueForKey:", CFSTR("_text"));

  }
  v4 = -[UITextFieldAccessibility accessibilityTraits](v22, "accessibilityTraits");
  if ((v4 & *MEMORY[0x24BEBB168]) == *MEMORY[0x24BEBB168])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (id)objc_msgSend(v21[0], "string");
      v6 = v21[0];
      v21[0] = v5;

    }
    v20 = 0;
    objc_opt_class();
    v19 = (id)__UIAccessibilityCastAsClass();
    v18 = v19;
    objc_storeStrong(&v19, 0);
    v7 = -[UIView _accessibilitySecureTextForString:]((uint64_t)v18, v21[0]);
    v8 = v21[0];
    v21[0] = v7;

  }
  v17 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  v15 = (id)objc_msgSend(v17, "textInputTraits");
  v16 = objc_msgSend(v15, "keyboardType") != 5;

  if (!v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (id)objc_msgSend(v21[0], "string");
      v10 = v21[0];
      v21[0] = v9;

    }
    v11 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v21[0]);
    v12 = v21[0];
    v21[0] = v11;

    objc_msgSend(v21[0], "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC00]);
  }
  v14 = v21[0];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v21, 0);
  return v14;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  objc_class *v3;
  objc_super v5;
  Method InstanceMethod;
  SEL name;
  SEL v8;
  UITextFieldAccessibility *v9;
  id location;
  dispatch_once_t *v12;

  v9 = self;
  v8 = a2;
  name = a3;
  v12 = (dispatch_once_t *)&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken_0;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_293);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, name);
  if (name == sel_accessibilityValue)
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod;
  if (name == sel_accessibilityAttributedValue)
    return InstanceMethod != (Method)_accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod;
  v5.receiver = v9;
  v5.super_class = (Class)UITextFieldAccessibility;
  return -[UITextFieldAccessibility _accessibilityOverridesPotentiallyAttributedAPISelector:](&v5, sel__accessibilityOverridesPotentiallyAttributedAPISelector_, name);
}

Method __84__UITextFieldAccessibility__accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityValue);
  v1 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v1, sel_accessibilityAttributedValue);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod = (uint64_t)result;
  return result;
}

- (id)_accessibilityGetValue
{
  id v3;
  id obj;
  id v5;
  id location[2];
  UITextFieldAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextFieldAccessibility accessibilityUserDefinedValue](self, "accessibilityUserDefinedValue");
  if (!location[0])
  {
    location[0] = -[UITextFieldAccessibility _accessibilityTextFieldText](v7, "_accessibilityTextFieldText");

  }
  if (!objc_msgSend(location[0], "length"))
  {
    v5 = -[UITextFieldAccessibility _accessibilityPlaceholderValue:](v7, 0);
    if (v5)
      objc_storeStrong(location, v5);
    objc_storeStrong(&v5, 0);
  }
  if ((-[UITextFieldAccessibility _accessibilityBoolValueForKey:](v7, "_accessibilityBoolValueForKey:", *MEMORY[0x24BDFEB78]) & 1) != 0)
  {
    if ((objc_msgSend(location[0], "isAXAttributedString") & 1) != 0)
    {
      objc_msgSend(location[0], "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB78]);
    }
    else
    {
      obj = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", location[0]);
      objc_msgSend(obj, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB78]);
      objc_storeStrong(location, obj);
      objc_storeStrong(&obj, 0);
    }
  }
  v3 = location[0];
  objc_storeStrong(location, 0);
  return v3;
}

- (id)accessibilityValue
{
  return -[UITextFieldAccessibility _accessibilityGetValue](self, "_accessibilityGetValue", a2, self);
}

- (id)accessibilityAttributedValue
{
  id location[3];
  id v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = -[UITextFieldAccessibility _accessibilityGetValue](self, "_accessibilityGetValue");
  if ((objc_msgSend(location[0], "isAXAttributedString") & 1) != 0)
  {
    v4 = (id)objc_msgSend(location[0], "cfAttributedString");
  }
  else if (location[0])
  {
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", location[0]);
  }
  else
  {
    v4 = 0;
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  int v5;
  id v6[2];
  UITextFieldAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)-[UITextFieldAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  if (v6[0])
  {
    v8 = v6[0];
    v5 = 1;
  }
  else
  {
    v3 = (id)-[UITextFieldAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("textLabel"));
    v4 = (id)objc_msgSend(v3, "accessibilityLabel");

    v8 = v4;
    v5 = 1;
    objc_storeStrong(&v4, 0);
  }
  objc_storeStrong(v6, 0);
  return v8;
}

- (id)_accessibilityForegroundTextColorAttribute
{
  return (id)-[UITextFieldAccessibility textColor](self, "textColor", a2, self);
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  unint64_t v4;
  id v5;
  char v6;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  unint64_t v13;
  SEL v14;
  UITextFieldAccessibility *v15;

  v15 = self;
  v14 = a2;
  v13 = 0;
  v13 = *MEMORY[0x24BEBB198];
  v5 = (id)-[UITextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("isEditing"));
  v11 = 0;
  v6 = 1;
  if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v12 = (id)-[UITextFieldAccessibility safeValueForKey:](v15, "safeValueForKey:", CFSTR("isFirstResponder"));
    v11 = 1;
    v6 = objc_msgSend(v12, "BOOLValue");
  }
  if ((v11 & 1) != 0)

  if ((v6 & 1) != 0
    && (AXDoesRequestingClientDeserveAutomation()
     || _AXSMossdeepEnabled()
     || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityHardwareKeyboardActive") & 1) != 0
     || (objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilitySoftwareKeyboardActive") & 1) != 0))
  {
    v13 |= *MEMORY[0x24BEBB128];
  }
  v10 = (id)-[UITextFieldAccessibility accessibilityUserDefinedTraits](v15, "accessibilityUserDefinedTraits");
  if (v10)
    v13 |= objc_msgSend(v10, "unsignedLongLongValue");
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v2 = -[UIView _accessibilityTextAreaTraits](v7);
  v13 |= v2;

  v4 = v13;
  objc_storeStrong(&v10, 0);
  return v4;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[UITextFieldAccessibility selectionRange](self, "selectionRange", a2, self);
  result.length = v3;
  result.location = v2;
  return result;
}

- (id)accessibilityCustomRotors
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  objc_super v10;
  id v11[2];
  UITextFieldAccessibility *v12;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = v11[0];
  v10.receiver = v12;
  v10.super_class = (Class)UITextFieldAccessibility;
  v7 = -[UITextFieldAccessibility accessibilityCustomRotors](&v10, sel_accessibilityCustomRotors);
  objc_msgSend(v6, "axSafelyAddObjectsFromArray:");

  v8 = v11[0];
  v9 = (id)-[UITextFieldAccessibility _accessibilityInternalTextLinkCustomRotors](v12, "_accessibilityInternalTextLinkCustomRotors");
  objc_msgSend(v8, "axSafelyAddObjectsFromArray:");

  if ((-[UITextFieldAccessibility isEditing](v12, "isEditing") & 1) != 0
    && AXUIKeyboardTypeSupportsMisspelledRotor(-[UITextFieldAccessibility keyboardType](v12, "keyboardType")))
  {
    v4 = v11[0];
    v5 = (id)-[UITextFieldAccessibility _accessibilityMisspelledRotor](v12, "_accessibilityMisspelledRotor");
    objc_msgSend(v4, "axSafelyAddObject:");

  }
  v3 = v11[0];
  objc_storeStrong(v11, 0);
  return v3;
}

- (id)_accessibilityAttributedTextRetrieval
{
  return (id)-[UITextFieldAccessibility attributedText](self, "attributedText", a2, self);
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  char v3;
  NSUInteger v4;
  id location[2];
  UITextFieldAccessibility *v6;
  _NSRange v7;
  NSUInteger v8;
  uint64_t v9;
  _NSRange v10;

  v7 = a3;
  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v4 = objc_msgSend(location[0], "length");
  v3 = 0;
  if (AXIsDictationListening())
  {
    AXHandleUserInteractionForDictation(1);
    v3 = 1;
  }
  v10 = v7;
  if (v7.location + v7.length > v4 && !v7.length)
    v7.location = v4;
  if (v7.length || (v8 = v7.location, v9 = 0, v7.location > v4))
  {
    if (v7.length)
      -[NSObject _accessibilitySetTextSelection:](v6, v7.location, v7.length);
  }
  else
  {
    -[UITextFieldAccessibility setSelectionRange:](v6, "setSelectionRange:", v7.location, v7.length);
  }
  if ((v3 & 1) != 0)
    AXHandleUserInteractionForDictation(0);
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille
{
  BOOL v3;
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  char v9;
  id v10[3];

  v10[2] = self;
  v10[1] = (id)a2;
  v9 = 0;
  objc_opt_class();
  v8 = (id)__UIAccessibilityCastAsClass();
  v7 = v8;
  objc_storeStrong(&v8, 0);
  v10[0] = v7;
  objc_msgSend(v7, "keyboardType");
  v6 = UIKeyboardTypeIsNumberPad() & 1;
  v5 = (id)objc_msgSend(v10[0], "textInputTraits");
  v4 = (id)objc_msgSend(v5, "textContentType");
  v3 = 1;
  if ((v6 & 1) == 0)
  {
    v3 = 1;
    if (v4 != (id)*MEMORY[0x24BDF7F30])
      v3 = v4 == (id)*MEMORY[0x24BDF7E50];
  }
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v10, 0);
  return !v3;
}

- (BOOL)_accessibilityAvoidsMockViewContainers
{
  return 1;
}

- (BOOL)keyboardInput:(id)a3 shouldInsertText:(id)a4 isMarkedText:(BOOL)a5
{
  uint64_t v5;
  uint64_t v9;
  id argument;
  objc_super v11;
  char v12;
  id v13;
  BOOL v14;
  id v15;
  id location[2];
  UITextFieldAccessibility *v17;
  char v18;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = a5;
  v13 = (id)-[UITextFieldAccessibility safeValueForKey:](v17, "safeValueForKey:");
  v12 = 0;
  v11.receiver = v17;
  v11.super_class = (Class)UITextFieldAccessibility;
  v12 = -[UITextFieldAccessibility keyboardInput:shouldInsertText:isMarkedText:](&v11, sel_keyboardInput_shouldInsertText_isMarkedText_, location[0], v15, a5);
  argument = (id)-[UITextFieldAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("text"));
  if ((-[UITextFieldAccessibility accessibilityElementsHidden](v17, "accessibilityElementsHidden") & 1) != 0)
  {
    v18 = v12 & 1;
  }
  else
  {
    if ((v12 & 1) == 0
      && (-[UITextFieldAccessibility safeBoolForKey:](v17, "safeBoolForKey:", CFSTR("isEditing")) & 1) != 0)
    {
      if ((objc_msgSend(v13, "isEqualToString:", argument) & 1) != 0)
      {
        if ((objc_msgSend(v15, "isEqualToString:", CFSTR("\n")) & 1) == 0)
          UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
      }
      else
      {
        v5 = -[UITextFieldAccessibility accessibilityTraits](v17, "accessibilityTraits");
        if ((v5 & *MEMORY[0x24BEBB168]) == 0)
        {
          v9 = 0;
          if ((-[UITextFieldAccessibility accessibilityValueChangesAreReplacements](v17, "accessibilityValueChangesAreReplacements") & 1) != 0)v9 = *MEMORY[0x24BDFF100];
          -[UITextFieldAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v17, "_accessibilityPostValueChangedNotificationWithChangeType:", v9);
          UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
        }
      }
    }
    v18 = v12 & 1;
  }
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v18 & 1;
}

- (BOOL)fieldEditor:(id)a3 shouldInsertText:(id)a4 replacingRange:(_NSRange)a5
{
  char v6;
  objc_super v8;
  char v9;
  id v10;
  id location[2];
  UITextFieldAccessibility *v12;
  _NSRange v13;

  v13 = a5;
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9 = 0;
  v8.receiver = v12;
  v8.super_class = (Class)UITextFieldAccessibility;
  v9 = -[UITextFieldAccessibility fieldEditor:shouldInsertText:replacingRange:](&v8, sel_fieldEditor_shouldInsertText_replacingRange_, location[0], v10, v13.location, v13.length);
  if (!v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
  v6 = v9;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v6 & 1;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v4 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v6[0] = (id)-[UITextFieldAccessibility _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:");

  v5 = (id)objc_msgSend(v6[0], "firstObject");
  objc_storeStrong(v6, 0);
  return v5;
}

- (id)_accessibilityCapturedImages
{
  return 0;
}

@end
