@implementation MessageListCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MessageListCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCollectionViewCell"), CFSTR("_didTapDisclosureButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCollectionViewCell"), CFSTR("cellHelper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCollectionViewCell"), CFSTR("messageListItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellHelper"), CFSTR("messageListItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellHelper"), CFSTR("cellView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellHelper"), CFSTR("disclosureEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("dateLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("secondaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("disclosureButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("primaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("tertiaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("disclosureButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("chevronType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListCellView"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isRead"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isFlagged"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isReplied"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isForwarded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isVIP"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isNotify"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isMute"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("isBlockedSender"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageItemViewModel"), CFSTR("flagColors"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("_isExpandedIndexPath:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("_swipeActionForTriageAction:indexPath:"), "@", "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUIMessageListViewController"), CFSTR("messageListSelectionModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUIMessageListViewController"), CFSTR("state"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUIMessageListViewController"), CFSTR("messageListPositionHelper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUIMessageListViewController"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("undoManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListSelectionModel"), CFSTR("isSelectedItemID:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("executePreHandlerWithView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("executeHandlerWithView:completionHandler:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EMMessageListItem"), CFSTR("count"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EMMessageListItem"), CFSTR("shouldArchiveByDefault"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EMMessageListItem"), CFSTR("displayMessageObjectID"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EMMessageListItem"), CFSTR("hasAttachments"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EMObjectID"), CFSTR("stringHash"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EFFuture"), CFSTR("result"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MessageListCollectionViewCell"), CFSTR("UICollectionViewCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MessageListCellLabel"), CFSTR("UILabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListPositionHelper"), CFSTR("recalculateFirstVisibleIndex"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListDataSource"), CFSTR("messageListItemAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListDataSource"), CFSTR("collectionViewDataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MFReadLaterTriageInteraction"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MFReadLaterTriageInteraction"), CFSTR("interactionWithMessageListItems:undoManager:origin:actor:"), "@", "@", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFReadLaterTriageInteraction"), CFSTR("_performInteractionAfterPreparation:completion:"), "v", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MFReadLaterTriageInteraction"), CFSTR("MFTriageInteraction"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFTriageInteraction"), CFSTR("setDelegate:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewControllerState"), CFSTR("containsDraftsOrOutbox"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MessageListCollectionViewCellAccessibility _axSetDisclosureButtonTraits](self, "_axSetDisclosureButtonTraits");
}

- (void)_axSetDisclosureButtonTraits
{
  id v2;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.disclosureButton"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB178]);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MessageListCollectionViewCellAccessibility;
  v2 = -[MessageListCollectionViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSelected");

  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v5 | v2;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[5];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  objc_super v67;

  v67.receiver = self;
  v67.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility accessibilityLabel](&v67, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    goto LABEL_38;
  }
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("primaryLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("secondaryLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityLabel");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("tertiaryLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v12 >= 3)
    v13 = 3;
  else
    v13 = v12;
  objc_msgSend(v11, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v14;
  objc_msgSend(v14, "componentsJoinedByString:", CFSTR(", "));
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = v6;
  objc_msgSend(v6, "safeValueForKey:", CFSTR("viewModel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isRead"));
  v17 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isReplied"));
  v49 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isForwarded"));
  v18 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isFlagged"));
  objc_opt_class();
  objc_msgSend(v15, "safeValueForKey:", CFSTR("flagColors"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isVIP"));
  v21 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isBlockedSender"));
  v22 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isNotify"));
  v23 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isMute"));
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.messageListItem"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v24, "safeBoolForKey:", CFSTR("hasAttachments"));

  v44 = -[MessageListCollectionViewCellAccessibility _accessibilityIsThreadedChildCell](self, "_accessibilityIsThreadedChildCell");
  if ((v16 & 1) != 0)
  {
    v55 = 0;
    if (!v17)
      goto LABEL_8;
  }
  else
  {
    accessibilityLocalizedString(CFSTR("unread"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
LABEL_8:
      v54 = 0;
      if (!v20)
        goto LABEL_9;
      goto LABEL_14;
    }
  }
  accessibilityLocalizedString(CFSTR("replied"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_9:
    v53 = 0;
    if (!v21)
      goto LABEL_10;
LABEL_15:
    accessibilityLocalizedString(CFSTR("blockedsender.message"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_11;
    goto LABEL_16;
  }
LABEL_14:
  accessibilityLocalizedString(CFSTR("vip.message"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    goto LABEL_15;
LABEL_10:
  v52 = 0;
  if (!v22)
  {
LABEL_11:
    v51 = 0;
    goto LABEL_17;
  }
LABEL_16:
  accessibilityLocalizedString(CFSTR("notify.message"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:
  if (v49)
  {
    accessibilityLocalizedString(CFSTR("forwarded"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_19;
LABEL_22:
    accessibilityLocalizedString(CFSTR("muted.message"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_20;
LABEL_23:
    accessibilityLocalizedString(CFSTR("flagged"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v50 = 0;
  if (v23)
    goto LABEL_22;
LABEL_19:
  v48 = 0;
  if (v18)
    goto LABEL_23;
LABEL_20:
  v47 = 0;
LABEL_24:
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__3;
  v65 = __Block_byref_object_dispose__3;
  v66 = 0;
  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v62[5];
    v62[5] = v25;

    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __64__MessageListCollectionViewCellAccessibility_accessibilityLabel__block_invoke;
    v60[3] = &unk_250285D10;
    v60[4] = &v61;
    objc_msgSend(v46, "enumerateIndexesUsingBlock:", v60);
  }
  if ((int64_t)-[MessageListCollectionViewCellAccessibility _accessibilityThreadCount](self, "_accessibilityThreadCount") < 2)
  {
    v30 = 0;
  }
  else
  {
    v27 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("thread.count.many"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v45)
  {
    accessibilityLocalizedString(CFSTR("contains.attachments"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  if (objc_msgSend(v59, "safeBoolForKey:", CFSTR("hasGeneratedSummary")))
  {
    accessibilityLocalizedString(CFSTR("message.summary"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }
  v33 = v58;
  if (v44)
    v33 = v57;
  v34 = v33;
  objc_opt_class();
  objc_msgSend(v59, "safeValueForKey:", CFSTR("tertiaryLabel"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityApproximateVisibleSummaryText(self, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = v62[5];
  objc_msgSend(v59, "safeValueForKey:", CFSTR("dateLabel"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "accessibilityLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v38;
  __UIAXStringForVariables();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MessageListCollectionViewCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v5, v54, v50, v47, v41, v56, v34, v42, v53, v52, v51, v48, v30, v31, v32, v37, CFSTR("__AXStringForVariablesSentinel"));
  _Block_object_dispose(&v61, 8);

  v4 = 0;
LABEL_38:

  return v5;
}

void __64__MessageListCollectionViewCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  __CFString *v3;
  id v4;

  switch(a2)
  {
    case 0:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.red");
      goto LABEL_9;
    case 1:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.orange");
      goto LABEL_9;
    case 2:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.yellow");
      goto LABEL_9;
    case 3:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.green");
      goto LABEL_9;
    case 4:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.blue");
      goto LABEL_9;
    case 5:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.purple");
      goto LABEL_9;
    case 6:
      v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v3 = CFSTR("flag.color.gray");
LABEL_9:
      accessibilityLocalizedString(v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendFormat:", CFSTR("%@, "), v4);

      break;
    default:
      return;
  }
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  __CFString *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  -[MessageListCollectionViewCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_9, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEditing"))
    goto LABEL_8;
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("messageListSelectionModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("dataSource.collectionViewDataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)MessageListCollectionViewCellAccessibility;
    -[MessageListCollectionViewCellAccessibility accessibilityHint](&v16, sel_accessibilityHint);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "indexPathForCell:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifierForIndexPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __63__MessageListCollectionViewCellAccessibility_accessibilityHint__block_invoke_2;
  v20 = &unk_2502859A0;
  v23 = &v24;
  v10 = v6;
  v21 = v10;
  v11 = v9;
  v22 = v11;
  AXPerformSafeBlock();
  v12 = *((unsigned __int8 *)v25 + 24);

  _Block_object_dispose(&v24, 8);
  if (v12)
    v13 = CFSTR("message.deselect.hint");
  else
    v13 = CFSTR("message.select.hint");
  accessibilityLocalizedString(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

uint64_t __63__MessageListCollectionViewCellAccessibility_accessibilityHint__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE63700]);

  return v3;
}

uint64_t __63__MessageListCollectionViewCellAccessibility_accessibilityHint__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isSelectedItemID:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
  void *v4;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.secondaryLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234914D60]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 0;
}

- (void)_accessibilityPerformCellAction:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  -[MessageListCollectionViewCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_386, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForCell:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a3 == 3)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForCell:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    v31 = 0;
    v12 = v10;
    v13 = v11;
    AXPerformSafeBlock();
    v14 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
    objc_msgSend(v14, "safeValueForKey:", CFSTR("result"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__3;
      v30 = __Block_byref_object_dispose__3;
      v31 = 0;
      v25 = v15;
      AXPerformSafeBlock();
      v16 = (id)v27[5];

      _Block_object_dispose(&v26, 8);
      v23 = v16;
      v24 = v9;
      v17 = v16;
      AXPerformSafeBlock();

    }
  }
  else
  {
    objc_opt_class();
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    v31 = 0;
    v21 = v9;
    v22 = v7;
    AXPerformSafeBlock();
    v18 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
    __UIAccessibilityCastAsClass();
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19;
    v12 = v19;
    AXPerformSafeBlock();
    v13 = v20;
  }

}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE63700]);

  return v3;
}

void __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "messageListItemAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_3(uint64_t a1)
{
  Class v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = NSClassFromString(CFSTR("MFReadLaterTriageInteraction"));
  v8[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "safeValueForKey:", CFSTR("undoManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class interactionWithMessageListItems:undoManager:origin:actor:](v2, "interactionWithMessageListItems:undoManager:origin:actor:", v3, v4, 2, 2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_performInteractionAfterPreparation:completion:", 0, 0);
}

void __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_swipeActionForTriageAction:indexPath:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "executePreHandlerWithView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "executeHandlerWithView:completionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_390);
}

void __78__MessageListCollectionViewCellAccessibility__accessibilityPerformCellAction___block_invoke_7()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_accessibilityToggleReadAction:(id)a3
{
  void *v4;

  -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetTriageActionForAnnouncement:", 2);

  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 2);
  return 1;
}

- (BOOL)_accessibilityToggleFlagAction:(id)a3
{
  void *v4;

  -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetTriageActionForAnnouncement:", 6);

  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 6);
  return 1;
}

- (BOOL)_accessibilityRemoveHighImpactAction:(id)a3
{
  void *v4;

  -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_axSetTriageActionForAnnouncement:", 21);

  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 21);
  return 1;
}

- (BOOL)_accessibilityDeleteAction:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  UIAccessibilityNotifications v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voiceOverSpeakActionConfirmation");

  if (v5)
  {
    v6 = -[MessageListCollectionViewCellAccessibility _accessibilityThreadCount](self, "_accessibilityThreadCount");
    v7 = *MEMORY[0x24BDF71E8];
    if (v6 < 2)
    {
      accessibilityLocalizedString(CFSTR("message.deleted"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v7, v10);
    }
    else
    {
      v8 = v6;
      v9 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("thread.message.deleted"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v7, v11);

    }
  }
  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 8);
  return 1;
}

- (void)_axPostAnnouncementForActionCompletionIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  UIAccessibilityNotifications v9;
  __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "voiceOverSpeakActionConfirmation");

  if (v4)
  {
    -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_axGetTriageActionForAnnouncement");

    if (v6 == 2)
    {
      -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.viewModel"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "safeBoolForKey:", CFSTR("isRead"));

      v9 = *MEMORY[0x24BDF71E8];
      if ((v12 & 1) != 0)
      {
        accessibilityLocalizedString(CFSTR("read"));
        v14 = (id)objc_claimAutoreleasedReturnValue();
        accessibilitySubstituteReadPhonemeInString((uint64_t)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        UIAccessibilityPostNotification(v9, v13);

LABEL_12:
        return;
      }
      v10 = CFSTR("unread");
LABEL_11:
      accessibilityLocalizedString(v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v9, v14);
      goto LABEL_12;
    }
    if (v6 == 6)
    {
      -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.viewModel"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("isFlagged"));

      v9 = *MEMORY[0x24BDF71E8];
      if ((v8 & 1) != 0)
        v10 = CFSTR("flagged");
      else
        v10 = CFSTR("unflagged");
      goto LABEL_11;
    }
  }
}

- (id)_accessibilityMailboxController
{
  void *v2;
  void *v3;

  -[MessageListCollectionViewCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_402, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __77__MessageListCollectionViewCellAccessibility__accessibilityMailboxController__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MessageListViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_accessibilityMoreAction:(id)a3
{
  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 1);
  return 1;
}

- (BOOL)_accessibilityArchiveAction:(id)a3
{
  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 9);
  return 1;
}

- (BOOL)_accessibilityToggleThreadAction:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v13 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "voiceOverSpeakActionConfirmation");

  if (v5)
  {
    -[MessageListCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cellHelper"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "safeBoolForKey:", CFSTR("disclosureEnabled"));

    if (v7)
    {
      v8 = -[MessageListCollectionViewCellAccessibility _accessibilityThreadCount](self, "_accessibilityThreadCount");
      v9 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("num.messages"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringWithFormat:", v10, v8, v13, 3221225472, __79__MessageListCollectionViewCellAccessibility__accessibilityToggleThreadAction___block_invoke, &unk_250285728, self);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();

    }
  }
  return 1;
}

void __79__MessageListCollectionViewCellAccessibility__accessibilityToggleThreadAction___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.disclosureButton"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_didTapDisclosureButton:", v2);

}

- (BOOL)_accessibilityLaterAction:(id)a3
{
  -[MessageListCollectionViewCellAccessibility _accessibilityPerformCellAction:](self, "_accessibilityPerformCellAction:", 3);
  return 1;
}

- (BOOL)_accessibilityScreenAction:(id)a3
{
  return 1;
}

- (void)accessibilityElementDidBecomeFocused
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility accessibilityElementDidBecomeFocused](&v2, sel_accessibilityElementDidBecomeFocused);
  AXPerformSafeBlock();
}

void __82__MessageListCollectionViewCellAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityMailboxController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("messageListPositionHelper"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "recalculateFirstVisibleIndex");

}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  int v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  objc_super v45;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.messageListItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("shouldArchiveByDefault"));

  v7 = (_QWORD *)MEMORY[0x24BEBAD58];
  if (v6)
  {
    v8 = objc_msgSend(v3, "indexOfObjectPassingTest:", &__block_literal_global_409);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("archive.button"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithName:target:selector:", v10, self, sel__accessibilityArchiveAction_);

      objc_msgSend(v11, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_ARCHIVE"));
      objc_msgSend(v3, "addObject:", v11);
    }
    else
    {
      objc_msgSend(v3, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_ARCHIVE"));
      accessibilityLocalizedString(CFSTR("archive.button"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setName:", v12);

      objc_msgSend(v11, "setTarget:", self);
      objc_msgSend(v11, "setSelector:", sel__accessibilityArchiveAction_);
      objc_msgSend(v11, "setSortPriority:", *v7);
      objc_msgSend(v11, "setImage:", 0);
    }

  }
  if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("isRead")) & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("message.action.mark.unread"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("message.action.mark.read"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilitySubstituteReadPhonemeInString((uint64_t)v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v13, self, sel__accessibilityToggleReadAction_);
  objc_msgSend(v15, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_READ"));
  objc_msgSend(v3, "addObject:", v15);
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isFlagged")))
    v16 = CFSTR("message.action.unflag");
  else
    v16 = CFSTR("message.action.flag");
  accessibilityLocalizedString(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v17, self, sel__accessibilityToggleFlagAction_);
  objc_msgSend(v18, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_FLAG"));
  objc_msgSend(v3, "addObject:", v18);
  accessibilityLocalizedString(CFSTR("message.action.delete"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[MessageListCollectionViewCellAccessibility _accessibilityThreadCount](self, "_accessibilityThreadCount");
  if (v20 >= 2)
  {
    v21 = v20;
    v22 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("message.action.delete.thread"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v23, v21);
    v24 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v24;
  }
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "safeIntegerForKey:", CFSTR("chevronType"));

  if (v26 == 2)
  {
    -[MessageListCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cellHelper"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "safeBoolForKey:", CFSTR("disclosureEnabled"));

    if (v28)
      v29 = CFSTR("mailbox.cell.thread.collapse");
    else
      v29 = CFSTR("mailbox.cell.thread.expand");
    accessibilityLocalizedString(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v30, self, sel__accessibilityToggleThreadAction_);
    objc_msgSend(v31, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_TOGGLE_THREAD"));
    objc_msgSend(v3, "addObject:", v31);

  }
  -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "safeValueForKey:", CFSTR("state"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "safeBoolForKey:", CFSTR("containsDraftsOrOutbox"));

  if ((v34 & 1) == 0)
  {
    v35 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("message.action.more"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithName:target:selector:", v36, self, sel__accessibilityMoreAction_);

    objc_msgSend(v37, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_MORE"));
    objc_msgSend(v3, "addObject:", v37);
    v18 = v37;
  }
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v19, self, sel__accessibilityDeleteAction_);

  _UIAccessibilityCustomActionDeleteImage();
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setImage:", v39);

  objc_msgSend(v38, "setSortPriority:", *MEMORY[0x24BEBAD58]);
  objc_msgSend(v38, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_DELETE"));
  objc_msgSend(v3, "addObject:", v38);
  v40 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("message.action.read.later"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithName:target:selector:", v41, self, sel__accessibilityLaterAction_);

  objc_msgSend(v42, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_READ_LATER"));
  objc_msgSend(v3, "addObject:", v42);
  v45.receiver = self;
  v45.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility accessibilityCustomActions](&v45, sel_accessibilityCustomActions);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v43);

  return v3;
}

uint64_t __80__MessageListCollectionViewCellAccessibility__privateAccessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AXDeleteAction"));

  return v3;
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility _accessibilityScrollStatus](&v9, sel__accessibilityScrollStatus);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.tertiaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityApproximateVisibleSummaryText(self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityLinkedUIElements
{
  unint64_t v3;
  id v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = -[MessageListCollectionViewCellAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF7400] & v3) != 0)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    v17 = 0;
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __76__MessageListCollectionViewCellAccessibility__accessibilityLinkedUIElements__block_invoke;
    v10 = &unk_250285E40;
    v11 = &v12;
    AXPerformSafeBlock();
    v4 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MessageListCollectionViewCellAccessibility;
    -[MessageListCollectionViewCellAccessibility _accessibilityLinkedUIElements](&v6, sel__accessibilityLinkedUIElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __76__MessageListCollectionViewCellAccessibility__accessibilityLinkedUIElements__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isViewLoaded"))
  {
    objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeafNodePredicate:", &__block_literal_global_471);
    objc_msgSend(v7, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_accessibilityLeafDescendantsWithCount:options:", 1, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

uint64_t __76__MessageListCollectionViewCellAccessibility__accessibilityLinkedUIElements__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  void *v3;
  char v4;
  objc_super v6;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEditing"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MessageListCollectionViewCellAccessibility;
  return -[MessageListCollectionViewCellAccessibility _accessibilityScannerActivateBehavior](&v6, sel__accessibilityScannerActivateBehavior);
}

- (BOOL)_accessibilityIsThreadedChildCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[MessageListCollectionViewCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_476, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MessageListViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v9 = v6;
    v10 = v5;
    AXPerformSafeBlock();
    v7 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __79__MessageListCollectionViewCellAccessibility__accessibilityIsThreadedChildCell__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessibilityIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE63700]);

  return v3;
}

uint64_t __79__MessageListCollectionViewCellAccessibility__accessibilityIsThreadedChildCell__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isExpandedIndexPath:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (unint64_t)_accessibilityThreadCount
{
  void *v2;
  unint64_t v3;
  unint64_t v4;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.messageListItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("count"));
  if (v3 <= 1)
    v4 = 0;
  else
    v4 = v3;

  return v4;
}

- (void)_axProcessMailLabel:(id)a3 children:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("cellHelper.cellView.%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAccessibilityExposeLabelAsValue:", 1);
  objc_msgSend(v7, "axSafelyAddObject:", v10);

}

- (id)_accessibilityThreadedDisclosureButton
{
  void *v2;
  void *v3;
  id v4;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.disclosureButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "_accessibilityViewIsVisible"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility automationElements](&v10, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[MessageListCollectionViewCellAccessibility _axProcessMailLabel:children:](self, "_axProcessMailLabel:children:", CFSTR("secondaryLabel"), v7);
  -[MessageListCollectionViewCellAccessibility _axProcessMailLabel:children:](self, "_axProcessMailLabel:children:", CFSTR("dateLabel"), v7);
  -[MessageListCollectionViewCellAccessibility _axProcessMailLabel:children:](self, "_axProcessMailLabel:children:", CFSTR("primaryLabel"), v7);
  -[MessageListCollectionViewCellAccessibility _axProcessMailLabel:children:](self, "_axProcessMailLabel:children:", CFSTR("tertiaryLabel"), v7);
  -[MessageListCollectionViewCellAccessibility _accessibilityThreadedDisclosureButton](self, "_accessibilityThreadedDisclosureButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  return v7;
}

- (id)_accessibilityEquivalenceTag
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.messageListItem.displayMessageObjectID.stringHash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MessageListCollectionViewCellAccessibility _accessibilityLabelWithoutAttributes](self, "_accessibilityLabelWithoutAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }

  return v4;
}

- (id)_accessibilityLabelWithoutAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.secondaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.primaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 >= 3)
    v9 = 3;
  else
    v9 = v8;
  objc_msgSend(v7, "subarrayWithRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MessageListCollectionViewCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("cellHelper.cellView.dateLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility layoutSubviews](&v7, sel_layoutSubviews);
  -[MessageListCollectionViewCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  -[MessageListCollectionViewCellAccessibility _axSetDisclosureButtonTraits](self, "_axSetDisclosureButtonTraits");
  -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_axGetTriageActionForAnnouncement");

  if (v4)
  {
    -[MessageListCollectionViewCellAccessibility _axPostAnnouncementForActionCompletionIfNecessary](self, "_axPostAnnouncementForActionCompletionIfNecessary");
    -[MessageListCollectionViewCellAccessibility _accessibilityMailboxController](self, "_accessibilityMailboxController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_axSetTriageActionForAnnouncement:", 0);

  }
  -[MessageListCollectionViewCellAccessibility _accessibilityThreadedDisclosureButton](self, "_accessibilityThreadedDisclosureButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("DisclosureButton"));

}

- (void)prepareForReuse
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MessageListCollectionViewCellAccessibility;
  -[MessageListCollectionViewCellAccessibility prepareForReuse](&v5, sel_prepareForReuse);
  -[MessageListCollectionViewCellAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("ApproximateVisibleSummary"));
  -[MessageListCollectionViewCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", 0);
  -[MessageListCollectionViewCellAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", &__block_literal_global_497);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __61__MessageListCollectionViewCellAccessibility_prepareForReuse__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__MessageListCollectionViewCellAccessibility_prepareForReuse__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetView");
}

@end
