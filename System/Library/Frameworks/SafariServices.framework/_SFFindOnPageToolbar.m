@implementation _SFFindOnPageToolbar

- (_SFFindOnPageToolbar)initWithDelegate:(id)a3
{
  id v4;
  double v5;
  _SFFindOnPageToolbar *v6;
  id v7;
  uint64_t v8;
  UIToolbar *toolbar;
  void *v10;
  _SFFindOnPageToolbar *v11;
  objc_super v13;

  v4 = a3;
  -[_SFFindOnPageToolbar _accessoryViewHeight](self, "_accessoryViewHeight");
  v13.receiver = self;
  v13.super_class = (Class)_SFFindOnPageToolbar;
  v6 = -[UIInputView initWithFrame:inputViewStyle:](&v13, sel_initWithFrame_inputViewStyle_, 1, 0.0, 0.0, 320.0, v5);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0DC3E68]);
    -[_SFFindOnPageToolbar _toolbarFrame](v6, "_toolbarFrame");
    v8 = objc_msgSend(v7, "initWithFrame:");
    toolbar = v6->_toolbar;
    v6->_toolbar = (UIToolbar *)v8;

    -[UIToolbar setBarStyle:](v6->_toolbar, "setBarStyle:", 4);
    -[UIToolbar _setHidesShadow:](v6->_toolbar, "_setHidesShadow:", 1);
    -[UIToolbar setCenterTextButtons:](v6->_toolbar, "setCenterTextButtons:", 1);
    -[_SFFindOnPageToolbar addSubview:](v6, "addSubview:", v6->_toolbar);
    -[_SFFindOnPageToolbar _initializeToolbarItems](v6, "_initializeToolbarItems");
    -[UIToolbar setItems:](v6->_toolbar, "setItems:", v6->_toolbarItems);
    objc_storeWeak((id *)&v6->_findDelegate, v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);

    v11 = v6;
  }

  return v6;
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double Height;
  _BOOL4 v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v25.origin.x = v16;
  v25.origin.y = v18;
  v25.size.width = v20;
  v25.size.height = v22;
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  v26 = CGRectIntersection(v25, v28);
  Height = CGRectGetHeight(v26);
  -[_SFFindOnPageToolbar bounds](self, "bounds");
  v24 = Height - CGRectGetHeight(v27) == 0.0;
  if (self->_useBottomInset != v24)
  {
    self->_useBottomInset = v24;
    -[_SFFindOnPageToolbar invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGRect)_toolbarFrame
{
  double v3;
  CGFloat v4;
  CGFloat Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  -[_SFFindOnPageToolbar _toolbarVerticalInset](self, "_toolbarVerticalInset");
  v4 = v3;
  -[_SFFindOnPageToolbar bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  v6 = 0.0;
  if ((_SFDeviceIsPad() & 1) != 0 || self->_usesNarrowLayout)
  {
    v7 = 44.0;
  }
  else
  {
    v15.size.height = 44.0;
    v15.origin.x = 0.0;
    v15.origin.y = v4;
    v15.size.width = Width;
    *(CGRect *)(&v7 - 3) = CGRectInset(v15, 56.0, 0.0);
    v6 = v8;
    v4 = v9;
    Width = v10;
  }
  v11 = v6;
  v12 = v4;
  v13 = Width;
  result.size.height = v7;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)_toolbarVerticalInset
{
  int IsPad;
  double result;

  IsPad = _SFDeviceIsPad();
  result = 5.0;
  if (IsPad)
    return 4.0;
  return result;
}

- (double)_accessoryViewHeight
{
  double v2;

  -[_SFFindOnPageToolbar _toolbarVerticalInset](self, "_toolbarVerticalInset");
  return v2 + 44.0;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[UIToolbar intrinsicContentSize](self->_toolbar, "intrinsicContentSize");
  v4 = v3;
  -[_SFFindOnPageToolbar safeAreaInsets](self, "safeAreaInsets");
  v6 = v5;
  if (self->_useBottomInset)
    -[_SFFindOnPageToolbar _toolbarVerticalInset](self, "_toolbarVerticalInset");
  else
    v7 = 0.0;
  v8 = fmax(v6, v7);
  -[_SFFindOnPageToolbar _accessoryViewHeight](self, "_accessoryViewHeight");
  v10 = v9 + v8;
  v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFFindOnPageToolbar;
  -[_SFFindOnPageToolbar safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[_SFFindOnPageToolbar invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFFindOnPageToolbar;
  -[_SFFindOnPageToolbar layoutSubviews](&v5, sel_layoutSubviews);
  -[_SFFindOnPageToolbar _toolbarFrame](self, "_toolbarFrame");
  -[UIToolbar setFrame:](self->_toolbar, "setFrame:");
  -[_SFFindOnPageInputBar searchField](self->_inputBar, "searchField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_inFieldMatchLabel, "setFont:", v4);

}

- (void)updateUI
{
  id WeakRetained;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  id v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  -[_SFFindOnPageToolbar _toolbarFrame](self, "_toolbarFrame");
  -[UIToolbar setFrame:](self->_toolbar, "setFrame:");
  -[_SFFindOnPageInputBar searchField](self->_inputBar, "searchField");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  v4 = objc_msgSend(WeakRetained, "hasMatches");

  -[UIBarButtonItem setEnabled:](self->_previousButtonItem, "setEnabled:", v4);
  -[UIBarButtonItem setEnabled:](self->_nextButtonItem, "setEnabled:", v4);
  -[_SFFindOnPageInputBar text](self->_inputBar, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", self->_searchText);

  if ((v4 & 1) == 0)
    -[_SFFindOnPageInputBar setText:](self->_inputBar, "setText:", self->_searchText);
  objc_msgSend(v40, "setRightViewMode:", 3);
  -[_SFFindOnPageToolbar _matchLabelText](self, "_matchLabelText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_inFieldMatchLabel, "setText:", v6);

  -[UILabel frame](self->_inFieldMatchLabel, "frame");
  v37 = v8;
  v38 = v7;
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[UILabel sizeThatFits:](self->_inFieldMatchLabel, "sizeThatFits:", *MEMORY[0x1E0C9D820], v10);
  v39 = v11;
  objc_msgSend(v40, "bounds");
  v13 = v12;
  objc_msgSend(v40, "textRectForBounds:");
  v36 = v14;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v40, "sizeThatFits:", v9, v10);
  v22 = v21;
  objc_msgSend(v40, "_contentMargin");
  v24 = v23;
  objc_msgSend(v40, "_imageButtonMargin");
  v26 = v25;
  objc_msgSend(v40, "_textButtonMargin");
  if (self->_usesNarrowLayout
    && (v28 = v27, -[_SFFindOnPageInputBar isFirstResponder](self->_inputBar, "isFirstResponder"))
    && v39 + v22 - v24 - v26 - v28 >= v13)
  {
    objc_msgSend(v40, "setRightViewMode:", 0);
  }
  else
  {
    objc_msgSend(v40, "setRightViewMode:", 3);
    objc_msgSend(v40, "font");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lineHeight");
    v31 = floor((v20 - v30) * 0.5);

    v41.origin.x = v36;
    v41.origin.y = v16;
    v41.size.width = v18;
    v41.size.height = v20;
    v32 = CGRectGetMinY(v41) + v31;
    v42.origin.x = v36;
    v42.origin.y = v16;
    v42.size.width = v18;
    v42.size.height = v20;
    v33 = CGRectGetMaxY(v42) - v31;
    -[UILabel textSize](self->_inFieldMatchLabel, "textSize");
    v35 = v32 - (v33 - ceil(v34));
    v43.origin.x = v36;
    v43.origin.y = v16;
    v43.size.width = v18;
    v43.size.height = v20;
    -[UILabel setFrame:](self->_inFieldMatchLabel, "setFrame:", v38, v37, v39, CGRectGetMaxY(v43) - v35);
    objc_msgSend(v40, "_setRightViewOffset:", 0.0, v35);
  }

}

- (id)_matchLabelText
{
  id WeakRetained;
  void *v4;

  if (-[NSString length](self->_searchText, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
    objc_msgSend(WeakRetained, "matchLabelText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (UITextField)inputField
{
  return (UITextField *)-[_SFFindOnPageInputBar searchField](self->_inputBar, "searchField");
}

- (void)setUsesNarrowLayout:(BOOL)a3
{
  if (self->_usesNarrowLayout != a3)
  {
    self->_usesNarrowLayout = a3;
    -[_SFFindOnPageToolbar updateUI](self, "updateUI");
  }
}

- (void)previous:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  objc_msgSend(WeakRetained, "previous");

  -[_SFFindOnPageToolbar updateUI](self, "updateUI");
}

- (void)next:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  objc_msgSend(WeakRetained, "next");

  -[_SFFindOnPageToolbar updateUI](self, "updateUI");
}

- (void)_done
{
  id WeakRetained;

  -[_SFFindOnPageToolbar _updateEditing:](self, "_updateEditing:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  objc_msgSend(WeakRetained, "done");

}

- (BOOL)searchBarShouldBeginEditing:(id)a3
{
  _BOOL4 v4;

  v4 = -[_SFFindOnPageToolbar _updateEditing:](self, "_updateEditing:", 1);
  if (v4)
    -[_SFFindOnPageInputBar performSelector:withObject:afterDelay:](self->_inputBar, "performSelector:withObject:afterDelay:", sel_becomeFirstResponder, 0, 0.0);
  return !v4;
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFFindOnPageToolbar updateUI](self, "updateUI");
  objc_msgSend(v4, "searchField");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel_selectAll_, 0, 0.0);
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  NSTimer *textChangedUpdateTimer;
  void *v6;
  NSString *v7;
  NSString *searchText;
  NSTimer *v9;
  NSTimer *v10;

  if (objc_msgSend(a3, "isFirstResponder"))
  {
    textChangedUpdateTimer = self->_textChangedUpdateTimer;
    if (textChangedUpdateTimer)
      -[NSTimer invalidate](textChangedUpdateTimer, "invalidate");
    -[_SFFindOnPageInputBar text](self->_inputBar, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSString *)objc_msgSend(v6, "copy");
    searchText = self->_searchText;
    self->_searchText = v7;

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__doUpdateSearchText, 0, 0, 0.25);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    v10 = self->_textChangedUpdateTimer;
    self->_textChangedUpdateTimer = v9;

  }
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  -[_SFFindOnPageToolbar _updateEditing:](self, "_updateEditing:", 0);
}

- (void)_initializeToolbarItems
{
  UIBarButtonItem *v3;
  UIBarButtonItem *previousButtonItem;
  void *v5;
  UIBarButtonItem *v6;
  UIBarButtonItem *nextButtonItem;
  void *v8;
  _SFFindOnPageInputBar *v9;
  _SFFindOnPageInputBar *inputBar;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  UILabel *v15;
  UILabel *inFieldMatchLabel;
  void *v17;
  uint64_t v18;
  void *v19;
  UIBarButtonItem *v20;
  UIBarButtonItem *doneBarButtonItem;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *toolbarItems;
  NSArray *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[8];
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 103, self, sel_previous_);
  previousButtonItem = self->_previousButtonItem;
  self->_previousButtonItem = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](self->_previousButtonItem, "setTintColor:", v5);

  v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 104, self, sel_next_);
  nextButtonItem = self->_nextButtonItem;
  self->_nextButtonItem = v6;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](self->_nextButtonItem, "setTintColor:", v8);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v32, "setWidth:", 2.0);
  v9 = objc_alloc_init(_SFFindOnPageInputBar);
  inputBar = self->_inputBar;
  self->_inputBar = v9;

  -[_SFFindOnPageInputBar setDelegate:](self->_inputBar, "setDelegate:", self);
  -[_SFFindOnPageInputBar _setDisableDictationButton:](self->_inputBar, "_setDisableDictationButton:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  objc_msgSend(WeakRetained, "textForToolbarLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFFindOnPageInputBar setPlaceholder:](self->_inputBar, "setPlaceholder:", v12);

  -[_SFFindOnPageInputBar setContentInset:](self->_inputBar, "setContentInset:", 0.0, 4.0, 0.0, 7.0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_inputBar);
  objc_msgSend(v13, "_setFlexible:", 1);
  -[_SFFindOnPageInputBar searchField](self->_inputBar, "searchField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  inFieldMatchLabel = self->_inFieldMatchLabel;
  self->_inFieldMatchLabel = v15;

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_inFieldMatchLabel, "setTextColor:", v17);

  objc_msgSend(v14, "setRightView:", self->_inFieldMatchLabel);
  objc_msgSend(v14, "setClearButtonMode:", 1);
  if (objc_msgSend(MEMORY[0x1E0C99DC8], "_sf_isRTL"))
    v18 = 2;
  else
    v18 = 0;
  objc_msgSend(v14, "setTextAlignment:", v18);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTextColor:", v19);

  v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_dismiss_);
  doneBarButtonItem = self->_doneBarButtonItem;
  self->_doneBarButtonItem = v20;

  objc_msgSend(MEMORY[0x1E0DC37F0], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0DC4B10], 2, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithDescriptor:size:", v22, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIBarButtonItem setTitleTextAttributes:forState:](self->_doneBarButtonItem, "setTitleTextAttributes:forState:", v24, 0);
  -[UIBarButtonItem setTitleTextAttributes:forState:](self->_doneBarButtonItem, "setTitleTextAttributes:forState:", v24, 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTintColor:](self->_doneBarButtonItem, "setTintColor:", v25);

  if (_SFDeviceIsPad())
  {
    v26 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    -[NSArray setWidth:](v26, "setWidth:", 16.0);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v34[0] = v27;
    v34[1] = v26;
    v34[2] = self->_doneBarButtonItem;
    v34[3] = v13;
    v28 = v32;
    v34[4] = self->_previousButtonItem;
    v34[5] = v32;
    v34[6] = self->_nextButtonItem;
    v34[7] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 8);
    v29 = (NSArray *)objc_claimAutoreleasedReturnValue();
    toolbarItems = self->_toolbarItems;
    self->_toolbarItems = v29;

  }
  else
  {
    v33[0] = self->_doneBarButtonItem;
    v33[1] = v13;
    v28 = v32;
    v33[2] = self->_previousButtonItem;
    v33[3] = v32;
    v33[4] = self->_nextButtonItem;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 5);
    v31 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v26 = self->_toolbarItems;
    self->_toolbarItems = v31;
  }

}

