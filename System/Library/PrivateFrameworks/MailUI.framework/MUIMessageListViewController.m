@implementation MUIMessageListViewController

void ___ef_log_MUIMessageListViewController_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "MUIMessageListViewController");
  v1 = (void *)_ef_log_MUIMessageListViewController_log;
  _ef_log_MUIMessageListViewController_log = (uint64_t)v0;

}

- (MUIMessageListViewController)initWithDaemonInterface:(id)a3 focusController:(id)a4 mailboxes:(id)a5 contactStore:(id)a6 diagnosticsHelper:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MUIMessageListViewController *v17;
  uint64_t v18;
  NSArray *mailboxes;
  MessageListViewControllerState *v20;
  MessageListViewControllerState *state;
  MessageSelectionStrategy *v22;
  MessageSelectionStrategy *messageSelectionStrategy;
  uint64_t v24;
  EMMessageRepository *messageRepository;
  uint64_t v26;
  EMMailboxRepository *mailboxRepository;
  uint64_t v28;
  EMAccountRepository *accountRepository;
  uint64_t v30;
  EFCancelable *diagnosticsHelperToken;
  MessageListFetchHelper *v32;
  void *v33;
  uint64_t v34;
  MessageListFetchHelper *messageListFetchHelper;
  MessageListCellLayoutValuesHelper *v36;
  MessageListCellLayoutValuesHelper *layoutValuesHelper;
  uint64_t v38;
  EFPromise *initialLoadCompletedPromise;
  uint64_t v40;
  NSMutableSet *mailboxesPendingOldestItemsUpdates;
  MessageListCellsController *v42;
  MessageListCellsController *cellsController;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  EFCancelable *userDefaultsObserver;
  uint64_t v49;
  EFCancelable *focusObservationToken;
  MUIHighlightedMessagesController *v51;
  MUIHighlightedMessagesController *highlightedMessagesController;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  EMNSUserDefaultsBoolObserver *showHighlights;
  void *v58;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id location;
  objc_super v67;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v60 = a6;
  v16 = a7;
  v67.receiver = self;
  v67.super_class = (Class)MUIMessageListViewController;
  v17 = -[MUIMessageListViewController initWithNibName:bundle:](&v67, sel_initWithNibName_bundle_, 0, 0);
  if (v17)
  {
    v18 = objc_msgSend(v15, "copy");
    mailboxes = v17->_mailboxes;
    v17->_mailboxes = (NSArray *)v18;

    objc_storeStrong((id *)&v17->_contactStore, a6);
    v17->_contactStoreLock._os_unfair_lock_opaque = 0;
    v20 = objc_alloc_init(MessageListViewControllerState);
    state = v17->_state;
    v17->_state = v20;

    v22 = -[MessageSelectionStrategy initWithDataSource:]([MessageSelectionStrategy alloc], "initWithDataSource:", v17);
    messageSelectionStrategy = v17->_messageSelectionStrategy;
    v17->_messageSelectionStrategy = v22;

    -[MUIMessageListViewController updateState:withMailboxes:](v17, "updateState:withMailboxes:", v17->_state, v17->_mailboxes);
    objc_storeStrong((id *)&v17->_daemonInterface, a3);
    objc_msgSend(v13, "messageRepository");
    v24 = objc_claimAutoreleasedReturnValue();
    messageRepository = v17->_messageRepository;
    v17->_messageRepository = (EMMessageRepository *)v24;

    objc_msgSend(v13, "mailboxRepository");
    v26 = objc_claimAutoreleasedReturnValue();
    mailboxRepository = v17->_mailboxRepository;
    v17->_mailboxRepository = (EMMailboxRepository *)v26;

    objc_msgSend(v13, "accountRepository");
    v28 = objc_claimAutoreleasedReturnValue();
    accountRepository = v17->_accountRepository;
    v17->_accountRepository = (EMAccountRepository *)v28;

    objc_storeStrong((id *)&v17->_diagnosticsHelper, a7);
    -[EMDiagnosticsHelper registerDiagnosticFileProvider:](v17->_diagnosticsHelper, "registerDiagnosticFileProvider:", v17);
    v30 = objc_claimAutoreleasedReturnValue();
    diagnosticsHelperToken = v17->_diagnosticsHelperToken;
    v17->_diagnosticsHelperToken = (EFCancelable *)v30;

    v32 = [MessageListFetchHelper alloc];
    objc_msgSend(v13, "fetchController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MessageListFetchHelper initWithFetchController:mailboxes:](v32, "initWithFetchController:mailboxes:", v33, 0);
    messageListFetchHelper = v17->_messageListFetchHelper;
    v17->_messageListFetchHelper = (MessageListFetchHelper *)v34;

    v36 = objc_alloc_init(MessageListCellLayoutValuesHelper);
    layoutValuesHelper = v17->_layoutValuesHelper;
    v17->_layoutValuesHelper = v36;

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v38 = objc_claimAutoreleasedReturnValue();
    initialLoadCompletedPromise = v17->_initialLoadCompletedPromise;
    v17->_initialLoadCompletedPromise = (EFPromise *)v38;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v40 = objc_claimAutoreleasedReturnValue();
    mailboxesPendingOldestItemsUpdates = v17->_mailboxesPendingOldestItemsUpdates;
    v17->_mailboxesPendingOldestItemsUpdates = (NSMutableSet *)v40;

    v17->_queueSuspensionTimeoutTokenLock._os_unfair_lock_opaque = 0;
    v42 = objc_alloc_init(MessageListCellsController);
    cellsController = v17->_cellsController;
    v17->_cellsController = v42;

    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *MEMORY[0x1E0D1E020];
    -[MUIMessageListViewController setHideFollowUp:](v17, "setHideFollowUp:", objc_msgSend(v44, "BOOLForKey:", *MEMORY[0x1E0D1E020]));
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __113__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxes_contactStore_diagnosticsHelper___block_invoke;
    v63[3] = &unk_1E99E1908;
    objc_copyWeak(&v65, &location);
    v46 = v44;
    v64 = v46;
    objc_msgSend(v46, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v45, 1, 1, v63);
    v47 = objc_claimAutoreleasedReturnValue();
    userDefaultsObserver = v17->_userDefaultsObserver;
    v17->_userDefaultsObserver = (EFCancelable *)v47;

    -[MUIMessageListViewController _resetMailboxRepositoryForMailboxes:](v17, "_resetMailboxRepositoryForMailboxes:", v15);
    objc_storeStrong((id *)&v17->_focusController, a4);
    objc_msgSend(v14, "addObserver:currentFocus:", v17, &v17->_currentFocus);
    v49 = objc_claimAutoreleasedReturnValue();
    focusObservationToken = v17->_focusObservationToken;
    v17->_focusObservationToken = (EFCancelable *)v49;

    if (_os_feature_enabled_impl()
      && EMIsGreymatterSupportedWithOverride()
      && !-[MUIMessageListViewController isSearchViewController](v17, "isSearchViewController"))
    {
      v51 = -[MUIHighlightedMessagesController initWithRepository:delegate:]([MUIHighlightedMessagesController alloc], "initWithRepository:delegate:", v17->_messageRepository, v17);
      highlightedMessagesController = v17->_highlightedMessagesController;
      v17->_highlightedMessagesController = v51;

      -[MUIHighlightedMessagesController setMailboxes:](v17->_highlightedMessagesController, "setMailboxes:", v15);
      objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_alloc(MEMORY[0x1E0D1E2A0]);
      v55 = *MEMORY[0x1E0D1E080];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __113__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxes_contactStore_diagnosticsHelper___block_invoke_2;
      v61[3] = &unk_1E99E1230;
      objc_copyWeak(&v62, &location);
      v56 = objc_msgSend(v54, "initWithUserDefaults:keyPath:keyRepresentsDisabled:handler:", v53, v55, 1, v61);
      showHighlights = v17->_showHighlights;
      v17->_showHighlights = (EMNSUserDefaultsBoolObserver *)v56;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "addObserver:selector:name:object:", v17, sel__generativeModelsAvailabilityDidChange_, *MEMORY[0x1E0D1DC28], 0);

      objc_destroyWeak(&v62);
    }

    objc_destroyWeak(&v65);
    objc_destroyWeak(&location);

  }
  return v17;
}

void __113__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxes_contactStore_diagnosticsHelper___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setHideFollowUp:", objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", *MEMORY[0x1E0D1E020]));
    objc_msgSend(WeakRetained, "reloadDataSource");
  }

}

void __113__MUIMessageListViewController_initWithDaemonInterface_focusController_mailboxes_contactStore_diagnosticsHelper___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateHighlightsVisibility");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[MUIMessageListViewController diagnosticsHelperToken](self, "diagnosticsHelperToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)MUIMessageListViewController;
  -[MUIMessageListViewController dealloc](&v5, sel_dealloc);
}

- (void)setMessageRepository:(id)a3
{
  EMMessageRepository *v5;
  EMMessageRepository *v6;

  v5 = (EMMessageRepository *)a3;
  if (self->_messageRepository != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_messageRepository, a3);
    -[MUIMessageListViewController reloadDataSource](self, "reloadDataSource");
    v5 = v6;
  }

}

