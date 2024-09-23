@implementation UITableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UITableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axShouldForceRefreshChildren
{
  return __UIAccessibilityGetAssociatedBool() & 1;
}

- (void)_axSetShouldForceRefreshChildren:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const char *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *v8;
  const char *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *v15;
  const char *v16;
  const __CFString *v17;
  const char *v18;
  id v19;
  id *v20;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v20 = location;
  v19 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = "@";
  v10 = CFSTR("UITableView");
  v15 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  v18 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_draggingReorderingCell:yDelta:touch:"), v16, "d", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_endReorderingForCell:wasCancelled:animated:"), v18, v16, v15, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_dragAndDropUsedForReordering"), v15, 0);
  v17 = CFSTR("UITableViewCell");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v11 = CFSTR("UIView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_checkmarkImage:"), v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_manuallyManagesSwipeUI"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("prepareForReuse"), v18, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITableViewRowAction"), CFSTR("_handler"), "@?", 0);
  v3 = "UIControl";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v17, CFSTR("_editingAccessoryView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v17, CFSTR("_accessoryView"), v3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_defaultAccessoryView"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("setShowingDeleteConfirmation:"), v18, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_setShowingDeleteConfirmation:"), v18, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_tableView"), v16, 0);
  v4 = CFSTR("UITable_UITableViewCellDelegate");
  objc_msgSend(location[0], "validateClass:conformsToProtocol:", v10);
  v5 = CFSTR("UICollectionViewTableCell");
  objc_msgSend(location[0], "validateClass:conformsToProtocol:");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_editableTextField:"), v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_textLabel:"), v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_detailTextLabel:"), v16, v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_imageView:"), v16, v15, 0);
  objc_msgSend(location[0], "validateClass:", v5);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_setSwipeContainerView:"), v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:"), v16, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:"), v16, v16, 0);
  v6 = CFSTR("UISwipeActionController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v6, CFSTR("_swipedViewForItemAtIndexPath:"), v16, 0);
  v7 = CFSTR("UISwipeOccurrence");
  v8 = "UISwipeActionPullView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v7, CFSTR("_leadingPullView"), v8);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", CFSTR("UISwipeActionPullView"), CFSTR("_buttons"), "NSMutableArray");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("swipeActionController:didEndSwipeForItemAtIndexPath:"), v18, v16, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("swipeActionController:willBeginSwipeForItemAtIndexPath:"), v18, v16, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_dragController"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_dropController"), v16, 0);
  v9 = "{CGPoint=dd}";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_canBeginDragAtPoint:indexPath:"), v15, "{CGPoint=dd}", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_targetIndexPathAtPoint:withLastTargetIndexPath:adjustedForGap:"), v9, v16, v15, 0);
  objc_msgSend(location[0], "validateClass:", CFSTR("_UITableViewDragController"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("canPerformAction:withSender:"), v15, ":", v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("canBecomeFocused"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("preferredFocusedView"), v16, 0);
  objc_msgSend(location[0], "validateClass:isKindOfClass:", v17, v11);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("_isEligibleForFocusInteraction"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v11, CFSTR("_isFocusedOrAncestorOfFocusedView"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_didUpdateFocusInContext:"), v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_accessoryViewForType:"), v16, "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("cut:"), v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("copy:"), v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("paste:"), v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v17, CFSTR("_editingData"), v16);
  v12 = CFSTR("UITableViewCellEditingData");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v12, CFSTR("_reorderControl"), "UITableViewCellReorderControl");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_accessoryManager"), v16, 0);
  v13 = CFSTR("UICellAccessoryManager");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v13, CFSTR("currentConfigurationIdentifier"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UICellAccessoryConfiguration"), CFSTR("leadingAccessories"), v16, 0);
  v14 = CFSTR("_UICellAccessory");
  objc_msgSend(location[0], "validateClass:isKindOfClass:", CFSTR("_UICellViewAccessory"));
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v14, CFSTR("view"), v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityRespondsToUserInteraction"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_setPopupMenuButton:"), v18, v16, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("_hasEditingAccessoryView"), v15, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v17, CFSTR("editControlWasClicked:"), v18, v16, 0);
  objc_storeStrong(v20, v19);
}

- (id)_accessoryViewForType:(int64_t)a3
{
  id v4;
  objc_super v5;
  id obj;
  unint64_t v7;
  SEL v8;
  UITableViewCellAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility;
  obj = -[UITableViewCellAccessibility _accessoryViewForType:](&v5, sel__accessoryViewForType_, a3);
  -[UITableViewCellAccessibility _axApplyAccessoryType:withControl:]((uint64_t)v9, v7, obj);
  v4 = obj;
  objc_storeStrong(&obj, 0);
  return v4;
}

- (void)_axApplyAccessoryType:(id)obj withControl:
{
  id location;
  unint64_t v4;
  uint64_t v5;

  v5 = a1;
  v4 = a2;
  location = 0;
  objc_storeStrong(&location, obj);
  if (v5)
  {
    objc_msgSend(location, "accessibilitySetIdentification:", 0);
    if (v4 <= 4)
      __asm { BR              X8 }
  }
  objc_storeStrong(&location, 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  unint64_t v2;
  UITableViewCellAccessibility *v3;
  id v4;
  objc_super v5;
  SEL v6;
  UITableViewCellAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[UITableViewCellAccessibility _axSetShouldForceRefreshChildren:](v7, "_axSetShouldForceRefreshChildren:", 1);
  v3 = v7;
  v2 = -[UITableViewCellAccessibility accessoryType](v7, "accessoryType");
  v4 = (id)-[UITableViewCellAccessibility safeUIViewForKey:](v7, "safeUIViewForKey:", CFSTR("_defaultAccessoryView"));
  -[UITableViewCellAccessibility _axApplyAccessoryType:withControl:]((uint64_t)v3, v2, v4);

}

- (id)_accessibilityTextLabelIfExists
{
  id v2;
  id v3[2];
  uint64_t v4;
  uint64_t *v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  id v11;
  id v12;

  v11 = a1;
  if (a1)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 838860800;
    v7 = 48;
    v8 = __Block_byref_object_copy__21;
    v9 = __Block_byref_object_dispose__21;
    v10 = 0;
    v3[1] = &v4;
    v3[0] = v11;
    AXPerformSafeBlock();
    v2 = (id)v5[5];
    objc_storeStrong(v3, 0);
    _Block_object_dispose(&v4, 8);
    objc_storeStrong(&v10, 0);
    v12 = v2;
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

void __63__UITableViewCellAccessibility__accessibilityTextLabelIfExists__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_textLabel:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityDetailTextLabelIfExists
{
  id v2;
  id v3[2];
  uint64_t v4;
  uint64_t *v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  id v11;
  id v12;

  v11 = a1;
  if (a1)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 838860800;
    v7 = 48;
    v8 = __Block_byref_object_copy__21;
    v9 = __Block_byref_object_dispose__21;
    v10 = 0;
    v3[1] = &v4;
    v3[0] = v11;
    AXPerformSafeBlock();
    v2 = (id)v5[5];
    objc_storeStrong(v3, 0);
    _Block_object_dispose(&v4, 8);
    objc_storeStrong(&v10, 0);
    v12 = v2;
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

void __69__UITableViewCellAccessibility__accessibilityDetailTextLabelIfExists__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_detailTextLabel:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityImageViewIfExists
{
  id v2;
  id v3[2];
  uint64_t v4;
  uint64_t *v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  id v11;
  id v12;

  v11 = a1;
  if (a1)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 838860800;
    v7 = 48;
    v8 = __Block_byref_object_copy__21;
    v9 = __Block_byref_object_dispose__21;
    v10 = 0;
    v3[1] = &v4;
    v3[0] = v11;
    AXPerformSafeBlock();
    v2 = (id)v5[5];
    objc_storeStrong(v3, 0);
    _Block_object_dispose(&v4, 8);
    objc_storeStrong(&v10, 0);
    v12 = v2;
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

void __63__UITableViewCellAccessibility__accessibilityImageViewIfExists__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_imageView:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityEditableTextFieldIfExists
{
  id v2;
  id v3[2];
  uint64_t v4;
  uint64_t *v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  id v11;
  id v12;

  v11 = a1;
  if (a1)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 838860800;
    v7 = 48;
    v8 = __Block_byref_object_copy__21;
    v9 = __Block_byref_object_dispose__21;
    v10 = 0;
    v3[1] = &v4;
    v3[0] = v11;
    AXPerformSafeBlock();
    v2 = (id)v5[5];
    objc_storeStrong(v3, 0);
    _Block_object_dispose(&v4, 8);
    objc_storeStrong(&v10, 0);
    v12 = v2;
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

void __71__UITableViewCellAccessibility__accessibilityEditableTextFieldIfExists__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "_editableTextField:", 0);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)_accessibilityTableViewSwitch
{
  id v2;
  id v3;
  id location[2];
  UITableViewCellAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(location[0], "_accessibilityViewIsVisibleIgnoringAXOverrides:", 1) & 1) != 0
    || (-[UITableViewCellAccessibility safeBoolForKey:](v6, "safeBoolForKey:", CFSTR("isEditing")) & 1) != 0
    && (v2 = (id)-[UITableViewCellAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("editingAccessoryView")), v3 = location[0], location[0] = v2, v3, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)&& (objc_msgSend(location[0], "_accessibilityViewIsVisibleIgnoringAXOverrides:", 1) & 1) != 0)
  {
    v7 = location[0];
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)copy:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewCellAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility copy:](&v3, sel_copy_, location[0]);
  -[UITableViewCellAccessibility _accessibilityPostPasteboardTextForOperation:](v5, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF018]);
  objc_storeStrong(location, 0);
}

- (void)cut:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewCellAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UITableViewCellAccessibility _accessibilityIgnoreNextPostPasteboardTextOperation:](v5, "_accessibilityIgnoreNextPostPasteboardTextOperation:", *MEMORY[0x24BDFF018]);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility cut:](&v3, sel_cut_, location[0]);
  -[UITableViewCellAccessibility _accessibilityPostPasteboardTextForOperation:](v5, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF020]);
  objc_storeStrong(location, 0);
}

- (void)paste:(id)a3
{
  objc_super v3;
  id location[2];
  UITableViewCellAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UITableViewCellAccessibility _accessibilityPostPasteboardTextForOperation:](v5, "_accessibilityPostPasteboardTextForOperation:", *MEMORY[0x24BDFF060]);
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility paste:](&v3, sel_paste_, location[0]);
  objc_storeStrong(location, 0);
}

- (void)selectAll:(id)a3
{
  id v3;
  UIAccessibilityNotifications notification;
  id v5;
  id location;
  SEL v7;
  UITableViewCellAccessibility *v8;

  v8 = self;
  v7 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v3 = (id)-[UITableViewCellAccessibility safeValueForKey:](v8, "safeValueForKey:", CFSTR("_tableView"));
  objc_msgSend(v3, "_performAction:forCell:sender:", v7, v8, location);

  notification = *MEMORY[0x24BDF71E8];
  v5 = accessibilityLocalizedString((id)*MEMORY[0x24BDFF088]);
  UIAccessibilityPostNotification(notification, v5);

  objc_storeStrong(&location, 0);
}

- (void)registerMockChild:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)unregisterMockChild:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)_setPopupMenuButton:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  id v12[2];
  id v13[3];
  void *v14;
  id v15;
  objc_super v16;
  id location[2];
  UITableViewCellAccessibility *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16.receiver = v18;
  v16.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility _setPopupMenuButton:](&v16, sel__setPopupMenuButton_, location[0]);
  objc_initWeak(&v15, location[0]);
  v4 = objc_loadWeakRetained(&v15);
  v5 = objc_msgSend(v4, "accessibilityTraits");

  v14 = (void *)v5;
  objc_initWeak(v13, v18);
  v3 = location[0];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__UITableViewCellAccessibility__setPopupMenuButton___block_invoke;
  v10 = &unk_24FF3EA80;
  objc_copyWeak(&v11, v13);
  objc_copyWeak(v12, &v15);
  v12[1] = v14;
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", &v6);
  objc_destroyWeak(v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(v13);
  objc_destroyWeak(&v15);
  objc_storeStrong(location, 0);
}

uint64_t __52__UITableViewCellAccessibility__setPopupMenuButton___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = 0;
  LOBYTE(v4) = 0;
  if ((objc_msgSend(WeakRetained, "_accessibilityIsUserInteractionEnabled") & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 1;
    v4 = objc_msgSend(v6, "_accessibilityIsUserInteractionEnabled") ^ 1;
  }
  if ((v5 & 1) != 0)

  if ((v4 & 1) != 0)
    return *(_QWORD *)(a1 + 48) & ~*MEMORY[0x24BDF73E8];
  else
    return *(_QWORD *)(a1 + 48);
}

- (id)_accessibilitySubviewsForAdding
{
  if (a1)
    return -[UITableViewCellAccessibility _accessibilitySubviewsForAddingWithSort:](a1, 1);
  else
    return 0;
}

- (id)_accessibilitySubviewsForAddingWithSort:(void *)a1
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  id obj;
  uint64_t v10;
  id v11;
  char v12;
  id v13;
  _QWORD __b[8];
  uint64_t v15;
  id location;
  id v17;
  char v18;
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v19 = a1;
  v18 = a2 & 1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v19, "safeValueForKey:", CFSTR("subviews"));
    v17 = (id)objc_msgSend(v11, "mutableCopyWithZone:", 0);

    location = (id)objc_msgSend(v19, "safeUIViewForKey:", CFSTR("contentView"));
    if ((objc_msgSend(location, "_accessibilityHasOrderedChildren") & 1) == 0)
    {
      objc_msgSend(v17, "removeObject:", location);
      memset(__b, 0, sizeof(__b));
      v8 = (id)objc_msgSend(v19, "safeUIViewForKey:", CFSTR("contentView"));
      obj = (id)objc_msgSend(v8, "subviews");

      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
      if (v10)
      {
        v5 = *(_QWORD *)__b[2];
        v6 = 0;
        v7 = v10;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)__b[2] != v5)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(__b[1] + 8 * v6);
          if (objc_msgSend(v17, "indexOfObjectIdenticalTo:", v15) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v17, "addObject:", v15);
          ++v6;
          if (v4 + 1 >= v7)
          {
            v6 = 0;
            v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v21, 16);
            if (!v7)
              break;
          }
        }
      }

    }
    v12 = 0;
    v3 = 0;
    if ((v18 & 1) != 0)
    {
      v13 = (id)objc_msgSend(v19, "superview");
      v12 = 1;
      v3 = v13 != 0;
    }
    if ((v12 & 1) != 0)

    if (v3)
      objc_msgSend(v19, "_accessibilitySortElementsUsingGeometry:", v17);
    v20 = v17;
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v17, 0);
  }
  else
  {
    v20 = 0;
  }
  return v20;
}

- (id)_checkmarkImage:(BOOL)a3
{
  id v4;
  objc_super v5;
  id v6;
  BOOL v7;
  SEL v8;
  UITableViewCellAccessibility *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UITableViewCellAccessibility;
  v6 = -[UITableViewCellAccessibility _checkmarkImage:](&v5, sel__checkmarkImage_, a3);
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("Checkmark"));
  v4 = v6;
  objc_storeStrong(&v6, 0);
  return v4;
}

- (int64_t)_accessibilityUserTestingChildrenCount
{
  id v3;
  int64_t v4;
  char v5;

  v5 = -[UITableViewCellAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:") & 1;
  -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXPerformingChildrenCount"));
  v3 = -[UITableViewCellAccessibility _accessibilityUserTestingChildrenInAccessibilitySortedOrder:](self, 0);
  v4 = objc_msgSend(v3, "count");

  -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", v5 & 1, CFSTR("AXPerformingChildrenCount"));
  return v4;
}

- (id)_accessibilityUserTestingChildrenInAccessibilitySortedOrder:(void *)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  char isKindOfClass;
  char v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  id obj;
  uint64_t v60;
  _QWORD v61[8];
  id v62;
  id v63;
  id v64;
  id v65;
  char v66;
  id v67;
  _QWORD v68[8];
  uint64_t v69;
  id v70;
  id v71;
  char v72;
  id v73;
  id v74;
  id v75;
  char v76;
  _QWORD v77[9];
  id v78;
  id v79;
  _QWORD v80[8];
  uint64_t v81;
  id v82;
  _QWORD v83[8];
  uint64_t v84;
  id v85;
  char v86;
  id v87;
  int v88;
  char v89;
  id v90;
  _QWORD v91[8];
  id v92;
  id location;
  _QWORD v94[8];
  id v95;
  id v96;
  id v97;
  _QWORD __b[8];
  uint64_t v99;
  id v100;
  id v101;
  id v102;
  char v103;
  void *v104;
  id v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v104 = a1;
  v103 = a2 & 1;
  if (a1)
  {
    v102 = -[UITableViewCellAccessibility _accessibilityInternalData](v104);
    v101 = (id)objc_msgSend(v104, "_accessibilityChildren");
    v100 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v101, "count"));
    memset(__b, 0, sizeof(__b));
    obj = v101;
    v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
    if (v60)
    {
      v56 = *(_QWORD *)__b[2];
      v57 = 0;
      v58 = v60;
      while (1)
      {
        v55 = v57;
        if (*(_QWORD *)__b[2] != v56)
          objc_enumerationMutation(obj);
        v99 = *(_QWORD *)(__b[1] + 8 * v57);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(v100, "addObject:", v99);
        ++v57;
        if (v55 + 1 >= v58)
        {
          v57 = 0;
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v113, 16);
          if (!v58)
            break;
        }
      }
    }

    if (*((_QWORD *)v102 + 10))
      objc_msgSend(v100, "addObjectsFromArray:", *((_QWORD *)v102 + 10));
    v97 = -[UITableViewCellAccessibility _accessibilitySubviewsForAddingWithSort:](v104, v103 & 1);
    v96 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(v94, 0, sizeof(v94));
    v53 = v97;
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v94, v112, 16);
    if (v54)
    {
      v50 = *(_QWORD *)v94[2];
      v51 = 0;
      v52 = v54;
      while (1)
      {
        v49 = v51;
        if (*(_QWORD *)v94[2] != v50)
          objc_enumerationMutation(v53);
        v95 = *(id *)(v94[1] + 8 * v51);
        if ((objc_msgSend(v95, "accessibilityElementsHidden") & 1) == 0)
        {
          location = 0;
          memset(v91, 0, sizeof(v91));
          v47 = v100;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", v91, v111, 16);
          if (v48)
          {
            v44 = *(_QWORD *)v91[2];
            v45 = 0;
            v46 = v48;
            while (1)
            {
              v43 = v45;
              if (*(_QWORD *)v91[2] != v44)
                objc_enumerationMutation(v47);
              v92 = *(id *)(v91[1] + 8 * v45);
              v89 = 0;
              v42 = 1;
              if (v92 != v95)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (v42 = 1, (objc_msgSend(v92, "_accessibilityIsViewDescendantOfElement:", v95) & 1) == 0))
                {
                  objc_opt_class();
                  v41 = 0;
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v90 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v92);
                    v89 = 1;
                    v41 = objc_msgSend(v90, "_accessibilityIsViewDescendantOfElement:", v95);
                  }
                  v42 = v41;
                }
              }
              if ((v89 & 1) != 0)

              if ((v42 & 1) != 0)
                break;
              ++v45;
              if (v43 + 1 >= v46)
              {
                v45 = 0;
                v46 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", v91, v111, 16);
                if (!v46)
                  goto LABEL_34;
              }
            }
            objc_storeStrong(&location, v92);
            v88 = 6;
          }
          else
          {
LABEL_34:
            v88 = 0;
          }

          if (!location)
            goto LABEL_45;
          objc_msgSend(v100, "removeObject:", location);
          objc_opt_class();
          v86 = 0;
          v40 = 0;
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v87 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location);
            v86 = 1;
            v40 = 0;
            if (v87 == v95)
            {
              objc_opt_class();
              isKindOfClass = 1;
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
              }
              v40 = isKindOfClass;
            }
          }
          if ((v86 & 1) != 0)

          if ((v40 & 1) != 0)
LABEL_45:
            objc_msgSend(v96, "addObject:", v95);
          else
            objc_msgSend(v96, "addObject:", location);
          objc_storeStrong(&location, 0);
        }
        ++v51;
        if (v49 + 1 >= v52)
        {
          v51 = 0;
          v52 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", v94, v112, 16);
          if (!v52)
            break;
        }
      }
    }

    objc_msgSend(v100, "addObjectsFromArray:", v96);
    v85 = (id)objc_msgSend(v104, "_accessibilitySupplementaryHeaderViews");
    memset(v83, 0, sizeof(v83));
    v36 = (id)objc_msgSend(v85, "reverseObjectEnumerator");
    v37 = (id)objc_msgSend(v36, "allObjects");

    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", v83, v110, 16);
    if (v38)
    {
      v33 = *(_QWORD *)v83[2];
      v34 = 0;
      v35 = v38;
      while (1)
      {
        v32 = v34;
        if (*(_QWORD *)v83[2] != v33)
          objc_enumerationMutation(v37);
        v84 = *(_QWORD *)(v83[1] + 8 * v34);
        objc_msgSend(v100, "insertObject:atIndex:", v84, 0);
        ++v34;
        if (v32 + 1 >= v35)
        {
          v34 = 0;
          v35 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", v83, v110, 16);
          if (!v35)
            break;
        }
      }
    }

    v82 = (id)objc_msgSend(v104, "_accessibilitySupplementaryFooterViews");
    memset(v80, 0, sizeof(v80));
    v30 = v82;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", v80, v109, 16);
    if (v31)
    {
      v27 = *(_QWORD *)v80[2];
      v28 = 0;
      v29 = v31;
      while (1)
      {
        v26 = v28;
        if (*(_QWORD *)v80[2] != v27)
          objc_enumerationMutation(v30);
        v81 = *(_QWORD *)(v80[1] + 8 * v28);
        objc_msgSend(v100, "addObject:", v81);
        ++v28;
        if (v26 + 1 >= v29)
        {
          v28 = 0;
          v29 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", v80, v109, 16);
          if (!v29)
            break;
        }
      }
    }

    v79 = (id)objc_msgSend(v104, "_accessibilityParentTableView");
    v78 = (id)objc_msgSend(v79, "_swipeActionController");
    memset(v77, 0, 0x40uLL);
    v76 = 0;
    objc_opt_class();
    v25 = (id)objc_msgSend(v78, "safeValueForKey:", CFSTR("swipeOccurrences"));
    v75 = (id)__UIAccessibilityCastAsClass();

    v74 = v75;
    objc_storeStrong(&v75, 0);
    v23 = v74;
    v24 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", v77, v108, 16);
    if (v24)
    {
      v20 = *(_QWORD *)v77[2];
      v21 = 0;
      v22 = v24;
      while (1)
      {
        v19 = v21;
        if (*(_QWORD *)v77[2] != v20)
          objc_enumerationMutation(v23);
        v77[8] = *(_QWORD *)(v77[1] + 8 * v21);
        v72 = 0;
        objc_opt_class();
        v71 = (id)__UIAccessibilityCastAsClass();
        if ((v72 & 1) != 0)
          abort();
        v70 = v71;
        objc_storeStrong(&v71, 0);
        v73 = v70;
        v17 = (id)objc_msgSend(v70, "indexPath");
        v16 = (id)objc_msgSend(v104, "_accessibilityIndexPath");
        v18 = objc_msgSend(v17, "isEqual:");

        if ((v18 & 1) != 0)
        {
          memset(v68, 0, sizeof(v68));
          v14 = &unk_24FF85EE0;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v68, v107, 16);
          if (v15)
          {
            v11 = *(_QWORD *)v68[2];
            v12 = 0;
            v13 = v15;
            while (1)
            {
              v10 = v12;
              if (*(_QWORD *)v68[2] != v11)
                objc_enumerationMutation(v14);
              v69 = *(_QWORD *)(v68[1] + 8 * v12);
              v66 = 0;
              v9 = (id)objc_msgSend(v73, "safeValueForKey:", v69);
              v65 = (id)__UIAccessibilitySafeClass();

              if ((v66 & 1) != 0)
                abort();
              v64 = v65;
              objc_storeStrong(&v65, 0);
              v67 = v64;
              v63 = (id)objc_msgSend(v64, "safeArrayForKey:", CFSTR("_buttons"));
              memset(v61, 0, sizeof(v61));
              v7 = v63;
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v61, v106, 16);
              if (v8)
              {
                v4 = *(_QWORD *)v61[2];
                v5 = 0;
                v6 = v8;
                while (1)
                {
                  v3 = v5;
                  if (*(_QWORD *)v61[2] != v4)
                    objc_enumerationMutation(v7);
                  v62 = *(id *)(v61[1] + 8 * v5);
                  objc_msgSend(v62, "setAccessibilityContainer:", v104);
                  objc_msgSend(v100, "addObject:", v62);
                  ++v5;
                  if (v3 + 1 >= v6)
                  {
                    v5 = 0;
                    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v61, v106, 16);
                    if (!v6)
                      break;
                  }
                }
              }

              objc_storeStrong(&v63, 0);
              objc_storeStrong(&v67, 0);
              ++v12;
              if (v10 + 1 >= v13)
              {
                v12 = 0;
                v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v68, v107, 16);
                if (!v13)
                  break;
              }
            }
          }

        }
        objc_storeStrong(&v73, 0);
        ++v21;
        if (v19 + 1 >= v22)
        {
          v21 = 0;
          v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v77, v108, 16);
          if (!v22)
            break;
        }
      }
    }

    v105 = v100;
    v88 = 1;
    objc_storeStrong(&v78, 0);
    objc_storeStrong(&v79, 0);
    objc_storeStrong(&v82, 0);
    objc_storeStrong(&v85, 0);
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, 0);
    objc_storeStrong(&v100, 0);
    objc_storeStrong(&v101, 0);
    objc_storeStrong(&v102, 0);
  }
  else
  {
    v105 = 0;
  }
  return v105;
}

- (id)automationElements
{
  return -[UITableViewCellAccessibility _accessibilityUserTestingChildrenInAccessibilitySortedOrder:](self, 1);
}

- (id)_accessibilityInternalData
{
  id v2;
  id v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    v2 = (id)objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
    if (!v2)
    {
      v2 = (id)objc_msgSend(objc_allocWithZone((Class)_AXTableViewCellInternal), "init");

      objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXInternalData"));
    }
    v4 = v2;
    objc_storeStrong(&v2, 0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  unint64_t v4;
  id v5;
  char v6;
  id v7;
  id v8;
  char v9;
  id v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  char v20;
  char v21;
  id v22;
  uint64_t v23;
  id v24;
  objc_super v25;
  unint64_t v26;
  SEL v27;
  UITableViewCellAccessibility *v28;

  v28 = self;
  v27 = a2;
  v26 = 0;
  v25.receiver = self;
  v25.super_class = (Class)UITableViewCellAccessibility;
  v26 = -[UITableViewCellAccessibility accessibilityTraits](&v25, sel_accessibilityTraits);
  v24 = -[UITableViewCellAccessibility _accessibilityParentTableView](v28, "_accessibilityParentTableView");
  v23 = -[UITableViewCellAccessibility accessoryType](v28, "accessoryType");
  v7 = (id)objc_msgSend(v24, "indexPathsForSelectedRows");
  v8 = -[UITableViewCellAccessibility _accessibilityIndexPath](v28, "_accessibilityIndexPath");
  v21 = 0;
  v9 = 0;
  if ((objc_msgSend(v7, "containsObject:") & 1) != 0)
  {
    v22 = (id)-[UITableViewCellAccessibility safeValueForKey:](v28, "safeValueForKey:", CFSTR("isSelected"));
    v21 = 1;
    v9 = objc_msgSend(v22, "BOOLValue");
  }
  if ((v21 & 1) != 0)

  if ((v9 & 1) != 0)
  {
    if (!v23 || v23 == 3)
      v26 |= *MEMORY[0x24BDF7400];
  }
  else
  {
    v16 = 0;
    v14 = 0;
    v12 = 0;
    v6 = 1;
    if (-[UITableViewCellAccessibility accessoryType](v28, "accessoryType") != 3)
    {
      v20 = 0;
      v5 = -[UITableViewCellAccessibility _accessibilityImageViewIfExists](v28);
      v19 = (id)__UIAccessibilitySafeClass();

      v18 = v19;
      objc_storeStrong(&v19, 0);
      v17 = v18;
      v16 = 1;
      v15 = (id)objc_msgSend(v18, "image");
      v14 = 1;
      v13 = (id)objc_msgSend(v15, "accessibilityIdentifier");
      v12 = 1;
      v6 = objc_msgSend(v13, "hasPrefix:", CFSTR("UIPreferencesBlueCheck"));
    }
    if ((v12 & 1) != 0)

    if ((v14 & 1) != 0)
    if ((v16 & 1) != 0)

    if ((v6 & 1) != 0)
      v26 |= *MEMORY[0x24BDF7400];
  }
  if ((-[UITableViewCellAccessibility _accessibilityIsButton](v28) & 1) != 0)
    v26 |= *MEMORY[0x24BDF73B0];
  v11 = -[UITableViewCellAccessibility _accessibilityTextLabelIfExists](v28);
  if (v11 && (objc_msgSend(v11, "safeBoolForKey:", CFSTR("enabled")) & 1) == 0)
    v26 |= *MEMORY[0x24BDF73E8];
  v10 = -[UITableViewCellAccessibility _accessibilityTableViewSwitch](v28, "_accessibilityTableViewSwitch");
  if (v10)
  {
    v2 = objc_msgSend(v10, "accessibilityTraits");
    v26 |= v2;
    v26 &= ~*MEMORY[0x24BEBB178];
  }
  v4 = v26;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v24, 0);
  return v4;
}

