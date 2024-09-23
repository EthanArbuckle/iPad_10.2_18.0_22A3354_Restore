@implementation CKRecipientSearchListController

- (void)dealloc
{
  objc_super v3;

  -[CKContactsSearchManager setDelegate:](self->_searchManager, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKRecipientSearchListController;
  -[CKRecipientSearchListController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKRecipientSearchListController;
  -[CKRecipientSearchListController loadView](&v4, sel_loadView);
  -[CKRecipientSearchListController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "setOpaque:", 0);
  objc_msgSend(v3, "setScrollsToTop:", 0);
  objc_msgSend(v3, "setLayoutMarginsFollowReadableWidth:", 0);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKRecipientSearchListController;
  v4 = a3;
  -[CNAutocompleteResultsTableViewController traitCollectionDidChange:](&v11, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v11.receiver, v11.super_class);
  v6 = v5;

  -[CKRecipientSearchListController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  if (v6 != v9)
  {
    -[CKRecipientSearchListController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reloadData");

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKRecipientSearchListController;
  -[CKRecipientSearchListController viewWillAppear:](&v16, sel_viewWillAppear_, a3);
  -[CKRecipientSearchListController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchResultsBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "setBackgroundColor:", v7);
    objc_msgSend(v4, "setTableHeaderBackgroundColor:", v7);
    v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v4, "bounds");
    v9 = (void *)objc_msgSend(v8, "initWithFrame:");
    objc_msgSend(v4, "setBackgroundView:", v9);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "theme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "searchResultsSeperatorColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "theme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchResultsSeperatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSeparatorColor:", v15);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKRecipientSearchListController;
  -[CKRecipientSearchListController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKRecipientSearchListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_viewDidAppearDeferredSetup, 0, 0.0);
}

- (void)viewDidAppearDeferredSetup
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[CKRecipientSearchListController conversationCache](self, "conversationCache");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_chatStateChanged_, CFSTR("CKConversationJoinStateDidChangeNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_chatStateChanged_, *MEMORY[0x1E0D352F0], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_chatStateChanged_, CFSTR("CKConversationListFinishedLoadingNotification"), 0);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CKRecipientSearchListController)initWithStyle:(int64_t)a3
{
  CKRecipientSearchListController *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKRecipientSearchListController;
  v3 = -[CNAutocompleteResultsTableViewController initWithStyle:](&v7, sel_initWithStyle_, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D35738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__ck_bestAccountForAddresses:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKRecipientSearchListController setDefaultiMessageAccount:](v3, "setDefaultiMessageAccount:", v5);
  }
  return v3;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;

  -[CNAutocompleteResultsTableViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchListControllerDidScroll:", self);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return !-[CKRecipientSearchListController isSearchResultsHidden](self, "isSearchResultsHidden", a3);
}

- (void)contactsSearchManager:(id)a3 finishedSearchingWithResults:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v29 = a4;
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startTimingForKey:", CFSTR("MessageUI"));

  -[CKRecipientSearchListController setSearchResults:](self, "setSearchResults:", v29);
  -[CKRecipientSearchListController _statusQueryController](self, "_statusQueryController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[CKRecipientSearchListController searchResults](self, "searchResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CKRecipientSearchListController searchResults](self, "searchResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "isGroup", v27) & 1) == 0
          && (objc_msgSend(v13, "children"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v15 = objc_msgSend(v14, "count") == 0,
              v14,
              v15))
        {
          v37 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v13, "children");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v17 = v16;
        objc_msgSend(v16, "__imArrayByApplyingBlock:", &__block_literal_global_7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v18);

        ++v12;
      }
      while (v10 != v12);
      v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      v10 = v19;
    }
    while (v19);
  }

  -[CKRecipientSearchListController searchResults](self, "searchResults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultsTableViewController setRecipients:](self, "setRecipients:", v20);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKRecipientSearchListController setIdsQueryStartTime:](self, "setIdsQueryStartTime:", v21);

  objc_msgSend(v28, "setDestinations:", v8);
  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stopTimingForKey:", CFSTR("MessageUI"));

  objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stopTimingForKey:", CFSTR("Total"));

  objc_msgSend(MEMORY[0x1E0D36AE8], "logTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  objc_msgSend(MEMORY[0x1E0D36AE8], "invalidateGlobalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "searchListControllerDidFinishSearch:", self);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D36AE8], "globalTimingCollectionForKey:", CFSTR("CKAutocompleteTimingKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v26;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Search finished. Duration: %@", buf, 0xCu);

    }
  }

}

