@implementation CKChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKChatController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axFocusedChatItemElement
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetFocusedChatItemElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("editingToolbarItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("actionMenuGestureRecognizerButtonGestureDidEnd:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("videoMessageRecordingViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("setEffectPickerWindow:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("transcriptCollectionViewController: willBeginImpactEffectAnimationWithSendAnimationContext:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("videoActionMenuController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuController"), CFSTR("actionMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuItem"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKChatController"), CFSTR("CKCoreChatController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKCoreChatController"), CFSTR("collectionViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagePartChatItem"), CFSTR("message"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("isFromMe"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("sender"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("subject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMHandle"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("__ck_isiMessage"), "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("dragManagerDidBeginDragging:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("dropInteraction: sessionDidUpdate:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("dragManagerDidEndDragging:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("selectedBalloonForTarget:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("_selectedBalloonFromTouchForDropSession:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("sendSticker: withDragTarget: draggedSticker:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("nicknameBanner"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptCollectionView"), CFSTR("UICollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("showInlineReplyControllerForChatItem:presentKeyboard:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("dismissInlineReplyController:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("inlineReplyController"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKSendAnimationContext"), CFSTR("impactIdentifier"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKSendAnimationContext"), CFSTR("throwBalloonViews"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKAttachmentMessagePartChatItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("IMMessage"));
  objc_msgSend(v3, "validateClass:", CFSTR("IMHandle"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKAdaptivePresentationController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKAdaptivePresentationController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAdaptivePresentationController"), CFSTR("presentedViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKBrowserDragControllerTarget"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserDragControllerTarget"), CFSTR("screenCoordinate"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("becomeFirstResponder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("targetFirstResponder"), "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMacToolbarController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagesController"), CFSTR("macToolbarController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("entryView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryContentView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessageEntryRichTextView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessagesController"), CFSTR("conversationListController"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKConversationListCollectionViewController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKCoreChatController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKChatController"), CFSTR("delegate"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKChatController"), CFSTR("entryView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessageEntryView"), CFSTR("contentView"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessageEntryContentView"), CFSTR("textView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("toolbarItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKChatController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  -[CKChatControllerAccessibility _axUpdateEditingToolbarItems:](self, "_axUpdateEditingToolbarItems:", v3, v4, 3221225472, __75__CKChatControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke, &unk_2501B1B28, self, &v5);
  -[CKChatControllerAccessibility _accessibilityReloadElementRelations:](self, "_accessibilityReloadElementRelations:", 1);

}

void __75__CKChatControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "toolbarItems");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  id v5;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("CKAdaptivePresentationController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("presentedViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return v3 != 0;
}

uint64_t __59__CKChatControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, &__block_literal_global_2);
}

void __59__CKChatControllerAccessibility_accessibilityPerformEscape__block_invoke_2()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility _dealloc](&v3, sel__dealloc);
  -[CKChatControllerAccessibility _accessibilityReloadElementRelations:](self, "_accessibilityReloadElementRelations:", 0);
}

- (void)_accessibilityReloadElementRelations:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKMessagesController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v5, "safeValueForKeyPath:", CFSTR("conversationListController.collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      UIAccessibilityUnrelateAllElements();
  }
  else
  {
    v7 = 0;
  }
  objc_opt_class();
  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    UIAccessibilityUnrelateAllElements();
  objc_opt_class();
  -[CKChatControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("entryView.contentView.textView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    UIAccessibilityUnrelateAllElements();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setAccessibilityLinkedUIElements:", v12);

    if (v9)
    {
      if (v11)
        UIAccessibilityRelateElements();
    }
  }

}

- (void)messageEntryViewSendButtonHit:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility messageEntryViewSendButtonHit:](&v3, sel_messageEntryViewSendButtonHit_, a3);
  MEMORY[0x23490A828](*MEMORY[0x24BEBAFB8]);
}

- (void)_showPhotoPickerWithSourceType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  MEMORY[0x23490A7C8](self, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/PhotoLibrary.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isLoaded") & 1) == 0)
    objc_msgSend(v7, "load");

  v8.receiver = self;
  v8.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility _showPhotoPickerWithSourceType:](&v8, sel__showPhotoPickerWithSourceType_, a3);
}

- (void)_showVCalViewerForMediaObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  MEMORY[0x23490A7C8]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/CalendarUI.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isLoaded") & 1) == 0)
    objc_msgSend(v7, "load");

  v8.receiver = self;
  v8.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility _showVCalViewerForMediaObject:](&v8, sel__showVCalViewerForMediaObject_, v4);

}

- (id)editingToolbarItems
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility editingToolbarItems](&v5, sel_editingToolbarItems);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerAccessibility _axUpdateEditingToolbarItems:](self, "_axUpdateEditingToolbarItems:", v3);
  return v3;
}

