@implementation AXChatKitGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, &__block_literal_global_292, 0, &__block_literal_global_298);

    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_667, CFSTR("ChatKit AX Bundle"), CFSTR("ChatKit"), 1.0);

    AXPerformBlockOnMainThreadAfterDelay();
    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addHandler:forBundleName:", &__block_literal_global_676, CFSTR("MSMessageExtensionBalloonPlugin"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addHandler:forBundleName:", &__block_literal_global_693, CFSTR("HandwritingProvider"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_715, CFSTR("ElectricTouch"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addHandler:forFramework:", &__block_literal_global_725, CFSTR("ClipServices"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addHandler:forFramework:", &__block_literal_global_735, CFSTR("LinkPresentation"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addHandler:forBundleID:", &__block_literal_global_748, CFSTR("com.apple.Jellyfish.MessagesExtension"));

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addHandler:forBundleName:", &__block_literal_global_753, CFSTR("UIKit.axbundle"));

  }
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("CKBalloonView"));
  objc_msgSend(v2, "validateClass:", CFSTR("CKImageBalloonView"));
  objc_msgSend(v2, "validateClass:", CFSTR("CKMovieMediaObject"));
  objc_msgSend(v2, "validateClass:", CFSTR("CKImageMediaObject"));
  objc_msgSend(v2, "validateClass:", CFSTR("CKActionMenuWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("CKConversation"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("isMuted"), "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("hasUnreadMessages"), "B", 0);
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKActionMenuWindow"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("CKAttachmentBalloonView"), CFSTR("CKBalloonView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKEntity"), CFSTR("name"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("chatItems"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMChat"), CFSTR("lastIncomingMessage"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("subject"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("sender"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("plainBody"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("inlineAttachmentAttributesArray"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMHandle"), CFSTR("name"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMHandle"), CFSTR("nameAndEmail"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("CKConversationList"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKConversationList"), CFSTR("sharedConversationList"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationList"), CFSTR("conversationForExistingChat:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKRecipientSelectionController"), CFSTR("toField"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("CKConversationListCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("CKConversationListCell"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListCell"), CFSTR("_dateLabel"), "CKDateLabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListCell"), CFSTR("_summaryLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:", CFSTR("CKChatController"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("messageEntryViewSendButtonHit:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("_showPhotoPickerWithSourceType:"), "v", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("_showVCalViewerForMediaObject:"), "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKChatController"), CFSTR("_conversation"), "CKConversation");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKMessageEntryView"), CFSTR("_characterCountLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("CKMessageEntryView"), CFSTR("_sendButton"), "CKEntryViewButton");

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setValidationTargetName:", CFSTR("ChatKit AX Bundle"));
  objc_msgSend(v2, "setOverrideProcessName:", CFSTR("ChatKit"));
  objc_msgSend(v2, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  int v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextFieldAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UINavigationButtonAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIButtonAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UILabelAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_UIKBCompatInputViewAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIWindowAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITextEffectsWindowAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTextBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKImageBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAttachmentBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptPluginBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKRichLinkReplyPreviewBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAggregateAcknowledgmentBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKContactBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAudioBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKInlineStickerBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLocationShareBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAutoloopMovieBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKPhotoStackBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLinkBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptMessageCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEntryTextViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEntryContentViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBalloonTextViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptBalloonCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptTypingIndicatorCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEntryRecordedAudioViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAudioRecorderAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptCollectionViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKActionMenuItemImageViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKActionMenuItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKActionMenuWindowAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKActionMenuViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSpeakerButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKPresentationControllerWindowAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptStatusCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptLabelCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageAcknowledgmentPickerBarItemViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageAcknowledgmentPickerBarViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAggregateAcknowledgmentChatItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFullScreenBalloonViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("IMMessageAcknowledgmentChatItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKNicknameBannerViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKVideoCancelActionMenuItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_CKVideoMessageRecordingWindowAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKVideoMessageRecordingViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_MFAtomTextViewAccessibility__ChatKit__MessageUI"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIInputSetHostViewAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSharedAssetCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsChildViewControllerCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKGroupAcknowledgmentVotingViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAvatarTitleCollectionReusableViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAvatarPickerLayoutAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKUIBehaviorAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptGroupHeaderViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMacRecipientsControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAttachmentCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKRecipientSelectionControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKRecipientSelectionViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CAMShutterButtonAccessibility__ChatKit__CameraKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationListCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationListNewMessageCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationListNewMessageCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptDNDCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEntryViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEntryViewSnapshotAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEntryRichTextViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKEntryViewButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKChatControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKImageAttachmentItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLocationAttachmentItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMovieAttachmentItemAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptManagementNameFieldAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAvatarNavigationBarAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKCanvasBackButtonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFullScreenAppNavbarManagerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKCoreChatControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKHandwritingWindowAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKChatInputControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKHandwritingPresentationControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTUConversationBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKVideoPlayerBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKNavBarUnifiedCallButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAudioMessageRecordingViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AudioMessageRecordingAppendButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKEmbeddedRichLinkViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBrowserSwitcherViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBrowserSwitcherFooterViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBrowserCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFullscreenBrowserNavigationControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKExpandedAppViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKEffectPickerViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKUIPageControlAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKUICollectionViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsChatOptionsCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsChatOptionsCheckboxCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsContactsTableViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsSearchResultsTitleHeaderCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsLocationShareHeaderFooterViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsLocationShareCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsSeparatorCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDefaultPluginEntryViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIAccessibilityElementKBKeyChatKitAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIAccessibilityElementKBEmojiCategoryChatKitAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIKeyboardEmojiCollectionViewCellAccessibility__ChatKit__UIKit"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAvatarCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAvatarPickerViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAvatarContactNameCollectionReusableViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAppManagerViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKNotificationChatControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAppGrabberCloseButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAppGrabberViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFunCameraViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKNavbarCanvasViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKNavigationButtonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKNavigationBarCanvasViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKStickerDetailViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKStickerDetailCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLinkSearchControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLinkSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKPhotosSearchControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKPhotoSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLocationSearchControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLocationSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAttachmentsSearchControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAttachmentSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBrowserSwitcherCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMeCardNavigationControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSearchViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKHighlightsSearchControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationAvatarSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKLargeTitleAccessoryViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKDetailsSearchViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessagesControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKInlineReplyCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKInlineReplyChatControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKRecipientSearchListControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationListCollectionViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKComposeNavbarCanvasViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKPinnedConversationViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKPinnedConversationCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMentionSuggestionCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMentionSuggestionViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationListCollectionViewConversationCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKQuickActionSaveButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKConversationListAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageHighlightButtonAccessibility"), 1);
  AXProcessGetName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("MessagesTranscriptExtension"));

  if (v3)
    objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptExtensionViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessagePartHighlightBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTranscriptActionButtonCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMediaObjectBackedAssetAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKEditableSearchResultCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSyndicationPageViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSyndicationContentViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEditingBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMessageEditingViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKGroupCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKHyperlinkBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKEntryViewPlusButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSendMenuViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKSendMenuCollectionViewLayoutAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKAudioMessageBalloonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SendMenuCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKComposeRecipientSelectionControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKBalloonImageViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKStickerTranscriptCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("AppCardContainerViewControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKComposeSubscriptionSelectorButtonAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("NavbarConversationTitleAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKFullScreenBalloonViewControllerPhoneAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TapbackPickerCollectionViewCellAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TapbackPickerEmojiTailViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TapbackPickerCancelButtonViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMentionsUtilitiesAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKMentionsControllerAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("CKTapbackPickerBalloonParentViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TapbackPickerBalloonAccessoryViewAccessibility"), 1);
  objc_msgSend(v4, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SendMenuCollectionViewAccessibility"), 1);

}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDFE3F0]);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BE500F0];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_6;
    v9[3] = &__block_descriptor_40_e24_v16__0__NSNotification_8l;
    v9[4] = *(_QWORD *)(a1 + 32);
    v8 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, v7, v9);

  }
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "object");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_handleMessageReceived:", v3);

}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_7()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_677, &__block_literal_global_678, &__block_literal_global_680);

}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_8()
{
  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_9()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("MSMessageExtensionBalloonView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MSMessageExtensionBalloonLiveView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MSMessageExtensionBalloonLiveView"), CFSTR("payload"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("MSMessageExtensionDataSource"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MSMessageExtensionDataSource"), CFSTR("messagePayloadFromPluginPayload:"), "@", "@", 0);
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("MSMessageExtensionDataSource"), CFSTR("IMBalloonPluginDataSource"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMBalloonPluginDataSource"), CFSTR("payload"), "@", 0);

}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_11()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_694, &__block_literal_global_711, &__block_literal_global_712);

}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("HWBalloonDataSource"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWBalloonDataSource"), CFSTR("handwritingFromPayload"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("HWHandwritingItem"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWHandwritingItem"), CFSTR("drawing"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("DKDrawing"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DKDrawing"), CFSTR("strokes"), "@", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("HWPluginContentView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HWPluginContentView"), CFSTR("dataSource"), "@", 0);

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_13()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_15()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_716, &__block_literal_global_721, &__block_literal_global_722);

}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_16(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ETBalloonPluginDataSource"), CFSTR("createSessionMessages"), "@", 0);
  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_17()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_19()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_726, &__block_literal_global_731, &__block_literal_global_732);

}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_20(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("CPSClipURL"));
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CPSClipURL"), CFSTR("isSupported"), "B", 0);

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_21()
{
  return 1;
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_23()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_736, &__block_literal_global_744, &__block_literal_global_745);

}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_24(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("LPLinkView"), CFSTR("_metadata"), "LPLinkMetadata");
  objc_msgSend(v2, "validateClass:", CFSTR("LPApplicationIdentification"));

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_25()
{
  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_27()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_28()
{
  void *v0;
  id v1;

  v0 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.Jellyfish.MessagesExtension"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "loadAccessibilityBundleForBundle:didLoadCallback:", v1, 0);

}

void __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_29()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "performValidations:withPreValidationHandler:postValidationHandler:", &__block_literal_global_754, &__block_literal_global_761, &__block_literal_global_762);

}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_30(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("CKBalloonTextView"), CFSTR("UITextView"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("_accessibilityGetValue"), "@", 0);

  return 1;
}

