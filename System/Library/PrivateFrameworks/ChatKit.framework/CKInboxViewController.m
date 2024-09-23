@implementation CKInboxViewController

- (CKInboxViewController)initWithConversationListController:(id)a3
{
  id v4;
  id v5;
  CKInboxViewController *v6;
  void *v7;
  CKInboxViewController *v8;
  objc_super v10;
  _QWORD v11[4];
  CKInboxViewController *v12;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CEA428]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__CKInboxViewController_initWithConversationListController___block_invoke;
  v11[3] = &unk_1E275AE18;
  v6 = self;
  v12 = v6;
  v7 = (void *)objc_msgSend(v5, "initWithSectionProvider:", v11);
  v10.receiver = v6;
  v10.super_class = (Class)CKInboxViewController;
  v8 = -[CKInboxViewController initWithCollectionViewLayout:](&v10, sel_initWithCollectionViewLayout_, v7);

  if (v8)
  {
    -[CKInboxViewController setConversationListController:](v8, "setConversationListController:", v4);
    -[CKInboxViewController updateBackButton](v8, "updateBackButton");
    -[CKInboxViewController setupCollectionView](v8, "setupCollectionView");
    v8->_shouldProcessBackButtonUpdates = 1;
  }

  return v8;
}

id __60__CKInboxViewController_initWithConversationListController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "wantsCollapsedAppearance"))
    v6 = 2;
  else
    v6 = 3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA400]), "initWithAppearance:", v6);
  if (objc_msgSend(*(id *)(a1 + 32), "_primarySectionIndex") == a2 && CKIsRunningInMacCatalyst()
    || objc_msgSend(*(id *)(a1 + 32), "_categoriesSectionIndex") == a2)
  {
    objc_msgSend(v7, "setHeaderMode:", 1);
  }
  else if ((objc_msgSend(*(id *)(a1 + 32), "shouldHideInboxFooterTextView") & 1) == 0
         && objc_msgSend(*(id *)(a1 + 32), "_lastSectionIndex") == a2)
  {
    objc_msgSend(v7, "setFooterMode:", 1);
  }
  objc_msgSend(MEMORY[0x1E0CEA1E8], "sectionWithListConfiguration:layoutEnvironment:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_primarySectionIndex") == a2 && !CKIsRunningInMacCatalyst())
  {
    objc_msgSend(v8, "contentInsets");
    v10 = v9;
    objc_msgSend(v8, "contentInsets");
    v12 = v11;
    objc_msgSend(v8, "contentInsets");
    objc_msgSend(v8, "setContentInsets:", 10.0, v10, v12);
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFNotificationCenter *DarwinNotifyCenter;
  CKInboxViewController *v16;
  void *v17;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)CKInboxViewController;
  -[CKInboxViewController viewDidLoad](&v18, sel_viewDidLoad);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInboxViewController setTitle:](self, "setTitle:", v4);

  v5 = CKIsRunningInMacCatalyst();
  -[CKInboxViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    objc_msgSend(v7, "setPrefersLargeTitles:", 0);

    -[CKInboxViewController navigationItem](self, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);

    v10 = objc_alloc_init(MEMORY[0x1E0CEA7B0]);
    v19 = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleTextAttributes:", v12);

    objc_msgSend(v10, "configureWithTransparentBackground");
    -[CKInboxViewController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStandardAppearance:", v10);

  }
  else
  {
    objc_msgSend(v7, "setPrefersLargeTitles:", 1);

    -[CKInboxViewController navigationItem](self, "navigationItem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLargeTitleDisplayMode:", 1);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__chatUnreadCountDidChange_, *MEMORY[0x1E0D354F0], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__chatUnreadCountDidChange_, CFSTR("CKConversationListChangedNotification"), 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__chatUnreadCountDidChange_, *MEMORY[0x1E0D354E0], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__conversationListDidFinishSorting_, CFSTR("CKConversationListDidFinishSorting"), 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__messageFilteringEnabledDidChange_, CKMessageFilteringChangedNotification[0], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__spamFilteringStateChanged, CKMessageSpamFilteringChangedNotification, 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__contentSizeCategoryChanged, *MEMORY[0x1E0CEB3F0], 0);
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__localeDidChange, *MEMORY[0x1E0C99720], 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v16 = self;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, (CFNotificationCallback)_SMSSubClassificationParamsUpdated, CFSTR("CKSMSFilterExtensionParamsUpdateDistributedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x1E0D39850], "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addDelegate:", v16);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CKInboxViewController;
  -[CKInboxViewController viewWillAppear:](&v13, sel_viewWillAppear_, a3);
  -[CKInboxViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[CKInboxViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setToolbarHidden:animated:", 1, 1);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInboxViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupNavBarAppearanceWithNavigationController:withBackgroundColor:", v8, v9);

  -[CKInboxViewController reloadCollectionViewData](self, "reloadCollectionViewData");
  self->_isVisible = 1;
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D385A8];
  v14[0] = CFSTR("actionType");
  v14[1] = CFSTR("fromView");
  v15[0] = CFSTR("ViewedInbox");
  v15[1] = CFSTR("InboxView");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "trackEvent:withDictionary:", v11, v12);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKInboxViewController;
  -[CKInboxViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (-[CKInboxViewController wantsCollapsedAppearance](self, "wantsCollapsedAppearance"))
  {
    -[CKInboxViewController conversationListController](self, "conversationListController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilterMode:", 1);

    -[CKInboxViewController _conversationList](self, "_conversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "releaseWasKnownSenderHold");

    -[CKInboxViewController _conversationList](self, "_conversationList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateConversationsWasKnownSender");

    -[CKInboxViewController _conversationList](self, "_conversationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearHoldInUnreadFilter");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInboxViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setupNavBarAppearanceWithNavigationController:", v6);

  v7.receiver = self;
  v7.super_class = (Class)CKInboxViewController;
  -[CKInboxViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  self->_isVisible = 0;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  uint64_t v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  _BOOL8 v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CKInboxViewController;
  -[CKInboxViewController viewDidLayoutSubviews](&v40, sel_viewDidLayoutSubviews);
  if (!-[CKInboxViewController shouldHideInboxFooterTextView](self, "shouldHideInboxFooterTextView"))
  {
    -[CKInboxViewController collectionView](self, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentInset");
    v5 = v4;
    v7 = v6;
    v9 = v8;

    -[CKInboxViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentInset:", v5, v7, 25.0, v9);

    -[CKInboxViewController collectionView](self, "collectionView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = (uint64_t)v12;

    -[CKInboxViewController collectionView](self, "collectionView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeAreaInsets");
    v16 = v15;
    -[CKInboxViewController collectionView](self, "collectionView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safeAreaInsets");
    v19 = (uint64_t)(v16 + v18);

    -[CKInboxViewController pinnedFooterTextView](self, "pinnedFooterTextView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInboxViewController collectionView](self, "collectionView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bounds");
    objc_msgSend(v20, "sizeThatFits:", (double)(v13 - v19), v22);
    v24 = v23;

    -[CKInboxViewController scrollingFooterTextView](self, "scrollingFooterTextView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sizeToFit");

    -[CKInboxViewController collectionView](self, "collectionView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "contentSize");
    v28 = v27;
    -[CKInboxViewController scrollingFooterTextView](self, "scrollingFooterTextView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = (uint64_t)(v28 - v30);

    -[CKInboxViewController collectionView](self, "collectionView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "adjustedContentInset");
    v34 = v33 + 25.0;

    -[CKInboxViewController collectionView](self, "collectionView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "visibleSize");
    v37 = v36 - (double)(2 * v31) - (double)(uint64_t)v34;

    v38 = (double)(uint64_t)v37;
    v39 = v24 > v38;
    -[UITextView setHidden:](self->_scrollingFooterTextView, "setHidden:", v24 <= v38);
    -[UITextView setHidden:](self->_pinnedFooterTextView, "setHidden:", v39);
  }
}

- (void)prepareForSuspend
{
  self->_shouldProcessBackButtonUpdates = 0;
}

- (void)prepareForResume
{
  self->_shouldProcessBackButtonUpdates = 1;
  -[CKInboxViewController updateBackButton](self, "updateBackButton");
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[3];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Selected index path: %@", buf, 0xCu);
    }

  }
  -[CKInboxViewController initiallySelectedCell](self, "initiallySelectedCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelected:", 0);

  -[CKInboxViewController setInitiallySelectedCell:](self, "setInitiallySelectedCell:", 0);
  v10 = -[CKInboxViewController _filterModeForIndexPath:](self, "_filterModeForIndexPath:", v7);
  -[CKInboxViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "inboxViewController:didSelectFilterMode:", self, v10);

  -[CKInboxViewController updateBackButton](self, "updateBackButton");
  v12 = objc_msgSend(MEMORY[0x1E0D399F8], "conversationFilterModeForMessageFilter:", v10);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("ChoseFilter");
  v16 = CFSTR("actionType");
  v17 = CFSTR("filterType");
  CKConversationListFilterModeStringValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  v18 = CFSTR("fromView");
  v19[2] = CFSTR("InboxView");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v16, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEvent:withDictionary:", *MEMORY[0x1E0D385A8], v15, v16, v17);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a4;
  v7 = a5;
  if (!-[CKInboxViewController wantsCollapsedAppearance](self, "wantsCollapsedAppearance"))
  {
    -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifierForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "filterMode");
    -[CKInboxViewController conversationListController](self, "conversationListController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "filterMode");

    if (v10 == v12)
    {
      objc_msgSend(v13, "setSelected:", 1);
      -[CKInboxViewController setInitiallySelectedCell:](self, "setInitiallySelectedCell:", v13);
    }
    else
    {
      objc_msgSend(v13, "setSelected:", 0);
    }

  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("prefs:root=MESSAGES&path=JUNK_CONVERSATIONS_BUTTON"));
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openSensitiveURL:withOptions:", v6, 0);

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D385A8];
  v12[0] = CFSTR("actionType");
  v12[1] = CFSTR("fromView");
  v13[0] = CFSTR("JumpToJunkInbox");
  v13[1] = CFSTR("InboxView");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackEvent:withDictionary:", v9, v10);

  return 0;
}

- (id)_unreadCountStringForIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;

  v4 = -[CKInboxViewController _filterModeForIndexPath:](self, "_filterModeForIndexPath:", a3);
  -[CKInboxViewController _conversationList](self, "_conversationList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unreadCountForFilterMode:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "__ck_localizedString");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E276D870;
  }

  return v9;
}

- (unint64_t)_filterModeForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifierForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "filterMode");
  return v7;
}

- (UITextView)pinnedFooterTextView
{
  _BOOL4 v3;
  UITextView *pinnedFooterTextView;
  UITextView *v5;
  UITextView *v6;
  UITextView *v7;
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
  void *v22;
  void *v23;

  v3 = -[CKInboxViewController shouldHideInboxFooterTextView](self, "shouldHideInboxFooterTextView");
  pinnedFooterTextView = self->_pinnedFooterTextView;
  if (v3)
  {
    -[UITextView removeFromSuperview](pinnedFooterTextView, "removeFromSuperview");
    v5 = 0;
  }
  else
  {
    if (!pinnedFooterTextView)
    {
      -[CKInboxViewController footerTextView](self, "footerTextView");
      v6 = (UITextView *)objc_claimAutoreleasedReturnValue();
      v7 = self->_pinnedFooterTextView;
      self->_pinnedFooterTextView = v6;

      -[CKInboxViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_pinnedFooterTextView);

      -[UITextView bottomAnchor](self->_pinnedFooterTextView, "bottomAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInboxViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeAreaLayoutGuide");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "constraintEqualToAnchor:constant:", v12, -25.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setActive:", 1);

      -[UITextView widthAnchor](self->_pinnedFooterTextView, "widthAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInboxViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "safeAreaLayoutGuide");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "widthAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      -[UITextView centerXAnchor](self->_pinnedFooterTextView, "centerXAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInboxViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeAreaLayoutGuide");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "centerXAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setActive:", 1);

      pinnedFooterTextView = self->_pinnedFooterTextView;
    }
    v5 = pinnedFooterTextView;
  }
  return v5;
}

- (UITextView)scrollingFooterTextView
{
  _BOOL4 v3;
  UITextView *scrollingFooterTextView;
  UITextView *v5;
  UITextView *v6;
  UITextView *v7;

  v3 = -[CKInboxViewController shouldHideInboxFooterTextView](self, "shouldHideInboxFooterTextView");
  scrollingFooterTextView = self->_scrollingFooterTextView;
  if (v3)
  {
    -[UITextView removeFromSuperview](scrollingFooterTextView, "removeFromSuperview");
    v5 = 0;
  }
  else
  {
    if (!scrollingFooterTextView)
    {
      -[CKInboxViewController footerTextView](self, "footerTextView");
      v6 = (UITextView *)objc_claimAutoreleasedReturnValue();
      v7 = self->_scrollingFooterTextView;
      self->_scrollingFooterTextView = v6;

      scrollingFooterTextView = self->_scrollingFooterTextView;
    }
    v5 = scrollingFooterTextView;
  }
  return v5;
}

- (BOOL)shouldHideInboxFooterTextView
{
  return !CKIsBlackholeEnabled();
}

- (id)footerTextView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FILTER_JUNK_LINK"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("FILTER_FOOTER_TEXT_%@"), &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  if (v10 == 1)
    v11 = CFSTR("\u200F");
  else
    v11 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v12);
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setAlignment:", 1);
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC1178], v14, 0, objc_msgSend(v13, "length"));
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v15, 0, objc_msgSend(v13, "length"));
  objc_msgSend(v13, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "rangeOfString:", v4);
  v19 = v18;

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E0DC1160], &stru_1E276D870, v17, v19);
  v20 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB548]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAttribute:value:range:", v20, v21, 0, objc_msgSend(v13, "length"));

  v22 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v23 = (void *)objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v23, "_setInteractiveTextSelectionDisabled:", 1);
  objc_msgSend(v23, "setScrollEnabled:", 0);
  objc_msgSend(v23, "setEditable:", 0);
  objc_msgSend(v23, "setSelectable:", 1);
  objc_msgSend(v23, "setUserInteractionEnabled:", 1);
  objc_msgSend(v23, "setDelegate:", self);
  objc_msgSend(v23, "textDragInteraction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEnabled:", 0);

  objc_msgSend(v23, "setClipsToBounds:", 0);
  objc_msgSend(v23, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v23, "setAttributedText:", v13);
  -[CKInboxViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "backgroundColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setBackgroundColor:", v26);

  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v23;
}