- (uint64_t)_accessibilityIsButton
{
  char v2;
  char v3;
  char v5;

  if (a1)
  {
    v3 = 1;
    if (!-[UITableViewCellAccessibility _accessibilityIsButtonAccessoryType:]((uint64_t)a1, objc_msgSend(a1, "accessoryType")))
    {
      v2 = 0;
      if (-[UITableViewCellAccessibility _accessibilityIsButtonAccessoryType:]((uint64_t)a1, objc_msgSend(a1, "editingAccessoryType")))
      {
        v2 = objc_msgSend(a1, "isEditing");
      }
      v3 = v2;
    }
    v5 = v3 & 1;
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)_accessibilityIsButtonAccessoryType:(uint64_t)a1
{
  return a1 && ((unint64_t)(a2 - 1) <= 1 || a2 == 4);
}

- (BOOL)_accessibilityIsInTableCell
{
  return 1;
}

- (_NSRange)_accessibilityIndexPathAsRange
{
  NSUInteger v2;
  NSUInteger v3;
  id location[3];
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _NSRange result;

  location[2] = self;
  location[1] = (id)a2;
  v8 = 0x7FFFFFFFLL;
  v7 = 0;
  v9 = 0x7FFFFFFFLL;
  v10 = 0;
  v5 = 0x7FFFFFFFLL;
  v6 = 0;
  location[0] = -[UITableViewCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  if (location[0])
  {
    v5 = objc_msgSend(location[0], "row");
    v6 = objc_msgSend(location[0], "section");
  }
  objc_storeStrong(location, 0);
  v2 = v5;
  v3 = v6;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)_accessibilityIsTableCell
{
  return 1;
}

- (BOOL)_accessibilityScrollToVisibleForNextElementRetrieval:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id location;
  id v29;
  id v30;
  id v31;
  char v32;
  int v33;
  CGRect v34;
  CGRect rect;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  id v45;
  int64_t v46;
  SEL v47;
  UIView *v48;
  char v49;
  CGRect v50;

  v48 = (UIView *)self;
  v47 = a2;
  v46 = a3;
  v45 = (id)-[UITableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  if ((objc_msgSend(v45, "isScrollEnabled") & 1) == 0)
    goto LABEL_7;
  objc_msgSend(v45, "frame");
  v40 = v3;
  v41 = v4;
  v42 = v5;
  v43 = v6;
  v44 = v6;
  -[UIView frame](v48, "frame");
  v36 = v7;
  v37 = v8;
  v38 = v9;
  v39 = v10;
  if (v10 >= v44)
  {
    -[UIView bounds](v48, "bounds");
    rect.origin.x = v11;
    rect.origin.y = v12;
    rect.size.width = v13;
    rect.size.height = v14;
    if (v46 == 1)
      rect.origin.y = rect.origin.y + rect.size.height - v44 / 2.0;
    else
      rect.origin.y = rect.origin.y - (rect.size.height - v44 / 2.0);
    v50 = UIAccessibilityConvertFrameToScreenCoordinates(rect, v48);
    v34 = v50;
    objc_msgSend(v45, "_accessibilityScrollToFrame:forView:", v48, v50.origin.x, v50.origin.y, v50.size.width, v50.size.height);
    objc_msgSend(v45, "_accessibilityOpaqueElementScrollCleanup");
    v49 = 1;
    v33 = 1;
  }
  else
  {
LABEL_7:
    v32 = -[UIView _accessibilityScrollToVisible](v48, "_accessibilityScrollToVisible") & 1;
    if ((objc_msgSend(v45, "isScrollEnabled") & 1) == 0)
      goto LABEL_25;
    v31 = 0;
    v30 = (id)-[UIView _accessibilityIndexPath](v48, "_accessibilityIndexPath");
    v29 = 0;
    if (v46 == 1)
    {
      v15 = -[UITableViewCellAccessibility _accessibilityNextIndexPath](v48);
      v16 = v31;
      v31 = v15;

      v17 = (id)objc_msgSend(v45, "footerViewForSection:", objc_msgSend(v30, "section"));
      v18 = v29;
      v29 = v17;

    }
    else if (v46 == 2)
    {
      v19 = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](v48);
      v20 = v31;
      v31 = v19;

      v21 = (id)objc_msgSend(v45, "headerViewForSection:", objc_msgSend(v30, "section"));
      v22 = v29;
      v29 = v21;

    }
    v27 = objc_msgSend(v30, "section");
    if (v27 == objc_msgSend(v31, "section") || !v29)
    {
      location = (id)objc_msgSend(v45, "indexPathsForVisibleRows");
      if (!v31
        || (objc_msgSend(location, "containsObject:", v31) & 1) != 0
        || (v26 = objc_msgSend(v31, "section"), v26 >= objc_msgSend(v45, "numberOfSections"))
        || (v25 = objc_msgSend(v31, "row"),
            v25 >= objc_msgSend(v45, "numberOfRowsInSection:", objc_msgSend(v31, "section"))))
      {
        v33 = 0;
      }
      else
      {
        v23 = 3;
        if (v46 != 1)
          v23 = 1;
        objc_msgSend(v45, "scrollToRowAtIndexPath:atScrollPosition:animated:", v31, v23, 0);
        objc_msgSend(v45, "_accessibilityOpaqueElementScrollCleanup");
        v49 = 1;
        v33 = 1;
      }
      objc_storeStrong(&location, 0);
    }
    else
    {
      v49 = v32 & 1;
      v33 = 1;
    }
    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
    objc_storeStrong(&v31, 0);
    if (!v33)
    {
LABEL_25:
      v49 = v32 & 1;
      v33 = 1;
    }
  }
  objc_storeStrong(&v45, 0);
  return v49 & 1;
}

- (id)_accessibilityNextIndexPath
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id location;
  id v11;
  id v12;
  id v13;

  v12 = a1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v12, "_accessibilityParentTableView");
    location = (id)objc_msgSend(v12, "_accessibilityIndexPath");
    if (v11 && location)
    {
      v7 = objc_msgSend(v11, "numberOfRowsInSection:", objc_msgSend(location, "section"));
      if (v7 <= objc_msgSend(location, "row") + 1)
      {
        v6 = objc_msgSend(v11, "numberOfSections");
        if (v6 > objc_msgSend(location, "section") + 1)
        {
          v8 = objc_msgSend(location, "section") + 1;
          if (objc_msgSend(v11, "numberOfRowsInSection:", v8) > 0)
          {
            v3 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, v8);
            v4 = location;
            location = v3;

          }
        }
      }
      else
      {
        v9 = objc_msgSend(location, "row") + 1;
        v1 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v9, objc_msgSend(location, "section"));
        v2 = location;
        location = v1;

      }
      v13 = location;
    }
    else
    {
      v13 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v11, 0);
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)_accessibilityPreviousIndexPath
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id location;
  id v10;
  id v11;
  id v12;

  v11 = a1;
  if (a1)
  {
    v10 = (id)objc_msgSend(v11, "_accessibilityParentTableView");
    location = (id)objc_msgSend(v11, "_accessibilityIndexPath");
    if (v10 && location)
    {
      if (objc_msgSend(location, "row") <= 0)
      {
        if (!objc_msgSend(location, "row") && objc_msgSend(location, "section") > 0)
        {
          v7 = objc_msgSend(location, "section") - 1;
          v6 = objc_msgSend(v10, "numberOfRowsInSection:", v7) - 1;
          if (v6 >= 0)
          {
            v3 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v6, v7);
            v4 = location;
            location = v3;

          }
        }
      }
      else
      {
        v8 = objc_msgSend(location, "row") - 1;
        v1 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, objc_msgSend(location, "section"));
        v2 = location;
        location = v1;

      }
      v12 = location;
    }
    else
    {
      v12 = 0;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)_accessibilityClearChildren
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id obj;
  uint64_t v7;
  id v8;
  id WeakRetained;
  char v10;
  _QWORD __b[8];
  id v12;
  id v13[3];
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13[2] = self;
  v13[1] = (id)a2;
  v13[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  if (v13[0])
  {
    objc_msgSend(*((id *)v13[0] + 6), "setAccessibilityContainer:");
    objc_msgSend(*((id *)v13[0] + 3), "setAccessibilityContainer:", 0);
    objc_msgSend(*((id *)v13[0] + 5), "setAccessibilityContainer:", 0);
    objc_msgSend(*((id *)v13[0] + 4), "setAccessibilityContainer:", 0);
    -[UITableTextAccessibilityElement setTextDelegate:](*((id **)v13[0] + 4), 0);
    -[UITableTextAccessibilityElement setAttributeDelegate:](*((id **)v13[0] + 4), 0);
    WeakRetained = objc_loadWeakRetained((id *)v13[0] + 8);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)v13[0] + 8);
      objc_msgSend(v8, "unregisterAllChildren");

    }
    memset(__b, 0, sizeof(__b));
    obj = *((id *)v13[0] + 1);
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
    if (v7)
    {
      v3 = *(_QWORD *)__b[2];
      v4 = 0;
      v5 = v7;
      while (1)
      {
        v2 = v4;
        if (*(_QWORD *)__b[2] != v3)
          objc_enumerationMutation(obj);
        v12 = *(id *)(__b[1] + 8 * v4);
        objc_msgSend(v12, "setAccessibilityContainer:", 0);
        ++v4;
        if (v2 + 1 >= v5)
        {
          v4 = 0;
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v14, 16);
          if (!v5)
            break;
        }
      }
    }

    objc_msgSend(*((id *)v13[0] + 1), "removeAllObjects");
    objc_msgSend(*((id *)v13[0] + 7), "removeAllObjects");
    objc_msgSend(*((id *)v13[0] + 10), "removeAllObjects");
    objc_storeStrong((id *)v13[0] + 5, 0);
    objc_storeStrong((id *)v13[0] + 3, 0);
    objc_storeStrong((id *)v13[0] + 6, 0);
    objc_storeStrong((id *)v13[0] + 4, 0);
    objc_storeWeak((id *)v13[0] + 8, 0);
    objc_storeStrong(v13, 0);
  }
  objc_storeStrong(v13, 0);
}

- (void)_accessibilityReevaluateChildren
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id obj;
  uint64_t v14;
  id location;
  _QWORD v16[8];
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  _QWORD __b[8];
  id v22;
  char v23;
  id v24;
  char v25;
  void *v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = a1;
  if (a1 && (objc_msgSend(v26, "_accessibilityBoolValueForKey:", CFSTR("InDealloc")) & 1) == 0)
  {
    v25 = 0;
    v24 = -[UITableViewCellAccessibility _accessibilitySubviewsForAddingWithSort:](v26, 0);
    v23 = 0;
    memset(__b, 0, sizeof(__b));
    obj = v24;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    if (v14)
    {
      v10 = *(_QWORD *)__b[2];
      v11 = 0;
      v12 = v14;
      while (1)
      {
        v9 = v11;
        if (*(_QWORD *)__b[2] != v10)
          objc_enumerationMutation(obj);
        v22 = *(id *)(__b[1] + 8 * v11);
        if ((objc_msgSend(v22, "isAccessibilityElement") & 1) != 0)
          v23 = 1;
        ++v11;
        if (v9 + 1 >= v12)
        {
          v11 = 0;
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v12)
            break;
        }
      }
    }

    v20 = objc_msgSend(v26, "accessoryType");
    if (v20 == 2 || v20 == 4)
      v23 = 1;
    if ((v23 & 1) != 0)
    {
      v18 = -[UITableViewCellAccessibility _accessibilityInternalData](v26);
      memset(v16, 0, sizeof(v16));
      v7 = *((id *)v18 + 1);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v16, v27, 16);
      if (v8)
      {
        v4 = *(_QWORD *)v16[2];
        v5 = 0;
        v6 = v8;
        while (1)
        {
          v3 = v5;
          if (*(_QWORD *)v16[2] != v4)
            objc_enumerationMutation(v7);
          v17 = *(id *)(v16[1] + 8 * v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            location = v17;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v1 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v17);
              v2 = location;
              location = v1;

            }
            if (location && objc_msgSend(v24, "indexOfObject:", location) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v19 = 0;
            }
            else
            {
              v25 = 1;
              v19 = 4;
            }
            objc_storeStrong(&location, 0);
            if (v19)
              break;
          }
          ++v5;
          if (v3 + 1 >= v6)
          {
            v5 = 0;
            v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", v16, v27, 16);
            if (!v6)
              goto LABEL_30;
          }
        }
      }
      else
      {
LABEL_30:
        v19 = 0;
      }

      if ((v25 & 1) != 0)
        objc_msgSend(v26, "_accessibilityClearChildren");
      objc_storeStrong(&v18, 0);
      v19 = 0;
    }
    else
    {
      v19 = 1;
    }
    objc_storeStrong(&v24, 0);
  }
}

- (void)_accessibilitySwitchMockView:(void *)a3 toParent:(void *)a4 withPossibleSubviews:
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v21;
  int v22;
  int v23;
  BOOL (*v24)(id *, void *);
  void *v25;
  id v26;
  uint64_t v27;
  char v28;
  id v29;
  char v30;
  id v31;
  char v32;
  id v33;
  char v34;
  id v35;
  char v36;
  _QWORD __b[8];
  void *v38;
  uint64_t v39;
  id v40;
  int v41;
  id v42;
  id v43;
  id location;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v45 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v43 = 0;
  objc_storeStrong(&v43, a3);
  v42 = 0;
  objc_storeStrong(&v42, a4);
  if (v45)
  {
    if (!v43 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v40 = -[UITableViewCellAccessibility _accessibilityInternalData](v45);
      objc_msgSend(location, "setAccessibilityContainer:", v43);
      objc_msgSend(v43, "registerMockChild:", location);
      v16 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location);
      v39 = objc_opt_class();

      memset(__b, 0, sizeof(__b));
      v17 = v42;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
      if (v18)
      {
        v13 = *(_QWORD *)__b[2];
        v14 = 0;
        v15 = v18;
        while (1)
        {
          v12 = v14;
          if (*(_QWORD *)__b[2] != v13)
            objc_enumerationMutation(v17);
          v38 = *(void **)(__b[1] + 8 * v14);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (objc_msgSend(v45, "_accessibilityLabelShouldBeDistinct:", v38) & 1) != 0)
          {
            v36 = 0;
            v11 = 1;
            if ((objc_msgSend(v38, "isAccessibilityElement") & 1) == 0)
              v11 = objc_msgSend(v38, "_accessibilityHasOrderedChildren");
            v36 = v11 & 1;
            v34 = 0;
            v32 = 0;
            v30 = 0;
            v28 = 0;
            v10 = 0;
            if ((v11 & 1) != 0)
            {
              v10 = 0;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v8 = (id)objc_msgSend(location, "accessibilityLabel");
                v35 = v8;
                v34 = 1;
                v33 = (id)objc_msgSend(v38, "_accessibilityAXAttributedLabel");
                v32 = 1;
                v9 = 1;
                if (v8 != v33)
                {
                  v7 = (id)objc_msgSend(location, "accessibilityLabel");
                  v31 = v7;
                  v30 = 1;
                  v29 = (id)objc_msgSend(v38, "_accessibilityAXAttributedLabel");
                  v28 = 1;
                  v9 = objc_msgSend(v7, "isEqualToString:");
                }
                v10 = v9;
              }
            }
            if ((v28 & 1) != 0)

            if ((v30 & 1) != 0)
            if ((v32 & 1) != 0)

            if ((v34 & 1) != 0)
            if ((v10 & 1) != 0)
            {
              v27 = 0;
              v6 = (void *)*((_QWORD *)v40 + 7);
              v21 = MEMORY[0x24BDAC760];
              v22 = -1073741824;
              v23 = 0;
              v24 = __91__UITableViewCellAccessibility__accessibilitySwitchMockView_toParent_withPossibleSubviews___block_invoke;
              v25 = &unk_24FF3F6A0;
              v26 = v38;
              v27 = objc_msgSend(v6, "indexOfObjectPassingTest:", &v21);
              if (v27 == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ((objc_msgSend(v38, "_accessibilityHasOrderedChildren") & 1) != 0)
                {
                  v4 = v38;
                  v5 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location);
                  objc_msgSend(v4, "_accessibilitySwitchOrderedChildrenFrom:");

                }
                -[UIAccessibilityElementMockView setView:]((id *)location, v38);
                v41 = 4;
              }
              else
              {
                v41 = 0;
              }
              objc_storeStrong(&v26, 0);
              if (v41)
                break;
            }
          }
          ++v14;
          if (v12 + 1 >= v15)
          {
            v14 = 0;
            v15 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", __b, v46, 16);
            if (!v15)
              goto LABEL_36;
          }
        }
      }
      else
      {
LABEL_36:
        v41 = 0;
      }

      objc_storeStrong(&v40, 0);
      v41 = 0;
    }
    else
    {
      _AXAssert();
      v41 = 1;
    }
  }
  else
  {
    v41 = 1;
  }
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&location, 0);
}

BOOL __91__UITableViewCellAccessibility__accessibilitySwitchMockView_toParent_withPossibleSubviews___block_invoke(id *a1, void *a2)
{
  id v2;
  BOOL v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location[0]);
  v5 = v2 == a1[4];

  objc_storeStrong(location, 0);
  return v5;
}

- (void)prepareForReuse
{
  id v2;
  id WeakRetained;
  BOOL v4;
  char v5;
  UITableViewCellAccessibility *v6;
  char v7;
  id v8;
  id *v9;
  objc_super v10;
  SEL v11;
  UITableViewCellAccessibility *v12;

  v12 = self;
  v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility prepareForReuse](&v10, sel_prepareForReuse);
  v9 = (id *)-[UITableViewCellAccessibility _accessibilityInternalData](v12);
  WeakRetained = objc_loadWeakRetained(v9 + 8);
  objc_opt_class();
  v7 = 0;
  v5 = 0;
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_loadWeakRetained(v9 + 8);
    v7 = 1;
    v6 = (UITableViewCellAccessibility *)-[UITableViewCellAccessibilityElement existingTableViewCell]((uint64_t)v8);
    v5 = 1;
    v4 = v6 == v12;
  }
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if (v4)
  {
    v2 = objc_loadWeakRetained(v9 + 8);
    objc_msgSend(v2, "setTableViewCell:", 0);

  }
  objc_storeWeak(v9 + 8, 0);
  objc_storeStrong(v9 + 10, 0);
  -[UITableViewCellAccessibility _accessibilityRemoveValueForKey:](v12, "_accessibilityRemoveValueForKey:", CFSTR("AXIsShowingSelectedBackground"));
  -[UITableViewCellAccessibility _accessibilityClearChildren](v12, "_accessibilityClearChildren");
  objc_storeStrong((id *)&v9, 0);
}

- (void)_didRemoveSubview:(id)a3
{
  id v3;
  BOOL v4;
  objc_super v5;
  id location[2];
  UITableViewCellAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility _didRemoveSubview:](&v5, sel__didRemoveSubview_, location[0]);
  v3 = -[UITableViewCellAccessibility _accessibilityInternalDataRetrieveOnly](v7);
  v4 = v3 == 0;

  if (!v4)
    -[UITableViewCellAccessibility _accessibilityReevaluateChildren](v7);
  objc_storeStrong(location, 0);
}

- (id)_accessibilityInternalDataRetrieveOnly
{
  if (a1)
    return (id)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
  else
    return 0;
}

- (uint64_t)_accessibilityTableViewIsOpaque
{
  id v2;
  char v3;

  if (a1)
  {
    v2 = (id)objc_msgSend(a1, "_accessibilityParentTableView");
    v3 = objc_msgSend(v2, "isAccessibilityOpaqueElementProvider") & 1;

  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

- (void)_accessibilityReuseChildren:(void *)a3 forMockParent:
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  BOOL v26;
  _QWORD v27[8];
  void *v28;
  _QWORD v29[8];
  uint64_t v30;
  id v31;
  unint64_t i;
  id v33;
  _QWORD __b[8];
  id v35;
  char v36;
  id v37;
  id v38;
  int v39;
  id v40;
  id location;
  id v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v42 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  v40 = 0;
  objc_storeStrong(&v40, a3);
  if (v42)
  {
    if ((-[UITableViewCellAccessibility _accessibilityTableViewIsOpaque](v42) & 1) != 0)
    {
      v39 = 1;
    }
    else
    {
      v38 = -[UITableViewCellAccessibility _accessibilityInternalData](v42);
      objc_storeWeak((id *)v38 + 8, v40);
      if (location == v42)
      {
        v39 = 1;
      }
      else
      {
        v37 = (id)objc_msgSend(location, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
        if (v37)
        {
          v36 = 0;
          objc_msgSend(*((id *)v38 + 1), "removeAllObjects");
          objc_storeStrong((id *)v38 + 5, 0);
          objc_storeStrong((id *)v38 + 3, 0);
          objc_storeStrong((id *)v38 + 4, *((id *)v37 + 4));
          -[UITableTextAccessibilityElement setTextDelegate:](*((id **)v38 + 4), v40);
          -[UITableTextAccessibilityElement setAttributeDelegate:](*((id **)v38 + 4), v40);
          objc_msgSend(v40, "registerMockChild:", *((_QWORD *)v38 + 4));
          objc_msgSend(*((id *)v38 + 4), "setAccessibilityContainer:", v40);
          objc_storeStrong((id *)v38 + 6, *((id *)v37 + 6));
          objc_msgSend(v40, "registerMockChild:", *((_QWORD *)v38 + 6));
          if (*((_QWORD *)v37 + 3))
          {
            objc_storeStrong((id *)v38 + 3, *((id *)v37 + 3));
            objc_msgSend(v40, "registerMockChild:", *((_QWORD *)v38 + 3));
          }
          if (*((_QWORD *)v37 + 4)
            || !objc_msgSend(*((id *)v37 + 1), "count")
            || objc_msgSend(*((id *)v37 + 7), "count"))
          {
            if (objc_msgSend(*((id *)v37 + 7), "count"))
            {
              v33 = -[UITableViewCellAccessibility _accessibilitySubviewsForAdding](v42);
              for (i = 0; ; ++i)
              {
                v18 = i;
                if (v18 >= objc_msgSend(v33, "count"))
                  break;
                v31 = (id)objc_msgSend(v33, "objectAtIndex:", i);
                if ((objc_msgSend(v31, "_accessibilityViewIsVisible") & 1) != 0)
                {
                  if ((objc_msgSend(v31, "isAccessibilityElement") & 1) == 0)
                  {
                    memset(v29, 0, sizeof(v29));
                    v14 = v42;
                    v15 = (id)objc_msgSend(v31, "subviews");
                    v16 = (id)objc_msgSend(v14, "_accessibilityGeometrySortedElements:");

                    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v29, v44, 16);
                    if (v17)
                    {
                      v11 = *(_QWORD *)v29[2];
                      v12 = 0;
                      v13 = v17;
                      while (1)
                      {
                        v10 = v12;
                        if (*(_QWORD *)v29[2] != v11)
                          objc_enumerationMutation(v16);
                        v30 = *(_QWORD *)(v29[1] + 8 * v12);
                        if (objc_msgSend(v33, "indexOfObjectIdenticalTo:", v30) == 0x7FFFFFFFFFFFFFFFLL)
                          objc_msgSend(v33, "addObject:", v30);
                        ++v12;
                        if (v10 + 1 >= v13)
                        {
                          v12 = 0;
                          v13 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", v29, v44, 16);
                          if (!v13)
                            break;
                        }
                      }
                    }

                  }
                  v39 = 0;
                }
                else
                {
                  v39 = 6;
                }
                objc_storeStrong(&v31, 0);
              }
              memset(v27, 0, sizeof(v27));
              v8 = *((id *)v37 + 7);
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v27, v43, 16);
              if (v9)
              {
                v5 = *(_QWORD *)v27[2];
                v6 = 0;
                v7 = v9;
                while (1)
                {
                  v4 = v6;
                  if (*(_QWORD *)v27[2] != v5)
                    objc_enumerationMutation(v8);
                  v28 = *(void **)(v27[1] + 8 * v6);
                  if (v28 != *((void **)v38 + 6)
                    && v28 != *((void **)v37 + 3)
                    && v28 != *((void **)v37 + 5)
                    && (objc_msgSend(*((id *)v38 + 1), "containsObject:", v28) & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(*((id *)v38 + 7), "addObject:", v28);
                      -[UITableViewCellAccessibility _accessibilitySwitchMockView:toParent:withPossibleSubviews:](v42, v28, v40, v33);
                    }
                  }
                  ++v6;
                  if (v4 + 1 >= v7)
                  {
                    v6 = 0;
                    v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v27, v43, 16);
                    if (!v7)
                      break;
                  }
                }
              }

              objc_storeStrong(&v33, 0);
            }
          }
          else
          {
            objc_msgSend(*((id *)v38 + 1), "addObjectsFromArray:", *((_QWORD *)v37 + 1));
            memset(__b, 0, sizeof(__b));
            v23 = *((id *)v38 + 1);
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
            if (v24)
            {
              v20 = *(_QWORD *)__b[2];
              v21 = 0;
              v22 = v24;
              while (1)
              {
                v19 = v21;
                if (*(_QWORD *)__b[2] != v20)
                  objc_enumerationMutation(v23);
                v35 = *(id *)(__b[1] + 8 * v21);
                objc_msgSend(v35, "setAccessibilityContainer:", v40);
                objc_msgSend(v40, "registerMockChild:", v35);
                ++v21;
                if (v19 + 1 >= v22)
                {
                  v21 = 0;
                  v22 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
                  if (!v22)
                    break;
                }
              }
            }

          }
          v26 = 1;
          if (objc_msgSend(*((id *)v37 + 1), "count") == 1 && objc_msgSend(*((id *)v38 + 1), "count") == 1)
            v26 = *((_QWORD *)v37 + 4) != *((_QWORD *)v38 + 4);
          objc_msgSend(*((id *)v37 + 1), "removeAllObjects");
          v3 = (id)objc_msgSend(v42, "_accessibilityChildren");
          if (v26)
            UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
        }
        objc_storeStrong(&v37, 0);
        v39 = 0;
      }
      objc_storeStrong(&v38, 0);
    }
  }
  else
  {
    v39 = 1;
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&location, 0);
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  UITableViewCellAccessibility *v4;

  v4 = self;
  v3 = a2;
  -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("InDealloc"));
  -[UITableViewCellAccessibility _accessibilityClearChildren](v4, "_accessibilityClearChildren");
  -[UITableViewCellAccessibility _accessibilityRemoveInternalData](v4);
  v2.receiver = v4;
  v2.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility dealloc](&v2, sel_dealloc);
}

- (void)_accessibilityRemoveInternalData
{
  if (result)
    return (void *)objc_msgSend(result, "_accessibilityRemoveValueForKey:", CFSTR("AXInternalData"));
  return result;
}

- (id)accessibilityElements
{
  objc_super v3;
  SEL v4;
  UITableViewCellAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  return -[UITableViewCellAccessibility accessibilityElements](&v3, sel_accessibilityElements);
}

- (BOOL)_accessibilityUsesOverrideContainerProtocol
{
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  BOOL v7;
  char v8;
  id v9;
  objc_super v10;
  Method v11;
  Method InstanceMethod;
  SEL v13;
  UITableViewCellAccessibility *v14;

  v14 = self;
  v13 = a2;
  if (!_accessibilityUsesOverrideContainerProtocol_BaseNSObjectMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilityUsesOverrideContainerProtocol_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityElementCount);
    v3 = (objc_class *)objc_opt_class();
    _accessibilityUsesOverrideContainerProtocol_BaseNSObjectAXElementsMethod = (uint64_t)class_getInstanceMethod(v3, sel_accessibilityElements);
  }
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_accessibilityElementCount);
  v5 = (objc_class *)objc_opt_class();
  v11 = class_getInstanceMethod(v5, sel_accessibilityElements);
  if (InstanceMethod == (Method)_accessibilityUsesOverrideContainerProtocol_BaseNSObjectMethod)
  {
    v8 = 0;
    v7 = 1;
    if ((Method)_accessibilityUsesOverrideContainerProtocol_BaseNSObjectAXElementsMethod == v11)
    {
      v10.receiver = v14;
      v10.super_class = (Class)UITableViewCellAccessibility;
      v9 = -[UITableViewCellAccessibility accessibilityElements](&v10, sel_accessibilityElements);
      v8 = 1;
      v7 = objc_msgSend(v9, "count") != 0;
    }
    if ((v8 & 1) != 0)

    return v7;
  }
  if ((-[UITableViewCellAccessibility _accessibilityBoolValueForKey:](v14, "_accessibilityBoolValueForKey:", CFSTR("CheckingOverride")) & 1) == 0)return (unint64_t)-[UITableViewCellAccessibility accessibilityElementCount](v14, "accessibilityElementCount") <= 0x7FFFFFFFFFFFFFFELL;
  return 0;
}

