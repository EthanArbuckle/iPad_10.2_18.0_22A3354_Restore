@implementation HUSearchableItemTableViewController

- (HUSearchableItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 searchBar:(id)a5 searchBarPosition:(unint64_t)a6
{
  id v10;
  HUSearchableItemTableViewController *v11;
  id v12;
  id *p_searchBar;
  UIScrollView *v14;
  UIScrollView *searchBarWrapper;
  void *v16;
  void *v17;
  objc_super v19;

  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HUSearchableItemTableViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v19, sel_initWithItemManager_tableViewStyle_, a3, a4);
  if (v11)
  {
    v12 = v10;
    if (!v10)
      v12 = objc_alloc_init(MEMORY[0x1E0CEA978]);
    p_searchBar = (id *)&v11->_searchBar;
    objc_storeStrong((id *)&v11->_searchBar, v12);
    if (!v10)

    v14 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0CEA970]);
    searchBarWrapper = v11->_searchBarWrapper;
    v11->_searchBarWrapper = v14;

    v11->_searchBarPosition = a6;
    objc_msgSend(*p_searchBar, "searchTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v11);

    objc_msgSend(*p_searchBar, "searchTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTarget:action:forControlEvents:", v11, sel_textFieldDidChange_, 0x20000);

  }
  return v11;
}

- (HUSearchableItemTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  return -[HUSearchableItemTableViewController initWithItemManager:tableViewStyle:searchBar:searchBarPosition:](self, "initWithItemManager:tableViewStyle:searchBar:searchBarPosition:", a3, a4, 0, 0);
}

- (void)updateForSearch
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v10;

  -[HUSearchableItemTableViewController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__HUSearchableItemTableViewController_updateForSearch__block_invoke;
  aBlock[3] = &unk_1E6F4DAD8;
  v6 = v5;
  v10 = v6;
  v7 = _Block_copy(aBlock);
  if (!objc_msgSend(v6, "length"))
  {

    v7 = 0;
  }
  -[HUItemTableViewController itemManager](self, "itemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setDisplayFilter:recalculateVisibility:", v7, 1);

}

BOOL __54__HUSearchableItemTableViewController_updateForSearch__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 129) != 0x7FFFFFFFFFFFFFFFLL;
  return v5;
}

- (void)viewDidLoad
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUSearchableItemTableViewController;
  -[HUItemTableViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = -[HUSearchableItemTableViewController searchBarPosition](self, "searchBarPosition");
  if (v3 == 1)
  {
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSearchableItemTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTableHeaderView:", v4);
    goto LABEL_5;
  }
  if (!v3)
  {
    -[HUSearchableItemTableViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);
LABEL_5:

  }
  -[HUSearchableItemTableViewController setupSearchBar](self, "setupSearchBar");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HUSearchableItemTableViewController;
  -[HUItemTableViewController viewDidLayoutSubviews](&v31, sel_viewDidLayoutSubviews);
  if (!-[HUSearchableItemTableViewController searchBarPosition](self, "searchBarPosition"))
  {
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;

    -[HUSearchableItemTableViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[HUSearchableItemTableViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentInset:", v5, v8, v10, v12);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[HUSearchableItemTableViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "contentOffset");
    v23 = v22;

    -[HUSearchableItemTableViewController navigationController](self, "navigationController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "navigationBar");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isTranslucent");

    if (v26)
    {
      -[HUSearchableItemTableViewController navigationController](self, "navigationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "navigationBar");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bounds");
      v23 = v23 + v29;

    }
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFrame:", v16, v23, v18, v20);

  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HUSearchableItemTableViewController searchBar](self, "searchBar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  -[HUSearchableItemTableViewController searchBar](self, "searchBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resignFirstResponder");

  -[HUSearchableItemTableViewController updateForSearch](self, "updateForSearch");
}

- (void)setupSearchBar
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  -[HUSearchableItemTableViewController searchBar](self, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
  {
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSearchableItemTableViewController searchBar](self, "searchBar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[HUSearchableItemTableViewController searchBar](self, "searchBar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v25 = (void *)MEMORY[0x1E0CB3718];
    -[HUSearchableItemTableViewController searchBar](self, "searchBar");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSearchableItemTableViewController tableView](self, "tableView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v27;
    -[HUSearchableItemTableViewController searchBar](self, "searchBar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v12;
    -[HUSearchableItemTableViewController searchBar](self, "searchBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "activateConstraints:", v18);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBounces:", 0);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCanCancelContentTouches:", 0);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setScrollsToTop:", 0);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShowsHorizontalScrollIndicator:", 0);

    -[HUSearchableItemTableViewController searchBarWrapper](self, "searchBarWrapper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setShowsVerticalScrollIndicator:", 0);

  }
}

- (HUSearchBar)searchBar
{
  return self->_searchBar;
}

- (unint64_t)searchBarPosition
{
  return self->_searchBarPosition;
}

- (UIScrollView)searchBarWrapper
{
  return self->_searchBarWrapper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarWrapper, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
}

@end
