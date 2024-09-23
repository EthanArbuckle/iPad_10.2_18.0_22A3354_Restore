@implementation _SearchBarContent

- (_SearchBarContent)initWithSearchBar:(id)a3
{
  id v4;
  _SearchBarContent *v5;
  _SearchBarContent *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SearchBarContent;
  v5 = -[_SearchBarContent initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_searchBar, v4);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SearchBarContent setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[_SearchBarContent buildSearchBarContent](v6, "buildSearchBarContent");
  }

  return v6;
}

- (void)buildSearchBarContent
{
  UIStackView *v3;
  UIStackView *searchBarContainerView;
  HKBarButtonItemControl *v5;
  HKBarButtonItemControl *upBarButton;
  double v7;
  void *v8;
  void *v9;
  HKBarButtonItemControl *v10;
  HKBarButtonItemControl *downBarButton;
  double v12;
  void *v13;
  void *v14;
  _SearchEntryWithMatchDisplay *v15;
  _SearchEntryWithMatchDisplay *v16;
  _SearchEntryWithMatchDisplay *searchEntry;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKBarButtonItemControl *v22;
  HKBarButtonItemControl *doneBarButton;
  double v24;
  HKBarButtonItemControl *v25;
  id WeakRetained;
  void *v27;
  void *v28;
  id v29;

  v3 = (UIStackView *)objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  searchBarContainerView = self->_searchBarContainerView;
  self->_searchBarContainerView = v3;

  -[UIStackView setAxis:](self->_searchBarContainerView, "setAxis:", 0);
  v5 = -[HKBarButtonItemControl initWithSystemItem:preferredHeight:collapseHeight:]([HKBarButtonItemControl alloc], "initWithSystemItem:preferredHeight:collapseHeight:", 103, 1, 36.0);
  upBarButton = self->_upBarButton;
  self->_upBarButton = v5;

  -[HKBarButtonItemControl addTarget:action:forControlEvents:](self->_upBarButton, "addTarget:action:forControlEvents:", self, sel_upAction_, 64);
  LODWORD(v7) = 1148846080;
  -[HKBarButtonItemControl setContentHuggingPriority:forAxis:](self->_upBarButton, "setContentHuggingPriority:forAxis:", 0, v7);
  -[HKBarButtonItemControl setHorizontalMargin:](self->_upBarButton, "setHorizontalMargin:", 4.0);
  -[HKBarButtonItemControl widthAnchor](self->_upBarButton, "widthAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintGreaterThanOrEqualToConstant:", 36.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  -[UIStackView addArrangedSubview:](self->_searchBarContainerView, "addArrangedSubview:", self->_upBarButton);
  v10 = -[HKBarButtonItemControl initWithSystemItem:preferredHeight:collapseHeight:]([HKBarButtonItemControl alloc], "initWithSystemItem:preferredHeight:collapseHeight:", 104, 1, 36.0);
  downBarButton = self->_downBarButton;
  self->_downBarButton = v10;

  -[HKBarButtonItemControl addTarget:action:forControlEvents:](self->_downBarButton, "addTarget:action:forControlEvents:", self, sel_downAction_, 64);
  LODWORD(v12) = 1148846080;
  -[HKBarButtonItemControl setContentHuggingPriority:forAxis:](self->_downBarButton, "setContentHuggingPriority:forAxis:", 0, v12);
  -[HKBarButtonItemControl setHorizontalMargin:](self->_downBarButton, "setHorizontalMargin:", 4.0);
  -[HKBarButtonItemControl widthAnchor](self->_downBarButton, "widthAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintGreaterThanOrEqualToConstant:", 36.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[UIStackView addArrangedSubview:](self->_searchBarContainerView, "addArrangedSubview:", self->_downBarButton);
  v15 = [_SearchEntryWithMatchDisplay alloc];
  v16 = -[_SearchEntryWithMatchDisplay initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  searchEntry = self->_searchEntry;
  self->_searchEntry = v16;

  -[_SearchEntryWithMatchDisplay setReturnKeyType:](self->_searchEntry, "setReturnKeyType:", 11);
  -[_SearchEntryWithMatchDisplay setAutocapitalizationType:](self->_searchEntry, "setAutocapitalizationType:", 0);
  -[_SearchEntryWithMatchDisplay setEnablesReturnKeyAutomatically:](self->_searchEntry, "setEnablesReturnKeyAutomatically:", 0);
  -[_SearchEntryWithMatchDisplay setDelegate:](self->_searchEntry, "setDelegate:", self);
  -[_SearchEntryWithMatchDisplay setSearchBarStyle:](self->_searchEntry, "setSearchBarStyle:", 2);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SearchEntryWithMatchDisplay setBarTintColor:](self->_searchEntry, "setBarTintColor:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SearchEntryWithMatchDisplay setTintColor:](self->_searchEntry, "setTintColor:", v19);

  -[_SearchEntryWithMatchDisplay widthAnchor](self->_searchEntry, "widthAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintGreaterThanOrEqualToConstant:", 100.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[UIStackView addArrangedSubview:](self->_searchBarContainerView, "addArrangedSubview:", self->_searchEntry);
  v22 = -[HKBarButtonItemControl initWithSystemItem:preferredHeight:collapseHeight:]([HKBarButtonItemControl alloc], "initWithSystemItem:preferredHeight:collapseHeight:", 0, 0, 36.0);
  doneBarButton = self->_doneBarButton;
  self->_doneBarButton = v22;

  LODWORD(v24) = 1148846080;
  -[HKBarButtonItemControl setContentHuggingPriority:forAxis:](self->_doneBarButton, "setContentHuggingPriority:forAxis:", 0, v24);
  v25 = self->_doneBarButton;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  -[HKBarButtonItemControl addTarget:action:forControlEvents:](v25, "addTarget:action:forControlEvents:", WeakRetained, sel_doneAction_, 64);

  -[HKBarButtonItemControl setHorizontalMargin:](self->_doneBarButton, "setHorizontalMargin:", 4.0);
  -[HKBarButtonItemControl widthAnchor](self->_doneBarButton, "widthAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintGreaterThanOrEqualToConstant:", 36.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  -[UIStackView addArrangedSubview:](self->_searchBarContainerView, "addArrangedSubview:", self->_doneBarButton);
  -[UIStackView setFrame:](self->_searchBarContainerView, "setFrame:", 0.0, 0.0, 1.0, 36.0);
  -[_SearchBarContent addSubview:](self, "addSubview:", self->_searchBarContainerView);
  -[_SearchBarContent setFrame:](self, "setFrame:", 0.0, 0.0, 1.0, 36.0);
  -[_SearchBarContent setNeedsLayout](self, "setNeedsLayout");
  HKHealthTintColor();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  -[_SearchBarContent setTintColor:](self, "setTintColor:", v29);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;

  -[_SearchBarContent layoutMarginsGuide](self, "layoutMarginsGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutFrame");
  v5 = v4;

  -[UIStackView frame](self->_searchBarContainerView, "frame");
  -[UIStackView setFrame:](self->_searchBarContainerView, "setFrame:", v5);
}

- (id)inputField
{
  return (id)-[_SearchEntryWithMatchDisplay searchField](self->_searchEntry, "searchField");
}

- (void)upAction:(id)a3
{
  HKIncrementalSearchBarDelegate **p_searchBarDelegate;
  id WeakRetained;
  id v6;

  p_searchBarDelegate = &self->_searchBarDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_searchBarDelegate);
    objc_msgSend(v6, "searchBarUpAction:", self);

  }
}

- (void)downAction:(id)a3
{
  HKIncrementalSearchBarDelegate **p_searchBarDelegate;
  id WeakRetained;
  id v6;

  p_searchBarDelegate = &self->_searchBarDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)p_searchBarDelegate);
    objc_msgSend(v6, "searchBarDownAction:", self);

  }
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBarDelegate);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_searchBarDelegate);
    objc_msgSend(v6, "searchBarChangeSearch:searchString:", self, v7);

  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_searchBar);
  objc_msgSend(WeakRetained, "_lowerKeyboard");

}

