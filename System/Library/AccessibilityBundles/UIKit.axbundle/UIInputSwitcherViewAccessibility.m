@implementation UIInputSwitcherViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIInputSwitcherView");
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
  v4 = CFSTR("UIInputSwitcherView");
  v6 = CFSTR("UIKeyboardMenuView");
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("UIInputSwitcherTableView"), CFSTR("UITableView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UIInputSwitcherView"), CFSTR("m_table"), "UIInputSwitcherTableView");
  v3 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputSwitcherView"), CFSTR("inputModes"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v4, CFSTR("m_inputSwitcherItems"), "NSArray");
  v7 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("updateSelectionWithPoint:"), "{CGPoint=dd}", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputSwitcherItem"), CFSTR("identifier"), v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_segmentControlValueDidChange:"), v7, v3, 0);
  v5 = "Q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("willFadeForSelectionAtIndex:"), v7, "Q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInputSwitcherSegmentControl"), CFSTR("selectedSegmentIndex"), "q", 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v4, v6);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("highlightRow:"), v7, v5, 0);
  objc_storeStrong(v9, v8);
}

- (id)_accessibilityLastHandednessBiasAnnouncement
{
  if (a1)
    return objc_getAssociatedObject(a1, &__UIInputSwitcherView___accessibilityLastHandednessBiasAnnouncement);
  else
    return 0;
}

- (void)_accessibilitySetLastHandednessBiasAnnouncement:(uint64_t)a1
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

- (id)accessibilityIdentifier
{
  return CFSTR("InputSwitcherView");
}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  id v5;
  id v6;
  objc_super v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12[2];
  UIInputSwitcherViewAccessibility *v13;
  CGPoint v14;

  v14 = a3;
  v13 = self;
  v12[1] = (id)a2;
  v11 = 0;
  objc_opt_class();
  v5 = (id)-[UIInputSwitcherViewAccessibility safeValueForKey:](v13, "safeValueForKey:", CFSTR("m_table"));
  v10 = (id)__UIAccessibilityCastAsClass();

  v9 = v10;
  objc_storeStrong(&v10, 0);
  v12[0] = v9;
  v8 = (id)objc_msgSend(v9, "indexPathForSelectedRow");
  v7.receiver = v13;
  v7.super_class = (Class)UIInputSwitcherViewAccessibility;
  -[UIInputSwitcherViewAccessibility updateSelectionWithPoint:](&v7, sel_updateSelectionWithPoint_, v14.x, v14.y);
  v6 = (id)objc_msgSend(v12[0], "indexPathForSelectedRow");
  if (v8 != v6 && (objc_msgSend(v8, "isEqual:", v6) & 1) == 0)
  {
    if (v6)
    {
      -[UIInputSwitcherViewAccessibility _axAnnounceSelectedLanguage:](v13, "_axAnnounceSelectedLanguage:", v6);
    }
    else
    {
      notification = *MEMORY[0x24BDF71E8];
      v4 = accessibilityLocalizedString(CFSTR("keyboard.cancel"));
      UIAccessibilityPostNotification(notification, v4);

    }
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(v12, 0);
}

- (void)highlightRow:(unint64_t)a3
{
  UIInputSwitcherViewAccessibility *v3;
  id v4;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  UIInputSwitcherViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIInputSwitcherViewAccessibility;
  -[UIInputSwitcherViewAccessibility highlightRow:](&v5, sel_highlightRow_, a3);
  v3 = v8;
  v4 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v6, 0);
  -[UIInputSwitcherViewAccessibility _axAnnounceSelectedLanguage:](v3, "_axAnnounceSelectedLanguage:");

}

