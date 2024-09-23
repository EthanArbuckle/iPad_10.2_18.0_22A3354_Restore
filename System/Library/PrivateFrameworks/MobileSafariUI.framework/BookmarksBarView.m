@implementation BookmarksBarView

- (void)_setButtonUsedToShowNavigationController:(uint64_t)a1
{
  id v4;
  id v5;

  v4 = a2;
  if (a1 && *(id *)(a1 + 472) != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(a1 + 472), a2);
    v4 = v5;
  }

}

- (void)_clearBookmarksNavigationController
{
  void *v2;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 488), "setBookmarksNavigationControllerDelegate:", 0);
    v2 = *(void **)(a1 + 488);
    *(_QWORD *)(a1 + 488) = 0;

    *(_BYTE *)(a1 + 480) = 0;
  }
}

- (void)_buttonTapped:(id)a3
{
  UIButton *buttonUsedToShowNavigationController;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BookmarksNavigationController *v10;
  BookmarksNavigationController *bookmarksNavigationController;
  BookmarksNavigationController *v12;
  BookmarksNavigationController *v13;
  UIButton *v14;

  v14 = (UIButton *)a3;
  if (!self->_isShowingNavigationController
    || (buttonUsedToShowNavigationController = self->_buttonUsedToShowNavigationController,
        -[BookmarksNavigationController dismissViewControllerAnimated:completion:](self->_bookmarksNavigationController, "dismissViewControllerAnimated:completion:", 1, 0), -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self), buttonUsedToShowNavigationController != v14))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
    if (self->_moreBookmarksButton == v14)
    {
      v10 = -[BookmarksNavigationController initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:]([BookmarksNavigationController alloc], "initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:", self, WeakRetained, self->_moreBookmarksParent, self->_moreBookmarksOffset);
      bookmarksNavigationController = self->_bookmarksNavigationController;
      self->_bookmarksNavigationController = v10;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[UIButton bookmark](v14, "bookmark");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v6, "isFolder")
          || objc_msgSend(MEMORY[0x1E0D4EF70], "shouldOpenBookmarkFolderAsTabs"))
        {
          objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "navigationIntentWithBookmark:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
          objc_msgSend(v9, "dispatchNavigationIntent:", v8);

LABEL_13:
          goto LABEL_14;
        }
        v12 = -[BookmarksNavigationController initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:]([BookmarksNavigationController alloc], "initWithBookmarksDelegate:linkPreviewProvider:topBookmark:skipOffset:", self, WeakRetained, v6, 0);
        v13 = self->_bookmarksNavigationController;
        self->_bookmarksNavigationController = v12;

      }
    }
    -[BookmarksNavigationController setNavigationIntentHandler:](self->_bookmarksNavigationController, "setNavigationIntentHandler:", self);
    -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:]((uint64_t)self, v14, 1);
    -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, v14);
    goto LABEL_13;
  }
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
LABEL_14:

}

- (void)_presentCurrentBookmarksPopoverFromButton:(uint64_t)a3 animated:
{
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v5 = *(void **)(a1 + 488);
    v6 = a2;
    objc_msgSend(v5, "presentingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXUserInteraction();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:].cold.1(a1, v8);
    }
    objc_msgSend(*(id *)(a1 + 488), "setAllowsEditing:", 0);
    objc_msgSend(*(id *)(a1 + 488), "setModalPresentationStyle:", 7);
    objc_msgSend(*(id *)(a1 + 488), "popoverPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v9, "setSourceRect:", v11, v13, v15, v17);
    objc_msgSend(v9, "setSourceView:", a1);
    objc_msgSend(v9, "setDelegate:", a1);
    objc_msgSend(v9, "setPermittedArrowDirections:", 1);
    v21[0] = a1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPassthroughViews:", v18);

    objc_msgSend((id)a1, "window");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rootViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 488), a3, 0);

    *(_BYTE *)(a1 + 480) = 1;
  }
}

