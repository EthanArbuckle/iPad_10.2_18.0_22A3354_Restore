@implementation AMUISwitcherViewController

- (AMUISwitcherViewController)initWithLayout:(id)a3
{
  id v4;
  AMUISwitcherViewController *v5;
  AMUISwitcherViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AMUISwitcherViewController;
  v5 = -[AMUISwitcherViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_layout, v4);

  return v6;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BSCompoundAssertion *unsettledAssertions;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_knownItems, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[AMUISwitcherViewController _detachItemRecord:](self, "_detachItemRecord:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[BSCompoundAssertion invalidate](self->_unsettledAssertions, "invalidate");
  unsettledAssertions = self->_unsettledAssertions;
  self->_unsettledAssertions = 0;

  v9.receiver = self;
  v9.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController dealloc](&v9, sel_dealloc);
}

- (BOOL)scrollToItem:(id)a3 animated:(BOOL)a4
{
  return -[AMUISwitcherViewController _scrollToIndex:animated:completion:](self, "_scrollToIndex:animated:completion:", -[AMUISwitcherViewController _indexOfItem:](self, "_indexOfItem:", a3), a4, 0);
}

- (BOOL)scrollToIdentifier:(id)a3 animated:(BOOL)a4
{
  return -[AMUISwitcherViewController _scrollToIndex:animated:completion:](self, "_scrollToIndex:animated:completion:", -[AMUISwitcherViewController _indexOfItemWithIdentifier:](self, "_indexOfItemWithIdentifier:", a3), a4, 0);
}

- (void)reload
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  self->_firstLayout = 1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_knownItems, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[AMUISwitcherViewController _detachItemRecord:](self, "_detachItemRecord:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_knownItems, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_visibleItems, "removeAllObjects");
  -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

}

- (void)reloadItemWithIdentifier:(id)a3
{
  int64_t v4;

  v4 = -[AMUISwitcherViewController _indexOfItemWithIdentifier:](self, "_indexOfItemWithIdentifier:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[AMUISwitcherViewController reloadItemAtIndex:](self, "reloadItemAtIndex:", v4);
}

- (void)reloadItemAtIndex:(int64_t)a3
{
  NSMutableDictionary *knownItems;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *visibleItems;
  void *v10;
  void *v11;
  id v12;

  knownItems = self->_knownItems;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](knownItems, "objectForKeyedSubscript:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[AMUISwitcherViewController _detachItemRecord:](self, "_detachItemRecord:", v12);
  v7 = self->_knownItems;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);

  visibleItems = self->_visibleItems;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](visibleItems, "removeObjectForKey:", v10);

  -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dataSource, obj);
    -[AMUISwitcherViewController reload](self, "reload");
    -[AMUISwitcherViewController _scrollToIndex:animated:completion:](self, "_scrollToIndex:animated:completion:", 0, 0, 0);
  }

}

- (NSArray)visibleIndices
{
  void *v3;

  -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  return (NSArray *)-[NSMutableDictionary allKeys](self->_visibleItems, "allKeys");
}

- (NSArray)visibleItems
{
  void *v3;
  void *v4;
  void *v5;

  -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[NSMutableDictionary allValues](self->_visibleItems, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_map:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

id __42__AMUISwitcherViewController_visibleItems__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_loadWeakRetained((id *)(a2 + 48));
  else
    return 0;
}

- (BOOL)isScrollingInteractively
{
  BSUIScrollView *scrollView;
  uint64_t v5;

  LODWORD(scrollView) = -[BSUIScrollView isScrolling](self->_scrollView, "isScrolling");
  if ((_DWORD)scrollView)
  {
    scrollView = self->_scrollView;
    if (scrollView)
    {
      -[BSUIScrollView currentScrollContext](scrollView, "currentScrollContext");
      LOBYTE(scrollView) = v5 == 3;
    }
  }
  return (char)scrollView;
}

- (BOOL)isScrollEnabled
{
  return -[BSUIScrollView isScrollEnabled](self->_scrollView, "isScrollEnabled");
}

- (void)setScrollEnabled:(BOOL)a3
{
  -[BSUIScrollView setScrollEnabled:](self->_scrollView, "setScrollEnabled:", a3);
}

- (double)presentationProgressForIdentifier:(id)a3
{
  double result;

  -[AMUISwitcherViewController _presentationProgressForItemIndex:](self, "_presentationProgressForItemIndex:", -[AMUISwitcherViewController _indexOfItemWithIdentifier:](self, "_indexOfItemWithIdentifier:", a3));
  return result;
}

- (double)presentationProgressForItem:(id)a3
{
  double result;

  -[AMUISwitcherViewController _presentationProgressForItemIndex:](self, "_presentationProgressForItemIndex:", -[AMUISwitcherViewController _indexOfItem:](self, "_indexOfItem:", a3));
  return result;
}

- (id)acquireUnsettledAssertionForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *unsettledAssertions;
  void *v6;
  void *v7;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  unsettledAssertions = self->_unsettledAssertions;
  if (!unsettledAssertions)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x24BE0BDE0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ambientSwitcherUnsettled-%p"), self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __65__AMUISwitcherViewController_acquireUnsettledAssertionForReason___block_invoke;
    v12[3] = &unk_2507632C8;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", v7, v12);
    v8 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v9 = self->_unsettledAssertions;
    self->_unsettledAssertions = v8;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    unsettledAssertions = self->_unsettledAssertions;
  }
  -[BSCompoundAssertion acquireForReason:](unsettledAssertions, "acquireForReason:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __65__AMUISwitcherViewController_acquireUnsettledAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  uint64_t v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = objc_msgSend(v3, "isActive");

  objc_msgSend(WeakRetained, "_updateForUnsettled:", v4);
}