- (void)setPrimitiveMailboxes:(id)a3
{
  NSArray *v4;
  NSArray *mailboxes;
  id v6;

  if (self->_mailboxes != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    mailboxes = self->_mailboxes;
    self->_mailboxes = v4;

    -[MUIMessageListViewController state](self, "state");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDidAlertOnBlankCell:", 0);
    objc_msgSend(v6, "setDidRecordTailspin:", 0);
    -[MUIMessageListViewController _resetMailboxRepositoryForMailboxes:](self, "_resetMailboxRepositoryForMailboxes:", self->_mailboxes);
    -[MUIMessageListViewController updateState:withMailboxes:](self, "updateState:withMailboxes:", v6, self->_mailboxes);
    -[MUIMessageListViewController _refreshHighlightedMessagesController](self, "_refreshHighlightedMessagesController");

  }
}

- (void)_resetMailboxRepositoryForMailboxes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "repository");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          -[MUIMessageListViewController mailboxRepository](self, "mailboxRepository");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setRepository:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (MessageListViewControllerState)state
{
  MessageListViewControllerState *state;
  MessageListViewControllerState *v4;
  MessageListViewControllerState *v5;

  state = self->_state;
  if (!state)
  {
    v4 = objc_alloc_init(MessageListViewControllerState);
    v5 = self->_state;
    self->_state = v4;

    state = self->_state;
  }
  return state;
}

- (void)updateState:(id)a3 withMailboxes:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "updateWithMailboxes:", a4);
  if (_os_feature_enabled_impl())
  {
    v7 = objc_msgSend(v6, "containsOutbox");
LABEL_7:
    v8 = v7 ^ 1u;
    goto LABEL_8;
  }
  if ((objc_msgSend(v6, "containsInbox") & 1) != 0
    || (objc_msgSend(v6, "containsReadLaterMailbox") & 1) != 0
    || objc_msgSend(v6, "containsSmartMailbox"))
  {
    v7 = -[MUIMessageListViewController isSearchViewController](self, "isSearchViewController");
    goto LABEL_7;
  }
  v8 = 0;
LABEL_8:
  objc_msgSend(v6, "setCanShowReadLaterDate:", v8);
  _ef_log_MUIMessageListViewController();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "ef_publicDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "Updated state to %{public}@", (uint8_t *)&v11, 0xCu);

  }
}

- (void)setInitialCellConfigurationCompleted:(BOOL)a3
{
  if (self->_initialCellConfigurationCompleted != a3)
  {
    self->_initialCellConfigurationCompleted = a3;
    -[MUIMessageListViewController didFinishLoadViewController](self, "didFinishLoadViewController");
  }
}

- (EMCachingContactStore)contactStore
{
  return (EMCachingContactStore *)-[MUIMessageListViewController createContactStoreIfNeededWithOptions:](self, "createContactStoreIfNeededWithOptions:", 3);
}

- (id)createContactStoreIfNeededWithOptions:(unint64_t)a3
{
  os_unfair_lock_s *p_contactStoreLock;
  EMCachingContactStore *contactStore;
  EMCachingContactStore *v7;
  EMCachingContactStore *v8;
  EMCachingContactStore *v9;

  p_contactStoreLock = &self->_contactStoreLock;
  os_unfair_lock_lock(&self->_contactStoreLock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v7 = (EMCachingContactStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E108]), "initWithOptions:", a3);
    v8 = self->_contactStore;
    self->_contactStore = v7;

    contactStore = self->_contactStore;
  }
  v9 = contactStore;
  os_unfair_lock_unlock(p_contactStoreLock);
  return v9;
}

- (void)setSwipeActionVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;

  if (self->_swipeActionVisible != a3)
  {
    v3 = a3;
    self->_swipeActionVisible = a3;
    -[MUIMessageListViewController dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
      objc_msgSend(v4, "suspendUpdates");
    else
      objc_msgSend(v4, "resumeUpdates");

  }
}

- (void)setThreaded:(BOOL)a3
{
  void *v4;

  if (self->_threaded != a3)
  {
    self->_threaded = a3;
    -[MUIMessageListViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[MUIMessageListViewController reloadDataSource](self, "reloadDataSource");
  }
}

- (BOOL)isSearchViewController
{
  return 0;
}

- (BOOL)isInExpandedEnvironment
{
  return 1;
}

- (BOOL)isSearchControllerActive
{
  return 0;
}

- (BOOL)isPresentingSearchViewController
{
  return 0;
}

- (NSArray)inputLanguages
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController inputLanguages]", "MUIMessageListViewController.m", 347, "0");
}

- (id)searchPredicateForMailboxes:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUIMessageListViewController currentSuggestion](self, "currentSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mui_messageListSearchPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ef_addOptionalObject:", v7);
  -[MUIMessageListViewController userQueryString](self, "userQueryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D1E250], "spotlightSearchPredicateForValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

  }
  _ef_log_MUIMessageListViewController();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1E100], "publicDescriptionForSuggestion:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412802;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "Generated remote search predicate:%@ for suggestion:%@ (%@)", (uint8_t *)&v20, 0x20u);

  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForMessagesInMailboxes:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_addOptionalObject:", v14);
    _ef_log_MUIMessageListViewController();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_1D5522000, v15, OS_LOG_TYPE_DEFAULT, "Generated localMailboxPredicate:%@ for suggestion:%@ (%@)", (uint8_t *)&v20, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E248], "predicateForExcludingMessagesInMailboxesWithTypes:", &unk_1E9A017C0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);
    _ef_log_MUIMessageListViewController();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1E100], "publicDescriptionForSuggestion:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = v14;
      v22 = 2112;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_1D5522000, v15, OS_LOG_TYPE_DEFAULT, "Generated excludeJunkAndTrashPredicate:%@ for suggestion:%@ (%@)", (uint8_t *)&v20, 0x20u);

    }
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (NSString)userQueryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MUIMessageListViewController currentSuggestion](self, "currentSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userQueryString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController inputLanguages](self, "inputLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_stringByRemovingWhitespaceAndUnbalancedQuotesForLanguages:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (BOOL)isFilterButtonEnabled
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController isFilterButtonEnabled]", "MUIMessageListViewController.m", 395, "0");
}

- (void)setFilterButtonEnabled:(BOOL)a3
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController setFilterButtonEnabled:]", "MUIMessageListViewController.m", 399, "0");
}

- (void)updateFilterControlWithFilterViewModel:(id)a3
{
  id v5;

  v5 = a3;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController updateFilterControlWithFilterViewModel:]", "MUIMessageListViewController.m", 403, "0");
}

- (id)createMailboxFilterController
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController createMailboxFilterController]", "MUIMessageListViewController.m", 407, "0");
}

- (MUIMailboxFilterController)filterController
{
  MUIMailboxFilterController *filterController;
  MUIMailboxFilterController *v5;
  MUIMailboxFilterController *v6;
  void *v8;

  filterController = self->_filterController;
  if (!filterController)
  {
    -[MUIMessageListViewController createMailboxFilterController](self, "createMailboxFilterController");
    v5 = (MUIMailboxFilterController *)objc_claimAutoreleasedReturnValue();
    v6 = self->_filterController;
    self->_filterController = v5;

    filterController = self->_filterController;
    if (!filterController)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMessageListViewController.m"), 413, CFSTR("createMailboxFilterController did not return a valid instance"));

      filterController = self->_filterController;
    }
  }
  return filterController;
}

- (MUIMailboxFilterViewModel)filterViewModel
{
  void *v2;
  void *v3;

  -[MUIMessageListViewController filterController](self, "filterController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MUIMailboxFilterViewModel *)v3;
}

- (id)updatedPredicateForFocusedAccounts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (-[MUIMessageListViewController isFocusFilterEnabled](self, "isFocusFilterEnabled")
    && -[MUIMessageListViewController focusAllowed](self, "focusAllowed"))
  {
    v5 = (void *)MEMORY[0x1E0D1E170];
    -[MUIMessageListViewController currentFocus](self, "currentFocus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController accountRepository](self, "accountRepository");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updatedPredicateForFocus:currentPredicate:usingAccountRepository:", v6, v4, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (void)applyFilterPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MUIMessageListViewController setCurrentFilterPredicate:](self, "setCurrentFilterPredicate:", v4);
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleMessageListSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        -[MUIMessageListViewController dataSource](self, "dataSource", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MUIMessageListViewController filterViewModel](self, "filterViewModel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "applyFilterPredicate:userFiltered:ignoreMessagesPredicate:section:", v4, objc_msgSend(v14, "isFilterEnabled"), 0, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[MUIMessageListViewController _refreshHighlightedMessagesController](self, "_refreshHighlightedMessagesController");
}

- (void)toggleFilters
{
  -[MUIMessageListViewController setFiltersEnabled:](self, "setFiltersEnabled:", -[MUIMessageListViewController isFilterButtonEnabled](self, "isFilterButtonEnabled") ^ 1);
}

- (void)setFiltersEnabled:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[MUIMessageListViewController setFilterButtonEnabled:](self, "setFilterButtonEnabled:");
  -[MUIMessageListViewController updateFilters](self, "updateFilters");
  if (v3)
    -[MUIMessageListViewController _reportFilterButtonTapped](self, "_reportFilterButtonTapped");
}

- (void)updateFilters
{
  if (-[MUIMessageListViewController isFilterButtonEnabled](self, "isFilterButtonEnabled"))
    -[MUIMessageListViewController _enableFilters](self);
  else
    -[MUIMessageListViewController _disableFilters](self);
}

- (void)_enableFilters
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(a1, "filterViewModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFilterEnabled:", 1);
    -[MUIMessageListViewController _predicateForFiltersEnabled:](a1, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[MUIMessageListViewController _shouldApplyFilterPredicate:](a1, v2))
    {
      objc_msgSend(a1, "applyFilterPredicate:", v2);
      objc_msgSend(a1, "updateFilterControlWithFilterViewModel:", v4);
      objc_msgSend(v4, "selectedFilters");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUIMessageListViewController _reportFilterChangeEvent:filters:]((uint64_t)a1, 1, v3);

    }
  }
}

