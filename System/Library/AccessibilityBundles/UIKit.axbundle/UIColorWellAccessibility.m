@implementation UIColorWellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIColorWell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIColorWell"), CFSTR("_style"), "_UIColorWellVisualStyle");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("_UIColorWelliOSVisualStyle"), CFSTR("_button"), "UIButton");
  objc_storeStrong(location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  id (*v12)(id *);
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  id (*v18)(id *);
  void *v19;
  id v20;
  uint64_t v21;
  int v22;
  int v23;
  id (*v24)(id *);
  void *v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  id (*v30)(id *);
  void *v31;
  id v32[3];
  uint64_t v33;
  int v34;
  int v35;
  id (*v36)(id *);
  void *v37;
  id v38;
  id location;
  void **v40;
  objc_super v41;
  SEL v42;
  UIColorWellAccessibility *v43;

  v43 = self;
  v42 = a2;
  v41.receiver = self;
  v41.super_class = (Class)UIColorWellAccessibility;
  -[UIColorWellAccessibility _accessibilityLoadAccessibilityInformation](&v41, sel__accessibilityLoadAccessibilityInformation);
  v7 = -[UIColorWellAccessibility _accessibilityColorWellStyle](v43, "_accessibilityColorWellStyle");
  v8 = objc_msgSend(v7, "safeIvarForKey:", CFSTR("_button"));

  v40 = (void **)v8;
  if (v8)
  {
    objc_initWeak(&location, v43);
    v6 = *v40;
    v33 = MEMORY[0x24BDAC760];
    v34 = -1073741824;
    v35 = 0;
    v36 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v37 = &unk_24FF3DC00;
    objc_copyWeak(&v38, &location);
    objc_msgSend(v6, "_setAccessibilityLabelBlock:", &v33);
    v5 = *v40;
    v27 = MEMORY[0x24BDAC760];
    v28 = -1073741824;
    v29 = 0;
    v30 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v31 = &unk_24FF3DC00;
    objc_copyWeak(v32, &location);
    objc_msgSend(v5, "_setAccessibilityHintBlock:", &v27);
    v4 = *v40;
    v21 = MEMORY[0x24BDAC760];
    v22 = -1073741824;
    v23 = 0;
    v24 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
    v25 = &unk_24FF3DC00;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v4, "_setAccessibilityValueBlock:", &v21);
    v3 = *v40;
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
    v19 = &unk_24FF3DC00;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v3, "_setAccessibilityIdentifierBlock:", &v15);
    v2 = *v40;
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
    v13 = &unk_24FF401D8;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v2, "_setAccessibilityCustomContentBlock:", &v9);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v26);
    objc_destroyWeak(v32);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityLabel");
  objc_storeStrong(v3, 0);
  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityHint");
  objc_storeStrong(v3, 0);
  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(id *a1)
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

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityIdentifier");
  objc_storeStrong(v3, 0);
  return v2;
}

id __70__UIColorWellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(id *a1)
{
  id v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  v2 = (id)objc_msgSend(v3[0], "accessibilityCustomContent");
  objc_storeStrong(v3, 0);
  return v2;
}

- (unint64_t)_accessibilityAutomationType
{
  return 67;
}

- (id)_accessibilityColorWellStyle
{
  id *v3;

  v3 = (id *)-[UIColorWellAccessibility safeIvarForKey:](self, "safeIvarForKey:", CFSTR("_style"), 0, a2, self);
  if (v3)
    return *v3;
  else
    return 0;
}

- (id)accessibilityValue
{
  id v3;
  objc_super v4;
  id location[2];
  UIColorWellAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UIColorWellAccessibility;
  location[0] = -[UIColorWellAccessibility accessibilityValue](&v4, sel_accessibilityValue);
  if (objc_msgSend(location[0], "length"))
  {
    v7 = location[0];
  }
  else
  {
    v3 = (id)-[UIColorWellAccessibility selectedColor](v6, "selectedColor");
    v7 = (id)objc_msgSend(v3, "_accessibilityColorDescription");

  }
  objc_storeStrong(location, 0);
  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  objc_super v11;
  int v12;
  __int128 v13;
  CGRect rect;
  id location[2];
  UIColorWellAccessibility *v16;
  __int128 v17;
  CGPoint result;
  CGRect v19;

  v16 = self;
  location[1] = (id)a2;
  v10 = -[UIColorWellAccessibility _accessibilityColorWellStyle](self, "_accessibilityColorWellStyle");
  location[0] = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("_button"));

  if (location[0])
  {
    objc_msgSend(location[0], "accessibilityActivationPoint");
    *(_QWORD *)&v17 = v2;
    *((_QWORD *)&v17 + 1) = v3;
    if ((CGFloatIsValid() & 1) == 0 || (CGFloatIsValid() & 1) == 0)
    {
      objc_msgSend(location[0], "accessibilityFrame");
      rect = v19;
      CGRectGetMidX(v19);
      CGRectGetMidY(rect);
      CGPointMake_12();
      *(_QWORD *)&v13 = v4;
      *((_QWORD *)&v13 + 1) = v5;
      v17 = v13;
    }
    v12 = 1;
  }
  else
  {
    v11.receiver = v16;
    v11.super_class = (Class)UIColorWellAccessibility;
    -[UIColorWellAccessibility accessibilityActivationPoint](&v11, sel_accessibilityActivationPoint);
    *(_QWORD *)&v17 = v6;
    *((_QWORD *)&v17 + 1) = v7;
    v12 = 1;
  }
  objc_storeStrong(location, 0);
  v9 = *((double *)&v17 + 1);
  v8 = *(double *)&v17;
  result.y = v9;
  result.x = v8;
  return result;
}

@end
