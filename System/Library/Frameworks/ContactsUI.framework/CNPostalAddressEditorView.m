@implementation CNPostalAddressEditorView

- (CNPostalAddressEditorView)initWithFrame:(CGRect)a3
{
  CNPostalAddressEditorView *v3;
  void *v4;
  CNPostalAddressEditorTableView *v5;
  uint64_t v6;
  CNPostalAddressEditorTableView *tableView;
  int v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CNPostalAddressEditorTableView *v17;
  uint64_t v18;
  void *v19;
  CNPostalAddressEditorTableView *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *textFields;
  void *v27;
  objc_super v29;
  const __CFString *v30;
  CNPostalAddressEditorTableView *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)CNPostalAddressEditorView;
  v3 = -[CNPostalAddressEditorView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [CNPostalAddressEditorTableView alloc];
    -[CNPostalAddressEditorView bounds](v3, "bounds");
    v6 = -[CNPostalAddressEditorTableView initWithFrame:style:](v5, "initWithFrame:style:", 0);
    tableView = v3->_tableView;
    v3->_tableView = (CNPostalAddressEditorTableView *)v6;

    -[CNPostalAddressEditorTableView setTranslatesAutoresizingMaskIntoConstraints:](v3->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNPostalAddressEditorTableView setDelegate:](v3->_tableView, "setDelegate:", v3);
    -[CNPostalAddressEditorTableView setDataSource:](v3->_tableView, "setDataSource:", v3);
    -[CNPostalAddressEditorTableView _setMarginWidth:](v3->_tableView, "_setMarginWidth:", 0.0);
    -[CNPostalAddressEditorTableView setScrollEnabled:](v3->_tableView, "setScrollEnabled:", 0);
    v8 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    v9 = 44.0;
    if (v8)
      v9 = 33.0;
    objc_msgSend(v4, "_scaledValueForValue:", v9);
    -[CNPostalAddressEditorTableView setRowHeight:](v3->_tableView, "setRowHeight:");
    -[CNPostalAddressEditorTableView setSeparatorStyle:](v3->_tableView, "setSeparatorStyle:", 0);
    -[CNPostalAddressEditorTableView setLayoutMarginsFollowReadableWidth:](v3->_tableView, "setLayoutMarginsFollowReadableWidth:", 0);
    -[CNPostalAddressEditorTableView setPreservesSuperviewLayoutMargins:](v3->_tableView, "setPreservesSuperviewLayoutMargins:", 0);
    -[CNPostalAddressEditorTableView _setNeedsLayoutOnVisibleBoundsChange:](v3->_tableView, "_setNeedsLayoutOnVisibleBoundsChange:", 1);
    -[CNPostalAddressEditorView addSubview:](v3, "addSubview:", v3->_tableView);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3718];
    v32 = CFSTR("tableView");
    v33[0] = v3->_tableView;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-0-[tableView]-0-|"), 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v13);

    v14 = (void *)MEMORY[0x1E0CB3718];
    v30 = CFSTR("tableView");
    v31 = v3->_tableView;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-0-[tableView]-0-|"), 0, 0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v16);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
    v17 = v3->_tableView;
    v18 = objc_opt_class();
    +[CNAddressComponentTextFieldCell cellIdentifier](CNAddressComponentTextFieldCell, "cellIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPostalAddressEditorTableView registerClass:forCellReuseIdentifier:](v17, "registerClass:forCellReuseIdentifier:", v18, v19);

    v20 = v3->_tableView;
    v21 = objc_opt_class();
    +[CNAddressComponentSplitTextFieldCell cellIdentifier](CNAddressComponentSplitTextFieldCell, "cellIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPostalAddressEditorTableView registerClass:forCellReuseIdentifier:](v20, "registerClass:forCellReuseIdentifier:", v21, v22);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v3, sel_keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    textFields = v3->_textFields;
    v3->_textFields = v25;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v3, sel_textFieldChanged_, *MEMORY[0x1E0DC54D0], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNPostalAddressEditorView;
  -[CNPostalAddressEditorView dealloc](&v4, sel_dealloc);
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;

  -[CNPostalAddressEditorView textFields](self, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("street1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[CNPostalAddressEditorView isEnabled](self, "isEnabled");
  else
    v5 = 0;

  return v5;
}

- (BOOL)isFirstResponder
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CNPostalAddressEditorView textFields](self, "textFields", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isFirstResponder") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[CNPostalAddressEditorView textFields](self, "textFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("street1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[CNPostalAddressEditorView textFields](self, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("street1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "becomeFirstResponder");

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)CNPostalAddressEditorView;
  -[CNPostalAddressEditorView setEnabled:](&v16, sel_setEnabled_);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CNPostalAddressEditorView textFields](self, "textFields", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v11, "setEnabled:", v3);
        objc_msgSend(v11, "setUserInteractionEnabled:", v3);
        objc_msgSend(v11, "_cnui_applyContactStyle");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (int64_t)lineCount
{
  void *v2;
  int64_t v3;

  -[CNPostalAddressEditorView cellsLayout](self, "cellsLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (NSString)ab_text
{
  return 0;
}

- (NSDictionary)ab_textAttributes
{
  return self->_valueTextAttributes;
}

- (void)setAb_textAttributes:(id)a3
{
  NSDictionary *v4;
  NSDictionary *valueTextAttributes;
  void *v6;
  id v7;

  if (self->_valueTextAttributes != a3)
  {
    v4 = (NSDictionary *)objc_msgSend(a3, "copy");
    valueTextAttributes = self->_valueTextAttributes;
    self->_valueTextAttributes = v4;

    -[CNPostalAddressEditorView tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadData");

    -[CNPostalAddressEditorView tableView](self, "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateIntrinsicContentSize");

  }
}

- (void)setSeparatorColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPostalAddressEditorView tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSeparatorColor:", v4);

}

- (UIColor)separatorColor
{
  void *v2;
  void *v3;

  -[CNPostalAddressEditorView tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "separatorColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (CNPostalAddress)address
{
  CNMutablePostalAddress *address;
  CNMutablePostalAddress *v4;
  CNMutablePostalAddress *v5;
  void *v6;

  address = self->_address;
  if (!address)
  {
    v4 = (CNMutablePostalAddress *)objc_alloc_init(MEMORY[0x1E0C97378]);
    v5 = self->_address;
    self->_address = v4;

    objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutablePostalAddress setISOCountryCode:](self->_address, "setISOCountryCode:", v6);

    address = self->_address;
  }
  return (CNPostalAddress *)address;
}

- (void)setAddress:(id)a3
{
  char v4;
  void *v5;
  CNMutablePostalAddress *v6;
  CNMutablePostalAddress *address;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "isEqual:", self->_address);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    v6 = (CNMutablePostalAddress *)objc_msgSend(v9, "mutableCopy");
    address = self->_address;
    self->_address = v6;

    -[CNPostalAddressEditorView _countryCode](self, "_countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[CNMutablePostalAddress setISOCountryCode:](self->_address, "setISOCountryCode:", v8);
    -[CNPostalAddressEditorView _invalidateCellsLayout](self, "_invalidateCellsLayout");

    v5 = v9;
  }

}

- (void)_invalidateCellsLayout
{
  void *v3;
  id v4;

  -[CNPostalAddressEditorView setCellsLayout:](self, "setCellsLayout:", 0);
  -[CNPostalAddressEditorView tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[CNPostalAddressEditorView tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidateIntrinsicContentSize");

}

- (NSArray)cellsLayout
{
  NSArray *cellsLayout;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  cellsLayout = self->_cellsLayout;
  if (!cellsLayout)
  {
    -[CNPostalAddressEditorView _countryCode](self, "_countryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPostalAddressEditorView _cellsLayoutForCountryCode:](self, "_cellsLayoutForCountryCode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    v7 = self->_cellsLayout;
    self->_cellsLayout = v6;

    cellsLayout = self->_cellsLayout;
  }
  return cellsLayout;
}

- (void)textFieldChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CNPostalAddressEditorView textFields](self, "textFields", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[CNPostalAddressEditorView textFields](self, "textFields");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4 == v13)
        {
          objc_msgSend(v4, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPostalAddressEditorView _setAddressValue:forKey:](self, "_setAddressValue:forKey:", v14, v11);

          -[CNPostalAddressEditorView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)contentSizeCategoryDidChange:(id)a3
{
  int v4;
  double v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  v5 = 44.0;
  if (v4)
    v5 = 33.0;
  objc_msgSend(v6, "_scaledValueForValue:", v5);
  -[CNPostalAddressEditorTableView setRowHeight:](self->_tableView, "setRowHeight:");
  -[CNPostalAddressEditorView _invalidateCellsLayout](self, "_invalidateCellsLayout");

}

- (void)keyboardWillShow:(id)a3
{
  void *v3;
  id v4;

  -[CNPostalAddressEditorView textFields](self, "textFields", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C970A0]);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isFirstResponder"))
    objc_msgSend(v4, "resignFirstResponder");

}

- (void)countryPickerDidCancel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CNPostalAddressEditorView delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", self, v4);

}

- (void)countryPicker:(id)a3 didPickCountryCode:(id)a4
{
  CNMutablePostalAddress *address;
  id v7;
  id v8;
  void *v9;
  id v10;

  address = self->_address;
  v7 = a4;
  v8 = a3;
  -[CNMutablePostalAddress setISOCountryCode:](address, "setISOCountryCode:", v7);
  objc_msgSend(MEMORY[0x1E0C973B0], "localizedCountryNameForISOCountryCode:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNMutablePostalAddress setCountry:](self->_address, "setCountry:", v9);
  -[CNPostalAddressEditorView _invalidateCellsLayout](self, "_invalidateCellsLayout");
  -[CNPostalAddressEditorView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
  -[CNPostalAddressEditorView sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
  -[CNPostalAddressEditorView delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sender:dismissViewController:", self, v8);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  __objc2_class **v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  CNPostalAddressEditorView *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v7 = a3;
  v8 = a4;
  -[CNPostalAddressEditorView cellsLayout](self, "cellsLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = &off_1E203EE38;
  if ((objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    if ((unint64_t)objc_msgSend(v10, "count") >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPostalAddressEditorView.m"), 324, CFSTR("Only one or two cells per line are supported."));

    }
    if ((unint64_t)objc_msgSend(v10, "count") > 1)
      v11 = off_1E203EE30;
  }
  -[__objc2_class cellIdentifier](*v11, "cellIdentifier");
  v34 = v8;
  v35 = v7;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTextAttributes:", self->_valueTextAttributes);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  v36 = v12;
  objc_msgSend(v12, "textFields");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v38, "count");
  if (v14 != objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNPostalAddressEditorView.m"), 337, CFSTR("We should have as many text fields as there are line parts."));

  }
  if (objc_msgSend(v10, "count"))
  {
    v15 = 0;
    v39 = (void *)*MEMORY[0x1E0C970C8];
    v37 = *MEMORY[0x1E0C970A0];
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "objectAtIndexedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddressEditorView _addressValueForKey:](self, "_addressValueForKey:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setText:", v18);

      v19 = v16;
      if (!objc_msgSend(v16, "rangeOfString:", v39))
      {
        v19 = v39;

      }
      -[CNPostalAddressEditorView formatSpecification](self, "formatSpecification");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedPlaceholderForKey:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "placeholder");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", v21);

      if ((v23 & 1) == 0)
        objc_msgSend(v17, "setPlaceholder:", v21);
      -[CNPostalAddressEditorView address](self, "address");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPostalAddressEditorView keyboardSettingsForAddress:component:](self, "keyboardSettingsForAddress:component:", v24, v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "setKeyboardType:", +[CNKeyboardSettings keyboardTypeFromDictionary:](CNKeyboardSettings, "keyboardTypeFromDictionary:", v25));
      objc_msgSend(v17, "setAutocapitalizationType:", +[CNKeyboardSettings autocapitalizationTypeFromDictionary:](CNKeyboardSettings, "autocapitalizationTypeFromDictionary:", v25));
      objc_msgSend(v17, "setAutocorrectionType:", +[CNKeyboardSettings autocorrectionTypeFromDictionary:](CNKeyboardSettings, "autocorrectionTypeFromDictionary:", v25));
      objc_msgSend(v17, "_cnui_applyContactStyle");
      objc_msgSend(v10, "objectAtIndexedSubscript:", v15);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "isEqualToString:", v37);

      if (v27)
      {
        objc_msgSend(v36, "setShowsChevron:", 1);
        v28 = self;
      }
      else
      {
        v28 = 0;
      }
      objc_msgSend(v17, "setDelegate:", v28);
      -[CNPostalAddressEditorView textFields](self, "textFields");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v17, v16);

      ++v15;
    }
    while (v15 < objc_msgSend(v10, "count"));
  }
  objc_msgSend(v36, "setNeedsUpdateConstraints");

  return v36;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  v14 = a4;
  v7 = a5;
  -[CNPostalAddressEditorView backgroundColor](self, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v8);

  objc_msgSend(v14, "setPreservesSuperviewLayoutMargins:", 0);
  v9 = objc_msgSend(v7, "row");

  objc_msgSend(v14, "setSeparatorStyle:", v9 != -[CNPostalAddressEditorView lineCount](self, "lineCount") - 1);
  objc_msgSend(v14, "_setShouldHaveFullLengthTopSeparator:", 1);
  objc_msgSend(v14, "setLayoutMarginsFollowReadableWidth:", 0);
  v10 = *MEMORY[0x1E0DC49E8];
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v12 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  objc_msgSend(v14, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], v11, v12, v13);
  objc_msgSend(v14, "setSeparatorInset:", v10, v11, v12, v13);

}

- (void)textFieldDidBeginEditing:(id)a3
{
  void *v4;
  id v5;
  CNCountryPickerController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CNPostalAddressEditorView textFields](self, "textFields");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C970A0]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v11)
  {
    v6 = objc_alloc_init(CNCountryPickerController);
    -[CNCountryPickerController setDelegate:](v6, "setDelegate:", self);
    -[CNPostalAddressEditorView address](self, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ISOCountryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCountryPickerController setSelectedCountryCode:](v6, "setSelectedCountryCode:", v8);

    -[CNPostalAddressEditorView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sender:presentViewController:", v10, v6);

  }
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPostalAddressEditorView;
  v4 = a3;
  -[CNPostalAddressEditorView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  -[CNPostalAddressEditorView tableView](self, "tableView", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)_setAddressValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  CNMutablePostalAddress *address;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0C970C8];
  v8 = objc_msgSend(v6, "rangeOfString:", *MEMORY[0x1E0C970C8]);
  address = self->_address;
  if (v8)
  {
    -[CNMutablePostalAddress setValue:forKey:](address, "setValue:forKey:", v15, v6);
  }
  else
  {
    -[CNMutablePostalAddress street](address, "street");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (!v12)
      v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(v6, "characterAtIndex:", objc_msgSend(v7, "length")) - 49;
    if (v13 >= objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "addObject:", v15);
    }
    else if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
    {
      objc_msgSend(v12, "removeObjectAtIndex:", v13);
    }
    else
    {
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v15, v13);
    }
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutablePostalAddress setStreet:](self->_address, "setStreet:", v14);

  }
}

