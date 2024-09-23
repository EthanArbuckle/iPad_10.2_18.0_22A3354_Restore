@implementation SBIconDragManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconDragManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axRowColAnnouncementTimer
{
  JUMPOUT(0x23492010CLL);
}

- (void)_axSetRowColAnnouncementTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (unint64_t)_axRowColScheduledCol
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (void)_axSetRowColScheduledCol:(unint64_t)a3
{
  __UIAccessibilitySetAssociatedUnsignedInteger();
}

- (unint64_t)_axRowColScheduledRow
{
  return __UIAccessibilityGetAssociatedUnsignedInteger();
}

- (void)_axSetRowColScheduledRow:(unint64_t)a3
{
  __UIAccessibilitySetAssociatedUnsignedInteger();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("iconDropSessionDidUpdate:inIconListView:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("iconDropSessionDidEnd:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("iconDragContextForDropSession:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("iconViewWillBeginDrag:session:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("cancelAllDrags"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconDragContext"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconListView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("coordinateForIcon:"), "{SBIconCoordinate=qq}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconAtPoint:index:"), "@", "{CGPoint=dd}", "^Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconViewForIcon:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("iconDropSession:didPauseAtLocation:inIconListView:"), "v", "@", "{CGPoint=dd}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isPlaceholder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconView"), CFSTR("isFolderIcon"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("initialTouchOffsetFromIconImageCenter"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("placeholderMovementForDragHitRegion:onGridCellIndex:inListView:forDragWithIdentifier:draggedIconIdentifiers:"), "q", "Q", "Q", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("updatePlaceholderPositionForDropSession:inIconListView:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("uniqueIdentifierForIconDropSession:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("iconDragContextForDragWithIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("canMakeIconViewRecipient:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("setRecipientIconView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("initialTouchOffsetFromIconImageCenter"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("createNewFolderFromRecipientIcon:grabbedIcon:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragManager"), CFSTR("enumerateIconDragContextsUsingBlock:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("isUserActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("draggedIcons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconDragContext"), CFSTR("_sourceIconViews"), "NSMutableSet");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconDragContext"), CFSTR("recipientIconView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBPlaceholderIcon"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconRowsForCurrentOrientation"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconColumnsForCurrentOrientation"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconRowsForCurrentOrientation"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("openedFolder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolder"), CFSTR("displayName"), "@", 0);

}

- (void)iconViewWillBeginDrag:(id)a3 session:(id)a4
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility iconViewWillBeginDrag:session:](&v5, sel_iconViewWillBeginDrag_session_, a3, a4);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsFocusUpdate");

}

- (id)iconDropSessionDidUpdate:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  objc_super v31;

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility iconDropSessionDidUpdate:inIconListView:](&v31, sel_iconDropSessionDidUpdate_inIconListView_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__3;
  v29 = __Block_byref_object_dispose__3;
  v30 = 0;
  v9 = MEMORY[0x24BDAC760];
  v10 = v6;
  AXPerformSafeBlock();
  v11 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  objc_msgSend(v10, "locationInView:", v7);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v11, "safeCGPointForKey:", CFSTR("initialTouchOffsetFromIconImageCenter"));
  objc_msgSend(v7, "iconAtPoint:index:", 0, v13 - v16, v15 - v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3010000000;
  v29 = 0;
  v30 = 0;
  v28 = (uint64_t (*)(uint64_t, uint64_t))&unk_232A885F5;
  v24 = v9;
  v19 = v7;
  v20 = v18;
  AXPerformSafeBlock();
  v21 = v26[4];
  v22 = v26[5];

  _Block_object_dispose(&v25, 8);
  if (v20 && v22 && v21)
    -[SBIconDragManagerAccessibility _axScheduleAnnouncementForRow:col:](self, "_axScheduleAnnouncementForRow:col:", v22, v21, v24, 3221225472, __74__SBIconDragManagerAccessibility_iconDropSessionDidUpdate_inIconListView___block_invoke_2, &unk_250383B98);

  return v8;
}

void __74__SBIconDragManagerAccessibility_iconDropSessionDidUpdate_inIconListView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconDragContextForDropSession:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __74__SBIconDragManagerAccessibility_iconDropSessionDidUpdate_inIconListView___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIcon:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v3 + 32) = result;
  *(_QWORD *)(v3 + 40) = v4;
  return result;
}

- (void)iconDropSessionDidEnd:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility iconDropSessionDidEnd:](&v4, sel_iconDropSessionDidEnd_, a3);
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    AXPerformSafeBlock();
  -[SBIconDragManagerAccessibility _accessibilitySetLastAnnouncedIcon:](self, "_accessibilitySetLastAnnouncedIcon:", 0);
}

uint64_t __56__SBIconDragManagerAccessibility_iconDropSessionDidEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAllDrags");
}

