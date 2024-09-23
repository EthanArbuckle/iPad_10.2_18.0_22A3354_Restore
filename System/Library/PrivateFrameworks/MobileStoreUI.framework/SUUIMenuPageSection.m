@implementation SUUIMenuPageSection

- (SUUIMenuPageSection)initWithPageComponent:(id)a3
{
  id v4;
  SUUIMenuPageSection *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUUIMenuPageSection;
  v5 = -[SUUIStorePageSection initWithPageComponent:](&v7, sel_initWithPageComponent_, v4);
  if (v5)
    v5->_selectedIndex = objc_msgSend(v4, "defaultSelectedIndex");

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIMenuViewController setDelegate:](self->_moreListMenuViewController, "setDelegate:", 0);
  -[UIPopoverController setDelegate:](self->_moreListPopoverController, "setDelegate:", 0);
  -[SUUIPopupMenuHeaderView setDelegate:](self->_popupHeaderView, "setDelegate:", 0);
  -[UIBarButtonItem setTarget:](self->_cancelMenuItem, "setTarget:", 0);
  -[SUUIPillsControl removeTarget:action:forControlEvents:](self->_pillsControl, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIMenuPageSection;
  -[SUUIStorePageSection dealloc](&v3, sel_dealloc);
}

- (id)backgroundColorForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ikBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "color");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SUUIMenuPageSection;
    -[SUUIStorePageSection backgroundColorForIndexPath:](&v13, sel_backgroundColorForIndexPath_, v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)cellForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SUUIStorePageSection context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("SUUIMenuPageSectionReuseIdentifier"), v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContentInsets:", *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
  -[SUUIMenuPageSection _contentChildView](self, "_contentChildView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContentChildView:", v8);

  return v7;
}

- (CGSize)cellSizeForIndexPath:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[SUUIMenuPageSection _contentChildView](self, "_contentChildView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[SUUIStorePageSection context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activePageWidth");
  v9 = v8;

  v10 = v9;
  v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)numberOfCells
{
  return 1;
}

- (UIEdgeInsets)sectionContentInset
{
  _BOOL4 v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = -[SUUIStorePageSection isTopSection](self, "isTopSection");
  v3 = 15.0;
  if (v2)
    v3 = 7.0;
  v4 = 0.0;
  v5 = 8.0;
  v6 = 0.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)willAppearInContext:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("SUUIMenuPageSectionReuseIdentifier"));
  v6.receiver = self;
  v6.super_class = (Class)SUUIMenuPageSection;
  -[SUUIStorePageSection willAppearInContext:](&v6, sel_willAppearInContext_, v4);

}

- (void)menuViewController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a3, "setIndexOfCheckedTitle:", a4);
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v8 = 2;
  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = 4;
  -[SUUIMenuPageSection _setSelectedIndex:](self, "_setSelectedIndex:", v8 + a4);
  -[SUUIMenuPageSection _dismissMenuViewController](self, "_dismissMenuViewController");
}

- (void)popupMenuHeader:(id)a3 didSelectMenuItemAtIndex:(int64_t)a4
{
  -[SUUIMenuPageSection _setSelectedIndex:](self, "_setSelectedIndex:", a4);
}

- (void)sortDataRequest:(id)a3 didFinishWithLockups:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char v13;
  SUUIGridComponent *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "sortURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfItems");
  if (v9 >= 1)
  {
    v10 = v9;
    v11 = 0;
    while (1)
    {
      objc_msgSend(v8, "sortURLForIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v7, "isEqual:", v12);

      if ((v13 & 1) != 0)
        break;
      if (v10 == ++v11)
        goto LABEL_8;
    }
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = -[SUUIGridComponent initWithLockups:]([SUUIGridComponent alloc], "initWithLockups:", v6);
      v18[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setChildComponents:forIndex:", v15, v11);

      -[NSMutableIndexSet removeIndex:](self->_sortRequestIndexSet, "removeIndex:", v11);
      -[SUUIStorePageSection context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "parentViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_updateSectionsForIndex:menuSection:", v11, self);

    }
  }
LABEL_8:

}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  SUUIMenuViewController *moreListMenuViewController;
  UIPopoverController *moreListPopoverController;

  -[SUUIMenuPageSection _restorePreviousSelection](self, "_restorePreviousSelection", a3);
  -[SUUIMenuViewController setDelegate:](self->_moreListMenuViewController, "setDelegate:", 0);
  moreListMenuViewController = self->_moreListMenuViewController;
  self->_moreListMenuViewController = 0;

  -[UIPopoverController setDelegate:](self->_moreListPopoverController, "setDelegate:", 0);
  moreListPopoverController = self->_moreListPopoverController;
  self->_moreListPopoverController = 0;

}