- (void)_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:(id)a3
{
  id v3;
  char v4;
  id v5;
  objc_super v6;
  id location[2];
  UITableViewCellAccessibility *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[UITableViewCellAccessibility _accessibilityParentTableView](v8, "_accessibilityParentTableView");
  v4 = objc_msgSend(v3, "isAccessibilityOpaqueElementProvider");

  if ((v4 & 1) != 0)
  {
    v6.receiver = v8;
    v6.super_class = (Class)UITableViewCellAccessibility;
    -[UITableViewCellAccessibility _accessibilityUpdateContainerElementReferencesIfNeededForNewElements:](&v6, sel__accessibilityUpdateContainerElementReferencesIfNeededForNewElements_, location[0]);
  }
  else
  {
    v5 = -[UITableViewCellAccessibility _accessibilityMockParent](v8, "_accessibilityMockParent");
    if (v5 == v8)
      _AXLogWithFacility();
    else
      objc_msgSend(v5, "_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:", location[0]);
    objc_storeStrong(&v5, 0);
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilityContainerElements
{
  id v2;
  uint64_t i;
  id v4;
  uint64_t v5;
  int v6;
  id v7;
  id v8;
  id v9;

  v8 = a1;
  if (a1)
  {
    v7 = (id)objc_msgSend(v8, "_accessibilityElements");
    if (v7)
    {
      v9 = v7;
      v6 = 1;
    }
    else
    {
      v5 = objc_msgSend(v8, "accessibilityElementCount");
      if (v5 && v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        for (i = 0; i < v5; ++i)
        {
          v2 = (id)objc_msgSend(v8, "accessibilityElementAtIndex:", i);
          objc_msgSend(v4, "axSafelyAddObject:", v2);
          objc_storeStrong(&v2, 0);
        }
        v9 = v4;
        v6 = 1;
        objc_storeStrong(&v4, 0);
      }
      else
      {
        v9 = 0;
        v6 = 1;
      }
    }
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  uint64_t v4;
  id location;
  id v6[2];
  UITableViewCellAccessibility *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _NSRange result;

  v7 = self;
  v6[1] = (id)a2;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v13 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = 0;
  v6[0] = (id)-[UITableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  if (v6[0])
  {
    location = -[UITableViewCellAccessibility _accessibilityIndexPath](v7, "_accessibilityIndexPath");
    v4 = objc_msgSend(v6[0], "numberOfSections");
    if (v4 > objc_msgSend(location, "section"))
    {
      v8 = objc_msgSend(location, "row");
      v9 = objc_msgSend(v6[0], "numberOfRowsInSection:", objc_msgSend(location, "section"));
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v6, 0);
  v2 = v8;
  v3 = v9;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)_accessibilityImplementsDefaultRowRange
{
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  id v9[3];

  v9[2] = self;
  v9[1] = (id)a2;
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __71__UITableViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke;
  v8 = &unk_24FF3E0C0;
  v9[0] = self;
  v3 = !v7((uint64_t)&v4);
  objc_storeStrong(v9, 0);
  return v3;
}

BOOL __71__UITableViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&AXIsShowingSelectedBackground_block_invoke_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_39);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityRowRange);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXIsShowingSelectedBackground_block_invoke_BaseImplementation;
}

void __71__UITableViewCellAccessibility__accessibilityImplementsDefaultRowRange__block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityRowRange);
  if (InstanceMethod)
  {
    AXIsShowingSelectedBackground_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityRowRange);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

- (id)_accessibilityMockParent
{
  id WeakRetained;
  id v4[3];

  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  WeakRetained = objc_loadWeakRetained((id *)v4[0] + 8);
  objc_storeStrong(v4, 0);
  return WeakRetained;
}

- (void)_setAccessibilityMockParent:(void *)a1
{
  id *v2;
  int v3;
  id location;
  void *v5;

  v5 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v5)
  {
    v2 = (id *)-[UITableViewCellAccessibility _accessibilityInternalData](v5);
    objc_storeWeak(v2 + 8, location);
    objc_storeStrong((id *)&v2, 0);
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  objc_storeStrong(&location, 0);
}

- (BOOL)_accessibilityTableViewCellHidesInsertControl
{
  return 0;
}

- (id)_accessibilityIndexPath
{
  id v3;
  id v4[2];
  uint64_t v5;
  uint64_t *v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  id v12;
  int v13;
  id WeakRetained;
  id v15[2];
  UITableViewCellAccessibility *v16;
  id v17;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  WeakRetained = objc_loadWeakRetained((id *)v15[0] + 8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = (id)-[UITableViewCellAccessibilityElement indexPath]((uint64_t)WeakRetained);
    v13 = 1;
  }
  else
  {
    v5 = 0;
    v6 = &v5;
    v7 = 838860800;
    v8 = 48;
    v9 = __Block_byref_object_copy__21;
    v10 = __Block_byref_object_dispose__21;
    v11 = 0;
    v4[1] = &v5;
    v4[0] = v16;
    AXPerformSafeBlock();
    v3 = (id)v6[5];
    objc_storeStrong(v4, 0);
    _Block_object_dispose(&v5, 8);
    objc_storeStrong(&v11, 0);
    v12 = v3;
    v17 = v3;
    v13 = 1;
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(v15, 0);
  return v17;
}

void __55__UITableViewCellAccessibility__accessibilityIndexPath__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v5;

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityParentTableView");
  v1 = (id)objc_msgSend(v5, "indexPathForCell:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (BOOL)_accessibilityHasTextOperations
{
  int v3;
  objc_super v4;
  int v5;
  char v6;
  id v7;
  id location[2];
  UITableViewCellAccessibility *v9;
  char v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibility _accessibilityParentTableView](self, "_accessibilityParentTableView");
  v6 = 0;
  LOBYTE(v3) = 0;
  if (location[0])
  {
    v7 = (id)objc_msgSend(location[0], "visibleCells");
    v6 = 1;
    v3 = objc_msgSend(v7, "containsObject:", v9) ^ 1;
  }
  if ((v6 & 1) != 0)

  if ((v3 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v4.receiver = v9;
    v4.super_class = (Class)UITableViewCellAccessibility;
    v10 = -[UITableViewCellAccessibility _accessibilityHasTextOperations](&v4, sel__accessibilityHasTextOperations);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (uint64_t)_accessibilityIsRemoveControlVisible
{
  int v2;
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id location;
  id v8;
  id v9;
  char v10;

  v9 = a1;
  if (a1)
  {
    v8 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("_editingData"));
    location = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_editControl"));
    v3 = (id)objc_msgSend(v9, "safeValueForKey:", CFSTR("editingStyle"));
    v4 = (int)objc_msgSend(v3, "intValue");

    if (location && v4 == 2 && (objc_msgSend(v9, "_accessibilityTableViewCellHidesInsertControl") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v5 = 0;
      LOBYTE(v2) = 0;
      if (v4)
      {
        v6 = (id)objc_msgSend(location, "superview");
        v5 = 1;
        LOBYTE(v2) = 0;
        if (v6)
          v2 = objc_msgSend(location, "isHiddenOrHasHiddenAncestor") ^ 1;
      }
      v10 = v2 & 1;
      if ((v5 & 1) != 0)

    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v8, 0);
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

- (uint64_t)_accessibilityIsRemoveConfirmVisible
{
  char v2;

  if (a1)
    v2 = objc_msgSend(a1, "showingDeleteConfirmation") & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (id)_accessibilityCellEditingControl
{
  id v3;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editingData"));
  v4 = (id)objc_msgSend(v5[0], "safeValueForKey:", CFSTR("_editControl"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
  return v3;
}

- (id)_accessibilityCellReorderControl
{
  id v3;
  id v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v5[0] = (id)-[UITableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editingData"));
  v4 = (id)objc_msgSend(v5[0], "safeValueForKey:", CFSTR("_reorderControl"));
  v3 = v4;
  objc_storeStrong(&v4, 0);
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)_accessibilityHandleRemoveSwitch
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id location;
  id v41;
  char v42;
  id WeakRetained;
  int v44;
  id v45;
  void *v46;

  v46 = a1;
  if (a1)
  {
    v45 = -[UITableViewCellAccessibility _accessibilityInternalData](v46);
    if (!objc_msgSend(*((id *)v45 + 1), "count"))
    {
      v44 = 1;
LABEL_33:
      objc_storeStrong(&v45, 0);
      return;
    }
    v42 = 0;
    v27 = 0;
    if ((-[UITableViewCellAccessibility _accessibilityIsRemoveControlVisible](v46) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)v45 + 8);
      v42 = 1;
      v27 = WeakRetained != 0;
    }
    if ((v42 & 1) != 0)

    if (!v27)
    {
      if (*((_QWORD *)v45 + 4))
      {
        objc_msgSend(*((id *)v45 + 4), "accessibilityFrame");
        v28 = v9;
        v29 = v10;
        v30 = v11;
        v32 = v12;
        v19 = (id)objc_msgSend(v46, "window");
        v18 = (id)objc_msgSend(v19, "windowScene");
        v20 = objc_msgSend(v18, "interfaceOrientation");

        if (UIInterfaceOrientationIsLandscape(v20))
        {
          objc_msgSend(*((id *)v45 + 3), "accessibilityFrame");
          v33 = v32 + v13;
          objc_msgSend(*((id *)v45 + 3), "accessibilityFrame");
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v28, v29 - v14, v30, v33);
        }
        else
        {
          objc_msgSend(*((id *)v45 + 3), "accessibilityFrame");
          v31 = v30 + v15;
          objc_msgSend(*((id *)v45 + 3), "accessibilityFrame");
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v28 - v16, v29, v31, v32);
        }
      }
      v17 = objc_loadWeakRetained((id *)v45 + 8);
      objc_msgSend(v17, "unregisterMockChild:", *((_QWORD *)v45 + 3));

      objc_msgSend(*((id *)v45 + 1), "removeObjectIdenticalTo:", *((_QWORD *)v45 + 3));
      objc_storeStrong((id *)v45 + 3, 0);
      goto LABEL_32;
    }
    v41 = (id)objc_msgSend(v46, "_accessibilityCellEditingControl");
    location = *((id *)v45 + 3);
    if (location)
    {
      -[UIAccessibilityElementMockView setView:]((id *)location, v41);
      if (objc_msgSend(*((id *)v45 + 1), "indexOfObjectIdenticalTo:", location) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(*((id *)v45 + 1), "count"))
          objc_msgSend(*((id *)v45 + 1), "insertObject:atIndex:", location, 0);
        else
          objc_msgSend(*((id *)v45 + 1), "addObject:", location);
      }
    }
    else
    {
      v25 = objc_allocWithZone((Class)UIAccessibilityElementMockView);
      v26 = objc_loadWeakRetained((id *)v45 + 8);
      location = (id)objc_msgSend(v25, "initWithAccessibilityContainer:");

      if (!location)
      {
        v44 = 1;
        goto LABEL_25;
      }
      if (objc_msgSend(*((id *)v45 + 1), "count"))
        objc_msgSend(*((id *)v45 + 1), "insertObject:atIndex:", location, 0);
      else
        objc_msgSend(*((id *)v45 + 1), "addObject:", location);
      objc_storeStrong((id *)v45 + 3, location);
      -[UIAccessibilityElementMockView setView:]((id *)location, v41);
      v24 = objc_loadWeakRetained((id *)v45 + 8);
      objc_msgSend(v24, "registerMockChild:", location);

      if (*((_QWORD *)v45 + 4))
      {
        objc_msgSend(*((id *)v45 + 4), "accessibilityFrame");
        v34 = v1;
        v35 = v2;
        v36 = v3;
        v38 = v4;
        v22 = (id)objc_msgSend(v46, "window");
        v21 = (id)objc_msgSend(v22, "windowScene");
        v23 = objc_msgSend(v21, "interfaceOrientation");

        if (UIInterfaceOrientationIsLandscape(v23))
        {
          objc_msgSend(location, "accessibilityFrame");
          v39 = v38 - v5;
          objc_msgSend(location, "accessibilityFrame");
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v34, v35 + v6, v36, v39);
        }
        else
        {
          objc_msgSend(location, "accessibilityFrame");
          v37 = v36 - v7;
          objc_msgSend(location, "accessibilityFrame");
          objc_msgSend(*((id *)v45 + 4), "setAccessibilityFrame:", v34 + v8, v35, v37, v38);
        }
      }
    }
    v44 = 0;
LABEL_25:
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v41, 0);
    if (v44)
      goto LABEL_33;
LABEL_32:
    v44 = 0;
    goto LABEL_33;
  }
}

- (id)_accessibilityFindRemoveConfirmSubview
{
  id v2;
  void *v3;
  id v4;

  v3 = a1;
  if (a1)
  {
    if ((-[UITableViewCellAccessibility _accessibilityIsRemoveConfirmVisible](v3) & 1) != 0)
    {
      v2 = (id)objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_473);
      v4 = (id)objc_msgSend(v2, "firstObject");
      objc_storeStrong(&v2, 0);
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t __70__UITableViewCellAccessibility__accessibilityFindRemoveConfirmSubview__block_invoke(void *a1, void *a2)
{
  char isKindOfClass;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSClassFromString(CFSTR("UITableViewCellEditControl"));
  isKindOfClass = objc_opt_isKindOfClass();
  objc_storeStrong(location, 0);
  return isKindOfClass & 1;
}

- (void)_accessibilityHandleRemoveConfirm
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id location;
  id v33;
  char v34;
  id WeakRetained;
  int v36;
  id v37;
  void *v38;

  v38 = a1;
  if (a1)
  {
    v37 = -[UITableViewCellAccessibility _accessibilityInternalData](v38);
    if (!objc_msgSend(*((id *)v37 + 1), "count"))
    {
      v36 = 1;
LABEL_28:
      objc_storeStrong(&v37, 0);
      return;
    }
    v34 = 0;
    v23 = 0;
    if ((-[UITableViewCellAccessibility _accessibilityIsRemoveConfirmVisible](v38) & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)v37 + 8);
      v34 = 1;
      v23 = WeakRetained != 0;
    }
    if ((v34 & 1) != 0)

    if (!v23)
    {
      if (*((_QWORD *)v37 + 5))
      {
        if (*((_QWORD *)v37 + 4))
        {
          objc_msgSend(*((id *)v37 + 4), "accessibilityFrame");
          v24 = v7;
          v25 = v8;
          v26 = v9;
          v27 = v10;
          v15 = (id)objc_msgSend(v38, "window");
          v14 = (id)objc_msgSend(v15, "windowScene");
          v16 = objc_msgSend(v14, "interfaceOrientation");

          if (UIInterfaceOrientationIsLandscape(v16))
          {
            objc_msgSend(*((id *)v37 + 5), "accessibilityFrame");
            objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v24, v25, v26, v27 + v11);
          }
          else
          {
            objc_msgSend(*((id *)v37 + 5), "accessibilityFrame");
            objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v24, v25, v26 + v12, v27);
          }
        }
        v13 = objc_loadWeakRetained((id *)v37 + 8);
        objc_msgSend(v13, "unregisterMockChild:", *((_QWORD *)v37 + 5));

        objc_msgSend(*((id *)v37 + 1), "removeObjectIdenticalTo:", *((_QWORD *)v37 + 5));
        objc_storeStrong((id *)v37 + 5, 0);
      }
      goto LABEL_27;
    }
    v33 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v38);
    location = *((id *)v37 + 5);
    if (location)
    {
      -[UIAccessibilityElementMockView setView:]((id *)location, v33);
    }
    else
    {
      v21 = objc_allocWithZone((Class)UIAccessibilityElementMockView);
      v22 = objc_loadWeakRetained((id *)v37 + 8);
      location = (id)objc_msgSend(v21, "initWithAccessibilityContainer:");

      if (!location)
      {
        v36 = 1;
        goto LABEL_19;
      }
      objc_msgSend(*((id *)v37 + 1), "addObject:", location);
      objc_storeStrong((id *)v37 + 5, location);
      -[UIAccessibilityElementMockView setView:]((id *)location, v33);
      v20 = objc_loadWeakRetained((id *)v37 + 8);
      objc_msgSend(v20, "registerMockChild:", location);

      UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], location);
      if (*((_QWORD *)v37 + 4))
      {
        objc_msgSend(*((id *)v37 + 4), "accessibilityFrame");
        v28 = v1;
        v29 = v2;
        v30 = v3;
        v31 = v4;
        v18 = (id)objc_msgSend(v38, "window");
        v17 = (id)objc_msgSend(v18, "windowScene");
        v19 = objc_msgSend(v17, "interfaceOrientation");

        if (UIInterfaceOrientationIsLandscape(v19))
        {
          objc_msgSend(location, "accessibilityFrame");
          objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v28, v29, v30, v31 - v5);
        }
        else
        {
          objc_msgSend(location, "accessibilityFrame");
          objc_msgSend(*((id *)v37 + 4), "setAccessibilityFrame:", v28, v29, v30 - v6, v31);
        }
      }
    }
    v36 = 0;
LABEL_19:
    objc_storeStrong(&location, 0);
    objc_storeStrong(&v33, 0);
    if (v36)
      goto LABEL_28;
LABEL_27:
    v36 = 0;
    goto LABEL_28;
  }
}

- (BOOL)_accessibilityAlwaysReturnsChild
{
  return 1;
}

- (void)_accessibilityUpdateRemoveControl
{
  if (a1)
  {
    -[UITableViewCellAccessibility _accessibilityHandleRemoveSwitch](a1);
    -[UITableViewCellAccessibility _accessibilityHandleRemoveConfirm](a1);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (BOOL)_accessibilityIsDescendantOfElement:(id)a3
{
  id WeakRetained;
  id v5;
  BOOL v6;
  objc_super v7;
  int v8;
  id v9;
  id location[2];
  UITableViewCellAccessibility *v11;
  char v12;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = -[UITableViewCellAccessibility _accessibilityInternalData](v11);
  v5 = location[0];
  WeakRetained = objc_loadWeakRetained((id *)v9 + 8);
  v6 = v5 != WeakRetained;

  if (v6)
  {
    v7.receiver = v11;
    v7.super_class = (Class)UITableViewCellAccessibility;
    v12 = -[UITableViewCellAccessibility _accessibilityIsDescendantOfElement:](&v7, sel__accessibilityIsDescendantOfElement_, location[0]);
  }
  else
  {
    v12 = 1;
  }
  v8 = 1;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (BOOL)accessibilityElementIsFocused
{
  id WeakRetained;
  id v3;
  id v4;
  BOOL v6;
  objc_super v7;
  id v8;
  id location[2];
  UITableViewCellAccessibility *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v8 = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  if (-[UITableViewCellAccessibility isAccessibilityElement](v10, "isAccessibilityElement"))
  {
    WeakRetained = objc_loadWeakRetained((id *)v8 + 8);
    v6 = WeakRetained == 0;

    if (!v6)
    {
      v3 = objc_loadWeakRetained((id *)v8 + 8);
      v4 = location[0];
      location[0] = v3;

    }
  }
  if (!location[0] && *((_QWORD *)v8 + 4))
    objc_storeStrong(location, *((id *)v8 + 4));
  if (location[0] && location[0] != v10)
  {
    v11 = objc_msgSend(location[0], "accessibilityElementIsFocused") & 1;
  }
  else
  {
    v7.receiver = v10;
    v7.super_class = (Class)UITableViewCellAccessibility;
    v11 = -[UITableViewCellAccessibility accessibilityElementIsFocused](&v7, sel_accessibilityElementIsFocused);
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (BOOL)_accessibilityAvoidsMockViewContainers
{
  objc_super v3;
  SEL v4;
  UITableViewCellAccessibility *v5;

  v5 = self;
  v4 = a2;
  if ((-[UITableViewCellAccessibility _accessibilityTableViewIsOpaque](self) & 1) != 0)
    return 1;
  v3.receiver = v5;
  v3.super_class = (Class)UITableViewCellAccessibility;
  return -[UITableViewCellAccessibility _accessibilityAvoidsMockViewContainers](&v3, sel__accessibilityAvoidsMockViewContainers);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  BOOL v23;
  uint64_t v24;
  id v25;
  char v26;
  __int128 v27;
  id v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  NSString *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  id v39;
  id v40;
  NSPoint v41;
  id v42;
  NSPoint v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  id obj;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  BOOL v54;
  uint64_t v55;
  id v56[3];
  id v57;
  BOOL v58;
  uint64_t v59;
  int v60;
  int v61;
  void (*v62)(uint64_t, void *);
  void *v63;
  id v64;
  id v65[7];
  __int128 v66;
  CGPoint v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  int v71;
  int v72;
  void (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[2];
  int v77;
  int v78;
  uint64_t v79;
  char v80;
  _QWORD v81[2];
  int v82;
  int v83;
  void *v84;
  __int128 v85;
  _QWORD v86[2];
  int v87;
  int v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  int v94;
  int v95;
  void (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  id *v100;
  int v101;
  int v102;
  void (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  __int128 v106;
  id v107;
  os_log_type_t v108;
  os_log_t v109;
  os_log_type_t v110;
  os_log_t v111;
  id v112;
  os_log_type_t v113;
  os_log_t v114;
  NSPoint v115;
  NSPoint v116;
  NSPoint aPoint;
  id v118;
  _QWORD __b[8];
  id v120;
  id v121;
  os_log_type_t type;
  os_log_t oslog;
  id v124;
  id v125;
  int v126;
  id v127;
  id *v128;
  char v129;
  uint64_t v130;
  int v131;
  int v132;
  BOOL (*v133)(uint64_t);
  void *v134;
  id v135;
  char v136;
  id location[2];
  id v138;
  CGPoint v139;
  id v140;
  uint8_t v141[16];
  uint8_t v142[16];
  uint8_t v143[32];
  _BYTE v144[128];
  uint8_t v145[40];
  uint64_t v146;

  v146 = *MEMORY[0x24BDAC8D0];
  v139 = a3;
  v138 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v136 = objc_msgSend(v138, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1;
  v129 = 0;
  v54 = 0;
  if (!v136)
  {
    v130 = MEMORY[0x24BDAC760];
    v131 = -1073741824;
    v132 = 0;
    v133 = __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke;
    v134 = &unk_24FF3E0C0;
    v135 = v138;
    v129 = 1;
    v128 = &v135;
    v54 = v133((uint64_t)&v130);
  }
  if (v54)
  {
    objc_msgSend(v138, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXInHitTestOverride"));
    v127 = (id)objc_msgSend(v138, "accessibilityHitTest:withEvent:", location[0], v139.x, v139.y);
    objc_msgSend(v138, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
    v140 = v127;
    v126 = 1;
    objc_storeStrong(&v127, 0);
  }
  else
  {
    v126 = 0;
  }
  if ((v129 & 1) != 0)
    objc_storeStrong(v128, 0);
  if (!v126)
  {
    if ((objc_msgSend(location[0], "_accessibilityAutomationHitTest") & 1) == 0)
    {
      if ((unsigned __int16)objc_msgSend(location[0], "_accessibilityHitTestType") == 3)
      {
        v140 = (id)objc_msgSend(v138, "__accessibilityHitTest:withEvent:", location[0], v139.x, v139.y);
        v126 = 1;
        goto LABEL_88;
      }
      goto LABEL_43;
    }
    v125 = 0;
    v53 = -[UITableViewCellAccessibility _accessibilityUserTestingChildrenInAccessibilitySortedOrder:](v138, 0);
    v52 = (id)objc_msgSend(v53, "reverseObjectEnumerator");
    v124 = (id)objc_msgSend(v52, "allObjects");

    oslog = (os_log_t)(id)AXLogUIA();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v51 = v138;
      v50 = (id)objc_msgSend(v138, "subviews");
      v121 = v50;
      __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v145, (uint64_t)v124, (uint64_t)v51, (uint64_t)v121);
      _os_log_debug_impl(&dword_230C4A000, oslog, type, "Cell children: %@ for %@ -> {subviews: %@}", v145, 0x20u);

      objc_storeStrong(&v121, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    memset(__b, 0, sizeof(__b));
    obj = v124;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v144, 16);
    if (v49)
    {
      v45 = *(_QWORD *)__b[2];
      v46 = 0;
      v47 = v49;
      while (1)
      {
        v44 = v46;
        if (*(_QWORD *)__b[2] != v45)
          objc_enumerationMutation(obj);
        v120 = *(id *)(__b[1] + 8 * v46);
        v118 = 0;
        aPoint = v139;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v138, "convertPoint:toView:", v120, v139);
          v43.x = v4;
          v43.y = v5;
          v116 = v43;
          aPoint = v43;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v42 = v138;
            v40 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v120);
            objc_msgSend(v42, "convertPoint:toView:", v139);
            v41.x = v6;
            v41.y = v7;
            v115 = v41;
            aPoint = v41;

          }
        }
        v114 = (os_log_t)(id)AXLogUIA();
        v113 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v114, OS_LOG_TYPE_DEBUG))
        {
          v36 = v114;
          v37 = v113;
          v38 = (uint64_t)v120;
          v39 = v138;
          v35 = NSStringFromPoint(aPoint);
          v112 = v35;
          __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v143, v38, (uint64_t)v39, (uint64_t)v112);
          _os_log_debug_impl(&dword_230C4A000, v36, v37, "hit test: check child %@ [in cell %@] with pt: %@", v143, 0x20u);

          objc_storeStrong(&v112, 0);
        }
        objc_storeStrong((id *)&v114, 0);
        v8 = (id)objc_msgSend(v120, "_accessibilityHitTest:withEvent:", location[0], aPoint);
        v9 = v118;
        v118 = v8;

        if (v118)
        {
          v111 = (os_log_t)(id)AXLogUIA();
          v110 = OS_LOG_TYPE_INFO;
          if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
          {
            v33 = v111;
            v34 = v110;
            __os_log_helper_16_2_1_8_64((uint64_t)v142, (uint64_t)v118);
            _os_log_impl(&dword_230C4A000, v33, v34, "Found tableViewCell result: %@", v142, 0xCu);
          }
          objc_storeStrong((id *)&v111, 0);
          if ((objc_msgSend(v118, "_accessibilityElementIsBeingHitTested") & 1) != 0)
          {
            v109 = (os_log_t)(id)AXLogUIA();
            v108 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
            {
              v32 = v109;
              __os_log_helper_16_2_1_8_64((uint64_t)v141, (uint64_t)v118);
              _os_log_impl(&dword_230C4A000, v32, v108, "This was the element being hit tested for so returnign that: %@", v141, 0xCu);
            }
            objc_storeStrong((id *)&v109, 0);
            v140 = v118;
            v126 = 1;
            goto LABEL_31;
          }
          objc_storeStrong(&v125, v118);
        }
        v126 = 0;
LABEL_31:
        objc_storeStrong(&v118, 0);
        if (v126)
          goto LABEL_35;
        ++v46;
        if (v44 + 1 >= v47)
        {
          v46 = 0;
          v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v144, 16);
          if (!v47)
            break;
        }
      }
    }
    v126 = 0;
LABEL_35:

    if (!v126)
    {
      if (v125)
      {
        v140 = v125;
        v126 = 1;
      }
      else
      {
        v126 = 0;
      }
    }
    objc_storeStrong(&v124, 0);
    objc_storeStrong(&v125, 0);
    if (!v126)
    {
LABEL_43:
      if ((objc_msgSend(v138, "pointInside:withEvent:", location[0], v139.x, v139.y) & 1) != 0)
      {
        if ((objc_msgSend(v138, "isAccessibilityElement") & 1) != 0)
        {
          v31 = v138;
          v30 = (id)objc_msgSend(v138, "_accessibilitySupplementaryHeaderViews");
          v107 = (id)objc_msgSend(v31, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v139.x, v139.y);

          if (v107)
          {
            v140 = v107;
            v126 = 1;
          }
          else
          {
            v29 = v138;
            v28 = (id)objc_msgSend(v138, "_accessibilitySupplementaryFooterViews");
            v107 = (id)objc_msgSend(v29, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v139.x, v139.y);

            if (v107)
              v140 = v107;
            else
              v140 = v138;
            v126 = 1;
          }
          objc_storeStrong(&v107, 0);
        }
        else
        {
          UIAccessibilityPointForPoint();
          *(_QWORD *)&v27 = v10;
          *((_QWORD *)&v27 + 1) = v11;
          v106 = v27;
          v99 = 0;
          v100 = (id *)&v99;
          v101 = 838860800;
          v102 = 48;
          v103 = __Block_byref_object_copy__21;
          v104 = __Block_byref_object_dispose__21;
          v105 = 0;
          v92 = 0;
          v93 = &v92;
          v94 = 838860800;
          v95 = 48;
          v96 = __Block_byref_object_copy__21;
          v97 = __Block_byref_object_dispose__21;
          v98 = 0;
          v86[0] = 0;
          v86[1] = v86;
          v87 = 0x10000000;
          v88 = 48;
          v89 = &unk_230DEFD8E;
          v90 = 0;
          v91 = 0;
          CGSizeMake_2();
          v90 = v12;
          v91 = v13;
          v81[0] = 0;
          v81[1] = v81;
          v82 = 0x10000000;
          v83 = 48;
          v84 = &unk_230DEFD8E;
          v85 = 0uLL;
          v85 = *MEMORY[0x24BDBF148];
          v80 = objc_msgSend(v138, "_accessibilityHitTestShouldFallbackToNearestChild") & 1;
          v76[0] = 0;
          v76[1] = v76;
          v77 = 0x20000000;
          v78 = 32;
          v79 = 0x7FEFFFFFFFFFFFFFLL;
          v69 = 0;
          v70 = &v69;
          v71 = 838860800;
          v72 = 48;
          v73 = __Block_byref_object_copy__21;
          v74 = __Block_byref_object_dispose__21;
          v75 = 0;
          v25 = v138;
          v26 = objc_msgSend(v138, "_accessibilityHitTestReverseOrder");
          v14 = 2;
          if ((v26 & 1) == 0)
            v14 = 0;
          v24 = v14;
          v59 = MEMORY[0x24BDAC760];
          v60 = -1073741824;
          v61 = 0;
          v62 = __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_490;
          v63 = &unk_24FF3F708;
          v64 = location[0];
          v66 = v106;
          v65[1] = v86;
          v65[2] = &v99;
          v65[0] = v138;
          v67 = v139;
          v68 = v80 & 1;
          v65[3] = v76;
          v65[4] = &v69;
          v65[5] = v81;
          v65[6] = &v92;
          objc_msgSend(v25, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", v24, &v59);
          v15 = (id)objc_msgSend(v138, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
          v23 = v15 != 0;

          v58 = v23;
          if (!v100[5] && v58 && (objc_msgSend(v138, "_accessibilityAlwaysReturnsChild") & 1) != 0)
          {
            if ((v80 & 1) != 0)
              objc_storeStrong(v100 + 5, (id)v70[5]);
            else
              objc_storeStrong(v100 + 5, (id)v93[5]);
          }
          if (v100[5])
          {
            v57 = 0;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_storeStrong(&v57, v100[5]);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v16 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v100[5]);
              else
                v16 = (id)objc_msgSend(v100[5], "_accessibilityParentView");
              v17 = v57;
              v57 = v16;

            }
            objc_msgSend(v57, "convertPoint:fromView:", v138, v139);
            v56[1] = v18;
            v56[2] = v19;
            v56[0] = (id)objc_msgSend(v100[5], "_accessibilityHitTest:withEvent:", location[0], *(double *)&v18, *(double *)&v19);
            if (v56[0])
            {
              if ((objc_msgSend(v56[0], "isAccessibilityElement") & 1) != 0
                || (objc_msgSend(v56[0], "_accessibilityHasOrderedChildren") & 1) != 0
                || (objc_msgSend(v56[0], "isAccessibilityOpaqueElementProvider") & 1) != 0
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
              {
                objc_storeStrong(v100 + 5, v56[0]);
              }
              else if ((v80 & 1) != 0 && (objc_msgSend((id)v70[5], "isAccessibilityElement") & 1) != 0)
              {
                objc_storeStrong(v100 + 5, (id)v70[5]);
              }
              else if ((objc_msgSend((id)v93[5], "isAccessibilityElement") & 1) != 0)
              {
                objc_storeStrong(v100 + 5, (id)v93[5]);
              }
            }
            else if ((objc_msgSend(v138, "_accessibilityAlwaysReturnsChild") & 1) != 0
                   && objc_msgSend(v100[5], "accessibilityElementCount") > 0)
            {
              v55 = objc_msgSend(v100[5], "accessibilityElementCount");
              if (v55 && v55 != 0x7FFFFFFFFFFFFFFFLL)
              {
                v20 = (id)objc_msgSend(v100[5], "accessibilityElementAtIndex:", 0);
                v21 = v100[5];
                v100[5] = v20;

              }
              else
              {
                objc_storeStrong(v100 + 5, 0);
              }
            }
            objc_storeStrong(v56, 0);
            objc_storeStrong(&v57, 0);
          }
          v140 = v100[5];
          v126 = 1;
          objc_storeStrong(v65, 0);
          objc_storeStrong(&v64, 0);
          _Block_object_dispose(&v69, 8);
          objc_storeStrong(&v75, 0);
          _Block_object_dispose(v76, 8);
          _Block_object_dispose(v81, 8);
          _Block_object_dispose(v86, 8);
          _Block_object_dispose(&v92, 8);
          objc_storeStrong(&v98, 0);
          _Block_object_dispose(&v99, 8);
          objc_storeStrong(&v105, 0);
        }
      }
      else
      {
        v140 = 0;
        v126 = 1;
      }
    }
  }
LABEL_88:
  objc_storeStrong(location, 0);
  return v140;
}

BOOL __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v4;
  NSObject *log;
  os_log_type_t type;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  char v11;
  id v12;
  IMP Implementation;
  Method InstanceMethod;
  uint64_t v15;
  uint64_t v16;
  id location;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v16 = a1;
  v15 = a1;
  v18 = (dispatch_once_t *)&AXIsShowingSelectedBackground_block_invoke_2_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_484);
  if (*v18 != -1)
    dispatch_once(v18, location);
  objc_storeStrong(&location, 0);
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  Implementation = 0;
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v12 = (id)AXLogCommon();
    v11 = 17;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      log = v12;
      type = v11;
      v8 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v4 = v8;
      v10 = v4;
      v2 = (objc_class *)objc_opt_class();
      v7 = NSStringFromClass(v2);
      v9 = v7;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v19, (uint64_t)v4, (uint64_t)v9);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v19, 0x16u);

      objc_storeStrong((id *)&v9, 0);
      objc_storeStrong((id *)&v10, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  return Implementation != (IMP)AXIsShowingSelectedBackground_block_invoke_2_BaseImplementation;
}

