@implementation SBUIPasscodeLockViewBaseAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUIPasscodeLockViewBase");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewBase"), CFSTR("style"), "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockViewWithKeypad"), CFSTR("_entryField"), "SBUIPasscodeEntryField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockViewWithKeyboard"), CFSTR("_alphaEntryField"), "SBUIAlphanumericPasscodeEntryField");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockViewWithKeyboard"), CFSTR("_entryField"), "SBUIPasscodeEntryField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeEntryField"), CFSTR("stringValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeEntryField"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeEntryField"), CFSTR("appendString:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeEntryField"), CFSTR("deleteLastCharacter"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewBase"), CFSTR("_resetForFailedPasscode:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewBase"), CFSTR("_setPasscodeLockViewState:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockViewBase"), CFSTR("_statusText"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUIPasscodeLockViewBase"), CFSTR("_statusState"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBUIPasscodeLockViewBase"), CFSTR("_updateStatusTextForBioEvent: animated:"), "v", "Q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSString"), CFSTR("isNewline"), "B", 0);

}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 1;
}

- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  void *v2;
  unsigned int v3;

  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("style"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  if (v3 >= 3)
    return 1;
  else
    return 4;
}

- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  void *v3;
  unsigned int v4;
  objc_super v6;

  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("style"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 < 2)
    return 4;
  v6.receiver = self;
  v6.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  return -[SBUIPasscodeLockViewBaseAccessibility _accessibilityHandwritingAttributeAllowedCharacterSets](&v6, sel__accessibilityHandwritingAttributeAllowedCharacterSets);
}

- (BOOL)_accessibilityHasDeletableText
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_entryField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("stringValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6 = v3;
  AXPerformSafeBlock();
  v4 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v4 != 0;
}

uint64_t __71__SBUIPasscodeLockViewBaseAccessibility__accessibilityHasDeletableText__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter
{
  return 0;
}

- (BOOL)_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound
{
  return 1;
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_entryField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    v8 = v5;
    v6 = v5;
    AXPerformSafeBlock();

  }
}

void __66__SBUIPasscodeLockViewBaseAccessibility__accessibilityInsertText___block_invoke(uint64_t a1)
{
  unint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  for (i = 0; i != 0x7FFFFFFFFFFFFFFFLL; i = v5 + v6)
  {
    if (i >= objc_msgSend(*(id *)(a1 + 32), "length"))
      break;
    v3 = objc_msgSend(*(id *)(a1 + 32), "rangeOfComposedCharacterSequenceAtIndex:", i);
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      break;
    v5 = v3;
    v6 = v4;
    v7 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v3, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v8);

  }
}

- (BOOL)_accessibilityActivateKeyboardReturnKey
{
  void *v3;
  int v4;
  objc_super v6;

  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("style"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 != 3
    || (v6.receiver = self,
        v6.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility,
        !-[SBUIPasscodeLockViewBaseAccessibility _accessibilityActivateKeyboardReturnKey](&v6, sel__accessibilityActivateKeyboardReturnKey)))
  {
    -[SBUIPasscodeLockViewBaseAccessibility _accessibilityInsertText:](self, "_accessibilityInsertText:", CFSTR("\n"));
  }
  return 1;
}

- (void)_resetForFailedPasscode:(BOOL)a3
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  -[SBUIPasscodeLockViewBaseAccessibility _resetForFailedPasscode:](&v5, sel__resetForFailedPasscode_, a3);
  v3 = *MEMORY[0x24BDF71E8];
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE10]);
  accessibilitySBLocalizedString(CFSTR("failed.passcode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v5 = a4;
  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_entryField"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = v6;
  AXPerformSafeBlock();

}

uint64_t __92__SBUIPasscodeLockViewBaseAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;

  v1 = result;
  if (*(_QWORD *)(result + 56))
  {
    v2 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v1 + 32), "deleteLastCharacter");
      ++v2;
    }
    while (v2 < *(_QWORD *)(v1 + 56));
  }
  if (*(_QWORD *)(v1 + 40))
    return objc_msgSend(*(id *)(v1 + 48), "_accessibilityInsertText:");
  return result;
}

- (BOOL)_accessibilityEntryFieldIsFirstResponder
{
  void *v2;
  void *v3;
  char v4;

  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_entryField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  return v4;
}

- (void)_updateStatusTextForBioEvent:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v7 = -[SBUIPasscodeLockViewBaseAccessibility _accessibilityEntryFieldIsFirstResponder](self, "_accessibilityEntryFieldIsFirstResponder");
  -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  -[SBUIPasscodeLockViewBaseAccessibility _updateStatusTextForBioEvent:animated:](&v11, sel__updateStatusTextForBioEvent_animated_, a3, v4);
  if (v7)
  {
    -[SBUIPasscodeLockViewBaseAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_statusText"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[SBUIPasscodeLockViewBaseAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_statusState")) & 0xFFFFFFFFFFFFFFFELL) == 8
      || (objc_msgSend(v8, "isEqualToString:", v9) & 1) == 0)
    {
      if (objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setAttribute:forKey:", &unk_250393CF0, *MEMORY[0x24BDFEAD8]);
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v10);

      }
    }

  }
}

- (BOOL)becomeFirstResponder
{
  _BOOL4 v3;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SBUIPasscodeLockViewBaseAccessibility *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  v3 = -[SBUIPasscodeLockViewBaseAccessibility becomeFirstResponder](&v20, sel_becomeFirstResponder);
  if (-[SBUIPasscodeLockViewBaseAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_statusState")) == 1
    && v3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __61__SBUIPasscodeLockViewBaseAccessibility_becomeFirstResponder__block_invoke;
    v11 = &unk_250390270;
    v12 = self;
    v13 = &v14;
    AXPerformSafeBlock();
    v5 = (id)v15[5];
    _Block_object_dispose(&v14, 8);

    UIAccessibilitySpeakOrQueueIfNeeded();
  }
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen", v8, v9, v10, v11, v12, v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsFocusUpdate");

  return v3;
}

void __61__SBUIPasscodeLockViewBaseAccessibility_becomeFirstResponder__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_statusSubtitleText"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setPasscodeLockViewState:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBUIPasscodeLockViewBaseAccessibility;
  -[SBUIPasscodeLockViewBaseAccessibility _setPasscodeLockViewState:animated:](&v4, sel__setPasscodeLockViewState_animated_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __76__SBUIPasscodeLockViewBaseAccessibility__setPasscodeLockViewState_animated___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