- (CGPoint)_accessibilityLastPausedLocation
{
  double v2;
  double v3;
  CGPoint result;

  __UIAccessibilityGetAssociatedCGPoint();
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)_accessibilitySetLastPausedLocation:(CGPoint)a3
{
  __UIAccessibilitySetAssociatedCGPoint();
}

- (void)updatePlaceholderPositionForDropSession:(id)a3 inIconListView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  SBIconDragManagerAccessibility *v28;
  id v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  SBIconDragManagerAccessibility *v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v7 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  v8 = MEMORY[0x24BDAC760];
  v31 = MEMORY[0x24BDAC760];
  v32 = 3221225472;
  v33 = __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke;
  v34 = &unk_250383B98;
  v37 = &v38;
  v35 = self;
  v9 = v6;
  v36 = v9;
  AXPerformSafeBlock();
  v10 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  v43 = 0;
  v24 = v8;
  v25 = 3221225472;
  v26 = __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke_2;
  v27 = &unk_250383B98;
  v30 = &v38;
  v28 = self;
  v11 = v10;
  v29 = v11;
  AXPerformSafeBlock();
  v12 = (id)v39[5];

  _Block_object_dispose(&v38, 8);
  objc_msgSend(v9, "locationInView:", v7);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "safeCGPointForKey:", CFSTR("initialTouchOffsetFromIconImageCenter"));
  v18 = v14 - v17;
  v20 = v16 - v19;
  objc_msgSend(v7, "bounds");
  -[SBIconDragManagerAccessibility _accessibilitySetLastPausedLocation:](self, "_accessibilitySetLastPausedLocation:", fmin(fmax(v18, 1.0), v21 + -1.0), fmin(fmax(v20, 1.0), v22 + -1.0));
  v23.receiver = self;
  v23.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility updatePlaceholderPositionForDropSession:inIconListView:](&v23, sel_updatePlaceholderPositionForDropSession_inIconListView_, v9, v7);
  -[SBIconDragManagerAccessibility _axDragPauseForDropSession:iconListView:](self, "_axDragPauseForDropSession:iconListView:", v9, v7);
  -[SBIconDragManagerAccessibility _axUpdateDragPauseForDropSession:iconListView:](self, "_axUpdateDragPauseForDropSession:iconListView:", v9, v7);

}

void __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifierForIconDropSession:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __89__SBIconDragManagerAccessibility_updatePlaceholderPositionForDropSession_inIconListView___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconDragContextForDragWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)canMakeIconViewRecipient:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v21;
  CGFloat v22;
  id v24;
  BOOL v25;
  objc_super v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (SBAXPerformingAXDrag)
  {
    v4 = a3;
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "frame");
    v14 = v13 * 0.2;
    objc_msgSend(v4, "frame");
    v16 = v15;

    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    v29 = CGRectInset(v28, v14, v16 * 0.2);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    -[SBIconDragManagerAccessibility _accessibilityLastPausedLocation](self, "_accessibilityLastPausedLocation");
    v27.x = v21;
    v27.y = v22;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    return CGRectContainsPoint(v30, v27);
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBIconDragManagerAccessibility;
    v24 = a3;
    v25 = -[SBIconDragManagerAccessibility canMakeIconViewRecipient:](&v26, sel_canMakeIconViewRecipient_, v24);

    return v25;
  }
}

- (int64_t)placeholderMovementForDragHitRegion:(unint64_t)a3 onGridCellIndex:(unint64_t)a4 inListView:(id)a5 forDragWithIdentifier:(id)a6 draggedIconIdentifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  objc_super v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  SBIconDragManagerAccessibility *v22;
  id v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  if ((a3 & 2) == 0 && SBAXPerformingAXDrag)
  {
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __142__SBIconDragManagerAccessibility_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier_draggedIconIdentifiers___block_invoke;
    v21 = &unk_250383B68;
    v22 = self;
    v23 = v13;
    AXPerformSafeBlock();

  }
  v17.receiver = self;
  v17.super_class = (Class)SBIconDragManagerAccessibility;
  v15 = -[SBIconDragManagerAccessibility placeholderMovementForDragHitRegion:onGridCellIndex:inListView:forDragWithIdentifier:draggedIconIdentifiers:](&v17, sel_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier_draggedIconIdentifiers_, a3, a4, v12, v13, v14);

  return (int64_t)v15;
}