- (void)_axAnnounceSelectedLanguage:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id argument;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  int v22;
  int v23;
  void (*v24)(uint64_t);
  void *v25;
  UIInputSwitcherViewAccessibility *v26;
  id v27[2];
  uint64_t v28;
  uint64_t *v29;
  int v30;
  int v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  char v39;
  id v40;
  id location[2];
  UIInputSwitcherViewAccessibility *v42;

  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = 0;
  objc_opt_class();
  v13 = (id)-[UIInputSwitcherViewAccessibility safeValueForKey:](v42, "safeValueForKey:", CFSTR("m_table"));
  v38 = (id)__UIAccessibilityCastAsClass();

  v37 = v38;
  objc_storeStrong(&v38, 0);
  v40 = v37;
  v36 = (id)objc_msgSend(v37, "cellForRowAtIndexPath:", location[0]);
  if (v36)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 838860800;
    v31 = 48;
    v32 = __Block_byref_object_copy__12;
    v33 = __Block_byref_object_dispose__12;
    v34 = 0;
    v21 = MEMORY[0x24BDAC760];
    v22 = -1073741824;
    v23 = 0;
    v24 = __64__UIInputSwitcherViewAccessibility__axAnnounceSelectedLanguage___block_invoke;
    v25 = &unk_24FF3DAB0;
    v27[1] = &v28;
    v26 = v42;
    v27[0] = location[0];
    AXPerformSafeBlock();
    v20 = (id)v29[5];
    objc_storeStrong(v27, 0);
    objc_storeStrong((id *)&v26, 0);
    _Block_object_dispose(&v28, 8);
    objc_storeStrong(&v34, 0);
    v35 = v20;
    v19 = 0;
    v18 = 0;
    v17 = (id)-[UIInputSwitcherViewAccessibility safeArrayForKey:](v42, "safeArrayForKey:", CFSTR("inputModes"));
    v16 = (id)objc_msgSend(v35, "safeValueForKey:", CFSTR("identifier"));
    if ((objc_msgSend(v17, "containsObject:", v16) & 1) != 0)
      v3 = v16;
    else
      v3 = 0;
    v15 = v3;
    if (v3)
    {
      v4 = (id)MEMORY[0x2348C3740](v15);
      v5 = v18;
      v18 = v4;

      v6 = (id)MEMORY[0x2348C3680](v18);
      v7 = v18;
      v18 = v6;

    }
    v8 = (id)objc_msgSend(v36, "accessibilityValue");
    v9 = v19;
    v19 = v8;

    v10 = (void *)MEMORY[0x24BDFEA60];
    v12 = (id)objc_msgSend(v36, "accessibilityLabel");
    v11 = (id)__UIAXStringForVariables();
    argument = (id)objc_msgSend(v10, "axAttributedStringWithString:", v19, CFSTR("__AXStringForVariablesSentinel"));

    if (v18)
      objc_msgSend(argument, "setAttribute:forKey:", v18, *MEMORY[0x24BDFEB98]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
    objc_storeStrong(&argument, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v35, 0);
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

void __64__UIInputSwitcherViewAccessibility__axAnnounceSelectedLanguage___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "safeArrayForKey:", CFSTR("m_inputSwitcherItems"));
  v1 = (id)objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_segmentControlValueDidChange:(id)a3
{
  id v3;
  id v4;
  id v5;
  int v6;
  id v7;
  char v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  objc_super v18;
  id location[2];
  UIInputSwitcherViewAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)UIInputSwitcherViewAccessibility;
  -[UIInputSwitcherViewAccessibility _segmentControlValueDidChange:](&v18, sel__segmentControlValueDidChange_, location[0]);
  v17 = 0;
  v16 = 0;
  v15 = (id)__UIAccessibilitySafeClass();
  v14 = v15;
  objc_storeStrong(&v15, 0);
  v3 = location[0];
  location[0] = v14;

  v12 = 0;
  objc_opt_class();
  v7 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("selectedSegmentIndex"));
  v11 = (id)__UIAccessibilityCastAsClass();

  v10 = v11;
  objc_storeStrong(&v11, 0);
  v13 = v10;
  if (v10 && (unint64_t)objc_msgSend(v13, "integerValue") <= 2)
  {
    v4 = (id)UIKitAccessibilityLocalizedString();
    v5 = v17;
    v17 = v4;

  }
  v8 = 0;
  LOBYTE(v6) = 0;
  if (v17)
  {
    v9 = -[UIInputSwitcherViewAccessibility _accessibilityLastHandednessBiasAnnouncement](v20);
    v8 = 1;
    v6 = objc_msgSend(v9, "isEqualToString:", v17) ^ 1;
  }
  if ((v8 & 1) != 0)

  if ((v6 & 1) != 0)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v17);
    -[UIInputSwitcherViewAccessibility _accessibilitySetLastHandednessBiasAnnouncement:]((uint64_t)v20, v17);
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)willFadeForSelectionAtIndex:(unint64_t)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  unint64_t v6;
  SEL v7;
  UIInputSwitcherViewAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  notification = *MEMORY[0x24BDF7328];
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
  UIAccessibilityPostNotification(notification, v4);

  v5.receiver = v8;
  v5.super_class = (Class)UIInputSwitcherViewAccessibility;
  -[UIInputSwitcherViewAccessibility willFadeForSelectionAtIndex:](&v5, sel_willFadeForSelectionAtIndex_, v6);
}

@end
