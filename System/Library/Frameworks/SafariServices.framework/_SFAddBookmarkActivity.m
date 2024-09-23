@implementation _SFAddBookmarkActivity

- (id)activityType
{
  return CFSTR("com.apple.mobilesafari.activity.addBookmark");
}

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)_systemImageName
{
  return CFSTR("book");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0D4EC80], "sharedFeatureManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBookmarksAvailable");

  if (!v4)
    return 0;
  objc_msgSend(MEMORY[0x1E0DCCB88], "sharedWebFilterSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesAllowedSitesOnly");

  return v6 ^ 1;
}

- (_SFSingleBookmarkNavigationController)bookmarkNavigationController
{
  _SFSingleBookmarkNavigationController *bookmarkNavigationController;
  _SFSingleBookmarkNavigationController *v4;
  void *v5;
  _SFSingleBookmarkNavigationController *v6;
  _SFSingleBookmarkNavigationController *v7;

  bookmarkNavigationController = self->_bookmarkNavigationController;
  if (!bookmarkNavigationController)
  {
    v4 = [_SFSingleBookmarkNavigationController alloc];
    objc_msgSend(MEMORY[0x1E0DCCBA0], "safariBookmarkCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[_SFSingleBookmarkNavigationController initWithCollection:](v4, "initWithCollection:", v5);
    v7 = self->_bookmarkNavigationController;
    self->_bookmarkNavigationController = v6;

    -[_SFSingleBookmarkNavigationController setBookmarkNavDelegate:](self->_bookmarkNavigationController, "setBookmarkNavDelegate:", self);
    bookmarkNavigationController = self->_bookmarkNavigationController;
  }
  return bookmarkNavigationController;
}

- (void)addBookmarkNavController:(id)a3 didFinishWithResult:(BOOL)a4 bookmark:(id)a5
{
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", a4);
}

- (BOOL)addBookmarkNavControllerCanSaveBookmarkChanges:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkNavigationController, 0);
}

@end