void __142__SBIconDragManagerAccessibility_placeholderMovementForDragHitRegion_onGridCellIndex_inListView_forDragWithIdentifier_draggedIconIdentifiers___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "iconDragContextForDragWithIdentifier:", *(_QWORD *)(a1 + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setRecipientIconView:", 0);

}

- (id)createNewFolderFromRecipientIcon:(id)a3 grabbedIcon:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  SBAXIconCreatingFolder = 1;
  v15.receiver = self;
  v15.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility createNewFolderFromRecipientIcon:grabbedIcon:](&v15, sel_createNewFolderFromRecipientIcon_grabbedIcon_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObjectsAndKeys:", v6, *MEMORY[0x24BDFEAD8], 0);

  v8 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("creating.folder"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("displayName"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v8, "initWithString:attributes:", v12, v7);

  LODWORD(v12) = *MEMORY[0x24BDF71E8];
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v13);
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v12, (id)*MEMORY[0x24BDFEDF0]);
  SBAXIconCreatingFolder = 0;

  return v4;
}

- (void)_axDragPauseForDropSession:(id)a3 iconListView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;

  v6 = a3;
  v7 = a4;
  AXSBHIconManagerFromSharedIconController();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v7);
  v10 = v9;
  v12 = v11;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v47 = MEMORY[0x24BDAC760];
  v48 = 3221225472;
  v49 = __74__SBIconDragManagerAccessibility__axDragPauseForDropSession_iconListView___block_invoke;
  v50 = &unk_250383C60;
  v13 = v7;
  v51 = v13;
  AXPerformSafeBlock();
  if (!SBAXPerformingAXDrag)
  {
    if (v53[3] == _axDragPauseForDropSession_iconListView__previousIconIndex
      && (id)_axDragPauseForDropSession_iconListView__previousIconList == v13)
    {
      goto LABEL_25;
    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEE28]);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    v14 = (void *)SBAXIconMoveSpeakTimer;
    if (!SBAXIconMoveSpeakTimer)
    {
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__accessibilityIconMovedToPosition, 0, 1, 1.0, v47, 3221225472, __74__SBIconDragManagerAccessibility__axDragPauseForDropSession_iconListView___block_invoke, &unk_250383C60, v13, &v52, v10, v12);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)SBAXIconMoveSpeakTimer;
      SBAXIconMoveSpeakTimer = v15;

      v14 = (void *)SBAXIconMoveSpeakTimer;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 0.1, v47, v48, v49, v50);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFireDate:", v17);

    SBAXIconMovedIntoDock = 0;
    SBAXIconJustMovedIntoDock = 0;
    SBAXIconJustLeftDock = 0;
    -[SBIconDragManagerAccessibility _axGrabbedIcons](self, "_axGrabbedIcons");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v13, "safeValueForKey:", CFSTR("iconRowsForCurrentOrientation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntegerValue");

      objc_msgSend(v13, "safeValueForKey:", CFSTR("iconColumnsForCurrentOrientation"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "unsignedIntegerValue");

      objc_msgSend((id)_axDragPauseForDropSession_iconListView__previousIconList, "safeValueForKey:", CFSTR("iconRowsForCurrentOrientation"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "unsignedIntegerValue");

      v26 = v53[3];
      SBAXIconMovedY = v26 / v23 + 1;
      SBAXIconMovedX = v26 % v23 + 1;
      if (v21 == 1)
      {
        if (v25 == 1)
        {
          SBAXIconMovedIntoDock = 1;
          v27 = (void *)SBAXIconPreItemInDock;
          SBAXIconPreItemInDock = 0;

          v28 = (void *)SBAXIconNextItemInDock;
          SBAXIconNextItemInDock = 0;

          objc_msgSend(v13, "safeValueForKey:", CFSTR("icons"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          v31 = v53;
          v32 = v53[3];
          if (v32)
          {
            v33 = objc_msgSend(v29, "count");
            v31 = v53;
            if (v32 - 1 < v33)
            {
              objc_msgSend(v30, "objectAtIndex:", v53[3] - 1);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "accessibilityLabel");
              v35 = objc_claimAutoreleasedReturnValue();
              v36 = (void *)SBAXIconPreItemInDock;
              SBAXIconPreItemInDock = v35;

              v31 = v53;
            }
          }
          v37 = v31[3];
          if (v37 < objc_msgSend(v30, "count") - 1)
          {
            objc_msgSend(v30, "objectAtIndex:", v53[3] + 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "accessibilityLabel");
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = (void *)SBAXIconNextItemInDock;
            SBAXIconNextItemInDock = v39;

          }
          goto LABEL_24;
        }
        SBAXIconJustMovedIntoDock = 1;
        v42 = &SBAXIconMovedIntoDock;
        goto LABEL_20;
      }
      if (v25 == 1 && v21)
      {
        v42 = &SBAXIconJustLeftDock;
LABEL_20:
        *v42 = 1;
LABEL_24:
        -[SBIconDragManagerAccessibility _axGrabbedIconsLabel](self, "_axGrabbedIconsLabel");
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)SBAXIconMovedIconLabel;
        SBAXIconMovedIconLabel = v45;

LABEL_25:
        objc_storeStrong((id *)&_axDragPauseForDropSession_iconListView__previousIconList, a4);
        _axDragPauseForDropSession_iconListView__previousIconIndex = v53[3];
        goto LABEL_26;
      }
      objc_msgSend(v8, "safeValueForKey:", CFSTR("hasOpenFolder"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v43)
        goto LABEL_24;
      objc_msgSend(v8, "safeValueForKeyPath:", CFSTR("openedFolder.displayName"));
      v44 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)SBAXIconMovedFolderLabel;
      SBAXIconMovedFolderLabel = v44;
    }
    else
    {
      v41 = (void *)SBAXIconMovedFolderLabel;
      SBAXIconMovedFolderLabel = 0;
    }

    goto LABEL_24;
  }
