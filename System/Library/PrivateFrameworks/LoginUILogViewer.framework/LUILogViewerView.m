@implementation LUILogViewerView

- (LUILogViewerView)initWithFrame:(CGRect)a3
{
  LUILogViewerView *v3;
  LUILogViewerView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LUILogViewerView;
  v3 = -[LUILogViewerView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[LUILogViewerView _setup](v3, "_setup");
  return v4;
}

- (void)_setup
{
  void *v3;
  void *v4;
  UIButton *v5;
  UIButton *closeButton;
  UIView *v7;
  UIView *contentHolderView;
  UIButton *v9;
  UIButton *logButton;
  UIButton *v11;
  UIButton *clearButton;
  UIButton *v13;
  UIButton *filterButton;
  UISearchBar *v15;
  UISearchBar *searchBar;
  UILabel *v17;
  UILabel *searchResultLabel;
  UIButton *v19;
  UIButton *leftCaretButton;
  UIButton *v21;
  UIButton *rightCaretButton;
  id v23;
  UIButton *v24;
  UISearchBar *v25;
  UIButton *v26;
  void *v27;
  UIStackView *v28;
  UIStackView *buttonStack;
  _QWORD v30[8];

  v30[7] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerView setBackgroundColor:](self, "setBackgroundColor:", v4);

  -[LUILogViewerView _createCloseButton](self, "_createCloseButton");
  v5 = (UIButton *)objc_claimAutoreleasedReturnValue();
  closeButton = self->_closeButton;
  self->_closeButton = v5;

  -[LUILogViewerView addSubview:](self, "addSubview:", self->_closeButton);
  v7 = (UIView *)objc_opt_new();
  contentHolderView = self->_contentHolderView;
  self->_contentHolderView = v7;

  -[LUILogViewerView addSubview:](self, "addSubview:", self->_contentHolderView);
  -[LUILogViewerView _createLogButton](self, "_createLogButton");
  v9 = (UIButton *)objc_claimAutoreleasedReturnValue();
  logButton = self->_logButton;
  self->_logButton = v9;

  -[LUILogViewerView _createClearButton](self, "_createClearButton");
  v11 = (UIButton *)objc_claimAutoreleasedReturnValue();
  clearButton = self->_clearButton;
  self->_clearButton = v11;

  -[LUILogViewerView _createFilterButton](self, "_createFilterButton");
  v13 = (UIButton *)objc_claimAutoreleasedReturnValue();
  filterButton = self->_filterButton;
  self->_filterButton = v13;

  -[LUILogViewerView _createSearchBar](self, "_createSearchBar");
  v15 = (UISearchBar *)objc_claimAutoreleasedReturnValue();
  searchBar = self->_searchBar;
  self->_searchBar = v15;

  -[LUILogViewerView _createSearchResultLabel](self, "_createSearchResultLabel");
  v17 = (UILabel *)objc_claimAutoreleasedReturnValue();
  searchResultLabel = self->_searchResultLabel;
  self->_searchResultLabel = v17;

  -[LUILogViewerView _createLeftCaretButton](self, "_createLeftCaretButton");
  v19 = (UIButton *)objc_claimAutoreleasedReturnValue();
  leftCaretButton = self->_leftCaretButton;
  self->_leftCaretButton = v19;

  -[LUILogViewerView _createRightCaretButton](self, "_createRightCaretButton");
  v21 = (UIButton *)objc_claimAutoreleasedReturnValue();
  rightCaretButton = self->_rightCaretButton;
  self->_rightCaretButton = v21;

  v23 = objc_alloc(MEMORY[0x24BDF6DD0]);
  v24 = self->_clearButton;
  v30[0] = self->_logButton;
  v30[1] = v24;
  v25 = self->_searchBar;
  v30[2] = self->_filterButton;
  v30[3] = v25;
  v26 = self->_leftCaretButton;
  v30[4] = self->_searchResultLabel;
  v30[5] = v26;
  v30[6] = self->_rightCaretButton;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (UIStackView *)objc_msgSend(v23, "initWithArrangedSubviews:", v27);
  buttonStack = self->_buttonStack;
  self->_buttonStack = v28;

  -[UIStackView setAlignment:](self->_buttonStack, "setAlignment:", 3);
  -[UIStackView setAxis:](self->_buttonStack, "setAxis:", 0);
  -[UIStackView setSpacing:](self->_buttonStack, "setSpacing:", 20.0);
  -[LUILogViewerView addSubview:](self, "addSubview:", self->_buttonStack);
}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  void *v7;
  CGFloat v8;
  void *v9;
  objc_super v10;
  CGRect v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  v10.receiver = self;
  v10.super_class = (Class)LUILogViewerView;
  -[LUILogViewerView layoutSubviews](&v10, sel_layoutSubviews);
  -[LUILogViewerView frame](self, "frame");
  v3 = CGRectGetWidth(v11) + -80.0;
  -[LUILogViewerView closeButton](self, "closeButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", v3, 10.0, 80.0, 30.0);

  -[LUILogViewerView frame](self, "frame");
  v5 = CGRectGetWidth(v12) + -20.0;
  -[LUILogViewerView frame](self, "frame");
  v6 = CGRectGetHeight(v13) + -60.0;
  -[LUILogViewerView contentHolderView](self, "contentHolderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 10.0, 50.0, v5, v6);

  -[LUILogViewerView frame](self, "frame");
  v8 = CGRectGetWidth(v14) + -110.0;
  -[LUILogViewerView buttonStack](self, "buttonStack");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", 10.0, 10.0, v8, 30.0);

}

