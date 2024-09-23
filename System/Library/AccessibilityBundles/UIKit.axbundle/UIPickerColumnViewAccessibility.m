@implementation UIPickerColumnViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIPickerColumnView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIPickerTableView"), CFSTR("UITableView"));
  v3 = CFSTR("UIPickerColumnView");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIPickerColumnView"), CFSTR("_middleTable"), "UIPickerTableView");
  v5 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPickerColumnView"), CFSTR("selectionBarRow"), 0);
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_scrollRowAtIndexPathToSelectionBar:animated:"), "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_tableFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPickerView"), CFSTR("columnForTableView:"), v5, v4, 0);
  objc_storeStrong(v7, v6);
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8[2];
  uint64_t v9;
  uint64_t *v10;
  int v11;
  int v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  id v17[2];
  UIPickerColumnViewAccessibility *v18;

  v18 = self;
  v17[1] = (id)a2;
  v16 = 0;
  objc_opt_class();
  v5 = (id)-[UIPickerColumnViewAccessibility safeValueForKey:](v18, "safeValueForKey:", CFSTR("_pickerView"));
  v15 = (id)__UIAccessibilityCastAsClass();

  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17[0] = v14;
  v4 = (id)objc_msgSend(v14, "accessibilityElements");
  v9 = 0;
  v10 = &v9;
  v11 = 0x20000000;
  v12 = 32;
  v13 = 0;
  v8[1] = &v9;
  v7 = v17[0];
  v8[0] = v18;
  AXPerformSafeBlock();
  v6 = v10[3];
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
  _Block_object_dispose(&v9, 8);
  v3 = (id)objc_msgSend(v4, "axSafeObjectAtIndex:", v6);

  objc_storeStrong(v17, 0);
  return v3;
}

void __76__UIPickerColumnViewAccessibility__accessibilityNativeFocusPreferredElement__block_invoke(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("_middleTable"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v1, "columnForTableView:");

}

- (id)_accessibilityKeyCommands
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
  char v12;
  SEL v13;
  UIPickerColumnViewAccessibility *v14;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14 = self;
  v13 = a2;
  v12 = -[UIPickerColumnViewAccessibility _accessibilityIsRTL](self, "_accessibilityIsRTL") & 1;
  if (v12)
    v2 = (id)*MEMORY[0x24BDF79A8];
  else
    v2 = (id)*MEMORY[0x24BDF79A0];
  v11 = v2;
  if ((v12 & 1) != 0)
    v3 = (id)*MEMORY[0x24BDF79A0];
  else
    v3 = (id)*MEMORY[0x24BDF79A8];
  v10 = v3;
  v9 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79B0]);
  v15[0] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7990], 0, sel__fkaScrollToNextRow);
  v15[1] = v8;
  v7 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v11, 0, sel__fkaMoveToPreviousColumn);
  v15[2] = v7;
  v5 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", v10, 0, sel__fkaMoveToNextColumn);
  v15[3] = v5;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 4);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  return v6;
}

- (void)_fkaScrollToPreviousRow
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  UIPickerColumnViewAccessibility *v9;
  id v10[2];
  uint64_t v11;
  int v12;
  id v13[2];
  UIPickerColumnViewAccessibility *v14;

  v14 = self;
  v13[1] = (id)a2;
  v3 = (void *)MEMORY[0x24BDD15D8];
  v12 = 0;
  v11 = -[UIPickerColumnViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectionBarRow")) - 1;
  if (v11 <= 0)
    v2 = v12;
  else
    v2 = v11;
  v10[1] = (id)v2;
  v13[0] = (id)objc_msgSend(v3, "indexPathForRow:inSection:", v2, 0);
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __58__UIPickerColumnViewAccessibility__fkaScrollToPreviousRow__block_invoke;
  v8 = &unk_24FF3E050;
  v9 = v14;
  v10[0] = v13[0];
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB0], 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(v13, 0);
}

uint64_t __58__UIPickerColumnViewAccessibility__fkaScrollToPreviousRow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollRowAtIndexPathToSelectionBar:animated:", *(_QWORD *)(a1 + 40), 1, a1, a1);
}

- (void)_fkaScrollToNextRow
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  UIPickerColumnViewAccessibility *v7;
  id v8;
  id v9[2];
  UIPickerColumnViewAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", -[UIPickerColumnViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("selectionBarRow"))+ 1, 0);
  v2 = MEMORY[0x24BDAC760];
  v3 = -1073741824;
  v4 = 0;
  v5 = __54__UIPickerColumnViewAccessibility__fkaScrollToNextRow__block_invoke;
  v6 = &unk_24FF3E050;
  v7 = v10;
  v8 = v9[0];
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB0], 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(v9, 0);
}

uint64_t __54__UIPickerColumnViewAccessibility__fkaScrollToNextRow__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollRowAtIndexPathToSelectionBar:animated:", *(_QWORD *)(a1 + 40), 1, a1, a1);
}

- (void)_fkaMoveToPreviousColumn
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
  v5 = __59__UIPickerColumnViewAccessibility__fkaMoveToPreviousColumn__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB0], 0);
  objc_storeStrong(v7, 0);
}

void __59__UIPickerColumnViewAccessibility__fkaMoveToPreviousColumn__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  objc_msgSend(v1, "_accessibilityMoveFocusWithHeading:", 32);

}

- (void)_fkaMoveToNextColumn
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
  v5 = __55__UIPickerColumnViewAccessibility__fkaMoveToNextColumn__block_invoke;
  v6 = &unk_24FF3DA40;
  v7[0] = self;
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB0], 0);
  objc_storeStrong(v7, 0);
}

void __55__UIPickerColumnViewAccessibility__fkaMoveToNextColumn__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  objc_msgSend(v1, "_accessibilityMoveFocusWithHeading:", 16);

}

- (id)_viewToAddFocusLayer
{
  return (id)-[UIPickerColumnViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

- (id)accessibilityPath
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;
  CGRect r2;
  CGRect r1;
  CGRect v19;

  -[UIPickerColumnViewAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("frame"));
  r1.origin.x = v2;
  r1.origin.y = v3;
  r1.size.width = v4;
  r1.size.height = v5;
  -[UIPickerColumnViewAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("_tableFrame"));
  r2.origin.x = v6;
  r2.origin.y = v7;
  r2.size.width = v8;
  r2.size.height = v9;
  v19 = CGRectIntersection(r1, r2);
  v15 = (void *)MEMORY[0x24BDF6870];
  -[UIPickerColumnViewAccessibility convertRect:toView:](self, "convertRect:toView:", 0, v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  return (id)objc_msgSend(v15, "bezierPathWithRoundedRect:cornerRadius:", v10, v11, v12, v13, 5.0);
}

@end