LABEL_26:

  _Block_object_dispose(&v52, 8);
}

void __74__SBIconDragManagerAccessibility__axDragPauseForDropSession_iconListView___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "iconAtPoint:index:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1 || (NSClassFromString(CFSTR("SBPlaceholderIcon")), (objc_opt_isKindOfClass() & 1) != 0))
    objc_msgSend((id)SBAXIconFolderOpeningTimer, "invalidate");

}

- (void)_axUpdateDragPauseForDropSession:(id)a3 iconListView:(id)a4
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  char v21;
  UIAccessibilityNotifications v22;
  void *v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  UIAccessibilityNotifications v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  v34 = a3;
  objc_msgSend(a4, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (SBAXPerformingAXDrag)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
    goto LABEL_30;
  objc_msgSend(v34, "locationInView:", v5);
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v6, "windowScene");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "interfaceOrientation");

  if ((unint64_t)(v18 - 3) >= 2)
  {
    if ((v9 <= 20.0 || v9 > 50.0) && (v9 < v14 + -50.0 || v9 >= v14 + -20.0))
      goto LABEL_20;
  }
  else if ((v11 <= 20.0 || v11 > 50.0) && (v11 < v16 + -50.0 || v11 >= v16 + -20.0))
  {
LABEL_20:
    v21 = 0;
    goto LABEL_23;
  }
  if ((_axUpdateDragPauseForDropSession_iconListView__WantsNearedBorder & 1) != 0)
    goto LABEL_24;
  v22 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("nearing.border"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v22, v23);

  v21 = 1;
LABEL_23:
  _axUpdateDragPauseForDropSession_iconListView__WantsNearedBorder = v21;