uint64_t __86__CKRecipientSearchListController_contactsSearchManager_finishedSearchingWithResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "IDSCanonicalAddress");
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v14, "searchListController:destinationsUpdated:", self, v11);

  LOBYTE(v14) = -[CKRecipientSearchListController isSearchResultsHidden](self, "isSearchResultsHidden");
  v15 = IMOSLoggingEnabled();
  if ((v14 & 1) != 0)
  {
    if (v15)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Received IDS results while search is hidden. IDS destinatios to update: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("CKIDSResultsFinishedWhenSearchTableIsHiddenNotification"), 0);

  }
  else
  {
    if (v15)
    {
      CKLogCStringForType(19);
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v11;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Received batch IDS Query results in recipient list: %@", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v19 = v11;
      _CKLogExternal();
    }
    -[CNAutocompleteResultsTableViewController invalidateAddressTintColors](self, "invalidateAddressTintColors", v19);
    -[CNAutocompleteResultsTableViewController invalidatePreferredRecipients](self, "invalidatePreferredRecipients");
  }

}

- (void)chatStateChanged:(id)a3
{
  id v4;

  -[CKRecipientSearchListController setConversationCache:](self, "setConversationCache:", 0);
  v4 = -[CKRecipientSearchListController conversationCache](self, "conversationCache");
}

- (void)searchWithText:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (!CKIsScreenLocked())
  {
    -[CKRecipientSearchListController searchManager](self, "searchManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSearchListController enteredRecipients](self, "enteredRecipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKRecipientSearchListController prefilteredRecipients](self, "prefilteredRecipients");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnteredRecipients:", v9);

    -[CKRecipientSearchListController searchManager](self, "searchManager");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject searchWithText:](v5, "searchWithText:", v4);
LABEL_6:

    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Asked to search while device is locked, bailing", v10, 2u);
    }
    goto LABEL_6;
  }
LABEL_7:

}

- (BOOL)hasSearchResults
{
  void *v2;
  BOOL v3;

  -[CKRecipientSearchListController searchResults](self, "searchResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isSearchResultsHidden
{
  int v3;
  void *v4;
  char v5;

  v3 = -[CKRecipientSearchListController isViewLoaded](self, "isViewLoaded");
  if (v3)
  {
    -[CKRecipientSearchListController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)invalidateOutstandingIDStatusRequests
{
  IDSBatchIDQueryController *statusQueryController;
  IDSBatchIDQueryController *v4;

  statusQueryController = self->_statusQueryController;
  if (statusQueryController)
  {
    -[IDSBatchIDQueryController invalidate](statusQueryController, "invalidate");
    v4 = self->_statusQueryController;
    self->_statusQueryController = 0;

  }
}

- (void)cancelSearch
{
  id v2;

  -[CKRecipientSearchListController searchManager](self, "searchManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelSearch");

}

- (void)invalidateSearchManager
{
  -[CKContactsSearchManager setDelegate:](self->_searchManager, "setDelegate:", 0);
  -[CKRecipientSearchListController setSearchManager:](self, "setSearchManager:", 0);
}

- (BOOL)suppressGroupSuggestions
{
  void *v2;
  char v3;

  -[CKRecipientSearchListController searchManager](self, "searchManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "suppressGroupSuggestions");

  return v3;
}

- (void)setSuppressGroupSuggestions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKRecipientSearchListController searchManager](self, "searchManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSuppressGroupSuggestions:", v3);

}

- (void)didSelectRecipient:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKRecipientSearchListController searchManager](self, "searchManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSelectRecipient:atIndex:", v6, a4);

}

- (void)removeRecipient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController invalidateSearchResultRecipient:](self, "invalidateSearchResultRecipient:", v4);
  -[CKRecipientSearchListController searchManager](self, "searchManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeRecipient:", v4);

}