- (void)viewDidLoad
{
  NSMutableDictionary *v3;
  NSMutableDictionary *visibleItems;
  NSMutableDictionary *v5;
  NSMutableDictionary *knownItems;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BSUIScrollView *scrollView;
  id v14;
  void *v15;
  void *v16;
  NSLayoutConstraint *v17;
  NSLayoutConstraint *horizontalTrailingSpacerConstraint;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  NSLayoutConstraint *verticalTrailingSpacerConstraint;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSLayoutConstraint *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewDidLoad](&v33, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  visibleItems = self->_visibleItems;
  self->_visibleItems = v3;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  knownItems = self->_knownItems;
  self->_knownItems = v5;

  -[AMUISwitcherViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x24BE0BF40]);
  objc_msgSend(v7, "bounds");
  v9 = (void *)objc_msgSend(v8, "initWithFrame:");
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setPagingEnabled:", 1);
  objc_msgSend(v9, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v9, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v9, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v9, "setBounces:", 1);
  objc_msgSend(v9, "setDelegate:", self);
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[AMUISwitcherViewController _accessibilityIdentifierPrefix](self, "_accessibilityIdentifierPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-scroll-view"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", v12);

  scrollView = self->_scrollView;
  self->_scrollView = (BSUIScrollView *)v9;
  v14 = v9;

  objc_msgSend(v7, "addSubview:", v14);
  objc_msgSend(v7, "setClipsToBounds:", 1);
  objc_msgSend(v7, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 0.0);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  horizontalTrailingSpacerConstraint = self->_horizontalTrailingSpacerConstraint;
  self->_horizontalTrailingSpacerConstraint = v17;

  objc_msgSend(v7, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, 0.0);
  v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  verticalTrailingSpacerConstraint = self->_verticalTrailingSpacerConstraint;
  self->_verticalTrailingSpacerConstraint = v21;

  v31 = (void *)MEMORY[0x24BDD1628];
  v32 = v7;
  objc_msgSend(v7, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  objc_msgSend(v7, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "topAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self->_horizontalTrailingSpacerConstraint;
  v34[1] = v28;
  v34[2] = v29;
  v34[3] = self->_verticalTrailingSpacerConstraint;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "activateConstraints:", v30);

  objc_msgSend(v32, "setNeedsUpdateConstraints");
  -[AMUISwitcherViewController reload](self, "reload");
  -[AMUISwitcherViewController _scrollToIndex:animated:completion:](self, "_scrollToIndex:animated:completion:", 0, 0, 0);

}

- (void)updateViewConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController updateViewConstraints](&v3, sel_updateViewConstraints);
  -[AMUISwitcherViewController _updateTrailingSpacerConstraints](self, "_updateTrailingSpacerConstraints");
}

