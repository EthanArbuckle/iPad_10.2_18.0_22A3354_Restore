@implementation _SFSingleBookmarkNavigationController

- (id)_initWithBookmark:(id)a3 childBookmarks:(id)a4 inCollection:(id)a5 withSyntheticFolder:(id)a6 addingBookmark:(BOOL)a7 toFavorites:(BOOL)a8
{
  uint64_t v8;
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _BOOL8 v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _SFBookmarkInfoViewController *v27;
  _SFBookmarkInfoViewController *v28;
  _SFSingleBookmarkNavigationController *v29;
  _SFSingleBookmarkNavigationController *v30;
  void *v31;
  _SFSingleBookmarkNavigationController *v32;
  unsigned int v34;
  objc_super v35;

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_storeStrong((id *)&self->_collection, a5);
  if (objc_msgSend(v15, "count"))
  {
    v18 = objc_alloc(MEMORY[0x1E0DCCB98]);
    -[_SFSingleBookmarkNavigationController _lastSelectedFolder](self, "_lastSelectedFolder");
    v19 = v17;
    v20 = v9;
    v21 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v8;
    v23 = objc_msgSend(v22, "identifier");
    -[WebBookmarkCollection configuration](self->_collection, "configuration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v18, "initFolderWithParentID:collectionType:", v23, objc_msgSend(v24, "collectionType"));

    v16 = v21;
    v9 = v20;
    v17 = v19;
    _WBSLocalizedString();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v26);

    v14 = v25;
    v8 = v34;
  }
  v27 = -[_SFBookmarkInfoViewController initWithBookmark:childBookmarks:inCollection:addingBookmark:toFavorites:willBeDisplayedModally:]([_SFBookmarkInfoViewController alloc], "initWithBookmark:childBookmarks:inCollection:addingBookmark:toFavorites:willBeDisplayedModally:", v14, v15, v16, v9, v8, 1);
  v28 = v27;
  if (v17)
    -[_SFBookmarkInfoViewController setParent:syntheticParentFolder:](v27, "setParent:syntheticParentFolder:", 0, v17);
  v35.receiver = self;
  v35.super_class = (Class)_SFSingleBookmarkNavigationController;
  v29 = -[_SFSingleBookmarkNavigationController initWithRootViewController:](&v35, sel_initWithRootViewController_, v28);
  v30 = v29;
  if (v29)
  {
    -[_SFSingleBookmarkNavigationController _setClipUnderlapWhileTransitioning:](v29, "_setClipUnderlapWhileTransitioning:", 1);
    objc_storeStrong((id *)&v30->_infoViewController, v28);
    -[_SFBookmarkInfoViewController setDelegate:](v30->_infoViewController, "setDelegate:", v30);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addObserver:selector:name:object:", v30, sel__willResignActive, *MEMORY[0x1E0DC4868], 0);
    objc_msgSend(v31, "addObserver:selector:name:object:", v30, sel__didBecomeActive, *MEMORY[0x1E0DC4750], 0);
    v30->_needsBookmarksLockOnAppResume = 0;
    v32 = v30;

  }
  return v30;
}

- (_SFSingleBookmarkNavigationController)initWithBookmark:(id)a3 inCollection:(id)a4
{
  return (_SFSingleBookmarkNavigationController *)-[_SFSingleBookmarkNavigationController _initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:](self, "_initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:", a3, 0, a4, 0, 0, 0);
}

- (_SFSingleBookmarkNavigationController)initWithCollection:(id)a3
{
  return (_SFSingleBookmarkNavigationController *)-[_SFSingleBookmarkNavigationController _initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:](self, "_initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:", 0, 0, a3, 0, 1, 0);
}

- (_SFSingleBookmarkNavigationController)initWithFolderOfBookmarks:(id)a3 inCollection:(id)a4
{
  return (_SFSingleBookmarkNavigationController *)-[_SFSingleBookmarkNavigationController _initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:](self, "_initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:", 0, a3, a4, 0, 1, 0);
}

- (id)initForAddingToFavoritesInCollection:(id)a3
{
  return -[_SFSingleBookmarkNavigationController _initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:](self, "_initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:", 0, 0, a3, 0, 1, 1);
}

- (id)initForAddingToSyntheticBookmarkFolder:(id)a3
{
  return -[_SFSingleBookmarkNavigationController _initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:](self, "_initWithBookmark:childBookmarks:inCollection:withSyntheticFolder:addingBookmark:toFavorites:", 0, 0, 0, a3, 1, 1);
}