LABEL_24:
  v24 = _axUpdateDragPauseForDropSession_iconListView__previousCloseFolderTimerStatus;
  v25 = SBAXIconCloseFolderTimerStatus;
  AXSBHIconManagerFromSharedIconController();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "safeValueForKey:", CFSTR("openedFolder"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = SBAXIconCloseFolderTimerStatus;
  if (v27 && v24 != v25 && SBAXIconCloseFolderTimerStatus == 2 && SBAXIconOpenedFolderWhileJiggling)
  {
    v29 = *MEMORY[0x24BDF71E8];
    v30 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("dragged.inside.folder"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "safeValueForKey:", CFSTR("displayName"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v29, v33);

    v28 = SBAXIconCloseFolderTimerStatus;
  }
  _axUpdateDragPauseForDropSession_iconListView__previousCloseFolderTimerStatus = v28;

LABEL_30:
}

- (void)_accessibilityIconMovedToPosition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;

  -[SBIconDragManagerAccessibility _axGrabbedIcons](self, "_axGrabbedIcons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    goto LABEL_18;
  if (!SBAXIconMovedIconLabel)
    goto LABEL_18;
  -[SBIconDragManagerAccessibility _axRecipientIconView](self, "_axRecipientIconView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_18;
  if (SBAXIconMovedIntoDock)
  {
    if (SBAXIconJustMovedIntoDock)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("finished.moving.app.in.dock");
LABEL_14:
      accessibilityLocalizedString(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x234920010](SBAXIconMovedX);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v13, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    if (SBAXIconPreItemInDock && SBAXIconNextItemInDock)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      v7 = CFSTR("moving.app.within.dock.middle");
      goto LABEL_14;
    }
    if (SBAXIconPreItemInDock)
    {
      v20 = CFSTR("moving.app.within.dock.last");
LABEL_23:
      accessibilityLocalizedString(v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    if (SBAXIconNextItemInDock)
    {
      v20 = CFSTR("moving.app.within.dock.first");
      goto LABEL_23;
    }
  }
  else if (_accessibilityIconMovedToPosition_LastX != SBAXIconMovedX
         || _accessibilityIconMovedToPosition_LastY != SBAXIconMovedY)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("finished.moving.app"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234920010](SBAXIconMovedY);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234920010](SBAXIconMovedX);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _accessibilityIconMovedToPosition_LastY = SBAXIconMovedY;
    _accessibilityIconMovedToPosition_LastX = SBAXIconMovedX;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_15:
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
  if (v8)
  {
    v15 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithObjectsAndKeys:", v16, *MEMORY[0x24BDFEAD8], 0);

    v18 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1458]), "initWithString:attributes:", v8, v17);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v18);

  }
LABEL_18:
  v19 = (void *)SBAXIconMoveSpeakTimer;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 2.0);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFireDate:", v21);

}

- (id)_accessibilityGetLastAnnouncedIcon
{
  JUMPOUT(0x23492010CLL);
}

- (void)_accessibilitySetLastAnnouncedIcon:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)iconDropSession:(id)a3 didPauseAtLocation:(CGPoint)a4 inIconListView:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  objc_super v35;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBIconDragManagerAccessibility;
  -[SBIconDragManagerAccessibility iconDropSession:didPauseAtLocation:inIconListView:](&v35, sel_iconDropSession_didPauseAtLocation_inIconListView_, v9, v10, x, y);
  if (!SBAXPerformingAXDrag)
  {
    objc_msgSend(v10, "_accessibilityWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_15:

      goto LABEL_16;
    }
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v28 = v10;
    AXPerformSafeBlock();
    v12 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__3;
    v33 = __Block_byref_object_dispose__3;
    v34 = 0;
    v27 = v28;
    v13 = v12;
    AXPerformSafeBlock();
    v14 = (id)v30[5];

    _Block_object_dispose(&v29, 8);
    -[SBIconDragManagerAccessibility _accessibilityGetLastAnnouncedIcon](self, "_accessibilityGetLastAnnouncedIcon");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v14
      && (-[SBIconDragManagerAccessibility _axIconForIconView:](self, "_axIconForIconView:", v14),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "safeBoolForKey:", CFSTR("isPlaceholder")),
          v16,
          (v17 & 1) == 0))
    {
      objc_msgSend(v14, "accessibilityLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v22;
      if (v14 != v15 && objc_msgSend(v22, "length"))
      {
        v19 = objc_msgSend(v14, "safeBoolForKey:", CFSTR("isFolderIcon"));
        v20 = CFSTR("dragged.over.app");
        v21 = CFSTR("dragged.over.folder");
        goto LABEL_10;
      }
    }
    else
    {
      objc_msgSend(v15, "accessibilityLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
      {
        v19 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isFolderIcon"));
        v20 = CFSTR("dragged.off.app");
        v21 = CFSTR("dragged.off.folder");
LABEL_10:
        if (v19)
          v23 = (__CFString *)v21;
        else
          v23 = (__CFString *)v20;
        v24 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", v25, v18);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v26);
      }
    }

    -[SBIconDragManagerAccessibility _accessibilitySetLastAnnouncedIcon:](self, "_accessibilitySetLastAnnouncedIcon:", v14);
    goto LABEL_15;
  }
LABEL_16:

}