- (void)_cancelMenuAction:(id)a3
{
  -[SUUIMenuPageSection _restorePreviousSelection](self, "_restorePreviousSelection", a3);
  -[SUUIMenuPageSection _dismissMenuViewController](self, "_dismissMenuViewController");
}

- (void)_pillAction:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  -[SUUIStorePageSection pageComponent](self, "pageComponent", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfItems");

  v6 = -[SUUIPillsControl selectedIndex](self->_pillsControl, "selectedIndex");
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = 3;
  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v9 = 5;
  if (v5 <= v9)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = 2;
  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v12 = 4;
  if (v6 == v12)
    -[SUUIMenuPageSection _showMoreList](self, "_showMoreList");
  else
LABEL_8:
    -[SUUIMenuPageSection _setSelectedIndex:](self, "_setSelectedIndex:", v6);
}

- (id)_contentChildView
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  -[SUUIStorePageSection pageComponent](self, "pageComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "menuStyle");

  if (v4
    && (objc_msgSend(MEMORY[0x24BEBD538], "currentDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "userInterfaceIdiom"),
        v5,
        v6))
  {
    -[SUUIMenuPageSection _popupHeaderView](self, "_popupHeaderView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUUIMenuPageSection _pillsControl](self, "_pillsControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)_dismissMenuViewController
{
  UIBarButtonItem *cancelMenuItem;
  UIPopoverController *v4;
  UIBarButtonItem *v5;
  SUUIMenuViewController *moreListMenuViewController;
  UIPopoverController *moreListPopoverController;
  void *v8;
  void *v9;
  SUUIMenuViewController *v10;

  v10 = self->_moreListMenuViewController;
  cancelMenuItem = self->_cancelMenuItem;
  v4 = self->_moreListPopoverController;
  -[UIBarButtonItem setTarget:](cancelMenuItem, "setTarget:", 0);
  v5 = self->_cancelMenuItem;
  self->_cancelMenuItem = 0;

  -[SUUIMenuViewController setDelegate:](self->_moreListMenuViewController, "setDelegate:", 0);
  moreListMenuViewController = self->_moreListMenuViewController;
  self->_moreListMenuViewController = 0;

  -[UIPopoverController setDelegate:](self->_moreListPopoverController, "setDelegate:", 0);
  moreListPopoverController = self->_moreListPopoverController;
  self->_moreListPopoverController = 0;

  if (v4)
    -[UIPopoverController dismissPopoverAnimated:](v4, "dismissPopoverAnimated:", 1);
  else
    -[SUUIMenuViewController dismissViewControllerAnimated:completion:](v10, "dismissViewControllerAnimated:completion:", 1, 0);

  -[SUUIStorePageSection context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_endIgnoringSectionChanges");

}

- (void)_loadSortDataIfNecessaryForMenuIndex:(int64_t)a3 reason:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  SUUISortDataRequest *v10;
  NSMutableIndexSet *sortRequestIndexSet;
  NSMutableIndexSet *v12;
  NSMutableIndexSet *v13;
  void *v14;
  void *v15;
  id v16;

  if ((-[NSMutableIndexSet containsIndex:](self->_sortRequestIndexSet, "containsIndex:") & 1) == 0)
  {
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "childComponentsForIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v16;
    if (!v7)
    {
      objc_msgSend(v16, "sortURLForIndex:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[SUUISortDataRequest initWithSortURL:]([SUUISortDataRequest alloc], "initWithSortURL:", v9);
        -[SUUISortDataRequest setDelegate:](v10, "setDelegate:", self);
        sortRequestIndexSet = self->_sortRequestIndexSet;
        if (!sortRequestIndexSet)
        {
          v12 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
          v13 = self->_sortRequestIndexSet;
          self->_sortRequestIndexSet = v12;

          sortRequestIndexSet = self->_sortRequestIndexSet;
        }
        -[NSMutableIndexSet addIndex:](sortRequestIndexSet, "addIndex:", a3);
        -[SUUIStorePageSection context](self, "context");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "resourceLoader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "loadResourceWithRequest:reason:", v10, a4);

      }
      v8 = v16;
    }

  }
}

- (id)_newMenuViewController
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  SUUIMenuViewController *v8;
  int64_t selectedIndex;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v5 = 4;
  else
    v5 = 2;
  -[SUUIPillsControl titles](self->_pillsControl, "titles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subarrayWithRange:", v5, objc_msgSend(v6, "count") - v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SUUIMenuViewController initWithMenuTitles:]([SUUIMenuViewController alloc], "initWithMenuTitles:", v7);
  -[SUUIMenuViewController setDelegate:](v8, "setDelegate:", self);
  selectedIndex = self->_selectedIndex;
  if (selectedIndex >= v5)
    -[SUUIMenuViewController setIndexOfCheckedTitle:](v8, "setIndexOfCheckedTitle:", selectedIndex - v5);

  return v8;
}

- (id)_pillsControl
{
  SUUIPillsControl *pillsControl;
  SUUIPillsControl *v4;
  SUUIPillsControl *v5;
  SUUIPillsControl *v6;
  void *v7;
  void *v8;
  SUUIPillsControl *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  SUUIPillsControl *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SUUIPillsControl *v23;
  void *v24;
  SUUIPillsControl *v25;
  int64_t selectedIndex;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  pillsControl = self->_pillsControl;
  if (!pillsControl)
  {
    v4 = objc_alloc_init(SUUIPillsControl);
    v5 = self->_pillsControl;
    self->_pillsControl = v4;

    -[SUUIPillsControl addTarget:action:forControlEvents:](self->_pillsControl, "addTarget:action:forControlEvents:", self, sel__pillAction_, 4096);
    v6 = self->_pillsControl;
    -[SUUIStorePageSection context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "colorScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPillsControl setColorScheme:](v6, "setColorScheme:", v8);

    v9 = self->_pillsControl;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "userInterfaceIdiom");

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v12 = 5;
    else
      v12 = 3;
    -[SUUIPillsControl setMaximumNumberOfVisiblePills:](v9, "setMaximumNumberOfVisiblePills:", v12);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_pillsControl;
    objc_msgSend(v13, "allTitles");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPillsControl setTitles:](v14, "setTitles:", v15);

    objc_msgSend(v13, "viewElement");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "style");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SUUIViewElementPlainColorWithStyle(v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUUIPillsControl setTintColor:](self->_pillsControl, "setTintColor:", v18);
    -[SUUIStorePageSection context](self, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "parentViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "clientContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "titleForMoreItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self->_pillsControl;
    if (v22)
    {
      -[SUUIPillsControl setMoreListTitle:](self->_pillsControl, "setMoreListTitle:", v22);
    }
    else
    {
      if (v21)
        objc_msgSend(v21, "localizedStringForKey:", CFSTR("TABS_MORE_LIST_TITLE"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("TABS_MORE_LIST_TITLE"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIPillsControl setMoreListTitle:](v23, "setMoreListTitle:", v24);

    }
    -[SUUIPillsControl setContentInset:](self->_pillsControl, "setContentInset:", 0.0, 15.0, 0.0, 15.0);
    -[SUUIPillsControl reloadPills](self->_pillsControl, "reloadPills");
    v25 = self->_pillsControl;
    selectedIndex = self->_selectedIndex;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceIdiom");

    v29 = 2;
    if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v29 = 4;
    if (selectedIndex >= v29)
      v30 = v29;
    else
      v30 = selectedIndex;
    -[SUUIPillsControl setSelectedIndex:](v25, "setSelectedIndex:", v30);
    -[SUUIPillsControl sizeToFit](self->_pillsControl, "sizeToFit");

    pillsControl = self->_pillsControl;
  }
  return pillsControl;
}

- (id)_popupHeaderView
{
  SUUIPopupMenuHeaderView *popupHeaderView;
  SUUIPopupMenuHeaderView *v4;
  SUUIPopupMenuHeaderView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SUUIPopupMenuHeaderView *v11;
  void *v12;
  SUUIPopupMenuHeaderView *v13;
  void *v14;
  SUUIPopupMenuHeaderView *v15;
  void *v16;
  void *v17;

  popupHeaderView = self->_popupHeaderView;
  if (!popupHeaderView)
  {
    v4 = objc_alloc_init(SUUIPopupMenuHeaderView);
    v5 = self->_popupHeaderView;
    self->_popupHeaderView = v4;

    -[SUUIPopupMenuHeaderView setDelegate:](self->_popupHeaderView, "setDelegate:", self);
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "menuTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[SUUIPopupMenuHeaderView setTitle:](self->_popupHeaderView, "setTitle:", v7);
    -[SUUIStorePageSection context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "parentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = self->_popupHeaderView;
    if (v10)
      objc_msgSend(v10, "localizedStringForKey:", CFSTR("POPUP_SORT_BY"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("POPUP_SORT_BY"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPopupMenuHeaderView setMenuLabelTitle:](v11, "setMenuLabelTitle:", v12);

    v13 = self->_popupHeaderView;
    objc_msgSend(v6, "allTitles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPopupMenuHeaderView setMenuItemTitles:](v13, "setMenuItemTitles:", v14);

    v15 = self->_popupHeaderView;
    -[SUUIStorePageSection context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "colorScheme");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPopupMenuHeaderView setColoringWithColorScheme:](v15, "setColoringWithColorScheme:", v17);

    -[SUUIPopupMenuHeaderView setSelectedMenuItemIndex:](self->_popupHeaderView, "setSelectedMenuItemIndex:", self->_selectedIndex);
    -[SUUIPopupMenuHeaderView sizeToFit](self->_popupHeaderView, "sizeToFit");

    popupHeaderView = self->_popupHeaderView;
  }
  return popupHeaderView;
}

- (void)_restorePreviousSelection
{
  int64_t selectedIndex;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  selectedIndex = self->_selectedIndex;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = 2;
  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v6 = 4;
  if (selectedIndex >= v6)
    v7 = v6;
  else
    v7 = selectedIndex;
  -[SUUIPillsControl reloadPills](self->_pillsControl, "reloadPills");
  -[SUUIPillsControl setSelectedIndex:](self->_pillsControl, "setSelectedIndex:", v7);
}

- (void)_setSelectedIndex:(int64_t)a3
{
  void *v4;
  int64_t selectedIndex;
  void *v6;
  void *v7;
  id v8;

  if (self->_selectedIndex != a3)
  {
    self->_selectedIndex = a3;
    -[SUUIStorePageSection pageComponent](self, "pageComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewElement");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    selectedIndex = self->_selectedIndex;
    if (v8)
    {
      objc_msgSend(v8, "dispatchEventOfType:forItemAtIndex:", 2, selectedIndex);
    }
    else
    {
      -[SUUIMenuPageSection _loadSortDataIfNecessaryForMenuIndex:reason:](self, "_loadSortDataIfNecessaryForMenuIndex:reason:", selectedIndex, 1);
      -[SUUIStorePageSection context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "parentViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_setSelectedIndex:forMenuSection:", self->_selectedIndex, self);

    }
  }
}

- (void)_showMenuViewController
{
  void *v3;
  SUUIMenuViewController *v4;
  SUUIMenuViewController *moreListMenuViewController;
  SUUIMenuViewController *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *cancelMenuItem;
  UIBarButtonItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  if (!self->_moreListMenuViewController)
  {
    -[SUUIStorePageSection context](self, "context");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "parentViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[SUUIMenuPageSection _newMenuViewController](self, "_newMenuViewController");
    moreListMenuViewController = self->_moreListMenuViewController;
    self->_moreListMenuViewController = v4;

    v6 = self->_moreListMenuViewController;
    -[SUUIPillsControl moreListTitle](self->_pillsControl, "moreListTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIMenuViewController setTitle:](v6, "setTitle:", v7);

    v8 = (UIBarButtonItem *)objc_alloc_init(MEMORY[0x24BEBD410]);
    cancelMenuItem = self->_cancelMenuItem;
    self->_cancelMenuItem = v8;

    -[UIBarButtonItem setAction:](self->_cancelMenuItem, "setAction:", sel__cancelMenuAction_);
    -[UIBarButtonItem setStyle:](self->_cancelMenuItem, "setStyle:", 2);
    -[UIBarButtonItem setTarget:](self->_cancelMenuItem, "setTarget:", self);
    v10 = self->_cancelMenuItem;
    objc_msgSend(v16, "clientContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      objc_msgSend(v11, "localizedStringForKey:", CFSTR("CANCEL"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CANCEL"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIBarButtonItem setTitle:](v10, "setTitle:", v13);

    -[SUUIMenuViewController navigationItem](self->_moreListMenuViewController, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLeftBarButtonItem:", self->_cancelMenuItem);

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", self->_moreListMenuViewController);
    objc_msgSend(v3, "presentViewController:animated:completion:", v15, 1, 0);
    objc_msgSend(v3, "_beginIgnoringSectionChanges");

  }
}

- (void)_showMoreList
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    -[SUUIMenuPageSection _showPopoverController](self, "_showPopoverController");
  else
    -[SUUIMenuPageSection _showMenuViewController](self, "_showMenuViewController");
}

- (void)_showPopoverController
{
  SUUIMenuViewController *v3;
  SUUIMenuViewController *moreListMenuViewController;
  void *v5;
  double v6;
  UIPopoverController *v7;
  UIPopoverController *moreListPopoverController;
  UIPopoverController *v9;
  void *v10;
  id v11;

  if (!self->_moreListPopoverController)
  {
    v3 = -[SUUIMenuPageSection _newMenuViewController](self, "_newMenuViewController");
    moreListMenuViewController = self->_moreListMenuViewController;
    self->_moreListMenuViewController = v3;

    -[SUUIMenuViewController setDelegate:](self->_moreListMenuViewController, "setDelegate:", self);
    -[SUUIMenuViewController menuTitles](self->_moreListMenuViewController, "menuTitles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (float)((float)(unint64_t)objc_msgSend(v5, "count") * 45.0);

    -[SUUIMenuViewController setPreferredContentSize:](self->_moreListMenuViewController, "setPreferredContentSize:", 320.0, v6);
    v7 = (UIPopoverController *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD858]), "initWithContentViewController:", self->_moreListMenuViewController);
    moreListPopoverController = self->_moreListPopoverController;
    self->_moreListPopoverController = v7;

    -[UIPopoverController setDelegate:](self->_moreListPopoverController, "setDelegate:", self);
    -[UIPopoverController setPopoverContentSize:](self->_moreListPopoverController, "setPopoverContentSize:", 320.0, v6);
    v9 = self->_moreListPopoverController;
    -[SUUIPillsControl selectedPillFrame](self->_pillsControl, "selectedPillFrame");
    -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v9, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_pillsControl, 1, 1);
    -[SUUIStorePageSection context](self, "context");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "parentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_beginIgnoringSectionChanges");

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortRequestIndexSet, 0);
  objc_storeStrong((id *)&self->_popupHeaderView, 0);
  objc_storeStrong((id *)&self->_moreListPopoverController, 0);
  objc_storeStrong((id *)&self->_moreListMenuViewController, 0);
  objc_storeStrong((id *)&self->_pillsControl, 0);
  objc_storeStrong((id *)&self->_cancelMenuItem, 0);
}

@end