- (void)_disableFilters
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(a1, "filterViewModel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setFilterEnabled:", 0);

    -[MUIMessageListViewController _predicateForFiltersEnabled:](a1, 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (-[MUIMessageListViewController _shouldApplyFilterPredicate:](a1, v3))
    {
      objc_msgSend(a1, "applyFilterPredicate:", v3);
      -[MUIMessageListViewController _reportFilterChangeEvent:filters:]((uint64_t)a1, 0, 0);
    }

  }
}

- (id)_predicateForFiltersEnabled:(id)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    if (a2)
    {
      objc_msgSend(a1, "filterViewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "predicateForSelectedFilters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(v2, "updatedPredicateForFocusedAccounts:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "_updatedPredicateForReadLater:", v5);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_shouldApplyFilterPredicate:(void *)a1
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v2, "currentFilterPredicate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = EFObjectsAreEqual();

    v2 = (void *)(v5 ^ 1u);
  }
  return v2;
}

- (void)_reportFilterChangeEvent:(void *)a3 filters:
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  char v9;

  v5 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__MUIMessageListViewController__reportFilterChangeEvent_filters___block_invoke;
    v7[3] = &unk_1E99E2FC0;
    v9 = a2;
    v8 = v5;
    objc_msgSend(v6, "performBlock:", v7);

  }
}

- (id)_updatedPredicateForReadLater:(id)a3
{
  return a3;
}

- (void)updateFilterContextForMailboxes:(id)a3 focus:(id)a4 applyFilters:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;

  v5 = a5;
  +[MUIMailboxFilterContext contextWithMailboxes:focus:](MUIMailboxFilterContext, "contextWithMailboxes:focus:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController filterController](self, "filterController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateWithFilterContext:", v9);

  -[MUIMessageListViewController filterViewModel](self, "filterViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController setFilterButtonEnabled:](self, "setFilterButtonEnabled:", objc_msgSend(v8, "isFilterEnabled"));
  -[MUIMessageListViewController updateFilterControlWithFilterViewModel:](self, "updateFilterControlWithFilterViewModel:", v8);
  if (v5)
    -[MUIMessageListViewController updateFilters](self, "updateFilters");

}

- (void)_reportFilterButtonTapped
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", &__block_literal_global_41);

}

uint64_t __57__MUIMessageListViewController__reportFilterButtonTapped__block_invoke()
{
  return AnalyticsSendEventLazy();
}

id __57__MUIMessageListViewController__reportFilterButtonTapped__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "primaryAuthKitAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "userIsSeniorForAccount:", v1);
  v6 = CFSTR("u65_flag");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __65__MUIMessageListViewController__reportFilterChangeEvent_filters___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  AnalyticsSendEventLazy();

}

id __65__MUIMessageListViewController__reportFilterChangeEvent_filters___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("isEnabled"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        NSStringFromMUIMailboxFilterType(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "type", (_QWORD)v11));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E9A01708, v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v2;
}

- (id)createMessageListForReload
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  const char *v39;
  objc_class *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  MUIMessageListViewController *v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[MUIMessageListViewController mailboxes](self, "mailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    _ef_log_MUIMessageListViewController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MUIMessageListViewController createMessageListForReload].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    goto LABEL_12;
  }
  -[MUIMessageListViewController messageRepository](self, "messageRepository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    _ef_log_MUIMessageListViewController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MUIMessageListViewController createMessageListForReload].cold.2(v9, v17, v18, v19, v20, v21, v22, v23);
LABEL_12:
    v24 = 0;
    goto LABEL_31;
  }
  -[MUIMessageListViewController state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsInbox");
  v7 = 0;
  if ((objc_msgSend(v5, "containsSent") & 1) == 0 && v6)
    v7 = -[MUIMessageListViewController shouldHideFollowUp](self, "shouldHideFollowUp") ^ 1;
  if (v6)
    v8 = _os_feature_enabled_impl();
  else
    v8 = 0;
  if (objc_msgSend(v3, "ef_any:", &__block_literal_global_59))
    v25 = 32;
  else
    v25 = 0;
  v26 = v25 | objc_msgSend(v5, "isSearch") ^ 1;
  if (objc_msgSend(v5, "containsInbox") && -[MUIMessageListViewController isThreaded](self, "isThreaded"))
    v26 |= 0x1000uLL;
  v27 = (void *)MEMORY[0x1E0D1E248];
  -[MUIMessageListViewController mailboxRepository](self, "mailboxRepository");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "transformPredicateWithMailboxes:mailboxTypeResolver:shouldIncludeFollowUps:shouldIncludeReadLater:", v3, v28, v7, v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sortDescriptors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MUIMessageListViewController isThreaded](self, "isThreaded");
  v32 = (void *)MEMORY[0x1E0D1E238];
  -[MUIMessageListViewController messageRepository](self, "messageRepository");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v32, "threadedMessageListForMailboxes:withRepository:additionalQueryOptions:countOfItemsToPrecache:shouldUpdateDisplayDate:sortDescriptors:transformPredicate:ignoreMessageAdditionsPredicate:", v3, v33, v26, 16, 1, v30, v29, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    _ef_log_MUIMessageListViewController();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (objc_class *)objc_opt_class();
      NSStringFromClass(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "query");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v37;
      v48 = 2048;
      v49 = self;
      v50 = 2112;
      v51 = v38;
      v39 = "<%@: %p> Created new threaded list for mailboxes with query %@";
LABEL_25:
      _os_log_impl(&dword_1D5522000, v35, OS_LOG_TYPE_DEFAULT, v39, buf, 0x20u);

    }
  }
  else
  {
    objc_msgSend(v32, "simpleMessageListForMailboxes:withRepository:additionalQueryOptions:countOfItemsToPrecache:shouldUpdateDisplayDate:sortDescriptors:transformPredicate:ignoreMessageAdditionsPredicate:", v3, v33, v26, 16, 1, v30, v29, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    _ef_log_MUIMessageListViewController();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "query");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v47 = v37;
      v48 = 2048;
      v49 = self;
      v50 = 2112;
      v51 = v38;
      v39 = "<%@: %p> Created new non-threaded list for mailboxes with query %@";
      goto LABEL_25;
    }
  }

  -[MUIMessageListViewController filterViewModel](self, "filterViewModel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "isFilterEnabled");

  -[MUIMessageListViewController _predicateForFiltersEnabled:](self, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MUIMessageListViewController _shouldApplyFilterPredicate:](self, v43))
  {
    -[MUIMessageListViewController setCurrentFilterPredicate:](self, "setCurrentFilterPredicate:", v43);
    -[MUIMessageListViewController _refreshHighlightedMessagesController](self, "_refreshHighlightedMessagesController");
  }
  if (v43)
  {
    objc_msgSend(v34, "filteredMessageListWithPredicate:ignoredMessagesPredicate:userFiltered:", v43, 0, v42);
    v44 = objc_claimAutoreleasedReturnValue();

    v34 = (void *)v44;
  }
  v9 = v34;

  v24 = v9;
LABEL_31:

  return v24;
}

uint64_t __58__MUIMessageListViewController_createMessageListForReload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCoreSpotlightMailbox");
}

- (void)reloadDataSource
{
  -[MUIMessageListViewController reloadDataSourceApplyEmptySnapshot:](self, "reloadDataSourceApplyEmptySnapshot:", 1);
}

- (void)reloadDataSourceApplyEmptySnapshot:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[MUIMessageListViewController createMessageListForReload](self, "createMessageListForReload");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController reloadDataSourceWithMessageList:applyEmptySnapshot:](self, "reloadDataSourceWithMessageList:applyEmptySnapshot:", v5, v3);

}

- (void)reloadFromMailboxes
{
  void *v3;
  void *v4;

  -[MUIMessageListViewController setPrimitiveFocusFilterEnabled:](self, "setPrimitiveFocusFilterEnabled:", 1);
  -[MUIMessageListViewController mailboxes](self, "mailboxes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController currentFocus](self, "currentFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController updateFilterContextForMailboxes:focus:applyFilters:](self, "updateFilterContextForMailboxes:focus:applyFilters:", v3, v4, 0);

  -[MUIMessageListViewController reloadDataSource](self, "reloadDataSource");
}