- (CKContactsSearchManager)searchManager
{
  CKContactsSearchManager *searchManager;
  CKContactsSearchManager *v4;
  CKContactsSearchManager *v5;

  searchManager = self->_searchManager;
  if (!searchManager)
  {
    v4 = objc_alloc_init(CKContactsSearchManager);
    v5 = self->_searchManager;
    self->_searchManager = v4;

    -[CKContactsSearchManager setDelegate:](self->_searchManager, "setDelegate:", self);
    -[CKRecipientSearchListController setShouldHideGroupsDonations:](self, "setShouldHideGroupsDonations:", 0);
    searchManager = self->_searchManager;
  }
  return searchManager;
}

- (NSArray)conversationCache
{
  NSArray *conversationCache;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  CKRecipientSearchListController *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  id obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  conversationCache = self->_conversationCache;
  if (!conversationCache)
  {
    v28 = 1168;
    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v29 = self;
    -[CKRecipientSearchListController _conversationList](self, "_conversationList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v40;
      v30 = *(_QWORD *)v40;
      do
      {
        v9 = 0;
        v32 = v7;
        do
        {
          if (*(_QWORD *)v40 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v9);
          if (((objc_msgSend(v10, "isGroupConversation", v28) & 1) != 0
             || objc_msgSend(v10, "isBusinessConversation"))
            && (objc_msgSend(v10, "hasLeft") & 1) == 0)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v10, "chat");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "guid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "copy");

            v34 = (void *)v14;
            objc_msgSend(v11, "setObject:forKey:", v14, CFSTR("CKConversationGUIDKey"));
            objc_msgSend(v10, "displayName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "copy");

            if (objc_msgSend(v16, "length"))
              objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("CKConversationDisplayNameKey"));
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0u;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            objc_msgSend(v10, "chat");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "participants");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v36;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v36 != v22)
                    objc_enumerationMutation(v19);
                  objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "name");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = (void *)objc_msgSend(v24, "copy");

                  objc_msgSend(v17, "addObject:", v25);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
              }
              while (v21);
            }

            objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("CKConversationEntityNamesKey"));
            objc_msgSend(v31, "addObject:", v11);

            v8 = v30;
            v7 = v32;
          }
          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v7);
    }

    v26 = *(Class *)((char *)&v29->super.super.super.super.super.isa + v28);
    *(Class *)((char *)&v29->super.super.super.super.super.isa + v28) = (Class)v31;

    conversationCache = *(NSArray **)((char *)&v29->super.super.super.super.super.isa + v28);
  }
  return conversationCache;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (id)_statusQueryController
{
  IDSBatchIDQueryController *statusQueryController;
  id v4;
  IDSBatchIDQueryController *v5;
  IDSBatchIDQueryController *v6;

  statusQueryController = self->_statusQueryController;
  if (!statusQueryController)
  {
    v4 = objc_alloc(MEMORY[0x1E0D342B0]);
    v5 = (IDSBatchIDQueryController *)objc_msgSend(v4, "initWithService:delegate:queue:", *MEMORY[0x1E0D34240], self, MEMORY[0x1E0C80D38]);
    v6 = self->_statusQueryController;
    self->_statusQueryController = v5;

    statusQueryController = self->_statusQueryController;
  }
  return statusQueryController;
}