- (void)_dismissCurrentBookmarksPopover
{
  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 488), "dismissViewControllerAnimated:completion:", 0, 0);
    -[BookmarksBarView _setButtonUsedToShowNavigationController:](a1, 0);
  }
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  id v7;
  UIButton *buttonUsedToShowNavigationController;
  double v9;
  UIButton *moreBookmarksButton;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  double v17;
  void *v18;
  BookmarksNavigationController *bookmarksNavigationController;
  void *v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGRect *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!self->_isShowingNavigationController)
    goto LABEL_21;
  buttonUsedToShowNavigationController = self->_buttonUsedToShowNavigationController;
  if (buttonUsedToShowNavigationController == self->_moreBookmarksButton)
  {
LABEL_5:
    v30 = a4;
    v31 = v7;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = self->_bookmarkBarLabels;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v16, "alpha");
          if (v17 != 0.0)
          {
            objc_msgSend(v16, "bookmark");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v18, "isFolder") & 1) != 0)
            {
              bookmarksNavigationController = self->_bookmarksNavigationController;
              objc_msgSend(v16, "bookmark");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(bookmarksNavigationController) = -[BookmarksNavigationController rebaseOnDescendentBookmark:](bookmarksNavigationController, "rebaseOnDescendentBookmark:", v20);

              if ((_DWORD)bookmarksNavigationController)
              {
                -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, v16);
                objc_msgSend(v16, "frame");
                v30->origin.x = v26;
                v30->origin.y = v27;
                v30->size.width = v28;
                v30->size.height = v29;

                v7 = v31;
                goto LABEL_22;
              }
            }
            else
            {

            }
          }
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v13);
    }

    a4 = v30;
    moreBookmarksButton = self->_moreBookmarksButton;
    v7 = v31;
LABEL_18:
    -[UIButton alpha](moreBookmarksButton, "alpha");
    if (v21 != 0.0
      && -[BookmarksNavigationController rebaseOnAncestorBookmark:skipOffset:](self->_bookmarksNavigationController, "rebaseOnAncestorBookmark:skipOffset:", self->_moreBookmarksParent, self->_moreBookmarksOffset))
    {
      -[UIButton frame](self->_moreBookmarksButton, "frame");
      a4->origin.x = v22;
      a4->origin.y = v23;
      a4->size.width = v24;
      a4->size.height = v25;
      -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, self->_moreBookmarksButton);
      goto LABEL_22;
    }
LABEL_21:
    -[BookmarksBarView _dismissCurrentBookmarksPopover]((uint64_t)self);
    goto LABEL_22;
  }
  -[UIButton alpha](buttonUsedToShowNavigationController, "alpha");
  if (v9 == 0.0)
  {
    moreBookmarksButton = self->_moreBookmarksButton;
    if (self->_buttonUsedToShowNavigationController != moreBookmarksButton)
      goto LABEL_18;
    goto LABEL_5;
  }
LABEL_22:

}

- (void)presentationControllerDidDismiss:(id)a3
{
  -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
}