- (NSArray)primaryCellsData
{
  NSArray *primaryCellsData;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;

  primaryCellsData = self->_primaryCellsData;
  if (!primaryCellsData)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    +[CKInboxCellData allMessagesCellData](CKInboxCellData, "allMessagesCellData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    if (CKMessageFilteringEnabled())
    {
      +[CKInboxCellData knownSendersCellData](CKInboxCellData, "knownSendersCellData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

      +[CKInboxCellData unknownSendersCellData](CKInboxCellData, "unknownSendersCellData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

    }
    -[CKInboxViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "inboxViewController:shouldShowFilterMode:", self, 8);

    if (v9)
    {
      +[CKInboxCellData unreadMessagesCellData](CKInboxCellData, "unreadMessagesCellData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

    }
    v11 = (NSArray *)objc_msgSend(v4, "copy");
    v12 = self->_primaryCellsData;
    self->_primaryCellsData = v11;

    primaryCellsData = self->_primaryCellsData;
  }
  return primaryCellsData;
}

- (NSArray)categoriesCellsDataArray
{
  CKInboxViewController *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  CKInboxCellData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CKInboxCellData *v15;
  uint64_t v16;
  NSArray *categoriesCellsDataArray;
  CKInboxViewController *v19;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v2 = self;
  v27 = *MEMORY[0x1E0C80C00];
  if (!-[NSArray count](self->_categoriesCellsDataArray, "count"))
  {
    v19 = v2;
    v21 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v23 != v5)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v8 = [CKInboxCellData alloc];
          v9 = (void *)MEMORY[0x1E0CEA638];
          objc_msgSend(v7, "iconName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "_systemImageNamed:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          IMSharedUtilitiesFrameworkBundle();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "folderName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E276D870, CFSTR("IMSharedUtilities"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[CKInboxCellData initWithImage:title:filterMode:](v8, "initWithImage:title:filterMode:", v11, v14, objc_msgSend(v7, "filterMode"));

          objc_msgSend(v21, "addObject:", v15);
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v4);
    }

    v16 = objc_msgSend(v21, "copy");
    v2 = v19;
    categoriesCellsDataArray = v19->_categoriesCellsDataArray;
    v19->_categoriesCellsDataArray = (NSArray *)v16;

  }
  return v2->_categoriesCellsDataArray;
}

- (NSArray)junkCellsDataArray
{
  void *v3;
  void **v4;
  NSArray *v6;
  NSArray *junkCellsDataArray;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!-[CKInboxViewController _shouldShowJunkCell](self, "_shouldShowJunkCell"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  if (!self->_junkCellsDataArray)
  {
    if (IMIsOscarEnabled())
    {
      +[CKInboxCellData oscarCellData](CKInboxCellData, "oscarCellData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = v3;
      v4 = (void **)v10;
    }
    else if (CKIsBlackholeEnabled())
    {
      +[CKInboxCellData blackholeJunkCellData](CKInboxCellData, "blackholeJunkCellData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v3;
      v4 = &v9;
    }
    else
    {
      +[CKInboxCellData junkCellData](CKInboxCellData, "junkCellData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v3;
      v4 = &v8;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1, v8, v9, v10[0]);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    junkCellsDataArray = self->_junkCellsDataArray;
    self->_junkCellsDataArray = v6;

  }
  return self->_junkCellsDataArray;
}

- (BOOL)_shouldShowJunkCell
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;

  v3 = IMIsOscarEnabled();
  -[CKInboxViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = 9;
  else
    v6 = 6;
  v7 = objc_msgSend(v4, "inboxViewController:shouldShowFilterMode:", self, v6);

  return v7;
}

- (NSArray)recentlyDeletedCellDataArray
{
  void *v3;
  NSArray *v4;
  NSArray *recentlyDeletedCellDataArray;
  void *v6;
  int v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (!self->_recentlyDeletedCellDataArray)
  {
    +[CKInboxCellData recentlyDeletedCellData](CKInboxCellData, "recentlyDeletedCellData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    recentlyDeletedCellDataArray = self->_recentlyDeletedCellDataArray;
    self->_recentlyDeletedCellDataArray = v4;

  }
  -[CKInboxViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "inboxViewController:shouldShowFilterMode:", self, 7);

  if (v7)
    return self->_recentlyDeletedCellDataArray;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)setupCollectionView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];

  -[CKInboxViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  -[CKInboxViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);

  -[CKInboxViewController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsHorizontalScrollIndicator:", 0);

  v6 = (void *)MEMORY[0x1E0CEA470];
  v7 = objc_opt_class();
  v8 = MEMORY[0x1E0C809B0];
  v9 = *MEMORY[0x1E0CEB3B8];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __44__CKInboxViewController_setupCollectionView__block_invoke;
  v30[3] = &unk_1E275AE40;
  v30[4] = self;
  objc_msgSend(v6, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v7, v9, v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v8;
  v29[1] = 3221225472;
  v29[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_145;
  v29[3] = &unk_1E275AE68;
  v29[4] = self;
  objc_msgSend(MEMORY[0x1E0CEA420], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CEA470];
  v13 = objc_opt_class();
  v14 = *MEMORY[0x1E0CEB3B0];
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_2;
  v28[3] = &unk_1E275AE40;
  v28[4] = self;
  objc_msgSend(v12, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v13, v14, v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CEA440]);
  -[CKInboxViewController collectionView](self, "collectionView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_3;
  v26[3] = &unk_1E275AE90;
  v27 = v11;
  v18 = v11;
  v19 = (void *)objc_msgSend(v16, "initWithCollectionView:cellProvider:", v17, v26);
  -[CKInboxViewController setCollectionViewDataSource:](self, "setCollectionViewDataSource:", v19);

  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __44__CKInboxViewController_setupCollectionView__block_invoke_4;
  v23[3] = &unk_1E275AEB8;
  v24 = v15;
  v25 = v10;
  v21 = v10;
  v22 = v15;
  objc_msgSend(v20, "setSupplementaryViewProvider:", v23);

}

void __44__CKInboxViewController_setupCollectionView__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v6 = a2;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == objc_msgSend(*(id *)(a1 + 32), "_primarySectionIndex") && CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA718], "prominentInsetGroupedHeaderConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v11);

    objc_msgSend(v6, "setContentConfiguration:", v9);
  }
  else
  {
    v12 = objc_msgSend(v7, "section");
    if (v12 == objc_msgSend(*(id *)(a1 + 32), "_categoriesSectionIndex"))
    {
      objc_msgSend(MEMORY[0x1E0CEA718], "groupedHeaderConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_getSpamExtensionName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v13, "textProperties");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "font");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_setHeaderAttributedStringForFont:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setAttributedText:", v18);

        -[CKInboxViewController _setCommonTextProperties:](*(_QWORD *)(a1 + 32), v13);
      }
      else
      {
        IMLogHandleForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __44__CKInboxViewController_setupCollectionView__block_invoke_cold_1(v19);

      }
      objc_msgSend(v6, "setContentConfiguration:", v13);

    }
  }

}

- (void)_setCommonTextProperties:(uint64_t)a1
{
  NSString *v3;
  _BOOL4 IsAccessibilityCategory;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "preferredContentSizeCategory");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

    objc_msgSend(v10, "textProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (IsAccessibilityCategory)
    {
      objc_msgSend(v5, "setNumberOfLines:", 0);
    }
    else
    {
      objc_msgSend(v5, "setNumberOfLines:", 1);

      objc_msgSend(v10, "textProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLineBreakMode:", 4);

      objc_msgSend(v10, "textProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

      objc_msgSend(v10, "textProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMinimumScaleFactor:", 0.949999988);

      objc_msgSend(v10, "textProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsDefaultTighteningForTruncation:", 1);
    }

  }
}

void __44__CKInboxViewController_setupCollectionView__block_invoke_145(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v19 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(v19, "defaultContentConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "defaultConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "imageWithSymbolConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setImage:", v12);

  objc_msgSend(v8, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setText:", v13);
  objc_msgSend(v19, "setContentConfiguration:", v9);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CEA3F0]);
  objc_msgSend(*(id *)(a1 + 32), "_unreadCountStringForIndexPath:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithText:", v16);
  objc_msgSend(v14, "addObject:", v17);

  if (objc_msgSend(*(id *)(a1 + 32), "wantsCollapsedAppearance"))
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CEA3E8]);
    objc_msgSend(v14, "addObject:", v18);

  }
  objc_msgSend(v19, "setAccessories:", v14);
  objc_msgSend(v19, "setIndentationLevel:", objc_msgSend(*(id *)(a1 + 32), "_folderIndentationAtIndexPath:", v7));

}

