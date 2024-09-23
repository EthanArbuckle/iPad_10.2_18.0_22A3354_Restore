@implementation CKMessageEntryRichTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEntryRichTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKMessageEntryView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryTextView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryRichTextView"), CFSTR("CKMessageEntryTextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryRichTextView"), CFSTR("paste:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryTextView"), CFSTR("hideCaret"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("collpasedPlaceholderLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("contentClipView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("attributedText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("setAttributedText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ChatKit.CKLinkPreviewTextAttachment"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKLinkPreviewTextAttachment"), CFSTR("viewProvider"), "Optional<CKLinkPreviewTextAttachmentViewProvider>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.CKLinkPreviewTextAttachmentViewProvider"), CFSTR("providedView"), "CKEmbeddedRichLinkView");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;

  -[CKMessageEntryRichTextViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("CKMessageEntryView")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("collpasedPlaceholderLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
    v5 = -[CKMessageEntryRichTextViewAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
  }

  return v5;
}

- (id)accessibilityIdentifier
{
  return CFSTR("messageBodyField");
}

- (id)_axMentionRotor
{
  JUMPOUT(0x23490A888);
}

- (void)_setAXMentionRotor:(id)a3
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

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  -[CKMessageEntryRichTextViewAccessibility accessibilityCustomRotors](&v18, sel_accessibilityCustomRotors);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[CKMessageEntryRichTextViewAccessibility _axMentionRotor](self, "_axMentionRotor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextViewAccessibility _axTextEffectRotor](self, "_axTextEffectRotor");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
      goto LABEL_5;
  }
  else
  {
    objc_initWeak(&location, self);
    v8 = objc_alloc(MEMORY[0x24BDF6790]);
    accessibilityLocalizedString(CFSTR("mentions.rotor.name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke;
    v15[3] = &unk_2501B1F90;
    objc_copyWeak(&v16, &location);
    v5 = (void *)objc_msgSend(v8, "initWithName:itemSearchBlock:", v9, v15);

    -[CKMessageEntryRichTextViewAccessibility _setAXMentionRotor:](self, "_setAXMentionRotor:", v5);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    if (!v7)
    {
LABEL_5:
      objc_initWeak(&location, self);
      v10 = objc_alloc(MEMORY[0x24BDF6790]);
      accessibilityLocalizedString(CFSTR("texteffects.rotor.name"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke_2;
      v13[3] = &unk_2501B1F90;
      objc_copyWeak(&v14, &location);
      v7 = (void *)objc_msgSend(v10, "initWithName:itemSearchBlock:", v11, v13);

      -[CKMessageEntryRichTextViewAccessibility _setAXTextEffectRotor:](self, "_setAXTextEffectRotor:", v7);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  objc_msgSend(v3, "axSafelyAddObject:", v5);
  objc_msgSend(v3, "axSafelyAddObject:", v7);

  return v3;
}

id __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityUpdateMentionsIfNeeded");
  objc_msgSend(WeakRetained, "_axMentionElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_10;
  objc_msgSend(v3, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "searchDirection"))
      v9 = v8 + 1;
    else
      v9 = v8 - 1;
    if ((v9 & 0x8000000000000000) != 0)
      goto LABEL_10;
  }
  if (v9 >= objc_msgSend(v5, "count"))
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDF6798]);
  objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTargetElement:", v11);

LABEL_11:
  return v10;
}

id __68__CKMessageEntryRichTextViewAccessibility_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityUpdateTextEffectsIfNeeded");
  objc_msgSend(WeakRetained, "_axTextEffectMentionElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_10;
  objc_msgSend(v3, "currentItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "targetElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "searchDirection"))
      v9 = v8 + 1;
    else
      v9 = v8 - 1;
    if ((v9 & 0x8000000000000000) != 0)
      goto LABEL_10;
  }
  if (v9 >= objc_msgSend(v5, "count"))
  {
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDF6798]);
  objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTargetElement:", v11);

LABEL_11:
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
  -[CKMessageEntryRichTextViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded");
  -[CKMessageEntryRichTextViewAccessibility _axTextEffectMentionElements](self, "_axTextEffectMentionElements");
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  -[CKMessageEntryRichTextViewAccessibility accessibilityLabel](&v24, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextViewAccessibility _accessibilityUpdateMentionsIfNeeded](self, "_accessibilityUpdateMentionsIfNeeded");
  -[CKMessageEntryRichTextViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded");
  -[CKMessageEntryRichTextViewAccessibility _axConfirmedMentionElements](self, "_axConfirmedMentionElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("mentions.count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x23490A6F0](v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[CKMessageEntryRichTextViewAccessibility _axPossibleMentionElements](self, "_axPossibleMentionElements", v20, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("possible.mentions.count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringWithFormat:", v11, objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x23490A6F0](v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  -[CKMessageEntryRichTextViewAccessibility _axTextEffectMentionElements](self, "_axTextEffectMentionElements", v21, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("texteffect.mentions.count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, objc_msgSend(v14, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  __UIAXStringForVariables();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  v3 = -[CKMessageEntryRichTextViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (-[CKMessageEntryRichTextViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hideCaret")))v4 = ~*MEMORY[0x24BEBB128];
  else
    v4 = -1;
  return v4 & v3;
}

- (void)setAttributedText:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  UIAccessibilityNotifications v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  UIAccessibilityNotifications v22;
  void *v23;
  objc_super v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v24.receiver = self;
  v24.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  -[CKMessageEntryRichTextViewAccessibility setAttributedText:](&v24, sel_setAttributedText_);
  -[CKMessageEntryRichTextViewAccessibility _setAXMentionRotor:](self, "_setAXMentionRotor:", 0);
  -[CKMessageEntryRichTextViewAccessibility _setAXTextEffectRotor:](self, "_setAXTextEffectRotor:", 0);
  -[CKMessageEntryRichTextViewAccessibility _axPossibleMentionElements](self, "_axPossibleMentionElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[CKMessageEntryRichTextViewAccessibility _axConfirmedMentionElements](self, "_axConfirmedMentionElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[CKMessageEntryRichTextViewAccessibility _axTextEffectMentionElements](self, "_axTextEffectMentionElements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[CKMessageEntryRichTextViewAccessibility _axSetPossibleMentionElements:](self, "_axSetPossibleMentionElements:", 0);
  -[CKMessageEntryRichTextViewAccessibility _axSetConfirmedMentionElements:](self, "_axSetConfirmedMentionElements:", 0);
  -[CKMessageEntryRichTextViewAccessibility _axSetTextEffectMentionElements:](self, "_axSetTextEffectMentionElements:", 0);
  -[CKMessageEntryRichTextViewAccessibility _accessibilityUpdateMentionsIfNeeded](self, "_accessibilityUpdateMentionsIfNeeded");
  -[CKMessageEntryRichTextViewAccessibility _axPossibleMentionElements](self, "_axPossibleMentionElements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[CKMessageEntryRichTextViewAccessibility _axConfirmedMentionElements](self, "_axConfirmedMentionElements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v6 != v12 || v8 != v14)
  {
    v15 = *MEMORY[0x24BEBB1D0];
    v27 = *MEMORY[0x24BDFF118];
    v28[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v15, v16);

    if (a3)
    {
      if (v8 != v14)
      {
        if (v14 <= v8)
          v17 = CFSTR("mentions.confirmed.removed");
        else
          v17 = CFSTR("mentions.confirmed.added");
        accessibilityLocalizedString(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAttribute:forKey:", &unk_2501CE2B8, *MEMORY[0x24BDFEAD8]);
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v19);

      }
    }
  }
  if (v10)
  {
    -[CKMessageEntryRichTextViewAccessibility _accessibilityUpdateTextEffectsIfNeeded](self, "_accessibilityUpdateTextEffectsIfNeeded");
    -[CKMessageEntryRichTextViewAccessibility _axTextEffectMentionElements](self, "_axTextEffectMentionElements");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v10 != v21)
    {
      v22 = *MEMORY[0x24BEBB1D0];
      v25 = *MEMORY[0x24BDFF118];
      v26 = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v22, v23);

    }
  }
}

- (void)paste:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  -[CKMessageEntryRichTextViewAccessibility paste:](&v4, sel_paste_, a3);
  -[CKMessageEntryRichTextViewAccessibility _accessibilityPostPasteboardTextForOperation:](self, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF060]);
}

- (id)accessibilityPath
{
  void *v2;
  void *v3;
  void *v4;

  -[CKMessageEntryRichTextViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_3, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("contentClipView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __60__CKMessageEntryRichTextViewAccessibility_accessibilityPath__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("CKMessageEntryView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axPossibleMentionElements
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetPossibleMentionElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axConfirmedMentionElements
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetConfirmedMentionElements:(id)a3
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

- (id)_axMentionElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE30];
  -[CKMessageEntryRichTextViewAccessibility _axPossibleMentionElements](self, "_axPossibleMentionElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextViewAccessibility _axConfirmedMentionElements](self, "_axConfirmedMentionElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayWithPossiblyNilArrays:", 2, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_accessibilityUpdateMentionsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[CKMessageEntryRichTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextViewAccessibility _axPossibleMentionElements](self, "_axPossibleMentionElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _AXCKPossibleMentions(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryRichTextViewAccessibility _axSetPossibleMentionElements:](self, "_axSetPossibleMentionElements:", v7);

  }
  -[CKMessageEntryRichTextViewAccessibility _axConfirmedMentionElements](self, "_axConfirmedMentionElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    _AXCKConfirmedMentions(v5, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryRichTextViewAccessibility _axSetConfirmedMentionElements:](self, "_axSetConfirmedMentionElements:", v9);

  }
}

- (void)_accessibilityUpdateTextEffectsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEntryRichTextViewAccessibility _axAttributedText](self, "_axAttributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToAttributedString:", v5);

  if ((v6 & 1) == 0)
  {
    _AXCKTextEffectMentions(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageEntryRichTextViewAccessibility _axSetTextEffectMentionElements:](self, "_axSetTextEffectMentionElements:", v7);

    -[CKMessageEntryRichTextViewAccessibility _axSetAttributedText:](self, "_axSetAttributedText:", v4);
  }

}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v2;
  int v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "canBecomeFirstResponder"))
    v3 = objc_msgSend(v2, "isFirstResponder") ^ 1;
  else
    LOBYTE(v3) = 0;

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;
  char v8;

  if (-[CKMessageEntryRichTextViewAccessibility _accessibilitySupportsActivateAction](self, "_accessibilitySupportsActivateAction"))
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "becomeFirstResponder");

    v8 = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFirstResponder");

    if ((v5 & 1) != 0)
      return 1;
  }
  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryRichTextViewAccessibility;
  return -[CKMessageEntryRichTextViewAccessibility accessibilityActivate](&v7, sel_accessibilityActivate);
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;
  char v11;

  v11 = 0;
  objc_opt_class();
  -[CKMessageEntryRichTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__CKMessageEntryRichTextViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke;
  v9[3] = &unk_2501B22B8;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);

  return v7;
}

void __81__CKMessageEntryRichTextViewAccessibility__accessibilitySupplementaryFooterViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDF65C0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    NSClassFromString(CFSTR("ChatKit.CKLinkPreviewTextAttachment"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("viewProvider"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("providedView"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "axSafelyAddObject:", v4);

    }
  }

}

- (BOOL)_accessibilityHoverTypingShouldAdjustDockedMode
{
  return 1;
}

@end
