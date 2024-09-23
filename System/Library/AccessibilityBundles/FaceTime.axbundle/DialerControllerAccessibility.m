@implementation DialerControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DialerController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DialerController"), CFSTR("dialerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAbstractDialerView"), CFSTR("callButton"), "@", 0);

}

- (void)phonePad:(id)a3 replaceLastDigitWithString:(id)a4
{
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DialerControllerAccessibility;
  v5 = a4;
  -[DialerControllerAccessibility phonePad:replaceLastDigitWithString:](&v6, sel_phonePad_replaceLastDigitWithString_, a3, v5);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D0], 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v5);

}

- (void)phonePadDeleteLastDigit:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility phonePadDeleteLastDigit:](&v3, sel_phonePadDeleteLastDigit_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D0], (id)*MEMORY[0x24BDFF0D8]);
}

- (void)phonePad:(id)a3 appendString:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility phonePad:appendString:](&v4, sel_phonePad_appendString_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB1D0], (id)*MEMORY[0x24BDFF108]);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[DialerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dialerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("callButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("call.text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[DialerControllerAccessibility _voiceOverStatusChange:](self, "_voiceOverStatusChange:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility dealloc](&v4, sel_dealloc);
}

- (void)_voiceOverStatusChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[DialerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dialerView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("lcdView"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    {
      objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDelegate:", v6);

    }
  }
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility loadView](&v4, sel_loadView);
  -[DialerControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__voiceOverStatusChange_, *MEMORY[0x24BDF7458], 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DialerControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DialerControllerAccessibility;
  -[DialerControllerAccessibility viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDF6B38], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

}

- (BOOL)_accessibilitySupportsHandwriting
{
  return 1;
}

- (unint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  return 4;
}

- (unint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  return 4;
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  return 1;
}

- (BOOL)_accessibilityHasDeletableText
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[DialerControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dialerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("lcdView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("text"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7 = v4;
  AXPerformSafeBlock();
  v5 = v9[3];

  _Block_object_dispose(&v8, 8);
  return v5 != 0;
}

uint64_t __63__DialerControllerAccessibility__accessibilityHasDeletableText__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "length");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
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

uint64_t __58__DialerControllerAccessibility__accessibilityInsertText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "phonePad:appendString:", 0, *(_QWORD *)(a1 + 40));
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  AXPerformSafeBlock();

}

uint64_t __84__DialerControllerAccessibility__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;

  v1 = result;
  if (*(_QWORD *)(result + 48))
  {
    v2 = 0;
    do
    {
      result = objc_msgSend(*(id *)(v1 + 32), "phonePadDeleteLastDigit:", 0);
      ++v2;
    }
    while (v2 < *(_QWORD *)(v1 + 48));
  }
  if (*(_QWORD *)(v1 + 40))
    return objc_msgSend(*(id *)(v1 + 32), "_accessibilityInsertText:");
  return result;
}

@end