- (void)viewWillLayoutSubviews
{
  AMUISwitcherViewController *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  unsigned __int8 v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  double v34;
  double v35;
  int64_t topItemIndex;
  uint64_t v37;
  int64_t v38;
  unint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  NSMutableDictionary *visibleItems;
  void *v52;
  uint64_t v53;
  id v55;
  NSMutableDictionary *v56;
  void *v57;
  void *v58;
  NSMutableDictionary *v59;
  void *v60;
  NSMutableDictionary *knownItems;
  void *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id *p_isa;
  void *v69;
  void *v70;
  id v71;
  id v72;
  __int128 v73;
  double v74;
  double v75;
  double v76;
  double v77;
  int v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  char v85;
  void *v86;
  double v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  char v93;
  id v94;
  int64_t v95;
  int64_t v96;
  char v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  objc_super v104;

  v2 = self;
  v104.receiver = self;
  v104.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewWillLayoutSubviews](&v104, sel_viewWillLayoutSubviews);
  -[AMUISwitcherViewController view](v2, "view");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&v2->_dataSource);
  -[AMUISwitcherViewController _switcherLayout](v2, "_switcherLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = WeakRetained;
  v5 = objc_msgSend(WeakRetained, "switcherNumberOfItems:", v2);
  v6 = objc_msgSend(v4, "isCircular");
  -[AMUISwitcherViewController _pageSize](v2, "_pageSize");
  v8 = v7;
  v10 = v9;
  v92 = v4;
  v11 = objc_msgSend(v4, "switcherAxis");
  v12 = v11;
  v13 = 3.0;
  if ((v6 & (v5 > 1)) == 0)
    v13 = (double)v5;
  if (v11)
    v14 = v10;
  else
    v14 = v8;
  if (v11)
    v15 = 1.0;
  else
    v15 = v13;
  v16 = v8 * v15;
  if (!v11)
    v13 = 1.0;
  -[BSUIScrollView setContentSize:](v2->_scrollView, "setContentSize:", v16, v10 * v13);
  if (!v2)
    v14 = 0.0;
  v97 = v6 & (v5 > 1);
  if (v97 == 1)
  {
    if (v2->_firstLayout)
    {
      v17 = *MEMORY[0x24BDBEFB0];
      v18 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (v12)
        v18 = v14;
      else
        v17 = v14;
      if (!v2)
      {
        v18 = 0.0;
        v17 = 0.0;
      }
      -[BSUIScrollView setContentOffset:](v2->_scrollView, "setContentOffset:", v17, v18);
      v2->_firstLayout = 0;
      goto LABEL_62;
    }
    -[BSUIScrollView contentOffset](v2->_scrollView, "contentOffset");
    v20 = v19;
    v22 = v21;
    -[BSUIScrollView contentSize](v2->_scrollView, "contentSize");
    if (v12)
      v25 = v22;
    else
      v25 = v20;
    if (v12)
      v23 = v24;
    if (v2)
      v26 = v25;
    else
      v26 = 0.0;
    v27 = v14 + v26;
    if (!v2)
      v23 = 0.0;
    if (v27 > v23)
    {
      v28 = v5 + v2->_topItemIndex + 1;
      do
        v28 -= v5;
      while (v28 >= v5);
      v2->_topItemIndex = v28;
      -[BSUIScrollView contentOffset](v2->_scrollView, "contentOffset");
      if (v12)
        v31 = v30;
      else
        v31 = v29;
      if (!v2)
        v31 = 0.0;
      v32 = v12 == 0;
      v33 = v31 - v14;
LABEL_56:
      if (v32)
        v29 = v33;
      else
        v30 = v33;
      if (!v2)
      {
        v30 = 0.0;
        v29 = 0.0;
      }
      -[BSUIScrollView setContentOffset:](v2->_scrollView, "setContentOffset:", v29, v30);
      goto LABEL_62;
    }
    -[BSUIScrollView contentOffset](v2->_scrollView, "contentOffset");
    if (v12)
      v34 = v35;
    if (!v2)
      v34 = 0.0;
    if (v34 - v14 < 0.0)
    {
      topItemIndex = v2->_topItemIndex;
      v37 = ((topItemIndex - 1) & ~((topItemIndex - 1) >> 63)) + 1;
      if (v37 == topItemIndex)
        v38 = v2->_topItemIndex;
      else
        v38 = topItemIndex + 1;
      v32 = v37 == topItemIndex;
      v39 = (v37 - v38) / (unint64_t)v5;
      if (!v32)
        ++v39;
      v2->_topItemIndex = topItemIndex + v5 * v39 - 1;
      -[BSUIScrollView contentOffset](v2->_scrollView, "contentOffset");
      if (v12)
        v40 = v30;
      else
        v40 = v29;
      if (!v2)
        v40 = 0.0;
      v32 = v12 == 0;
      v33 = v14 + v40;
      goto LABEL_56;
    }
  }
LABEL_62:
  -[BSUIScrollView contentOffset](v2->_scrollView, "contentOffset");
  v90 = v12;
  if (v12)
    v41 = v42;
  if (v2)
    v43 = v41;
  else
    v43 = 0.0;
  v44 = v5 - 1;
  if (v5 >= 1)
  {
    v45 = 0;
    v46 = v6 & (v5 > 1);
    v96 = (uint64_t)(v43 / v14) - v46;
    v88 = v46;
    v95 = (uint64_t)((v14 + v43 + -1.0) / v14) - v46;
    v47 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v87 = *MEMORY[0x24BDBEFB0];
    v89 = v5;
    while (1)
    {
      v48 = v45;
      if ((v97 & 1) != 0)
        v48 = (v45 - v2->_topItemIndex) % v5;
      v49 = v48
          + v5 * (((v48 & ~(v48 >> 63)) - (v48 + ((unint64_t)v48 >> 63))) / v5 + ((unint64_t)v48 >> 63));
      v50 = -[AMUISwitcherViewController _shouldAdjustForRTL](v2, "_shouldAdjustForRTL") ? v44 : v45;
      visibleItems = v2->_visibleItems;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](visibleItems, "objectForKeyedSubscript:", v52);
      v53 = objc_claimAutoreleasedReturnValue();

      if (v49 >= v96 && v49 <= v95)
        break;
      if (v53)
      {
        v55 = objc_loadWeakRetained((id *)(v53 + 56));
        objc_msgSend(v55, "setHidden:", 1);
        -[_AMUISwitcherVisibleItemRecord setPresentationProgress:](v53, 0.0);
        v56 = v2->_visibleItems;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](v56, "removeObjectForKey:", v57);
LABEL_107:

      }
      ++v45;
      if (--v44 == -1)
        goto LABEL_111;
    }
    if (!v53)
    {
      objc_msgSend(v86, "switcher:itemAtIndex:", v2, v50);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      +[_AMUISwitcherVisibleItemRecord recordWithItem:index:forSwitcher:]((uint64_t)_AMUISwitcherVisibleItemRecord, v58, v50, v2);
      v53 = objc_claimAutoreleasedReturnValue();
      v59 = v2->_visibleItems;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v53, v60);

      knownItems = v2->_knownItems;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](knownItems, "setObject:forKeyedSubscript:", v53, v62);

      if (!v53)
      {

        v64 = 0;
        v57 = 0;
        v93 = 1;
        goto LABEL_86;
      }
      v63 = objc_loadWeakRetained((id *)(v53 + 64));
      if (v63)
      {
        -[AMUISwitcherViewController addChildViewController:](v2, "addChildViewController:", v63);
        objc_msgSend(v63, "didMoveToParentViewController:", v2);
      }

    }
    v64 = objc_loadWeakRetained((id *)(v53 + 48));
    v57 = objc_loadWeakRetained((id *)(v53 + 56));
    v93 = 0;