- (void)switchClearButtonTitle:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v3 = a3;
  -[LUILogViewerView clearButton](self, "clearButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v3)
    v5 = CFSTR("Clear");
  else
    v5 = CFSTR("Stop");
  objc_msgSend(v4, "setTitle:forState:", v5, 0);

}

- (void)highlightFilterButton:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[LUILogViewerView filterButton](self, "filterButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerView _highlightButton:highlight:](self, "_highlightButton:highlight:", v5, v3);

}

- (void)highlightLogButton:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[LUILogViewerView logButton](self, "logButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerView _highlightButton:highlight:](self, "_highlightButton:highlight:", v5, v3);

}

- (void)_highlightButton:(id)a3 highlight:(BOOL)a4
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  double v9;
  id v10;
  id v11;

  if (a4)
  {
    v4 = (void *)MEMORY[0x24BDF6950];
    v5 = a3;
    objc_msgSend(v4, "whiteColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = objc_msgSend(v6, "CGColor");
    objc_msgSend(v5, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBorderColor:", v7);

    objc_msgSend(v5, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 1.0;
  }
  else
  {
    v10 = a3;
    objc_msgSend(v10, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v9 = 0.0;
  }
  objc_msgSend(v11, "setBorderWidth:", v9);

}

- (void)resetSearchResultLabel
{
  id v2;

  -[LUILogViewerView searchResultLabel](self, "searchResultLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", CFSTR("0 / 0"));

}

- (void)updateSearchResultLabelWithTotalResult:(unint64_t)a3 currentIndex:(unint64_t)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu / %lu"), a4, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[LUILogViewerView searchResultLabel](self, "searchResultLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

}

- (id)_createCloseButton
{
  return -[LUILogViewerView _createButtonWithTitle:action:](self, "_createButtonWithTitle:action:", CFSTR("Close"), sel_closeButtonTapped_);
}

- (id)_createLogButton
{
  return -[LUILogViewerView _createButtonWithTitle:action:](self, "_createButtonWithTitle:action:", CFSTR("Log"), sel_logButtonTapped_);
}

- (id)_createClearButton
{
  return -[LUILogViewerView _createButtonWithTitle:action:](self, "_createButtonWithTitle:action:", CFSTR("Clear"), sel_clearButtonTapped_);
}

- (id)_createFilterButton
{
  return -[LUILogViewerView _createButtonWithTitle:action:](self, "_createButtonWithTitle:action:", CFSTR("Filter"), sel_filterButtonTapped_);
}

- (id)_createLeftCaretButton
{
  return -[LUILogViewerView _createButtonWithTitle:action:](self, "_createButtonWithTitle:action:", CFSTR("<"), sel_leftCaretButtonTapped_);
}

- (id)_createRightCaretButton
{
  return -[LUILogViewerView _createButtonWithTitle:action:](self, "_createButtonWithTitle:action:", CFSTR(">"), sel_rightCaretButtonTapped_);
}

- (id)_createButtonWithTitle:(id)a3 action:(SEL)a4
{
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;

  v6 = (objc_class *)MEMORY[0x24BDF6880];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  objc_msgSend(v8, "setTitle:forState:", v7, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitleColor:forState:", v9, 0);

  objc_msgSend(v8, "addTarget:action:forControlEvents:", self, a4, 64);
  LODWORD(v10) = 1148846080;
  objc_msgSend(v8, "setContentHuggingPriority:forAxis:", 0, v10);
  return v8;
}

- (id)_createSearchBar
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6D60]), "initWithFrame:", 0.0, 0.0, 200.0, 30.0);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBarTintColor:", v3);

  objc_msgSend(v2, "setPlaceholder:", CFSTR("Search..."));
  objc_msgSend(v2, "setAutocapitalizationType:", 0);
  objc_msgSend(v2, "setAutocorrectionType:", 1);
  LODWORD(v4) = 1132068864;
  objc_msgSend(v2, "setContentHuggingPriority:forAxis:", 0, v4);
  return v2;
}