void __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  NSString *v3;
  NSObject *log;
  os_log_type_t type;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  id v11;
  Method InstanceMethod;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = a1;
  v13 = a1;
  v1 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v1, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    AXIsShowingSelectedBackground_block_invoke_2_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v11 = (id)AXLogCommon();
    v10 = 17;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
      log = v11;
      type = v10;
      v7 = NSStringFromSelector(sel_accessibilityHitTest_withEvent_);
      v3 = v7;
      v9 = v3;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      v8 = v6;
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)v3, (uint64_t)v8);
      _os_log_fault_impl(&dword_230C4A000, log, type, "Attempted to check for nonexistent method: %@ on class: %@", v15, 0x16u);

      objc_storeStrong((id *)&v8, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    objc_storeStrong(&v11, 0);
  }
}

void __64__UITableViewCellAccessibility__accessibilityHitTest_withEvent___block_invoke_490(uint64_t a1, void *a2)
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  double v13;
  id v14;
  char v16;
  CGRect v17;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "accessibilityFrame");
  v17.origin.x = v2;
  v17.origin.y = v3;
  v17.size.width = v4;
  v17.size.height = v5;
  v16 = 1;
  if ((objc_msgSend(location[0], "isAccessibilityElement") & 1) == 0)
    v16 = objc_msgSend(location[0], "_accessibilityHasOrderedChildren");
  v6 = objc_msgSend(location[0], "accessibilityTraits");
  if ((v6 & *MEMORY[0x24BEBB178]) == 0 || (objc_msgSend(*(id *)(a1 + 32), "_accessibilityAutomationHitTest") & 1) != 0)
  {
    if (CGRectContainsPoint(v17, *(CGPoint *)(a1 + 96))
      && v17.size.width <= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)
      && v17.size.height <= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      if ((v16 & 1) != 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), location[0]);
      }
      else
      {
        v14 = location[0];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", location[0], *(double *)(a1 + 112), *(double *)(a1 + 120));
          v9 = (void *)objc_msgSend(v14, "_accessibilityHitTest:withEvent:", *(_QWORD *)(a1 + 32), v7, v8, v14);
        }
        else
        {
          v9 = (void *)objc_msgSend(v14, "_accessibilityHitTest:withEvent:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 112), *(double *)(a1 + 120), v14);
        }
        v10 = v9;
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
      *(CGSize *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v17.size;
    }
    if ((*(_BYTE *)(a1 + 128) & 1) != 0)
    {
      objc_msgSend(location[0], "accessibilityActivationPoint");
      AX_CGPointGetDistanceToPoint();
      if (v13 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), location[0]);
      }
    }
    if (v17.size.width >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32)
      && v17.size.height >= *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
      && (v16 & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), location[0]);
      *(CGSize *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32) = v17.size;
    }
  }
  objc_storeStrong(location, 0);
}

- (id)_accessibilitySupplementaryHeaderViews
{
  objc_super v3;
  SEL v4;
  UITableViewCellAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  return -[UITableViewCellAccessibility _accessibilitySupplementaryHeaderViews](&v3, sel__accessibilitySupplementaryHeaderViews);
}

- (void)setAccessoryView:(id)a3
{
  objc_super v3;
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)-[UITableViewCellAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("accessoryView"));
  if (v4 != location[0])
  {
    -[UITableViewCellAccessibility _accessibilityReevaluateChildren](v6);
    AXPerformBlockAsynchronouslyOnMainThread();
  }
  v3.receiver = v6;
  v3.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility setAccessoryView:](&v3, sel_setAccessoryView_, location[0]);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

void __49__UITableViewCellAccessibility_setAccessoryView___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)_accessibilityTextElementText
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7[2];
  UITableViewCellAccessibility *v8;
  id v9;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = -[UITableViewCellAccessibility _accessibilityInternalData](self);
  if (*((_QWORD *)v7[0] + 4))
  {
    v9 = (id)objc_msgSend(*((id *)v7[0] + 4), "accessibilityLabel");
  }
  else
  {
    v6 = -[UITableViewCellAccessibility _accessibilityEditableTextFieldIfExists](v8);
    v5 = (id)objc_msgSend(v6, "accessibilityValue");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = (id)objc_msgSend(v5, "string");
      v3 = v5;
      v5 = v2;

    }
    v9 = v5;
    objc_storeStrong(&v5, 0);
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(v7, 0);
  return v9;
}

- (CGRect)tableTextAccessibleFrame:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  UITableViewCellAccessibility *v29;
  char v30;
  id v31;
  id v32;
  id v33;
  id v34;
  UITableViewCellAccessibility *WeakRetained;
  BOOL v36;
  char v37;
  id v38;
  CGRect rect;
  double v40;
  CGRect v41;
  uint64_t v42;
  char v43;
  char v44;
  id v45;
  char v46;
  id v47;
  id v48;
  id location[2];
  UITableViewCellAccessibility *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect result;

  v50 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v48 = -[UITableViewCellAccessibility _accessibilityInternalData](v50);
  WeakRetained = (UITableViewCellAccessibility *)objc_loadWeakRetained((id *)v48 + 8);
  v46 = 0;
  v44 = 0;
  v36 = 0;
  if (WeakRetained != v50)
  {
    v47 = objc_loadWeakRetained((id *)v48 + 8);
    v46 = 1;
    v45 = (id)objc_msgSend(v47, "realTableViewCell");
    v44 = 1;
    v36 = v45 == 0;
  }
  if ((v44 & 1) != 0)

  if ((v46 & 1) != 0)
  if (v36)
  {
    v34 = objc_loadWeakRetained((id *)v48 + 8);
    objc_msgSend(v34, "accessibilityFrame");
    v51 = v3;
    v52 = v4;
    v53 = v5;
    v54 = v6;

  }
  else
  {
    v43 = 0;
    v42 = AXRequestingClient();
    if (v42 == 3 || v42 == 4)
      v43 = 1;
    -[UITableViewCellAccessibility bounds](v50, "bounds");
    v41.origin.x = v7;
    v41.origin.y = v8;
    v41.size.width = v9;
    v41.size.height = v10;
    if (*((_QWORD *)v48 + 3) && (v43 & 1) == 0)
    {
      v33 = (id)-[UIAccessibilityElementMockView view](*((_QWORD *)v48 + 3));
      objc_msgSend(v33, "bounds");
      v40 = v11;

      v41.origin.x = v40;
      v41.size.width = v41.size.width - v40;
    }
    if (*((_QWORD *)v48 + 5))
    {
      v32 = (id)-[UIAccessibilityElementMockView view](*((_QWORD *)v48 + 5));
      objc_msgSend(v32, "bounds");
      v41.size.width = v41.size.width - v12;

    }
    if (*((_QWORD *)v48 + 6))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (id)-[UIAccessibilityElementMockView view](*((_QWORD *)v48 + 6));
        objc_msgSend(v31, "frame");
        rect.origin.x = v13;
        rect.origin.y = v14;
        rect.size.width = v15;
        rect.size.height = v16;

        CGRectGetMaxX(v41);
        CGRectGetMinX(rect);
      }
    }
    v37 = 0;
    v30 = 0;
    if ((-[UITableViewCellAccessibility _accessibilityClientIgnoresReorderControl]() & 1) == 0)
    {
      v38 = (id)-[UITableViewCellAccessibility safeValueForKey:](v50, "safeValueForKey:", CFSTR("showsReorderControl"));
      v37 = 1;
      v30 = 0;
      if ((objc_msgSend(v38, "BOOLValue") & 1) != 0)
        v30 = objc_opt_respondsToSelector();
    }
    if ((v37 & 1) != 0)

    if ((v30 & 1) != 0)
    {
      v29 = v50;
      -[UITableViewCellAccessibility bounds](v50, "bounds");
      -[UITableViewCellAccessibility reorderRectForBounds:](v29, "reorderRectForBounds:", v17, v18, v19, v20);
    }
    UIAccessibilityFrameForBounds();
    v51 = v21;
    v52 = v22;
    v53 = v23;
    v54 = v24;
  }
  objc_storeStrong(&v48, 0);
  objc_storeStrong(location, 0);
  v25 = v51;
  v26 = v52;
  v27 = v53;
  v28 = v54;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (uint64_t)_accessibilityClientIgnoresReorderControl
{
  return 0;
}

- (id)_accessibilityRetrieveTableViewIvarsText
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  id v9;
  id v10;
  id location[2];
  UITableViewCellAccessibility *v12;

  v12 = self;
  location[1] = (id)a2;
  v9 = (id)-[UITableViewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("contentView"));
  location[0] = -[UIViewAccessibility _accessibilityRetrieveIvarText](v9);

  if (!objc_msgSend(location[0], "length"))
  {
    v2 = -[UIViewAccessibility _accessibilityRetrieveIvarText](v12);
    v3 = location[0];
    location[0] = v2;

  }
  v10 = (id)objc_msgSend(MEMORY[0x24BDD1690], "punctuationCharacterSet");
  v6 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  objc_msgSend(v10, "formUnionWithCharacterSet:");

  v7 = (id)objc_msgSend(location[0], "stringByTrimmingCharactersInSet:", v10);
  v8 = objc_msgSend(v7, "length") != 0;

  if (!v8)
    objc_storeStrong(location, 0);
  v5 = location[0];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)tableTextAccessibleLabel:(id)a3
{
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText](v6, "_accessibilityRetrieveTableViewCellText");
  objc_storeStrong(location, 0);
  return v4;
}

- (id)tableTextAccessibleStringKey:(id)a3
{
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 1);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accessibilityRetrieveTableViewCellText:(void *)a1
{
  if (a1)
    return (id)objc_msgSend(a1, "_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:shouldExcludeDetailText:forReorderControl:", a2, 0, 0);
  else
    return 0;
}

- (id)tableTextAccessibleLocalizationBundleID:(id)a3
{
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 2);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)tableTextAccessibleLocalizationBundlePath:(id)a3
{
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 3);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)tableTextAccessibleLocalizedTableName:(id)a3
{
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](v6, 4);
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_accessibilityLabelShouldBeDistinct:(id)a3
{
  uint64_t v3;
  id v5;
  char v6;
  char v7;
  id v8;
  id location[3];
  char v10;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)objc_msgSend(location[0], "isAccessibilityUserDefinedElement");
  v7 = 0;
  v6 = 1;
  if ((objc_msgSend(v5, "BOOLValue") & 1) == 0)
  {
    v3 = objc_msgSend(location[0], "accessibilityTraits");
    v6 = 1;
    if ((v3 & *MEMORY[0x24BDF73B0]) == 0)
    {
      v8 = (id)objc_msgSend(location[0], "accessibilityIdentification");
      v7 = 1;
      v6 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEBB300]);
    }
  }
  v10 = v6 & 1;
  if ((v7 & 1) != 0)

  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (id)_accessibilityRetrieveTableViewCellText
{
  return -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText:](self, 0);
}

- (id)_accessibilityRetrieveTableViewCellTextForReorderControl
{
  return -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellTextWithLocalizationOptions:shouldExcludeDetailText:forReorderControl:](self, "_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:shouldExcludeDetailText:forReorderControl:", 0, 0, 1, a2, self);
}

- (id)_accessibilityRetrieveTableViewCellTextExcludingDetailText
{
  if (a1)
    return (id)objc_msgSend(a1, "_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:shouldExcludeDetailText:forReorderControl:", 0, 1, 0);
  else
    return 0;
}

- (BOOL)_accessibilityUseElementAtPositionAfterActivation
{
  return (-[UITableViewCellAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible", a2, self) ^ 1) & 1;
}

- (id)_accessibilityRetrieveTableViewCellTextWithLocalizationOptions:(int64_t)a3 shouldExcludeDetailText:(BOOL)a4 forReorderControl:(BOOL)a5
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v38;
  id v39;
  id v40;
  const __CFString *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  id obj;
  uint64_t v55;
  id WeakRetained;
  int v57;
  id v58;
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  id v63;
  id v64[2];
  id v65;
  uint64_t v66;
  BOOL v67;
  id v68;
  _QWORD __b[8];
  id v70;
  id v71;
  id v72;
  char v73;
  id v74;
  id v75;
  id v76;
  char v77;
  id v78;
  id location;
  id v80;
  char v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  char v87;
  id v88;
  int v89;
  id v90;
  BOOL v91;
  BOOL v92;
  unint64_t v93;
  SEL v94;
  UITableViewCellAccessibility *v95;
  __CFString *v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v95 = self;
  v94 = a2;
  v93 = a3;
  v92 = a4;
  v91 = a5;
  if ((-[UITableViewCellAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", _accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl__InSortingSentinel) & 1) != 0)
  {
    v96 = CFSTR("IN_PROGRESS");
  }
  else
  {
    v90 = (id)-[UITableViewCellAccessibility accessibilityUserDefinedLabel](v95, "accessibilityUserDefinedLabel");
    if (v90)
    {
      v96 = (__CFString *)v90;
      v89 = 1;
    }
    else
    {
      v88 = (id)-[UITableViewCellAccessibility safeValueForKey:](v95, "safeValueForKey:", CFSTR("accessibilityTableViewCellText"));
      if (!objc_msgSend(v88, "length")
        && !-[UITableViewCellAccessibility isAccessibilityElement](v95, "isAccessibilityElement"))
      {
        v5 = (id)-[UITableViewCellAccessibility _accessibilityAXAttributedLabel](v95, "_accessibilityAXAttributedLabel");
        v6 = v88;
        v88 = v5;

      }
      v87 = -[UITableViewCellAccessibility isHidden](v95, "isHidden") & 1;
      if ((-[UITableViewCellAccessibility _accessibilityLanguageOverriddesUser](v95, "_accessibilityLanguageOverriddesUser") & 1) != 0)v7 = (id)*MEMORY[0x24BDFEBE0];
      else
        v7 = (id)*MEMORY[0x24BDFEB98];
      v86 = v7;
      if (!objc_msgSend(v88, "length"))
      {
        v85 = -[UITableViewCellAccessibility _accessibilityTextLabelIfExists](v95);
        v84 = -[UITableViewCellAccessibility _accessibilityDetailTextLabelIfExists](v95);
        v81 = 0;
        if (((objc_msgSend(v85, "_accessibilityViewIsVisible") & 1) != 0 || (v87 & 1) != 0)
          && !-[UITableViewCellAccessibility _accessibilityLabelShouldBeDistinct:](v95, "_accessibilityLabelShouldBeDistinct:", v85))
        {
          v82 = (id)objc_msgSend(v85, "accessibilityLabel");
          v81 = 1;
          v8 = v82;
        }
        else
        {
          v8 = 0;
        }
        v83 = v8;
        if ((v81 & 1) != 0)

        v59 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v9 = (id)objc_msgSend(v83, "stringByTrimmingCharactersInSet:");
        v10 = v83;
        v83 = v9;

        v80 = (id)objc_msgSend(v85, "accessibilityLanguage");
        if (v80 && v83)
        {
          v11 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v83);
          v12 = v83;
          v83 = v11;

          objc_msgSend(v83, "setAttribute:forKey:", v80, v86);
        }
        v77 = 0;
        if (((objc_msgSend(v84, "_accessibilityViewIsVisible") & 1) != 0 || (v87 & 1) != 0)
          && !-[UITableViewCellAccessibility _accessibilityLabelShouldBeDistinct:](v95, "_accessibilityLabelShouldBeDistinct:", v85))
        {
          v78 = (id)objc_msgSend(v84, "accessibilityLabel");
          v77 = 1;
          v13 = v78;
        }
        else
        {
          v13 = 0;
        }
        location = v13;
        if ((v77 & 1) != 0)

        v58 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v14 = (id)objc_msgSend(location, "stringByTrimmingCharactersInSet:");
        v15 = location;
        location = v14;

        v16 = (id)objc_msgSend(v84, "accessibilityLanguage");
        v17 = v80;
        v80 = v16;

        if (v80 && location)
        {
          v18 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", location);
          v19 = location;
          location = v18;

          objc_msgSend(location, "setAttribute:forKey:", v80, v86);
        }
        if ((-[UITableViewCellAccessibility _accessibilityTableCellUsesDetailTextAsValue](v95, "_accessibilityTableCellUsesDetailTextAsValue") & 1) != 0|| v92)
        {
          objc_storeStrong(&location, 0);
        }
        v39 = location;
        v20 = (id)__UIAXStringForVariables();
        v21 = v88;
        v88 = v20;

        v76 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "options", v39, CFSTR("__AXStringForVariablesSentinel"));
        v75 = -[UITableViewCellAccessibility _accessibilityInternalData](v95);
        WeakRetained = objc_loadWeakRetained((id *)v75 + 8);
        objc_opt_class();
        v73 = 0;
        LOBYTE(v57) = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v74 = objc_loadWeakRetained((id *)v75 + 8);
          v73 = 1;
          v57 = -[UITableViewCellAccessibilityElement usingRealTableViewCell]((uint64_t)v74) ^ 1;
        }
        if ((v73 & 1) != 0)

        if ((v57 & 1) != 0)
          objc_msgSend(v76, "setIncludeHiddenViews:", 1);
        v72 = (id)-[UITableViewCellAccessibility _badgeText](v95, "_badgeText");
        objc_msgSend(v76, "setShouldUseAllSubviews:", 1);
        -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v95, "_accessibilitySetBoolValue:forKey:", 1, _accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl__InSortingSentinel);
        v71 = (id)-[UITableViewCellAccessibility _accessibilityViewChildrenWithOptions:](v95, "_accessibilityViewChildrenWithOptions:", v76);
        -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v95, "_accessibilitySetBoolValue:forKey:", 0, _accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl__InSortingSentinel);
        memset(__b, 0, sizeof(__b));
        obj = v71;
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v97, 16);
        if (v55)
        {
          v51 = *(_QWORD *)__b[2];
          v52 = 0;
          v53 = v55;
          while (1)
          {
            v50 = v52;
            if (*(_QWORD *)__b[2] != v51)
              objc_enumerationMutation(obj);
            v70 = *(id *)(__b[1] + 8 * v52);
            if (v70 != v85 && v70 != v84)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend(v70, "isAccessibilityElement") & 1) != 0
                && !-[UITableViewCellAccessibility _accessibilityLabelShouldBeDistinct:](v95, "_accessibilityLabelShouldBeDistinct:", v70))
              {
                v68 = 0;
                if (v93 <= 4)
                  __asm { BR              X8 }
                v22 = (id)objc_msgSend(v70, "accessibilityLanguage");
                v23 = v80;
                v80 = v22;

                if (v80)
                {
                  v24 = (id)objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v68);
                  v25 = v68;
                  v68 = v24;

                  objc_msgSend(v68, "setAttribute:forKey:", v80, v86);
                }
                v67 = 0;
                v49 = 0;
                if ((objc_msgSend(v68, "isEqualToString:", v72, v38, v41) & 1) != 0)
                  v49 = objc_msgSend(v72, "length") != 0;
                v67 = v49;
                if (!v49)
                {
                  v38 = v68;
                  v41 = CFSTR("__AXStringForVariablesSentinel");
                  v26 = (id)__UIAXStringForVariables();
                  v27 = v88;
                  v88 = v26;

                }
                objc_storeStrong(&v68, 0);
              }
            }
            ++v52;
            if (v50 + 1 >= v53)
            {
              v52 = 0;
              v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v97, 16);
              if (!v53)
                break;
            }
          }
        }

        objc_storeStrong(&v71, 0);
        objc_storeStrong(&v72, 0);
        objc_storeStrong(&v75, 0);
        objc_storeStrong(&v76, 0);
        objc_storeStrong(&location, 0);
        objc_storeStrong(&v80, 0);
        objc_storeStrong(&v83, 0);
        objc_storeStrong(&v84, 0);
        objc_storeStrong(&v85, 0);
      }
      if ((objc_msgSend(v88, "isAXAttributedString", v38) & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v47 = v88;
          v48 = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
          v28 = (id)objc_msgSend(v47, "stringByTrimmingCharactersInSet:");
          v29 = v88;
          v88 = v28;

        }
      }
      if (!objc_msgSend(v88, "length"))
      {
        v30 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewIvarsText](v95, "_accessibilityRetrieveTableViewIvarsText");
        v31 = v88;
        v88 = v30;

      }
      v66 = AXRequestingClient();
      if (v66 == 3 || v66 == 4)
      {
        v65 = 0;
        if ((-[UITableViewCellAccessibility safeBoolForKey:](v95, "safeBoolForKey:", CFSTR("_hasEditingAccessoryView")) & 1) == 0
          && !v91)
        {
          v45 = (id)-[UITableViewCellAccessibility safeValueForKey:](v95, "safeValueForKey:", CFSTR("editingStyle"));
          v46 = (void *)(int)objc_msgSend(v45, "intValue");

          v64[1] = v46;
          if (v46 == (void *)1)
          {
            v43 = (id)accessibilityUIKitLocalizedString();
            v40 = v88;
            v34 = (id)AXCFormattedString();
            v35 = v65;
            v65 = v34;

          }
          else if (v46 == (void *)2)
          {
            v44 = (id)accessibilityUIKitLocalizedString();
            v40 = v88;
            v32 = (id)AXCFormattedString();
            v33 = v65;
            v65 = v32;

          }
        }
        if (objc_msgSend(v88, "length", v40) && (objc_msgSend(v88, "isAXAttributedString") & 1) != 0 && v65)
        {
          v64[0] = v88;
          v63 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", v65);
          *(_QWORD *)&v62 = objc_msgSend(v63, "rangeOfString:", v88);
          *((_QWORD *)&v62 + 1) = v36;
          if (v36 == objc_msgSend(v88, "length"))
          {
            v42 = v64[0];
            v60 = v63;
            v61 = v62;
            objc_msgSend(v42, "enumerateAttributesUsingBlock:");
            objc_storeStrong(&v60, 0);
          }
          objc_storeStrong(&v88, v63);
          objc_storeStrong(&v63, 0);
          objc_storeStrong(v64, 0);
        }
        else if (v65)
        {
          objc_storeStrong(&v88, v65);
        }
        objc_storeStrong(&v65, 0);
      }
      v96 = (__CFString *)v88;
      v89 = 1;
      objc_storeStrong(&v86, 0);
      objc_storeStrong(&v88, 0);
    }
    objc_storeStrong(&v90, 0);
  }
  return v96;
}

void __137__UITableViewCellAccessibility__accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(_QWORD *, void *, void *);
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  id location[2];
  __int128 v19;

  *(_QWORD *)&v19 = a3;
  *((_QWORD *)&v19 + 1) = a4;
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = a5;
  v16 = a1;
  v7 = location[0];
  v8 = MEMORY[0x24BDAC760];
  v9 = -1073741824;
  v10 = 0;
  v11 = __137__UITableViewCellAccessibility__accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl___block_invoke_2;
  v12 = &unk_24FF3F730;
  v13 = *(id *)(a1 + 32);
  v14 = *(_OWORD *)(a1 + 40);
  v15 = v19;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:");
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __137__UITableViewCellAccessibility__accessibilityRetrieveTableViewCellTextWithLocalizationOptions_shouldExcludeDetailText_forReorderControl___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v3;
  void *v4;
  id v7;
  id location[3];
  uint64_t v9;
  uint64_t v10;
  void *v11;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v3 = (void *)a1[4];
  v4 = (void *)a1[8];
  v9 = a1[5] + a1[7];
  location[2] = v4;
  v10 = v9;
  v11 = v4;
  objc_msgSend(v3, "setAttribute:forKey:withRange:", v7, location[0], v9, v4);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)didTransitionToState:(unint64_t)a3
{
  objc_super v3;
  unint64_t v4;
  SEL v5;
  UITableViewCellAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility didTransitionToState:](&v3, sel_didTransitionToState_, a3);
  if ((v4 & 2) != 0 || (v4 & 1) != 0)
  {
    -[UITableViewCellAccessibility _accessibilityClearChildren](v6, "_accessibilityClearChildren");
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  char v4;
  objc_super v5;
  char v6;
  BOOL v7;
  BOOL v8;
  SEL v9;
  UITableViewCellAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = a4;
  v6 = -[UITableViewCellAccessibility showingDeleteConfirmation](self, "showingDeleteConfirmation") & 1;
  v5.receiver = v10;
  v5.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility setEditing:animated:](&v5, sel_setEditing_animated_, v8, v7);
  v4 = -[UITableViewCellAccessibility showingDeleteConfirmation](v10, "showingDeleteConfirmation") & 1;
  if ((v6 & 1) != v4)
  {
    -[UITableViewCellAccessibility _accessibilityClearChildren](v10, "_accessibilityClearChildren");
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

- (void)_setSwipeContainerView:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility _setSwipeContainerView:](&v4, sel__setSwipeContainerView_, location[0]);
  if (location[0])
  {
    v3 = location[0];
    AXPerformBlockAsynchronouslyOnMainThread();
    objc_storeStrong(&v3, 0);
  }
  objc_storeStrong(location, 0);
}

void __55__UITableViewCellAccessibility__setSwipeContainerView___block_invoke(id *a1)
{
  id v1;
  id v2;
  id argument[3];

  argument[2] = a1;
  argument[1] = a1;
  argument[0] = 0;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v1 = (id)objc_msgSend(a1[4], "_accessibilityFindSubviewDescendant:", &__block_literal_global_528);
    v2 = argument[0];
    argument[0] = v1;

  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument[0]);
  objc_storeStrong(argument, 0);
}

uint64_t __55__UITableViewCellAccessibility__setSwipeContainerView___block_invoke_2(void *a1, void *a2)
{
  char v3;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  v3 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(location[0], "_accessibilityViewIsVisible");
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)_setShowingDeleteConfirmation:(BOOL)a3
{
  id v3;
  id v4;
  id argument;
  objc_super v6;
  char v7;
  BOOL v8;
  SEL v9;
  UITableViewCellAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = -[UITableViewCellAccessibility showingDeleteConfirmation](self, "showingDeleteConfirmation") & 1;
  v6.receiver = v10;
  v6.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility _setShowingDeleteConfirmation:](&v6, sel__setShowingDeleteConfirmation_, v8);
  if ((v7 & 1) != v8)
  {
    -[UITableViewCellAccessibility _accessibilityClearChildren](v10, "_accessibilityClearChildren");
    argument = 0;
    if (UIAccessibilityIsVoiceOverRunning())
    {
      v3 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v10);
      v4 = argument;
      argument = v3;

    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
    objc_storeStrong(&argument, 0);
  }
}

- (BOOL)_accessibilityTableViewCellSubclassShouldExist
{
  return 1;
}