- (void)reloadDataSourceWithMessageList:(id)a3
{
  -[MUIMessageListViewController reloadDataSourceWithMessageList:applyEmptySnapshot:](self, "reloadDataSourceWithMessageList:applyEmptySnapshot:", a3, 1);
}

- (void)reloadDataSourceWithMessageList:(id)a3 applyEmptySnapshot:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MessageListSectionDataSourceUpdateRequest *v18;
  void *v19;
  void *v20;
  MessageListDataSourceUpdateRequest *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  MUIMessageListViewController *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v4 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMessageListViewController.m"), 682, CFSTR("Current thread must be main"));

  }
  _ef_log_MUIMessageListViewController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ef_publicDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v10;
    v27 = 2048;
    v28 = self;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reloading messageList:%@", (uint8_t *)&v25, 0x20u);

  }
  -[MUIMessageListViewController cancelQueueSuspensionTimeout](self, "cancelQueueSuspensionTimeout");
  -[MUIMessageListViewController mailboxes](self, "mailboxes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "ef_all:", &__block_literal_global_63);
  -[MUIMessageListViewController state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldDisplayUnreadAndVIP:", v13);

  -[MUIMessageListViewController setSwipeActionVisible:](self, "setSwipeActionVisible:", 0);
  if (v7)
  {
    -[MUIMessageListViewController initialLoadCompletedPromise](self, "initialLoadCompletedPromise");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithResult:", MEMORY[0x1E0C9AAA0]);

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController setInitialLoadCompletedPromise:](self, "setInitialLoadCompletedPromise:", v16);

    v17 = (void *)MEMORY[0x1E0C99DE8];
    v18 = -[MessageListSectionDataSourceUpdateRequest initWithSection:messageList:]([MessageListSectionDataSourceUpdateRequest alloc], "initWithSection:messageList:", CFSTR("MessageListSectionRecent"), v7);
    objc_msgSend(v17, "arrayWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MessageListDataSourceUpdateRequest initWithSectionUpdates:sectionsToRemove:startsWithEmptySnapshot:]([MessageListDataSourceUpdateRequest alloc], "initWithSectionUpdates:sectionsToRemove:startsWithEmptySnapshot:", v19, v20, v4);
    -[MUIMessageListViewController dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "applyMessageListDataSourceUpdate:", v21);

    -[MUIMessageListViewController messageListFetchHelper](self, "messageListFetchHelper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fetchMailboxesIsUserInitiated:", 0);

  }
}

BOOL __83__MUIMessageListViewController_reloadDataSourceWithMessageList_applyEmptySnapshot___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") != 6 && objc_msgSend(v2, "type") != 5;

  return v3;
}

- (void)reloadDataSourceWithMessageList:(id)a3 section:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  MessageListSectionDataSourceUpdateRequest *v11;
  MessageListDataSourceUpdateRequest *v12;
  void *v13;
  MessageListDataSourceUpdateRequest *v14;
  void *v15;
  MessageListSectionDataSourceUpdateRequest *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  MUIMessageListViewController *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  _ef_log_MUIMessageListViewController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v10;
    v19 = 2048;
    v20 = self;
    v21 = 2114;
    v22 = v6;
    _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reload message list in section: %{public}@", buf, 0x20u);

  }
  -[MUIMessageListViewController cancelQueueSuspensionTimeout](self, "cancelQueueSuspensionTimeout");
  v11 = -[MessageListSectionDataSourceUpdateRequest initWithSection:messageList:]([MessageListSectionDataSourceUpdateRequest alloc], "initWithSection:messageList:", v6, v7);

  v12 = [MessageListDataSourceUpdateRequest alloc];
  v16 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MessageListDataSourceUpdateRequest initWithSectionUpdates:sectionsToRemove:startsWithEmptySnapshot:](v12, "initWithSectionUpdates:sectionsToRemove:startsWithEmptySnapshot:", v13, 0, 1);

  -[MUIMessageListViewController dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applyMessageListDataSourceUpdate:", v14);

}

- (void)reloadDataSourceWithSearchPredicate:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  const __CFString *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  MUIMessageListViewController *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ef_log_MUIMessageListViewController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_publicDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v42 = v7;
    v43 = 2048;
    v44 = self;
    v45 = 2114;
    v46 = v8;
    _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "<%@: %p> Reload data source with search predicate: %{public}@", buf, 0x20u);

  }
  -[MUIMessageListViewController isThreaded](self, "isThreaded");
  v9 = objc_opt_class();
  v10 = _os_feature_enabled_impl();
  if (v10)
  {
    if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 45))
    {
      _ef_log_MUIMessageListViewController();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v13;
        v43 = 2048;
        v44 = self;
        v45 = 2114;
        v46 = v14;
        _os_log_impl(&dword_1D5522000, v11, OS_LOG_TYPE_DEFAULT, "<%@: %p> Disabling SearchIndexer generated results: %{public}@", buf, 0x20u);

      }
      v15 = 32;
    }
    else
    {
      v15 = 50;
    }
    if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 44))
    {
      v15 |= 4uLL;
      _ef_log_MUIMessageListViewController();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "ef_publicDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v42 = v20;
        v43 = 2048;
        v44 = self;
        v45 = 2114;
        v46 = v21;
        _os_log_impl(&dword_1D5522000, v18, OS_LOG_TYPE_DEFAULT, "<%@: %p> Disabling maild generated results: %{public}@", buf, 0x20u);

      }
      v16 = v4;

    }
    else
    {
      v16 = v4;
    }
    v17 = CFSTR("message list indexed search");
  }
  else
  {
    v16 = v4;
    v17 = CFSTR("message list search");
    v15 = 34;
  }
  v22 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController currentSuggestion](self, "currentSuggestion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v17;
  v26 = v16;
  v27 = (void *)objc_msgSend(v22, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v9, v16, v24, v25, 0, v15, 0, v38);

  -[MUIMessageListViewController setOldestItemsIDsByMailboxObjectID:](self, "setOldestItemsIDsByMailboxObjectID:", 0);
  -[MUIMessageListViewController mailboxesPendingOldestItemsUpdates](self, "mailboxesPendingOldestItemsUpdates");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "removeAllObjects");

  v29 = objc_alloc(MEMORY[0x1E0D1E238]);
  -[MUIMessageListViewController messageRepository](self, "messageRepository");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithQuery:repository:", v27, v30);

  -[MUIMessageListViewController state](self, "state");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setShouldDisplayUnreadAndVIP:", 1);

  -[MUIMessageListViewController reloadDataSourceWithMessageList:section:](self, "reloadDataSourceWithMessageList:section:", v31, CFSTR("MessageListSectionIndexedSearch"));
  if (v10)
  {
    v33 = objc_alloc(MEMORY[0x1E0D1E2C0]);
    objc_msgSend(MEMORY[0x1E0D1E248], "sortDescriptorForDateAscending:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController currentSuggestion](self, "currentSuggestion");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v33, "initWithTargetClass:predicate:sortDescriptors:suggestion:limit:queryOptions:targetClassOptions:label:", v9, v16, v35, v36, 0, 38, 0, CFSTR("message list server search"));

    -[MUIMessageListViewController _reloadServerSearchMessageListIfNecessaryWithQuery:](self, "_reloadServerSearchMessageListIfNecessaryWithQuery:", v37);
  }

}

- (void)_reloadServerSearchMessageListIfNecessaryWithQuery:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0D1E238];
  v5 = a3;
  v6 = [v4 alloc];
  -[MUIMessageListViewController messageRepository](self, "messageRepository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "initWithQuery:repository:", v5, v7);

  -[MUIMessageListViewController reloadDataSourceWithMessageList:section:](self, "reloadDataSourceWithMessageList:section:", v8, CFSTR("MessageListSectionServerSearch"));
}

- (MessageListDataSource)dataSource
{
  MessageListDataSource *dataSource;
  MessageListDataSource *v4;
  void *v5;
  MessageListDataSource *v6;
  MessageListDataSource *v7;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [MessageListDataSource alloc];
    -[MUIMessageListViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MessageListDataSource initWithCollectionView:](v4, "initWithCollectionView:", v5);

    -[MUIMessageListViewController configureDelegatesForDataSource:](self, "configureDelegatesForDataSource:", v6);
    v7 = self->_dataSource;
    self->_dataSource = v6;

    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (void)configureDelegatesForDataSource:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setProvider:", self);
  objc_msgSend(v4, "setDelegate:", self);

}

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  MessageListDataSource *dataSource;
  UICollectionView *v7;

  v5 = (UICollectionView *)a3;
  if (self->_collectionView != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_collectionView, a3);
    dataSource = self->_dataSource;
    self->_dataSource = 0;

    -[MUIMessageListViewController _updateAllowMultipleSelection](self, "_updateAllowMultipleSelection");
    v5 = v7;
  }

}