void __44__CKInboxViewController_setupCollectionView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  void *v7;
  id v8;
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  v6 = objc_msgSend(a4, "section");
  if (v6 == objc_msgSend(*(id *)(a1 + 32), "_lastSectionIndex"))
  {
    objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "superview");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v27)
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeFromSuperview");

      objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "addSubview:", v10);

      objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "leadingAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "leadingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setActive:", 1);

      objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "trailingAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "trailingAnchor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setActive:", 1);

      objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 25.0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setActive:", 1);

      objc_msgSend(*(id *)(a1 + 32), "scrollingFooterTextView");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bottomAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bottomAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setActive:", 1);

    }
  }

}

uint64_t __44__CKInboxViewController_setupCollectionView__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
}

id __44__CKInboxViewController_setupCollectionView__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = 40;
  if (*MEMORY[0x1E0CEB3B0] == a3)
    v3 = 32;
  objc_msgSend(a2, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *(_QWORD *)(a1 + v3));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)reloadCollectionViewData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v17[0] = CFSTR("CKInboxViewPrimarySectionID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendSectionsWithIdentifiers:", v4);

  -[CKInboxViewController primaryCellsData](self, "primaryCellsData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("CKInboxViewPrimarySectionID"));

  if (-[CKInboxViewController _spamFilteringEnabled](self, "_spamFilteringEnabled"))
  {
    v16 = CFSTR("CKInboxViewCategoriesSectionID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v6);

    -[CKInboxViewController categoriesCellsDataArray](self, "categoriesCellsDataArray");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, CFSTR("CKInboxViewCategoriesSectionID"));

  }
  -[CKInboxViewController junkCellsDataArray](self, "junkCellsDataArray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v15 = CFSTR("CKInboxViewJunkSectionID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v9);

    objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, CFSTR("CKInboxViewJunkSectionID"));
  }
  -[CKInboxViewController recentlyDeletedCellDataArray](self, "recentlyDeletedCellDataArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v14 = CFSTR("kCKInboxViewRecentlyDeletedSectionID");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendSectionsWithIdentifiers:", v11);

    objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v10, CFSTR("kCKInboxViewRecentlyDeletedSectionID"));
  }
  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySnapshot:animatingDifferences:", v3, self->_isVisible);

  -[CKInboxViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reloadData");

}