- (void)setShowingDeleteConfirmation:(BOOL)a3
{
  id v3;
  id v4;
  id argument;
  objc_super v6;
  char v7;
  BOOL v8;
  SEL v9;
  UITableViewCellAccessibility *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  v7 = -[UITableViewCellAccessibility showingDeleteConfirmation](self, "showingDeleteConfirmation") & 1;
  v6.receiver = v10;
  v6.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility setShowingDeleteConfirmation:](&v6, sel_setShowingDeleteConfirmation_, v8);
  if ((v7 & 1) != v8)
  {
    -[UITableViewCellAccessibility _accessibilityClearChildren](v10, "_accessibilityClearChildren");
    argument = 0;
    if (UIAccessibilityIsVoiceOverRunning())
    {
      v3 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v10);
      v4 = argument;
      argument = v3;

    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
    objc_storeStrong(&argument, 0);
  }
}

- (uint64_t)_axSubviewIgnoredDueToHiddenOrZeroAlphaAncestry:(uint64_t)a1
{
  id location;
  uint64_t v4;
  char v5;

  v4 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v4)
    v5 = UIAccessibilityViewHasHiddenOrZeroAlphaAncestor() & 1;
  else
    v5 = 0;
  objc_storeStrong(&location, 0);
  return v5 & 1;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 0;
}

- (id)_accessibilityChildren
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  UITableViewCellAccessibility *v15;
  id v16;
  void *v17;
  id v18;
  double v19;
  UITableViewCellAccessibility *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  UITableViewCellAccessibility *v25;
  id v26;
  id v27;
  objc_class *v28;
  objc_class *v29;
  id v30;
  UITableViewCellAccessibility *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  char v49;
  char v50;
  id v51;
  id v52;
  BOOL v53;
  unint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  id v65;
  id v66;
  BOOL v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  char v73;
  id v74;
  char v75;
  id v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  id v82;
  uint64_t v83;
  int v84;
  id v85;
  id v86;
  BOOL v87;
  BOOL v88;
  id v89;
  id v90;
  BOOL v91;
  char v92;
  unint64_t v93;
  id v94;
  id v95;
  BOOL v96;
  NSObject *log;
  os_log_type_t v98;
  BOOL v99;
  id WeakRetained;
  int v101;
  char v102;
  id v103;
  char v104;
  id v105;
  id v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  char v117;
  id v118;
  UITableViewCellAccessibility *v119;
  id v120;
  char v121;
  id v122;
  char v123;
  id v124;
  char v125;
  id v126;
  uint64_t v127;
  double v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  char v136;
  NSString *v137;
  char v138;
  NSString *v139;
  id v140;
  _QWORD v141[8];
  uint64_t v142;
  id v143;
  id v144;
  char v145;
  id v146;
  UITableViewCellAccessibility *v147;
  uint64_t v148;
  char v149;
  id v150;
  char v151;
  id v152;
  id v153;
  char v154;
  _QWORD __b[8];
  id v156;
  id v157;
  BOOL v158;
  char v159;
  id v160;
  char v161;
  id v162;
  BOOL v163;
  id v164;
  id v165;
  char v166;
  char v167;
  id v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  id v173;
  char v174;
  char v175;
  uint64_t v176;
  id v177;
  id v178;
  char v179;
  id v180;
  id v181;
  char v182;
  id v183;
  char v184;
  id v185;
  id v186;
  __int128 v187;
  __int128 v188;
  id v189;
  id v190;
  id v191;
  char v192;
  char v193;
  id v194;
  char v195;
  int v196;
  uint8_t v197[15];
  os_log_type_t type;
  id location;
  char v200;
  id v201;
  id v202;
  id v203;
  char v204;
  SEL v205;
  UITableViewCellAccessibility *v206;
  id v207;
  _BYTE v208[128];
  _BYTE v209[128];
  uint64_t v210;

  v210 = *MEMORY[0x24BDAC8D0];
  v206 = self;
  v205 = a2;
  v204 = -[UITableViewCellAccessibility accessibilityIsFetchingChildren]((uint64_t)self) & 1;
  -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v206, 1);
  if (!_accessibilityChildren_DeleteSwitchClass)
    _accessibilityChildren_DeleteSwitchClass = (uint64_t)NSClassFromString(CFSTR("UITableViewCellEditControl"));
  v203 = -[UITableViewCellAccessibility _accessibilityInternalData](v206);
  v202 = (id)-[UITableViewCellAccessibility accessibilityContainer](v206, "accessibilityContainer");
  WeakRetained = objc_loadWeakRetained((id *)v203 + 8);
  LOBYTE(v101) = 0;
  if (!WeakRetained)
  {
    objc_opt_class();
    LOBYTE(v101) = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v101 = -[UITableViewCellAccessibility _accessibilityTableViewIsOpaque](v206) ^ 1;
  }

  if ((v101 & 1) != 0)
  {
    -[UITableViewAccessibility accessibilityFindMockParentForTableViewCell:](v202, v206);
    v2 = (id)-[UITableViewCellAccessibility _accessibilityValueForKey:](v206, "_accessibilityValueForKey:", CFSTR("AXInternalData"));
    v3 = v203;
    v203 = v2;

    v200 = 0;
    v99 = 1;
    if (v203)
    {
      v201 = objc_loadWeakRetained((id *)v203 + 8);
      v200 = 1;
      v99 = v201 == 0;
    }
    if ((v200 & 1) != 0)

    if (v99)
    {
      location = (id)AXLogAppAccessibility();
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        log = location;
        v98 = type;
        __os_log_helper_16_0_0(v197);
        _os_log_error_impl(&dword_230C4A000, log, v98, "Could not find my mock parent, most likely I am stale.", v197, 2u);
      }
      objc_storeStrong(&location, 0);
      -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v206, v204 & 1);
      -[UITableViewCellAccessibility _axSetShouldForceRefreshChildren:](v206, "_axSetShouldForceRefreshChildren:", 0);
      v207 = 0;
      v196 = 1;
      goto LABEL_226;
    }
  }
  else
  {
    v4 = objc_loadWeakRetained((id *)v203 + 8);
    v96 = v4 != 0;

    if (!v96)
      objc_storeWeak((id *)v203 + 8, v206);
  }
  v195 = -[UITableViewCellAccessibility isHiddenOrHasHiddenAncestor](v206, "isHiddenOrHasHiddenAncestor") & 1;
  if (-[UITableViewCellAccessibility _accessibilityUsesOverrideContainerProtocol](v206, "_accessibilityUsesOverrideContainerProtocol"))
  {
    -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v206, v204 & 1);
    -[UITableViewCellAccessibility _axSetShouldForceRefreshChildren:](v206, "_axSetShouldForceRefreshChildren:", 0);
    v207 = -[UITableViewCellAccessibility _accessibilityContainerElements](v206);
    v196 = 1;
    goto LABEL_226;
  }
  v194 = 0;
  if (objc_msgSend(0, "count") && *((id *)v203 + 1) != v194)
  {
    v5 = objc_msgSend(v194, "mutableCopyWithZone:", 0);
    v6 = (void *)*((_QWORD *)v203 + 1);
    *((_QWORD *)v203 + 1) = v5;

    *((_BYTE *)v203 + 16) = v195 & 1;
  }
  if (objc_msgSend(*((id *)v203 + 1), "count"))
  {
    v193 = 0;
    if (-[UITableViewCellAccessibility _axShouldForceRefreshChildren](v206, "_axShouldForceRefreshChildren"))
    {
      v193 = 1;
    }
    else
    {
      v192 = -[UITableViewCellAccessibility _accessibilityIsRemoveControlVisible](v206) & 1;
      if ((!v192 || *((_QWORD *)v203 + 3)) && ((v192 & 1) != 0 || !*((_QWORD *)v203 + 3)))
      {
        if ((v195 & 1) != (*((_BYTE *)v203 + 16) & 1))
          v193 = 1;
      }
      else
      {
        v193 = 1;
      }
    }
    if ((v193 & 1) == 0)
    {
      -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v206, v204 & 1);
      -[UITableViewCellAccessibility _axSetShouldForceRefreshChildren:](v206, "_axSetShouldForceRefreshChildren:", 0);
      v207 = *((id *)v203 + 1);
      v196 = 1;
      goto LABEL_225;
    }
    v191 = objc_loadWeakRetained((id *)v203 + 8);
    v190 = *((id *)v203 + 4);
    -[UITableViewCellAccessibility _accessibilityClearChildren](v206, "_accessibilityClearChildren");
    v7 = -[UITableViewCellAccessibility _accessibilityInternalData](v206);
    v8 = v203;
    v203 = v7;

    objc_msgSend(*((id *)v203 + 1), "axSafelyAddObject:", v190);
    objc_storeStrong((id *)v203 + 4, v190);
    -[UITableTextAccessibilityElement setTextDelegate:](*((id **)v203 + 4), v191);
    -[UITableTextAccessibilityElement setAttributeDelegate:](*((id **)v203 + 4), v191);
    objc_msgSend(v191, "registerMockChild:", *((_QWORD *)v203 + 4));
    objc_msgSend(*((id *)v203 + 4), "setAccessibilityContainer:", v191);
    objc_storeWeak((id *)v203 + 8, v191);
    objc_storeStrong(&v190, 0);
    objc_storeStrong(&v191, 0);
  }
  *((_BYTE *)v203 + 16) = v195 & 1;
  v189 = objc_loadWeakRetained((id *)v203 + 8);
  objc_msgSend(v189, "accessibilityFrame");
  *(_QWORD *)&v187 = v9;
  *((_QWORD *)&v187 + 1) = v10;
  *(_QWORD *)&v188 = v11;
  *((_QWORD *)&v188 + 1) = v12;
  v186 = (id)-[UITableViewCellAccessibility _accessibilityAXAttributedHint](v206, "_accessibilityAXAttributedHint");
  v185 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText](v206, "_accessibilityRetrieveTableViewCellText");
  v184 = -[UITableViewCellAccessibility _accessibilityIgnoreInternalLabels](v206, "_accessibilityIgnoreInternalLabels");
  v183 = *((id *)v203 + 4);
  if (v183 || !v189)
  {
    objc_msgSend(v183, "setAccessibilityLabel:", 0);
  }
  else
  {
    v13 = (void *)objc_msgSend(objc_allocWithZone((Class)UITableTextAccessibilityElement), "initWithAccessibilityContainer:", v189);
    v14 = v183;
    v183 = v13;

  }
  objc_msgSend(v189, "registerMockChild:", v183);
  v182 = 0;
  v95 = objc_loadWeakRetained((id *)v203 + 8);
  v179 = 0;
  if (v95)
  {
    v180 = objc_loadWeakRetained((id *)v203 + 8);
    v179 = 1;
    v15 = (UITableViewCellAccessibility *)v180;
  }
  else
  {
    v15 = v206;
  }
  v181 = v15;
  if ((v179 & 1) != 0)

  if (objc_msgSend(v185, "length"))
  {
    objc_msgSend(v183, "setAccessibilityLabel:", v185);
    -[UITableTextAccessibilityElement setTextDelegate:]((id *)v183, v181);
    v94 = -[UITableViewCellAccessibility accessibilityValue](v206, "accessibilityValue");
    objc_msgSend(v183, "setAccessibilityValue:");

    objc_msgSend(v183, "setAccessibilityTraits:", -[UITableViewCellAccessibility accessibilityTraits](v206, "accessibilityTraits"));
    -[UITableTextAccessibilityElement setAttributeDelegate:]((id *)v183, v181);
    v182 = 1;
  }
  else
  {
    -[UITableTextAccessibilityElement setTextDelegate:]((id *)v183, v181);
    -[UITableTextAccessibilityElement setAttributeDelegate:]((id *)v183, v181);
  }
  v178 = (id)objc_msgSend(*((id *)v203 + 7), "copyWithZone:", 0);
  objc_msgSend(*((id *)v203 + 7), "removeAllObjects");
  v177 = -[UITableViewCellAccessibility _accessibilitySubviewsForAdding](v206);
  v176 = 0;
  v176 = objc_msgSend(*((id *)v203 + 1), "count");
  v175 = 0;
  v174 = 0;
  v173 = (id)-[UITableViewCellAccessibility safeValueForKey:](v206, "safeValueForKey:", CFSTR("_accessoryView"));
  if (v173)
    objc_msgSend(v177, "addObject:", v173);
  v172 = 0;
  v171 = 0;
  v170 = 0;
  while (1)
  {
    v93 = v171;
    if (v93 >= objc_msgSend(v177, "count"))
      break;
    v169 = (id)objc_msgSend(v177, "objectAtIndex:", v171);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v196 = 4;
      goto LABEL_153;
    }
    v167 = 0;
    v92 = 1;
    if (v169 != v173)
    {
      v168 = (id)objc_msgSend(v169, "accessibilityIdentification");
      v167 = 1;
      v92 = objc_msgSend(v168, "isEqualToString:", CFSTR("UITableViewCellAccessoryDetailButton"));
    }
    if ((v167 & 1) != 0)

    if ((v92 & 1) != 0)
    {
      v196 = 4;
      goto LABEL_153;
    }
    if ((objc_msgSend(v169, "accessibilityElementsHidden") & 1) != 0)
    {
      v196 = 4;
      goto LABEL_153;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || -[UITableViewCellAccessibility _accessibilityLabelShouldBeDistinct:](v206, "_accessibilityLabelShouldBeDistinct:", v169))
    {
      v90 = v169;
      v18 = -[UITableViewCellAccessibility _accessibilityTableViewSwitch](v206, "_accessibilityTableViewSwitch");
      v91 = v90 != v18;

      if (!v91)
      {
        v166 = 0;
        objc_opt_class();
        v165 = (id)__UIAccessibilityCastAsSafeCategory();
        if ((v166 & 1) != 0)
          abort();
        v164 = v165;
        objc_storeStrong(&v165, 0);
        v89 = v164;
        objc_msgSend(v164, "_accessibilitySetIsAccessibleViaTableViewCell:", 1);

      }
      v163 = 0;
      v88 = 0;
      if ((objc_msgSend(v169, "isAccessibilityElement") & 1) != 0)
      {
        objc_msgSend(v169, "alpha");
        v88 = v19 > 0.0;
      }
      v163 = v88;
      v161 = 0;
      v159 = 0;
      v87 = 0;
      if (v88)
      {
        v86 = v169;
        v162 = -[UITableViewCellAccessibility _accessibilityFindRemoveConfirmSubview](v206);
        v161 = 1;
        v87 = 0;
        if (v86 != v162)
        {
          v85 = v169;
          v160 = -[UITableViewCellAccessibility _accessibilityCellEditingControl](v206, "_accessibilityCellEditingControl");
          v159 = 1;
          v87 = v85 != v160;
        }
      }
      v163 = v87;
      if ((v159 & 1) != 0)

      if ((v161 & 1) != 0)
      v158 = 0;
      if (v163)
        v84 = -[UITableViewCellAccessibility _axSubviewIgnoredDueToHiddenOrZeroAlphaAncestry:]((uint64_t)v206, v169) & 1;
      else
        v84 = 1;
      v158 = v84 != 0;
      if (!v163 || v158)
      {
        v150 = (id)objc_msgSend(v169, "superview");
        v149 = 0;
        while (1)
        {
          v67 = 0;
          if (v150)
            v67 = v150 != v206;
          if (!v67)
            break;
          if ((objc_msgSend(v150, "accessibilityElementsHidden") & 1) != 0)
          {
            v149 = 1;
            break;
          }
          v23 = (id)objc_msgSend(v150, "superview");
          v24 = v150;
          v150 = v23;

        }
        if ((v149 & 1) != 0)
        {
          v196 = 4;
        }
        else
        {
          if ((objc_msgSend(v169, "isAccessibilityElement") & 1) == 0
            && (objc_msgSend(v169, "accessibilityElementsHidden") & 1) == 0)
          {
            v148 = 0;
            v148 = objc_msgSend(v169, "accessibilityElementCount");
            if (v148 == 0x7FFFFFFFFFFFFFFFLL || v148 <= 0)
            {
              v143 = (id)objc_msgSend(v169, "subviews");
              v26 = (id)-[UITableViewCellAccessibility _accessibilityGeometrySortedElements:](v206, "_accessibilityGeometrySortedElements:", v143);
              v27 = v143;
              v143 = v26;

              memset(v141, 0, sizeof(v141));
              v63 = v143;
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", v141, v208, 16);
              if (v64)
              {
                v60 = *(_QWORD *)v141[2];
                v61 = 0;
                v62 = v64;
                while (1)
                {
                  v59 = v61;
                  if (*(_QWORD *)v141[2] != v60)
                    objc_enumerationMutation(v63);
                  v142 = *(_QWORD *)(v141[1] + 8 * v61);
                  if (objc_msgSend(v177, "indexOfObjectIdenticalTo:", v142) == 0x7FFFFFFFFFFFFFFFLL)
                    objc_msgSend(v177, "addObject:", v142);
                  ++v61;
                  if (v59 + 1 >= v62)
                  {
                    v61 = 0;
                    v62 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", v141, v208, 16);
                    if (!v62)
                      break;
                  }
                }
              }

              objc_storeStrong(&v143, 0);
            }
            else
            {
              if (-[UITableViewCellAccessibility _accessibilityAvoidsMockViewContainers](v206, "_accessibilityAvoidsMockViewContainers"))
              {
                objc_msgSend(v169, "setAccessibilityContainer:", v206);
                objc_msgSend(v169, "_setAccessibilityShouldUseViewHierarchyForFindingScrollParent:", 1);
                objc_msgSend(*((id *)v203 + 1), "addObject:", v169);
              }
              else
              {
                v66 = objc_loadWeakRetained((id *)v203 + 8);
                v145 = 0;
                if (v66)
                {
                  v146 = objc_loadWeakRetained((id *)v203 + 8);
                  v145 = 1;
                  v25 = (UITableViewCellAccessibility *)v146;
                }
                else
                {
                  v25 = v206;
                }
                v147 = v25;
                if ((v145 & 1) != 0)

                v144 = (id)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityElementMockView), "initWithAccessibilityContainer:", v147);
                objc_msgSend(v144, "setIsAccessibilityElement:", 0);
                -[UIAccessibilityElementMockView setView:]((id *)v144, v169);
                objc_msgSend(*((id *)v203 + 1), "addObject:", v144);
                v65 = objc_loadWeakRetained((id *)v203 + 8);
                objc_msgSend(v65, "registerMockChild:", v144);

                objc_msgSend(*((id *)v203 + 7), "addObject:", v144);
                objc_storeStrong(&v144, 0);
                objc_storeStrong((id *)&v147, 0);
              }
              v174 = 1;
            }
          }
          v196 = 0;
        }
        objc_storeStrong(&v150, 0);
        if (!v196)
LABEL_152:
          v196 = 0;
      }
      else
      {
        v157 = 0;
        memset(__b, 0, sizeof(__b));
        v82 = v178;
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __b, v209, 16);
        if (v83)
        {
          v79 = *(_QWORD *)__b[2];
          v80 = 0;
          v81 = v83;
          while (1)
          {
            v78 = v80;
            if (*(_QWORD *)__b[2] != v79)
              objc_enumerationMutation(v82);
            v156 = *(id *)(__b[1] + 8 * v80);
            v76 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v156);
            objc_opt_class();
            v77 = 0;
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v77 = -[UIAccessibilityElementMockView subviewIndex]((uint64_t)v156) == v171;

            if (v77)
              break;
            ++v80;
            if (v78 + 1 >= v81)
            {
              v80 = 0;
              v81 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", __b, v209, 16);
              if (!v81)
                goto LABEL_98;
            }
          }
          objc_storeStrong(&v157, v156);
          v196 = 5;
        }
        else
        {
LABEL_98:
          v196 = 0;
        }

        v74 = (id)objc_msgSend(v157, "accessibilityIdentification");
        v75 = objc_msgSend(v74, "isEqualToString:", CFSTR("UITableCellViewDisclosure"));

        if ((v75 & 1) != 0)
        {
          objc_storeStrong(&v172, v169);
          v196 = 4;
        }
        else
        {
          v154 = 0;
          v73 = 1;
          if (!-[UITableViewCellAccessibility _accessibilityAvoidsMockViewContainers](v206, "_accessibilityAvoidsMockViewContainers"))v73 = objc_msgSend(v169, "_accessibilityAvoidsMockViewContainers");
          v154 = v73 & 1;
          if ((v73 & 1) != 0)
          {
            objc_msgSend(v169, "_setAccessibilityShouldUseViewHierarchyForFindingScrollParent:", 1);
            v70 = v169;
            v71 = objc_loadWeakRetained((id *)v203 + 8);
            objc_msgSend(v70, "setAccessibilityContainer:");

            v72 = objc_loadWeakRetained((id *)v203 + 8);
            objc_msgSend(v72, "registerMockChild:", v169);

            objc_msgSend(*((id *)v203 + 1), "addObject:", v169);
          }
          else
          {
            v69 = objc_loadWeakRetained((id *)v203 + 8);
            v151 = 0;
            if (v69)
            {
              v152 = objc_loadWeakRetained((id *)v203 + 8);
              v151 = 1;
              v20 = (UITableViewCellAccessibility *)v152;
            }
            else
            {
              v20 = v206;
            }
            v153 = v20;
            if ((v151 & 1) != 0)

            if (v157)
            {
              objc_msgSend(v157, "setAccessibilityContainer:", v153);
            }
            else
            {
              v21 = (void *)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityElementMockView), "initWithAccessibilityContainer:", v153);
              v22 = v157;
              v157 = v21;

            }
            if ((objc_msgSend(*((id *)v203 + 1), "containsObject:", v157) & 1) == 0)
            {
              v68 = objc_loadWeakRetained((id *)v203 + 8);
              objc_msgSend(v68, "registerMockChild:", v157);

              objc_msgSend(*((id *)v203 + 1), "addObject:", v157);
            }
            -[UIAccessibilityElementMockView setSubviewIndex:]((uint64_t)v157, v171);
            -[UIAccessibilityElementMockView setView:]((id *)v157, v169);
            objc_msgSend(*((id *)v203 + 7), "addObject:", v157);
            objc_storeStrong(&v153, 0);
          }
          ++v170;
          v174 = 1;
          v196 = 0;
        }
        objc_storeStrong(&v157, 0);
        if (!v196)
          goto LABEL_152;
      }
    }
    else
    {
      if (!*((_QWORD *)v203 + 10))
      {
        v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v17 = (void *)*((_QWORD *)v203 + 10);
        *((_QWORD *)v203 + 10) = v16;

      }
      if ((objc_msgSend(v169, "isAccessibilityElement") & 1) != 0
        && (objc_msgSend(*((id *)v203 + 10), "containsObject:", v169) & 1) == 0)
      {
        objc_msgSend(*((id *)v203 + 10), "addObject:", v169);
      }
      v196 = 4;
    }
LABEL_153:
    objc_storeStrong(&v169, 0);
    ++v171;
  }
  if ((v182 & 1) == 0 && (v175 & 1) == 0)
  {
    v140 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewIvarsText](v206, "_accessibilityRetrieveTableViewIvarsText");
    if (objc_msgSend(v140, "length"))
    {
      objc_msgSend(v183, "setAccessibilityLabel:", v140);
      v182 = 1;
    }
    v138 = 0;
    v136 = 0;
    v58 = 0;
    if ((v182 & 1) == 0)
    {
      v58 = 0;
      if ((v174 & 1) == 0)
      {
        v28 = (objc_class *)objc_opt_class();
        v139 = NSStringFromClass(v28);
        v138 = 1;
        v29 = (objc_class *)objc_opt_class();
        v137 = NSStringFromClass(v29);
        v136 = 1;
        v58 = 0;
        if (!-[NSString isEqualToString:](v139, "isEqualToString:"))
          v58 = -[UITableViewCellAccessibility _accessibilityTableViewCellSubclassShouldExist](v206, "_accessibilityTableViewCellSubclassShouldExist");
      }
    }
    if ((v136 & 1) != 0)

    if ((v138 & 1) != 0)
    if (v58)
    {
      objc_msgSend(v183, "setAccessibilityLabel:", CFSTR(" "));
      v182 = 1;
    }
    objc_storeStrong(&v140, 0);
  }
  v56 = (id)-[UITableViewCellAccessibility window](v206, "window");
  v55 = (id)objc_msgSend(v56, "windowScene");
  v57 = objc_msgSend(v55, "interfaceOrientation");

  v135 = v57;
  if ((-[UITableViewCellAccessibility _accessibilityIsTouchContainer](v206, "_accessibilityIsTouchContainer") & 1) != 0)
    v184 = 1;
  if (((v182 & 1) != 0 || (v175 & 1) != 0) && (v184 & 1) == 0)
  {
    v133 = v187;
    v134 = v188;
    v131 = v187;
    v132 = v188;
    v129 = v187;
    v130 = v188;
    objc_msgSend(v183, "setAccessibilityFrame:", v187, v188);
    if ((objc_msgSend(*((id *)v203 + 1), "containsObject:", v183) & 1) == 0)
    {
      if (objc_msgSend(*((id *)v203 + 1), "count") == v176
        || (v54 = v176, v54 > objc_msgSend(*((id *)v203 + 1), "count")))
      {
        objc_msgSend(*((id *)v203 + 1), "addObject:", v183);
      }
      else
      {
        objc_msgSend(*((id *)v203 + 1), "insertObject:atIndex:", v183, v176);
      }
    }
    objc_storeStrong((id *)v203 + 4, v183);
    objc_msgSend(v183, "setAccessibilityHint:", v186);
  }
  v128 = 0.0;
  -[UITableViewCellAccessibility _accessibilityHandleRemoveSwitch](v206);
  -[UITableViewCellAccessibility _accessibilityHandleRemoveConfirm](v206);
  if (!v172)
  {
    v127 = -[UITableViewCellAccessibility accessoryType](v206, "accessoryType");
    if (v127 == 2 || v127 == 4)
    {
      v125 = 0;
      v123 = 0;
      if ((-[UITableViewCellAccessibility isEditing](v206, "isEditing") & 1) != 0)
      {
        v30 = (id)-[UITableViewCellAccessibility safeUIViewForKey:](v206, "safeUIViewForKey:", CFSTR("_editingAccessoryView"));
        v126 = v30;
        v125 = 1;
      }
      else
      {
        v30 = (id)-[UITableViewCellAccessibility safeUIViewForKey:](v206, "safeUIViewForKey:", CFSTR("_accessoryView"));
        v124 = v30;
        v123 = 1;
      }
      objc_storeStrong(&v172, v30);
      if ((v123 & 1) != 0)

      if ((v125 & 1) != 0)
    }
    v121 = 0;
    v53 = 1;
    if ((objc_msgSend(v172, "isAccessibilityElement") & 1) != 0)
    {
      v122 = (id)objc_msgSend(v172, "superview");
      v121 = 1;
      v53 = v122 == 0;
    }
    if ((v121 & 1) != 0)

    if (v53)
      objc_storeStrong(&v172, 0);
  }
  if (v172)
  {
    v120 = *((id *)v203 + 6);
    if (!v120)
    {
      v52 = objc_loadWeakRetained((id *)v203 + 8);
      v117 = 0;
      if (v52)
      {
        v118 = objc_loadWeakRetained((id *)v203 + 8);
        v117 = 1;
        v31 = (UITableViewCellAccessibility *)v118;
      }
      else
      {
        v31 = v206;
      }
      v119 = v31;
      if ((v117 & 1) != 0)

      v32 = (void *)objc_msgSend(objc_allocWithZone((Class)UIAccessibilityElementMockView), "initWithAccessibilityContainer:", v119);
      v33 = v120;
      v120 = v32;

      objc_storeStrong((id *)&v119, 0);
    }
    -[UIAccessibilityElementMockView setView:]((id *)v120, v172);
    objc_msgSend(*((id *)v203 + 1), "addObject:", v120);
    objc_storeStrong((id *)v203 + 6, v120);
    v51 = objc_loadWeakRetained((id *)v203 + 8);
    objc_msgSend(v51, "registerMockChild:", v120);

    if (UIInterfaceOrientationIsLandscape(v135))
    {
      objc_msgSend(v120, "accessibilityFrame");
      v113 = v34;
      v114 = v35;
      v115 = v36;
      v116 = v37;
      v128 = v128 + v37;
    }
    else
    {
      objc_msgSend(v120, "accessibilityFrame");
      v109 = v38;
      v110 = v39;
      v111 = v40;
      v112 = v41;
      v128 = v128 + v40;
    }
    objc_storeStrong(&v120, 0);
  }
  if (v128 > 0.0 && *((_QWORD *)v203 + 4))
  {
    v107 = 0u;
    v108 = 0u;
    objc_msgSend(*((id *)v203 + 4), "accessibilityFrame");
    *(_QWORD *)&v107 = v42;
    *((_QWORD *)&v107 + 1) = v43;
    *(_QWORD *)&v108 = v44;
    *((_QWORD *)&v108 + 1) = v45;
    if (UIInterfaceOrientationIsLandscape(v135))
      *((double *)&v108 + 1) = *((double *)&v108 + 1) - v128;
    else
      *(double *)&v108 = *(double *)&v108 - v128;
    objc_msgSend(*((id *)v203 + 4), "setAccessibilityFrame:", v107, v108);
  }
  v106 = *((id *)v203 + 1);
  v104 = 0;
  v102 = 0;
  v50 = 1;
  if (!-[UITableViewCellAccessibility _accessibilityShouldSortTableViewCellChildren](v206, "_accessibilityShouldSortTableViewCellChildren"))
  {
    v105 = objc_loadWeakRetained((id *)v203 + 8);
    v104 = 1;
    objc_opt_class();
    v49 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v103 = objc_loadWeakRetained((id *)v203 + 8);
      v102 = 1;
      v49 = -[UITableViewCellAccessibilityElement usingRealTableViewCell]((uint64_t)v103);
    }
    v50 = v49;
  }
  if ((v102 & 1) != 0)

  if ((v104 & 1) != 0)
  if ((v50 & 1) != 0)
  {
    v46 = (void *)objc_msgSend(v106, "mutableCopy");
    v47 = v106;
    v106 = v46;

    -[UITableViewCellAccessibility _accessibilitySortElementsUsingGeometry:](v206, "_accessibilitySortElementsUsingGeometry:", v106);
    objc_storeStrong((id *)v203 + 1, v106);
  }
  -[UITableViewCellAccessibility accessibilitySetIsFetchingChildren:]((uint64_t)v206, v204 & 1);
  -[UITableViewCellAccessibility _axSetShouldForceRefreshChildren:](v206, "_axSetShouldForceRefreshChildren:", 0);
  v207 = v106;
  v196 = 1;
  objc_storeStrong(&v106, 0);
  objc_storeStrong(&v172, 0);
  objc_storeStrong(&v173, 0);
  objc_storeStrong(&v177, 0);
  objc_storeStrong(&v178, 0);
  objc_storeStrong(&v181, 0);
  objc_storeStrong(&v183, 0);
  objc_storeStrong(&v185, 0);
  objc_storeStrong(&v186, 0);
  objc_storeStrong(&v189, 0);
