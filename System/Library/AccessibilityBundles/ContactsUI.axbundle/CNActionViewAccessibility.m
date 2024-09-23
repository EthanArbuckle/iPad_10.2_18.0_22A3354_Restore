@implementation CNActionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNActionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionView"), CFSTR("platterBoxView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionView"), CFSTR("disabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionView"), CFSTR("type"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionView"), CFSTR("setTitle:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CNActionView"), CFSTR("style"), "q");
  objc_msgSend(v3, "validateClass:", CFSTR("CNActionsView"));
  objc_msgSend(v3, "validateClass:", CFSTR("CNFaceTimeCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionView"), CFSTR("actionDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionsView"), CFSTR("actionsDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNContactInlineActionsViewController"), CFSTR("defaultActionPerType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNActionsView"), CFSTR("didPressActionView: longPress:"), "v", "@", "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_axActionItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CNActionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23490B8B0](CFSTR("CNActionsView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("actionsDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("defaultActionPerType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  -[CNActionViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23490B8B0](CFSTR("CNFaceTimeCell"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  labelForActionType(v6, v3 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && objc_msgSend(v5, "_accessibilityViewIsVisible"))
  {
    -[CNActionViewAccessibility _axActionItem](self, "_axActionItem");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9
      || (v10 = (void *)v9, v11 = objc_msgSend(v8, "localizedCaseInsensitiveCompare:", v7), v10, !v11))
    {
      v19 = v8;
      goto LABEL_11;
    }
    -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    labelForActionType(v12, v3 != 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      objc_msgSend(v14, "lowercaseString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "containsString:", v17);

      if (v18)
      {

        v13 = 0;
      }
    }
    __UIAXStringForVariables();
    v19 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    labelForActionType(v13, v3 != 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v19;
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v4, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23490B8D4]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNActionViewAccessibility;
    -[CNActionViewAccessibility accessibilityUserInputLabels](&v8, sel_accessibilityUserInputLabels);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *MEMORY[0x24BDF73B0];
  v3 = -[CNActionViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("disabled"));
  v4 = *MEMORY[0x24BDF73E8];
  if (!v3)
    v4 = 0;
  return v4 | v2;
}

- (void)_accessibilityLongPressActionView:(id)a3
{
  id v3;
  void *v4;

  -[CNActionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("actionDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

void __63__CNActionViewAccessibility__accessibilityLongPressActionView___block_invoke(uint64_t a1)
{
  id v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "accessibilityFrame");
    UIRectGetCenter();
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_accessibilityShowContextMenuForElement:targetPointValue:", *(_QWORD *)(a1 + 40), v2);
    objc_msgSend(*(id *)(a1 + 32), "didPressActionView:longPress:", *(_QWORD *)(a1 + 40), 1);

  }
}

- (id)_accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNActionViewAccessibility _axActionItem](self, "_axActionItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("modify.selection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel__accessibilityLongPressActionView_);

    objc_msgSend(v3, "axSafelyAddObject:", v7);
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNActionViewAccessibility;
  -[CNActionViewAccessibility setTitle:](&v3, sel_setTitle_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