- (id)_createSearchResultLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6B68]), "initWithFrame:", 0.0, 0.0, 0.0, 30.0);
  objc_msgSend(v2, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTextColor:", v3);

  objc_msgSend(v2, "setText:", CFSTR("0 / 0"));
  return v2;
}

- (void)closeButtonTapped:(id)a3
{
  id v4;

  -[LUILogViewerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logViewerViewCloseButtonTapped:", self);

}

- (void)logButtonTapped:(id)a3
{
  id v4;

  -[LUILogViewerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logViewerViewLogButtonTapped:", self);

}

- (void)clearButtonTapped:(id)a3
{
  id v4;

  -[LUILogViewerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logViewerViewClearButtontapped:", self);

}

- (void)filterButtonTapped:(id)a3
{
  id v4;

  -[LUILogViewerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logViewerFilterButtonTapped:", self);

}

- (void)leftCaretButtonTapped:(id)a3
{
  id v4;

  -[LUILogViewerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logViewerLeftCaretButtonTapped:", self);

}

- (void)rightCaretButtonTapped:(id)a3
{
  id v4;

  -[LUILogViewerView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logViewerRightCaretButtonTapped:", self);

}

- (LUILogViewerViewDelegate)delegate
{
  return (LUILogViewerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)contentHolderView
{
  return self->_contentHolderView;
}

- (void)setContentHolderView:(id)a3
{
  objc_storeStrong((id *)&self->_contentHolderView, a3);
}

- (UIButton)filterButton
{
  return self->_filterButton;
}

- (void)setFilterButton:(id)a3
{
  objc_storeStrong((id *)&self->_filterButton, a3);
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setSearchBar:(id)a3
{
  objc_storeStrong((id *)&self->_searchBar, a3);
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_storeStrong((id *)&self->_closeButton, a3);
}

- (UIView)filterView
{
  return self->_filterView;
}

- (void)setFilterView:(id)a3
{
  objc_storeStrong((id *)&self->_filterView, a3);
}

- (UIButton)logButton
{
  return self->_logButton;
}

- (void)setLogButton:(id)a3
{
  objc_storeStrong((id *)&self->_logButton, a3);
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearButton, a3);
}

- (UIStackView)buttonStack
{
  return self->_buttonStack;
}

- (void)setButtonStack:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStack, a3);
}

- (UILabel)searchResultLabel
{
  return self->_searchResultLabel;
}

- (void)setSearchResultLabel:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultLabel, a3);
}

- (UIButton)leftCaretButton
{
  return self->_leftCaretButton;
}

- (void)setLeftCaretButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftCaretButton, a3);
}

- (UIButton)rightCaretButton
{
  return self->_rightCaretButton;
}

- (void)setRightCaretButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightCaretButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightCaretButton, 0);
  objc_storeStrong((id *)&self->_leftCaretButton, 0);
  objc_storeStrong((id *)&self->_searchResultLabel, 0);
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_logButton, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_filterButton, 0);
  objc_storeStrong((id *)&self->_contentHolderView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