LABEL_225:
  objc_storeStrong(&v194, 0);
LABEL_226:
  objc_storeStrong(&v202, 0);
  objc_storeStrong(&v203, 0);
  return v207;
}

- (uint64_t)accessibilityIsFetchingChildren
{
  char v2;

  if (a1)
    v2 = *(_BYTE *)(a1 + 8) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (uint64_t)accessibilitySetIsFetchingChildren:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

- (BOOL)_accessibilityShouldSortTableViewCellChildren
{
  return 0;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  id v23;
  uint64_t v24;
  objc_super v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  id location[2];
  UITableViewCellAccessibility *v39;
  int64_t v40;
  double v41;

  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v37 = 0;
  objc_storeStrong(&v37, a4);
  objc_msgSend(location[0], "accessibilityFrame");
  *(_QWORD *)&v35 = v4;
  *((_QWORD *)&v35 + 1) = v5;
  *(_QWORD *)&v36 = v6;
  *((_QWORD *)&v36 + 1) = v7;
  objc_msgSend(v37, "accessibilityFrame");
  *(_QWORD *)&v33 = v8;
  *((_QWORD *)&v33 + 1) = v9;
  *(_QWORD *)&v34 = v10;
  *((_QWORD *)&v34 + 1) = v11;
  if ((objc_msgSend(MEMORY[0x24BDF6FF8], "_transformLayerRotationsAreEnabled") & 1) == 0)
  {
    v23 = (id)-[UITableViewCellAccessibility window](v39, "window");
    v22 = (id)objc_msgSend(v23, "windowScene");
    v24 = objc_msgSend(v22, "interfaceOrientation");

    v32 = v24;
    UIAccessibilityConvertRectToPortraitCoordinates();
    *(_QWORD *)&v30 = v12;
    *((_QWORD *)&v30 + 1) = v13;
    *(_QWORD *)&v31 = v14;
    *((_QWORD *)&v31 + 1) = v15;
    v35 = v30;
    v36 = v31;
    UIAccessibilityConvertRectToPortraitCoordinates();
    *(_QWORD *)&v28 = v16;
    *((_QWORD *)&v28 + 1) = v17;
    *(_QWORD *)&v29 = v18;
    *((_QWORD *)&v29 + 1) = v19;
    v33 = v28;
    v34 = v29;
  }
  v41 = *(double *)&v35 - *(double *)&v33;
  if (fabs(*(double *)&v35 - *(double *)&v33) >= 2.0)
  {
    v26.receiver = v39;
    v26.super_class = (Class)UITableViewCellAccessibility;
    v40 = -[UITableViewCellAccessibility _accessibilityCompareElement:toElement:](&v26, sel__accessibilityCompareElement_toElement_, location[0], v37);
    v27 = 1;
  }
  else
  {
    v20 = 1;
    if (*((double *)&v35 + 1) < *((double *)&v33 + 1))
      v20 = -1;
    v40 = v20;
    v27 = 1;
  }
  objc_storeStrong(&v37, 0);
  objc_storeStrong(location, 0);
  return v40;
}

- (double)_accessibilityAllowedGeometryOverlapX
{
  return 20.0;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  double v2;
  double v3;
  id location[2];
  UITableViewCellAccessibility *v6;
  double v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = (id)-[UITableViewCellAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB0E0]);
  if (location[0])
  {
    objc_msgSend(location[0], "doubleValue");
    v7 = v2;
  }
  else
  {
    -[UITableViewCellAccessibility bounds](v6, "bounds");
    v7 = v3;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (void)editControlWasClicked:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)AXRetainAutorelease();
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility editControlWasClicked:](&v4, sel_editControlWasClicked_, location[0]);
  -[UITableViewCellAccessibility _accessibilityUpdateRemoveControl](v6);
  objc_storeStrong(location, 0);
}

- (void)deleteConfirmationControlWasClicked:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)AXRetainAutorelease();
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility deleteConfirmationControlWasClicked:](&v4, sel_deleteConfirmationControlWasClicked_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(location, 0);
}

- (void)deleteConfirmationControlWasCancelled:(id)a3
{
  id v3;
  objc_super v4;
  id location[2];
  UITableViewCellAccessibility *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (id)AXRetainAutorelease();
  v4.receiver = v6;
  v4.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility deleteConfirmationControlWasCancelled:](&v4, sel_deleteConfirmationControlWasCancelled_, location[0]);
  -[UITableViewCellAccessibility _accessibilityUpdateRemoveControl](v6);
  objc_storeStrong(location, 0);
}

- (id)accessibilityValue
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8;
  id v9;
  int v10;
  id v11[2];
  UITableViewCellAccessibility *v12;
  id v13;

  v12 = self;
  v11[1] = (id)a2;
  v11[0] = -[UITableViewCellAccessibility _accessibilityTableViewSwitch](self, "_accessibilityTableViewSwitch");
  if (v11[0])
  {
    v13 = (id)objc_msgSend(v11[0], "accessibilityValue");
    v10 = 1;
  }
  else
  {
    v9 = (id)-[UITableViewCellAccessibility _badgeText](v12, "_badgeText");
    v7.receiver = v12;
    v7.super_class = (Class)UITableViewCellAccessibility;
    v8 = -[UITableViewCellAccessibility accessibilityValue](&v7, sel_accessibilityValue);
    if (v8 && (objc_msgSend(v9, "isEqualToString:", v8) & 1) != 0)
    {
      v13 = v8;
      v10 = 1;
    }
    else
    {
      v6 = 0;
      if ((-[UITableViewCellAccessibility _accessibilityTableCellUsesDetailTextAsValue](v12, "_accessibilityTableCellUsesDetailTextAsValue") & 1) != 0)
      {
        v5 = -[UITableViewCellAccessibility _accessibilityDetailTextLabelIfExists](v12);
        v2 = (id)objc_msgSend(v5, "accessibilityLabel");
        v3 = v6;
        v6 = v2;

      }
      v13 = (id)__UIAXStringForVariables();
      v10 = 1;
      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(v11, 0);
  return v13;
}

- (CGPoint)accessibilityActivationPoint
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  id v11;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;
  int v15;
  id location[2];
  UITableViewCellAccessibility *v17;
  double v18;
  double v19;
  CGPoint result;

  v17 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibility _accessibilityTableViewSwitch](self, "_accessibilityTableViewSwitch");
  if (location[0])
  {
    objc_msgSend(location[0], "accessibilityActivationPoint");
    v18 = v2;
    v19 = v3;
    v15 = 1;
  }
  else if ((-[UITableViewCellAccessibility safeBoolForKey:](v17, "safeBoolForKey:", CFSTR("_hasEditingAccessoryView")) & 1) != 0
         || (v11 = (id)-[UITableViewCellAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("editingStyle")), v12 = (int)objc_msgSend(v11, "intValue"), v11, v14 = v12, (unint64_t)(v12 - 1) > 1))
  {
    v13.receiver = v17;
    v13.super_class = (Class)UITableViewCellAccessibility;
    -[UITableViewCellAccessibility accessibilityActivationPoint](&v13, sel_accessibilityActivationPoint);
    v18 = v6;
    v19 = v7;
    v15 = 1;
  }
  else
  {
    v10 = -[UITableViewCellAccessibility _accessibilityCellEditingControl](v17, "_accessibilityCellEditingControl");
    objc_msgSend(v10, "accessibilityActivationPoint");
    v18 = v4;
    v19 = v5;

    v15 = 1;
  }
  objc_storeStrong(location, 0);
  v8 = v18;
  v9 = v19;
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)_accessibilityShouldBeEmptyIfHidden
{
  return a1 != 0;
}

- (int64_t)accessibilityElementCount
{
  id v3;
  id v4[2];
  UITableViewCellAccessibility *v5;
  int64_t v6;

  v5 = self;
  v4[1] = (id)a2;
  -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("CheckingOverride"));
  if (-[UITableViewCellAccessibility _accessibilityUsesOverrideContainerProtocol](v5, "_accessibilityUsesOverrideContainerProtocol"))
  {
    -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v5, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CheckingOverride"));
    v3 = (id)-[UITableViewCellAccessibility _accessibilityElements](v5, "_accessibilityElements");
    v6 = objc_msgSend(v3, "count");

  }
  else if (-[UITableViewCellAccessibility _accessibilityShouldBeEmptyIfHidden]((uint64_t)v5)
         && (-[UITableViewCellAccessibility accessibilityElementsHidden](v5, "accessibilityElementsHidden") & 1) != 0)
  {
    return 0;
  }
  else
  {
    v4[0] = -[UITableViewCellAccessibility _accessibilityChildren](v5, "_accessibilityChildren");
    -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v5, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CheckingOverride"));
    v6 = objc_msgSend(v4[0], "count");
    objc_storeStrong(v4, 0);
  }
  return v6;
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  char v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id obj;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  _QWORD __b[8];
  id v21;
  int64_t v22;
  id v23;
  int v24;
  id location[2];
  UITableViewCellAccessibility *v26;
  int64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("CheckingOverride"));
  if (-[UITableViewCellAccessibility _accessibilityUsesOverrideContainerProtocol](v26, "_accessibilityUsesOverrideContainerProtocol"))
  {
    -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CheckingOverride"));
    v13 = (id)-[UITableViewCellAccessibility _accessibilityElements](v26, "_accessibilityElements");
    v27 = objc_msgSend(v13, "indexOfObject:", location[0]);

    v24 = 1;
  }
  else if (-[UITableViewCellAccessibility _accessibilityShouldBeEmptyIfHidden]((uint64_t)v26)
         && (-[UITableViewCellAccessibility accessibilityElementsHidden](v26, "accessibilityElementsHidden") & 1) != 0)
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    v24 = 1;
  }
  else
  {
    v23 = -[UITableViewCellAccessibility _accessibilityChildren](v26, "_accessibilityChildren");
    -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v26, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CheckingOverride"));
    v22 = 0;
    memset(__b, 0, sizeof(__b));
    obj = v23;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
    if (v12)
    {
      v8 = *(_QWORD *)__b[2];
      v9 = 0;
      v10 = v12;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)__b[2] != v8)
          objc_enumerationMutation(obj);
        v21 = *(id *)(__b[1] + 8 * v9);
        if ((objc_msgSend(v21, "isEqual:", location[0]) & 1) != 0)
        {
          v27 = v22;
          v24 = 1;
          goto LABEL_33;
        }
        objc_opt_class();
        v18 = 0;
        v16 = 0;
        v14 = 0;
        v6 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v21);
          v18 = 1;
          v5 = 1;
          if ((objc_msgSend(v19, "isEqual:", location[0]) & 1) == 0)
          {
            objc_opt_class();
            v4 = 0;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (id)-[UIAccessibilityElementMockView view]((uint64_t)v21);
              v16 = 1;
              v15 = (id)-[UIAccessibilityElementMockView view]((uint64_t)location[0]);
              v14 = 1;
              v4 = objc_msgSend(v17, "isEqual:");
            }
            v5 = v4;
          }
          v6 = v5;
        }
        if ((v14 & 1) != 0)

        if ((v16 & 1) != 0)
        if ((v18 & 1) != 0)

        if ((v6 & 1) != 0)
        {
          v27 = v22;
          v24 = 1;
          goto LABEL_33;
        }
        if (objc_msgSend(v21, "accessibilityElementCount") != 0x7FFFFFFFFFFFFFFFLL
          && objc_msgSend(v21, "accessibilityElementCount") > 0
          && objc_msgSend(v21, "indexOfAccessibilityElement:", location[0]) != 0x7FFFFFFFFFFFFFFFLL)
        {
          break;
        }
        ++v22;
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v28, 16);
          if (!v10)
            goto LABEL_32;
        }
      }
      v27 = v22;
      v24 = 1;
    }
    else
    {
LABEL_32:
      v24 = 0;
    }
LABEL_33:

    if (!v24)
    {
      v27 = 0x7FFFFFFFFFFFFFFFLL;
      v24 = 1;
    }
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(location, 0);
  return v27;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  id v4;
  int v5;
  id location;
  int64_t v7;
  SEL v8;
  UITableViewCellAccessibility *v9;
  id v10;

  v9 = self;
  v8 = a2;
  v7 = a3;
  -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("CheckingOverride"));
  if (-[UITableViewCellAccessibility _accessibilityUsesOverrideContainerProtocol](v9, "_accessibilityUsesOverrideContainerProtocol"))
  {
    -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v9, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CheckingOverride"));
    location = (id)-[UITableViewCellAccessibility _accessibilityElements](v9, "_accessibilityElements");
    if (v7 >= (unint64_t)objc_msgSend(location, "count"))
    {
      if (v7 >= (unint64_t)objc_msgSend(location, "count"))
        _AXAssert();
      v10 = 0;
      v5 = 1;
    }
    else
    {
      v10 = (id)objc_msgSend(location, "objectAtIndex:", v7);
      v5 = 1;
    }
    objc_storeStrong(&location, 0);
  }
  else if (-[UITableViewCellAccessibility _accessibilityShouldBeEmptyIfHidden]((uint64_t)v9)
         && (-[UITableViewCellAccessibility accessibilityElementsHidden](v9, "accessibilityElementsHidden") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v4 = -[UITableViewCellAccessibility _accessibilityChildren](v9, "_accessibilityChildren");
    -[UITableViewCellAccessibility _accessibilitySetBoolValue:forKey:](v9, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("CheckingOverride"));
    if (v7 < 0 || v7 >= objc_msgSend(v4, "count"))
    {
      v10 = 0;
      v5 = 1;
    }
    else
    {
      v10 = (id)objc_msgSend(v4, "objectAtIndex:", v7);
      v5 = 1;
    }
    objc_storeStrong(&v4, 0);
  }
  return v10;
}

- (id)accessibilityLabel
{
  objc_super v3;
  id location[2];
  UITableViewCellAccessibility *v5;
  id v6;

  v5 = self;
  location[1] = (id)a2;
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellAccessibility;
  location[0] = -[UITableViewCellAccessibility accessibilityLabel](&v3, sel_accessibilityLabel);
  if (!-[UITableViewCellAccessibility isAccessibilityElement](v5, "isAccessibilityElement")
    || objc_msgSend(location[0], "length"))
  {
    v6 = location[0];
  }
  else
  {
    v6 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText](v5, "_accessibilityRetrieveTableViewCellText");
  }
  objc_storeStrong(location, 0);
  return v6;
}

- (id)accessibilityUserInputLabels
{
  id v2;
  id v3;
  id v5;
  id v6;
  objc_super v7;
  id v8[2];
  UITableViewCellAccessibility *v9;

  v9 = self;
  v8[1] = (id)a2;
  v7.receiver = self;
  v7.super_class = (Class)UITableViewCellAccessibility;
  v8[0] = -[UITableViewCellAccessibility accessibilityUserInputLabels](&v7, sel_accessibilityUserInputLabels);
  if (!objc_msgSend(v8[0], "count"))
  {
    v6 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellTextExcludingDetailText](v9);
    v2 = (id)MEMORY[0x2348C3560]();
    v3 = v8[0];
    v8[0] = v2;

  }
  v5 = v8[0];
  objc_storeStrong(v8, 0);
  return v5;
}

- (BOOL)isAccessibilityElement
{
  id v2;
  id v4;
  BOOL v5;
  BOOL v7;

  v2 = (id)-[UITableViewCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v5 = v2 == 0;

  if (v5)
    return 0;
  v4 = (id)-[UITableViewCellAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v7 = objc_msgSend(v4, "BOOLValue") & 1;

  return v7;
}

- (BOOL)_axHasLeadingSwipeActions
{
  id v2;
  id v3;
  char v4;
  int v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;

  v12 = a1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v12, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    if ((objc_msgSend(v11, "conformsToProtocol:", &unk_255ED5D40) & 1) == 0)
      goto LABEL_13;
    v10 = (id)objc_msgSend(v11, "_swipeActionController");
    v9 = objc_opt_respondsToSelector() & 1;
    v7 = 0;
    v4 = 1;
    if (v9)
    {
      v8 = (id)objc_msgSend(v12, "_accessibilityIndexPath");
      v7 = 1;
      v4 = 1;
      if ((objc_msgSend(v11, "swipeActionController:mayBeginSwipeForItemAtIndexPath:", v10) & 1) == 0)
        v4 = objc_msgSend(v11, "isEditing");
    }
    if ((v7 & 1) != 0)

    if ((v4 & 1) != 0)
    {
      v3 = (id)objc_msgSend(v12, "_accessibilityIndexPath");
      v2 = (id)objc_msgSend(v11, "swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", v10);
      v6 = (id)objc_msgSend(v2, "actions");

      v13 = objc_msgSend(v6, "count") != 0;
      v5 = 1;
      objc_storeStrong(&v6, 0);
    }
    else
    {
      v5 = 0;
    }
    objc_storeStrong(&v10, 0);
    if (!v5)
LABEL_13:
      v13 = 0;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)_axHasTrailingSwipeActions
{
  id v2;
  id v3;
  char v4;
  int v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;

  v12 = a1;
  if (a1)
  {
    v11 = (id)objc_msgSend(v12, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    if ((objc_msgSend(v11, "conformsToProtocol:", &unk_255ED5D40) & 1) == 0)
      goto LABEL_13;
    v10 = (id)objc_msgSend(v11, "_swipeActionController");
    v9 = objc_opt_respondsToSelector() & 1;
    v7 = 0;
    v4 = 1;
    if (v9)
    {
      v8 = (id)objc_msgSend(v12, "_accessibilityIndexPath");
      v7 = 1;
      v4 = 1;
      if ((objc_msgSend(v11, "swipeActionController:mayBeginSwipeForItemAtIndexPath:", v10) & 1) == 0)
        v4 = objc_msgSend(v11, "isEditing");
    }
    if ((v7 & 1) != 0)

    if ((v4 & 1) != 0)
    {
      v3 = (id)objc_msgSend(v12, "_accessibilityIndexPath");
      v2 = (id)objc_msgSend(v11, "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", v10);
      v6 = (id)objc_msgSend(v2, "actions");

      v13 = objc_msgSend(v6, "count") != 0;
      v5 = 1;
      objc_storeStrong(&v6, 0);
    }
    else
    {
      v5 = 0;
    }
    objc_storeStrong(&v10, 0);
    if (!v5)
LABEL_13:
      v13 = 0;
    objc_storeStrong(&v11, 0);
  }
  else
  {
    return 0;
  }
  return v13;
}

- (BOOL)_accessibilitySwipeActionsAllowed
{
  id v2;
  char v4;
  BOOL v5;
  id v6;
  id v7[3];
  uint64_t v8;
  uint64_t *v9;
  int v10;
  int v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  char v17;
  int v18;
  id v19[2];
  UITableViewCellAccessibility *v20;
  char v21;

  v20 = self;
  v19[1] = (id)a2;
  v19[0] = (id)-[UITableViewCellAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v2 = (id)objc_msgSend(v19[0], "window");
  v5 = v2 != 0;

  if (v5)
  {
    if ((objc_msgSend(v19[0], "safeBoolForKey:", CFSTR("_manuallyManagesSwipeUI")) & 1) != 0)
    {
      v21 = 0;
      v18 = 1;
    }
    else
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x20000000;
      v16 = 32;
      v17 = 0;
      v8 = 0;
      v9 = &v8;
      v10 = 0x20000000;
      v11 = 32;
      v12 = 0;
      v6 = v19[0];
      v7[0] = v20;
      v7[1] = &v13;
      v7[2] = &v8;
      AXPerformSafeBlock();
      v4 = 1;
      if ((v14[3] & 1) == 0)
        v4 = *((_BYTE *)v9 + 24);
      v21 = v4 & 1;
      v18 = 1;
      objc_storeStrong(v7, 0);
      objc_storeStrong(&v6, 0);
      _Block_object_dispose(&v8, 8);
      _Block_object_dispose(&v13, 8);
    }
  }
  else
  {
    v21 = 0;
    v18 = 1;
  }
  objc_storeStrong(v19, 0);
  return v21 & 1;
}

void __65__UITableViewCellAccessibility__accessibilitySwipeActionsAllowed__block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4[3];

  v4[2] = (id)a1;
  v4[1] = (id)a1;
  v4[0] = (id)objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "dataSource");
  if ((objc_opt_respondsToSelector() & 1) != 0
    || -[UITableViewCellAccessibility _axHasLeadingSwipeActions](*(void **)(a1 + 40))
    || -[UITableViewCellAccessibility _axHasTrailingSwipeActions](*(void **)(a1 + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_canEditRowAtIndexPath:", v4[0]) & 1;
  }
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "delegate");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_opt_respondsToSelector() & 1;
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (BOOL)_accessibilityHandleDetailButtonPress:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  id location[2];
  UITableViewCellAccessibility *v10;
  char v11;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = (id)-[UITableViewCellAccessibility _accessibilityViewAncestorIsKindOf:](v10, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
  v6 = (id)objc_msgSend(v8, "delegate");
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v5 = (id)objc_msgSend(v8, "delegate");
    v4 = -[UITableViewCellAccessibility _accessibilityIndexPath](v10, "_accessibilityIndexPath");
    objc_msgSend(v5, "tableView:accessoryButtonTappedForRowWithIndexPath:", v8);

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (id)_accessibilityEquivalenceTag
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v7;
  objc_super v8;
  id v9[2];
  UITableViewCellAccessibility *v10;

  v10 = self;
  v9[1] = (id)a2;
  v9[0] = 0;
  if (-[UITableViewCellAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v8.receiver = v10;
    v8.super_class = (Class)UITableViewCellAccessibility;
    v2 = -[UITableViewCellAccessibility _accessibilityEquivalenceTag](&v8, sel__accessibilityEquivalenceTag);
    v3 = v9[0];
    v9[0] = v2;

  }
  else
  {
    v4 = -[UITableViewCellAccessibility _accessibilityRetrieveTableViewCellText](v10, "_accessibilityRetrieveTableViewCellText");
    v5 = v9[0];
    v9[0] = v4;

  }
  v7 = v9[0];
  objc_storeStrong(v9, 0);
  return v7;
}

- (BOOL)_accessibilityShouldSetNativeFocusWhenATVFocused
{
  objc_super v3;
  int v4;
  id location[2];
  UITableViewCellAccessibility *v6;
  char v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibility _accessibilityParentTableView](self, "_accessibilityParentTableView");
  if ((-[UITableViewCellAccessibility _accessibilityBoolValueForKey:](v6, "_accessibilityBoolValueForKey:", CFSTR("AXIsShowingSelectedBackground")) & 1) == 0|| (objc_msgSend(location[0], "allowsMultipleSelection") & 1) != 0|| (-[UITableViewCellAccessibility isSelected](v6, "isSelected") & 1) != 0|| !UIAccessibilityIsVoiceOverRunning())
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableViewCellAccessibility;
    v7 = -[UITableViewCellAccessibility _accessibilityShouldSetNativeFocusWhenATVFocused](&v3, sel__accessibilityShouldSetNativeFocusWhenATVFocused);
    v4 = 1;
  }
  else
  {
    v7 = 1;
    v4 = 1;
  }
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (id)_accessibilityParentTableView
{
  return (id)-[UITableViewCellAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

- (BOOL)_accessibilityIsOutsideParentBounds
{
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  id v6;
  CGRect rect2;
  CGRect v8;
  id v9;
  id v10;
  BOOL v11;
  CGRect v12;

  v10 = a1;
  if (a1)
  {
    v9 = (id)objc_msgSend(v10, "_accessibilityParentTableView");
    v6 = (id)objc_msgSend(v9, "window");
    objc_msgSend(v6, "accessibilityFrame");
    v8 = CGRectInset(v12, 0.0, 40.0);
    objc_msgSend(v10, "accessibilityFrame");
    rect2.origin.x = v1;
    rect2.origin.y = v2;
    rect2.size.width = v3;
    rect2.size.height = v4;
    v11 = !CGRectIntersectsRect(v8, rect2);

    objc_storeStrong(&v9, 0);
  }
  else
  {
    return 0;
  }
  return v11;
}

- (BOOL)accessibilityScrollToVisible
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  id v31;
  BOOL v32;
  uint64_t v33;
  id v34;
  BOOL IsOutsideParent;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  UITableViewCellAccessibility *v40;
  id v41;
  char v42;
  id v43;
  uint64_t i;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CGRect rect2;
  CGRect v49;
  __int128 v50;
  __int128 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  __int128 v56;
  __int128 v57;
  CGRect rect1;
  double v59;
  double v60;
  double v61;
  double v62;
  CGRect v63;
  char v64;
  uint64_t v65;
  unint64_t v66;
  id v67;
  id v68;
  os_log_type_t v69;
  id v70;
  int v71;
  os_log_type_t v72;
  id location;
  char v74;
  id v75[2];
  UITableViewCellAccessibility *v76;
  char v77;
  uint8_t v78[16];
  uint8_t v79[24];
  uint64_t v80;
  CGRect v81;

  v80 = *MEMORY[0x24BDAC8D0];
  v76 = self;
  v75[1] = (id)a2;
  v39 = -[UITableViewCellAccessibility _accessibilityMockParent](self, "_accessibilityMockParent");
  v75[0] = (id)objc_msgSend(v39, "_accessibilityAncestorIsKindOf:", objc_opt_class());

  v74 = objc_msgSend(v75[0], "safeBoolForKey:", CFSTR("isScrollEnabled")) & 1;
  if ((objc_msgSend(v75[0], "_accessibilityRespectsTableScrollEnabledFlag") & 1) == 0 || (v74 & 1) != 0)
  {
    if ((v74 & 1) == 0)
    {
      v70 = (id)AXLogScrollToVisible();
      v69 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_66((uint64_t)v78, (uint64_t)v75[0]);
        _os_log_debug_impl(&dword_230C4A000, (os_log_t)v70, v69, "Scrolling the table view even though it has scroll disabled. May need to implement _accessibilityRespectsTableScrollEnabledFlag on the table view: %{public}@", v78, 0xCu);
      }
      objc_storeStrong(&v70, 0);
    }
    v2 = (id)AXRetainAutorelease();
    v68 = (id)objc_msgSend(v75[0], "indexPathsForVisibleRows");
    v67 = (id)objc_msgSend(v75[0], "indexPathForCell:", v76);
    if (!v67)
    {
      v67 = -[UITableViewCellAccessibility _accessibilityIndexPath](v76, "_accessibilityIndexPath");

    }
    v66 = objc_msgSend(v68, "indexOfObject:", v67);
    v65 = 2;
    v64 = 0;
    if ((_UIAXObjectIsBehindKeyboard() & 1) != 0)
    {
      v65 = 1;
      v64 = 1;
    }
    v38 = v75[0];
    -[UITableViewCellAccessibility bounds](v76, "bounds");
    v59 = v3;
    v60 = v4;
    v61 = v5;
    v62 = v6;
    objc_msgSend(v38, "convertRect:fromView:", v76, v3, v4, v5, v6);
    v63.origin.x = v7;
    v63.origin.y = v8;
    v63.size.width = v9;
    v63.size.height = v10;
    objc_msgSend(v75[0], "bounds");
    rect1 = v81;
    if (!CGRectContainsRect(v81, v63))
      v64 = 1;
    v37 = (id)objc_msgSend(v75[0], "safeValueForKey:", CFSTR("visibleBounds"));
    objc_msgSend(v37, "rectValue");
    *(_QWORD *)&v56 = v11;
    *((_QWORD *)&v56 + 1) = v12;
    *(_QWORD *)&v57 = v13;
    *((_QWORD *)&v57 + 1) = v14;

    objc_msgSend(v75[0], "adjustedContentInset");
    v52 = v15;
    v53 = v16;
    v54 = v17;
    v55 = v18;
    *(_QWORD *)&v50 = UIEdgeInsetsInsetRect_2(*(double *)&v56, *((double *)&v56 + 1), *(double *)&v57, *((double *)&v57 + 1), v15, v16);
    *((_QWORD *)&v50 + 1) = v19;
    *(_QWORD *)&v51 = v20;
    *((_QWORD *)&v51 + 1) = v21;
    v56 = v50;
    v57 = v51;
    UIAccessibilityFrameForBounds();
    v49.origin.x = v22;
    v49.origin.y = v23;
    v49.size.width = v24;
    v49.size.height = v25;
    -[UITableViewCellAccessibility accessibilityFrame](v76, "accessibilityFrame");
    rect2.origin.x = v26;
    rect2.origin.y = v27;
    rect2.size.width = v28;
    rect2.size.height = v29;
    if (!CGRectContainsRect(v49, rect2))
    {
      v65 = 1;
      if (!UIEdgeInsetsEqualToEdgeInsets(v52, v53, v54, v55, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24)))v64 = 1;
      if (v52 > 0.0)
        v65 = 0;
    }
    if ((v64 & 1) == 0 && -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v76))
      v64 = 1;
    v47 = objc_msgSend(v68, "count");
    if ((v64 & 1) == 0 && v47 && (v66 > 1 && v66 < v47 - 2 || v47 == 1))
    {
      v77 = 0;
      v71 = 1;
    }
    else
    {
      v46 = 0;
      v45 = objc_msgSend(v75[0], "numberOfSections");
      for (i = 0; i < v45; ++i)
        v46 += objc_msgSend(v75[0], "numberOfRowsInSection:", i);
      if (objc_msgSend(v68, "count") != v46 || (v64 & 1) != 0)
      {
        if (objc_msgSend(v67, "section") < v45)
        {
          if (v45)
          {
            v36 = objc_msgSend(v67, "row");
            if (v36 < objc_msgSend(v75[0], "numberOfRowsInSection:", objc_msgSend(v67, "section")))
            {
              v65 = objc_msgSend(v75[0], "_accessibilityScrollPositionForCellOverride:", v65);
              objc_msgSend(v75[0], "scrollToRowAtIndexPath:atScrollPosition:animated:", v67, v65, 0);
              v34 = (id)objc_msgSend(v75[0], "indexPathsForVisibleRows");
              v42 = 0;
              IsOutsideParent = 1;
              if ((objc_msgSend(v34, "containsObject:", v67) & 1) != 0)
              {
                v43 = (id)objc_msgSend(v75[0], "cellForRowAtIndexPath:", v67);
                v42 = 1;
                IsOutsideParent = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v43);
              }
              if ((v42 & 1) != 0)

              if (IsOutsideParent)
              {
                v45 = objc_msgSend(v75[0], "numberOfSections");
                if (!v45
                  || objc_msgSend(v67, "section") >= v45
                  || (v33 = objc_msgSend(v67, "row"),
                      v33 >= objc_msgSend(v75[0], "numberOfRowsInSection:", objc_msgSend(v67, "section"))))
                {
                  v77 = 0;
                  v71 = 1;
                  goto LABEL_53;
                }
                objc_msgSend(v75[0], "scrollToRowAtIndexPath:atScrollPosition:animated:", v67, 2, 0);
              }
              objc_msgSend(v75[0], "_accessibilityOpaqueElementScrollCleanup");
              v31 = (id)objc_msgSend(v75[0], "cellForRowAtIndexPath:", v67);
              v32 = -[UITableViewCellAccessibility _accessibilityIsOutsideParentBounds](v31);

              if (v32)
              {
                v77 = 0;
                v71 = 1;
              }
              else
              {
                v40 = v76;
                v41 = v75[0];
                AXPerformBlockOnMainThreadAfterDelay();
                v77 = 1;
                v71 = 1;
                objc_storeStrong(&v41, 0);
                objc_storeStrong((id *)&v40, 0);
              }
              goto LABEL_53;
            }
          }
        }
        v77 = 0;
        v71 = 1;
      }
      else
      {
        v77 = 0;
        v71 = 1;
      }
    }
LABEL_53:
    objc_storeStrong(&v67, 0);
    objc_storeStrong(&v68, 0);
    goto LABEL_54;
  }
  location = (id)AXLogScrollToVisible();
  v72 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_66((uint64_t)v79, (uint64_t)v75[0]);
    _os_log_debug_impl(&dword_230C4A000, (os_log_t)location, v72, "Not scrolling the table view because its scroll is disabled: %{public}@", v79, 0xCu);
  }
  objc_storeStrong(&location, 0);
  v77 = 0;
  v71 = 1;