- (id)_rootList
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    -[BookmarksBarView _rootBookmark](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "listWithID:", objc_msgSend(v1, "identifier"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_rootBookmark
{
  id *v1;
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(v1 + 63);
    if (objc_msgSend(WeakRetained, "isPrivateBrowsingEnabled"))
    {

    }
    else
    {
      objc_msgSend(v1, "tabGroupProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activeProfile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "customFavoritesFolderServerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v1[69], "serverID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = WBSIsEqual();

        if ((v8 & 1) != 0)
          goto LABEL_13;
        objc_msgSend(v2, "bookmarkWithServerID:excludeDeletedBookmarks:", v6, 1);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v1[69];
        v1[69] = (id)v9;
        goto LABEL_10;
      }
    }
    if (objc_msgSend(v1[69], "identifier") == *((_DWORD *)v1 + 117))
    {
      v6 = 0;
LABEL_11:
      v11 = v1[69];
      if (v11)
      {
LABEL_14:
        v1 = (id *)v11;

        return v1;
      }
      objc_msgSend(v2, "bookmarksBarBookmark");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v1[69];
      v1[69] = (id)v12;

      *((_DWORD *)v1 + 117) = objc_msgSend(v1[69], "identifier");
LABEL_13:
      v11 = v1[69];
      goto LABEL_14;
    }
    v6 = 0;
    v10 = v1[69];
    v1[69] = 0;
LABEL_10:

    goto LABEL_11;
  }
  return v1;
}

- (void)_createAllLabelButtonsIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  _BOOL4 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 424))
  {
    *(_BYTE *)(a1 + 424) = 0;
    if (*(_BYTE *)(a1 + 480) && *(_QWORD *)(a1 + 472) == *(_QWORD *)(a1 + 448))
    {
      objc_msgSend(*(id *)(a1 + 488), "viewControllers");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v2, "count") == 1;

    }
    else
    {
      v18 = 0;
    }
    -[BookmarksBarView _setButtonUsedToShowNavigationController:](a1, 0);
    -[BookmarksBarView _rootList]((id *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(a1 + 440) = objc_msgSend(v3, "folderID");
    v4 = *(void **)(a1 + 416);
    if (v4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v5 = v4;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v20 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "removeFromSuperview");
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v7);
      }

    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = *(void **)(a1 + 416);
    *(_QWORD *)(a1 + 416) = v10;

    v12 = objc_msgSend(v3, "bookmarkCount");
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      do
      {
        objc_msgSend(v3, "bookmarkAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[BookmarksBarLabelButton labelButtonWithButtonStyle:](BookmarksBarLabelButton, "labelButtonWithButtonStyle:", *(_QWORD *)(a1 + 544));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBookmark:", v15);
        objc_msgSend(v16, "addTarget:action:forControlEvents:", a1, sel__buttonTapped_, 64);
        objc_msgSend(v16, "setDelegate:", a1);
        objc_msgSend(v16, "setThemeColor:", *(_QWORD *)(a1 + 536));
        objc_msgSend(*(id *)(a1 + 416), "addObject:", v16);
        objc_msgSend((id)a1, "addSubview:", v16);

        v14 = (v14 + 1);
      }
      while (v13 != (_DWORD)v14);
    }
    if (!*(_BYTE *)(a1 + 481))
      objc_msgSend((id)a1, "layoutIfNeeded");
    if (*(_BYTE *)(a1 + 480))
    {
      if (v18 && (objc_msgSend(*(id *)(a1 + 448), "alpha"), v17 == 1.0))
      {
        objc_msgSend(*(id *)(a1 + 488), "setRootBookmark:skipOffset:", *(_QWORD *)(a1 + 456), *(unsigned int *)(a1 + 464));
        -[BookmarksBarView _setButtonUsedToShowNavigationController:](a1, *(void **)(a1 + 448));
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 488), "reloadViewControllers");
      }
    }

  }
}

- (void)_repositionBookmarksNavigationController
{
  int v2;
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = *(unsigned __int8 *)(a1 + 482);
  *(_BYTE *)(a1 + 482) = 0;
  if (!v2)
    return;
  v3 = 0x1F0154000uLL;
  v4 = *(void **)(a1 + 488);
  if (!v4)
    return;
  objc_msgSend(v4, "rootBookmark");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = *(id *)(a1 + 416);
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v6)
    goto LABEL_20;
  v7 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v22 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v9, "alpha");
      if (v10 != 0.0)
      {
        objc_msgSend(v9, "bookmark");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isFolder") & 1) != 0)
        {
          v12 = objc_msgSend(v18, "identifier");
          objc_msgSend(v9, "bookmark");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "identifier");

          if (v12 == v14)
          {
            v3 = 0x1F0154000uLL;
LABEL_19:
            v6 = v9;
            goto LABEL_20;
          }
        }
        else
        {

        }
      }
      objc_msgSend(v9, "alpha");
      if (v15 == 0.0)
      {
        v3 = 0x1F0154000uLL;
        objc_msgSend(*(id *)(a1 + 488), "rebaseOnAncestorBookmark:skipOffset:", *(_QWORD *)(a1 + 456), *(unsigned int *)(a1 + 464));
        v9 = *(void **)(a1 + 448);
        goto LABEL_19;
      }
    }
    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
      continue;
    break;
  }
  v3 = 0x1F0154000;
LABEL_20:

  v16 = *(void **)(a1 + *(int *)(v3 + 2160));
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__BookmarksBarView__repositionBookmarksNavigationController__block_invoke;
  v19[3] = &unk_1E9CF1830;
  v19[4] = a1;
  v20 = v6;
  v17 = v6;
  objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 0, v19);

}

void __60__BookmarksBarView__repositionBookmarksNavigationController__block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 488))
  {
    -[BookmarksBarView _presentCurrentBookmarksPopoverFromButton:animated:](v2, *(void **)(a1 + 40), 0);
    -[BookmarksBarView _setButtonUsedToShowNavigationController:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  }
}

