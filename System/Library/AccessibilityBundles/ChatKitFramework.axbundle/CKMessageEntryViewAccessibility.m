@implementation CKMessageEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessageEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", "{UIEdgeInsets=dddd}", "B", "B", "B", "B", "B", "@", "B", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("keyCommandSend:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("entryFieldCollapsed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("hasRecording"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("updateEntryView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("messageEntryRecordedAudioViewPressedDelete:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("loadRecordedAudioViewsIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("touchUpInsideSendButton:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuController"), CFSTR("isActionMenuVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("audioButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("recordedAudioView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("videoMessageRecordingViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("_presented"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryRecordedAudioView"), CFSTR("waveformImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuController"), CFSTR("actionMenuItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKRecordActionMenuItem"), CFSTR("CKActionMenuItemView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("arrowButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("arrowButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("browserButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("browserButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("collapsedPlaceholderLabelTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("conversation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("photoButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("shouldAllowImpactSend"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("inputDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("shouldShowAppStrip"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("sendButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("emojiButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("cancelButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("stopButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("sendAudioButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("presentAudioActionButtons"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("cancelButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("stopButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("sendAudioButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("showHintWithText:animatingReferenceButton:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("IMService"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("IMService"), CFSTR("iMessageService"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("sendButtonColor"), "c", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("sendingService"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKMessageEntryViewInputDelegate"), CFSTR("messageEntryViewHighLightInputButton:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryContentView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("appStrip"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBrowserSwitcherFooterView"), CFSTR("appStripCollectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKInlineReplyChatController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessageEntryView"), CFSTR("delegate"), "@", 0);

}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityIsMediaJoystickVisible
{
  return 0;
}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  BOOL v4;
  BOOL v5;

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("recordedAudioView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CKMessageEntryViewAccessibility _accessibilityIsMediaJoystickVisible](self, "_accessibilityIsMediaJoystickVisible");
  if (v3)
    v5 = 1;
  else
    v5 = v4;

  return v5;
}

- (void)_accessibilityApplyArrowLabel
{
  void *v2;
  id v3;

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("arrowButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("arrowButton"));
  accessibilityLocalizedString(CFSTR("arrow.button.text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityApplyPhotoLabel
{
  void *v2;
  void *v3;
  id v4;

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photoButton"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("photoButton"));
  accessibilityLocalizedString(CFSTR("photo.button.text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v2);

  accessibilityLocalizedString(CFSTR("photo.button.hint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v3);

}

- (void)_accessibilityApplyBrowserLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id location;

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("app.store.button.text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  accessibilityLocalizedString(CFSTR("messaging.apps.button.hint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v6);

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__CKMessageEntryViewAccessibility__accessibilityApplyBrowserLabel__block_invoke;
  v7[3] = &unk_2501B1D30;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "_setAccessibilityValueBlock:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

id __66__CKMessageEntryViewAccessibility__accessibilityApplyBrowserLabel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("shouldShowAppStrip"));

  if (v2)
    v3 = CFSTR("messaging.apps.visible");
  else
    v3 = CFSTR("messaging.apps.hidden");
  return accessibilityLocalizedString(v3);
}

- (void)_accessibilityApplyPlaceholderLabel
{
  void *v2;
  id v3;

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collpasedPlaceholderLabel"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  accessibilityLocalizedString(CFSTR("collapsed.placeholder.hint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityHint:", v2);

}

- (void)_accessibilityApplyAudioButtonLabel
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[CKMessageEntryViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("audioButton"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("axAudioButton"));
  accessibilityLocalizedString(CFSTR("audio.button.label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v2);

  accessibilityLocalizedString(CFSTR("audio.button.hint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v3);

  accessibilityLocalizedString(CFSTR("audio.button.hint.macos"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetElementHelp:", v4);

  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | *MEMORY[0x24BDF73B0]);
}

- (void)_accessibilityApplyCancelButtonLabel
{
  void *v2;
  id v3;

  -[CKMessageEntryViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("cancelButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("audio.button.cancel.label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilityApplyEmojiButtonLabel
{
  void *v2;
  id v3;

  -[CKMessageEntryViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("emojiButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("emoji.button.text"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

}

- (void)_accessibilitySendButtonLabel
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  -[CKMessageEntryViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_sendButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__CKMessageEntryViewAccessibility__accessibilitySendButtonLabel__block_invoke;
  v4[3] = &unk_2501B1D30;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "setAccessibilityLabelBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

id __64__CKMessageEntryViewAccessibility__accessibilitySendButtonLabel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("CKInlineReplyChatController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = CFSTR("send.button.reply.text");
  else
    v3 = CFSTR("send.button.text");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKMessageEntryViewAccessibility setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("MessageEntryView"));
  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_characterCountLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CharacterCount"));

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sendButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("sendButton"));

  -[CKMessageEntryViewAccessibility _accessibilitySendButtonLabel](self, "_accessibilitySendButtonLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyArrowLabel](self, "_accessibilityApplyArrowLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyPhotoLabel](self, "_accessibilityApplyPhotoLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyBrowserLabel](self, "_accessibilityApplyBrowserLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyPlaceholderLabel](self, "_accessibilityApplyPlaceholderLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyAudioButtonLabel](self, "_accessibilityApplyAudioButtonLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyCancelButtonLabel](self, "_accessibilityApplyCancelButtonLabel");
  -[CKMessageEntryViewAccessibility _accessibilityApplyEmojiButtonLabel](self, "_accessibilityApplyEmojiButtonLabel");
}

- (CKMessageEntryViewAccessibility)initWithFrame:(CGRect)a3 marginInsets:(UIEdgeInsets)a4 shouldAllowImpact:(BOOL)a5 shouldShowSendButton:(BOOL)a6 shouldShowSubject:(BOOL)a7 shouldShowPluginButtons:(BOOL)a8 shouldShowCharacterCount:(BOOL)a9 traitCollection:(id)a10 shouldDisableAttachments:(BOOL)a11 shouldUseNonEmojiKeyboard:(BOOL)a12 shouldUseNonHandwritingKeyboard:(BOOL)a13 shouldDisableKeyboardStickers:(BOOL)a14
{
  CKMessageEntryViewAccessibility *v14;
  int v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKMessageEntryViewAccessibility;
  HIWORD(v16) = __PAIR16__(a14, a13);
  LOWORD(v16) = __PAIR16__(a12, a11);
  v14 = -[CKMessageEntryViewAccessibility initWithFrame:marginInsets:shouldAllowImpact:shouldShowSendButton:shouldShowSubject:shouldShowPluginButtons:shouldShowCharacterCount:traitCollection:shouldDisableAttachments:shouldUseNonEmojiKeyboard:shouldUseNonHandwritingKeyboard:shouldDisableKeyboardStickers:](&v17, sel_initWithFrame_marginInsets_shouldAllowImpact_shouldShowSendButton_shouldShowSubject_shouldShowPluginButtons_shouldShowCharacterCount_traitCollection_shouldDisableAttachments_shouldUseNonEmojiKeyboard_shouldUseNonHandwritingKeyboard_shouldDisableKeyboardStickers_, a5, a6, a7, a8, a9, a10, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.top, a4.left, a4.bottom, a4.right, v16);
  -[CKMessageEntryViewAccessibility _accessibilityLoadAccessibilityInformation](v14, "_accessibilityLoadAccessibilityInformation");

  return v14;
}

- (void)updateEntryView
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility updateEntryView](&v18, sel_updateEntryView);
  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("sendButtonColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");
    v7 = v6;

    if (v6 == 6)
    {
      v8 = CFSTR("send.message.button.hint.business.chat");
    }
    else if (v6 == 1)
    {
      v8 = CFSTR("send.message.button.hint.imessage");
    }
    else
    {
      if (v6)
      {
        v9 = 0;
        goto LABEL_11;
      }
      v8 = CFSTR("send.message.button.hint.sms");
    }
    accessibilityLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
    v7 = -1;
  }
LABEL_11:
  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("sendingService"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("IMService")), "safeValueForKey:", CFSTR("iMessageService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != v12
    || !-[CKMessageEntryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldAllowImpactSend")))
  {

LABEL_19:
    goto LABEL_20;
  }

  if (v7 != 6)
  {
    if (AXForceTouchAvailableAndEnabled())
      v13 = CFSTR("send.button.hint.force");
    else
      v13 = CFSTR("send.button.hint.longpress");
    accessibilityLocalizedString(v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    v17 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v11 = v9;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:
  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sendButton"), v16, v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccessibilityHint:", v9);

  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_sendButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_accessibilitySetElementHelp:", v9);

}

- (void)messageEntryRecordedAudioViewPressedDelete:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility messageEntryRecordedAudioViewPressedDelete:](&v3, sel_messageEntryRecordedAudioViewPressedDelete_, a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __78__CKMessageEntryViewAccessibility_messageEntryRecordedAudioViewPressedDelete___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)loadRecordedAudioViewsIfNeeded
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility loadRecordedAudioViewsIfNeeded](&v2, sel_loadRecordedAudioViewsIfNeeded);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)arrowButtonTapped:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility arrowButtonTapped:](&v6, sel_arrowButtonTapped_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photoButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)browserButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility browserButtonTapped:](&v6, sel_browserButtonTapped_, a3);
  -[CKMessageEntryViewAccessibility _accessibilityApplyBrowserLabel](self, "_accessibilityApplyBrowserLabel");
  if (-[CKMessageEntryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("shouldShowAppStrip")))
  {
    -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("appStrip"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("appStripCollectionView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v5);

  }
  else
  {
    -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserButton"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v4);
  }

}

- (void)collapsedPlaceholderLabelTapped:(id)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility collapsedPlaceholderLabelTapped:](&v7, sel_collapsedPlaceholderLabelTapped_, a3);
  v4 = *MEMORY[0x24BDF72C8];
  -[CKMessageEntryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v6);

}

- (void)keyCommandSend:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  objc_super v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  CKMessageEntryViewAccessibility *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityResponderElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!UIAccessibilityIsVoiceOverRunning())
    goto LABEL_3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__CKMessageEntryViewAccessibility_keyCommandSend___block_invoke;
  v9[3] = &unk_2501B23D0;
  v9[4] = self;
  objc_msgSend(v5, "_accessibilityFindViewAncestor:startWithSelf:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    AXLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_2324ED000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring key command because I'm not the focused element: %@ %@", buf, 0x16u);
    }

  }
  else
  {
LABEL_3:
    v8.receiver = self;
    v8.super_class = (Class)CKMessageEntryViewAccessibility;
    -[CKMessageEntryViewAccessibility keyCommandSend:](&v8, sel_keyCommandSend_, v4);
  }

}

BOOL __50__CKMessageEntryViewAccessibility_keyCommandSend___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (void)touchUpInsideSendButton:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageEntryViewAccessibility;
  -[CKMessageEntryViewAccessibility touchUpInsideSendButton:](&v4, sel_touchUpInsideSendButton_, a3);
  -[CKMessageEntryViewAccessibility _postSentAnnouncementIfNeeded](self, "_postSentAnnouncementIfNeeded");
}

- (void)_postSentAnnouncementIfNeeded
{
  int v3;
  int v4;
  BOOL v5;
  UIAccessibilityNotifications v6;
  id v7;

  v3 = -[CKMessageEntryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("entryFieldCollapsed"));
  v4 = -[CKMessageEntryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasRecording"));
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = *MEMORY[0x24BDF71E8];
    accessibilityLocalizedString(CFSTR("sent"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v7);

  }
}

@end