LABEL_54:
  objc_storeStrong(v75, 0);
  return v77 & 1;
}

id __60__UITableViewCellAccessibility_accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  id v1;
  id v3;
  id v5;
  BOOL v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;

  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityWindow");
  v5 = (id)objc_msgSend(v3, "firstResponder");
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v6 = 0;
  if ((objc_msgSend(v5, "_accessibilityIsDescendantOfElement:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityParentView");
    v11 = 1;
    v10 = (id)objc_msgSend(v12, "safeValueForKey:", CFSTR("window"));
    v9 = 1;
    v8 = (id)AXUIKeyboardWindow();
    v7 = 1;
    v6 = v10 != v8;
  }
  if ((v7 & 1) != 0)

  if ((v9 & 1) != 0)
  if ((v11 & 1) != 0)

  if (v6)
    _UIAXDismissKeyboardIfNecessary();
  v1 = (id)objc_opt_self();
  return (id)objc_opt_self();
}

- (id)_accessibilityScannerGroupElements
{
  id v3[2];
  UITableViewCellAccessibility *v4;
  id v5;

  v4 = self;
  v3[1] = (id)a2;
  if ((-[UITableViewCellAccessibility accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v3[0] = -[UITableViewCellAccessibility _accessibilityChildren](v4, "_accessibilityChildren");
    v5 = v3[0];
    objc_storeStrong(v3, 0);
  }
  return v5;
}

- (void)_accessibilityFinishSwipeAction:(id)a3 controller:(id)a4 indexPath:(id)a5 tableView:(id)a6 tvDelegate:(id)a7 wasEditing:(BOOL)a8
{
  void *v8;
  id v9;
  id v10;
  char v11;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  BOOL v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  v32 = 0;
  objc_storeStrong(&v32, a5);
  v31 = 0;
  objc_storeStrong(&v31, a6);
  v30 = 0;
  objc_storeStrong(&v30, a7);
  v29 = a8;
  v27 = 0;
  objc_opt_class();
  v26 = (id)__UIAccessibilityCastAsSafeCategory();
  v25 = v26;
  objc_storeStrong(&v26, 0);
  v28 = (uint64_t)v25;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v31, "swipeActionController:didEndSwipeForItemAtIndexPath:", v33, v32);
    if ((objc_msgSend(v31, "isEditing") & 1) != 0 && !v29)
      objc_msgSend(v31, "setEditing:animated:", 0, 0);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v30, "_accessibilityTableView:endRowActionHandlingForIndexPath:", v31, v32);
  v10 = (id)objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v11 = objc_msgSend(v10, "voiceOverSpeakActionConfirmation");

  if ((v11 & 1) != 0)
  {
    v9 = (id)objc_msgSend(location[0], "title");
    v23 = 0;
    v21 = 0;
    v19 = 0;
    v17 = 0;
    if (objc_msgSend(v9, "length"))
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      v24 = accessibilityLocalizedString(CFSTR("action.performed"));
      v23 = 1;
      v22 = (id)objc_msgSend(location[0], "title");
      v21 = 1;
      v20 = (id)objc_msgSend(v8, "stringWithFormat:", v24, v22);
      v19 = 1;
    }
    else
    {
      v18 = accessibilityLocalizedString(CFSTR("action.performed.no.name"));
      v17 = 1;
    }
    UIAccessibilitySpeak();
    if ((v17 & 1) != 0)

    if ((v19 & 1) != 0)
    if ((v21 & 1) != 0)

    if ((v23 & 1) != 0)
  }
  -[UITableViewAccessibility _accessibilitySetShouldConsiderSwipeDeletionCommitted:](v28);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_axPerformAction:(id)a3
{
  id v4;
  id v5;
  id v6;
  UITableViewCellAccessibility *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  id location[2];
  UITableViewCellAccessibility *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_opt_class();
  v5 = (id)objc_msgSend(location[0], "_accessibilityValueForKey:", CFSTR("AXTableCellActionKey"));
  v24 = (id)__UIAccessibilityCastAsClass();

  v23 = v24;
  objc_storeStrong(&v24, 0);
  v26 = v23;
  v22 = (id)objc_msgSend(v23, "handler");
  if (v22)
  {
    v20 = 0;
    objc_opt_class();
    v4 = (id)-[UITableViewCellAccessibility safeValueForKey:](v28, "safeValueForKey:", CFSTR("_tableView"));
    v19 = (id)__UIAccessibilityCastAsClass();

    v18 = v19;
    objc_storeStrong(&v19, 0);
    v21 = v18;
    v17 = (id)objc_msgSend(v18, "_swipeActionController");
    v16 = -[UITableViewCellAccessibility _accessibilityIndexPath](v28, "_accessibilityIndexPath");
    v15 = (id)objc_msgSend(v21, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v15, "_accessibilityTableView:prepareForRowActionHandlingForIndexPath:", v21, v16);
    v14 = objc_msgSend(v21, "isEditing") & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v21, "swipeActionController:willBeginSwipeForItemAtIndexPath:", v17, v16);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v21, "swipeActionController:willPerformAction:atIndexPath:", v17, v26, v16);
    v6 = v21;
    v7 = v28;
    v12 = v22;
    v8 = v26;
    v9 = v17;
    v10 = v16;
    v11 = v15;
    v13 = v14 & 1;
    AXPerformSafeBlock();
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v12, 0);
    objc_storeStrong((id *)&v7, 0);
    objc_storeStrong(&v6, 0);
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return 1;
}

void __49__UITableViewCellAccessibility__axPerformAction___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  char v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26[3];

  v26[2] = (id)a1;
  v26[1] = (id)a1;
  v25 = 0;
  objc_opt_class();
  v24 = (id)__UIAccessibilityCastAsSafeCategory();
  v23 = v24;
  objc_storeStrong(&v24, 0);
  v26[0] = v23;
  -[UITableViewAccessibility _accessibilitySetShouldConsiderSwipeDeletionCommitted:]((uint64_t)v23);
  v21 = 0;
  objc_opt_class();
  v20 = (id)__UIAccessibilityCastAsClass();
  v19 = v20;
  objc_storeStrong(&v20, 0);
  v22 = v19;
  v18 = objc_msgSend(v19, "_accessibilityShouldIgnoreSwipeActionCompletionHandler") & 1;
  v3 = *(_QWORD *)(a1 + 80);
  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = MEMORY[0x24BDAC760];
  v6 = -1073741824;
  v7 = 0;
  v8 = __49__UITableViewCellAccessibility__axPerformAction___block_invoke_2;
  v9 = &unk_24FF3F7C8;
  v16 = v18;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 64);
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 72);
  v17 = *(_BYTE *)(a1 + 88) & 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(v3 + 16))(v3, v1, v2, &v5);
  if ((v18 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_accessibilityFinishSwipeAction:controller:indexPath:tableView:tvDelegate:wasEditing:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 88) & 1);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v26, 0);
}

uint64_t __49__UITableViewCellAccessibility__axPerformAction___block_invoke_2(uint64_t result)
{
  if ((*(_BYTE *)(result + 80) & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "_accessibilityFinishSwipeAction:controller:indexPath:tableView:tvDelegate:wasEditing:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), *(_QWORD *)(result + 64), *(_QWORD *)(result + 72), *(_BYTE *)(result + 81) & 1);
  return result;
}

- (id)_axCustomActionsForActions:(uint64_t)a1
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD __b[8];
  id v24;
  id v25;
  int v26;
  id location;
  uint64_t v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v28)
  {
    v25 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    memset(__b, 0, sizeof(__b));
    obj = (id)objc_msgSend(location, "actions");
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
    if (v20)
    {
      v16 = *(_QWORD *)__b[2];
      v17 = 0;
      v18 = v20;
      while (1)
      {
        v15 = v17;
        if (*(_QWORD *)__b[2] != v16)
          objc_enumerationMutation(obj);
        v24 = *(id *)(__b[1] + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = (id)objc_msgSend(v24, "accessibilityLabel");
          if (!objc_msgSend(v22, "length"))
          {
            v2 = (id)objc_msgSend(v24, "title");
            v3 = v22;
            v22 = v2;

            if (!objc_msgSend(v22, "length"))
            {
              v14 = (id)objc_msgSend(v24, "image");
              v4 = (id)objc_msgSend(v14, "accessibilityLabel");
              v5 = v22;
              v22 = v4;

              if (!objc_msgSend(v22, "length"))
              {
                v13 = (id)objc_msgSend(v24, "image");
                v6 = (id)objc_msgSend(v13, "accessibilityIdentifier");
                v7 = v22;
                v22 = v6;

              }
            }
          }
          v8 = (id)objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "), v12);
          v9 = v22;
          v22 = v8;

          if (objc_msgSend(v22, "length"))
          {
            v10 = objc_alloc(MEMORY[0x24BDF6788]);
            v21 = (id)objc_msgSend(v10, "initWithName:target:selector:", v22, v28, sel__axPerformAction_);
            objc_msgSend(v21, "_accessibilitySetRetainedValue:forKey:", v24, CFSTR("AXTableCellActionKey"));
            objc_msgSend(v25, "addObject:", v21);
            objc_storeStrong(&v21, 0);
          }
          objc_storeStrong(&v22, 0);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = v24;
            _AXAssert();
          }
        }
        ++v17;
        if (v15 + 1 >= v18)
        {
          v17 = 0;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
          if (!v18)
            break;
        }
      }
    }

    v29 = v25;
    v26 = 1;
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v29 = 0;
    v26 = 1;
  }
  objc_storeStrong(&location, 0);
  return v29;
}

- (id)_privateAccessibilityCustomActions
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  BOOL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  BOOL v30;
  UITableViewCellAccessibility *v31;
  id v32;
  id v33;
  id v34;
  UITableViewCellAccessibility *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  char v44;
  id v45;
  id v46;
  id v47;
  id v48;
  char v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t (*v56)(id *, void *);
  void *v57;
  id v58;
  id v59;
  id from;
  id v61[2];
  id v62;
  id v63;
  id v64;
  char v65;
  id v66;
  id v67;
  id v68;
  objc_super v69;
  id v70[2];
  UITableViewCellAccessibility *v71;

  v71 = self;
  v70[1] = (id)a2;
  v69.receiver = self;
  v69.super_class = (Class)UITableViewCellAccessibility;
  v40 = -[UITableViewCellAccessibility _privateAccessibilityCustomActions](&v69, sel__privateAccessibilityCustomActions);
  v70[0] = (id)objc_msgSend(v40, "mutableCopy");

  if (!v70[0])
  {
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = v70[0];
    v70[0] = v2;

  }
  v68 = (id)-[UITableViewCellAccessibility safeValueForKey:](v71, "safeValueForKey:", CFSTR("_tableView"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && -[UITableViewCellAccessibility _accessibilitySwipeActionsAllowed](v71, "_accessibilitySwipeActionsAllowed"))
  {
    v67 = -[UITableViewCellAccessibility _accessibilityIndexPath](v71, "_accessibilityIndexPath");
    v65 = 0;
    objc_opt_class();
    v39 = (id)-[UITableViewCellAccessibility safeValueForKey:](v71, "safeValueForKey:", CFSTR("_tableView"));
    v64 = (id)__UIAccessibilityCastAsClass();

    v63 = v64;
    objc_storeStrong(&v64, 0);
    v66 = v63;
    v62 = (id)objc_msgSend(v63, "_swipeActionController");
    if ((objc_msgSend(v66, "conformsToProtocol:", &unk_255ED5D40) & 1) != 0)
    {
      v32 = v70[0];
      v31 = v71;
      v34 = (id)objc_msgSend(v66, "swipeActionController:leadingSwipeConfigurationForItemAtIndexPath:", v62, v67);
      v33 = -[UITableViewCellAccessibility _axCustomActionsForActions:]((uint64_t)v31, v34);
      objc_msgSend(v32, "axSafelyAddObjectsFromArray:");

      v36 = v70[0];
      v35 = v71;
      v38 = (id)objc_msgSend(v66, "swipeActionController:trailingSwipeConfigurationForItemAtIndexPath:", v62, v67);
      v37 = -[UITableViewCellAccessibility _axCustomActionsForActions:]((uint64_t)v35, v38);
      objc_msgSend(v36, "axSafelyAddObjectsFromArray:");

    }
    objc_storeStrong(&v62, 0);
    objc_storeStrong(&v66, 0);
    objc_storeStrong(&v67, 0);
  }
  v4 = -[UITableViewCellAccessibility _accessibilityTableViewSwitch](v71, "_accessibilityTableViewSwitch");
  v30 = v4 == 0;

  if (!v30)
  {
    v28 = (id)-[UITableViewCellAccessibility safeValueForKey:](v71, "safeValueForKey:", CFSTR("editingStyle"));
    v29 = (void *)(int)objc_msgSend(v28, "intValue");

    v61[1] = v29;
    v61[0] = 0;
    if (v29 == (void *)1)
    {
      v7 = accessibilityLocalizedString(CFSTR("remove.control.text"));
      v8 = v61[0];
      v61[0] = v7;

    }
    else if (v29 == (void *)2)
    {
      v5 = accessibilityLocalizedString(CFSTR("insert.control.text"));
      v6 = v61[0];
      v61[0] = v5;

    }
    if (v61[0])
    {
      objc_initWeak(&from, v71);
      v27 = objc_alloc(MEMORY[0x24BDF6788]);
      v26 = v61[0];
      v53 = MEMORY[0x24BDAC760];
      v54 = -1073741824;
      v55 = 0;
      v56 = __66__UITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke;
      v57 = &unk_24FF3F818;
      objc_copyWeak(&v58, &from);
      v59 = (id)objc_msgSend(v27, "initWithName:actionHandler:", v26, &v53);
      objc_msgSend(v70[0], "axSafelyAddObject:", v59);
      objc_storeStrong(&v59, 0);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&from);
    }
    objc_storeStrong(v61, 0);
  }
  if (-[UITableViewCellAccessibility accessoryType](v71, "accessoryType") == 4)
  {
    v24 = objc_alloc(MEMORY[0x24BDF6788]);
    v25 = accessibilityLocalizedString(CFSTR("more.info.button"));
    v52 = (id)objc_msgSend(v24, "initWithName:target:selector:");

    objc_msgSend(v70[0], "addObject:", v52);
    objc_storeStrong(&v52, 0);
  }
  if ((-[UITableViewCellAccessibility _accessibilityHasReorderActions](v71) & 1) != 0)
  {
    v51 = -[UITableViewCellAccessibility _accessibilityIndexPath](v71, "_accessibilityIndexPath");
    if (objc_msgSend(v51, "row") > 0)
    {
      v49 = 0;
      objc_opt_class();
      v23 = -[UITableViewCellAccessibility _accessibilityParentTableView](v71, "_accessibilityParentTableView");
      v22 = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](v71);
      v21 = (id)objc_msgSend(v23, "cellForRowAtIndexPath:");
      v48 = (id)__UIAccessibilityCastAsSafeCategory();

      v47 = v48;
      objc_storeStrong(&v48, 0);
      v50 = v47;
      if ((-[UITableViewCellAccessibility _accessibilityHasReorderActions](v47) & 1) != 0)
      {
        v19 = objc_alloc(MEMORY[0x24BDF6788]);
        v20 = accessibilityLocalizedString(CFSTR("table.cell.reorder.action.move.up"));
        v46 = (id)objc_msgSend(v19, "initWithName:target:selector:");

        objc_msgSend(v70[0], "addObject:", v46);
        objc_storeStrong(&v46, 0);
      }
      objc_storeStrong(&v50, 0);
    }
    v16 = objc_msgSend(v51, "row");
    v17 = -[UITableViewCellAccessibility _accessibilityParentTableView](v71, "_accessibilityParentTableView");
    v18 = v16 >= objc_msgSend(v17, "numberOfRowsInSection:", objc_msgSend(v51, "section")) - 1;

    if (!v18)
    {
      v44 = 0;
      objc_opt_class();
      v15 = -[UITableViewCellAccessibility _accessibilityParentTableView](v71, "_accessibilityParentTableView");
      v14 = -[UITableViewCellAccessibility _accessibilityNextIndexPath](v71);
      v13 = (id)objc_msgSend(v15, "cellForRowAtIndexPath:");
      v43 = (id)__UIAccessibilityCastAsSafeCategory();

      v42 = v43;
      objc_storeStrong(&v43, 0);
      v45 = v42;
      if ((-[UITableViewCellAccessibility _accessibilityHasReorderActions](v42) & 1) != 0)
      {
        v11 = objc_alloc(MEMORY[0x24BDF6788]);
        v12 = accessibilityLocalizedString(CFSTR("table.cell.reorder.action.move.down"));
        v41 = (id)objc_msgSend(v11, "initWithName:target:selector:");

        objc_msgSend(v70[0], "addObject:", v41);
        objc_storeStrong(&v41, 0);
      }
      objc_storeStrong(&v45, 0);
    }
    objc_storeStrong(&v51, 0);
  }
  v10 = v70[0];
  objc_storeStrong(&v68, 0);
  objc_storeStrong(v70, 0);
  return v10;
}

uint64_t __66__UITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke(id *a1, void *a2)
{
  id v4[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4[1] = a1;
  objc_copyWeak(v4, a1 + 4);
  AXPerformSafeBlock();
  objc_destroyWeak(v4);
  objc_storeStrong(location, 0);
  return 1;
}

void __66__UITableViewCellAccessibility__privateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (id)objc_msgSend(v3, "_accessibilityCellEditingControl");
  objc_msgSend(WeakRetained, "editControlWasClicked:");

}

- (uint64_t)_accessibilityHasReorderActions
{
  char v2;

  if (a1)
    v2 = objc_msgSend(a1, "safeBoolForKey:", CFSTR("showsReorderControl")) & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (BOOL)_accessibilityRespondsToUserInteractionForElement:(id)a3
{
  objc_super v4;
  int v5;
  id location[2];
  UITableViewCellAccessibility *v7;
  char v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (-[UITableViewCellAccessibility isAccessibilityElement](v7, "isAccessibilityElement"))
  {
    v8 = 1;
  }
  else
  {
    v4.receiver = v7;
    v4.super_class = (Class)UITableViewCellAccessibility;
    v8 = -[UITableViewCellAccessibility _accessibilityRespondsToUserInteractionForElement:](&v4, sel__accessibilityRespondsToUserInteractionForElement_, location[0]);
  }
  v5 = 1;
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (BOOL)_accessibilityHandleReorderMoveDown
{
  return -[UITableViewCellAccessibility _accessibilityHandleReorderMoveUp:](self, "_accessibilityHandleReorderMoveUp:", 0, a2, self);
}

- (BOOL)_accessibilityHandleReorderMoveUp
{
  return -[UITableViewCellAccessibility _accessibilityHandleReorderMoveUp:](self, "_accessibilityHandleReorderMoveUp:", 1, a2, self);
}

- (BOOL)_accessibilityHandleReorderMoveUp:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  int v14;
  BOOL v16;
  id v17;
  CGFloat v18;
  double v19;
  uint64_t v20;
  id v21;
  id v22[2];
  id v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(_QWORD *);
  void *v28;
  id v29;
  id v30[3];
  uint64_t v31;
  uint64_t *v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  id v38;
  double v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect rect;
  double v48;
  char v49;
  uint64_t v50;
  int v51;
  int v52;
  void (*v53)(uint64_t);
  void *v54;
  id v55;
  id v56;
  id v57[2];
  uint64_t v58;
  uint64_t *v59;
  int v60;
  int v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  id EventForSceneReferencePoint;
  id v67;
  int v68;
  id v69;
  id v70;
  BOOL v71;
  SEL v72;
  UITableViewCellAccessibility *v73;
  char v74;
  double v75;
  CGRect v76;

  v73 = self;
  v72 = a2;
  v71 = a3;
  v70 = -[UITableViewCellAccessibility _accessibilityParentTableView](self, "_accessibilityParentTableView");
  v69 = -[UITableViewCellAccessibility _accessibilityIndexPath](v73, "_accessibilityIndexPath");
  if ((!v71 || objc_msgSend(v69, "row"))
    && (v71
     || (v20 = objc_msgSend(v69, "row"),
         v20 != objc_msgSend(v70, "numberOfRowsInSection:", objc_msgSend(v69, "section")) - 1)))
  {
    v67 = v73;
    -[UITableViewCellAccessibility accessibilityActivationPoint](v73, "accessibilityActivationPoint");
    v64 = v3;
    v65 = v4;
    EventForSceneReferencePoint = (id)UIAccessibilityCreateEventForSceneReferencePoint();
    v63 = 0;
    v58 = 0;
    v59 = &v58;
    v60 = 0x20000000;
    v61 = 32;
    v62 = 0;
    v50 = MEMORY[0x24BDAC760];
    v51 = -1073741824;
    v52 = 0;
    v53 = __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke;
    v54 = &unk_24FF3E8F0;
    v57[1] = &v58;
    v55 = v70;
    v56 = v67;
    v57[0] = EventForSceneReferencePoint;
    AXPerformSafeBlock();
    v49 = v59[3] & 1;
    objc_storeStrong(v57, 0);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v55, 0);
    _Block_object_dispose(&v58, 8);
    v63 = v49 & 1;
    if ((v49 & 1) != 0)
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
      objc_msgSend(v17, "bounds");
      rect = v76;
      v18 = CGRectGetHeight(v76) / 2.0;

      v48 = v18;
      objc_msgSend(v67, "frame");
      v46.origin.x = v5;
      v46.origin.y = v6;
      v46.size.width = v7;
      v46.size.height = v8;
      v45 = 0.0;
      if (v71)
        v9 = -1;
      else
        v9 = 1;
      v19 = (double)v9;
      objc_msgSend(v67, "bounds");
      v41 = v10;
      v42 = v11;
      v43 = v12;
      v44 = v13;
      v45 = v19 * (v13 / 2.0);
      v40 = 0;
      do
      {
        if (v71)
          v14 = -1;
        else
          v14 = 1;
        v45 = v45 + (double)(10 * v14);
        v39 = 0.0;
        v39 = CGRectGetMidY(v46) + v45;
        v31 = 0;
        v32 = &v31;
        v33 = 838860800;
        v34 = 48;
        v35 = __Block_byref_object_copy__21;
        v36 = __Block_byref_object_dispose__21;
        v37 = 0;
        v24 = MEMORY[0x24BDAC760];
        v25 = -1073741824;
        v26 = 0;
        v27 = __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke_2;
        v28 = &unk_24FF3F840;
        v30[1] = &v31;
        v29 = v70;
        v30[2] = *(id *)&v39;
        v30[0] = v69;
        AXPerformSafeBlock();
        v23 = (id)v32[5];
        objc_storeStrong(v30, 0);
        objc_storeStrong(&v29, 0);
        _Block_object_dispose(&v31, 8);
        objc_storeStrong(&v37, 0);
        v38 = v23;
        v40 = (objc_msgSend(v69, "isEqual:", v23) ^ 1) & 1;
        objc_storeStrong(&v38, 0);
        v16 = 0;
        if ((v40 & 1) == 0)
        {
          v75 = v45;
          v16 = fabs(v45) < v48;
        }
      }
      while (v16);
      v21 = v70;
      v22[0] = v67;
      v22[1] = *(id *)&v45;
      AXPerformSafeBlock();
      v74 = 1;
      v68 = 1;
      objc_storeStrong(v22, 0);
      objc_storeStrong(&v21, 0);
    }
    else
    {
      v74 = -[UITableViewCellAccessibility _axReorderElementsByMovingIndexPaths:tableView:currentPath:](v73, "_axReorderElementsByMovingIndexPaths:tableView:currentPath:", v71, v70, v69);
      v68 = 1;
    }
    objc_storeStrong(&EventForSceneReferencePoint, 0);
    objc_storeStrong(&v67, 0);
  }
  else
  {
    v74 = 0;
    v68 = 1;
  }
  objc_storeStrong(&v69, 0);
  objc_storeStrong(&v70, 0);
  return v74 & 1;
}

void __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v5 = (id)objc_msgSend(*(id *)(a1 + 48), "allTouches");
  v4 = (id)objc_msgSend(v5, "anyObject");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "_beginReorderingForCell:touch:", v1) & 1;

}

void __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke_2(_QWORD *a1)
{
  double v1;
  double v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v6 = (void *)a1[4];
  CGPointMake_7();
  v3 = (id)objc_msgSend(v6, "_targetIndexPathAtPoint:withLastTargetIndexPath:adjustedForGap:", a1[5], 0, v1, v2);
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __66__UITableViewCellAccessibility__accessibilityHandleReorderMoveUp___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_draggingReorderingCell:yDelta:touch:", *(_QWORD *)(a1 + 40), 0, *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_endReorderingForCell:wasCancelled:animated:", *(_QWORD *)(a1 + 40), 0, 1);
}

- (BOOL)_axReorderElementsByMovingIndexPaths:(BOOL)a3 tableView:(id)a4 currentPath:(id)a5
{
  id v5;
  id v6;
  uint64_t v7;
  id v9;
  UIAccessibilityNotifications *v10;
  BOOL v11;
  int v13;
  id v14;
  id v15;
  char v16;
  id v17[2];
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  id v29;
  id v30;
  id location;
  BOOL v32;
  SEL v33;
  UITableViewCellAccessibility *v34;
  char v35;

  v34 = self;
  v33 = a2;
  v32 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v30 = 0;
  objc_storeStrong(&v30, a5);
  if ((objc_msgSend(location, "safeBoolForKey:", CFSTR("_dragAndDropUsedForReordering")) & 1) == 0)
    goto LABEL_13;
  v27 = 0;
  v25 = 0;
  if (v32)
  {
    v28 = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](v34);
    v27 = 1;
    v5 = v28;
  }
  else
  {
    v26 = -[UITableViewCellAccessibility _accessibilityNextIndexPath](v34);
    v25 = 1;
    v5 = v26;
  }
  v29 = v5;
  if ((v25 & 1) != 0)

  if ((v27 & 1) != 0)
  v17[1] = (id)MEMORY[0x24BDAC760];
  v18 = -1073741824;
  v19 = 0;
  v20 = __91__UITableViewCellAccessibility__axReorderElementsByMovingIndexPaths_tableView_currentPath___block_invoke;
  v21 = &unk_24FF3DEB0;
  v22 = location;
  v23 = v30;
  v24 = v29;
  AXPerformSafeBlock();
  v6 = -[UITableViewCellAccessibility _accessibilityIndexPath](v34, "_accessibilityIndexPath");
  v11 = v6 != v29;

  if (v11)
  {
    v13 = 0;
  }
  else
  {
    v16 = 0;
    objc_opt_class();
    v15 = (id)__UIAccessibilityCastAsSafeCategory();
    v14 = v15;
    objc_storeStrong(&v15, 0);
    v9 = v29;
    v7 = objc_msgSend(v30, "row");
    v17[0] = -[UITableViewAccessibility _accessibilityReorderMessageForNewIndexPath:swappedWithRow:movingDown:](v14, v9, v7, !v32);

    v10 = (UIAccessibilityNotifications *)MEMORY[0x24BDF71E8];
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v17[0]);
    UIAccessibilityPostNotification(*v10, (id)*MEMORY[0x24BDFEE28]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    v35 = 1;
    v13 = 1;
    objc_storeStrong(v17, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v29, 0);
  if (!v13)
LABEL_13:
    v35 = 0;
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&location, 0);
  return v35 & 1;
}