- (char)_serviceColorForRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  char v14;
  void *v15;
  int v16;
  char v17;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  CKRecipientSearchListController *v25;
  id v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -1;
  if (objc_msgSend(v4, "isGroup"))
  {
    objc_msgSend(v4, "children");
  }
  else
  {
    v36[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__imArrayByApplyingBlock:", &__block_literal_global_112);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_2;
  v27[3] = &unk_1E274A258;
  v27[4] = self;
  v27[5] = &v28;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v27);
  if (*((unsigned __int8 *)v29 + 24) == 255 && -[CKRecipientSearchListController smsEnabled](self, "smsEnabled"))
  {
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v22 = 3221225472;
    v23 = __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_3;
    v24 = &unk_1E274B480;
    v25 = self;
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v26 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v21);
    objc_msgSend(v8, "conversationForHandles:displayName:joinedChatsOnly:create:", v9, 0, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "sendingService");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(19);
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v33 = v9;
          v34 = 2112;
          v35 = v12;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Updating service color in recipient search list for handles: %@, with service: %@", buf, 0x16u);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      {
        v19 = v9;
        v20 = v12;
        _CKLogExternal();
      }
      v14 = objc_msgSend(v12, "__ck_displayColor", v19, v20, v21, v22, v23, v24, v25);
      *((_BYTE *)v29 + 24) = v14;
      objc_msgSend(v9, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isBusiness");

      if (v16)
        *((_BYTE *)v29 + 24) = 6;

    }
  }
  v17 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return v17;
}

uint64_t __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "IDSCanonicalAddress");
}

void __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "searchListController:idStatusForIDSID:", *(_QWORD *)(a1 + 32), v11);

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D35910], "iMessageService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "__ck_displayColor");

    v9 = MEMORY[0x193FF3AEC](v11);
    v10 = v11;
    if (v9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 6;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    *a4 = 1;
    v10 = v11;
  }

}

void __62__CKRecipientSearchListController__serviceColorForRecipients___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "defaultiMessageAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  IMStripFormattingFromAddress();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imHandleWithID:alreadyCanonical:", v7, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v8 = v9;
  }

}

- (int64_t)idsStatusForAddress:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CNAutocompleteResultsTableViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "searchListController:idStatusForIDSID:", self, v4);

  return v6;
}

- (BOOL)shouldHideGroupsDonations
{
  return self->shouldHideGroupsDonations;
}

- (void)setShouldHideGroupsDonations:(BOOL)a3
{
  self->shouldHideGroupsDonations = a3;
}

- (NSArray)enteredRecipients
{
  return self->_enteredRecipients;
}

- (void)setEnteredRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_enteredRecipients, a3);
}

- (NSArray)prefilteredRecipients
{
  return self->_prefilteredRecipients;
}

- (void)setPrefilteredRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_prefilteredRecipients, a3);
}

- (BOOL)smsEnabled
{
  return self->_smsEnabled;
}

- (void)setSmsEnabled:(BOOL)a3
{
  self->_smsEnabled = a3;
}

- (IMAccount)defaultiMessageAccount
{
  return self->_defaultiMessageAccount;
}

- (void)setDefaultiMessageAccount:(id)a3
{
  objc_storeStrong((id *)&self->_defaultiMessageAccount, a3);
}

- (IDSBatchIDQueryController)statusQueryController
{
  return self->_statusQueryController;
}

- (void)setStatusQueryController:(id)a3
{
  objc_storeStrong((id *)&self->_statusQueryController, a3);
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1144);
}

- (void)setSearchManager:(id)a3
{
  objc_storeStrong((id *)&self->_searchManager, a3);
}

- (NSDate)idsQueryStartTime
{
  return self->_idsQueryStartTime;
}

- (void)setIdsQueryStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_idsQueryStartTime, a3);
}

- (void)setConversationCache:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationCache, 0);
  objc_storeStrong((id *)&self->_idsQueryStartTime, 0);
  objc_storeStrong((id *)&self->_searchManager, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_statusQueryController, 0);
  objc_storeStrong((id *)&self->_defaultiMessageAccount, 0);
  objc_storeStrong((id *)&self->_prefilteredRecipients, 0);
  objc_storeStrong((id *)&self->_enteredRecipients, 0);
}

@end