- (void)updateBackButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  CKBackBarButtonItem *v13;
  void *v14;
  void *v15;
  void *v16;
  CKBackBarButtonItem *v17;
  uint8_t buf[16];

  if (self->_shouldProcessBackButtonUpdates)
  {
    -[CKInboxViewController conversationListController](self, "conversationListController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "filterMode");

    if (v4 == 1)
      goto LABEL_13;
    -[CKInboxViewController _conversationList](self, "_conversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unreadCountForFilterMode:", 1);

    -[CKInboxViewController conversationListController](self, "conversationListController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "filterMode") == 6)
    {
      v8 = 0;
    }
    else
    {
      -[CKInboxViewController _conversationList](self, "_conversationList");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInboxViewController conversationListController](self, "conversationListController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "unreadCountForFilterMode:", objc_msgSend(v11, "filterMode"));

    }
    v12 = v6 - v8;
    if (v12 < 1)
    {
LABEL_13:
      v13 = [CKBackBarButtonItem alloc];
      CKFrameworkBundle();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("FILTERS_BACK_BUTTON"), &stru_1E276D870, CFSTR("ChatKit"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CKBackBarButtonItem initWithTitle:](v13, "initWithTitle:", v15);

    }
    else
    {
      v17 = -[CKBackBarButtonItem initWithUnreadCount:]([CKBackBarButtonItem alloc], "initWithUnreadCount:", v12);
    }
    -[CKInboxViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackBarButtonItem:", v17);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "ignoring back button updates", buf, 2u);
    }

  }
}

- (int64_t)_primarySectionIndex
{
  void *v2;
  int64_t v3;

  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexForSectionIdentifier:", CFSTR("CKInboxViewPrimarySectionID"));

  return v3;
}

- (int64_t)_categoriesSectionIndex
{
  void *v2;
  int64_t v3;

  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexForSectionIdentifier:", CFSTR("CKInboxViewCategoriesSectionID"));

  return v3;
}

- (int64_t)_junkSectionIndex
{
  void *v2;
  int64_t v3;

  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexForSectionIdentifier:", CFSTR("CKInboxViewJunkSectionID"));

  return v3;
}

- (int64_t)_recentlyDeletedSectionIndex
{
  void *v2;
  int64_t v3;

  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexForSectionIdentifier:", CFSTR("kCKInboxViewRecentlyDeletedSectionID"));

  return v3;
}

- (int64_t)_lastSectionIndex
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CKInboxViewController collectionViewDataSource](self, "collectionViewDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInboxViewController collectionView](self, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "numberOfSectionsInCollectionView:", v4) - 1;

  return v5;
}