- (void)_doUpdateSearchText
{
  id WeakRetained;
  NSTimer *textChangedUpdateTimer;

  WeakRetained = objc_loadWeakRetained((id *)&self->_findDelegate);
  objc_msgSend(WeakRetained, "updateSearchText:", self->_searchText);

  textChangedUpdateTimer = self->_textChangedUpdateTimer;
  self->_textChangedUpdateTimer = 0;

}

- (BOOL)_updateEditing:(BOOL)a3
{
  int v3;
  int editing;

  v3 = a3;
  editing = self->_editing;
  if (editing != a3)
  {
    self->_editing = a3;
    if (!a3)
      -[_SFFindOnPageInputBar resignFirstResponder](self->_inputBar, "resignFirstResponder");
    -[_SFFindOnPageToolbar updateUI](self, "updateUI");
  }
  return editing != v3;
}

- (BOOL)_keyboardIsSplit
{
  _SFFindOnPageToolbar *v2;
  void *v3;
  double Width;
  void *v5;
  CGFloat v6;
  CGRect v8;
  CGRect v9;
  CGRect v10;

  v2 = self;
  -[UIInputView leftContentView](self, "leftContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v8);
  -[UIInputView rightContentView](v2, "rightContentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v6 = Width + CGRectGetWidth(v9);
  -[_SFFindOnPageToolbar bounds](v2, "bounds");
  LOBYTE(v2) = v6 < CGRectGetWidth(v10);

  return (char)v2;
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)setSearchText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 712);
}

- (BOOL)usesNarrowLayout
{
  return self->_usesNarrowLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_inFieldMatchLabel, 0);
  objc_storeStrong((id *)&self->_textChangedUpdateTimer, 0);
  objc_destroyWeak((id *)&self->_findDelegate);
  objc_storeStrong((id *)&self->_toolbarItems, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
  objc_storeStrong((id *)&self->_inputBar, 0);
  objc_storeStrong((id *)&self->_nextButtonItem, 0);
  objc_storeStrong((id *)&self->_previousButtonItem, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
