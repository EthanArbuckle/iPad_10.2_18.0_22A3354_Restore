@implementation CKBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKBalloonView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("doubleTapGestureRecognized:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessagePartChatItem"), CFSTR("CKChatItem"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKBalloonViewDelegate"), CFSTR("balloonViewTapped:withModifierFlags:selectedText:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKBalloonViewDelegate"), CFSTR("balloonViewDoubleTapped:"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKBalloonViewDelegate"), CFSTR("balloonViewLongTouched:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("delegate"), "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagePartChatItem"), CFSTR("message"), "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("isFromMe"), "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("hasMention"), "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("text"), "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("time"), "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("__ck_isiMessage"), "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("__ck_isSMS"), "B", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKAttachmentMessagePartChatItem"), CFSTR("mediaObject"), "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMediaObject"), CFSTR("mediaType"), "i", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKLocationMediaObject"), CFSTR("CKMediaObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKLocationMediaObject"), CFSTR("coordinate"), "{CLLocationCoordinate2D=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatItem"), CFSTR("IMChatItem"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("IMTranscriptPluginChatItem"), CFSTR("IMPluginChatItemProtocol"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("IMPluginChatItemProtocol"), CFSTR("type"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("IMPluginChatItemProtocol"), CFSTR("dataSource"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKLocatingChatItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKMovieMediaObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("_interfaceActionsForChatItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInterfaceAction"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIInterfaceAction"), CFSTR("handler"), "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagePartChatItem"), CFSTR("visibleAssociatedMessageChatItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatItem"), CFSTR("isHighlighted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMovieMediaObject"), CFSTR("isJellyfishVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKCoreChatController"), CFSTR("wantsReplyButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("showInlineReplyControllerForChatItem:presentKeyboard:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("presentStickerDetailControllerWithIndexPath:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("invisibleInkEffectController"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKInvisibleInkEffectController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKInvisibleInkEffectController"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKInvisibleInkEffectController"), CFSTR("isSuspended"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKTranscriptBalloonCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptMessageCell"), CFSTR("isReply"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptMessageCell"), CFSTR("isReplyContextPreview"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKRichLinkReplyPreviewBalloonView"), CFSTR("linkView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKFullScreenBalloonViewControllerPhone"), CFSTR("balloonView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKFullScreenBalloonViewControllerPhone"));
  objc_msgSend(v3, "validateClass:", CFSTR("ChatKit.TapbackPickerTintableMessageBalloonView"));
  objc_msgSend(v3, "validateClass:", CFSTR("ChatKit.TapbackPickerBalloonView"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  char v4;

  -[CKBalloonViewAccessibility storedIsAccessibilityElement](self, "storedIsAccessibilityElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  CKBalloonViewAccessibility *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  id v33;
  CKBalloonViewAccessibility *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  char v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[CKBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    -[CKBalloonViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_axBalloonViewCustomActions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "axSafelyAddObjectsFromArray:", v3);

    if (!-[CKBalloonViewAccessibility _axIsInNotification](self, "_axIsInNotification"))
    {
      -[CKBalloonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.delegate"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_opt_class();
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__4;
      v40 = __Block_byref_object_dispose__4;
      v41 = 0;
      v29 = MEMORY[0x24BDAC760];
      v30 = 3221225472;
      v31 = __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke;
      v32 = &unk_2501B1DA8;
      v35 = &v36;
      v17 = v4;
      v33 = v17;
      v34 = self;
      AXPerformSafeBlock();
      v5 = (id)v37[5];

      _Block_object_dispose(&v36, 8);
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
        abort();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v26 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v11, "safeStringForKey:", CFSTR("title"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "length"))
            {
              v13 = objc_alloc(MEMORY[0x24BDF6788]);
              v20[0] = MEMORY[0x24BDAC760];
              v20[1] = 3221225472;
              v20[2] = __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2;
              v20[3] = &unk_2501B1EF8;
              v14 = v12;
              v21 = v14;
              v22 = v17;
              v23 = self;
              v24 = v11;
              v15 = (void *)objc_msgSend(v13, "initWithName:actionHandler:", v14, v20);
              objc_msgSend(v19, "axSafelyAddObject:", v15);

            }
          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v43, 16);
        }
        while (v8);
      }

    }
  }
  else
  {
    v19 = 0;
  }
  return v19;
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_axChatItemForBalloon");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_interfaceActionsForChatItem:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  accessibilityLocalizedString(CFSTR("balloon.message.sticker.details"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((_DWORD)v2)
  {
    v9 = *(id *)(a1 + 40);
    AXPerformSafeBlock();
    v4 = v9;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "safeBoolForKey:", CFSTR("wantsReplyButton"))
      || (v5 = *(void **)(a1 + 32),
          accessibilityLocalizedString(CFSTR("balloon.message.reply")),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v6),
          v6,
          !(_DWORD)v5))
    {
      objc_msgSend(*(id *)(a1 + 48), "axPerformInterfaceAction:", *(_QWORD *)(a1 + 56));
      return 1;
    }
    v8 = *(id *)(a1 + 40);
    AXPerformSafeBlock();
    v4 = v8;
  }

  return 1;
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v3 = MEMORY[0x24BDAC760];
  v1 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  AXPerformSafeBlock();
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  objc_msgSend(v1, "presentStickerDetailControllerWithIndexPath:", v2, v3, 3221225472, __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_4, &unk_2501B1B28, v4, &v5);
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_axIndexPathForBalloon");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v3 = MEMORY[0x24BDAC760];
  v1 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  AXPerformSafeBlock();
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  objc_msgSend(v1, "showInlineReplyControllerForChatItem:presentKeyboard:", v2, 1, v3, 3221225472, __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_6, &unk_2501B1B28, v4, &v5);
}

