@implementation MailboxTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MailboxTableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxTableCell"), CFSTR("_setUnreadCount:"), "v", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewCell"), CFSTR("_accessibilityClearChildren"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxTableCell"), CFSTR("isExpandable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxTableCell"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxPickerOutlineController"), CFSTR("scene"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailMainScene"), CFSTR("splitViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("UIDimmingView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MailSplitViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MailboxTableCell"), CFSTR("UITableViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxPickerOutlineController"), CFSTR("favoritesManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxPickerOutlineController"), CFSTR("collectionHelper"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MailboxPickerOutlineController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("FavoriteItem"), CFSTR("representingMailbox"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MailboxPickerCollectionHelper"), CFSTR("favoriteItemAtIndexPath:"), "@", "@", 0);

}

- (void)setDetailsDisclosureButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MailboxTableCellAccessibility;
  v4 = a3;
  -[MailboxTableCellAccessibility setDetailsDisclosureButton:](&v9, sel_setDetailsDisclosureButton_, v4);
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("more.info.for.mail.cell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailboxTableCellAccessibility accessibilityLabel](self, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v8);

}

- (void)_setUnreadCount:(unint64_t)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MailboxTableCellAccessibility;
  -[MailboxTableCellAccessibility _setUnreadCount:](&v5, sel__setUnreadCount_, a3);
  v4 = (id)-[MailboxTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityClearChildren"));
}

- (BOOL)_accessibilityMailboxUsesUnreadCount
{
  uint64_t v2;
  char v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  _QWORD v11[5];
  id v12;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__2;
  v11[4] = __Block_byref_object_dispose__2;
  v12 = 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  AXPerformSafeBlock();
  v2 = objc_msgSend((id)v6[5], "type");
  v3 = 0;
  if ((unint64_t)(v2 - 5) >= 2 && (unint64_t)(v2 - 105) >= 2)
  {
    NSClassFromString(CFSTR("FavoriteItem_SharedMailbox"));
    v3 = objc_opt_isKindOfClass() ^ 1;
  }
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(v11, 8);
  return v3 & 1;
}

void __69__MailboxTableCellAccessibility__accessibilityMailboxUsesUnreadCount__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_8, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "indexPathForCell:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("collectionHelper"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "favoriteItemAtIndexPath:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_opt_class();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "safeValueForKey:", CFSTR("representingMailbox"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
}

uint64_t __69__MailboxTableCellAccessibility__accessibilityMailboxUsesUnreadCount__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MailboxPickerOutlineController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[MailboxTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MailboxTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;

  -[MailboxTableCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_unreadCountLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  v6 = -[MailboxTableCellAccessibility _accessibilityMailboxUsesUnreadCount](self, "_accessibilityMailboxUsesUnreadCount");
  if (v5 < 1)
  {
    v10 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    if (v6)
      v8 = CFSTR("unread.count");
    else
      v8 = CFSTR("num.messages");
    accessibilityLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[MailboxTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpandable")))
  {
    if (-[MailboxTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded")))
      v11 = CFSTR("mailbox.cell.expanded");
    else
      v11 = CFSTR("mailbox.cell.collapsed");
    accessibilityLocalizedString(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MailboxTableCellAccessibility;
  v3 = -[MailboxTableCellAccessibility accessibilityTraits](&v12, sel_accessibilityTraits);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tintAdjustmentMode");
  v6 = *MEMORY[0x24BDF73E8];
  if (v5 != 2)
    v6 = 0;
  v7 = v6 | v3;
  if (objc_msgSend(v4, "isSelected") && objc_msgSend(v4, "isEditing"))
    v7 |= *MEMORY[0x24BDF7400];
  v8 = -[MailboxTableCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpandable"));
  v9 = *MEMORY[0x24BDF73C0];
  if (!v8)
    v9 = 0;
  v10 = v9 | v7;

  return v10;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  objc_super v4;

  if ((-[MailboxTableCellAccessibility isEditing](self, "isEditing") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)MailboxTableCellAccessibility;
  return -[MailboxTableCellAccessibility _accessibilityScannerActivateBehavior](&v4, sel__accessibilityScannerActivateBehavior);
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  -[MailboxTableCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_253, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("scene.splitViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __59__MailboxTableCellAccessibility_accessibilityPerformEscape__block_invoke_2;
  v9[3] = &unk_250285CE8;
  v9[4] = &v10;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  LOBYTE(v6) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

uint64_t __59__MailboxTableCellAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MailboxPickerOutlineController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __59__MailboxTableCellAccessibility_accessibilityPerformEscape__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  NSClassFromString(CFSTR("UIDimmingView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    objc_msgSend(v6, "accessibilityActivate");
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  }

}

@end
