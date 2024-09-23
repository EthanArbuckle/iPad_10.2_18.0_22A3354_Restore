@implementation _UIStatusBarBackgroundActivityItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarBackgroundActivityItem");
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
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = CFSTR("_UIStatusBarItemUpdate");
  objc_msgSend(location[0], "validateClass:");
  v7 = CFSTR("_UIStatusBarBackgroundActivityItem");
  v3 = CFSTR("_UIStatusBarIndicatorItem");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarBackgroundActivityItem"), CFSTR("backgroundView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("iconView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("imageView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("data"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarData"), CFSTR("backgroundActivityEntry"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDataBackgroundActivityEntry"), CFSTR("type"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("applyUpdate:toDisplayItem:"), v5, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("createDisplayItemForIdentifier:"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarItem"), CFSTR("setNeedsUpdate"), "v", 0);
  v6 = CFSTR("_UIStatusBarPillBackgroundActivityItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v6, v7);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UIStatusBarFullBackgroundActivityItem"), v7);
  objc_storeStrong(v9, v8);
}

- (id)_axBackgroundActivityLabelByType:(uint64_t)a1
{
  id location;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;

  v6 = a1;
  v5 = a2;
  if (a1)
  {
    v4 = 0;
    location = 0;
    if (v5 <= 0x25)
      __asm { BR              X8 }
    v7 = accessibilityLocalizedString(location);
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v4, 0);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_axApplyLabelToBackground
{
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  id (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id location;
  id v21;
  id v22[2];
  id v23;
  id v24;

  v24 = a1;
  if (a1)
  {
    v23 = (id)objc_msgSend(v24, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
    NSClassFromString(CFSTR("_UIStatusBarItemUpdate"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = (id)objc_msgSend(v23, "safeValueForKeyPath:", CFSTR("data.backgroundActivityEntry"));
      v5 = (void *)objc_msgSend(v4, "safeIntegerForKey:", CFSTR("type"));

      v22[1] = v5;
      v22[0] = -[_UIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByType:]((uint64_t)v24, (unint64_t)v5);
      NSClassFromString(CFSTR("_UIStatusBarPillBackgroundActivityItem"));
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (NSClassFromString(CFSTR("_UIStatusBarFullBackgroundActivityItem")), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v21 = (id)objc_msgSend(v24, "safeUIViewForKey:", CFSTR("backgroundView"));
        objc_initWeak(&location, v21);
        v3 = v21;
        v13 = MEMORY[0x24BDAC760];
        v14 = -1073741824;
        v15 = 0;
        v16 = __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke;
        v17 = &unk_24FF40190;
        v18 = v22[0];
        objc_copyWeak(&v19, &location);
        objc_msgSend(v3, "_setAccessibilityLabelBlock:", &v13);
        v2 = (id)objc_msgSend(v24, "safeUIViewForKey:", CFSTR("combinedView"));
        v6 = MEMORY[0x24BDAC760];
        v7 = -1073741824;
        v8 = 0;
        v9 = __76___UIStatusBarBackgroundActivityItemAccessibility__axApplyLabelToBackground__block_invoke_2;
        v10 = &unk_24FF40190;
        v11 = v22[0];
        objc_copyWeak(&v12, &location);
        objc_msgSend(v2, "_setAccessibilityLabelBlock:", &v6);

        objc_destroyWeak(&v12);
        objc_storeStrong(&v11, 0);
        objc_destroyWeak(&v19);
        objc_storeStrong(&v18, 0);
        objc_destroyWeak(&location);
        objc_storeStrong(&v21, 0);
      }
      else
      {
        v1 = (id)objc_msgSend(v24, "safeUIViewForKey:", CFSTR("backgroundView"));
        objc_msgSend(v1, "setAccessibilityLabel:", v22[0]);

      }
      objc_storeStrong(v22, 0);
    }
    objc_storeStrong(&v23, 0);
  }
}

- (uint64_t)_accessibilityHasRequestedForceUpdate
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)_accessibilitySetHasRequestedForceUpdate:(uint64_t)result
{
  if (result)
    return __UIAccessibilitySetAssociatedBool();
  return result;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  NSObject *queue;
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  _UIStatusBarBackgroundActivityItemAccessibility *v9;
  id v10;
  objc_super v11;
  SEL v12;
  _UIStatusBarBackgroundActivityItemAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)_UIStatusBarBackgroundActivityItemAccessibility;
  -[_UIStatusBarBackgroundActivityItemAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  v10 = (id)-[_UIStatusBarBackgroundActivityItemAccessibility _accessibilityValueForKey:](v13, "_accessibilityValueForKey:", CFSTR("AccessibilityStatusBarUpdateData"));
  if (!v10
    && (-[_UIStatusBarBackgroundActivityItemAccessibility _accessibilityHasRequestedForceUpdate]((uint64_t)v13) & 1) == 0)
  {
    -[_UIStatusBarBackgroundActivityItemAccessibility _accessibilitySetHasRequestedForceUpdate:]((uint64_t)v13);
    queue = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC760];
    v5 = -1073741824;
    v6 = 0;
    v7 = __93___UIStatusBarBackgroundActivityItemAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v8 = &unk_24FF3DA40;
    v9 = v13;
    dispatch_async(queue, &v4);

    objc_storeStrong((id *)&v9, 0);
  }
  -[_UIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](v13);
  v3 = (id)-[_UIStatusBarBackgroundActivityItemAccessibility safeUIViewForKey:](v13, "safeUIViewForKey:", CFSTR("imageView"));
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);
  -[_UIStatusBarBackgroundActivityItemAccessibility _axSetupIconViewWithUpdateData:](v13, "_axSetupIconViewWithUpdateData:", v10);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v10, 0);
}

- (id)_axBackgroundView
{
  return (id)-[_UIStatusBarBackgroundActivityItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("backgroundView"), a2, self);
}

- (id)_axStatusBarModern
{
  id v3;
  id v4;

  v3 = -[_UIStatusBarBackgroundActivityItemAccessibility _axBackgroundView](self, "_axBackgroundView");
  v4 = (id)objc_msgSend(v3, "_accessibilityAncestorIsKindOf:", objc_opt_class());

  return v4;
}

- (void)_axSetupIconViewWithUpdateData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  id (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25[13];
  id v26;
  id v27;
  unint64_t v28;
  id v29;
  char v30;
  int v31;
  id location[2];
  _UIStatusBarBackgroundActivityItemAccessibility *v33;

  v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  NSClassFromString(CFSTR("_UIStatusBarFullBackgroundActivityItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = 0;
    v29 = (id)-[_UIStatusBarBackgroundActivityItemAccessibility safeUIViewForKey:](v33, "safeUIViewForKey:", CFSTR("iconView"));
    if (location[0])
    {
      v17 = (id)objc_msgSend(location[0], "safeValueForKeyPath:", CFSTR("data.backgroundActivityEntry"));
      v18 = objc_msgSend(v17, "safeIntegerForKey:", CFSTR("type"));

      v28 = v18;
      if (v18 == 6 || v28 == 7)
      {
        v27 = -[_UIStatusBarBackgroundActivityItemAccessibility _axBackgroundView](v33, "_axBackgroundView");
        v26 = -[_UIStatusBarBackgroundActivityItemAccessibility _axStatusBarModern](v33, "_axStatusBarModern");
        if (v27)
        {
          objc_msgSend(v26, "frame");
          v25[9] = v4;
          v25[10] = v5;
          v25[11] = v3;
          v25[12] = v6;
          if (*(double *)&v3 != 0.0)
          {
            objc_msgSend(v26, "frame", *(double *)&v3);
            v25[5] = v7;
            v25[6] = v8;
            v25[7] = v9;
            v25[8] = v10;
            v16 = *(double *)&v9;
            objc_msgSend(v27, "frame");
            v25[1] = v11;
            v25[2] = v12;
            v25[3] = v13;
            v25[4] = v14;
            if (v16 == *(double *)&v13)
            {
              objc_msgSend(v29, "_setIsAccessibilityElementBlock:", &__block_literal_global_59, v16);
              v25[0] = -[_UIStatusBarBackgroundActivityItemAccessibility _axBackgroundActivityLabelByType:]((uint64_t)v33, v28);
              v15 = v29;
              v19 = MEMORY[0x24BDAC760];
              v20 = -1073741824;
              v21 = 0;
              v22 = __82___UIStatusBarBackgroundActivityItemAccessibility__axSetupIconViewWithUpdateData___block_invoke_2;
              v23 = &unk_24FF3DFB0;
              v24 = v25[0];
              objc_msgSend(v15, "_setAccessibilityLabelBlock:", &v19);
              v30 = 1;
              objc_storeStrong(&v24, 0);
              objc_storeStrong(v25, 0);
            }
          }
        }
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v27, 0);
      }
    }
    if ((v30 & 1) == 0)
    {
      objc_msgSend(v29, "_setIsAccessibilityElementBlock:");
      objc_msgSend(v29, "_setAccessibilityLabelBlock:", 0);
    }
    objc_storeStrong(&v29, 0);
    v31 = 0;
  }
  else
  {
    v31 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4;
  objc_super v5;
  id v6;
  id location[2];
  _UIStatusBarBackgroundActivityItemAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v8;
  v5.super_class = (Class)_UIStatusBarBackgroundActivityItemAccessibility;
  v6 = -[_UIStatusBarBackgroundActivityItemAccessibility createDisplayItemForIdentifier:](&v5, sel_createDisplayItemForIdentifier_, location[0]);
  -[_UIStatusBarBackgroundActivityItemAccessibility _axApplyLabelToBackground](v8);
  v4 = v6;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  objc_super v7;
  id v8;
  id v9;
  id location[2];
  _UIStatusBarBackgroundActivityItemAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarBackgroundActivityItemAccessibility;
  v8 = -[_UIStatusBarBackgroundActivityItemAccessibility applyUpdate:toDisplayItem:](&v7, sel_applyUpdate_toDisplayItem_, location[0], v9);
  -[_UIStatusBarBackgroundActivityItemAccessibility _accessibilitySetRetainedValue:forKey:](v11, "_accessibilitySetRetainedValue:forKey:", location[0], CFSTR("AccessibilityStatusBarUpdateData"));
  -[_UIStatusBarBackgroundActivityItemAccessibility _accessibilityLoadAccessibilityInformation](v11, "_accessibilityLoadAccessibilityInformation");
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6;
}

@end