LABEL_86:
    v65 = (void *)MEMORY[0x24BDD17C8];
    -[AMUISwitcherViewController _accessibilityIdentifierPrefix](v2, "_accessibilityIdentifierPrefix");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v64;
    objc_msgSend(v64, "identifier");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "description");
    p_isa = (id *)&v2->super.super.super.isa;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringWithFormat:", CFSTR("%@-item,identifier:%@"), v66, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "setAccessibilityIdentifier:", v70);
    objc_msgSend(v57, "superview");
    v71 = (id)objc_claimAutoreleasedReturnValue();
    v72 = p_isa[121];

    v32 = v71 == v72;
    v2 = (AMUISwitcherViewController *)p_isa;
    if (!v32)
      objc_msgSend(p_isa[121], "addSubview:", v57);
    v102 = 0u;
    v103 = 0u;
    v101 = 0u;
    if (v57)
      objc_msgSend(v57, "transform");
    v73 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v98 = *MEMORY[0x24BDBD8B8];
    v99 = v73;
    v100 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    objc_msgSend(v57, "setTransform:", &v98);
    objc_msgSend(v57, "frame");
    objc_msgSend(v91, "bounds");
    v75 = v74;
    v77 = v76;
    v78 = objc_msgSend(p_isa, "_shouldAdjustForRTL");
    v79 = 0.0;
    v5 = v89;
    v55 = v94;
    if (v78)
      objc_msgSend(v92, "spacing", 0.0);
    v80 = v79 + (double)(v49 + v88) * v14;
    v81 = v87;
    if (!v90)
    {
      v81 = v79 + (double)(v49 + v88) * v14;
      v80 = v47;
    }
    if (!v2)
    {
      v80 = 0.0;
      v81 = 0.0;
    }
    if (v90)
      v82 = v80;
    else
      v82 = v81;
    if (!v2)
      v82 = 0.0;
    v83 = fmax(vabdd_f64(v82 - v79, v43) / v14, 0.0);
    if (v83 >= 1.0)
      v84 = 0.0;
    else
      v84 = 1.0 - v83;
    objc_msgSend(v57, "setFrame:", v81, v80, v75, v77);
    v98 = v101;
    v99 = v102;
    v100 = v103;
    objc_msgSend(v57, "setTransform:", &v98);
    objc_msgSend(v92, "switcher:updateItem:view:forPresentationProgress:", v2, v94, v57, v84);
    v85 = -[BSCompoundAssertion isActive](v2->_unsettledAssertions, "isActive");
    if ((v93 & 1) == 0)
    {
      *(_BYTE *)(v53 + 16) = v85;
      objc_msgSend((id)v53, "_updateAppearState");
    }
    -[_AMUISwitcherVisibleItemRecord setPresentationProgress:](v53, v84);
    objc_msgSend(v57, "setHidden:", 0);

    goto LABEL_107;
  }
