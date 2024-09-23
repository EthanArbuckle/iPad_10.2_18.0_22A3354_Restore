@implementation CNAccountsAndGroupsCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNAccountsAndGroupsCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsCell"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsCell"), CFSTR("titleTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsCell"), CFSTR("beginEditingName"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsItem"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsItem"), CFSTR("contactCountString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsItem"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsViewController"), CFSTR("isCollectionViewEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsViewController"), CFSTR("actionsProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNAccountsAndGroupsActionsProvider"), CFSTR("actionsForItem:cell:"), "@", "@", "@", 0);

}

- (id)accessibilityValue
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[CNAccountsAndGroupsCellAccessibility _axIsPlaceholderCell](self, "_axIsPlaceholderCell")
    || -[CNAccountsAndGroupsCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    -[CNAccountsAndGroupsCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityValue");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNAccountsAndGroupsCellAccessibility _accessibilitySafeItem](self, "_accessibilitySafeItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("contactCountString"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;

  return v5;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  return (id)-[CNAccountsAndGroupsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleTextView"));
}

- (id)_accessibilitySafeDelegate
{
  return (id)-[CNAccountsAndGroupsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
}

- (id)_accessibilitySafeItem
{
  return (id)-[CNAccountsAndGroupsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("item"));
}

- (BOOL)isAccessibilityElement
{
  int v3;
  void *v4;

  if (-[CNAccountsAndGroupsCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    -[CNAccountsAndGroupsCellAccessibility _accessibilitySafeDelegate](self, "_accessibilitySafeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isCollectionViewEditing")) ^ 1;

  }
  return v3;
}

- (BOOL)_axIsEditing
{
  void *v3;
  void *v4;
  char v5;

  objc_opt_class();
  -[CNAccountsAndGroupsCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEditing");
  return v5;
}

- (BOOL)_axIsPlaceholderCell
{
  void *v2;
  void *v3;
  char v4;

  -[CNAccountsAndGroupsCellAccessibility _accessibilitySafeItem](self, "_accessibilitySafeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("groupPlaceholderIdentifier"));

  return v4;
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (-[CNAccountsAndGroupsCellAccessibility _axIsPlaceholderCell](self, "_axIsPlaceholderCell"))
  {
    v3 = CFSTR("list.name");
  }
  else
  {
    if (!-[CNAccountsAndGroupsCellAccessibility _axIsEditing](self, "_axIsEditing"))
    {
      -[CNAccountsAndGroupsCellAccessibility _accessibilitySafeItem](self, "_accessibilitySafeItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("name"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    v3 = CFSTR("contact.name.for.editing");
  }
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (unint64_t)accessibilityTraits
{
  void *v3;

  if (!-[CNAccountsAndGroupsCellAccessibility _axIsPlaceholderCell](self, "_axIsPlaceholderCell")
    && !-[CNAccountsAndGroupsCellAccessibility _axIsEditing](self, "_axIsEditing"))
  {
    return *MEMORY[0x24BDF73B0];
  }
  -[CNAccountsAndGroupsCellAccessibility _accessibilityTextViewTextOperationResponder](self, "_accessibilityTextViewTextOperationResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityTraits");

  _AXTraitsRemoveTrait();
  return _AXTraitsRemoveTrait();
}

- (void)beginEditingName
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAccountsAndGroupsCellAccessibility;
  -[CNAccountsAndGroupsCellAccessibility beginEditingName](&v7, sel_beginEditingName);
  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("editing.contact.format"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAccountsAndGroupsCellAccessibility accessibilityValue](self, "accessibilityValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v6);

}

- (id)accessibilityCustomActions
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (-[CNAccountsAndGroupsCellAccessibility _axIsEditing](self, "_axIsEditing"))
    return 0;
  -[CNAccountsAndGroupsCellAccessibility _accessibilitySafeDelegate](self, "_accessibilitySafeDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("actionsProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v8 = v5;
  AXPerformSafeBlock();
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_accessibilitySafeItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionsForItem:cell:", v6, *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_3;
  v9[3] = &unk_2501D8260;
  v10 = v2;
  v6 = v2;
  v7 = (void *)objc_msgSend(v3, "initWithName:image:actionHandler:", v4, v5, v9);

  return v7;
}

uint64_t __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

uint64_t __66__CNAccountsAndGroupsCellAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithSender:target:", 0, 0);
}

@end
