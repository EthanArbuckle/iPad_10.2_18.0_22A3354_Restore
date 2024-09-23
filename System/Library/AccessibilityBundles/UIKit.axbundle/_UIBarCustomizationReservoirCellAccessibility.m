@implementation _UIBarCustomizationReservoirCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIBarCustomizationReservoirCell");
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
  objc_storeStrong(location, 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)UIAXStringForAllChildren();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB110];
}

- (id)_accessibilityAllDragSourceDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat MidX;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  id v16;
  __int128 v17;
  CGRect v18;
  SEL v19;
  _UIBarCustomizationReservoirCellAccessibility *v20;
  _QWORD v21[2];
  CGRect v22;

  v21[1] = *MEMORY[0x24BDAC8D0];
  v20 = self;
  v19 = a2;
  -[_UIBarCustomizationReservoirCellAccessibility bounds](self, "bounds");
  v18 = v22;
  MidX = CGRectGetMidX(v22);
  CGRectGetMidY(v18);
  CGPointMake();
  *(_QWORD *)&v17 = v2;
  *((_QWORD *)&v17 + 1) = v3;
  v16 = (id)-[_UIBarCustomizationReservoirCellAccessibility _accessibilityFindViewAncestor:startWithSelf:](v20, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_5, 1);
  -[_UIBarCustomizationReservoirCellAccessibility convertPoint:toView:](v20, "convertPoint:toView:", v16, v17);
  *(_QWORD *)&v15 = v4;
  *((_QWORD *)&v15 + 1) = v5;
  v17 = v15;
  v9 = objc_alloc(MEMORY[0x24BDF67B0]);
  v8 = (void *)MEMORY[0x24BDD17C8];
  v12 = (id)UIKitAccessibilityLocalizedString();
  v11 = -[_UIBarCustomizationReservoirCellAccessibility accessibilityLabel](v20, "accessibilityLabel");
  v10 = (id)objc_msgSend(v8, "localizedStringWithFormat:", v12, v11, *(_QWORD *)&MidX);
  v14 = objc_msgSend(v9, "initWithName:point:inView:", v17);

  v21[0] = v14;
  v13 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v16, 0);
  return v13;
}

- (id)_accessibilityAllDropPointDescriptors
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  CGRect v13;
  id v14[2];
  _UIBarCustomizationReservoirCellAccessibility *v15;
  _QWORD v16[2];
  CGRect v17;

  v16[1] = *MEMORY[0x24BDAC8D0];
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = (id)-[_UIBarCustomizationReservoirCellAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_188, 1);
  -[_UIBarCustomizationReservoirCellAccessibility bounds](v15, "bounds");
  v13 = v17;
  CGRectGetMidX(v17);
  CGRectGetMidY(v13);
  CGPointMake();
  -[_UIBarCustomizationReservoirCellAccessibility convertPoint:toView:](v15, "convertPoint:toView:", v14[0], v2, v3);
  *(_QWORD *)&v11 = v4;
  *((_QWORD *)&v11 + 1) = v5;
  v12 = v11;
  v7 = objc_alloc(MEMORY[0x24BDF67B0]);
  v8 = (id)UIKitAccessibilityLocalizedString();
  v10 = objc_msgSend(v7, "initWithName:point:inView:", v11);

  v16[0] = v10;
  v9 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(v14, 0);
  return v9;
}

@end
