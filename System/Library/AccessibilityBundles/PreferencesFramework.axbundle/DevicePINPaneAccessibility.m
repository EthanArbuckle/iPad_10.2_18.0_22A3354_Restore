@implementation DevicePINPaneAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DevicePINPane");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("simplePIN"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("insertText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("hasText"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("deleteBackward"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("pinView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DevicePINPane"), CFSTR("PSEditingPane"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PSEditingPane"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("DevicePINPane"), CFSTR("_transitionView"), "UITransitionView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSBulletedPINView"), CFSTR("_passcodeField"), "PSPasscodeField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DevicePINPane"), CFSTR("slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:"), "v", "B", "B", "B", "i", "B", 0);

}

- (DevicePINPaneAccessibility)initWithFrame:(CGRect)a3
{
  DevicePINPaneAccessibility *v3;
  DevicePINPaneAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DevicePINPaneAccessibility;
  v3 = -[DevicePINPaneAccessibility initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[DevicePINPaneAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (void)setPINPolicyString:(id)a3 visible:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)DevicePINPaneAccessibility;
  v5 = a3;
  -[DevicePINPaneAccessibility setPINPolicyString:visible:](&v6, sel_setPINPolicyString_visible_, v5, v4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)slideToNewPasscodeField:(BOOL)a3 requiresKeyboard:(BOOL)a4 numericOnly:(BOOL)a5 transition:(int)a6 showsOptionsButton:(BOOL)a7
{
  UIAccessibilityNotifications v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DevicePINPaneAccessibility;
  -[DevicePINPaneAccessibility slideToNewPasscodeField:requiresKeyboard:numericOnly:transition:showsOptionsButton:](&v12, sel_slideToNewPasscodeField_requiresKeyboard_numericOnly_transition_showsOptionsButton_, a3, a4, a5, *(_QWORD *)&a6, a7);
  v8 = *MEMORY[0x24BDF71E8];
  -[DevicePINPaneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pinView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("_titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v8, v11);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DevicePINPaneAccessibility;
  -[DevicePINPaneAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[DevicePINPaneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_transitionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 0);

}

- (id)_accessibilityResponderElement
{
  void *v3;
  void *v4;
  objc_super v6;

  if (!-[DevicePINPaneAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("simplePIN"))
    || (-[DevicePINPaneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pinView")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "safeValueForKey:", CFSTR("_passcodeField")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v6.receiver = self;
    v6.super_class = (Class)DevicePINPaneAccessibility;
    -[DevicePINPaneAccessibility _accessibilityResponderElement](&v6, sel__accessibilityResponderElement);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 1;
}

- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter
{
  return 0;
}

- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  void *v2;
  int v3;

  -[DevicePINPaneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("simplePIN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    return 4;
  else
    return 1;
}

- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  void *v2;
  int v3;

  -[DevicePINPaneAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("simplePIN"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
    return 4;
  else
    return 15;
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (BOOL)_accessibilityHasDeletableText
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __60__DevicePINPaneAccessibility__accessibilityHasDeletableText__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasText");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    AXPerformSafeBlock();

  }
}

uint64_t __55__DevicePINPaneAccessibility__accessibilityInsertText___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityPlayKeyboardClickSound");
  return objc_msgSend(*(id *)(a1 + 32), "insertText:", *(_QWORD *)(a1 + 40));
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AXPerformSafeBlock();

}

uint64_t __81__DevicePINPaneAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;

  v1 = result;
  if (*(_QWORD *)(result + 48))
  {
    v2 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v1 + 32), "deleteBackward");
      ++v2;
    }
    while (v2 < *(_QWORD *)(v1 + 48));
  }
  if (*(_QWORD *)(v1 + 40))
    return objc_msgSend(*(id *)(v1 + 32), "_accessibilityInsertText:");
  return result;
}

@end