- (void)actionMenuGestureRecognizerButtonGestureDidEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility actionMenuGestureRecognizerButtonGestureDidEnd:](&v11, sel_actionMenuGestureRecognizerButtonGestureDidEnd_, v4);
  objc_opt_class();
  -[CKChatControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("videoMessageRecordingViewController.videoActionMenuController.actionMenuItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = v8;
  v9 = v8;
  AXPerformBlockOnMainThreadAfterDelay();

}

void __80__CKChatControllerAccessibility_actionMenuGestureRecognizerButtonGestureDidEnd___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], *(id *)(a1 + 32));
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilitySpeakThisElementsAndStrings");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKChatControllerAccessibility;
    -[CKChatControllerAccessibility _accessibilitySpeakThisElementsAndStrings](&v8, sel__accessibilitySpeakThisElementsAndStrings);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (void)setEffectPickerWindow:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKChatControllerAccessibility;
  v3 = a3;
  -[CKChatControllerAccessibility setEffectPickerWindow:](&v4, sel_setEffectPickerWindow_, v3);
  objc_msgSend(v3, "setAccessibilityViewIsModal:", 1, v4.receiver, v4.super_class);

}

- (id)_axCurrentTargetBalloonView
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetCurrentTargetBalloonView:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (int64_t)_axCurrentLayoutIntent
{
  return __UIAccessibilityGetAssociatedInteger();
}

- (void)_axSetCurrentLayoutIntent:(int64_t)a3
{
  __UIAccessibilitySetAssociatedInteger();
}