- (void)_receivedBookmarksChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DCCC00]) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DCCC48]))
  {
    -[BookmarksBarView setNeedsReloadData](self, "setNeedsReloadData");
  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DCCC10]))
  {
    objc_msgSend(v7, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", *MEMORY[0x1E0DCCBE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "intValue") == self->_bookmarkBarID)
      -[BookmarksBarView setNeedsReloadData](self, "setNeedsReloadData");

  }
}

- (BookmarksBarView)initWithFrame:(CGRect)a3
{
  BookmarksBarView *v3;
  uint64_t v4;
  UIButton *moreBookmarksButton;
  UIButton *v6;
  void *v7;
  UIButton *v8;
  void *v9;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)BookmarksBarView;
  v3 = -[BookmarksBarView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v4 = objc_claimAutoreleasedReturnValue();
    moreBookmarksButton = v3->_moreBookmarksButton;
    v3->_moreBookmarksButton = (UIButton *)v4;

    v6 = v3->_moreBookmarksButton;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("ellipsis"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setImage:forState:](v6, "setImage:forState:", v7, 0);

    v8 = v3->_moreBookmarksButton;
    v9 = (void *)MEMORY[0x1E0DC3888];
    bookmarksBarLabelButtonFont();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithFont:scale:", v10, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setPreferredSymbolConfiguration:forImageInState:](v8, "setPreferredSymbolConfiguration:forImageInState:", v11, 0);

    v12 = v3->_moreBookmarksButton;
    _SFRoundEdgeInsetsToPixels();
    -[UIButton setImageEdgeInsets:](v12, "setImageEdgeInsets:");
    -[UIButton addTarget:action:forControlEvents:](v3->_moreBookmarksButton, "addTarget:action:forControlEvents:", v3, sel__buttonTapped_, 64);
    -[UIButton setPointerStyleProvider:](v3->_moreBookmarksButton, "setPointerStyleProvider:", &__block_literal_global_5);
    -[BookmarksBarView addSubview:](v3, "addSubview:", v3->_moreBookmarksButton);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel__receivedBookmarksChangedNotification_, *MEMORY[0x1E0DCCC10], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel__receivedBookmarksChangedNotification_, *MEMORY[0x1E0DCCC00], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v3, sel__receivedBookmarksChangedNotification_, *MEMORY[0x1E0DCCC48], 0);
    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[BookmarksBarView registerForTraitChanges:withTarget:action:](v3, "registerForTraitChanges:withTarget:action:", v14, v3, sel__didChangeHorizontalSizeClass);

  }
  return v3;
}

