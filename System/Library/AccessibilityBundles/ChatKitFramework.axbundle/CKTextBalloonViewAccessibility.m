@implementation CKTextBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTextBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTextBalloonView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTextBalloonView"), CFSTR("setAttributedText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTextBalloonView"), CFSTR("prepareForDisplay"), "v", 0);

}

- (id)_axMainContentStringForSpeakThis:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  if (a3)
  {
    v3 = &stru_2501B2580;
  }
  else
  {
    -[CKTextBalloonViewAccessibility accessibilityVisibleText](self, "accessibilityVisibleText");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axMessageSender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(0, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_axReplyDescription", v3, CFSTR("__AXStringForVariablesSentinel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isAXAttributedString", v14, v7, CFSTR("__AXStringForVariablesSentinel")))
  {
    v9 = objc_msgSend(v8, "rangeOfString:", v7);
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __67__CKTextBalloonViewAccessibility__axMainContentStringForSpeakThis___block_invoke;
    v15[3] = &unk_2501B1F68;
    v11 = v10;
    v16 = v11;
    v17 = v9;
    objc_msgSend(v7, "enumerateAttributesUsingBlock:", v15);
    v12 = v11;

    v8 = v12;
  }

  return v8;
}

uint64_t __67__CKTextBalloonViewAccessibility__axMainContentStringForSpeakThis___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:withRange:", a2, *(_QWORD *)(a1 + 40) + a3, a4);
}

- (id)_axInvisibleInkDescription
{
  JUMPOUT(0x23490A888);
}

- (void)_setAXInvisibleInkDescription:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axTextEffectMentionElements
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetTextEffectMentionElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axAttributedText
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetAttributedText:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axTextEffectRotor
{
  JUMPOUT(0x23490A888);
}

- (void)_setAXTextEffectRotor:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityVisibleText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "accessibilityAttributedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityContainsOneLink")))
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v5);

      v4 = (void *)v6;
    }

  }
  UIAccessibilityConvertAttachmentsInAttributedStringToAX();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length") == 1)
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBB8]);
    v7 = v8;
  }

  return v7;
}

