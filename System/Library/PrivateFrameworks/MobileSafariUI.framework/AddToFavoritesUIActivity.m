@implementation AddToFavoritesUIActivity

- (id)activityType
{
  if (self->_isForPerTabGroupFavorites)
    return CFSTR("com.apple.mobilesafari.activity.addToPerTabGroupFavorites");
  else
    return CFSTR("com.apple.mobilesafari.activity.addToFavorites");
}

- (id)activityTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_isForPerTabGroupFavorites)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFActivity delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addBookmarkActivityTabGroupProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeTabGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_systemImageName
{
  if (self->_isForPerTabGroupFavorites)
    return CFSTR("star.square.on.square");
  else
    return CFSTR("star");
}

- (BOOL)canPerformWithTabDocument:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;

  v4 = a3;
  if (!self->_isForPerTabGroupFavorites)
    goto LABEL_3;
  -[_SFActivity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBookmarkActivityTabGroupProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeTabGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "supportsTabGroupFavorites");

  if (!v8)
  {
    v10 = 0;
  }
  else
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "usesAllowedSitesOnly") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isBookmarksAvailable");

    }
  }

  return v10;
}

- (void)prepareWithTabDocument:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  _SFSingleBookmarkNavigationController *bookmarkNavController;
  void *v9;
  void *v10;
  _SFSingleBookmarkNavigationController *v11;
  id v12;
  _SFSingleBookmarkNavigationController *v13;
  int v14;
  _SFSingleBookmarkNavigationController *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  objc_storeStrong((id *)&self->_tabDocument, a3);
  -[_SFActivity delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addBookmarkActivityTabGroupProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  bookmarkNavController = self->_bookmarkNavController;
  if (self->_isForPerTabGroupFavorites)
  {
    if (bookmarkNavController)
      goto LABEL_7;
    objc_msgSend(v6, "activeTabGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "syntheticBookmarkFolderForTabGroup:withAttribution:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (_SFSingleBookmarkNavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD57C0]), "initForAddingToSyntheticBookmarkFolder:", v10);
  }
  else
  {
    if (bookmarkNavController)
      goto LABEL_7;
    v12 = objc_alloc(MEMORY[0x1E0CD57C0]);
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (_SFSingleBookmarkNavigationController *)objc_msgSend(v12, "initForAddingToFavoritesInCollection:", v10);
  }
  v13 = self->_bookmarkNavController;
  self->_bookmarkNavController = v11;

LABEL_7:
  -[_SFSingleBookmarkNavigationController setSyntheticBookmarkProvider:](self->_bookmarkNavController, "setSyntheticBookmarkProvider:", v7);
  v14 = -[_SFSingleBookmarkNavigationController prepareForPresentationForAddingBookmark:](self->_bookmarkNavController, "prepareForPresentationForAddingBookmark:", 1);
  v15 = self->_bookmarkNavController;
  if (v14)
  {
    objc_msgSend(v22, "titleForNewBookmark");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cachedCanonicalURLOrURLForSharing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "absoluteString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "favoritesFolder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (id)-[_SFSingleBookmarkNavigationController addBookmarkWithTitle:address:parentBookmark:](v15, "addBookmarkWithTitle:address:parentBookmark:", v16, v18, v20);

    -[_SFSingleBookmarkNavigationController setBookmarkNavDelegate:](self->_bookmarkNavController, "setBookmarkNavDelegate:", self);
  }
  else
  {
    self->_bookmarkNavController = 0;

    objc_msgSend(v5, "addBookmarkActivityFailedToAcquireBookmarkLock:", self);
  }

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
  v5.super_class = (Class)AddToFavoritesUIActivity;
  -[_SFActivity activityDidFinish:](&v5, sel_activityDidFinish_);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sf_didAddFavoriteFromShareSheet");

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
  -[AddToFavoritesUIActivity activityDidFinish:](self, "activityDidFinish:", v5);
  if (v5 && !self->_isForPerTabGroupFavorites)
  {
    v8 = (void *)MEMORY[0x1E0D8AA08];
    -[TabDocument webView](self->_tabDocument, "webView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke;
    v11[3] = &unk_1E9CF45D8;
    v12 = v7;
    objc_msgSend(v8, "saveLeadImageFromWebView:toLeadImageCacheRegisteredWithMetadataManager:completionHandler:", v9, v10, v11);

  }
}

void __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9[2] = __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_18;
    v9[3] = &unk_1E9CF1830;
    v10 = *(id *)(a1 + 32);
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  else if (v6)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(v8, v7);
  }

}

void __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_18(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection updateBookmark:withLeadImageURL:](v2, *(void **)(a1 + 32), *(void **)(a1 + 40));

}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  AddToFavoritesUIActivity *v3;
  void *v4;

  v3 = self;
  -[_SFActivity delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "addBookmarkActivityCanSaveBookmarkChanges:", v3);

  return (char)v3;
}

- (BOOL)isForPerTabGroupFavorites
{
  return self->_isForPerTabGroupFavorites;
}

- (void)setIsForPerTabGroupFavorites:(BOOL)a3
{
  self->_isForPerTabGroupFavorites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabDocument, 0);
  objc_storeStrong((id *)&self->_bookmarkNavController, 0);
}

void __82__AddToFavoritesUIActivity_addBookmarkNavController_didFinishWithResult_bookmark___block_invoke_cold_1(void *a1, void *a2)
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
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Could not save lead image for bookmark from Favorites action sheet action in with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
