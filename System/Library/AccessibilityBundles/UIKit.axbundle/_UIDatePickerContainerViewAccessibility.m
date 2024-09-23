@implementation _UIDatePickerContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIDatePickerContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerContainerView"), CFSTR("presentation"), "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIDatePickerOverlayPresentation"), CFSTR("dismissPresentationAnimated:"), "v", "B", 0);
  objc_storeStrong(v4, obj);
}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v9[0] = (id)-[_UIDatePickerContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("presentation"));
  v3 = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __69___UIDatePickerContainerViewAccessibility_accessibilityPerformEscape__block_invoke;
  v7 = &unk_24FF3DA40;
  v8 = v9[0];
  AXPerformSafeBlock();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v9, 0);
  return 1;
}

- (id)_accessibilityDismissElement
{
  return objc_getAssociatedObject(self, &___UIDatePickerContainerViewAccessibility___accessibilityDismissElement);
}

- (void)_setAccessibilityDismissElement:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedObject();
  objc_storeStrong(location, 0);
}

- (id)accessibilityElements
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  double (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  int v27;
  int v28;
  double (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  int v34;
  id v35;
  char v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id v41[2];
  _UIDatePickerContainerViewAccessibility *v42;
  id v43;

  v42 = self;
  v41[1] = (id)a2;
  v40 = 0;
  objc_opt_class();
  v39 = (id)__UIAccessibilityCastAsClass();
  v38 = v39;
  objc_storeStrong(&v39, 0);
  v10 = (id)objc_msgSend(v38, "subviews");
  v11 = (id)objc_msgSend(v10, "mutableCopy");
  v36 = 0;
  if (v11)
  {
    v2 = v11;
  }
  else
  {
    v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v36 = 1;
    v2 = v37;
  }
  v41[0] = v2;
  if ((v36 & 1) != 0)

  v35 = -[_UIDatePickerContainerViewAccessibility _accessibilityDismissElement](v42, "_accessibilityDismissElement");
  if (v35)
  {
    v43 = (id)objc_msgSend(v41[0], "arrayByAddingObject:", v35);
    v34 = 1;
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x24BDF67A0]);
    v33 = (id)objc_msgSend(v3, "initWithAccessibilityContainer:", v42);
    objc_initWeak(&v32, v42);
    v9 = v33;
    v26 = MEMORY[0x24BDAC760];
    v27 = -1073741824;
    v28 = 0;
    v29 = __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke;
    v30 = &unk_24FF3DD28;
    objc_copyWeak(&v31, &v32);
    objc_msgSend(v9, "_setAccessibilityFrameBlock:", &v26);
    if (objc_msgSend(v41[0], "count"))
    {
      v25 = -[_UIDatePickerContainerViewAccessibility _axDatePicker:](v42, "_axDatePicker:", v41[0]);
      if (v25)
      {
        v8 = v33;
        v18 = MEMORY[0x24BDAC760];
        v19 = -1073741824;
        v20 = 0;
        v21 = __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_2;
        v22 = &unk_24FF3DD50;
        v23 = v25;
        objc_copyWeak(&v24, &v32);
        objc_msgSend(v8, "_setAccessibilityActivationPointBlock:", &v18);
        objc_destroyWeak(&v24);
        objc_storeStrong(&v23, 0);
      }
      objc_storeStrong(&v25, 0);
    }
    objc_msgSend(v33, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    v7 = (id)UIKitAccessibilityLocalizedString();
    objc_msgSend(v33, "setAccessibilityLabel:");

    v6 = (id)UIKitAccessibilityLocalizedString();
    objc_msgSend(v33, "setAccessibilityHint:");

    objc_msgSend(v33, "setAccessibilityIdentifier:", CFSTR("PopoverDismissRegion"));
    objc_msgSend(v33, "_accessibilitySetAdditionalElementOrderedLast:", 1);
    v5 = v33;
    v12 = MEMORY[0x24BDAC760];
    v13 = -1073741824;
    v14 = 0;
    v15 = __64___UIDatePickerContainerViewAccessibility_accessibilityElements__block_invoke_3;
    v16 = &unk_24FF3DA88;
    objc_copyWeak(&v17, &v32);
    objc_msgSend(v5, "_setAccessibilityActivateBlock:", &v12);
    -[_UIDatePickerContainerViewAccessibility _setAccessibilityDismissElement:](v42, "_setAccessibilityDismissElement:", v33);
    v43 = (id)objc_msgSend(v41[0], "arrayByAddingObject:", v33);
    v34 = 1;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v32);
    objc_storeStrong(&v33, 0);
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(v41, 0);
  return v43;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  objc_super v5;
  int v6;
  CGRect v7;
  CGRect rect;
  id v9;
  id v10;
  id v11;
  id location[2];
  _UIDatePickerContainerViewAccessibility *v13;
  CGPoint v14;
  id v15;
  CGRect v16;
  CGRect v17;

  v14 = a3;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v11 = -[_UIDatePickerContainerViewAccessibility accessibilityElements](v13, "accessibilityElements");
  if (!objc_msgSend(v11, "count"))
    goto LABEL_8;
  v10 = -[_UIDatePickerContainerViewAccessibility _axDatePicker:](v13, "_axDatePicker:", v11);
  v9 = -[_UIDatePickerContainerViewAccessibility _accessibilityDismissElement](v13, "_accessibilityDismissElement");
  if (v10
    && (-[_UIDatePickerContainerViewAccessibility accessibilityFrame](v13, "accessibilityFrame"),
        rect = v16,
        CGRectContainsPoint(v16, v14))
    && (objc_msgSend(v10, "accessibilityFrame"), v7 = v17, !CGRectContainsPoint(v17, v14)))
  {
    v15 = v9;
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  if (!v6)
  {
LABEL_8:
    v5.receiver = v13;
    v5.super_class = (Class)_UIDatePickerContainerViewAccessibility;
    v15 = -[_UIDatePickerContainerViewAccessibility _accessibilityHitTest:withEvent:](&v5, sel__accessibilityHitTest_withEvent_, location[0], v14.x, v14.y);
    v6 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v15;
}

- (id)_axDatePicker:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];
  id v8;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = (id)objc_msgSend(location[0], "firstObject");
  v4 = (id)objc_msgSend(v6, "automationElements");
  v5 = (id)objc_msgSend(v4, "firstObject");

  NSClassFromString(CFSTR("_UIDatePickerOverlayPlatterView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v5;
  else
    v8 = 0;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v8;
}

@end
