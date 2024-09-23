@implementation UIInputSwitcherTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSwitcherTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputSwitcherItem"), CFSTR("identifier"), 0);
  v4 = CFSTR("UIInputSwitcherView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("m_inputSwitcherItems"), "NSArray");
  objc_storeStrong(v6, obj);
}

- (id)accessibilityLabel
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  uint64_t v23;
  int v24;
  int v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29[2];
  uint64_t v30;
  uint64_t *v31;
  int v32;
  int v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  id v37;
  id v38;
  id v39;
  char v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45[2];
  UIInputSwitcherTableCellAccessibility *v46;

  v46 = self;
  v45[1] = (id)a2;
  v13 = (id)-[UIInputSwitcherTableCellAccessibility textLabel](self, "textLabel");
  v12 = (id)objc_msgSend(v13, "accessibilityLabel");
  v11 = (id)-[UIInputSwitcherTableCellAccessibility detailTextLabel](v46, "detailTextLabel");
  v8 = (id)objc_msgSend(v11, "accessibilityLabel");
  v45[0] = (id)__UIAXStringForVariables();

  v44 = 0;
  v43 = (id)-[UIInputSwitcherTableCellAccessibility _accessibilityAncestorIsKindOf:](v46, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIInputSwitcherView")), v8, CFSTR("__AXStringForVariablesSentinel"));
  v42 = (id)-[UIInputSwitcherTableCellAccessibility _accessibilityAncestorIsKindOf:](v46, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v14 = v42;
  v40 = 0;
  objc_opt_class();
  v39 = (id)__UIAccessibilityCastAsClass();
  v38 = v39;
  objc_storeStrong(&v39, 0);
  v41 = (id)objc_msgSend(v14, "indexPathForCell:");

  if (v41)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 838860800;
    v33 = 48;
    v34 = __Block_byref_object_copy__11;
    v35 = __Block_byref_object_dispose__11;
    v36 = 0;
    v23 = MEMORY[0x24BDAC760];
    v24 = -1073741824;
    v25 = 0;
    v26 = __59__UIInputSwitcherTableCellAccessibility_accessibilityLabel__block_invoke;
    v27 = &unk_24FF3DAB0;
    v29[1] = &v30;
    v28 = v43;
    v29[0] = v41;
    AXPerformSafeBlock();
    v22 = (id)v31[5];
    objc_storeStrong(v29, 0);
    objc_storeStrong(&v28, 0);
    _Block_object_dispose(&v30, 8);
    objc_storeStrong(&v36, 0);
    v37 = v22;
    v20 = 0;
    objc_opt_class();
    v10 = (id)objc_msgSend(v43, "safeValueForKey:", CFSTR("inputModes"));
    v19 = (id)__UIAccessibilityCastAsClass();

    v18 = v19;
    objc_storeStrong(&v19, 0);
    v21 = v18;
    v17 = (id)objc_msgSend(v37, "safeValueForKey:", CFSTR("identifier"));
    if ((objc_msgSend(v21, "containsObject:", v17) & 1) != 0)
      v2 = v17;
    else
      v2 = 0;
    v16 = v2;
    if (v2)
    {
      v3 = (id)MEMORY[0x2348C3740](v16);
      v4 = v44;
      v44 = v3;

      v5 = (id)MEMORY[0x2348C3680](v44);
      v6 = v44;
      v44 = v5;

    }
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v37, 0);
  }
  if (v44)
  {
    v15 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v45[0]);
    objc_msgSend(v15, "setAttribute:forKey:", v44, *MEMORY[0x24BDFEB98]);
    objc_storeStrong(v45, v15);
    objc_storeStrong(&v15, 0);
  }
  v9 = v45[0];
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(v45, 0);
  return v9;
}

void __59__UIInputSwitcherTableCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v8 = 0;
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("m_inputSwitcherItems"));
  v7 = (id)__UIAccessibilitySafeClass();

  v6 = v7;
  objc_storeStrong(&v7, 0);
  v1 = (id)objc_msgSend(v6, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v8[0] = (id)objc_msgSend(v5, "accessoryView");

  v4 = (id)objc_msgSend(v8[0], "accessibilityValue");
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v8, 0);
  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  __int128 v8;
  id v9;
  id v10;
  char v11;
  id v12;
  objc_super v13;
  SEL v14;
  UIInputSwitcherTableCellAccessibility *v15;
  __int128 v16;
  CGPoint result;

  v15 = self;
  v14 = a2;
  v16 = 0uLL;
  v13.receiver = self;
  v13.super_class = (Class)UIInputSwitcherTableCellAccessibility;
  -[UIInputSwitcherTableCellAccessibility accessibilityActivationPoint](&v13, sel_accessibilityActivationPoint);
  *(_QWORD *)&v16 = v2;
  *((_QWORD *)&v16 + 1) = v3;
  v11 = 0;
  objc_opt_class();
  v10 = (id)__UIAccessibilityCastAsClass();
  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12 = (id)objc_msgSend(v9, "accessoryView");

  if (v12)
  {
    objc_msgSend(v12, "accessibilityActivationPoint");
    *(_QWORD *)&v8 = v4;
    *((_QWORD *)&v8 + 1) = v5;
    v16 = v8;
  }
  objc_storeStrong(&v12, 0);
  v7 = *((double *)&v16 + 1);
  v6 = *(double *)&v16;
  result.y = v7;
  result.x = v6;
  return result;
}

@end