- (HKIncrementalSearchBarDelegate)searchBarDelegate
{
  return (HKIncrementalSearchBarDelegate *)objc_loadWeakRetained((id *)&self->_searchBarDelegate);
}

- (void)setSearchBarDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_searchBarDelegate, a3);
}

- (HKIncrementalSearchBar)searchBar
{
  return (HKIncrementalSearchBar *)objc_loadWeakRetained((id *)&self->_searchBar);
}

- (HKBarButtonItemControl)upBarButton
{
  return self->_upBarButton;
}

- (HKBarButtonItemControl)downBarButton
{
  return self->_downBarButton;
}

- (HKBarButtonItemControl)doneBarButton
{
  return self->_doneBarButton;
}

- (_SearchEntryWithMatchDisplay)searchEntry
{
  return self->_searchEntry;
}

- (UIStackView)searchBarContainerView
{
  return self->_searchBarContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchBarContainerView, 0);
  objc_storeStrong((id *)&self->_searchEntry, 0);
  objc_storeStrong((id *)&self->_doneBarButton, 0);
  objc_storeStrong((id *)&self->_downBarButton, 0);
  objc_storeStrong((id *)&self->_upBarButton, 0);
  objc_destroyWeak((id *)&self->_searchBar);
  objc_destroyWeak((id *)&self->_searchBarDelegate);
}

@end