LABEL_111:
  -[AMUISwitcherViewController _sendTransitionUpdate](v2, "_sendTransitionUpdate");

}

- (double)_size:(double)a3 valueOnAxis:(double)a4
{
  double result;

  if (a2)
    result = a4;
  if (!a1)
    return 0.0;
  return result;
}

- (double)_point:(double)a3 setValue:(double)a4 onAxis:(double)a5
{
  double result;

  if (!a2)
    result = a5;
  if (!a1)
    return 0.0;
  return result;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if (v10 && *(_QWORD *)(v10 + 32))
          -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)v10, 1, v3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v7);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewDidDisappear:](&v14, sel_viewDidDisappear_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:](*(id **)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewWillAppear:](&v17, sel_viewWillAppear_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          if (*(_QWORD *)(v10 + 32) == 3)
            v11 = 2;
          else
            v11 = *(_QWORD *)(v10 + 32);
        }
        else
        {
          v11 = 0;
        }
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)v10, v11, v3);
        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      v7 = v12;
    }
    while (v12);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)AMUISwitcherViewController;
  -[AMUISwitcherViewController viewDidAppear:](&v17, sel_viewDidAppear_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
          v11 = *(_QWORD *)(v10 + 32);
        else
          v11 = 0;
        -[_AMUISwitcherVisibleItemRecord sendCallbackForState:animated:]((id *)v10, v11, v3);
        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      v7 = v12;
    }
    while (v12);
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
          WeakRetained = objc_loadWeakRetained((id *)(v10 + 48));
        else
          WeakRetained = 0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "switcher:willMoveToWindow:", self, v4);

        ++v9;
      }
      while (v7 != v9);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 = v12;
    }
    while (v12);
  }

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        if (v11)
          WeakRetained = objc_loadWeakRetained((id *)(v11 + 48));
        else
          WeakRetained = 0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(WeakRetained, "switcher:didMoveToWindow:", self, v5);

        ++v10;
      }
      while (v8 != v10);
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v8 = v13;
    }
    while (v13);
  }

}

- (int64_t)switcherAxis
{
  return 0;
}

- (BOOL)isCircular
{
  return 0;
}