- (void)_updateAllowMultipleSelection
{
  id v2;

  -[MUIMessageListViewController collectionView](self, "collectionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsMultipleSelection:", 1);
  objc_msgSend(v2, "setAllowsMultipleSelectionDuringEditing:", 1);

}

- (BOOL)messageListDataSource:(id)a3 shouldSuspendUpdatesAfterChange:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  EFCancelable *queueSuspensionTimeoutToken;
  void *v10;
  EFCancelable *v11;
  EFCancelable *v12;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (+[MessageListSectionDataSource isFirstChange:](MessageListSectionDataSource, "isFirstChange:", v7)
    && !-[MUIMessageListViewController isInitialCellConfigurationCompleted](self, "isInitialCellConfigurationCompleted"))
  {
    os_unfair_lock_lock(&self->_queueSuspensionTimeoutTokenLock);
    queueSuspensionTimeoutToken = self->_queueSuspensionTimeoutToken;
    if (queueSuspensionTimeoutToken)
      -[EFCancelable cancel](queueSuspensionTimeoutToken, "cancel");
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __86__MUIMessageListViewController_messageListDataSource_shouldSuspendUpdatesAfterChange___block_invoke;
    v14[3] = &unk_1E99E1328;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "afterDelay:performBlock:", v14, 2.0);
    v11 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    v12 = self->_queueSuspensionTimeoutToken;
    self->_queueSuspensionTimeoutToken = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    os_unfair_lock_unlock(&self->_queueSuspensionTimeoutTokenLock);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __86__MUIMessageListViewController_messageListDataSource_shouldSuspendUpdatesAfterChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _ef_log_MUIMessageListViewController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "[Launch] Timeout - Resume updates", v4, 2u);
  }

  objc_msgSend(WeakRetained, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resumeUpdates");

}

- (void)cancelQueueSuspensionTimeout
{
  os_unfair_lock_s *p_queueSuspensionTimeoutTokenLock;
  NSObject *v4;
  EFCancelable *queueSuspensionTimeoutToken;
  uint8_t v6[16];

  p_queueSuspensionTimeoutTokenLock = &self->_queueSuspensionTimeoutTokenLock;
  os_unfair_lock_lock(&self->_queueSuspensionTimeoutTokenLock);
  if (self->_queueSuspensionTimeoutToken)
  {
    _ef_log_MUIMessageListViewController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D5522000, v4, OS_LOG_TYPE_DEFAULT, "[Launch] Cancel queue timeout", v6, 2u);
    }

    -[EFCancelable cancel](self->_queueSuspensionTimeoutToken, "cancel");
    queueSuspensionTimeoutToken = self->_queueSuspensionTimeoutToken;
    self->_queueSuspensionTimeoutToken = 0;

  }
  os_unfair_lock_unlock(p_queueSuspensionTimeoutTokenLock);
}

- (void)messageListDataSource:(id)a3 willUpdateWithChange:(id)a4 section:(id)a5 animated:(BOOL)a6 cleanSnapshot:(BOOL)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  id v13;

  v10 = a5;
  if (!+[MessageListSectionDataSource isEmptyChange:](MessageListSectionDataSource, "isEmptyChange:", a4)
    && !a6)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = v10;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v12, 3221225472, __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke, &unk_1E99E1600, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performBlock:", &v12);

  }
}

void __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "sectionListCellClassForMessageListSectionDataSource:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke_2;
  v9[3] = &unk_1E99E3028;
  v8 = v2;
  v10 = v8;
  objc_msgSend(v4, "ef_filter:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "ef_compactMap:", &__block_literal_global_81);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cellsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "markItemIDsAsVisibleBeforeUpdate:", v6);

  }
}

uint64_t __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

id __106__MUIMessageListViewController_messageListDataSource_willUpdateWithChange_section_animated_cleanSnapshot___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "cellHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageListItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)messageListDataSourcePrepareUpdate:(id)a3 section:(id)a4 cleanSnapshot:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  id v8;

  v5 = a5;
  -[MUIMessageListViewController messageListSelectionModel](self, "messageListSelectionModel", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPerformingDataSourceUpdates:", 1);

  if (v5)
  {
    -[MUIMessageListViewController messageListPositionHelper](self, "messageListPositionHelper");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

  }
}

- (void)messageListDataSourceUpdateFailed:(id)a3 section:(id)a4
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__MUIMessageListViewController_messageListDataSourceUpdateFailed_section___block_invoke;
  v5[3] = &unk_1E99E1258;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performBlock:", v5);

}

uint64_t __74__MUIMessageListViewController_messageListDataSourceUpdateFailed_section___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "messageListSelectionModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPerformingDataSourceUpdates:", 0);

  return objc_msgSend(*(id *)(a1 + 32), "reloadDataSource");
}

- (BOOL)isIndexingMessagesForMessageListDataSource:(id)a3
{
  return 0;
}

- (id)messageListDataSource:(id)a3 sectionDataSourceForSection:(id)a4 objectID:(id)a5 messageList:(id)a6
{
  id v9;
  void *v10;
  MessageListRecentSectionDataSource *v11;

  v9 = a4;
  -[MUIMessageListViewController sectionDataSourceConfigurationWithIdentifier:section:messageList:](self, "sectionDataSourceConfigurationWithIdentifier:section:messageList:", a5, v9, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v9, "isEqualToString:", CFSTR("MessageListSectionRecent"));

  if ((_DWORD)a5)
    v11 = -[MessageListRecentSectionDataSource initWithConfiguration:]([MessageListRecentSectionDataSource alloc], "initWithConfiguration:", v10);
  else
    v11 = 0;

  return v11;
}

- (BOOL)messageListDataSource:(id)a3 shouldAnimateNextUpdateInSectionDataSource:(id)a4 change:(id)a5
{
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  MUIMessageListViewController *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (-[MUIMessageListViewController didNotifyExtendedLaunchTracker](self, "didNotifyExtendedLaunchTracker"))
  {
    -[MUIMessageListViewController messageToDisplayOnReload](self, "messageToDisplayOnReload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 == 0;

  }
  else
  {
    _ef_log_MUIMessageListViewController();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MessageListSectionDataSource publicDescriptionForChange:](MessageListSectionDataSource, "publicDescriptionForChange:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v11;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = v12;
      _os_log_impl(&dword_1D5522000, v9, OS_LOG_TYPE_DEFAULT, "<%@: %p> [Launch] Skip animation for message list change: %{public}@", (uint8_t *)&v14, 0x20u);

    }
    v8 = 0;
  }

  return v8;
}

- (id)sectionDataSourceConfigurationWithIdentifier:(id)a3 section:(id)a4 messageList:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MessageListSectionDataSourceConfiguration *v12;
  void *v13;
  void *v14;
  void *v15;
  MessageListSectionDataSourceConfiguration *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (-[MUIMessageListViewController _hasInitialLoadPromiseForSection:]((uint64_t)self, v9))
  {
    -[MUIMessageListViewController initialLoadCompletedPromise](self, "initialLoadCompletedPromise");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  v12 = [MessageListSectionDataSourceConfiguration alloc];
  -[MUIMessageListViewController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController layoutValuesHelper](self, "layoutValuesHelper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUIMessageListViewController state](self, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[MessageListSectionDataSourceConfiguration initWithIdentifier:section:collectionView:messageList:layoutValuesHelper:state:delegate:selectionModelProvider:initialLoadCompletedPromise:searchProgressView:](v12, "initWithIdentifier:section:collectionView:messageList:layoutValuesHelper:state:delegate:selectionModelProvider:initialLoadCompletedPromise:searchProgressView:", v10, v9, v13, v8, v14, v15, self, self, v11, 0);

  return v16;
}

- (uint64_t)_hasInitialLoadPromiseForSection:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MessageListSectionRecent")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("MessageListSectionIndexedSearch")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("MessageListSectionServerSearch")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("MessageListSectionTopHits")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("MessageListSectionInstantAnswers")) & 1) != 0)
    {
      a1 = 1;
    }
    else
    {
      a1 = objc_msgSend(v4, "isEqualToString:", CFSTR("MessageListSectionGroupedSender"));
    }
  }

  return a1;
}

- (id)initialLoadCompletedPromiseForMessageListSectionDataSource:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "section");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("MessageListSectionRecent"));

  if (v5)
  {
    -[MUIMessageListViewController initialLoadCompletedPromise](self, "initialLoadCompletedPromise");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishWithResult:", MEMORY[0x1E0C9AAA0]);

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController setInitialLoadCompletedPromise:](self, "setInitialLoadCompletedPromise:", v7);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)messageListSectionDataSource:(id)a3 updatedOldestItemsForMailboxes:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[MUIMessageListViewController mailboxesPendingOldestItemsUpdates](self, "mailboxesPendingOldestItemsUpdates", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v11);
        -[MUIMessageListViewController oldestItemsIDsByMailboxObjectID](self, "oldestItemsIDsByMailboxObjectID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15 != v14 && (objc_msgSend(v15, "isEqual:", v14) & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  -[MUIMessageListViewController mailboxesPendingOldestItemsUpdates](self, "mailboxesPendingOldestItemsUpdates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "ef_removeObjectsInArray:", v6);

  v18 = (void *)objc_msgSend(v5, "copy");
  -[MUIMessageListViewController setOldestItemsIDsByMailboxObjectID:](self, "setOldestItemsIDsByMailboxObjectID:", v18);

}

