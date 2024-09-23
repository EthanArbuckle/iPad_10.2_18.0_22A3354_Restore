@implementation AXMobileMailGlue

+ (void)accessibilityInitializeBundle
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  __CFString *v8;
  __CFString *v9;

  if (!_Failover)
  {
    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_2;
    v7[3] = &unk_2502855E0;
    v8 = CFSTR("MobileMail");
    v9 = CFSTR("MobileMail AX Bundle");
    objc_msgSend(v2, "performValidations:withPreValidationHandler:postValidationHandler:safeCategoryInstallationHandler:", &__block_literal_global, v7, 0, &__block_literal_global_232);

    objc_msgSend(MEMORY[0x24BDFE4F8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "installSafeCategories:afterDelay:validationTargetName:overrideProcessName:", &__block_literal_global_337, CFSTR("MobileMail AX Bundle"), CFSTR("MobileMail"), 1.0);

    v4 = objc_msgSend(objc_allocWithZone((Class)AXMobileMailGlue), "init");
    v5 = (void *)_Failover;
    _Failover = v4;

    objc_msgSend(MEMORY[0x24BDFE480], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addHandler:forFramework:", &__block_literal_global_345, CFSTR("QuickLook"));

  }
}

uint64_t __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "validateClass:", CFSTR("MFWindow"));
  objc_msgSend(v2, "validateClass:", CFSTR("MailboxTableCell"));
  objc_msgSend(v2, "validateClass:", CFSTR("MailStatusBarView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MailStatusUpdateView"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFMailMessage"));
  objc_msgSend(v2, "validateClass:", CFSTR("MFMessage"));
  objc_msgSend(v2, "validateClass:", CFSTR("FlaggedMailboxController"));
  objc_msgSend(v2, "validateClass:", CFSTR("VIPMailboxController"));
  objc_msgSend(v2, "validateClass:isKindOfClass:", CFSTR("MFMailMessage"), CFSTR("MFMessage"));
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StackElement"), CFSTR("itemViewCreateIfNeeded:"), "@", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("StackElement"), CFSTR("item"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessage"), CFSTR("subject"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ECSubject"), CFSTR("subjectWithoutPrefix"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessage"), CFSTR("messageID"), "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageStatusIndicatorManager"), CFSTR("effectiveIndicatorOptions"), "Q", 0);
  objc_msgSend(v2, "validateClass:", CFSTR("FavoriteItem_SharedMailbox"));
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MailboxTableCell"), CFSTR("_textLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MailboxTableCell"), CFSTR("_detailTextLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceVariable:withType:", CFSTR("MailboxTableCell"), CFSTR("_unreadCountLabel"), "UILabel");
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreviousDraftPickerController"), CFSTR("viewDidAppear:"), "v", "B", 0);

  return 1;
}

uint64_t __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setOverrideProcessName:", v3);
  objc_msgSend(v4, "setValidationTargetName:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setDebugBuild:", 0);

  return AXPerformValidationChecks();
}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIMailToolbarButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PSSpecifierAccessibility__MobileMail__Preferences"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailStatusBarViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailStatusLabelViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailStatusProgressBarViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailboxTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UIViewAccessibility__MobileMail__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("StackElementAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ComposeButtonItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("PreviousDraftPickerControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFTiltedTabViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MessageStatusIndicatorManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MessageViewStatusIndicatorManagerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMessageContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ComposeNavigationControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileMail_UISwipeHandlerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFConversationViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMailboxFilterPickerControlAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("Mail_UIScrollViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFConversationItemFooterViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("_MFConversationViewCollectionViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailAppControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMessageViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ConversationHeaderContentViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFExpandedMessageCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFTriageInteractionAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMessageHeaderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFCollapsedMessageCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFSwipableCollectionViewLayoutAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MessageListCollectionViewCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MessageListViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ConversationViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("DockContainerViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("TiltedTabViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailActionCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailActionFlagColorCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MessageListSearchViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SelectedColorButtonAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailActionsViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MobileMail_UIDimmingViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMailboxFilterBarButtonItemAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFConversationItemHeaderBlockAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("SwipeOptionsControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("IndividualSwipeOptionControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("ComposePlaceholderViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UISplitViewControllerPanelImplViewAccessibility__MobileMail__UIKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailTrackingProtectionOnboardingViewControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailboxPickerOutlineControllerAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailboxOutlineCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MailMailboxGroupedPickerTableCellAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFArrowControlsViewAccessibility"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("UITableViewAccessibility__MobileMail__UIKit"), 1);

}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("WKContentViewAccessibility__MobileMail__WebKit"), 1);
  objc_msgSend(v2, "installSafeCategory:canInteractWithTargetClass:", CFSTR("MFMailDropBannerViewAccessibility"), 1);

}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_5()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint8_t v3[16];

  AXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_232774000, v0, OS_LOG_TYPE_DEFAULT, "Loading QuickLook", v3, 2u);
  }

  v1 = (void *)MEMORY[0x24BEBADF8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.quicklook"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "loadAccessibilityBundleForBundle:didLoadCallback:", v2, &__block_literal_global_352);

}

void __49__AXMobileMailGlue_accessibilityInitializeBundle__block_invoke_350(uint64_t a1, int a2)
{
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  AXLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl(&dword_232774000, v3, OS_LOG_TYPE_DEFAULT, "Loaded QuickLook %d", (uint8_t *)v4, 8u);
  }

}

@end
