@implementation AddBookmarkUIActivity

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  int v4;
  int v5;

  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_59);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isShowingStartPageOverriddenByExtension");
  if (v3)
    v5 = (objc_msgSend(v3, "isBlank") | v4) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

uint64_t __53__AddBookmarkUIActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareWithActivityItems:(id)a3
{
  TabDocument *v4;
  TabDocument *tabDocument;
  _SFSingleBookmarkNavigationController *bookmarkNavController;
  id v7;
  void *v8;
  _SFSingleBookmarkNavigationController *v9;
  _SFSingleBookmarkNavigationController *v10;
  void *v11;
  int v12;
  _SFSingleBookmarkNavigationController *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  objc_msgSend(a3, "safari_firstObjectPassingTest:", &__block_literal_global_1);
  v4 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  tabDocument = self->_tabDocument;
  self->_tabDocument = v4;

  -[_SFActivity delegate](self, "delegate");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  bookmarkNavController = self->_bookmarkNavController;
  if (!bookmarkNavController)
  {
    v7 = objc_alloc(MEMORY[0x1E0CD57C0]);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_SFSingleBookmarkNavigationController *)objc_msgSend(v7, "initWithCollection:", v8);
    v10 = self->_bookmarkNavController;
    self->_bookmarkNavController = v9;

    objc_msgSend(v18, "addBookmarkActivityTabGroupProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFSingleBookmarkNavigationController setSyntheticBookmarkProvider:](self->_bookmarkNavController, "setSyntheticBookmarkProvider:", v11);

    bookmarkNavController = self->_bookmarkNavController;
  }
  v12 = -[_SFSingleBookmarkNavigationController prepareForPresentationForAddingBookmark:](bookmarkNavController, "prepareForPresentationForAddingBookmark:", 1);
  v13 = self->_bookmarkNavController;
  if (v12)
  {
    -[TabDocument titleForNewBookmark](self->_tabDocument, "titleForNewBookmark");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TabDocument cachedCanonicalURLOrURLForSharing](self->_tabDocument, "cachedCanonicalURLOrURLForSharing");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)-[_SFSingleBookmarkNavigationController addBookmarkWithTitle:address:parentBookmark:](v13, "addBookmarkWithTitle:address:parentBookmark:", v14, v16, 0);

    -[_SFSingleBookmarkNavigationController setBookmarkNavDelegate:](self->_bookmarkNavController, "setBookmarkNavDelegate:", self);
  }
  else
  {
    self->_bookmarkNavController = 0;

    objc_msgSend(v18, "addBookmarkActivityFailedToAcquireBookmarkLock:", self);
  }

}

uint64_t __50__AddBookmarkUIActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)activityViewController
{
  return self->_bookmarkNavController;
}

- (void)activityDidFinish:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AddBookmarkUIActivity;
  -[_SFActivity activityDidFinish:](&v5, sel_activityDidFinish_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "didAddBookmarkWithMethod:", 3);

  }
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v7 = a5;
  -[AddBookmarkUIActivity activityDidFinish:](self, "activityDidFinish:", v5);
  if (v5)
  {
    v8 = (void *)MEMORY[0x1E0D8AA08];
    -[TabDocument webView](self->_tabDocument, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke;
    v11[3] = &unk_1E9CF45D8;
    v12 = v7;
    objc_msgSend(v8, "saveLeadImageFromWebView:toLeadImageCacheRegisteredWithMetadataManager:completionHandler:", v9, v10, v11);

  }
}

void __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_7;
    v9[3] = &unk_1E9CF1830;
    v10 = *(id *)(a1 + 32);
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  else if (v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(v8, v7);
  }

}

void __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_7(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection updateBookmark:withLeadImageURL:](v2, *(void **)(a1 + 32), *(void **)(a1 + 40));

}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  AddBookmarkUIActivity *v3;
  void *v4;

  v3 = self;
  -[_SFActivity delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "addBookmarkActivityCanSaveBookmarkChanges:", v3);

  return (char)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
  objc_storeStrong((id *)&self->_bookmarkNavController, 0);
}

void __79__AddBookmarkUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Could not save lead image for bookmark from Bookmark action sheet action in with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