uint64_t __46__AXChatKitGlue_accessibilityInitializeBundle__block_invoke_31()
{
  return 1;
}

+ (void)_handleMessageReceived:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  v3 = a3;
  AXPerformSafeBlock();
  v4 = (id)v31[5];

  _Block_object_dispose(&v30, 8);
  if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("isMuted")) & 1) == 0)
  {
    LOBYTE(v30) = 0;
    objc_msgSend(v3, "safeValueForKey:", CFSTR("lastIncomingMessage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v30)
      abort();
    objc_msgSend(v6, "sender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_6;
    objc_msgSend(v6, "sender");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      || (objc_msgSend(v6, "safeValueForKey:", CFSTR("sender")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "safeValueForKey:", CFSTR("nameAndEmail")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v8))
    {
LABEL_6:
      objc_msgSend(v6, "descriptionForPurpose:inChat:senderDisplayName:", 0, v3, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("message.from.format"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v13, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "fileTransferGUIDs", v11, CFSTR("__AXStringForVariablesSentinel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "length"))
      {
        objc_msgSend(MEMORY[0x24BE502E0], "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "transferForGUID:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "attributionInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", *MEMORY[0x24BE50DA0]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "length"))
        {
          __UIAXStringForVariables();
          v22 = objc_claimAutoreleasedReturnValue();

          v15 = (void *)v22;
        }

      }
      v23 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("message.received"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", v24, v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *MEMORY[0x24BDFECB0];
      v37[0] = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAttributes:", v27);

      v29 = v26;
      v28 = v26;
      AXPerformBlockOnMainThreadAfterDelay();

    }
  }

}

void __40__AXChatKitGlue__handleMessageReceived___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("CKConversationList")), "safeValueForKey:", CFSTR("sharedConversationList"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "conversationForExistingChat:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __40__AXChatKitGlue__handleMessageReceived___block_invoke_2(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

@end