- (double)spacing
{
  return 0.0;
}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  void *v6;

  -[AMUISwitcherViewController view](self, "view", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsLayout");

  self->_lastScrollMethod = a4->var0;
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  int64_t lastScrollMethod;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  lastScrollMethod = self->_lastScrollMethod;
  self->_lastScrollMethod = 0;
  -[AMUISwitcherViewController delegate](self, "delegate", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  v6 = v9;
  if ((v5 & 1) != 0)
  {
    -[AMUISwitcherViewController visibleItems](self, "visibleItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v9, "switcher:didSettleOnItem:interactive:", self, v8, lastScrollMethod == 3);

    v6 = v9;
  }

}

- (id)_accessibilityIdentifierPrefix
{
  void *v2;
  uint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  -[AMUISwitcherViewController _switcherLayout](self, "_switcherLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "switcherAxis");
  v4 = CFSTR("vertical");
  if (!v3)
    v4 = CFSTR("horizontal");
  v5 = v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("amui-%@-switcher"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_switcherLayout
{
  void *WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);
  v4 = WeakRetained;
  if (!WeakRetained)
    WeakRetained = self;
  v5 = WeakRetained;

  return v5;
}

- (BOOL)_scrollToIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;

  v5 = a4;
  v8 = a5;
  -[AMUISwitcherViewController layout](self, "layout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = a3;
    if (-[AMUISwitcherViewController _shouldAdjustForRTL](self, "_shouldAdjustForRTL"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
      v10 = objc_msgSend(WeakRetained, "switcherNumberOfItems:", self) + ~a3;

    }
    if (objc_msgSend(v9, "isCircular"))
    {
      self->_topItemIndex = v10;
      self->_firstLayout = 1;
      -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNeedsLayout");

      if (v5)
      {
        v13 = (void *)MEMORY[0x24BDF6F90];
        -[AMUISwitcherViewController view](self, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __65__AMUISwitcherViewController__scrollToIndex_animated_completion___block_invoke_2;
        v26[3] = &unk_250763330;
        v27 = v8;
        objc_msgSend(v13, "transitionWithView:duration:options:animations:completion:", v14, 5242883, &__block_literal_global_44, v26, 0.25);

      }
      else
      {
        -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "layoutIfNeeded");

        if (v8)
          (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
      }
    }
    else
    {
      -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutIfNeeded");

      v16 = objc_msgSend(v9, "switcherAxis");
      -[AMUISwitcherViewController _pageSize](self, "_pageSize");
      if (v16)
        v17 = v18;
      if (!self)
        v17 = 0.0;
      v19 = v17 * (double)v10;
      if (v16)
        v20 = *MEMORY[0x24BDBEFB0];
      else
        v20 = v19;
      if (!v16)
        v19 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      if (self)
        v21 = v19;
      else
        v21 = 0.0;
      if (self)
        v22 = v20;
      else
        v22 = 0.0;
      -[BSUIScrollView setContentOffset:animated:completion:](self->_scrollView, "setContentOffset:animated:completion:", v5, v8, v22, v21);
      -[AMUISwitcherViewController viewIfLoaded](self, "viewIfLoaded");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutIfNeeded");

    }
  }

  return a3 != 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t __65__AMUISwitcherViewController__scrollToIndex_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)_indexOfItemWithIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "switcher:indexOfItemWithIdentifier:", self, v4);
  }
  else
  {
    v7 = objc_msgSend(WeakRetained, "switcherNumberOfItems:", self);
    if (v7 < 1)
    {
LABEL_7:
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = v7;
      v6 = 0;
      while (1)
      {
        objc_msgSend(WeakRetained, "switcher:itemAtIndex:", self, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = BSEqualObjects();

        if ((v11 & 1) != 0)
          break;
        if (v8 == ++v6)
          goto LABEL_7;
      }
    }
  }

  return v6;
}

- (int64_t)_indexOfItem:(id)a3
{
  id v4;
  id WeakRetained;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "switcher:indexOfItem:", self, v4);
  }
  else
  {
    v7 = objc_msgSend(WeakRetained, "switcherNumberOfItems:", self);
    if (v7 < 1)
    {
LABEL_7:
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v8 = v7;
      v6 = 0;
      while (1)
      {
        objc_msgSend(WeakRetained, "switcher:itemAtIndex:", self, v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = BSEqualObjects();

        if ((v10 & 1) != 0)
          break;
        if (v8 == ++v6)
          goto LABEL_7;
      }
    }
  }

  return v6;
}

- (void)_updateTrailingSpacerConstraints
{
  double v3;
  double v4;
  uint64_t v5;
  int *v6;
  int *v7;
  id v8;

  -[AMUISwitcherViewController _switcherLayout](self, "_switcherLayout");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "spacing");
  v4 = -v3;
  v5 = objc_msgSend(v8, "switcherAxis");
  if (v5)
    v6 = &OBJC_IVAR___AMUISwitcherViewController__verticalTrailingSpacerConstraint;
  else
    v6 = &OBJC_IVAR___AMUISwitcherViewController__horizontalTrailingSpacerConstraint;
  if (v5)
    v7 = &OBJC_IVAR___AMUISwitcherViewController__horizontalTrailingSpacerConstraint;
  else
    v7 = &OBJC_IVAR___AMUISwitcherViewController__verticalTrailingSpacerConstraint;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "setConstant:", v4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v7), "setConstant:", 0.0);

}