uint64_t __91__UITableViewCellAccessibility__axReorderElementsByMovingIndexPaths_tableView_currentPath___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "beginUpdates");
  objc_msgSend(*(id *)(a1 + 32), "moveRowAtIndexPath:toIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "endUpdates");
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  id v2;
  BOOL v4;
  objc_super v5;
  char v6;
  SEL v7;
  UITableViewCellAccessibility *v8;

  v8 = self;
  v7 = a2;
  v6 = 0;
  v2 = -[UITableViewCellAccessibility _accessibilityTableViewSwitch](self, "_accessibilityTableViewSwitch");
  v4 = v2 == 0;

  if (!v4)
    return 1;
  v5.receiver = v8;
  v5.super_class = (Class)UITableViewCellAccessibility;
  return -[UITableViewCellAccessibility _accessibilityIsSpeakThisElement](&v5, sel__accessibilityIsSpeakThisElement);
}

- (id)accessibilityDragSourceDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  __int128 v30;
  id v31;
  id v32;
  char v33;
  id v34;
  id v35;
  id v36;
  char v37;
  id v38;
  id v39;
  int v40;
  id v41[2];
  UITableViewCellAccessibility *v42;
  id v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v42 = self;
  v41[1] = (id)a2;
  v41[0] = (id)-[UITableViewCellAccessibility accessibilityUserDefinedDragSourceDescriptors](self, "accessibilityUserDefinedDragSourceDescriptors");
  if (v41[0])
  {
    v43 = v41[0];
    v40 = 1;
  }
  else
  {
    v39 = -[UITableViewCellAccessibility _accessibilityParentTableView](v42, "_accessibilityParentTableView");
    v37 = 0;
    v15 = (id)objc_msgSend(v39, "safeValueForKey:", CFSTR("_dragController"));
    v36 = (id)__UIAccessibilitySafeClass();

    v35 = v36;
    objc_storeStrong(&v36, 0);
    v38 = v35;
    if (!v35)
      goto LABEL_8;
    v33 = 0;
    objc_opt_class();
    v32 = (id)__UIAccessibilityCastAsClass();
    v31 = v32;
    objc_storeStrong(&v32, 0);
    v34 = v31;
    v30 = 0uLL;
    v14 = v31;
    objc_msgSend(v31, "bounds");
    v24 = v2;
    v25 = v3;
    v26 = v4;
    v27 = v5;
    UIRectGetCenter();
    v28 = v6;
    v29 = v7;
    objc_msgSend(v14, "convertPoint:toView:", v39, v6, v7);
    *(_QWORD *)&v30 = v8;
    *((_QWORD *)&v30 + 1) = v9;
    v19 = 0;
    v20 = &v19;
    v21 = 0x20000000;
    v22 = 32;
    v23 = 0;
    v17[1] = &v19;
    v16 = v39;
    v18 = v30;
    v17[0] = v42;
    AXPerformSafeBlock();
    if ((v20[3] & 1) != 0)
    {
      v13 = objc_alloc(MEMORY[0x24BDF67B0]);
      v11 = accessibilityLocalizedString(CFSTR("drag.table.view.cell"));
      v12 = (id)objc_msgSend(v13, "initWithName:point:inView:", *(double *)&v30, *((double *)&v30 + 1));
      v44[0] = v12;
      v43 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 1);

      v40 = 1;
    }
    else
    {
      v40 = 0;
    }
    objc_storeStrong(v17, 0);
    objc_storeStrong(&v16, 0);
    _Block_object_dispose(&v19, 8);
    objc_storeStrong(&v34, 0);
    if (!v40)
    {
LABEL_8:
      v43 = 0;
      v40 = 1;
    }
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  objc_storeStrong(v41, 0);
  return v43;
}

void __66__UITableViewCellAccessibility_accessibilityDragSourceDescriptors__block_invoke(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(a1 + 32);
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_accessibilityIndexPath");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v1, "_canBeginDragAtPoint:indexPath:", *(double *)(a1 + 56), *(double *)(a1 + 64)) & 1;

}

- (id)accessibilityDropPointDescriptors
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  double v34[3];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  id v40;
  id v41;
  int v42;
  id v43[2];
  UITableViewCellAccessibility *v44;
  id v45;
  _QWORD v46[4];

  v46[3] = *MEMORY[0x24BDAC8D0];
  v44 = self;
  v43[1] = (id)a2;
  v43[0] = (id)-[UITableViewCellAccessibility accessibilityUserDefinedDropPointDescriptors](self, "accessibilityUserDefinedDropPointDescriptors");
  if (v43[0])
  {
    v45 = v43[0];
    v42 = 1;
  }
  else
  {
    v41 = -[UITableViewCellAccessibility _accessibilityParentTableView](v44, "_accessibilityParentTableView");
    v40 = (id)objc_msgSend(v41, "safeValueForKey:", CFSTR("_dropController"));
    if (v40)
    {
      -[UITableViewCellAccessibility bounds](v44, "bounds");
      v35 = v2;
      v36 = v3;
      v37 = v4;
      v38 = v5;
      UIRectGetCenter();
      *(double *)&v39 = v6;
      *((double *)&v39 + 1) = v7;
      -[UITableViewCellAccessibility convertPoint:toView:](v44, "convertPoint:toView:", v41, v6, v7);
      v34[0] = v8;
      v34[1] = v9;
      v19 = objc_alloc(MEMORY[0x24BDF67B0]);
      v20 = accessibilityLocalizedString(CFSTR("drop.table.view.cell.onto"));
      v33 = objc_msgSend(v19, "initWithName:point:inView:", *(_OWORD *)v34);

      *(_QWORD *)&v34[0] = v39;
      v34[1] = -10.0;
      -[UITableViewCellAccessibility convertPoint:toView:](v44, "convertPoint:toView:", v41, *(double *)&v39, -10.0);
      *(_QWORD *)&v32 = v10;
      *((_QWORD *)&v32 + 1) = v11;
      *(_OWORD *)v34 = v32;
      v21 = objc_alloc(MEMORY[0x24BDF67B0]);
      v22 = accessibilityLocalizedString(CFSTR("drop.table.view.cell.before"));
      v31 = objc_msgSend(v21, "initWithName:point:inView:", *(_OWORD *)v34);

      *(_OWORD *)v34 = v39;
      -[UITableViewCellAccessibility bounds](v44, "bounds");
      v27 = v12;
      v28 = v13;
      v29 = v14;
      v30 = v15;
      v34[1] = v15 + 10.0;
      -[UITableViewCellAccessibility convertPoint:toView:](v44, "convertPoint:toView:", v41, v34[0], v15 + 10.0);
      *(_QWORD *)&v26 = v16;
      *((_QWORD *)&v26 + 1) = v17;
      *(_OWORD *)v34 = v26;
      v23 = objc_alloc(MEMORY[0x24BDF67B0]);
      v24 = accessibilityLocalizedString(CFSTR("drop.table.view.cell.after"));
      v25 = objc_msgSend(v23, "initWithName:point:inView:", *(_OWORD *)v34);

      v46[0] = v31;
      v46[1] = v33;
      v46[2] = v25;
      v45 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 3);
      v42 = 1;
      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong((id *)&v31, 0);
      objc_storeStrong((id *)&v33, 0);
    }
    else
    {
      v45 = 0;
      v42 = 1;
    }
    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v41, 0);
  }
  objc_storeStrong(v43, 0);
  return v45;
}

- (id)accessibilityHeaderElements
{
  objc_super v3;
  id v4;
  id v5;
  id v6[2];
  UITableViewCellAccessibility *v7;
  id v8;

  v7 = self;
  v6[1] = (id)a2;
  if (_AXSAutomationEnabled())
  {
    v6[0] = -[UITableViewCellAccessibility _accessibilityIndexPath](v7, "_accessibilityIndexPath");
    v5 = -[UITableViewCellAccessibility _accessibilityParentTableView](v7, "_accessibilityParentTableView");
    v4 = (id)objc_msgSend(v5, "headerViewForSection:", objc_msgSend(v6[0], "section"));
    v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
    objc_storeStrong(&v4, 0);
    objc_storeStrong(&v5, 0);
    objc_storeStrong(v6, 0);
  }
  else
  {
    v3.receiver = v7;
    v3.super_class = (Class)UITableViewCellAccessibility;
    v8 = -[UITableViewCellAccessibility accessibilityHeaderElements](&v3, sel_accessibilityHeaderElements);
  }
  return v8;
}

- (id)_accessibilityNativeFocusPreferredElement
{
  id v4;
  id v5;
  id v6[3];

  v6[2] = self;
  v6[1] = (id)a2;
  v4 = (id)objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
  v6[0] = (id)-[UITableViewCellAccessibility _accessibilityLeafDescendantsWithOptions:](self, "_accessibilityLeafDescendantsWithOptions:");

  v5 = (id)objc_msgSend(v6[0], "firstObject");
  objc_storeStrong(v6, 0);
  return v5;
}

- (BOOL)_accessibilitySetNativeFocus
{
  objc_super v3;
  int v4;
  id location[2];
  UITableViewCellAccessibility *v6;
  char v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibility _accessibilityCellEditingControl](self, "_accessibilityCellEditingControl");
  if ((objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1) != 0)
  {
    v7 = objc_msgSend(location[0], "_accessibilitySetNativeFocus") & 1;
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableViewCellAccessibility;
    v7 = -[UITableViewCellAccessibility _accessibilitySetNativeFocus](&v3, sel__accessibilitySetNativeFocus);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)_accessibilityViewHierarchyHasNativeFocus
{
  objc_super v3;
  int v4;
  id location[2];
  UITableViewCellAccessibility *v6;
  char v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = -[UITableViewCellAccessibility _accessibilityCellEditingControl](self, "_accessibilityCellEditingControl");
  if ((objc_msgSend(location[0], "_accessibilityViewIsVisible") & 1) != 0)
  {
    v7 = objc_msgSend(location[0], "_accessibilityViewHierarchyHasNativeFocus") & 1;
  }
  else
  {
    v3.receiver = v6;
    v3.super_class = (Class)UITableViewCellAccessibility;
    v7 = -[UITableViewCellAccessibility _accessibilityViewHierarchyHasNativeFocus](&v3, sel__accessibilityViewHierarchyHasNativeFocus);
  }
  v4 = 1;
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_class *v4;
  char v6;
  NSString *v7;
  id v8;
  Method InstanceMethod;
  objc_super v10;
  char v11;
  id location;
  SEL v13;
  SEL v14;
  UITableViewCellAccessibility *v15;
  id v16;
  dispatch_once_t *v17;

  v15 = self;
  v14 = a2;
  v13 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v11 = 0;
  v10.receiver = v15;
  v10.super_class = (Class)UITableViewCellAccessibility;
  v11 = -[UITableViewCellAccessibility canPerformAction:withSender:](&v10, sel_canPerformAction_withSender_, v13, location);
  if (v11 && v13 == sel_selectAll_)
  {
    v17 = (dispatch_once_t *)&canPerformAction_withSender__onceToken;
    v16 = 0;
    objc_storeStrong(&v16, &__block_literal_global_726);
    if (*v17 != -1)
      dispatch_once(v17, v16);
    objc_storeStrong(&v16, 0);
    v4 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v4, sel_selectAll_);
    if (InstanceMethod && (Method)canPerformAction_withSender__selectAllBaseMethod == InstanceMethod)
      v11 = 0;
  }
  if ((v11 & 1) == 0
    && (-[UITableViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v15, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v8 = -[UITableViewCellAccessibility _accessibilityPerformableActions](v15, "_accessibilityPerformableActions");
    v7 = NSStringFromSelector(v13);
    v11 = objc_msgSend(v8, "containsObject:") & 1;

  }
  v6 = v11;
  objc_storeStrong(&location, 0);
  return v6 & 1;
}

Method __60__UITableViewCellAccessibility_canPerformAction_withSender___block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel_selectAll_);
  canPerformAction_withSender__selectAllBaseMethod = (uint64_t)result;
  return result;
}

- (id)_accessibilityPerformableActions
{
  NSString *v3;
  id v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v7 = NSStringFromSelector(sel__accessibilityHandleReorderMoveUpWithFocus);
  v8[0] = v7;
  v6 = NSStringFromSelector(sel__accessibilityHandleReorderMoveDownWithFocus);
  v8[1] = v6;
  v5 = NSStringFromSelector(sel__accessibilityKeyCommandActionPlus);
  v8[2] = v5;
  v3 = NSStringFromSelector(sel__accessibilityKeyCommandActionMinus);
  v8[3] = v3;
  v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);

  return v4;
}

- (id)_accessibilityKeyCommands
{
  id v3;
  id v4;
  id location[2];
  UITableViewCellAccessibility *v6;
  id v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v6 = self;
  location[1] = (id)a2;
  if ((-[UITableViewCellAccessibility _accessibilityHasReorderActions](self) & 1) != 0)
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF79B0]);
    v8[0] = v4;
    v3 = (id)objc_msgSend(MEMORY[0x24BDF6B10], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x24BDF7990], 0x20000, sel__accessibilityHandleReorderMoveDownWithFocus);
    v8[1] = v3;
    v7 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);

  }
  else
  {
    location[0] = -[UITableViewCellAccessibility _accessibilityStepperAccessory](v6, "_accessibilityStepperAccessory");
    if (location[0])
      v7 = (id)objc_msgSend(location[0], "_accessibilityKeyCommands");
    else
      v7 = 0;
    objc_storeStrong(location, 0);
  }
  return v7;
}

- (id)_accessibilityStepperAccessory
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v7;
  id v8;
  char v9;
  SEL v10;
  UITableViewCellAccessibility *v11;

  v11 = self;
  v10 = a2;
  v9 = 0;
  objc_opt_class();
  v7 = 0;
  objc_opt_class();
  v6 = (id)__UIAccessibilityCastAsClass();
  v5 = v6;
  objc_storeStrong(&v6, 0);
  v3 = (id)objc_msgSend(v5, "accessoryView");
  v8 = (id)__UIAccessibilityCastAsSafeCategory();

  if ((v9 & 1) != 0)
    abort();
  v4 = v8;
  objc_storeStrong(&v8, 0);
  return v4;
}

- (void)_accessibilityKeyCommandActionPlus
{
  id v2;

  v2 = -[UITableViewCellAccessibility _accessibilityStepperAccessory](self, "_accessibilityStepperAccessory");
  objc_msgSend(v2, "_accessibilityKeyCommandActionPlus");

}

- (void)_accessibilityKeyCommandActionMinus
{
  id v2;

  v2 = -[UITableViewCellAccessibility _accessibilityStepperAccessory](self, "_accessibilityStepperAccessory");
  objc_msgSend(v2, "_accessibilityKeyCommandActionMinus");

}

- (void)_accessibilityHandleReorderMoveDownWithFocus
{
  id v2;
  id v3;
  id v4[2];
  UITableViewCellAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableViewCellAccessibility _accessibilityNextIndexPath](self);
  v3 = -[UITableViewCellAccessibility _accessibilityParentTableView](v5, "_accessibilityParentTableView");
  -[UITableViewCellAccessibility _accessibilityHandleReorderMoveDown](v5, "_accessibilityHandleReorderMoveDown");
  v2 = (id)objc_msgSend(v3, "cellForRowAtIndexPath:", v4[0]);
  _UIAXAssignFocusToItem();

  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB0], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (void)_accessibilityHandleReorderMoveUpWithFocus
{
  id v2;
  id v3;
  id v4[2];
  UITableViewCellAccessibility *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[UITableViewCellAccessibility _accessibilityPreviousIndexPath](self);
  v3 = -[UITableViewCellAccessibility _accessibilityParentTableView](v5, "_accessibilityParentTableView");
  -[UITableViewCellAccessibility _accessibilityHandleReorderMoveUp](v5, "_accessibilityHandleReorderMoveUp");
  v2 = (id)objc_msgSend(v3, "cellForRowAtIndexPath:", v4[0]);
  _UIAXAssignFocusToItem();

  UIAccessibilityPostNotification(*MEMORY[0x24BEBAFB0], 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (BOOL)canBecomeFocused
{
  id v2;
  objc_class *v3;
  id v4;
  id v5;
  id v7;
  id v8;
  BOOL v9;
  BOOL v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  int v14;
  int v15;
  BOOL (*v16)(uint64_t, void *);
  void *v17;
  id v18[2];
  _QWORD v19[2];
  int v20;
  int v21;
  uint64_t v22;
  id v23;
  id v24;
  char v25;
  id v26;
  BOOL v27;
  BOOL v28;
  Method InstanceMethod;
  objc_super v30;
  char v31;
  SEL v32;
  UITableViewCellAccessibility *v33;
  char v34;
  id location;
  dispatch_once_t *v36;

  v33 = self;
  v32 = a2;
  v31 = 0;
  v30.receiver = self;
  v30.super_class = (Class)UITableViewCellAccessibility;
  v31 = -[UITableViewCellAccessibility canBecomeFocused](&v30, sel_canBecomeFocused);
  if ((-[UITableViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v33, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
  {
LABEL_19:
    v34 = v31 & 1;
    return v34 & 1;
  }
  v2 = (id)-[UITableViewCellAccessibility storedAccessibilityRespondsToUserInteraction](v33, "storedAccessibilityRespondsToUserInteraction");
  v12 = v2 == 0;

  if (v12)
  {
    if ((v31 & 1) == 0)
    {
      v36 = (dispatch_once_t *)&canBecomeFocused_onceToken_0;
      location = 0;
      objc_storeStrong(&location, &__block_literal_global_739);
      if (*v36 != -1)
        dispatch_once(v36, location);
      objc_storeStrong(&location, 0);
      v3 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v3, sel_accessibilityRespondsToUserInteraction);
      v28 = InstanceMethod != (Method)canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod_0;
      v4 = (id)-[UITableViewCellAccessibility storedAccessibilityRespondsToUserInteraction](v33, "storedAccessibilityRespondsToUserInteraction");
      v9 = v4 != 0;

      v27 = v9;
      v10 = 1;
      if (!v28)
      {
        v10 = 1;
        if (!v27)
        {
          v10 = 1;
          if ((-[UITableViewCellAccessibility safeBoolForKey:](v33, "safeBoolForKey:", CFSTR("_accessibilityRespondsToUserInteraction")) & 1) == 0)v10 = -[UITableViewCellAccessibility accessibilityTraits](v33, "accessibilityTraits") != 0;
        }
      }
      v31 = v10;
    }
    v25 = 0;
    objc_opt_class();
    v24 = (id)__UIAccessibilityCastAsClass();
    v23 = v24;
    objc_storeStrong(&v24, 0);
    v26 = v23;
    if ((v31 & 1) != 0)
    {
      v8 = (id)objc_msgSend(v26, "contentView");
      v31 = (-[UIViewAccessibility _axHasSingleFocusableSubview](v8) ^ 1) & 1;

    }
    if ((v31 & 1) == 0)
      v31 = objc_msgSend(v26, "isEditing") & 1;
    if ((v31 & 1) != 0)
    {
      v19[0] = 0;
      v19[1] = v19;
      v20 = 0x20000000;
      v21 = 32;
      v22 = 0;
      v7 = (id)objc_msgSend(v26, "contentView");
      v13 = MEMORY[0x24BDAC760];
      v14 = -1073741824;
      v15 = 0;
      v16 = __48__UITableViewCellAccessibility_canBecomeFocused__block_invoke_2;
      v17 = &unk_24FF3F8D0;
      v18[0] = v33;
      v18[1] = v19;
      v5 = (id)objc_msgSend(v7, "_accessibilityFindDescendant:", &v13);
      v31 = v5 == 0;

      objc_storeStrong(v18, 0);
      _Block_object_dispose(v19, 8);
    }
    objc_storeStrong(&v26, 0);
    goto LABEL_19;
  }
  v11 = (id)-[UITableViewCellAccessibility storedAccessibilityRespondsToUserInteraction](v33, "storedAccessibilityRespondsToUserInteraction");
  v34 = objc_msgSend(v11, "BOOLValue") & 1;

  return v34 & 1;
}

Method __48__UITableViewCellAccessibility_canBecomeFocused__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel_accessibilityRespondsToUserInteraction);
  canBecomeFocused_accessibilityRespondsToUserInteractionBaseMethod_0 = (uint64_t)result;
  return result;
}

BOOL __48__UITableViewCellAccessibility_canBecomeFocused__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  BOOL v4;
  id v5;
  id v6;
  id v7;
  BOOL v8;
  char v10;
  id v11;
  id location[2];
  BOOL v13;

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if (location[0] == *(id *)(a1 + 32))
  {
    v13 = 0;
  }
  else
  {
    v6 = location[0];
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityCellEditingControl");
    v10 = 0;
    v8 = 0;
    if (v6 != v7)
    {
      v5 = location[0];
      v11 = (id)objc_msgSend(*(id *)(a1 + 32), "_accessibilityCellReorderControl");
      v10 = 1;
      v8 = v5 != v11;
    }
    if ((v10 & 1) != 0)

    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (v2 = objc_msgSend(location[0], "accessibilityTraits"), (v2 & *MEMORY[0x24BDF73B0]) != 0))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(location[0], "canBecomeFocused") & 1) != 0)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      }
    }
    objc_opt_class();
    v4 = 1;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      v4 = 1;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        v4 = 1;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          v4 = 1;
          if ((objc_opt_isKindOfClass() & 1) == 0)
            v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 2;
        }
      }
    }
    v13 = v4;
  }
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_axGetFocusedSubview
{
  return (id)__UIAccessibilityGetAssociatedNonRetainedObject();
}

- (void)_axSetFocusedSubview:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  __UIAccessibilitySetAssociatedNonRetainedObject();
  objc_storeStrong(location, 0);
}

- (id)preferredFocusedView
{
  id v2;
  id v3;
  id v4;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  objc_super v19;
  id v20[2];
  UITableViewCellAccessibility *v21;

  v21 = self;
  v20[1] = (id)a2;
  v19.receiver = self;
  v19.super_class = (Class)UITableViewCellAccessibility;
  v20[0] = -[UITableViewCellAccessibility preferredFocusedView](&v19, sel_preferredFocusedView);
  if ((-[UITableViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v21, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v17 = 0;
    objc_opt_class();
    v16 = (id)__UIAccessibilityCastAsClass();
    v15 = v16;
    objc_storeStrong(&v16, 0);
    v18 = v15;
    v7 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v21);
    v14 = (id)objc_msgSend(v7, "focusedItem");

    v8 = -[UITableViewCellAccessibility _axGetFocusedSubview](v21, "_axGetFocusedSubview");
    v11 = 0;
    v9 = 0;
    if (v8)
    {
      v2 = v8;
    }
    else
    {
      v12 = -[UITableViewCellAccessibility _accessibilityParentTableView](v21, "_accessibilityParentTableView");
      v11 = 1;
      v10 = (id)objc_msgSend(v12, "_axGetLastFocusedChild");
      v9 = 1;
      v2 = v10;
    }
    v13 = v2;
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if (-[UITableViewCellAccessibility canBecomeFocused](v21, "canBecomeFocused") && v14 || !v13)
    {
      objc_storeStrong(v20, v18);
    }
    else if ((-[UITableViewCellAccessibility safeBoolForKey:](v21, "safeBoolForKey:", CFSTR("_isFocusedOrAncestorOfFocusedView")) & 1) != 0&& (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_storeStrong(v20, v14);
    }
    else
    {
      v3 = -[UIViewAccessibility _accessibilitySubviewMatchingFKAView:](v18, v13);
      v4 = v20[0];
      v20[0] = v3;

    }
    objc_storeStrong(&v13, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v18, 0);
  }
  v6 = v20[0];
  objc_storeStrong(v20, 0);
  return v6;
}

- (void)_didUpdateFocusInContext:(id)a3
{
  UITableViewCellAccessibility *v3;
  id v4;
  id v5;
  BOOL v6;
  char v7;
  id v8;
  id *v9;
  char v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL (*v14)(id *, void *);
  void *v15;
  UITableViewCellAccessibility *v16;
  char v17;
  id v18;
  objc_super v19;
  id location[2];
  UITableViewCellAccessibility *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19.receiver = v21;
  v19.super_class = (Class)UITableViewCellAccessibility;
  -[UITableViewCellAccessibility _didUpdateFocusInContext:](&v19, sel__didUpdateFocusInContext_, location[0]);
  v17 = 0;
  v10 = 0;
  v7 = 0;
  v6 = 0;
  if ((-[UITableViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v21, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v5 = (id)objc_msgSend(location[0], "nextFocusedView");
    v18 = v5;
    v17 = 1;
    v11 = MEMORY[0x24BDAC760];
    v12 = -1073741824;
    v13 = 0;
    v14 = __57__UITableViewCellAccessibility__didUpdateFocusInContext___block_invoke;
    v15 = &unk_24FF3E2D0;
    v16 = v21;
    v10 = 1;
    v9 = (id *)&v16;
    v8 = (id)objc_msgSend(v5, "_accessibilityFindAncestor:startWithSelf:", &v11, 1);
    v7 = 1;
    v6 = v8 != 0;
  }
  if ((v7 & 1) != 0)

  if ((v17 & 1) != 0)
  if (v6)
  {
    v3 = v21;
    v4 = (id)objc_msgSend(location[0], "nextFocusedView");
    -[UITableViewCellAccessibility _axSetFocusedSubview:](v3, "_axSetFocusedSubview:");

  }
  if ((v10 & 1) != 0)
    objc_storeStrong(v9, 0);
  objc_storeStrong(location, 0);
}

BOOL __57__UITableViewCellAccessibility__didUpdateFocusInContext___block_invoke(id *a1, void *a2)
{
  BOOL v4;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v4 = location[0] == a1[4];
  objc_storeStrong(location, 0);
  return v4;
}

- (BOOL)_isEligibleForFocusInteraction
{
  id v3;
  id v4;
  id v5;
  id v6[2];
  uint64_t v7;
  uint64_t *v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  id v14;
  id v15;
  char v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  objc_super v22;
  char v23;
  SEL v24;
  UITableViewCellAccessibility *v25;

  v25 = self;
  v24 = a2;
  v23 = 0;
  v22.receiver = self;
  v22.super_class = (Class)UITableViewCellAccessibility;
  v23 = -[UITableViewCellAccessibility _isEligibleForFocusInteraction](&v22, sel__isEligibleForFocusInteraction);
  if (!v23
    && (-[UITableViewCellAccessibility _accessibilityIsFKARunningForFocusItem](v25, "_accessibilityIsFKARunningForFocusItem") & 1) != 0)
  {
    v20 = 0;
    objc_opt_class();
    v19 = (id)__UIAccessibilityCastAsClass();
    v18 = v19;
    objc_storeStrong(&v19, 0);
    v21 = v18;
    v16 = 0;
    objc_opt_class();
    v4 = (id)-[UITableViewCellAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_tableView"));
    v15 = (id)__UIAccessibilityCastAsClass();

    v14 = v15;
    objc_storeStrong(&v15, 0);
    v17 = (id)objc_msgSend(v14, "_swipeActionController");

    v3 = v21;
    v7 = 0;
    v8 = &v7;
    v9 = 838860800;
    v10 = 48;
    v11 = __Block_byref_object_copy__21;
    v12 = __Block_byref_object_dispose__21;
    v13 = 0;
    v6[1] = &v7;
    v6[0] = v17;
    AXPerformSafeBlock();
    v5 = (id)v8[5];
    objc_storeStrong(v6, 0);
    _Block_object_dispose(&v7, 8);
    objc_storeStrong(&v13, 0);
    v23 = v3 == v5;

    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v21, 0);
  }
  return v23 & 1;
}

void __62__UITableViewCellAccessibility__isEligibleForFocusInteraction__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v6;

  v4 = *(void **)(a1 + 32);
  v6 = (id)objc_msgSend(v4, "swipedIndexPath");
  v1 = (id)objc_msgSend(v4, "_swipedViewForItemAtIndexPath:");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

}

- (id)accessibilityPath
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  char v20;
  id v21;
  BOOL v22;
  BOOL v23;
  id v24;
  id v25[2];
  UITableViewCellAccessibility *v26;
  id v27;

  v26 = self;
  v25[1] = (id)a2;
  v25[0] = -[UITableViewCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath");
  v24 = -[UITableViewCellAccessibility _accessibilityParentTableView](v26, "_accessibilityParentTableView");
  v12 = objc_msgSend(v24, "numberOfSections");
  if (v12 <= objc_msgSend(v25[0], "section"))
  {
    v27 = 0;
  }
  else
  {
    v23 = objc_msgSend(v25[0], "row") == 0;
    v10 = objc_msgSend(v25[0], "row");
    v22 = v10 == objc_msgSend(v24, "numberOfRowsInSection:", objc_msgSend(v25[0], "section")) - 1;
    v20 = 0;
    objc_opt_class();
    v11 = (id)-[UITableViewCellAccessibility safeValueForKey:](v26, "safeValueForKey:", CFSTR("layer"));
    v19 = (id)__UIAccessibilityCastAsClass();

    v18 = v19;
    objc_storeStrong(&v19, 0);
    v21 = v18;
    v17 = 0;
    if (v23)
      v17 = 3;
    if (v22)
      v17 |= 0xCuLL;
    v9 = (void *)MEMORY[0x24BDF6870];
    -[UITableViewCellAccessibility accessibilityFrame](v26, "accessibilityFrame");
    v13 = v2;
    v14 = v3;
    v15 = v4;
    v16 = v5;
    objc_msgSend(v21, "cornerRadius");
    objc_msgSend(v21, "cornerRadius");
    CGSizeMake_2();
    v27 = (id)objc_msgSend(v9, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v17, v13, v14, v15, v16, v6, v7);
    objc_storeStrong(&v21, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(v25, 0);
  return v27;
}

@end
