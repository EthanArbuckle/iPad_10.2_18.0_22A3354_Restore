@implementation UIKBInputDelegateManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKBInputDelegateManager");
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
  v7 = "@";
  v3 = "B";
  v4 = CFSTR("UIKBInputDelegateManager");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "q", "@", "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("__content"), v7, 0);
  v5 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("insertText:updateInputSource:"), v7, v3, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("_deleteBackwardAndNotify:reinsertText:"), v5, v3, v3, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("WKContentView"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIKeyboardImpl"), CFSTR("inlineTextCompletionController"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInlineTextCompletionController"), CFSTR("lastAcceptedTextCompletion"), v7, 0);
  v6 = CFSTR("_UIInlineTextCompletion");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("input"), v7, 0);
  objc_storeStrong(v9, v8);
}

- (BOOL)callShouldReplaceExtendedRange:(int64_t)a3 withText:(id)a4 includeMarkedText:(BOOL)a5
{
  uint64_t v5;
  char v7;
  id v8;
  BOOL v9;
  char v11;
  id v12;
  id v13;
  id v14[2];
  int v15;
  int v16;
  void (*v17)(uint64_t);
  void *v18;
  UIKBInputDelegateManagerAccessibility *v19;
  objc_super v20;
  char v21;
  BOOL v22;
  id location;
  int64_t v24;
  SEL v25;
  UIKBInputDelegateManagerAccessibility *v26;

  v26 = self;
  v25 = a2;
  v24 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v22 = a5;
  v21 = 0;
  v20.receiver = v26;
  v20.super_class = (Class)UIKBInputDelegateManagerAccessibility;
  v21 = -[UIKBInputDelegateManagerAccessibility callShouldReplaceExtendedRange:withText:includeMarkedText:](&v20, sel_callShouldReplaceExtendedRange_withText_includeMarkedText_, v24, location, a5);
  if ((v21 & 1) != 0)
  {
    v14[1] = (id)MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __99__UIKBInputDelegateManagerAccessibility_callShouldReplaceExtendedRange_withText_includeMarkedText___block_invoke;
    v18 = &unk_24FF3DA40;
    v19 = v26;
    AXPerformSafeBlock();
    v14[0] = (id)objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v13 = (id)objc_msgSend(v14[0], "safeValueForKeyPath:", CFSTR("inlineTextCompletionController.lastAcceptedTextCompletion"));
    v8 = (id)objc_msgSend(v13, "safeStringForKey:", CFSTR("candidate"));
    v11 = 0;
    v9 = 0;
    if ((objc_msgSend(v8, "isEqualToString:", location) & 1) != 0)
    {
      v12 = (id)objc_msgSend(v13, "safeStringForKey:", CFSTR("input"));
      v11 = 1;
      v5 = objc_msgSend(v12, "length");
      v9 = v5 == v24;
    }
    if ((v11 & 1) != 0)

    if (!v9)
      UIAccessibilityPostNotification(*MEMORY[0x24BEBB0E8], location);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
    objc_storeStrong((id *)&v19, 0);
  }
  v7 = v21;
  objc_storeStrong(&location, 0);
  return v7 & 1;
}

void __99__UIKBInputDelegateManagerAccessibility_callShouldReplaceExtendedRange_withText_includeMarkedText___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v6 = a1;
  v5 = 0;
  objc_opt_class();
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("__content"));
  v4 = (id)__UIAccessibilityCastAsSafeCategory();

  v3 = v4;
  objc_storeStrong(&v4, 0);
  -[UITextInputUIResponderAccessibility _axResetFKAFocusToFirstResponder](v3);

}

- (void)insertText:(id)a3 updateInputSource:(BOOL)a4
{
  id v5;
  objc_super v6;
  BOOL v7;
  id location[2];
  UIKBInputDelegateManagerAccessibility *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = a4;
  v6.receiver = v9;
  v6.super_class = (Class)UIKBInputDelegateManagerAccessibility;
  -[UIKBInputDelegateManagerAccessibility insertText:updateInputSource:](&v6, sel_insertText_updateInputSource_, location[0], a4);
  v5 = (id)-[UIKBInputDelegateManagerAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("keyInputDelegate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(CFSTR("WKContentView"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[UIKBInputDelegateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v9, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF0E8]);
    }
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)_deleteBackwardAndNotify:(BOOL)a3 reinsertText:(BOOL)a4
{
  id location;
  objc_super v5;
  BOOL v6;
  BOOL v7;
  SEL v8;
  UIKBInputDelegateManagerAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6 = a4;
  v5.receiver = self;
  v5.super_class = (Class)UIKBInputDelegateManagerAccessibility;
  -[UIKBInputDelegateManagerAccessibility _deleteBackwardAndNotify:reinsertText:](&v5, sel__deleteBackwardAndNotify_reinsertText_, a3, a4);
  location = (id)-[UIKBInputDelegateManagerAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("keyInputDelegate"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSClassFromString(CFSTR("WKContentView"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
        -[UIKBInputDelegateManagerAccessibility _accessibilityPostValueChangedNotificationWithChangeType:](v9, "_accessibilityPostValueChangedNotificationWithChangeType:", *MEMORY[0x24BDFF0D8]);
    }
  }
  objc_storeStrong(&location, 0);
}

@end