id __34__BookmarksBarView_initWithFrame___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v5, "contentRectForBounds:");
  objc_msgSend(v5, "imageRectForContentRect:");
  objc_msgSend(v6, "convertRect:fromView:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  v15 = fmin((CGRectGetWidth(v20) + -42.0) * 0.5, -3.0);
  v21.origin.x = v8;
  v21.origin.y = v10;
  v21.size.width = v12;
  v21.size.height = v14;
  v16 = fmin((CGRectGetHeight(v21) + -24.0) * 0.5, -3.0);
  v22.origin.x = v8;
  v22.origin.y = v10;
  v22.size.width = v12;
  v22.size.height = v14;
  v23 = CGRectInset(v22, v15, v16);
  objc_msgSend(MEMORY[0x1E0DC3B30], "shapeWithRoundedRect:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)layoutSubviews
{
  BookmarksBarView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  BookmarksBarView *v21;
  int v22;
  _BOOL4 v23;
  uint64_t v24;
  double v25;
  unsigned int v26;
  uint64_t j;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat MaxX;
  double v37;
  double v38;
  unsigned int v39;
  _BOOL4 v40;
  NSMutableArray *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  double v60;
  uint64_t v61;
  WebBookmark *moreBookmarksParent;
  void *v63;
  double v64;
  double v65;
  double v66;
  NSMutableArray *obj;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  objc_super v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v2 = self;
  v83 = *MEMORY[0x1E0C80C00];
  self->_isPerformingLayout = 1;
  v80.receiver = self;
  v80.super_class = (Class)BookmarksBarView;
  -[BookmarksBarView layoutSubviews](&v80, sel_layoutSubviews);
  -[BookmarksBarView _createAllLabelButtonsIfNeeded]((uint64_t)v2);
  -[BookmarksBarView bounds](v2, "bounds");
  v4 = v3;
  v6 = v5;
  -[BookmarksBarView layoutMargins](v2, "layoutMargins");
  v8 = v7;
  v10 = v9;
  -[UIButton imageView](v2->_moreBookmarksButton, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13 + 30.0;

  v15 = fmax(v10 + -15.0, 0.0) + v14;
  v66 = v4 - v15;
  v16 = fmax(v8, 18.0);
  v17 = -[NSMutableArray count](v2->_bookmarkBarLabels, "count");
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v18 = v2->_bookmarkBarLabels;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (!v19)
  {

    v39 = v17;
LABEL_29:
    -[BookmarksBarView bounds](v2, "bounds");
    CGRectGetWidth(v86);
    _SFRoundFloatToPixels();
    v52 = v51;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v41 = v2->_bookmarkBarLabels;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
    v50 = 0.0;
    if (v53)
    {
      v54 = v53;
      v55 = v39;
      v56 = v17;
      v57 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v73 != v57)
            objc_enumerationMutation(v41);
          v59 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          objc_msgSend(v59, "frame");
          objc_msgSend(v59, "setFrame:", v52 + v60);
        }
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v72, v81, 16);
      }
      while (v54);
      v17 = v56;
      v39 = v55;
    }
    goto LABEL_37;
  }
  v20 = v19;
  obj = v18;
  v64 = v15;
  v65 = v4;
  v71 = v6;
  v21 = v2;
  v22 = 0;
  LOBYTE(v23) = 0;
  v24 = *(_QWORD *)v77;
  v25 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v69 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v70 = *MEMORY[0x1E0DC49E8];
  v68 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v26 = v17;
  do
  {
    for (j = 0; j != v20; ++j)
    {
      if (*(_QWORD *)v77 != v24)
        objc_enumerationMutation(obj);
      v28 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
      objc_msgSend(v28, "sizeToFit", *(_QWORD *)&v64, *(_QWORD *)&v65);
      objc_msgSend(v28, "frame");
      v30 = v29;
      _SFRoundFloatToPixels();
      v32 = v31;
      v33 = fmin(v30, 150.0);
      if (v23)
      {
        v34 = 0.0;
        v23 = 1;
        v35 = v71;
      }
      else
      {
        v84.origin.x = v16;
        v84.origin.y = v32;
        v84.size.width = v33;
        v35 = v71;
        v84.size.height = v71;
        MaxX = CGRectGetMaxX(v84);
        v23 = MaxX > v66;
        if (MaxX <= v66)
        {
          v34 = 1.0;
        }
        else
        {
          v26 = v22 + j;
          v34 = 0.0;
        }
      }
      objc_msgSend(v28, "setFrame:", v16, v32, v33, v35);
      objc_msgSend(v28, "setAlpha:", v34);
      if (v22 + (_DWORD)j)
        v37 = -9.0;
      else
        v37 = v69;
      if (-[NSMutableArray count](v21->_bookmarkBarLabels, "count") <= (unint64_t)(v22 + j + 1))
        v38 = v68;
      else
        v38 = -9.0;
      objc_msgSend(v28, "setCursorRegionInset:", v70, v37, v25, v38);
      v16 = v16 + v33 + 18.0;
    }
    v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    v22 += j;
  }
  while (v20);

  v39 = v26;
  if (v26)
    v40 = v23;
  else
    v40 = 0;
  if (!v40)
  {
    v50 = 1.0;
    v2 = v21;
    v6 = v71;
    if (v23)
      goto LABEL_38;
    goto LABEL_29;
  }
  v2 = v21;
  -[NSMutableArray objectAtIndexedSubscript:](v21->_bookmarkBarLabels, "objectAtIndexedSubscript:", v26 - 1);
  v41 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray cursorRegionInset](v41, "cursorRegionInset");
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[NSMutableArray frame](v41, "frame");
  v48 = v64 + CGRectGetMaxX(v85) - v65;
  if (v48 >= -44.0)
    v49 = v48;
  else
    v49 = 0.0;
  -[NSMutableArray setCursorRegionInset:](v41, "setCursorRegionInset:", v43, v45, v47, v49);
  v50 = 1.0;
  v6 = v71;