- (void)messageListSectionDataSource:(id)a3 willAddMessagesWithItemIdentifiers:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];

  v6 = a3;
  if (!objc_msgSend(a4, "count"))
  {
    if (!-[MUIMessageListViewController firstBatchCellConfigurationCompleted](self, "firstBatchCellConfigurationCompleted"))
    {
      MFMessageListLoadingSignpostLog();
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "messageList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_id_make_with_pointer(v7, v9);

      MFMessageListLoadingSignpostLog();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1D5522000, v12, OS_SIGNPOST_INTERVAL_END, v10, "MessageListLoading", "Finished loading message list enableTelemetry=YES ", v13, 2u);
      }

    }
    -[MUIMessageListViewController setFirstBatchCellConfigurationCompleted:](self, "setFirstBatchCellConfigurationCompleted:", 1);
    -[MUIMessageListViewController setInitialCellConfigurationCompleted:](self, "setInitialCellConfigurationCompleted:", 1);
  }

}

- (void)messageListSectionDataSource:(id)a3 deletedMessagesWithItemIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MUIMessageListViewController referenceMessageListItem](self, "referenceMessageListItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "containsObject:", v9))
      goto LABEL_10;
  }
  else
  {
    v10 = v7;
  }
  objc_msgSend(v6, "messageList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "recentlyCollapsedThreadContainsItemID:", v9);

  if (v12)
  {
    objc_msgSend(v6, "messageList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clearRecentlyCollapsedThread");

  }
  else if (-[MUIMessageListViewController isPresentingSearchViewController](self, "isPresentingSearchViewController"))
  {
    -[MUIMessageListViewController _highlightNextMessageAfterDeletingMessagesWithItemIdentifiers:](self, v10);
  }
  else
  {
    -[MUIMessageListViewController selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:](self, "selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:", v10);
  }
LABEL_10:

}

- (void)_highlightNextMessageAfterDeletingMessagesWithItemIdentifiers:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "messageSelectionStrategy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIDToSelectAfterDeletedMessageItemIDs:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    _ef_log_MUIMessageListViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138413058;
      v10 = v8;
      v11 = 2048;
      v12 = a1;
      v13 = 2114;
      v14 = v5;
      v15 = 2114;
      v16 = v3;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "<%@: %p> Highlight next message with item id: %{public}@, after deleting messages with ids: %{public}@", (uint8_t *)&v9, 0x2Au);

    }
    objc_msgSend(a1, "selectRowOfItemID:scrollToVisible:animated:", v5, 0, 0);

  }
}

- (void)messageListSectionDataSource:(id)a3 didAddMessagesWithItemIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[MUIMessageListViewController initialScrollItemID](self, "initialScrollItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v7))
  {
    -[MUIMessageListViewController setInitialScrollItemID:](self, "setInitialScrollItemID:", 0);
    -[MUIMessageListViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForItemIdentifier:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUIMessageListViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mui_scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 1, 0);

  }
  -[MUIMessageListViewController state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "containsDraftsOrOutbox") & 1) == 0)
    goto LABEL_9;
  -[MUIMessageListViewController referenceMessageListItem](self, "referenceMessageListItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && objc_msgSend(v6, "count") == 1)
  {
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ef_log_MUIMessageListViewController();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_1D5522000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Set reference message list item for first item from drafts or outbox: %{public}@", (uint8_t *)&v21, 0x16u);

    }
    -[MUIMessageListViewController dataSource](self, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "messageListItemForItemID:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "result");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUIMessageListViewController dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itemID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "messageListForMessageListItemWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUIMessageListViewController setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:](self, "setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:", v17, v20, 0, 1);
LABEL_9:

  }
}

- (void)messageListSectionDataSource:(id)a3 handleRowSelectionAfterMovingMessagesWithItemIdentifiers:(id)a4
{
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController messageListSectionDataSource:handleRowSelectionAfterMovingMessagesWithItemIdentifiers:]", "MUIMessageListViewController.m", 1089, "0");
}

- (void)showBlankCellAlertForMessageListSectionDataSource:(id)a3 itemID:(id)a4 indexPath:(id)a5 reason:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController showBlankCellAlertForMessageListSectionDataSource:itemID:indexPath:reason:]", "MUIMessageListViewController.m", 1094, "0");
}

- (void)messageListSectionDataSource:(id)a3 didConfigureCell:(id)a4 atIndexPath:(id)a5 item:(id)a6 itemWasCached:(BOOL)a7 duration:(double)a8
{
  id v13;
  id v14;
  id v15;
  id v16;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController messageListSectionDataSource:didConfigureCell:atIndexPath:item:itemWasCached:duration:]", "MUIMessageListViewController.m", 1099, "0");
}

- (void)messageListSectionDataSource:(id)a3 didFailToConfigureCellAtIndexPath:(id)a4 error:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[MUIMessageListViewController cellsController](self, "cellsController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportCellDidLoad:error:", 0, v6);

}

- (Class)sectionListCellClassForMessageListSectionDataSource:(id)a3
{
  id v5;

  v5 = a3;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController sectionListCellClassForMessageListSectionDataSource:]", "MUIMessageListViewController.m", 1108, "0");
}

- (BOOL)messageListRecentSectionDataSourceIsInExpandedEnvironment:(id)a3
{
  return 1;
}

- (id)messageSelectionStrategy:(id)a3 indexPathOfItemID:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItemIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)messageSelectionStrategy:(id)a3 itemIDForIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemIdentifierForIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfItemsForMessageSelectionStrategy:(id)a3
{
  void *v3;
  int64_t v4;

  -[MUIMessageListViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItems");

  return v4;
}

- (id)indexPathOfSelectedMessageForMessageSelectionStrategy:(id)a3
{
  void *v3;
  void *v4;

  -[MUIMessageListViewController _indexPathsForSelectedItems](self, "_indexPathsForSelectedItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)messageSelectionStrategy:(id)a3 messageListItemForItemID:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MUIMessageListViewController.m"), 1203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemID"));

  }
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageListItemForItemID:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(v10, "resultWithTimeout:error:", &v17, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (!v11)
  {
    _ef_log_MUIMessageListViewController();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MUIMessageListViewController messageSelectionStrategy:messageListItemForItemID:].cold.2((uint64_t)v8, v12, v13);

    _ef_log_MUIMessageListViewController();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[MUIMessageListViewController messageSelectionStrategy:messageListItemForItemID:].cold.1(v14);

  }
  return v11;
}

- (BOOL)messageSelectionStrategy:(id)a3 anyExpandedThreadContainsItemID:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "anyExpandedThreadContainsItemID:", v5);

  return v7;
}

- (BOOL)messageSelectionStrategy:(id)a3 isExpandedThreadWithItemID:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isExpandedThread:", v5);

  return v7;
}

- (id)_indexPathsForSelectedItems
{
  void *v2;
  void *v3;

  -[MUIMessageListViewController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForSelectedItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EMMessageListItem)referenceMessageListItem
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController referenceMessageListItem]", "MUIMessageListViewController.m", 1236, "0");
}

- (void)setReferenceMessageListItem:(id)a3 referenceMessageList:(id)a4 showAsConversation:(BOOL)a5 animated:(BOOL)a6
{
  id v9;
  id v10;

  v9 = a3;
  v10 = a4;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController setReferenceMessageListItem:referenceMessageList:showAsConversation:animated:]", "MUIMessageListViewController.m", 1240, "0");
}

- (BOOL)selectRowOfItemID:(id)a3 scrollToVisible:(BOOL)a4 animated:(BOOL)a5
{
  return -[MUIMessageListViewController selectRowOfItemID:scrollToVisible:scrollPosition:animated:](self, "selectRowOfItemID:scrollToVisible:scrollPosition:animated:", a3, a4, 0, a5);
}