- (void)_noteTransitionFrom:(id)a3 to:(id)a4 progress:(double)a5
{
  id v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "switcher:transitioningFromItem:toItem:progress:", self, v10, v8, a5);

}

- (void)_sendTransitionUpdate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  id *v13;
  _QWORD *v14;
  uint64_t v15;
  AMUISwitcherViewController *v16;
  id WeakRetained;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_visibleItems, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v3)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    goto LABEL_22;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v21;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v2);
      v11 = *(_QWORD **)(*((_QWORD *)&v20 + 1) + 8 * v10);
      if (!v11)
      {

        v6 = 0;
        goto LABEL_16;
      }
      v12 = v11[4];
      if (v12 - 2 < 2)
      {
        v13 = (id *)v7;
        v7 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
      }
      else
      {
        if (v12 > 1)
          goto LABEL_12;
        v13 = v6;
        v6 = *(id **)(*((_QWORD *)&v20 + 1) + 8 * v10);
      }
      v14 = v11;

      v12 = v11[4];
LABEL_12:
      if (v12 == 2)
      {
        v8 = 1;
      }
      else if (v12 == 1)
      {
        v5 = 1;
      }
LABEL_16:
      ++v10;
    }
    while (v4 != v10);
    v15 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v4 = v15;
  }
  while (v15);
LABEL_22:

  if ((v8 & 1) != 0 || (v5 & 1) != 0)
  {
    v16 = self;
    -[AMUISwitcherViewController _beginTransitionIfNeededFromRecord:toRecord:](self, "_beginTransitionIfNeededFromRecord:toRecord:", v6, v7);
  }
  else
  {
    v16 = self;
    -[AMUISwitcherViewController _endTransitionIfNeeded](self, "_endTransitionIfNeeded");
  }
  -[AMUISwitcherViewController _noteTransitionProgressIfNeeded](v16, "_noteTransitionProgressIfNeeded");
  if (v7)
  {
    if (v6)
      WeakRetained = objc_loadWeakRetained(v6 + 6);
    else
      WeakRetained = 0;
    v18 = objc_loadWeakRetained((id *)(v7 + 48));
    -[AMUISwitcherViewController _noteTransitionFrom:to:progress:](v16, "_noteTransitionFrom:to:progress:", WeakRetained, v18, *(double *)(v7 + 24));

  }
}

- (BOOL)_beginTransitionIfNeededFromRecord:(id)a3 toRecord:(id)a4
{
  id v6;
  id v7;
  _AMUISwitcherTransitionContext *currentTransition;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BSUIScrollView *scrollView;
  double v14;
  double v15;
  _BOOL4 v16;
  double v17;
  _AMUISwitcherTransitionContext *v18;
  _AMUISwitcherTransitionContext *v19;

  v6 = a3;
  v7 = a4;
  currentTransition = self->_currentTransition;
  if (!currentTransition)
    goto LABEL_6;
  if ((-[_AMUISwitcherTransitionContext hasSameItemsAsFromRecord:toRecord:]((uint64_t)currentTransition, v6, v7) & 1) == 0)
    -[AMUISwitcherViewController _endTransitionIfNeeded](self, "_endTransitionIfNeeded");
  if (self->_currentTransition)
  {
    v9 = 0;
  }
  else
  {
LABEL_6:
    -[AMUISwitcherViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUISwitcherViewController _switcherLayout](self, "_switcherLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "switcherAxis");

    scrollView = self->_scrollView;
    if (v12)
      -[BSUIScrollView _verticalVelocity](scrollView, "_verticalVelocity");
    else
      -[BSUIScrollView _horizontalVelocity](scrollView, "_horizontalVelocity");
    v15 = v14;
    v16 = -[AMUISwitcherViewController _shouldAdjustForRTL](self, "_shouldAdjustForRTL");
    v17 = -v15;
    if (!v16)
      v17 = v15;
    +[_AMUISwitcherTransitionContext contextWithFromRecord:toRecord:direction:interactive:]((uint64_t)_AMUISwitcherTransitionContext, v6, v7, v17 < 0.0, self->_lastScrollMethod == 3);
    v18 = (_AMUISwitcherTransitionContext *)objc_claimAutoreleasedReturnValue();
    v19 = self->_currentTransition;
    self->_currentTransition = v18;

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "switcher:transitionDidBegin:", self, self->_currentTransition);

    v9 = 1;
  }

  return v9;
}