- (void)dragManagerDidBeginDragging:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility dragManagerDidBeginDragging:](&v5, sel_dragManagerDidBeginDragging_, a3);
  accessibilityLocalizedString(CFSTR("sticker.drag.begin"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  -[CKChatControllerAccessibility _axSetCurrentTargetBalloonView:](self, "_axSetCurrentTargetBalloonView:", 0);
  -[CKChatControllerAccessibility _axSetCurrentLayoutIntent:](self, "_axSetCurrentLayoutIntent:", 0);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  objc_super v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t);
  void *v41;
  CKChatControllerAccessibility *v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  char v51;
  objc_super v52;

  v6 = a3;
  v7 = a4;
  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = 0;
  objc_opt_class();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v31 = v8;
    v51 = 0;
    objc_opt_class();
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__5;
    v49 = __Block_byref_object_dispose__5;
    v50 = 0;
    v38 = MEMORY[0x24BDAC760];
    v39 = 3221225472;
    v40 = __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke;
    v41 = &unk_2501B1DA8;
    v44 = &v45;
    v42 = self;
    v32 = v7;
    v11 = v7;
    v43 = v11;
    AXPerformSafeBlock();
    v12 = (id)v46[5];

    _Block_object_dispose(&v45, 8);
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
      abort();
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__5;
    v49 = __Block_byref_object_dispose__5;
    v50 = 0;
    objc_msgSend(v10, "visibleCells");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke_2;
    v34[3] = &unk_2501B20C0;
    v35 = v10;
    v15 = v13;
    v36 = v15;
    v37 = &v45;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v34);
    v16 = (void *)v46[5];
    -[CKChatControllerAccessibility _axCurrentTargetBalloonView](self, "_axCurrentTargetBalloonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v46[5];
    if (v16 == v17)
    {
      if (v18)
      {
        v24 = -[CKChatControllerAccessibility _axLayoutIntentForTarget:inBalloonView:](self, "_axLayoutIntentForTarget:inBalloonView:", v11);
        if (v24 != -[CKChatControllerAccessibility _axCurrentLayoutIntent](self, "_axCurrentLayoutIntent"))
        {
          -[CKChatControllerAccessibility _axSetCurrentLayoutIntent:](self, "_axSetCurrentLayoutIntent:", v24);
          _axLocalizedStringForLayoutIntent(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          UIAccessibilitySpeakIfNotSpeaking();

        }
      }
    }
    else if (v18)
    {
      v19 = -[CKChatControllerAccessibility _axLayoutIntentForTarget:inBalloonView:](self, "_axLayoutIntentForTarget:inBalloonView:", v11);
      -[CKChatControllerAccessibility _axSetCurrentLayoutIntent:](self, "_axSetCurrentLayoutIntent:", v19);
      accessibilityLocalizedString(CFSTR("sticker.drag.hovering"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      _axLocalizedStringForLayoutIntent(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v46[5], "accessibilityLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilitySpeak();
      -[CKChatControllerAccessibility _axSetCurrentTargetBalloonView:](self, "_axSetCurrentTargetBalloonView:", v46[5], v21, v29, CFSTR("__AXStringForVariablesSentinel"));
    }
    else
    {
      -[CKChatControllerAccessibility _axSetCurrentTargetBalloonView:](self, "_axSetCurrentTargetBalloonView:", 0, v27, v28, v30);
    }
    v33.receiver = self;
    v33.super_class = (Class)CKChatControllerAccessibility;
    -[CKChatControllerAccessibility dropInteraction:sessionDidUpdate:](&v33, sel_dropInteraction_sessionDidUpdate_, v6, v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v45, 8);
    v8 = v31;
    v7 = v32;
  }
  else
  {
    v52.receiver = self;
    v52.super_class = (Class)CKChatControllerAccessibility;
    -[CKChatControllerAccessibility dropInteraction:sessionDidUpdate:](&v52, sel_dropInteraction_sessionDidUpdate_, v6, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

void __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_selectedBalloonFromTouchForDropSession:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__5;
    v12 = __Block_byref_object_dispose__5;
    v13 = 0;
    v6 = *(id *)(a1 + 32);
    v7 = v4;
    AXPerformSafeBlock();
    v5 = (id)v9[5];

    _Block_object_dispose(&v8, 8);
    if (objc_msgSend(*(id *)(a1 + 40), "isEqual:", v5))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);

  }
}

void __66__CKChatControllerAccessibility_dropInteraction_sessionDidUpdate___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)dragManagerDidEndDragging:(id)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility dragManagerDidEndDragging:](&v4, sel_dragManagerDidEndDragging_, a3);
  accessibilityLocalizedString(CFSTR("sticker.drag.done"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

}

- (void)sendSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility sendSticker:withDragTarget:draggedSticker:](&v20, sel_sendSticker_withDragTarget_draggedSticker_, v8, v9, v10);
  if (v9)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__5;
    v18 = __Block_byref_object_dispose__5;
    v19 = 0;
    v13 = v9;
    AXPerformSafeBlock();
    v11 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    if (v11)
    {
      accessibilityLocalizedString(CFSTR("sticker.drag.attached"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

    }
  }

}

void __75__CKChatControllerAccessibility_sendSticker_withDragTarget_draggedSticker___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "selectedBalloonForTarget:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axDescriptionForMessageEffectIdentifier:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.message.impact");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.loud")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.message.loud");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.gentle")) & 1) != 0)
  {
    v4 = CFSTR("impact.effect.message.gentle");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.focus")))
  {
    v4 = CFSTR("impact.effect.message.focus");
  }
  else
  {
    v4 = &stru_2501B2580;
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("impact.effect.message"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)_axLayoutIntentForTarget:(id)a3 inBalloonView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat Height;
  double v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  double Width;
  double v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v6 = a3;
  v7 = a4;
  -[CKChatControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("collectionViewController.collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "locationInView:", v9);
  v11 = v10;
  v13 = v12;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "convertPoint:fromView:", 0, v11, v13);
  v36 = v23;
  v25 = v24;
  v37.origin.x = v16;
  v37.origin.y = v18;
  v37.size.width = v20;
  v37.size.height = v22;
  v26 = CGRectGetWidth(v37) / 3.0;
  v38.origin.x = v16;
  v38.origin.y = v18;
  v38.size.width = v20;
  v38.size.height = v22;
  Width = CGRectGetWidth(v38);
  v39.origin.x = v16;
  v39.origin.y = v18;
  v39.size.width = v20;
  v39.size.height = v22;
  v27 = CGRectGetHeight(v39) / 3.0;
  v40.origin.x = v16;
  v40.origin.y = v18;
  v40.size.width = v20;
  v40.size.height = v22;
  Height = CGRectGetHeight(v40);
  v29 = (Height + Height) / 3.0;
  if (v36 <= v26)
  {
    if (v25 <= v27)
    {
      v33 = 1;
      goto LABEL_15;
    }
    v30 = v25 < v29;
    v31 = 3;
    v32 = 8;
  }
  else if (v36 >= (Width + Width) / 3.0)
  {
    if (v25 <= v27)
    {
      v33 = 2;
      goto LABEL_15;
    }
    v30 = v25 < v29;
    v31 = 4;
    v32 = 9;
  }
  else
  {
    if (v25 <= v27)
    {
      v33 = 6;
      goto LABEL_15;
    }
    v30 = v25 < v29;
    v31 = 7;
    v32 = 5;
  }
  if (v30)
    v33 = v32;
  else
    v33 = v31;
LABEL_15:

  return v33;
}

- (void)transcriptCollectionViewController:(id)a3 willBeginImpactEffectAnimationWithSendAnimationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility transcriptCollectionViewController:willBeginImpactEffectAnimationWithSendAnimationContext:](&v16, sel_transcriptCollectionViewController_willBeginImpactEffectAnimationWithSendAnimationContext_, v6, v7);
  objc_opt_class();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("impactIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("throwBalloonViews"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatControllerAccessibility _axDescriptionForMessageEffectIdentifier:](self, "_axDescriptionForMessageEffectIdentifier:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessibilityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (void)showInlineReplyControllerForChatItem:(id)a3 presentKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  NSString *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a4;
  v6 = (NSString *)*MEMORY[0x24BDF72D8];
  v7 = a3;
  UIAccessibilityFocusedElement(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerAccessibility _axSetFocusedChatItemElement:](self, "_axSetFocusedChatItemElement:", v8);
  -[CKChatControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("collectionViewController.collectionView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityElementsHidden:", 1);
  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nicknameBanner"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityElementsHidden:", 1);
  v11.receiver = self;
  v11.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility showInlineReplyControllerForChatItem:presentKeyboard:](&v11, sel_showInlineReplyControllerForChatItem_presentKeyboard_, v7, v4);

  AXPerformBlockOnMainThreadAfterDelay();
}

