@implementation WFSlotTemplateViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WFSlotTemplateView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateView"), CFSTR("textStorage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateTextStorage"), CFSTR("contents"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateView"), CFSTR("_selectSlot:notifyDelegate:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("WFSlotTemplateViewDelegate"), CFSTR("slotTemplateView:didTapTextAttachment:inSlotWithIdentifier:"), 1, 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WFSlotTemplateSlot"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateSlot"), CFSTR("isPopulated"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateSlot"), CFSTR("contentAttributedString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateSlot"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateSlot"), CFSTR("localizedPlaceholder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateSlot"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateView"), CFSTR("showsDisclosureArrow"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateView"), CFSTR("disclosureArrowIsOpen"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFSlotTemplateView"), CFSTR("didTapDisclosureArrow"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WFVariableAttachment"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFVariableAttachment"), CFSTR("variable"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WFVariable"), CFSTR("nameIncludingPropertyName"), "@", 0);

}

- (void)_accessibilityEnumerateContentsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v16 = 0;
  objc_opt_class();
  -[WFSlotTemplateViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("textStorage.contents"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }

}

- (id)_accessibilityLocalizedPlaceholderNameForSlot:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("localizedName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "safeStringForKey:", CFSTR("localizedPlaceholder"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__0;
  v5[4] = __Block_byref_object_dispose__0;
  v6 = 0;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  AXPerformSafeBlock();
  MEMORY[0x2349257DC](v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v5, 8);
  return v2;
}

void __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_2;
  v4[3] = &unk_2503EA508;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_accessibilityEnumerateContentsWithBlock:", v4);

}

void __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  char v23;

  v4 = a2;
  NSClassFromString(CFSTR("WFSlotTemplateSlot"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPopulated")))
    {
      v23 = 0;
      objc_opt_class();
      objc_msgSend(v4, "safeValueForKey:", CFSTR("contentAttributedString"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "attributesAtIndex:effectiveRange:", 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8)
      {
        v9 = *MEMORY[0x24BDF65C0];
        v10 = objc_msgSend(v6, "length");
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_3;
        v22[3] = &unk_2503EA4E0;
        v22[4] = *(_QWORD *)(a1 + 48);
        objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v10, 0, v22);
      }
      else
      {
        objc_msgSend(v6, "string");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

      }
    }
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_accessibilityLocalizedPlaceholderNameForSlot:", v4);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

    }
  }
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(_QWORD *)(v17 + 40);
  v18 = (id *)(v17 + 40);
  if (!v19)
    objc_storeStrong(v18, a2);
  objc_msgSend(*(id *)(a1 + 40), "axSafelyAddObject:");
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

}

void __53__WFSlotTemplateViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  NSClassFromString(CFSTR("WFVariableAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("variable.nameIncludingPropertyName"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)accessibilityCustomActions
{
  void *v3;
  uint64_t v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[10];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__0;
  v15[4] = __Block_byref_object_dispose__0;
  v16 = 0;
  v4 = MEMORY[0x24BDAC760];
  v12[5] = MEMORY[0x24BDAC760];
  v12[6] = 3221225472;
  v12[7] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke;
  v12[8] = &unk_2503EA530;
  v12[9] = self;
  v14 = v15;
  v5 = v3;
  v13 = v5;
  AXPerformSafeBlock();
  if (-[WFSlotTemplateViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("showsDisclosureArrow")))
  {
    if (-[WFSlotTemplateViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("disclosureArrowIsOpen")))v6 = CFSTR("shortcut.show.less");
    else
      v6 = CFSTR("shortcut.show.more");
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_10;
    v12[3] = &unk_2503EA648;
    v12[4] = self;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:actionHandler:", v7, v12);
    objc_msgSend(v5, "axSafelyAddObject:", v8);

  }
  v9 = v13;
  v10 = v5;

  _Block_object_dispose(v15, 8);
  return v10;
}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  __int128 v3;
  _QWORD v4[5];
  __int128 v5;

  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_2;
  v4[3] = &unk_2503EA620;
  v4[4] = v1;
  v3 = *(_OWORD *)(a1 + 40);
  v2 = (id)v3;
  v5 = v3;
  objc_msgSend(v1, "_accessibilityEnumerateContentsWithBlock:", v4);

}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  char v37;

  v3 = a2;
  NSClassFromString(CFSTR("WFSlotTemplateSlot"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityLocalizedPlaceholderNameForSlot:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("edit.shortcut.action"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPopulated"), v4, CFSTR("__AXStringForVariablesSentinel")))
    {
      v37 = 0;
      objc_opt_class();
      objc_msgSend(v3, "safeValueForKey:", CFSTR("contentAttributedString"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "attributesAtIndex:effectiveRange:", 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (v10)
      {
        v11 = *MEMORY[0x24BDF65C0];
        v12 = objc_msgSend(v8, "length");
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_3;
        v31[3] = &unk_2503EA5A8;
        v13 = v6;
        v36 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(a1 + 32);
        v32 = v13;
        v33 = v14;
        v34 = v3;
        v35 = *(id *)(a1 + 40);
        objc_msgSend(v8, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v31);

      }
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(v8, "string");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        __AXStringForVariables();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_alloc(MEMORY[0x24BDF6788]);
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_6;
        v29[3] = &unk_2503EA5F8;
        v29[4] = *(_QWORD *)(a1 + 32);
        v30 = v3;
        v17 = objc_msgSend(v16, "initWithName:actionHandler:", v15, v29, v26, CFSTR("__AXStringForVariablesSentinel"));
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v19 = *(void **)(v18 + 40);
        *(_QWORD *)(v18 + 40) = v17;

        objc_msgSend(*(id *)(a1 + 40), "axSafelyAddObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      }

    }
    else
    {
      v20 = objc_alloc(MEMORY[0x24BDF6788]);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_8;
      v27[3] = &unk_2503EA5F8;
      v27[4] = *(_QWORD *)(a1 + 32);
      v28 = v3;
      v21 = objc_msgSend(v20, "initWithName:actionHandler:", v6, v27);
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = v21;

      objc_msgSend(*(id *)(a1 + 40), "axSafelyAddObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }

  }
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = 0;

}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v3 = a2;
  NSClassFromString(CFSTR("WFVariableAttachment"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("variable.nameIncludingPropertyName"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    __AXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_4;
    v11[3] = &unk_2503EA580;
    v11[4] = *(_QWORD *)(a1 + 40);
    v12 = v3;
    v13 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "initWithName:actionHandler:", v6, v11, v5, CFSTR("__AXStringForVariablesSentinel"));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 56), "axSafelyAddObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }

}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v3;
  id v4;

  v3 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  AXPerformSafeBlock();

  return 1;
}

void __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "safeValueForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slotTemplateView:didTapTextAttachment:inSlotWithIdentifier:", v2, v3, v4);

}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectSlot:notifyDelegate:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_8(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectSlot:notifyDelegate:", *(_QWORD *)(a1 + 40), 1);
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_10()
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __61__WFSlotTemplateViewAccessibility_accessibilityCustomActions__block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapDisclosureArrow");
}

@end