- (BOOL)selectRowOfItemID:(id)a3 scrollToVisible:(BOOL)a4 scrollPosition:(int64_t)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  int v8;
  id v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  int v24;
  void *v25;
  __int16 v26;
  MUIMessageListViewController *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int64_t v35;
  __int16 v36;
  _BOOL4 v37;
  uint64_t v38;

  v6 = a6;
  v8 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  _ef_log_MUIMessageListViewController();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138413826;
    v25 = v14;
    v26 = 2048;
    v27 = self;
    v28 = 2112;
    v29 = v15;
    v30 = 2112;
    v31 = v11;
    v32 = 1024;
    v33 = v8;
    v34 = 2048;
    v35 = a5;
    v36 = 1024;
    v37 = v6;
    _os_log_impl(&dword_1D5522000, v12, OS_LOG_TYPE_DEFAULT, "<%@: %p> %@ - itemID:%@, scrollToVisible:%{BOOL}d, scrollPosition:%lu, animated:%{BOOL}d", (uint8_t *)&v24, 0x40u);

  }
  -[MUIMessageListViewController dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indexPathForItemIdentifier:", v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[MUIMessageListViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    -[MUIMessageListViewController setLastSelectedItemID:](self, "setLastSelectedItemID:", v11);
    if (-[MUIMessageListViewController isInExpandedEnvironment](self, "isInExpandedEnvironment"))
    {
      -[MUIMessageListViewController _indexPathsForSelectedItems](self, "_indexPathsForSelectedItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "containsObject:", v17);

      if ((v20 & 1) == 0)
      {
        -[MUIMessageListViewController deselectSelectedItemsInCollectionView](self, "deselectSelectedItemsInCollectionView");
        objc_msgSend(v18, "mui_selectItemAtIndexPath:animated:scrollPosition:", v17, v6 & ~v8, 0);
      }
    }
    if (v8)
    {
      v21 = objc_msgSend(v17, "item");
      if (v21 < objc_msgSend(v18, "numberOfItemsInSection:", objc_msgSend(v17, "section"))
        && (objc_msgSend(v18, "mui_isIndexPathVisible:", v17) & 1) == 0)
      {
        objc_msgSend(v18, "mui_scrollToItemAtIndexPath:atScrollPosition:animated:", v17, a5, v6);
      }
    }
    if (!-[MUIMessageListViewController isSearchControllerActive](self, "isSearchControllerActive"))
      -[MUIMessageListViewController setSplitViewControllerNeedsFocusUpdate](self, "setSplitViewControllerNeedsFocusUpdate");
  }
  else
  {
    _ef_log_MUIMessageListViewController();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[MUIMessageListViewController selectRowOfItemID:scrollToVisible:scrollPosition:animated:].cold.1((uint64_t)self, (uint64_t)v11, v22);

    -[MUIMessageListViewController setLastSelectedItemID:](self, "setLastSelectedItemID:", 0);
    -[MUIMessageListViewController deselectAllItemsInCollectionView:animated:](self, "deselectAllItemsInCollectionView:animated:", v18, v6);
  }

  return v17 != 0;
}

- (void)deselectSelectedItemsInCollectionView
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MUIMessageListViewController collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MUIMessageListViewController _indexPathsForSelectedItems](self, "_indexPathsForSelectedItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "deselectItemAtIndexPath:animated:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)deselectAllItemsInCollectionView:(id)a3 animated:(BOOL)a4
{
  id v6;

  v6 = a3;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController deselectAllItemsInCollectionView:animated:]", "MUIMessageListViewController.m", 1290, "0");
}

- (void)selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:(id)a3
{
  id v5;

  v5 = a3;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController selectNextMessageAfterRemovingAllVisibleMessageListItemsWithItemIDs:]", "MUIMessageListViewController.m", 1301, "0");
}

- (id)messageListItemsForDiagnosticsHelper:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "source") == 1)
  {
    -[MUIMessageListViewController lastSelectedMessageListItems](self, "lastSelectedMessageListItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController setLastSelectedMessageListItems:](self, "setLastSelectedMessageListItems:", 0);
    _ef_log_MUIMessageListViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218242;
      v9 = objc_msgSend(v5, "count");
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "Providing %lu messages to %@", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)currentFocusChanged:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__MUIMessageListViewController_currentFocusChanged___block_invoke;
  v9[3] = &unk_1E99E1600;
  v9[4] = self;
  v10 = v4;
  v5 = v9;
  v6 = (void *)MEMORY[0x1E0D1F070];
  v7 = v4;
  objc_msgSend(v6, "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performSyncBlock:", v5);

}

void __52__MUIMessageListViewController_currentFocusChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentFocus:", *(_QWORD *)(a1 + 40));
  _ef_log_MUIMessageListViewController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "ef_publicDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mailboxes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543618;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "Current Focus changed: %{public}@, mailboxes: %@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)setPrimitiveFocusFilterEnabled:(BOOL)a3
{
  self->_focusFilterEnabled = a3;
}

- (BOOL)focusAllowed
{
  void *v3;
  void *v4;
  char v5;

  -[MUIMessageListViewController currentFocus](self, "currentFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MUIMessageListViewController state](self, "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsSmartMailbox");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setFocusFilterEnabled:(BOOL)a3
{
  void *v4;

  if (self->_focusFilterEnabled != a3)
  {
    self->_focusFilterEnabled = a3;
    if (a3)
    {
      -[MUIMessageListViewController filterController](self, "filterController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "reselectFocusedAccounts");

    }
    -[MUIMessageListViewController updateFilters](self, "updateFilters");
  }
}

- (void)_refreshHighlightedMessagesController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    -[MUIMessageListViewController highlightedMessagesController](self, "highlightedMessagesController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (_os_feature_enabled_impl()
      && EMIsGreymatterAvailableWithOverride()
      && !-[MUIMessageListViewController isFilterButtonEnabled](self, "isFilterButtonEnabled"))
    {
      -[MUIMessageListViewController mailboxes](self, "mailboxes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMailboxes:", v3);

      -[MUIMessageListViewController currentFilterPredicate](self, "currentFilterPredicate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilterPredicate:", v4);

      -[MUIMessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUIHighlightedMessagesViewControllerFactory hideBelowLineMessagesForViewController:](MUIHighlightedMessagesViewControllerFactory, "hideBelowLineMessagesForViewController:", v5);

    }
    else
    {
      objc_msgSend(v6, "setMailboxes:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(v6, "setFilterPredicate:", 0);
    }

  }
}

- (MUIHighlightedMessageViewHosting)highlightedMessagesViewController
{
  MUIHighlightedMessageViewHosting *highlightedMessagesViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MUIHighlightedMessageViewHosting *v8;
  MUIHighlightedMessageViewHosting *v9;

  highlightedMessagesViewController = self->_highlightedMessagesViewController;
  if (!highlightedMessagesViewController)
  {
    -[MUIMessageListViewController highlightedMessages](self, "highlightedMessages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController layoutValuesHelper](self, "layoutValuesHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutValuesForStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUIMessageListViewController contactStore](self, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MUIHighlightedMessagesViewControllerFactory createViewControllerForMessages:cellLayoutValues:contactStore:delegate:](MUIHighlightedMessagesViewControllerFactory, "createViewControllerForMessages:cellLayoutValues:contactStore:delegate:", v4, v6, v7, self);
    v8 = (MUIHighlightedMessageViewHosting *)objc_claimAutoreleasedReturnValue();
    v9 = self->_highlightedMessagesViewController;
    self->_highlightedMessagesViewController = v8;

    highlightedMessagesViewController = self->_highlightedMessagesViewController;
  }
  return highlightedMessagesViewController;
}

- (void)updateHighlightsVisibility
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController updateHighlightsVisibility]", "MUIMessageListViewController.m", 1392, "0");
}

- (void)highlightedMessagesController:(id)a3 didFindMessages:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MUIMessageListViewController setHighlightedMessages:](self, "setHighlightedMessages:", v5);
  -[MUIMessageListViewController highlightedMessagesViewController](self, "highlightedMessagesViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[MUIHighlightedMessagesViewControllerFactory updateMessages:forViewController:](MUIHighlightedMessagesViewControllerFactory, "updateMessages:forViewController:", v5, v6);

}

- (void)highlightedMessagesViewDidSelectMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController highlightedMessagesViewDidSelectMessage:]", "MUIMessageListViewController.m", 1410, "0");
}

- (void)highlightedMessagesViewDidProvideFeedbackForMessage:(id)a3 feedbackType:(int64_t)a4
{
  id v6;

  v6 = a3;
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController highlightedMessagesViewDidProvideFeedbackForMessage:feedbackType:]", "MUIMessageListViewController.m", 1414, "0");
}

- (void)highlightedMessagesViewDidChangeHeight
{
  -[MUIMessageListViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUIMessageListViewController highlightedMessagesViewDidChangeHeight]", "MUIMessageListViewController.m", 1418, "0");
}

- (id)cellLayoutValuesForHighlightedMessages
{
  void *v2;
  void *v3;

  -[MUIMessageListViewController layoutValuesHelper](self, "layoutValuesHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutValuesForStyle:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EMMessageRepository)messageRepository
{
  return self->_messageRepository;
}

- (EMMailboxRepository)mailboxRepository
{
  return self->_mailboxRepository;
}

- (EMAccountRepository)accountRepository
{
  return self->_accountRepository;
}

- (NSArray)mailboxes
{
  return self->_mailboxes;
}

- (void)setMailboxes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (void)setContactStore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1032);
}

- (EMDiagnosticsHelper)diagnosticsHelper
{
  return self->_diagnosticsHelper;
}

- (MessageListFetchHelper)messageListFetchHelper
{
  return self->_messageListFetchHelper;
}

- (void)setMessageListFetchHelper:(id)a3
{
  objc_storeStrong((id *)&self->_messageListFetchHelper, a3);
}

- (NSArray)lastSelectedMessageListItems
{
  return self->_lastSelectedMessageListItems;
}

- (void)setLastSelectedMessageListItems:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedMessageListItems, a3);
}

- (BOOL)isThreaded
{
  return self->_threaded;
}

- (BOOL)shouldHideFollowUp
{
  return self->_hideFollowUp;
}