- (void)dealloc
{
  objc_super v3;

  -[_SFSingleBookmarkNavigationController _releaseBookmarkLockIfNeeded](self, "_releaseBookmarkLockIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)_SFSingleBookmarkNavigationController;
  -[_SFSingleBookmarkNavigationController dealloc](&v3, sel_dealloc);
}

- (id)_lastSelectedFolder
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", *MEMORY[0x1E0D4F6B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D4F6B8]))
  {
    -[WebBookmarkCollection favoritesFolder](self->_collection, "favoritesFolder");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v4)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[WebBookmarkCollection bookmarkWithUUID:](self->_collection, "bookmarkWithUUID:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:
  if (objc_msgSend(v6, "isBookmarksMenuFolder"))
  {
    -[WebBookmarkCollection listWithID:](self->_collection, "listWithID:", objc_msgSend(v6, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "bookmarkCount");

    if (!v8)
    {

LABEL_12:
      -[WebBookmarkCollection bookmarksBarBookmark](self->_collection, "bookmarksBarBookmark");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
  }
  if (!v6)
    goto LABEL_12;
LABEL_13:

  return v6;
}

- (id)addBookmarkWithTitle:(id)a3 address:(id)a4 parentBookmark:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  WebBookmarkCollection *collection;
  void *v16;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0DCCB98];
  v10 = a4;
  v11 = a3;
  v12 = [v9 alloc];
  -[WebBookmarkCollection configuration](self->_collection, "configuration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTitle:address:collectionType:", v11, v10, objc_msgSend(v13, "collectionType"));

  collection = self->_collection;
  v16 = v8;
  if (!v8)
  {
    -[_SFSingleBookmarkNavigationController _lastSelectedFolder](self, "_lastSelectedFolder");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[WebBookmarkCollection moveBookmark:toFolderWithID:](collection, "moveBookmark:toFolderWithID:", v14, objc_msgSend(v16, "identifier"));
  if (v8)
  {
    -[_SFBookmarkInfoViewController setBookmark:](self->_infoViewController, "setBookmark:", v14);
  }
  else
  {

    -[_SFBookmarkInfoViewController setBookmark:](self->_infoViewController, "setBookmark:", v14);
    -[_SFBookmarkInfoViewController updateLastSelectedSyntheticFolder](self->_infoViewController, "updateLastSelectedSyntheticFolder");
  }

  return v14;
}

- (void)_willResignActive
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "Application will resign active, single bookmark navigation controller unlocking bookmarks if needed", v4, 2u);
  }
  self->_needsBookmarksLockOnAppResume = self->_bookmarkCollectionLocked;
  -[_SFSingleBookmarkNavigationController _releaseBookmarkLockIfNeeded](self, "_releaseBookmarkLockIfNeeded");
}

- (void)_didBecomeActive
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "Application did become active, single bookmark navigation controller locking bookmarks if needed", v4, 2u);
  }
  if (self->_needsBookmarksLockOnAppResume)
    -[_SFSingleBookmarkNavigationController prepareForPresentationForAddingBookmark:](self, "prepareForPresentationForAddingBookmark:", 0);
  self->_needsBookmarksLockOnAppResume = 0;
}

- (void)_releaseBookmarkLockIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_INFO, "Single bookmark navigation controller unlocking bookmarks", v4, 2u);
  }
  if (self->_bookmarkCollectionLocked)
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
    self->_bookmarkCollectionLocked = 0;
  }
  objc_msgSend(MEMORY[0x1E0DCCBA0], "unholdLockSync:", self);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  -[_SFSingleBookmarkNavigationController _releaseBookmarkLockIfNeeded](self, "_releaseBookmarkLockIfNeeded");
  v6.receiver = self;
  v6.super_class = (Class)_SFSingleBookmarkNavigationController;
  -[_SFSingleBookmarkNavigationController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
  if (!self->_delegateNotifiedOfResult)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarkNavDelegate);
    objc_msgSend(WeakRetained, "addBookmarkNavController:didFinishWithResult:bookmark:", self, 0, 0);

  }
}

- (BOOL)prepareForPresentationForAddingBookmark:(BOOL)a3
{
  NSObject *v5;
  void *v6;
  uint8_t v8[16];

  v5 = WBS_LOG_CHANNEL_PREFIXBookmarkSync();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Single bookmark navigation controller preparing for presentation for adding bookmark", v8, 2u);
  }
  objc_msgSend(MEMORY[0x1E0D4EBD8], "sharedCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlockBookmarksIfNeeded");

  objc_msgSend(MEMORY[0x1E0DCCBA0], "holdLockSync:", self);
  if (!self->_bookmarkCollectionLocked && (objc_msgSend(MEMORY[0x1E0DCCBA0], "isLockedSync") & 1) == 0)
    self->_bookmarkCollectionLocked = objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync");
  return a3 || self->_bookmarkCollectionLocked;
}

- (void)bookmarkInfoViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  _BOOL8 v4;
  _SFSingleBookmarkNavigationControllerDelegate **p_bookmarkNavDelegate;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v4 = a4;
  self->_delegateNotifiedOfResult = 1;
  p_bookmarkNavDelegate = &self->_bookmarkNavDelegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bookmarkNavDelegate);
  objc_msgSend(v7, "bookmark");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "addBookmarkNavController:didFinishWithResult:bookmark:", self, v4, v8);
  v9 = WeakRetained;
  if (!WeakRetained)
  {
    -[_SFSingleBookmarkNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    v9 = 0;
  }

}

- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3
{
  return 0;
}

- (BOOL)bookmarkInfoViewControllerCanSaveBookmarkChanges:(id)a3
{
  _SFSingleBookmarkNavigationController *v3;
  id WeakRetained;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bookmarkNavDelegate);
  LOBYTE(v3) = objc_msgSend(WeakRetained, "addBookmarkNavControllerCanSaveBookmarkChanges:", v3);

  return (char)v3;
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  return objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);
}

- (_SFSingleBookmarkNavigationControllerDelegate)bookmarkNavDelegate
{
  return (_SFSingleBookmarkNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_bookmarkNavDelegate);
}

- (void)setBookmarkNavDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bookmarkNavDelegate, a3);
}

- (id)addBookmarkAnalyticsHandler
{
  return self->_addBookmarkAnalyticsHandler;
}

- (void)setAddBookmarkAnalyticsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (_SFSyntheticBookmarkProvider)syntheticBookmarkProvider
{
  return (_SFSyntheticBookmarkProvider *)objc_loadWeakRetained((id *)&self->_syntheticBookmarkProvider);
}

- (void)setSyntheticBookmarkProvider:(id)a3
{
  objc_storeWeak((id *)&self->_syntheticBookmarkProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syntheticBookmarkProvider);
  objc_storeStrong(&self->_addBookmarkAnalyticsHandler, 0);
  objc_destroyWeak((id *)&self->_bookmarkNavDelegate);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_infoViewController, 0);
}

@end