- (void)invisibleInkEffectViewWasUncovered
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKTextBalloonViewAccessibility;
  -[CKTextBalloonViewAccessibility invisibleInkEffectViewWasUncovered](&v5, sel_invisibleInkEffectViewWasUncovered);
  -[CKTextBalloonViewAccessibility _axMainContentStringForSpeakThis:](self, "_axMainContentStringForSpeakThis:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonViewAccessibility _setAXInvisibleInkDescription:](self, "_setAXInvisibleInkDescription:", v3);

  accessibilityLocalizedString(CFSTR("balloon.effect.invisibleink.description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonViewAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__setAXInvisibleInkDescription_, v4, 5.0);

}

- (BOOL)_axIsInvisibleInk
{
  void *v2;
  int v3;

  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("invisibleInkEffectController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("isEnabled")))
    v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isSuspended")) ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (id)_axMentionsDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axMessageForBalloon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("hasMention")))
  {
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _AXCKConfirmedMentions(v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("mentions.count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x23490A6F0](v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_axMessageProvenanceDescription
{
  void *v2;
  int v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "color");

  if (v3 == 5)
  {
    accessibilityLocalizedString(CFSTR("apple.pay.message.provenance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTextBalloonViewAccessibility _axIsInvisibleInk](self, "_axIsInvisibleInk"))
  {
    -[CKTextBalloonViewAccessibility _axInvisibleInkDescription](self, "_axInvisibleInkDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      accessibilityLocalizedString(CFSTR("balloon.effect.invisibleink.description"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_axMessageSender");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v5;
      v18 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    -[CKTextBalloonViewAccessibility _axMainContentStringForSpeakThis:](self, "_axMainContentStringForSpeakThis:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKTextBalloonViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded", v16, v18);
  -[CKTextBalloonViewAccessibility _axTextEffectMentionElements](self, "_axTextEffectMentionElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    accessibilityLocalizedString(CFSTR("texteffect.mentions.count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v7, "count");
    AXCFormattedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[CKTextBalloonViewAccessibility _axMentionsDescription](self, "_axMentionsDescription", v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axStickerDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axAcknowledgmentDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axMessageTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonViewAccessibility _axMessageProvenanceDescription](self, "_axMessageProvenanceDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)accessibilityHint
{
  void *v2;

  if (-[CKTextBalloonViewAccessibility _axIsInvisibleInk](self, "_axIsInvisibleInk"))
  {
    accessibilityLocalizedString(CFSTR("balloon.effect.invisibleink.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_accessibilityElementHelp
{
  void *v2;

  if (-[CKTextBalloonViewAccessibility _axIsInvisibleInk](self, "_axIsInvisibleInk"))
  {
    accessibilityLocalizedString(CFSTR("balloon.effect.invisibleink.hint.macos"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)isAccessibilityElement
{
  int v3;

  if (-[CKTextBalloonViewAccessibility _axIsVisibleInTapbackView](self, "_axIsVisibleInTapbackView"))
  {
    v3 = -[CKTextBalloonViewAccessibility _axIsVisibleInTapbackView](self, "_axIsVisibleInTapbackView");
    if (v3)
      LOBYTE(v3) = -[CKTextBalloonViewAccessibility _axIsTapbackBalloonView](self, "_axIsTapbackBalloonView");
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;

  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x24BDF73E0];
  v5 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityContainsOneLink"));
  v6 = *MEMORY[0x24BDF73D8];
  if (!v5)
    v6 = 0;
  v7 = v6 | v4;

  return v7;
}

- (id)_accessibilitySpeakThisString
{
  return -[CKTextBalloonViewAccessibility _axMainContentStringForSpeakThis:](self, "_axMainContentStringForSpeakThis:", 1);
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490A6E4]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityCustomRotors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);

  -[CKTextBalloonViewAccessibility _axTextEffectRotor](self, "_axTextEffectRotor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_initWeak(&location, self);
    v7 = objc_alloc(MEMORY[0x24BDF6790]);
    accessibilityLocalizedString(CFSTR("texteffects.rotor.name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __59__CKTextBalloonViewAccessibility_accessibilityCustomRotors__block_invoke;
    v15 = &unk_2501B1F90;
    objc_copyWeak(&v16, &location);
    v6 = (void *)objc_msgSend(v7, "initWithName:itemSearchBlock:", v8, &v12);

    -[CKTextBalloonViewAccessibility _setAXTextEffectRotor:](self, "_setAXTextEffectRotor:", v6, v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v3, "axSafelyAddObject:", v6);
  if (objc_msgSend(v3, "count"))
    v9 = v3;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

id __59__CKTextBalloonViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityUpdateTextEffectsIfNeeded");
  objc_msgSend(WeakRetained, "_axTextEffectMentionElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(v5, "indexOfObject:", v7);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = 0;
      }
      else
      {
        v11 = v8;
        if (objc_msgSend(v3, "searchDirection"))
          v9 = v11 + 1;
        else
          v9 = v11 - 1;
        if ((v9 & 0x8000000000000000) != 0)
          goto LABEL_12;
      }
      if (v9 < objc_msgSend(v5, "count"))
      {
        v10 = objc_alloc_init(MEMORY[0x24BDF6798]);
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setTargetElement:", v12);

LABEL_13:
        goto LABEL_14;
      }
    }
LABEL_12:
    v10 = 0;
    goto LABEL_13;
  }
  v10 = 0;
LABEL_14:

  return v10;
}

- (id)accessibilityCustomContent
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[CKTextBalloonViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded");
  -[CKTextBalloonViewAccessibility _axTextEffectMentionElements](self, "_axTextEffectMentionElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x24BDB3D68];
        accessibilityLocalizedString(CFSTR("texteffects.rotor.name"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accessibilityLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "accessibilityValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "customContentWithLabel:value:", v11, v14, v13, CFSTR("__AXStringForVariablesSentinel"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "axSafelyAddObject:", v15);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  void *v2;
  char v3;

  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("_allowCustomActionHintSpeakOverride"));

  return v3;
}

- (void)_accessibilityUpdateTextEffectsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[CKTextBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "attributedText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTextBalloonViewAccessibility _axAttributedText](self, "_axAttributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToAttributedString:", v6);

    if ((v7 & 1) == 0)
    {
      _AXCKTextEffectMentions(v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTextBalloonViewAccessibility _axSetTextEffectMentionElements:](self, "_axSetTextEffectMentionElements:", v8);

      objc_msgSend(v4, "attributedText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTextBalloonViewAccessibility _axSetAttributedText:](self, "_axSetAttributedText:", v9);

    }
  }

}

- (void)setAttributedText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKTextBalloonViewAccessibility;
  -[CKTextBalloonViewAccessibility setAttributedText:](&v4, sel_setAttributedText_, a3);
  -[CKTextBalloonViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded");
}

- (void)prepareForDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKTextBalloonViewAccessibility;
  -[CKTextBalloonViewAccessibility prepareForDisplay](&v3, sel_prepareForDisplay);
  -[CKTextBalloonViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded");
}

@end