void __56__CKBalloonViewAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_axChatItemForBalloon");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axBalloonViewCustomActions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (-[CKBalloonViewAccessibility _axIsInNotification](self, "_axIsInNotification")
    || -[CKBalloonViewAccessibility _axIsVisibleInTapbackView](self, "_axIsVisibleInTapbackView")
    && (!-[CKBalloonViewAccessibility _axIsVisibleInTapbackView](self, "_axIsVisibleInTapbackView")
     || -[CKBalloonViewAccessibility _axIsTapbackBalloonView](self, "_axIsTapbackBalloonView")))
  {
    return 0;
  }
  v4 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("acknowledgments.action.title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:target:selector:", v5, self, sel__axTapback);

  v8[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_axTapback
{
  void *v2;

  -[CKBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    AXPerformSafeBlock();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  }
}

uint64_t __40__CKBalloonViewAccessibility__axTapback__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doubleTapGestureRecognized:", 0);
}

- (void)axPerformInterfaceAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  -[CKBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !-[CKBalloonViewAccessibility _axIsInNotification](self, "_axIsInNotification"))
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("handler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v6;
        v7 = v4;
        AXPerformSafeBlock();

      }
    }

  }
}

uint64_t __55__CKBalloonViewAccessibility_axPerformInterfaceAction___block_invoke(uint64_t a1)
{
  char v2;

  v2 = 0;
  return (*(uint64_t (**)(_QWORD, _QWORD, char *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), &v2);
}

- (id)_axIndexPathForBalloon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  -[CKBalloonViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKTranscriptCollectionViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKBalloonViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v10 = 0;
      v11 = &v10;
      v12 = 0x3032000000;
      v13 = __Block_byref_object_copy__4;
      v14 = __Block_byref_object_dispose__4;
      v15 = 0;
      v8 = v3;
      v9 = v5;
      AXPerformSafeBlock();
      v6 = (id)v11[5];

      _Block_object_dispose(&v10, 8);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __52__CKBalloonViewAccessibility__axIndexPathForBalloon__block_invoke(uint64_t a1)
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

- (id)_axChatItemForBalloon
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[CKBalloonViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKTranscriptCollectionViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKBalloonViewAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("chatItems"));
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__4;
      v13 = __Block_byref_object_dispose__4;
      v14 = 0;
      v8 = (id)objc_claimAutoreleasedReturnValue();
      AXPerformSafeBlock();
      v6 = (id)v10[5];

      _Block_object_dispose(&v9, 8);
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51__CKBalloonViewAccessibility__axChatItemForBalloon__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_axIndexPathForBalloon");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", objc_msgSend(v6, "row"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_axMessageForBalloon
{
  void *v2;
  void *v3;

  -[CKBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKMessagePartChatItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_axBuddyNameForBalloon
{
  void *v2;
  void *v3;
  void *v4;

  -[CKBalloonViewAccessibility _axMessageForBalloon](self, "_axMessageForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("sender"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axIsMessageFromMe
{
  void *v2;
  char v3;

  -[CKBalloonViewAccessibility _axMessageForBalloon](self, "_axMessageForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isFromMe"));

  return v3;
}

- (BOOL)_axIsImessage
{
  void *v2;
  char v3;

  -[CKBalloonViewAccessibility _axMessageForBalloon](self, "_axMessageForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("__ck_isiMessage"));

  return v3;
}

- (BOOL)_axIsTextMessage
{
  void *v2;
  char v3;

  -[CKBalloonViewAccessibility _axMessageForBalloon](self, "_axMessageForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("__ck_isSMS"));

  return v3;
}

- (BOOL)_axIsDigitalTouch
{
  return -[CKBalloonViewAccessibility _axIsBalloonOfType:](self, "_axIsBalloonOfType:", CFSTR("com.apple.DigitalTouchBalloonProvider"));
}

- (id)_axReplyDescription
{
  void *v2;
  void *v3;

  -[CKBalloonViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "safeBoolForKey:", CFSTR("isReply")) & 1) != 0
    || objc_msgSend(v2, "safeBoolForKey:", CFSTR("isReplyContextPreview")))
  {
    accessibilityLocalizedString(CFSTR("balloon.message.reply"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __49__CKBalloonViewAccessibility__axReplyDescription__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("CKTranscriptMessageCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axDigitalTouchDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CKBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("IMChatItem.dataSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "safeArrayForKey:", CFSTR("createSessionMessages")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "firstObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    objc_msgSend(v6, "accessibilityLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_axMessageTime
{
  void *v2;
  void *v3;
  void *v4;

  -[CKBalloonViewAccessibility _axMessageForBalloon](self, "_axMessageForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXDateStringForFormat();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axIsBalloonOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v4 = a3;
  -[CKBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axChatItemForBalloon"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("IMChatItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSProtocolFromString(CFSTR("IMPluginChatItemProtocol"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "conformsToProtocol:", v8);

  if (v9)
  {
    objc_msgSend(v7, "safeValueForKey:", CFSTR("type"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", v4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_axMessageSender
{
  BOOL v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  __CFString *v7;
  id v8;
  void *v9;

  v3 = -[CKBalloonViewAccessibility _axIsMessageFromMe](self, "_axIsMessageFromMe");
  v4 = -[CKBalloonViewAccessibility _axIsImessage](self, "_axIsImessage");
  -[CKBalloonViewAccessibility _axBuddyNameForBalloon](self, "_axBuddyNameForBalloon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (v4)
      v7 = CFSTR("balloon.your.imessage");
    else
      v7 = CFSTR("balloon.your.textmessage");
    goto LABEL_8;
  }
  if (!objc_msgSend(v5, "length"))
  {
    v7 = CFSTR("balloon.message");
LABEL_8:
    accessibilityLocalizedString(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = v6;
LABEL_9:
  v9 = v8;

  return v9;
}

- (id)_axHighlightedDescription
{
  void *v2;
  int v3;
  void *v4;

  -[CKBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isHighlighted"));

  if (v3)
  {
    accessibilityLocalizedString(CFSTR("balloon.message.pinned"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_axStickerDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[CKBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("visibleAssociatedMessageChatItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        NSClassFromString(CFSTR("CKAssociatedStickerChatItem"));
        v8 += objc_opt_isKindOfClass() & 1;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);

    if (!v8)
    {
      v13 = 0;
      goto LABEL_13;
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("stickers.count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    v12 = v5;
  }

LABEL_13:
  return v13;
}

- (id)_axAcknowledgmentDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  -[CKBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("visibleAssociatedMessageChatItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      NSClassFromString(CFSTR("CKAggregateAcknowledgmentChatItem"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v11;

    if (v13)
    {
      objc_msgSend(v13, "accessibilityLabel", (_QWORD)v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v12 = 0;
  }
  else
  {
LABEL_9:
    v12 = 0;
    v13 = v6;
LABEL_12:

  }
  return v12;
}

- (BOOL)_axIsInNotification
{
  void *v2;
  char v3;

  -[CKBalloonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityBoolValueForKey:", CFSTR("AXTranscriptIsInNotification"));

  return v3;
}

- (BOOL)_axIsTapbackBalloonView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = -[CKBalloonViewAccessibility _axIsVisibleInTapbackView](self, "_axIsVisibleInTapbackView");
  if (v3)
  {
    -[CKBalloonViewAccessibility accessibilityContainer](self, "accessibilityContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("balloonView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", self);

    LOBYTE(v3) = v7;
  }
  return v3;
}

- (BOOL)_axIsVisibleInTapbackView
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;

  -[CKBalloonViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("CKFullScreenBalloonViewControllerPhone"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[CKBalloonViewAccessibility accessibilityContainer](self, "accessibilityContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("ChatKit.TapbackPickerTintableMessageBalloonView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      -[CKBalloonViewAccessibility accessibilityContainer](self, "accessibilityContainer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("ChatKit.TapbackPickerBalloonView"));
      isKindOfClass = objc_opt_isKindOfClass();

    }
  }

  return isKindOfClass & 1;
}

- (id)accessibilityTextualContext
{
  return (id)*MEMORY[0x24BDF7398];
}

- (id)accessibilityDropPointDescriptors
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDF67B0]);
  accessibilityLocalizedString(CFSTR("drop.into.compose"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:view:", v4, self);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
