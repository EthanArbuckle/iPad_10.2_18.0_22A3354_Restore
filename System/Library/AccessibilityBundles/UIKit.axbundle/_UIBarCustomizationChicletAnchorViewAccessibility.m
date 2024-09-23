@implementation _UIBarCustomizationChicletAnchorViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBarCustomizationChicletAnchorView");
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
  objc_msgSend(location[0], "validateClass:", CFSTR("_UIBarCustomizationContainerView"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIBarCustomizationChicletAnchorView"), CFSTR("chiclet"));
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIBarCustomizationChiclet"), CFSTR("representedItem"), "@");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIBarCustomizationItem"), CFSTR("identifier"), "@");
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB110];
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id v5;

  v4 = -[_UIBarCustomizationChicletAnchorViewAccessibility axBarCustomizationRepresentedItem](self, "axBarCustomizationRepresentedItem");
  v3 = (id)objc_msgSend(v4, "safeStringForKey:", CFSTR("name"));
  v5 = (id)UIKitAccessibilityLocalizedString();

  return v5;
}

- (id)accessibilityIdentifier
{
  id v3;
  id v4;

  v3 = -[_UIBarCustomizationChicletAnchorViewAccessibility axBarCustomizationRepresentedItem](self, "axBarCustomizationRepresentedItem");
  v4 = (id)objc_msgSend(v3, "safeStringForKey:", CFSTR("identifier"));

  return v4;
}

- (id)_accessibilityAllDragSourceDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  id v15;
  __int128 v16;
  CGRect v17;
  int v18;
  id v19[2];
  _UIBarCustomizationChicletAnchorViewAccessibility *v20;
  id v21;
  _QWORD v22[2];
  CGRect v23;

  v22[1] = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19[1] = (id)a2;
  v12 = -[_UIBarCustomizationChicletAnchorViewAccessibility axBarCustomizationChiclet](self, "axBarCustomizationChiclet");
  v19[0] = (id)objc_msgSend(v12, "accessibilityUserDefinedDragSourceDescriptors");

  if (v19[0])
  {
    v21 = v19[0];
    v18 = 1;
  }
  else
  {
    -[_UIBarCustomizationChicletAnchorViewAccessibility bounds](v20, "bounds");
    v17 = v23;
    CGRectGetMidX(v23);
    CGRectGetMidY(v17);
    CGPointMake_10();
    *(_QWORD *)&v16 = v2;
    *((_QWORD *)&v16 + 1) = v3;
    v15 = (id)-[_UIBarCustomizationChicletAnchorViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](v20, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_46, 1);
    -[_UIBarCustomizationChicletAnchorViewAccessibility convertPoint:toView:](v20, "convertPoint:toView:", v15, v16);
    *(_QWORD *)&v14 = v4;
    *((_QWORD *)&v14 + 1) = v5;
    v16 = v14;
    v8 = objc_alloc(MEMORY[0x24BDF67B0]);
    v7 = (void *)MEMORY[0x24BDD17C8];
    v11 = (id)UIKitAccessibilityLocalizedString();
    v10 = -[_UIBarCustomizationChicletAnchorViewAccessibility accessibilityLabel](v20, "accessibilityLabel");
    v9 = (id)objc_msgSend(v7, "localizedStringWithFormat:", v11, v10);
    v13 = objc_msgSend(v8, "initWithName:point:inView:", v16);

    v22[0] = v13;
    v21 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
    v18 = 1;
    objc_storeStrong((id *)&v13, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(v19, 0);
  return v21;
}

- (id)_accessibilityAllDropPointDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;
  int v30;
  id v31[2];
  _UIBarCustomizationChicletAnchorViewAccessibility *v32;
  id v33;
  _QWORD v34[3];
  CGRect v35;

  v34[2] = *MEMORY[0x24BDAC8D0];
  v32 = self;
  v31[1] = (id)a2;
  v21 = -[_UIBarCustomizationChicletAnchorViewAccessibility axBarCustomizationChiclet](self, "axBarCustomizationChiclet");
  v31[0] = (id)objc_msgSend(v21, "accessibilityUserDefinedDropPointDescriptors");

  if (v31[0])
  {
    v33 = v31[0];
    v30 = 1;
  }
  else
  {
    -[_UIBarCustomizationChicletAnchorViewAccessibility bounds](v32, "bounds");
    v29 = v35;
    CGRectGetMaxX(v35);
    CGRectGetMidY(v29);
    CGPointMake_10();
    *(_QWORD *)&v28 = v2;
    *((_QWORD *)&v28 + 1) = v3;
    CGRectGetMinX(v29);
    CGRectGetMidY(v29);
    CGPointMake_10();
    *(_QWORD *)&v27 = v4;
    *((_QWORD *)&v27 + 1) = v5;
    v26 = (id)-[_UIBarCustomizationChicletAnchorViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](v32, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_201_0, 1);
    -[_UIBarCustomizationChicletAnchorViewAccessibility convertPoint:toView:](v32, "convertPoint:toView:", v26, v28);
    *(_QWORD *)&v25 = v6;
    *((_QWORD *)&v25 + 1) = v7;
    v28 = v25;
    v12 = objc_alloc(MEMORY[0x24BDF67B0]);
    v11 = (void *)MEMORY[0x24BDD17C8];
    v15 = (id)UIKitAccessibilityLocalizedString();
    v14 = -[_UIBarCustomizationChicletAnchorViewAccessibility accessibilityLabel](v32, "accessibilityLabel");
    v13 = (id)objc_msgSend(v11, "localizedStringWithFormat:", v15, v14);
    v24 = objc_msgSend(v12, "initWithName:point:inView:", v28);

    -[_UIBarCustomizationChicletAnchorViewAccessibility convertPoint:toView:](v32, "convertPoint:toView:", v26, v27);
    *(_QWORD *)&v23 = v8;
    *((_QWORD *)&v23 + 1) = v9;
    v27 = v23;
    v17 = objc_alloc(MEMORY[0x24BDF67B0]);
    v16 = (void *)MEMORY[0x24BDD17C8];
    v20 = (id)UIKitAccessibilityLocalizedString();
    v19 = -[_UIBarCustomizationChicletAnchorViewAccessibility accessibilityLabel](v32, "accessibilityLabel");
    v18 = (id)objc_msgSend(v16, "localizedStringWithFormat:", v20, v19);
    v22 = objc_msgSend(v17, "initWithName:point:inView:", v27);

    v34[0] = v24;
    v34[1] = v22;
    v33 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
    v30 = 1;
    objc_storeStrong((id *)&v22, 0);
    objc_storeStrong((id *)&v24, 0);
    objc_storeStrong(&v26, 0);
  }
  objc_storeStrong(v31, 0);
  return v33;
}

- (id)axBarCustomizationChiclet
{
  return (id)-[_UIBarCustomizationChicletAnchorViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("chiclet"), a2, self);
}

- (id)axBarCustomizationRepresentedItem
{
  id v3;
  id v4;

  v3 = -[_UIBarCustomizationChicletAnchorViewAccessibility axBarCustomizationChiclet](self, "axBarCustomizationChiclet");
  v4 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("representedItem"));

  return v4;
}

@end
