@implementation UITextInputControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITextInputController");
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
  const char *v6;
  id v7;
  id *v8;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v8 = location;
  v7 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = "B";
  v4 = CFSTR("UITextInputController");
  v3 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "B", "B", 0);
  v5 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("copy:"), v3, "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("cut:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("paste:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("selectAll:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("toggleBoldface:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("toggleUnderline:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("toggleItalics:"), v3, v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("delegate"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_firstTextView"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_textInputTraits"), v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UITextInputTraits"), CFSTR("secureTextEntry"), v6);
  objc_storeStrong(v8, v7);
}

- (void)_sendDelegateChangeNotificationsForText:(BOOL)a3 selection:(BOOL)a4
{
  char v4;
  UITextInputControllerAccessibility *v5;
  BOOL v6;
  char v7;
  id v8;
  objc_super v9;
  BOOL v10;
  BOOL v11;
  SEL v12;
  UITextInputControllerAccessibility *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  v10 = a4;
  v9.receiver = self;
  v9.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility _sendDelegateChangeNotificationsForText:selection:](&v9, sel__sendDelegateChangeNotificationsForText_selection_, a3, a4);
  v7 = 0;
  v4 = 0;
  if (v10)
  {
    v8 = (id)-[UITextInputControllerAccessibility safeUIViewForKey:](v13, "safeUIViewForKey:", CFSTR("_firstTextView"));
    v7 = 1;
    v4 = objc_msgSend(v8, "isFirstResponder");
  }
  if ((v7 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v6 = v11;
    v5 = v13;
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong((id *)&v5, 0);
  }
}

void __88__UITextInputControllerAccessibility__sendDelegateChangeNotificationsForText_selection___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  int v4;
  char v5;
  id v6;

  v5 = 0;
  LOBYTE(v4) = 1;
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    v6 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_textInputTraits"));
    v5 = 1;
    v4 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("secureTextEntry")) ^ 1;
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
  {
    v1 = *(void **)(a1 + 32);
    v2 = (id)objc_msgSend(v1, "safeValueForKey:", CFSTR("delegate"));
    -[UITextInputControllerAccessibility _accessibilityUpdateSelectionNotification:]((uint64_t)v1, v2);

  }
}

- (void)_accessibilityUpdateSelectionNotification:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  os_log_type_t type;
  os_log_t oslog;
  id v7;
  id argument;
  int v9;
  id location;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v11 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v11)
  {
    argument = 0;
    v7 = (id)objc_msgSend(location, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_47, 1);
    if ((objc_msgSend(v7, "_accessibilityTextViewIgnoresValueChanges") & 1) != 0)
    {
      oslog = (os_log_t)(id)AXLogCommon();
      type = OS_LOG_TYPE_INFO;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)v7);
        _os_log_impl(&dword_230C4A000, oslog, type, "Ignoring ax value notifications for %@", v14, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v9 = 1;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0
        && (objc_msgSend(v7, "accessibilityValueChangesAreReplacements") & 1) != 0)
      {
        v12 = *MEMORY[0x24BDFEF90];
        v13 = MEMORY[0x24BDBD1C8];
        v2 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
        v3 = argument;
        argument = v2;

      }
      v4 = -[UITextInputControllerAccessibility _axTextInputResponderAccessibilityParentElementForDelegate:](v11, location);
      if (v4)
      {
        _UIAccessibilitySetAssociatedElementContextForNextNotification();
        UIAccessibilityPostNotification(*MEMORY[0x24BEBB0B0], argument);
      }
      objc_storeStrong(&v4, 0);
      v9 = 0;
    }
    objc_storeStrong(&v7, 0);
    objc_storeStrong(&argument, 0);
  }
  else
  {
    v9 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (id)_axTextInputResponderAccessibilityParentElementForDelegate:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  BOOL v8;
  id v9;
  int v10;
  id location;
  uint64_t v12;
  id v13;

  v12 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v12)
  {
    v2 = (id)objc_msgSend(location, "_accessibilityWindow");
    v8 = v2 == 0;

    if (v8)
    {
      v13 = 0;
      v10 = 1;
    }
    else
    {
      v9 = location;
      while (v9 && (objc_msgSend(v9, "isAccessibilityElement") & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v3 = (id)objc_msgSend(v9, "_accessibilityResponderElement");
          v4 = v9;
          v9 = v3;

          break;
        }
        v5 = (id)objc_msgSend(v9, "accessibilityContainer");
        v6 = v9;
        v9 = v5;

      }
      v13 = v9;
      v10 = 1;
      objc_storeStrong(&v9, 0);
    }
  }
  else
  {
    v13 = 0;
    v10 = 1;
  }
  objc_storeStrong(&location, 0);
  return v13;
}

uint64_t __80__UITextInputControllerAccessibility__accessibilityUpdateSelectionNotification___block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  isKindOfClass = 1;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)copy:(id)a3
{
  objc_super v3;
  id location[2];
  UITextInputControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility copy:](&v3, sel_copy_, location[0]);
  -[UITextInputControllerAccessibility _accessibilityPostPasteboardTextForOperation:](v5, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF018]);
  objc_storeStrong(location, 0);
}

- (void)cut:(id)a3
{
  objc_super v3;
  id location[2];
  UITextInputControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UITextInputControllerAccessibility _accessibilityIgnoreNextPostPasteboardTextOperation:](v5, "_accessibilityIgnoreNextPostPasteboardTextOperation:", *MEMORY[0x24BDFF018]);
  v3.receiver = v5;
  v3.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility cut:](&v3, sel_cut_, location[0]);
  -[UITextInputControllerAccessibility _accessibilityPostPasteboardTextForOperation:](v5, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF020]);
  objc_storeStrong(location, 0);
}