- (BOOL)_endTransitionIfNeeded
{
  _AMUISwitcherTransitionContext *currentTransition;
  void *v4;
  _AMUISwitcherTransitionContext *v5;

  currentTransition = self->_currentTransition;
  if (currentTransition)
  {
    -[AMUISwitcherViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "switcher:transitionDidEnd:", self, self->_currentTransition);
    v5 = self->_currentTransition;
    self->_currentTransition = 0;

  }
  return currentTransition != 0;
}

- (void)_noteTransitionProgressIfNeeded
{
  _AMUISwitcherTransitionContext *currentTransition;
  _AMUISwitcherVisibleItemRecord *toRecord;
  double presentationProgress;
  _AMUISwitcherVisibleItemRecord *fromRecord;
  double v7;
  id v8;

  if (self->_currentTransition)
  {
    -[AMUISwitcherViewController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      currentTransition = self->_currentTransition;
      if (currentTransition)
      {
        toRecord = currentTransition->_toRecord;
        if (toRecord)
        {
          presentationProgress = toRecord->_presentationProgress;
        }
        else
        {
          fromRecord = currentTransition->_fromRecord;
          if (fromRecord)
            v7 = fromRecord->_presentationProgress;
          else
            v7 = 0.0;
          presentationProgress = 1.0 - v7;
        }
      }
      else
      {
        presentationProgress = 0.0;
      }
      objc_msgSend(v8, "switcher:transitionDidUpdate:withProgress:", self, presentationProgress);
    }

  }
}

- (CGSize)_pageSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  -[AMUISwitcherViewController _switcherLayout](self, "_switcherLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spacing");
  v5 = v4;
  -[AMUISwitcherViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = objc_msgSend(v3, "switcherAxis");
  if (!v11)
    v8 = v5 + v8;
  v12 = -0.0;
  if (v11)
    v12 = v5;
  v13 = v10 + v12;

  v14 = v8;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)_detachItemRecord:(id)a3
{
  id *v4;
  id WeakRetained;
  id v6;
  id v7;
  BSUIScrollView *v8;
  BSUIScrollView *scrollView;
  AMUISwitcherViewController *v10;
  id *v11;

  v4 = (id *)a3;
  v11 = v4;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained(v4 + 7);
    v6 = objc_loadWeakRetained(v11 + 8);
    v7 = objc_loadWeakRetained(v11 + 6);
    *((_BYTE *)v11 + 16) = 0;
    objc_msgSend(v11, "_updateAppearState");
    v11[1] = 0;
    objc_msgSend(v11, "_updateAppearState");
  }
  else
  {
    v6 = 0;
    WeakRetained = 0;
    v7 = 0;
  }
  objc_msgSend(WeakRetained, "superview");
  v8 = (BSUIScrollView *)objc_claimAutoreleasedReturnValue();
  scrollView = self->_scrollView;

  if (v8 == scrollView)
    objc_msgSend(WeakRetained, "removeFromSuperview");
  objc_msgSend(v6, "parentViewController");
  v10 = (AMUISwitcherViewController *)objc_claimAutoreleasedReturnValue();

  if (v10 == self)
    -[AMUISwitcherViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "invalidate");

}

- (double)_presentationProgressForItemIndex:(int64_t)a3
{
  double v3;
  NSMutableDictionary *visibleItems;
  void *v5;
  double *v6;

  v3 = 0.0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    visibleItems = self->_visibleItems;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](visibleItems, "objectForKeyedSubscript:", v5);
    v6 = (double *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v3 = v6[3];

  }
  return v3;
}

- (BOOL)_shouldAdjustForRTL
{
  void *v2;
  BOOL v3;

  -[AMUISwitcherViewController _switcherLayout](self, "_switcherLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "switcherAxis"))
    v3 = 0;
  else
    v3 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection") == 1;

  return v3;
}

- (void)_updateForUnsettled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_visibleItems, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_BYTE **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v9)
        {
          v9[16] = a3;
          objc_msgSend(v9, "_updateAppearState");
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (AMUISwitcherDataSource)dataSource
{
  return (AMUISwitcherDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (AMUISwitcherDelegate)delegate
{
  return (AMUISwitcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AMUISwitcherLayout)layout
{
  return (AMUISwitcherLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_unsettledAssertions, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_knownItems, 0);
  objc_storeStrong((id *)&self->_visibleItems, 0);
  objc_storeStrong((id *)&self->_verticalTrailingSpacerConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalTrailingSpacerConstraint, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

@end
