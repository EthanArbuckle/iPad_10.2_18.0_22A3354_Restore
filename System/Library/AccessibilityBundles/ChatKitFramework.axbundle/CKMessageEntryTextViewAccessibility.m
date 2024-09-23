@implementation CKMessageEntryTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEntryTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axEmojiRotor
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetEmojiRotor:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axEmojiCandidates
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetEmojiCandidates:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryTextView"), CFSTR("EMKTextView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EMKTextView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EMKTextView"), CFSTR("_emojiConversionActive"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKTextView"), CFSTR("personalizedEmojiTokenListForList:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKTextView"), CFSTR("_startTextKit1EmojiDisplayUpdateTimer:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKTextView"), CFSTR("_stopTextKit1EmojiDisplayUpdateTimer:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKOverlayView"), CFSTR("initWithView:anchorRect:emojiTokenList:selectionHandler:"), "@", "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("EMKLayoutManager"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKLayoutManager"), CFSTR("attributes"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("EMFEmojiToken"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMFEmojiToken"), CFSTR("string"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMKEmojiTokenList"), CFSTR("emojiTokenArray"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("EMKTextView"), CFSTR("_textKit2Controller"), "_EMKTextKit2Controller");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_EMKTextKit2Controller"), CFSTR("replaceRange:withEmojiToken:language:"), "v", "{_NSRange=QQ}", "@", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryTextView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("_placeholderLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("conversation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("sendingService"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("__ck_isSMS"), "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKMessageEntryTextView"), CFSTR("_placeholderLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryTextView"), CFSTR("placeholderText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryTextView"), CFSTR("updateTextView"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKActionMenuWindow"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKActionMenuWindow"), CFSTR("sharedInstance"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKMessageEntryTextViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("messageBodyField"));

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("text.message.content.view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKMessageEntryTextViewAccessibility _axIsSMSPlaceholderVisible](self, "_axIsSMSPlaceholderVisible"))
    {
      accessibilityLocalizedString(CFSTR("sms.placeholder.label"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKMessageEntryTextViewAccessibility _axEmojiRotor](self, "_axEmojiRotor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        accessibilityLocalizedString(CFSTR("emoji.replacements.available"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
    __UIAXStringForVariables();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_accessibilityGetValue
{
  objc_super v4;

  if (-[CKMessageEntryTextViewAccessibility _axIsSMSPlaceholderVisible](self, "_axIsSMSPlaceholderVisible"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility _accessibilityGetValue](&v4, sel__accessibilityGetValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityTextualContext
{
  return (id)*MEMORY[0x24BDF7398];
}

- (id)accessibilityHint
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[CKMessageEntryTextViewAccessibility _axEmojiCandidates](self, "_axEmojiCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    accessibilityLocalizedString(CFSTR("emoji.replacements.hint"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;

  objc_opt_class();
  -[objc_class sharedInstance](NSClassFromString(CFSTR("CKActionMenuWindow")), "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v2) = objc_msgSend(v3, "_accessibilityViewIsVisible") ^ 1;
  return (char)v2;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility accessibilityCustomRotors](&v7, sel_accessibilityCustomRotors);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKMessageEntryTextViewAccessibility _axEmojiRotor](self, "_axEmojiRotor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axSafelyAddObject:", v5);

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CKMessageEntryTextViewAccessibility _axUpdateEmojiCandidates](self, "_axUpdateEmojiCandidates");
  -[CKMessageEntryTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityPlaceholderValue
{
  void *v2;
  void *v3;

  -[CKMessageEntryTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("placeholderText"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC10]);
  return v3;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryTextViewAccessibility;
  return -[CKMessageEntryTextViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) & ~*MEMORY[0x24BDFF000];
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[CKMessageEntryTextViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)updateTextView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility updateTextView](&v3, sel_updateTextView);
  -[CKMessageEntryTextViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axUpdateEmojiCandidates
{
  void *v3;
  id v4;

  -[CKMessageEntryTextViewAccessibility _axEmojiCandidatesFromEmojiKit](self, "_axEmojiCandidatesFromEmojiKit");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[CKMessageEntryTextViewAccessibility _axSetEmojiCandidates:](self, "_axSetEmojiCandidates:", v4);
    -[CKMessageEntryTextViewAccessibility _axCreateEmojiRotor](self, "_axCreateEmojiRotor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryTextViewAccessibility _axSetEmojiRotor:](self, "_axSetEmojiRotor:", v3);

    if (UIAccessibilityIsSwitchControlRunning())
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
  else
  {
    -[CKMessageEntryTextViewAccessibility _axSetEmojiCandidates:](self, "_axSetEmojiCandidates:", 0);
    -[CKMessageEntryTextViewAccessibility _axSetEmojiRotor:](self, "_axSetEmojiRotor:", 0);
  }

}

- (void)_startTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility _startTextKit1EmojiDisplayUpdateTimer:](&v4, sel__startTextKit1EmojiDisplayUpdateTimer_, a3);
  -[CKMessageEntryTextViewAccessibility _axUpdateEmojiCandidates](self, "_axUpdateEmojiCandidates");
}

- (void)_stopTextKit1EmojiDisplayUpdateTimer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility _stopTextKit1EmojiDisplayUpdateTimer:](&v4, sel__stopTextKit1EmojiDisplayUpdateTimer_, a3);
  -[CKMessageEntryTextViewAccessibility _axSetEmojiCandidates:](self, "_axSetEmojiCandidates:", 0);
  -[CKMessageEntryTextViewAccessibility _axSetEmojiRotor:](self, "_axSetEmojiRotor:", 0);
  if (UIAccessibilityIsSwitchControlRunning())
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)setAttributedText:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility setAttributedText:](&v5, sel_setAttributedText_);
  if (!a3)
  {
    -[CKMessageEntryTextViewAccessibility _axSetEmojiCandidates:](self, "_axSetEmojiCandidates:", 0);
    -[CKMessageEntryTextViewAccessibility _axSetEmojiRotor:](self, "_axSetEmojiRotor:", 0);
    if (UIAccessibilityIsSwitchControlRunning())
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (id)_axCreateEmojiRotor
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[5];

  accessibilityLocalizedString(CFSTR("emoji.rotor.name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BDF6790]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__CKMessageEntryTextViewAccessibility__axCreateEmojiRotor__block_invoke;
  v7[3] = &unk_2501B22E0;
  v7[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v3, v7);

  return v5;
}

id __58__CKMessageEntryTextViewAccessibility__axCreateEmojiRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_axEmojiCandidates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "currentItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "targetElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "indexOfObject:", v6);
    v8 = objc_msgSend(v3, "searchDirection");
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8 == 1)
        v9 = 0;
      else
        v9 = objc_msgSend(v4, "count") - 1;
      goto LABEL_11;
    }
    if (v8)
    {
      if (v7 < (unint64_t)(objc_msgSend(v4, "count") - 1))
      {
        v9 = v7 + 1;
LABEL_11:
        objc_msgSend(v4, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6798]), "initWithTargetElement:targetRange:", v11, 0);

LABEL_13:
        goto LABEL_14;
      }
    }
    else
    {
      v9 = v7 - 1;
      if (v7 >= 1)
        goto LABEL_11;
    }
    v10 = 0;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)_axTextRangeForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v11;

  length = a3.length;
  location = a3.location;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginningOfDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positionFromPosition:offset:", v6, location);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "positionFromPosition:offset:", v6, location + length);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v7, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (BOOL)_axIsSMSPlaceholderVisible
{
  void *v3;
  void *v4;
  char v5;

  -[CKMessageEntryTextViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.conversation.sendingService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("__ck_isSMS")))
  {
    -[CKMessageEntryTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_placeholderLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_axEmojiCandidatesFromEmojiKit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  if (!-[CKMessageEntryTextViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_emojiConversionActive")))return 0;
  v15 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLayoutManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke;
  v12[3] = &unk_2501B2330;
  v12[4] = self;
  v13 = v3;
  v6 = v4;
  v14 = v6;
  v7 = v3;
  v8 = (id)objc_msgSend(v5, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", 0, 0, v12);
  v9 = v14;
  v10 = v6;

  return v10;
}

uint64_t __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(a2, "textElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke_2;
  v8[3] = &unk_2501B2308;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v8);

  return 1;
}

void __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke_2(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  AXEmojiConversionCandidateElement *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  CGRect v24;
  CGRect v25;

  v7 = a2;
  objc_msgSend(v7, "objectForKey:", CFSTR("EMKEmojiTokenList"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("EMKEmojiConversionLanguage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__8;
    v22 = __Block_byref_object_dispose__8;
    v23 = 0;
    v17 = v8;
    AXPerformSafeBlock();
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
    if (v10)
    {
      v11 = -[AXEmojiConversionCandidateElement initWithAccessibilityContainer:]([AXEmojiConversionCandidateElement alloc], "initWithAccessibilityContainer:", a1[5]);
      objc_msgSend(a1[4], "_axTextRangeForRange:", a3, a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "firstRectForRange:");
      v25 = UIAccessibilityConvertFrameToScreenCoordinates(v24, (UIView *)a1[5]);
      -[AXEmojiConversionCandidateElement setAccessibilityFrame:](v11, "setAccessibilityFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
      -[AXEmojiConversionCandidateElement setTextView:](v11, "setTextView:", a1[4]);
      objc_msgSend(a1[4], "safeStringForKey:", CFSTR("text"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "substringWithRange:", a3, a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXEmojiConversionCandidateElement setCandidateString:](v11, "setCandidateString:", v13);

      -[AXEmojiConversionCandidateElement setCandidateRange:](v11, "setCandidateRange:", a3, a4);
      -[AXEmojiConversionCandidateElement setCandidateEmojiList:](v11, "setCandidateEmojiList:", v10);
      LOBYTE(v18) = 0;
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v14 = objc_claimAutoreleasedReturnValue();
      if ((_BYTE)v18)
        abort();
      v15 = (void *)v14;
      -[AXEmojiConversionCandidateElement setConversionLanguage:](v11, "setConversionLanguage:", v14);

      objc_msgSend(a1[6], "axSafelyAddObject:", v11);
    }
  }

}

void __69__CKMessageEntryTextViewAccessibility__axEmojiCandidatesFromEmojiKit__block_invoke_318(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "personalizedEmojiTokenListForList:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_axShowOverlayWithEmojiElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("anchorRect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rectValue");

  NSClassFromString(CFSTR("EMKOverlayView"));
  v9 = v4;
  v7 = v4;
  v8 = v5;
  AXPerformSafeBlock();
  objc_msgSend(v8, "setNeedsLayout");

}

void __70__CKMessageEntryTextViewAccessibility__axShowOverlayWithEmojiElement___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v2 = objc_alloc(*(Class *)(a1 + 56));
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "candidateEmojiList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CKMessageEntryTextViewAccessibility__axShowOverlayWithEmojiElement___block_invoke_2;
  v8[3] = &unk_2501B2358;
  v9 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7 = (void *)objc_msgSend(v2, "initWithView:anchorRect:emojiTokenList:selectionHandler:", v3, v4, v8, *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, CFSTR("_overlayView"));
}

void __70__CKMessageEntryTextViewAccessibility__axShowOverlayWithEmojiElement___block_invoke_2(id *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(a1[4], "setValue:forKey:", 0, CFSTR("_overlayView"));
  objc_msgSend(a1[4], "setValue:forKey:", &unk_2501CE2D0, CFSTR("_tappedGlyphIndex"));
  if (v3)
  {
    objc_msgSend(a1[5], "selectEmoji:", v3);
    objc_msgSend(a1[6], "_axReplaceEmojiWithElement:", a1[5]);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], a1[6]);

}

- (void)_axReplaceEmojiWithElement:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  CKMessageEntryTextViewAccessibility *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  UIView *v31;
  uint64_t v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "candidateRange");
  v7 = v6;
  objc_msgSend(v4, "currentEmoji");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conversionLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textKit2Controller"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = MEMORY[0x24BDAC760];
  v41 = 3221225472;
  v42 = __66__CKMessageEntryTextViewAccessibility__axReplaceEmojiWithElement___block_invoke;
  v43 = &unk_2501B23A8;
  v30 = v10;
  v44 = v30;
  v47 = v5;
  v48 = v7;
  v33 = v8;
  v45 = v33;
  v29 = v9;
  v46 = v29;
  AXPerformSafeBlock();
  v39 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (UIView *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextViewAccessibility _axRemoveElementFromEmojiCandidates:](self, "_axRemoveElementFromEmojiCandidates:", v4);
  v28 = v4;
  v12 = objc_msgSend(v4, "candidateRange");
  v32 = v13;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[CKMessageEntryTextViewAccessibility _axEmojiCandidates](self, "_axEmojiCandidates");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    v31 = v11;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "candidateRange");
        v21 = v20;
        if (v19 > v12)
        {
          v22 = v15;
          v23 = v12;
          v24 = self;
          v39 = 0;
          objc_opt_class();
          objc_msgSend(v33, "safeValueForKey:", CFSTR("string"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
            abort();
          v19 = v19 - v32 + objc_msgSend(v26, "length");

          self = v24;
          v12 = v23;
          v15 = v22;
          v11 = v31;
        }
        objc_msgSend(v18, "setCandidateRange:", v19, v21);
        -[CKMessageEntryTextViewAccessibility _axTextRangeForRange:](self, "_axTextRangeForRange:", v19, v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView firstRectForRange:](v11, "firstRectForRange:", v27);
        v52 = UIAccessibilityConvertFrameToScreenCoordinates(v51, v11);
        -[UIView convertRect:toView:](v11, "convertRect:toView:", 0, v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
        objc_msgSend(v18, "setAccessibilityFrame:");

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    }
    while (v15);
  }

}

uint64_t __66__CKMessageEntryTextViewAccessibility__axReplaceEmojiWithElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceRange:withEmojiToken:language:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_axRemoveElementFromEmojiCandidates:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKMessageEntryTextViewAccessibility _axEmojiCandidates](self, "_axEmojiCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v4);
  -[CKMessageEntryTextViewAccessibility _axSetEmojiCandidates:](self, "_axSetEmojiCandidates:", v6);

}

- (id)_accessibleNonSupplementarySubviews
{
  return 0;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  AXEmojiPlaceholderView *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  objc_super v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryTextViewAccessibility;
  -[CKMessageEntryTextViewAccessibility _accessibilitySupplementaryHeaderViews](&v18, sel__accessibilitySupplementaryHeaderViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryTextViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPlaceholderEmojiView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((UIAccessibilityIsSwitchControlRunning() || _AXSAutomationEnabled())
    && (-[CKMessageEntryTextViewAccessibility _axEmojiCandidates](self, "_axEmojiCandidates"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    -[CKMessageEntryTextViewAccessibility _axEmojiCandidates](self, "_axEmojiCandidates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4 || (objc_msgSend(v4, "window"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, !v8))
    {
      objc_msgSend(v4, "removeFromSuperview");
      -[CKMessageEntryTextViewAccessibility bounds](self, "bounds");
      v13 = -[AXEmojiPlaceholderView initWithFrame:]([AXEmojiPlaceholderView alloc], "initWithFrame:", v9 + 10.0, v11, v10 + -30.0, v12);

      -[CKMessageEntryTextViewAccessibility addSubview:](self, "addSubview:", v13);
      -[CKMessageEntryTextViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v13, CFSTR("AXPlaceholderEmojiView"));
      v4 = v13;
    }
    objc_msgSend(v4, "setAccessibilityElements:", v7);
    if ((objc_msgSend(v3, "containsObject:", v4) & 1) == 0)
    {
      v14 = (void *)MEMORY[0x24BDBCE30];
      v19[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "axArrayWithPossiblyNilArrays:", 2, v3, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v16;
    }

  }
  else
  {
    objc_msgSend(v4, "removeFromSuperview");
    -[CKMessageEntryTextViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXPlaceholderEmojiView"));
  }

  return v3;
}

@end