LABEL_37:

LABEL_38:
  -[UIButton setFrame:](v2->_moreBookmarksButton, "setFrame:", v66, 0.0, v14, v6);
  -[UIButton setAlpha:](v2->_moreBookmarksButton, "setAlpha:", v50);
  if (v39 < v17)
  {
    -[BookmarksBarView _rootBookmark]((id *)&v2->super.super.super.isa);
    v61 = objc_claimAutoreleasedReturnValue();
    moreBookmarksParent = v2->_moreBookmarksParent;
    v2->_moreBookmarksParent = (WebBookmark *)v61;

    _WBSLocalizedString();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[WebBookmark setTitle:](v2->_moreBookmarksParent, "setTitle:", v63);

    v2->_moreBookmarksOffset = v39;
  }
  -[BookmarksBarView _repositionBookmarksNavigationController]((uint64_t)v2);
  -[BookmarksBarView updateAccessibilityIdentifier](v2);
  v2->_isPerformingLayout = 0;
}

- (void)updateAccessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a1[68], CFSTR("DisplayMode"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WBSMakeAccessibilityIdentifier();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAccessibilityIdentifier:", v4);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[BookmarksBarView setNeedsReloadData](self, "setNeedsReloadData");
}

- (void)setNeedsReloadData
{
  self->_needsReloadBookmarkLabels = 1;
  -[BookmarksBarView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsIcons:(BOOL)a3
{
  if (self->_showsIcons != a3)
  {
    self->_showsIcons = a3;
    -[BookmarksBarView setNeedsReloadData](self, "setNeedsReloadData");
  }
}

- (void)setButtonStyle:(int64_t)a3
{
  if (self->_buttonStyle != a3)
  {
    self->_buttonStyle = a3;
    -[BookmarksBarView setNeedsReloadData](self, "setNeedsReloadData");
  }
}

- (void)_didChangeHorizontalSizeClass
{
  void *v3;
  uint64_t v4;

  -[BookmarksBarView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 == 1)
    -[BookmarksBarView _dismissCurrentBookmarksPopover]((uint64_t)self);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BookmarksNavigationController setBookmarksNavigationControllerDelegate:](self->_bookmarksNavigationController, "setBookmarksNavigationControllerDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BookmarksBarView;
  -[BookmarksBarView dealloc](&v4, sel_dealloc);
}

- (BOOL)showsSeparator
{
  return self->_separator != 0;
}

- (void)setShowsSeparator:(BOOL)a3
{
  UIView *separator;
  UIView *v5;
  UIView *v6;
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
  UIView *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  separator = self->_separator;
  if (a3)
  {
    if (!separator)
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v6 = self->_separator;
      self->_separator = v5;

      objc_msgSend(MEMORY[0x1E0DC3658], "sf_tabSeparatorColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](self->_separator, "setBackgroundColor:", v7);

      -[UIView layer](self->_separator, "layer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCornerRadius:", 0.5);

      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_separator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[BookmarksBarView addSubview:](self, "addSubview:", self->_separator);
      -[BookmarksBarView layoutMarginsGuide](self, "layoutMarginsGuide");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3718];
      -[UIView leadingAnchor](self->_separator, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v21;
      -[UIView bottomAnchor](self->_separator, "bottomAnchor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BookmarksBarView bottomAnchor](self, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, 4.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = v12;
      objc_msgSend(v9, "trailingAnchor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView trailingAnchor](self->_separator, "trailingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v24[2] = v15;
      -[UIView heightAnchor](self->_separator, "heightAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToConstant:", 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[3] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v18);

    }
  }
  else if (separator)
  {
    -[UIView removeFromSuperview](separator, "removeFromSuperview");
    v19 = self->_separator;
    self->_separator = 0;

  }
}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  _SFNavigationIntentHandling **p_navigationIntentHandler;
  id v6;
  id v7;
  id WeakRetained;

  p_navigationIntentHandler = &self->_navigationIntentHandler;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_navigationIntentHandler);
  objc_msgSend(WeakRetained, "handleNavigationIntent:completion:", v7, v6);

}

- (void)dispatchNavigationIntent:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  if (self->_isShowingNavigationController)
  {
    -[BookmarksNavigationController dismissViewControllerAnimated:completion:](self->_bookmarksNavigationController, "dismissViewControllerAnimated:completion:", 1, 0);
    -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
  }
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v5);

}