- (id)_addressValueForKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  unsigned int v9;

  v4 = (void *)*MEMORY[0x1E0C970C8];
  v5 = a3;
  if (objc_msgSend(v5, "rangeOfString:", v4))
  {
    -[CNPostalAddressEditorView address](self, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", v5);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNMutablePostalAddress street](self->_address, "street");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v4, "length"));
    if ((unint64_t)v9 - 49 >= objc_msgSend(v6, "count"))
    {
      v7 = &stru_1E20507A8;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9 - 49);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_countryCode
{
  void *v3;
  void *v4;
  void *v5;

  -[CNPostalAddressEditorView address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ISOCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPostalAddressEditorView _normalizeCountryCodeToISO:](self, "_normalizeCountryCodeToISO:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_normalizeCountryCodeToISO:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (_normalizeCountryCodeToISO__onceToken != -1)
    dispatch_once(&_normalizeCountryCodeToISO__onceToken, &__block_literal_global_26087);
  if (!objc_msgSend(v3, "length")
    || (objc_msgSend(v3, "lowercaseString"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        objc_msgSend((id)_normalizeCountryCodeToISO__countryCodes, "objectForKeyedSubscript:", v4),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v3 = v4,
        !v5))
  {
    v5 = v3;
    v4 = v5;
  }

  return v5;
}

- (id)_cellsLayoutForCountryCode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CNPostalAddressEditorView textFields](self, "textFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  objc_msgSend(MEMORY[0x1E0C973B0], "specificationForCountry:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0C973B0];
    objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specificationForCountry:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_storeStrong((id *)&self->_formatSpecification, v7);
  objc_msgSend(v7, "editingFieldArrangement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    objc_msgSend(v10, "_cn_flatten");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_map:", &__block_literal_global_60);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }
  v21[0] = *MEMORY[0x1E0C970C8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "indexOfObject:", v13);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(v15, "removeObjectAtIndex:", v14);
    objc_msgSend(v15, "insertObject:atIndex:", &unk_1E20D3850, v14);
    objc_msgSend(v15, "insertObject:atIndex:", &unk_1E20D3868, v14);

    v10 = v15;
  }
  v16 = *MEMORY[0x1E0D13848];
  -[CNPostalAddressEditorView address](self, "address");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "country");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = (*(uint64_t (**)(uint64_t, void *))(v16 + 16))(v16, v18);

  if ((_DWORD)v16)
  {
    objc_msgSend(MEMORY[0x1E0C973B0], "localizedCountryNameForISOCountryCode:", v4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNMutablePostalAddress setCountry:](self->_address, "setCountry:", v19);

    -[CNMutablePostalAddress setISOCountryCode:](self->_address, "setISOCountryCode:", v4);
  }

  return v10;
}