- (int64_t)_folderIndentationAtIndexPath:(id)a3
{
  return -[CKInboxViewController _filterModeForIndexPath:](self, "_filterModeForIndexPath:", a3) > 0xF;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (void)_chatUnreadCountDidChange:(id)a3
{
  id v3;

  -[CKInboxViewController _conversationList](self, "_conversationList", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConversationListsAndSortIfEnabled");

}

- (void)_conversationListDidFinishSorting:(id)a3
{
  if (self->_isVisible)
    -[CKInboxViewController reloadCollectionViewData](self, "reloadCollectionViewData", a3);
  else
    -[CKInboxViewController updateBackButton](self, "updateBackButton", a3);
}

- (void)_messageFilteringEnabledDidChange:(id)a3
{
  id v4;
  NSArray *primaryCellsData;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = a3;
  primaryCellsData = self->_primaryCellsData;
  self->_primaryCellsData = 0;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "_messageFilteringEnabledDidChange", buf, 2u);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CKInboxViewController__messageFilteringEnabledDidChange___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__CKInboxViewController__messageFilteringEnabledDidChange___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D399F8], "updateSMSFilterExtensionParams");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "_updateCategoriesCellsDataArray");
  objc_msgSend(*(id *)(a1 + 32), "_conversationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConversationListsAndSortIfEnabled");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (void)_spamFilteringStateChanged
{
  NSArray *primaryCellsData;
  NSArray *categoriesCellsDataArray;
  NSArray *junkCellsDataArray;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  primaryCellsData = self->_primaryCellsData;
  self->_primaryCellsData = 0;

  categoriesCellsDataArray = self->_categoriesCellsDataArray;
  self->_categoriesCellsDataArray = 0;

  junkCellsDataArray = self->_junkCellsDataArray;
  self->_junkCellsDataArray = 0;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "_spamFilteringStateChanged", v11, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D399F8], "updateSMSFilterExtensionParams");
  v7 = -[CKInboxViewController _updateCategoriesCellsDataArray](self, "_updateCategoriesCellsDataArray");
  -[CKInboxViewController _conversationList](self, "_conversationList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateConversationListsAndSortIfEnabled");

  -[CKInboxViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

  -[CKInboxViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

}

- (id)_updateCategoriesCellsDataArray
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CKInboxCellData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CKInboxCellData *v14;
  NSArray *v15;
  NSArray *categoriesCellsDataArray;
  NSArray *v17;
  id obj;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(MEMORY[0x1E0D399F8], "fetchSMSFilterExtensionParams");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v23;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v23 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v5);
        v7 = [CKInboxCellData alloc];
        v8 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(v6, "iconName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_systemImageNamed:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IMSharedUtilitiesFrameworkBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "folderName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E276D870, CFSTR("IMSharedUtilities"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CKInboxCellData initWithImage:title:filterMode:](v7, "initWithImage:title:filterMode:", v10, v13, objc_msgSend(v6, "filterMode"));

        objc_msgSend(v21, "addObject:", v14);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v3);
  }

  v15 = (NSArray *)objc_msgSend(v21, "copy");
  categoriesCellsDataArray = self->_categoriesCellsDataArray;
  self->_categoriesCellsDataArray = v15;

  v17 = self->_categoriesCellsDataArray;
  return v17;
}