- (void)setThemeColor:(id)a3
{
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_themeColor, a3);
    if (!self->_needsReloadBookmarkLabels)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = self->_bookmarkBarLabels;
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setThemeColor:", v5, (_QWORD)v11);
          }
          while (v8 != v10);
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)bookmarksNavigationControllerReloadDidFail:(id)a3
{
  if (self->_isShowingNavigationController)
  {
    -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
    -[BookmarksNavigationController dismissViewControllerAnimated:completion:](self->_bookmarksNavigationController, "dismissViewControllerAnimated:completion:", 1, 0);
    -[BookmarksBarView _clearBookmarksNavigationController]((uint64_t)self);
  }
}

- (void)bookmarksNavigationControllerDidReload:(id)a3
{
  -[BookmarksBarView _createAllLabelButtonsIfNeeded]((uint64_t)self);
  self->_needsRepositionNavigationController = 1;
  if (!self->_isPerformingLayout)
    -[BookmarksBarView _repositionBookmarksNavigationController]((uint64_t)self);
}

- (void)bookmarksNavigationControllerViewDidAppear:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksBarView:bookmarksNavigationControllerViewDidAppear:", self, v5);

}

- (void)bookmarksNavigationControllerViewDidDisappear:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  self->_isShowingNavigationController = 0;
  -[BookmarksBarView _setButtonUsedToShowNavigationController:]((uint64_t)self, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "bookmarksBarView:bookmarksNavigationControllerViewDidDisappear:", self, v5);

}

- (TabGroupProvider)tabGroupProvider
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "tabGroupProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (TabGroupProvider *)v3;
}

- (void)bookmarksBarLabelButtonDidSelectOpenInNewTab:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;
  id v7;

  objc_msgSend(a3, "bookmark");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF70], "builder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersOpenInNewTab:", 1);
  objc_msgSend(v4, "navigationIntentWithBookmark:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
  objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v5);

}

- (void)bookmarksBarLabelButtonDidSelectEdit:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[BookmarksBarView browserController](self, "browserController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bookmark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "editBookmark:", v5);
}

- (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 23.0;
  v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)preferredBottomSpacing
{
  double v2;

  v2 = 8.0;
  if (!self->_separator)
    v2 = 0.0;
  return v2 + 3.0;
}

- (BookmarksBarViewDelegate)delegate
{
  return (BookmarksBarViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (LinkPreviewProvider)linkPreviewProvider
{
  return (LinkPreviewProvider *)objc_loadWeakRetained((id *)&self->_linkPreviewProvider);
}

- (void)setLinkPreviewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_linkPreviewProvider, a3);
}

- (_SFNavigationIntentHandling)navigationIntentHandler
{
  return (_SFNavigationIntentHandling *)objc_loadWeakRetained((id *)&self->_navigationIntentHandler);
}

- (void)setNavigationIntentHandler:(id)a3
{
  objc_storeWeak((id *)&self->_navigationIntentHandler, a3);
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (void)setBrowserController:(id)a3
{
  objc_storeWeak((id *)&self->_browserController, a3);
}

- (UIColor)themeColor
{
  return self->_themeColor;
}

- (BOOL)showsIcons
{
  return self->_showsIcons;
}

- (int64_t)buttonStyle
{
  return self->_buttonStyle;
}

- (WebBookmark)currentRootBookmark
{
  return self->_currentRootBookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRootBookmark, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
  objc_destroyWeak((id *)&self->_browserController);
  objc_destroyWeak((id *)&self->_navigationIntentHandler);
  objc_destroyWeak((id *)&self->_linkPreviewProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bookmarksNavigationController, 0);
  objc_storeStrong((id *)&self->_buttonUsedToShowNavigationController, 0);
  objc_storeStrong((id *)&self->_moreBookmarksParent, 0);
  objc_storeStrong((id *)&self->_moreBookmarksButton, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_bookmarkBarLabels, 0);
}

- (void)_presentCurrentBookmarksPopoverFromButton:(uint64_t)a1 animated:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 488);
  v3 = a2;
  objc_msgSend(v2, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Trying to present bookmarks from popover button when it is already presented by: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
