@implementation PHHandsetDialerLCDViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHHandsetDialerLCDView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHHandsetDialerLCDView"), CFSTR("updateAddAndDeleteButtonForText: name: animated:"), "v", "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHHandsetDialerLCDView"), CFSTR("initWithFrame: forDialerType:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAbstractDialerView"), CFSTR("phonePadView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PHDialerContactResultButtonView"));

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (PHHandsetDialerLCDViewAccessibility)initWithFrame:(CGRect)a3 forDialerType:(int)a4
{
  PHHandsetDialerLCDViewAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  v4 = -[PHHandsetDialerLCDViewAccessibility initWithFrame:forDialerType:](&v6, sel_initWithFrame_forDialerType_, *(_QWORD *)&a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PHHandsetDialerLCDViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  -[PHHandsetDialerLCDViewAccessibility dealloc](&v4, sel_dealloc);
}

- (double)_accessibilityAllowedGeometryOverlap
{
  double v2;

  -[PHHandsetDialerLCDViewAccessibility bounds](self, "bounds");
  return v2;
}

- (void)_voStatusChanged:(id)a3
{
  id v4;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(MEMORY[0x24BDF6B38], "activeInstance");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", self);

  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  -[PHHandsetDialerLCDViewAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__voStatusChanged_, *MEMORY[0x24BDF7458], 0);

  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_numberTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("PhoneNumberLabel"));

  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_numberTextField"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("phone.display"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[PHHandsetDialerLCDViewAccessibility _voStatusChanged:](self, "_voStatusChanged:", 0);
}

- (BOOL)hasText
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_numberTextField"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length") != 0;

  return v4;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;

  v4 = a3;
  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("DialerController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _AXAssert();
    goto LABEL_10;
  }
  if (objc_msgSend(v4, "length") == 1)
  {
    v7 = objc_msgSend(v4, "characterAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "characterIsMember:", v7);

    if ((v9 & 1) != 0 || (_DWORD)v7 == 35)
      goto LABEL_7;
    if ((_DWORD)v7 == 61)
    {
LABEL_8:
      v10 = v6;
      AXPerformSafeBlock();

      goto LABEL_10;
    }
    if ((_DWORD)v7 == 42)
    {
LABEL_7:
      v11 = v6;
      v12 = v4;
      AXPerformSafeBlock();

      if ((_DWORD)v7 == 61)
        goto LABEL_8;
    }
  }
LABEL_10:

}

uint64_t __50__PHHandsetDialerLCDViewAccessibility_insertText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "phonePad:appendString:", 0, *(_QWORD *)(a1 + 40));
}

uint64_t __50__PHHandsetDialerLCDViewAccessibility_insertText___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_callButtonPressed:", 0);
}

- (void)deleteBackward
{
  id v2;

  v2 = (id)-[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteCharacter"));
}

- (void)setText:(id)a3 needsFormat:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIUnformattedPhoneNumberFromString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14.receiver = self;
  v14.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  -[PHHandsetDialerLCDViewAccessibility setText:needsFormat:](&v14, sel_setText_needsFormat_, v6, v4);

  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIUnformattedPhoneNumberFromString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "length");
  if (v11 < objc_msgSend(v10, "length"))
  {
    objc_msgSend(v10, "substringFromIndex:", objc_msgSend(v8, "length"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFECC8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);

  }
}

- (void)deleteCharacter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIUnformattedPhoneNumberFromString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  -[PHHandsetDialerLCDViewAccessibility deleteCharacter](&v10, sel_deleteCharacter);
  -[PHHandsetDialerLCDViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIUnformattedPhoneNumberFromString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "length");
  if (v7 > objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFECC0]);
    objc_msgSend(v9, "setAttribute:forKey:", &unk_2502955C8, *MEMORY[0x24BDFEAD8]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);

  }
}

- (void)updateAddAndDeleteButtonForText:(id)a3 name:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  -[PHHandsetDialerLCDViewAccessibility updateAddAndDeleteButtonForText:name:animated:](&v14, sel_updateAddAndDeleteButtonForText_name_animated_, v8, v9, v5);
  if (objc_msgSend(v8, "length"))
  {
    v10 = 0;
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeValueForKey:", CFSTR("phonePadView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v10);

}

- (id)_accessibilitySubviews
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PHHandsetDialerLCDViewAccessibility;
  -[PHHandsetDialerLCDViewAccessibility _accessibilitySubviews](&v5, sel__accessibilitySubviews);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axFilterObjectsUsingBlock:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __61__PHHandsetDialerLCDViewAccessibility__accessibilitySubviews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v4;
}

@end