void __86__CKChatControllerAccessibility_showInlineReplyControllerForChatItem_presentKeyboard___block_invoke()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("inline.reply.show.transcript"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

- (void)dismissInlineReplyController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  UIAccessibilityNotifications v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inlineReplyController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10.receiver = self;
  v10.super_class = (Class)CKChatControllerAccessibility;
  -[CKChatControllerAccessibility dismissInlineReplyController:](&v10, sel_dismissInlineReplyController_, v3);
  -[CKChatControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("collectionViewController.collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityElementsHidden:", 0);
  -[CKChatControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nicknameBanner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityElementsHidden:", 0);
  if (v5)
  {
    v8 = *MEMORY[0x24BDF7328];
    -[CKChatControllerAccessibility _axFocusedChatItemElement](self, "_axFocusedChatItemElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v8, v9);

    -[CKChatControllerAccessibility _axSetFocusedChatItemElement:](self, "_axSetFocusedChatItemElement:", 0);
  }

}

- (void)_axUpdateEditingToolbarItems:(id)a3
{
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", &__block_literal_global_413);
}

void __62__CKChatControllerAccessibility__axUpdateEditingToolbarItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  unint64_t v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tag");
  if (v4 <= 2)
  {
    accessibilityLocalizedString(off_2501B2190[v4]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v5);

  }
}

@end
