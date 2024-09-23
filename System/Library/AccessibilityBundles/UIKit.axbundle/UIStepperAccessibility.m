@implementation UIStepperAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStepper");
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
  const __CFString *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = CFSTR("UIStepper");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("visualElement"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_refreshVisualElement"), v3, 0);
  v4 = CFSTR("UIStepperHorizontalVisualElement");
  v5 = "UIButton";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("_plusButton"), v5);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v6, CFSTR("_value"), "d");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("contentView"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (unint64_t)_accessibilityAutomationType
{
  return 79;
}

- (id)_axMacIdiomDecrementElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIStepperAccessibility___axMacIdiomDecrementElement);
  else
    return 0;
}

- (void)_axSetMacIdiomDecrementElement:(uint64_t)a1
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

- (id)_axMacIdiomIncrementElement
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIStepperAccessibility___axMacIdiomIncrementElement);
  else
    return 0;
}

- (void)_axSetMacIdiomIncrementElement:(uint64_t)a1
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

- (void)_axAnnotateButtons
{
  id v1;
  id v2;
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
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  int v21;
  id (*v22)(id *);
  void *v23;
  id v24;
  uint64_t v25;
  int v26;
  int v27;
  id (*v28)(id *);
  void *v29;
  id v30;
  uint64_t v31;
  int v32;
  int v33;
  __CFString *(*v34)(id *);
  void *v35;
  id v36;
  uint64_t v37;
  int v38;
  int v39;
  __CFString *(*v40)(id *);
  void *v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  int v46;
  int v47;
  double (*v48)(id *);
  void *v49;
  id v50;
  uint64_t v51;
  int v52;
  int v53;
  double (*v54)(id *);
  void *v55;
  id v56;
  uint64_t v57;
  int v58;
  int v59;
  id (*v60)(id *);
  void *v61;
  id v62;
  uint64_t v63;
  int v64;
  int v65;
  id (*v66)(id *);
  void *v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  int v72;
  int v73;
  id (*v74)(id *);
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  int v79;
  int v80;
  id (*v81)(id *);
  void *v82;
  id v83;
  id v84;
  id location;
  void *v86;
  _QWORD v87[3];

  v87[2] = *MEMORY[0x24BDAC8D0];
  v86 = a1;
  if (a1)
  {
    objc_initWeak(&location, v86);
    v78 = MEMORY[0x24BDAC760];
    v79 = -1073741824;
    v80 = 0;
    v81 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke;
    v82 = &unk_24FF3DC00;
    objc_copyWeak(&v83, &location);
    v84 = (id)MEMORY[0x2348C3D88](&v78);
    v71 = MEMORY[0x24BDAC760];
    v72 = -1073741824;
    v73 = 0;
    v74 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_2;
    v75 = &unk_24FF3DC00;
    objc_copyWeak(&v76, &location);
    v77 = (id)MEMORY[0x2348C3D88](&v71);
    if ((objc_msgSend(v86, "_accessibilityViewIsMacIdiom") & 1) != 0)
    {
      v70 = -[UIStepperAccessibility _axMacIdiomIncrementElement](v86);
      v69 = -[UIStepperAccessibility _axMacIdiomDecrementElement](v86);
      if (!v70 || !v69)
      {
        v18 = objc_alloc(MEMORY[0x24BDF67A0]);
        v17 = (void *)objc_msgSend(v18, "initWithAccessibilityContainer:", v86);
        v1 = v70;
        v70 = v17;

        v16 = objc_alloc(MEMORY[0x24BDF67A0]);
        v15 = (void *)objc_msgSend(v16, "initWithAccessibilityContainer:", v86);
        v2 = v69;
        v69 = v15;

        -[UIStepperAccessibility _axSetMacIdiomIncrementElement:]((uint64_t)v86, v17);
        -[UIStepperAccessibility _axSetMacIdiomDecrementElement:]((uint64_t)v86, v15);
        objc_msgSend(v17, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
        objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
        v14 = v86;
        v87[0] = v17;
        v87[1] = v15;
        v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 2);
        objc_msgSend(v14, "setAccessibilityElements:");

      }
      objc_msgSend(v70, "_setAccessibilityLabelBlock:", v77);
      objc_msgSend(v69, "_setAccessibilityLabelBlock:", v84);
      v12 = v70;
      v63 = MEMORY[0x24BDAC760];
      v64 = -1073741824;
      v65 = 0;
      v66 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_3;
      v67 = &unk_24FF3DC00;
      objc_copyWeak(&v68, &location);
      objc_msgSend(v12, "_setAccessibilityValueBlock:", &v63);
      v11 = v69;
      v57 = MEMORY[0x24BDAC760];
      v58 = -1073741824;
      v59 = 0;
      v60 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_4;
      v61 = &unk_24FF3DC00;
      objc_copyWeak(&v62, &location);
      objc_msgSend(v11, "_setAccessibilityValueBlock:", &v57);
      v10 = v70;
      v51 = MEMORY[0x24BDAC760];
      v52 = -1073741824;
      v53 = 0;
      v54 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_5;
      v55 = &unk_24FF3DD28;
      objc_copyWeak(&v56, &location);
      objc_msgSend(v10, "_setAccessibilityFrameBlock:", &v51);
      v9 = v69;
      v45 = MEMORY[0x24BDAC760];
      v46 = -1073741824;
      v47 = 0;
      v48 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_6;
      v49 = &unk_24FF3DD28;
      objc_copyWeak(&v50, &location);
      objc_msgSend(v9, "_setAccessibilityFrameBlock:", &v45);
      objc_destroyWeak(&v50);
      objc_destroyWeak(&v56);
      objc_destroyWeak(&v62);
      objc_destroyWeak(&v68);
      objc_storeStrong(&v69, 0);
      objc_storeStrong(&v70, 0);
    }
    else
    {
      v8 = (id)objc_msgSend(v86, "safeValueForKey:", CFSTR("visualElement"));
      v44 = (id)objc_msgSend(v8, "safeUIViewForKey:", CFSTR("_plusButton"));

      v7 = (id)objc_msgSend(v86, "safeValueForKey:", CFSTR("visualElement"));
      v43 = (id)objc_msgSend(v7, "safeUIViewForKey:", CFSTR("_minusButton"));

      objc_msgSend(v44, "_setAccessibilityLabelBlock:", v77);
      objc_msgSend(v43, "_setAccessibilityLabelBlock:", v84);
      v6 = v44;
      v37 = MEMORY[0x24BDAC760];
      v38 = -1073741824;
      v39 = 0;
      v40 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_7;
      v41 = &unk_24FF3DC00;
      objc_copyWeak(&v42, &location);
      objc_msgSend(v6, "_setAccessibilityIdentifierBlock:", &v37);
      v5 = v43;
      v31 = MEMORY[0x24BDAC760];
      v32 = -1073741824;
      v33 = 0;
      v34 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_8;
      v35 = &unk_24FF3DC00;
      objc_copyWeak(&v36, &location);
      objc_msgSend(v5, "_setAccessibilityIdentifierBlock:", &v31);
      v4 = v44;
      v25 = MEMORY[0x24BDAC760];
      v26 = -1073741824;
      v27 = 0;
      v28 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_9;
      v29 = &unk_24FF3DC00;
      objc_copyWeak(&v30, &location);
      objc_msgSend(v4, "_setAccessibilityValueBlock:", &v25);
      v3 = v43;
      v19 = MEMORY[0x24BDAC760];
      v20 = -1073741824;
      v21 = 0;
      v22 = __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_10;
      v23 = &unk_24FF3DC00;
      objc_copyWeak(&v24, &location);
      objc_msgSend(v3, "_setAccessibilityValueBlock:", &v19);
      objc_msgSend(v44, "_accessibilitySetScannerActivateBehavior:", 1);
      objc_msgSend(v43, "_accessibilitySetScannerActivateBehavior:", 1);
      if ((-[UIStepperAccessibility _axIsAccessibilityNumericalPicker](v86) & 1) != 0)
      {
        objc_msgSend(v44, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_33);
        objc_msgSend(v43, "_setAccessibilityAdditionalTraitsBlock:", &__block_literal_global_238);
      }
      objc_destroyWeak(&v24);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&v36);
      objc_destroyWeak(&v42);
      objc_storeStrong(&v43, 0);
      objc_storeStrong(&v44, 0);
    }
    objc_storeStrong(&v77, 0);
    objc_destroyWeak(&v76);
    objc_storeStrong(&v84, 0);
    objc_destroyWeak(&v83);
    objc_destroyWeak(&location);
  }
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  v3 = (id)objc_msgSend(v6[0], "accessibilityLabel");
  v2 = accessibilityLocalizedString(CFSTR("ui.stepper.decrement"));
  v5 = (id)__UIAXStringForVariables();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_2(id *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6[3];

  v6[2] = a1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  v3 = (id)objc_msgSend(v6[0], "accessibilityLabel");
  v2 = accessibilityLocalizedString(CFSTR("ui.stepper.increment"));
  v5 = (id)__UIAXStringForVariables();

  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(v6, 0);
  return v4;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_3(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityValue");
  objc_storeStrong(v3, 0);
  return v2;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_4(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityValue");
  objc_storeStrong(v3, 0);
  return v2;
}

double __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_5(id *a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CGRect rect;
  id v7[3];
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v12;

  v7[2] = a1;
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(v7[0], "accessibilityFrame");
  rect = v12;
  CGRectGetMinX(v12);
  CGRectGetMinY(rect);
  CGRectGetWidth(rect);
  CGRectGetHeight(rect);
  CGRectMake_2();
  v8 = v1;
  v9 = v2;
  v10 = v3;
  v11 = v4;
  objc_storeStrong(v7, 0);
  return v8;
}

double __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_6(id *a1)
{
  double v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CGRect rect;
  id v7[3];
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v12;

  v7[2] = a1;
  v7[1] = a1;
  v7[0] = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(v7[0], "accessibilityFrame");
  rect = v12;
  CGRectGetMinX(v12);
  CGRectGetMinY(rect);
  CGRectGetHeight(rect);
  CGRectGetWidth(rect);
  CGRectGetHeight(rect);
  CGRectMake_2();
  v8 = v1;
  v9 = v2;
  v10 = v3;
  v11 = v4;
  objc_storeStrong(v7, 0);
  return v8;
}

__CFString *__44__UIStepperAccessibility__axAnnotateButtons__block_invoke_7(id *a1)
{
  id location;
  id v3[3];
  __CFString *v4;

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  location = (id)objc_msgSend(v3[0], "accessibilityIdentifier");
  if (objc_msgSend(location, "length"))
    v4 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-Increment"), location);
  else
    v4 = CFSTR("Increment");
  objc_storeStrong(&location, 0);
  objc_storeStrong(v3, 0);
  return v4;
}

__CFString *__44__UIStepperAccessibility__axAnnotateButtons__block_invoke_8(id *a1)
{
  id location;
  id v3[3];
  __CFString *v4;

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  location = (id)objc_msgSend(v3[0], "accessibilityIdentifier");
  if (objc_msgSend(location, "length"))
    v4 = (__CFString *)(id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-Decrement"), location);
  else
    v4 = CFSTR("Decrement");
  objc_storeStrong(&location, 0);
  objc_storeStrong(v3, 0);
  return v4;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_9(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityValue");
  objc_storeStrong(v3, 0);
  return v2;
}

id __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_10(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityValue");
  objc_storeStrong(v3, 0);
  return v2;
}

- (uint64_t)_axIsAccessibilityNumericalPicker
{
  id v2;
  char v3;

  if (a1)
  {
    v2 = (id)objc_msgSend(a1, "accessibilityIdentification");
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXStepper")) & 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_11()
{
  return *MEMORY[0x24BDF7408];
}

uint64_t __44__UIStepperAccessibility__axAnnotateButtons__block_invoke_12()
{
  return *MEMORY[0x24BDF7408];
}

- (void)_commonStepperInit
{
  objc_super v2;
  SEL v3;
  UIStepperAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIStepperAccessibility;
  -[UIStepperAccessibility _commonStepperInit](&v2, sel__commonStepperInit);
  -[UIStepperAccessibility _axAnnotateButtons](v4);
}

- (void)_refreshVisualElement
{
  objc_super v2;
  SEL v3;
  UIStepperAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIStepperAccessibility;
  -[UIStepperAccessibility _refreshVisualElement](&v2, sel__refreshVisualElement);
  -[UIStepperAccessibility _axAnnotateButtons](v4);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v2;
  SEL v3;
  UIStepperAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UIStepperAccessibility;
  -[UIStepperAccessibility _accessibilityLoadAccessibilityInformation](&v2, sel__accessibilityLoadAccessibilityInformation);
  -[UIStepperAccessibility _axAnnotateButtons](v4);
}

- (void)_updateCount:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id obj;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD __b[8];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22[2];
  objc_super v23;
  id location[2];
  UIStepperAccessibility *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23.receiver = v25;
  v23.super_class = (Class)UIStepperAccessibility;
  -[UIStepperAccessibility _updateCount:](&v23, sel__updateCount_, location[0]);
  -[UIStepperAccessibility safeDoubleForKey:](v25, "safeDoubleForKey:", CFSTR("_value"));
  v22[1] = v3;
  v22[0] = 0;
  if ((-[UIStepperAccessibility _axIsAccessibilityNumericalPicker](v25) & 1) != 0)
  {
    v21 = (id)-[UIStepperAccessibility _accessibilityFindAncestor:startWithSelf:](v25, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_249, 1);
    v20 = (id)objc_msgSend(v21, "safeValueForKey:", CFSTR("contentView"));
    v19 = (id)objc_msgSend(v20, "subviews");
    memset(__b, 0, sizeof(__b));
    obj = v19;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
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
        v18 = *(id *)(__b[1] + 8 * v10);
        NSClassFromString(CFSTR("UILabel"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = (id)objc_msgSend(v18, "text");
          v5 = v22[0];
          v22[0] = v4;

        }
        ++v10;
        if (v8 + 1 >= v11)
        {
          v10 = 0;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
          if (!v11)
            break;
        }
      }
    }

    v7 = (id)AXFormatFloat();
    v6 = v22[0];
    v16 = (id)__UIAXStringForVariables();

    v15 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v16, v6, CFSTR("__AXStringForVariablesSentinel"));
    objc_msgSend(v15, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
    v14 = v15;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(v22, 0);
  objc_storeStrong(location, 0);
}

uint64_t __39__UIStepperAccessibility__updateCount___block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("AXUISettingsEditableTableCellWithStepper"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

void __39__UIStepperAccessibility__updateCount___block_invoke_2(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (id)_accessibilityKeyCommands
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v11 = -[UIStepperAccessibility _accessibilityViewIsMacIdiom](self, "_accessibilityViewIsMacIdiom") & 1;
  v10 = -[UIStepperAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL") & 1;
  if ((v11 & 1) != 0)
  {
    v9 = *MEMORY[0x24BDF79B0];
  }
  else
  {
    if ((v10 & 1) != 0)
      v8 = *MEMORY[0x24BDF79A0];
    else
      v8 = *MEMORY[0x24BDF79A8];
    v9 = v8;
  }
  v7 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v9, 0, sel__accessibilityKeyCommandActionPlus);
  v13[0] = v7;
  if ((v11 & 1) != 0)
  {
    v6 = *MEMORY[0x24BDF7990];
  }
  else
  {
    if ((v10 & 1) != 0)
      v5 = *MEMORY[0x24BDF79A8];
    else
      v5 = *MEMORY[0x24BDF79A0];
    v6 = v5;
  }
  v3 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v6, 0, sel__accessibilityKeyCommandActionMinus);
  v13[1] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);

  return v4;
}

- (BOOL)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (id)_accessibilityPlusButton
{
  id v2;
  char v3;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v10;

  if (!a1)
    return 0;
  v7 = 0;
  v5 = 0;
  v3 = 0;
  if ((objc_msgSend(a1, "_accessibilityViewIsMacIdiom") & 1) != 0)
  {
    v8 = -[UIStepperAccessibility _axMacIdiomIncrementElement](a1);
    v7 = 1;
    v2 = v8;
  }
  else
  {
    v6 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("visualElement"));
    v5 = 1;
    v4 = (id)objc_msgSend(v6, "safeUIViewForKey:", CFSTR("_plusButton"));
    v3 = 1;
    v2 = v4;
  }
  v10 = v2;
  if ((v3 & 1) != 0)

  if ((v5 & 1) != 0)
  if ((v7 & 1) != 0)

  return v10;
}

- (id)_accessibilityMinusButton
{
  id v2;
  char v3;
  id v4;
  char v5;
  id v6;
  char v7;
  id v8;
  void *v10;

  if (!a1)
    return 0;
  v7 = 0;
  v5 = 0;
  v3 = 0;
  if ((objc_msgSend(a1, "_accessibilityViewIsMacIdiom") & 1) != 0)
  {
    v8 = -[UIStepperAccessibility _axMacIdiomIncrementElement](a1);
    v7 = 1;
    v2 = v8;
  }
  else
  {
    v6 = (id)objc_msgSend(a1, "safeValueForKey:", CFSTR("visualElement"));
    v5 = 1;
    v4 = (id)objc_msgSend(v6, "safeUIViewForKey:", CFSTR("_minusButton"));
    v3 = 1;
    v2 = v4;
  }
  v10 = v2;
  if ((v3 & 1) != 0)

  if ((v5 & 1) != 0)
  if ((v7 & 1) != 0)

  return v10;
}

- (void)_accessibilityKeyCommandActionPlus
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __60__UIStepperAccessibility__accessibilityKeyCommandActionPlus__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

void __60__UIStepperAccessibility__accessibilityKeyCommandActionPlus__block_invoke(uint64_t a1)
{
  id v1;

  v1 = -[UIStepperAccessibility _accessibilityPlusButton](*(void **)(a1 + 32));
  objc_msgSend(v1, "_keyboardActivate");

}

- (void)_accessibilityKeyCommandActionMinus
{
  uint64_t v2;
  int v3;
  int v4;
  void (*v5)(uint64_t);
  void *v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __61__UIStepperAccessibility__accessibilityKeyCommandActionMinus__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  objc_storeStrong(v7, 0);
}

void __61__UIStepperAccessibility__accessibilityKeyCommandActionMinus__block_invoke(uint64_t a1)
{
  id v1;

  v1 = -[UIStepperAccessibility _accessibilityMinusButton](*(void **)(a1 + 32));
  objc_msgSend(v1, "_keyboardActivate");

}

- (BOOL)canBecomeFocused
{
  return 1;
}

@end