- (id)keyboardSettingsForAddress:(id)a3 component:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "ISOCountryCode");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    else
      v10 = &stru_1E20507A8;
    v11 = v10;

    objc_msgSend(v5, "ISOCountryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", &stru_1E20507A8);

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D13B00], "defaultCountryCode");
      v14 = objc_claimAutoreleasedReturnValue();

      v11 = (__CFString *)v14;
    }
    objc_msgSend(MEMORY[0x1E0C973B0], "formatPropertyKeyForPostalAddressPropertyKey:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13B08], "addressFormats");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kbdSettings"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("defaultKbdSettings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (CNPresenterDelegate)delegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNPostalAddressEditorTableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (void)setCellsLayout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (CNPostalAddressFormattingSpecification)formatSpecification
{
  return self->_formatSpecification;
}

- (void)setFormatSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_formatSpecification, a3);
}

- (NSMutableDictionary)textFields
{
  return self->_textFields;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFields, 0);
  objc_storeStrong((id *)&self->_formatSpecification, 0);
  objc_storeStrong((id *)&self->_cellsLayout, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_valueTextAttributes, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

id __56__CNPostalAddressEditorView__cellsLayoutForCountryCode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = a2;
  v2 = (void *)MEMORY[0x1E0C99D20];
  v3 = a2;
  objc_msgSend(v2, "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __56__CNPostalAddressEditorView__normalizeCountryCodeToISO___block_invoke()
{
  void *v0;

  v0 = (void *)_normalizeCountryCodeToISO__countryCodes;
  _normalizeCountryCodeToISO__countryCodes = (uint64_t)&unk_1E20D3A20;

}

@end
