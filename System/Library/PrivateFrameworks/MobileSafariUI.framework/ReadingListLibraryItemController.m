@implementation ReadingListLibraryItemController

- (void)updateListContentConfiguration:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0DC3870];
  v4 = a3;
  objc_msgSend(v3, "systemImageNamed:", CFSTR("eyeglasses"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  _WBSLocalizedString();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

}

- (id)viewController
{
  ReadingListViewController *viewController;
  ReadingListViewController *v4;
  ReadingListViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  viewController = self->_viewController;
  if (!viewController)
  {
    v4 = objc_alloc_init(ReadingListViewController);
    v5 = self->_viewController;
    self->_viewController = v4;

    -[ReadingListViewController setDelegate:](self->_viewController, "setDelegate:", self);
    -[LibraryItemController configuration](self, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "linkPreviewProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setLinkPreviewProvider:](self->_viewController, "setLinkPreviewProvider:", v7);

    -[LibraryItemController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationIntentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setNavigationIntentHandler:](self->_viewController, "setNavigationIntentHandler:", v9);

    -[LibraryItemController configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tabGroupProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ReadingListViewController setTabGroupProvider:](self->_viewController, "setTabGroupProvider:", v11);

    -[ReadingListViewController navigationItem](self->_viewController, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLargeTitleDisplayMode:", 2);

    viewController = self->_viewController;
  }
  return viewController;
}

- (BOOL)selectionFollowsFocus
{
  return 0;
}

- (id)_bookmarksNavigationControllerDelegate
{
  void *v2;
  void *v3;

  -[LibraryItemController configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarksNavigationControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)panelViewControllerShouldUseSearchControllerInNavigationItem:(id)a3
{
  return 1;
}

- (id)readingListViewControllerCurrentReadingListItem:(id)a3
{
  void *v3;
  void *v4;

  -[ReadingListLibraryItemController _bookmarksNavigationControllerDelegate](self, "_bookmarksNavigationControllerDelegate", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "bookmarksNavigationControllerCurrentContinuousReadingItem:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)readingListViewController:(id)a3 setBookmark:(id)a4 asRead:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  id v8;

  v5 = a5;
  v8 = a4;
  -[ReadingListLibraryItemController _bookmarksNavigationControllerDelegate](self, "_bookmarksNavigationControllerDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "bookmarksNavigationController:setBookmark:asRead:", 0, v8, v5);

}

- (void)readingListViewController:(id)a3 updateUnreadFilterShowingAllBookmarks:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[ReadingListLibraryItemController _bookmarksNavigationControllerDelegate](self, "_bookmarksNavigationControllerDelegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "bookmarksNavigationController:updateReadingListUnreadFilterShowingAllBookmarks:", 0, v4);

}

- (BOOL)isSpringLoaded
{
  return 1;
}

- (unint64_t)dropOperationForSession:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)MEMORY[0x1E0DCCBA0];
  v4 = a3;
  objc_msgSend(v3, "mainBookmarkCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WebBookmarkCollection dropOperationForReadingListDropSession:]((uint64_t)v5, v4);

  return v6;
}

- (int64_t)dropIntentForSession:(id)a3
{
  return 2;
}

- (void)performDropWithProposal:(id)a3 session:(id)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0DCCBA0];
  v5 = a4;
  objc_msgSend(v4, "mainBookmarkCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmarkCollection dropDragItemsInReadingList:updatingController:]((uint64_t)v6, v7, 0);
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didUseSidebarAction:", 20);

}

- (id)accessibilityIdentifier
{
  return CFSTR("ReadingListLibraryItem");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