void __84__SBIconDragManagerAccessibility_iconDropSession_didPauseAtLocation_inIconListView___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconAtPoint:index:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __84__SBIconDragManagerAccessibility_iconDropSession_didPauseAtLocation_inIconListView___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconViewForIcon:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axIconForIconView:(id)a3
{
  return (id)objc_msgSend(a3, "safeValueForKey:", CFSTR("icon"));
}

- (void)_axScheduleAnnouncementForRow:(unint64_t)a3 col:(unint64_t)a4
{
  unint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];

  v7 = -[SBIconDragManagerAccessibility _axRowColScheduledRow](self, "_axRowColScheduledRow");
  if (-[SBIconDragManagerAccessibility _axRowColScheduledCol](self, "_axRowColScheduledCol") != a4 || v7 != a3)
  {
    -[SBIconDragManagerAccessibility _axRowColAnnouncementTimer](self, "_axRowColAnnouncementTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__SBIconDragManagerAccessibility__axScheduleAnnouncementForRow_col___block_invoke;
    v10[3] = &__block_descriptor_48_e17_v16__0__NSTimer_8l;
    v10[4] = a3;
    v10[5] = a4;
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:repeats:block:", 0, v10, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBIconDragManagerAccessibility _axSetRowColAnnouncementTimer:](self, "_axSetRowColAnnouncementTimer:", v9);
    -[SBIconDragManagerAccessibility _axSetRowColScheduledRow:](self, "_axSetRowColScheduledRow:", a3);
    -[SBIconDragManagerAccessibility _axSetRowColScheduledCol:](self, "_axSetRowColScheduledCol:", a4);

  }
}

void __68__SBIconDragManagerAccessibility__axScheduleAnnouncementForRow_col___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("app.grid.location"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234920010](*(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234920010](*(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v3, v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  UIAccessibilitySpeakIfNotSpeaking();
}

- (id)_axGrabbedIconsLabel
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  __CFString *v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  v9 = &stru_250385500;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __54__SBIconDragManagerAccessibility__axGrabbedIconsLabel__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__SBIconDragManagerAccessibility__axGrabbedIconsLabel__block_invoke_2;
  v3[3] = &unk_250383CD0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIconDragContextsUsingBlock:", v3);
}

void __54__SBIconDragManagerAccessibility__axGrabbedIconsLabel__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isUserActive")))
  {
    v4 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(v3, "safeArrayForKey:", CFSTR("draggedIcons"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "accessibilityLabel", v15, v16, (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v14 = *(void **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16, v15, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v9);
    }

  }
}

- (BOOL)_axIsIconDragging
{
  void *v2;
  BOOL v3;

  -[SBIconDragManagerAccessibility _axGrabbedIconsLabel](self, "_axGrabbedIconsLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)_axGrabbedIconView
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __52__SBIconDragManagerAccessibility__axGrabbedIconView__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__SBIconDragManagerAccessibility__axGrabbedIconView__block_invoke_2;
  v3[3] = &unk_250383CD0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIconDragContextsUsingBlock:", v3);
}

void __52__SBIconDragManagerAccessibility__axGrabbedIconView__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "safeBoolForKey:", CFSTR("isUserActive")))
  {
    objc_msgSend(v8, "safeSetForKey:", CFSTR("_sourceIconViews"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allObjects");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)_axGrabbedIcons
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

uint64_t __49__SBIconDragManagerAccessibility__axGrabbedIcons__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__SBIconDragManagerAccessibility__axGrabbedIcons__block_invoke_2;
  v3[3] = &unk_250383CD0;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateIconDragContextsUsingBlock:", v3);
}

void __49__SBIconDragManagerAccessibility__axGrabbedIcons__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("isUserActive")))
  {
    objc_msgSend(v6, "safeArrayForKey:", CFSTR("draggedIcons"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)_axRecipientIconView
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__3;
  v8 = __Block_byref_object_dispose__3;
  v9 = 0;
  AXPerformSafeBlock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void __54__SBIconDragManagerAccessibility__axRecipientIconView__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("iconDragManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54__SBIconDragManagerAccessibility__axRecipientIconView__block_invoke_2;
  v3[3] = &unk_250383CD0;
  v3[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "enumerateIconDragContextsUsingBlock:", v3);

}

void __54__SBIconDragManagerAccessibility__axRecipientIconView__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "safeBoolForKey:", CFSTR("isUserActive")))
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("recipientIconView"));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

@end