- (void)_contentSizeCategoryChanged
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CKInboxViewController__contentSizeCategoryChanged__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __52__CKInboxViewController__contentSizeCategoryChanged__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (BOOL)_spamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (id)_getSpamExtensionName
{
  JUMPOUT(0x193FF3624);
}

- (void)_localeDidChange
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "_localeDidChange", v4, 2u);
    }

  }
  -[CKInboxViewController _spamFilteringStateChanged](self, "_spamFilteringStateChanged");
}

- (void)focusStateDidChange
{
  void *v3;
  void *v4;
  id v5;

  -[CKInboxViewController _conversationList](self, "_conversationList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateConversationListsAndSortIfEnabled");

  -[CKInboxViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  -[CKInboxViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

}

- (id)_setHeaderAttributedStringForFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  -[CKInboxViewController _getSpamExtensionName](self, "_getSpamExtensionName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[CKInboxViewController _getHeaderStringForExtension:](self, "_getHeaderStringForExtension:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v6);
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedUppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "rangeOfString:", v9);
    v12 = v11;

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = *MEMORY[0x1E0DC1138];
      objc_msgSend(MEMORY[0x1E0DC1350], "__ck_emphasizedFontFromFont:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addAttribute:value:range:", v13, v14, v10, v12);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_getHeaderStringForExtension:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  CKFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FILTERED_BY_APP_NAME"), &stru_1E276D870, CFSTR("ChatKit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceLayoutDirection");

  if (v9 == 1)
    v10 = CFSTR("\u200F");
  else
    v10 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v10, "stringByAppendingString:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedUppercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)wantsCollapsedAppearance
{
  BOOL v3;
  void *v4;
  char v5;
  char v6;
  void *v7;

  v3 = -[CKInboxViewController _wantsThreeColumnLayout](self, "_wantsThreeColumnLayout");
  -[CKInboxViewController splitViewController](self, "splitViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCollapsed");
  v6 = !v3 | v5;
  if (!v3 && (v5 & 1) == 0)
  {
    -[CKInboxViewController splitViewController](self, "splitViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "displayMode") == 2;

  }
  return v6;
}

- (BOOL)_wantsThreeColumnLayout
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUniversalThreeColumn");

  return v3;
}

- (CKInboxViewControllerDelegate)delegate
{
  return (CKInboxViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKConversationListControllerProtocol)conversationListController
{
  return self->_conversationListController;
}

- (void)setConversationListController:(id)a3
{
  objc_storeStrong((id *)&self->_conversationListController, a3);
}

- (UICollectionViewDiffableDataSource)collectionViewDataSource
{
  return self->_collectionViewDataSource;
}

- (void)setCollectionViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewDataSource, a3);
}