- (void)setHideFollowUp:(BOOL)a3
{
  self->_hideFollowUp = a3;
}

- (BOOL)swipeActionVisible
{
  return self->_swipeActionVisible;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (EFPromise)initialLoadCompletedPromise
{
  return self->_initialLoadCompletedPromise;
}

- (void)setInitialLoadCompletedPromise:(id)a3
{
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, a3);
}

- (MessageListCellLayoutValuesHelper)layoutValuesHelper
{
  return self->_layoutValuesHelper;
}

- (void)setLayoutValuesHelper:(id)a3
{
  objc_storeStrong((id *)&self->_layoutValuesHelper, a3);
}

- (BOOL)didNotifyExtendedLaunchTracker
{
  return self->_didNotifyExtendedLaunchTracker;
}

- (void)setDidNotifyExtendedLaunchTracker:(BOOL)a3
{
  self->_didNotifyExtendedLaunchTracker = a3;
}

- (EMMessage)messageToDisplayOnReload
{
  return self->_messageToDisplayOnReload;
}

- (void)setMessageToDisplayOnReload:(id)a3
{
  objc_storeStrong((id *)&self->_messageToDisplayOnReload, a3);
}

- (NSMutableSet)mailboxesPendingOldestItemsUpdates
{
  return self->_mailboxesPendingOldestItemsUpdates;
}

- (NSDictionary)oldestItemsIDsByMailboxObjectID
{
  return self->_oldestItemsIDsByMailboxObjectID;
}

- (void)setOldestItemsIDsByMailboxObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_oldestItemsIDsByMailboxObjectID, a3);
}

- (MessageListSelectionModel)messageListSelectionModel
{
  return self->_messageListSelectionModel;
}

- (void)setMessageListSelectionModel:(id)a3
{
  objc_storeStrong((id *)&self->_messageListSelectionModel, a3);
}

- (BOOL)isInitialCellConfigurationCompleted
{
  return self->_initialCellConfigurationCompleted;
}

- (BOOL)firstBatchCellConfigurationCompleted
{
  return self->_firstBatchCellConfigurationCompleted;
}

- (void)setFirstBatchCellConfigurationCompleted:(BOOL)a3
{
  self->_firstBatchCellConfigurationCompleted = a3;
}

- (MessageListCellsController)cellsController
{
  return self->_cellsController;
}

- (MessageListPositionHelper)messageListPositionHelper
{
  return self->_messageListPositionHelper;
}

- (void)setMessageListPositionHelper:(id)a3
{
  objc_storeStrong((id *)&self->_messageListPositionHelper, a3);
}

- (MUIHighlightedMessagesController)highlightedMessagesController
{
  return self->_highlightedMessagesController;
}

- (void)setHighlightedMessagesViewController:(id)a3
{
  objc_storeStrong((id *)&self->_highlightedMessagesViewController, a3);
}

- (NSArray)highlightedMessages
{
  return self->_highlightedMessages;
}

- (void)setHighlightedMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1168);
}

- (EMNSUserDefaultsBoolObserver)showHighlights
{
  return self->_showHighlights;
}

- (MessageSelectionStrategy)messageSelectionStrategy
{
  return self->_messageSelectionStrategy;
}

- (int)userBrowseDirection
{
  return self->_userBrowseDirection;
}

- (void)setUserBrowseDirection:(int)a3
{
  self->_userBrowseDirection = a3;
}

- (NSIndexPath)previouslySelectedIndexPath
{
  return self->_previouslySelectedIndexPath;
}

- (void)setPreviouslySelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_previouslySelectedIndexPath, a3);
}

- (EMCollectionItemID)itemIDToSelectAfterMoveID
{
  return self->_itemIDToSelectAfterMoveID;
}

- (void)setItemIDToSelectAfterMoveID:(id)a3
{
  objc_storeStrong((id *)&self->_itemIDToSelectAfterMoveID, a3);
}

- (EMCollectionItemID)lastSelectedItemID
{
  return self->_lastSelectedItemID;
}

- (void)setLastSelectedItemID:(id)a3
{
  objc_storeStrong((id *)&self->_lastSelectedItemID, a3);
}

- (EMCollectionItemID)initialScrollItemID
{
  return self->_initialScrollItemID;
}

- (void)setInitialScrollItemID:(id)a3
{
  objc_storeStrong((id *)&self->_initialScrollItemID, a3);
}

- (EMFocusController)focusController
{
  return self->_focusController;
}

- (EMFocus)currentFocus
{
  return self->_currentFocus;
}

- (void)setCurrentFocus:(id)a3
{
  objc_storeStrong((id *)&self->_currentFocus, a3);
}

- (BOOL)isFocusFilterEnabled
{
  return self->_focusFilterEnabled;
}

- (void)setFilterController:(id)a3
{
  objc_storeStrong((id *)&self->_filterController, a3);
}

- (NSPredicate)currentFilterPredicate
{
  return self->_currentFilterPredicate;
}

- (void)setCurrentFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_currentFilterPredicate, a3);
}

- (CSSuggestion)currentSuggestion
{
  return self->_currentSuggestion;
}

- (void)setCurrentSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_currentSuggestion, a3);
}

- (EFCancelable)diagnosticsHelperToken
{
  return self->_diagnosticsHelperToken;
}

- (void)setDiagnosticsHelperToken:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticsHelperToken, a3);
}

- (EFCancelable)userDefaultsObserver
{
  return self->_userDefaultsObserver;
}

- (void)setUserDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaultsObserver, a3);
}

- (EFCancelable)focusObservationToken
{
  return self->_focusObservationToken;
}

- (void)setFocusObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_focusObservationToken, a3);
}

- (EMDaemonInterface)daemonInterface
{
  return self->_daemonInterface;
}

- (void)setDaemonInterface:(id)a3
{
  objc_storeStrong((id *)&self->_daemonInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonInterface, 0);
  objc_storeStrong((id *)&self->_focusObservationToken, 0);
  objc_storeStrong((id *)&self->_userDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelperToken, 0);
  objc_storeStrong((id *)&self->_currentSuggestion, 0);
  objc_storeStrong((id *)&self->_currentFilterPredicate, 0);
  objc_storeStrong((id *)&self->_filterController, 0);
  objc_storeStrong((id *)&self->_currentFocus, 0);
  objc_storeStrong((id *)&self->_focusController, 0);
  objc_storeStrong((id *)&self->_initialScrollItemID, 0);
  objc_storeStrong((id *)&self->_lastSelectedItemID, 0);
  objc_storeStrong((id *)&self->_itemIDToSelectAfterMoveID, 0);
  objc_storeStrong((id *)&self->_previouslySelectedIndexPath, 0);
  objc_storeStrong((id *)&self->_messageSelectionStrategy, 0);
  objc_storeStrong((id *)&self->_showHighlights, 0);
  objc_storeStrong((id *)&self->_highlightedMessages, 0);
  objc_storeStrong((id *)&self->_highlightedMessagesViewController, 0);
  objc_storeStrong((id *)&self->_highlightedMessagesController, 0);
  objc_storeStrong((id *)&self->_messageListPositionHelper, 0);
  objc_storeStrong((id *)&self->_cellsController, 0);
  objc_storeStrong((id *)&self->_messageListSelectionModel, 0);
  objc_storeStrong((id *)&self->_oldestItemsIDsByMailboxObjectID, 0);
  objc_storeStrong((id *)&self->_mailboxesPendingOldestItemsUpdates, 0);
  objc_storeStrong((id *)&self->_messageToDisplayOnReload, 0);
  objc_storeStrong((id *)&self->_layoutValuesHelper, 0);
  objc_storeStrong((id *)&self->_initialLoadCompletedPromise, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_lastSelectedMessageListItems, 0);
  objc_storeStrong((id *)&self->_messageListFetchHelper, 0);
  objc_storeStrong((id *)&self->_diagnosticsHelper, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_mailboxes, 0);
  objc_storeStrong((id *)&self->_accountRepository, 0);
  objc_storeStrong((id *)&self->_mailboxRepository, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_queueSuspensionTimeoutToken, 0);
}

- (void)createMessageListForReload
{
  OUTLINED_FUNCTION_0_3(&dword_1D5522000, a1, a3, "Attempted to create message list with no message repository", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_3();
}

- (void)messageSelectionStrategy:(os_log_t)log messageListItemForItemID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D5522000, log, OS_LOG_TYPE_FAULT, "Failed to obtain message list item. See error log for details.", v1, 2u);
  OUTLINED_FUNCTION_1_3();
}

- (void)messageSelectionStrategy:(NSObject *)a3 messageListItemForItemID:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "ef_publicDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "Failed to obtain message list item for itemID: %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)selectRowOfItemID:(NSObject *)a3 scrollToVisible:scrollPosition:animated:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v7;
  v10 = 2048;
  v11 = a1;
  v12 = 2114;
  v13 = a2;
  _os_log_error_impl(&dword_1D5522000, a3, OS_LOG_TYPE_ERROR, "<%@: %p> Cannot find last selected item (id=%{public}@) -> deselect all items", (uint8_t *)&v8, 0x20u);

}

@end