- (void)paste:(id)a3
{
  objc_super v3;
  id v4;
  id v5;
  id location[2];
  UITextInputControllerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[UITextInputControllerAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("delegate"));
  v4 = -[UITextInputControllerAccessibility _axTextInputResponderAccessibilityParentElementForDelegate:]((uint64_t)v7, v5);
  -[UITextInputControllerAccessibility _accessibilityPostPasteboardTextForOperation:associatedObject:](v7, "_accessibilityPostPasteboardTextForOperation:associatedObject:", *MEMORY[0x24BDFF060], v4);
  v3.receiver = v7;
  v3.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility paste:](&v3, sel_paste_, location[0]);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)selectAll:(id)a3
{
  UIAccessibilityNotifications notification;
  id v4;
  objc_super v5;
  id location[2];
  UITextInputControllerAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility selectAll:](&v5, sel_selectAll_, location[0]);
  notification = *MEMORY[0x24BDF71E8];
  v4 = accessibilityLocalizedString((id)*MEMORY[0x24BDFF088]);
  UIAccessibilityPostNotification(notification, v4);

  objc_storeStrong(location, 0);
}

- (void)toggleBoldface:(id)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  id v8;
  id argument;
  char v10;
  id v11;
  char v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  objc_super v21;
  id location[2];
  UITextInputControllerAccessibility *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility toggleBoldface:](&v21, sel_toggleBoldface_, location[0]);
  v19 = 0;
  objc_opt_class();
  v8 = (id)-[UITextInputControllerAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("typingAttributes"));
  v18 = (id)__UIAccessibilityCastAsClass();

  v17 = v18;
  objc_storeStrong(&v18, 0);
  v20 = v17;
  v16 = (id)objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BEBB360]);
  if (!v16)
  {
    v7 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontSize");
    v16 = (id)objc_msgSend(v7, "systemFontOfSize:");

  }
  v5 = (id)objc_msgSend(v16, "fontDescriptor");
  v6 = (objc_msgSend(v5, "symbolicTraits") & 2) != 0;

  v15 = v6;
  v12 = 0;
  v10 = 0;
  if (v6)
  {
    v13 = accessibilityLocalizedString(CFSTR("toggle.on"));
    v12 = 1;
    v3 = v13;
  }
  else
  {
    v11 = accessibilityLocalizedString(CFSTR("toggle.off"));
    v10 = 1;
    v3 = v11;
  }
  v14 = v3;
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  v4 = accessibilityLocalizedString((id)*MEMORY[0x24BDFF010]);
  argument = (id)__UIAXStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)toggleUnderline:(id)a3
{
  id v3;
  id v4;
  id v5;
  id argument;
  char v7;
  id v8;
  char v9;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  objc_super v18;
  id location[2];
  UITextInputControllerAccessibility *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18.receiver = v20;
  v18.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility toggleUnderline:](&v18, sel_toggleUnderline_, location[0]);
  v16 = 0;
  objc_opt_class();
  v5 = (id)-[UITextInputControllerAccessibility safeValueForKey:](v20, "safeValueForKey:", CFSTR("typingAttributes"));
  v15 = (id)__UIAccessibilityCastAsClass();

  v14 = v15;
  objc_storeStrong(&v15, 0);
  v17 = v14;
  v13 = (id)objc_msgSend(v14, "objectForKey:", *MEMORY[0x24BEBB440]);
  v12 = objc_msgSend(v13, "intValue") != 0;
  v9 = 0;
  v7 = 0;
  if (v12)
  {
    v10 = accessibilityLocalizedString(CFSTR("toggle.on"));
    v9 = 1;
    v3 = v10;
  }
  else
  {
    v8 = accessibilityLocalizedString(CFSTR("toggle.off"));
    v7 = 1;
    v3 = v8;
  }
  v11 = v3;
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  v4 = accessibilityLocalizedString((id)*MEMORY[0x24BDFF0B0]);
  argument = (id)__UIAXStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)toggleItalics:(id)a3
{
  id v3;
  id v4;
  id v5;
  BOOL v6;
  void *v7;
  id v8;
  id argument;
  char v10;
  id v11;
  char v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  objc_super v21;
  id location[2];
  UITextInputControllerAccessibility *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21.receiver = v23;
  v21.super_class = (Class)UITextInputControllerAccessibility;
  -[UITextInputControllerAccessibility toggleItalics:](&v21, sel_toggleItalics_, location[0]);
  v19 = 0;
  objc_opt_class();
  v8 = (id)-[UITextInputControllerAccessibility safeValueForKey:](v23, "safeValueForKey:", CFSTR("typingAttributes"));
  v18 = (id)__UIAccessibilityCastAsClass();

  v17 = v18;
  objc_storeStrong(&v18, 0);
  v20 = v17;
  v16 = (id)objc_msgSend(v17, "objectForKey:", *MEMORY[0x24BEBB360]);
  if (!v16)
  {
    v7 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontSize");
    v16 = (id)objc_msgSend(v7, "systemFontOfSize:");

  }
  v5 = (id)objc_msgSend(v16, "fontDescriptor");
  v6 = (objc_msgSend(v5, "symbolicTraits") & 1) != 0;

  v15 = v6;
  v12 = 0;
  v10 = 0;
  if (v6)
  {
    v13 = accessibilityLocalizedString(CFSTR("toggle.on"));
    v12 = 1;
    v3 = v13;
  }
  else
  {
    v11 = accessibilityLocalizedString(CFSTR("toggle.off"));
    v10 = 1;
    v3 = v11;
  }
  v14 = v3;
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  v4 = accessibilityLocalizedString((id)*MEMORY[0x24BDFF048]);
  argument = (id)__UIAXStringForVariables();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_storeStrong(&argument, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

@end
