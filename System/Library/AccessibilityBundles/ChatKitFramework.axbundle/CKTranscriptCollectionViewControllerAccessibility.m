@implementation CKTranscriptCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptBalloonCell"), CFSTR("balloonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTextBalloonView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("balloonViewForChatItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("effectManager:didStartEffect:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:"), "v", "{CGPoint=dd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("conversation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("chatItemsDidChange:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("chat"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMChat"), CFSTR("lastIncomingMessage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("isTypingMessage"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("delegate"), "@", 0, 0, 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagesController"), CFSTR("isShowingChatController"), "B", 0);

}

- (void)_accessibilityLoadMessagesIfNeeded
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[CKTranscriptCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "contentOffset");
  AXPerformSafeBlock();
}

uint64_t __87__CKTranscriptCollectionViewControllerAccessibility__accessibilityLoadMessagesIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadMessagesIfNeededWithTargetContentOffset:forKeyboardNavigation:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0;
  objc_opt_class();
  -[CKTranscriptCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "indexPathsForVisibleItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_6);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v4, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          NSClassFromString(CFSTR("CKTranscriptBalloonCell"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v12, "safeValueForKey:", CFSTR("balloonView"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v17, "addObject:", v13);
              v22 = 0;
              objc_opt_class();
              objc_msgSend(v13, "safeValueForKey:", CFSTR("textView"));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilityCastAsClass();
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v22)
                abort();
              if (v15)
                objc_msgSend(v17, "addObject:", v15);

            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);
    }

  }
  return v17;
}

uint64_t __94__CKTranscriptCollectionViewControllerAccessibility__accessibilitySpeakThisElementsAndStrings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "item");
  v6 = objc_msgSend(v4, "item");

  if (v6 <= v5)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (void)effectManager:(id)a3 didStartEffect:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  CKTranscriptCollectionViewControllerAccessibility *v27;
  id v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  char v36;

  v6 = a3;
  v7 = a4;
  LOBYTE(v30) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_opt_class();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__11;
  v34 = __Block_byref_object_dispose__11;
  v35 = 0;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __82__CKTranscriptCollectionViewControllerAccessibility_effectManager_didStartEffect___block_invoke;
  v26 = &unk_2501B1DA8;
  v29 = &v30;
  v27 = self;
  v9 = v7;
  v28 = v9;
  AXPerformSafeBlock();
  v10 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  __UIAccessibilityCastAsSafeCategory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    abort();
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptCollectionViewControllerAccessibility;
  -[CKTranscriptCollectionViewControllerAccessibility effectManager:didStartEffect:](&v22, sel_effectManager_didStartEffect_, v6, v9);
  if (v8 && v11)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _AXCKFullScreenEffectString(v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("impact.effect.full.description"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      accessibilityLocalizedString(v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "_axMessageSender");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeValueForKey:", CFSTR("textView"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "accessibilityValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      __UIAXStringForVariables();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

    }
  }

}

void __82__CKTranscriptCollectionViewControllerAccessibility_effectManager_didStartEffect___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "triggeringChatItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonViewForChatItem:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)axIsShowingChatController
{
  void *v2;
  void *v3;
  char v4;

  -[CKTranscriptCollectionViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKMessagesController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    __UIAccessibilitySafeClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isShowingChatController"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)chatItemsDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
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
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  char v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CKTranscriptCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("chat"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CKTranscriptCollectionViewControllerAccessibility axIsShowingChatController](self, "axIsShowingChatController");
  if (objc_msgSend(v6, "isEqual:", v7) && v8)
  {
    v23 = 0;
    objc_msgSend(v6, "safeValueForKey:", CFSTR("lastIncomingMessage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "sender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v10, "sender");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v10, "senderName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ((objc_msgSend(v10, "safeBoolForKey:", CFSTR("isTypingMessage")) & 1) != 0)
    {
      -[CKTranscriptCollectionViewControllerAccessibility setAxBuddyWasTyping:](self, "setAxBuddyWasTyping:", 1);
      if (!objc_msgSend(v14, "length"))
      {
        accessibilityLocalizedString(CFSTR("contact.typing.message"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_18;
        goto LABEL_17;
      }
      v15 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("contact.typing.message.with.name"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v16, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[CKTranscriptCollectionViewControllerAccessibility axBuddyWasTyping](self, "axBuddyWasTyping"))
        goto LABEL_18;
      -[CKTranscriptCollectionViewControllerAccessibility setAxBuddyWasTyping:](self, "setAxBuddyWasTyping:", 0);
      if (objc_msgSend(v14, "length"))
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("contact.stopped.typing.message.with.name"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v19, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        accessibilityLocalizedString(CFSTR("contact.stopped.typing.message"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC18]);
    }

    if (v17)
    {
LABEL_17:
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *MEMORY[0x24BDFECB0];
      v25[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAttributes:", v21);

      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v20);
    }
LABEL_18:

  }
  v22.receiver = self;
  v22.super_class = (Class)CKTranscriptCollectionViewControllerAccessibility;
  -[CKTranscriptCollectionViewControllerAccessibility chatItemsDidChange:](&v22, sel_chatItemsDidChange_, v4);

}

- (BOOL)axBuddyWasTyping
{
  return self->_axBuddyWasTyping;
}

- (void)setAxBuddyWasTyping:(BOOL)a3
{
  self->_axBuddyWasTyping = a3;
}

@end