- (UICollectionViewCell)initiallySelectedCell
{
  return self->_initiallySelectedCell;
}

- (void)setInitiallySelectedCell:(id)a3
{
  objc_storeStrong((id *)&self->_initiallySelectedCell, a3);
}

- (void)setPrimaryCellsData:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCellsData, a3);
}

- (void)setCategoriesCellsDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_categoriesCellsDataArray, a3);
}

- (void)setJunkCellsDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_junkCellsDataArray, a3);
}

- (void)setRecentlyDeletedCellDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_recentlyDeletedCellDataArray, a3);
}

- (void)setPinnedFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedFooterTextView, a3);
}

- (void)setScrollingFooterTextView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingFooterTextView, a3);
}

- (NSDictionary)cellDataForFilterMode
{
  return self->_cellDataForFilterMode;
}

- (void)setCellDataForFilterMode:(id)a3
{
  objc_storeStrong((id *)&self->_cellDataForFilterMode, a3);
}

- (BOOL)shouldProcessBackButtonUpdates
{
  return self->_shouldProcessBackButtonUpdates;
}

- (void)setShouldProcessBackButtonUpdates:(BOOL)a3
{
  self->_shouldProcessBackButtonUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellDataForFilterMode, 0);
  objc_storeStrong((id *)&self->_scrollingFooterTextView, 0);
  objc_storeStrong((id *)&self->_pinnedFooterTextView, 0);
  objc_storeStrong((id *)&self->_recentlyDeletedCellDataArray, 0);
  objc_storeStrong((id *)&self->_junkCellsDataArray, 0);
  objc_storeStrong((id *)&self->_categoriesCellsDataArray, 0);
  objc_storeStrong((id *)&self->_primaryCellsData, 0);
  objc_storeStrong((id *)&self->_initiallySelectedCell, 0);
  objc_storeStrong((id *)&self->_collectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_conversationListController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__CKInboxViewController_setupCollectionView__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Couldn't get extension filter name", v1, 2u);
}

@end
