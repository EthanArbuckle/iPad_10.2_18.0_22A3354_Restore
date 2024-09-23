@implementation CNPickerController

- (CNPickerController)initWithStyle:(int64_t)a3
{
  CNPickerController *v3;
  CNPickerController *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UISearchController *searchController;
  UISearchController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CNPickerController;
  v3 = -[CNPickerController initWithStyle:](&v20, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[CNPickerController tableView](v3, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", v4);
    objc_msgSend(v5, "setDataSource:", v4);
    objc_msgSend(v5, "setKeyboardDismissMode:", 1);
    objc_msgSend(v5, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_scaledValueForValue:", 44.0);
    objc_msgSend(v5, "setEstimatedRowHeight:");

    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ABPickerItemCell"));
    -[CNPickerController navigationItem](v4, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C40]), "initWithSearchResultsController:", 0);
    searchController = v4->_searchController;
    v4->_searchController = (UISearchController *)v8;

    v10 = v4->_searchController;
    -[CNPickerController navigationItem](v4, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSearchController:", v10);

    -[CNPickerController navigationItem](v4, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "searchController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSearchResultsUpdater:", v4);

    -[CNPickerController navigationItem](v4, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "searchController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v4);

    -[CNPickerController navigationItem](v4, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObscuresBackgroundDuringPresentation:", 0);

    -[CNPickerController navigationItem](v4, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPreferredSearchBarPlacement:", 2);

    v4->_allowsCustomItems = 1;
    v4->_searchIncludesSupplementalItems = 1;

  }
  return v4;
}

- (id)_titleForPickerItem:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CNPickerController itemLocalizationBlock](self, "itemLocalizationBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CNPickerController itemLocalizationBlock](self, "itemLocalizationBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v6)[2](v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_6;
  }
  -[CNPickerController itemLocalizationKey](self, "itemLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[CNPickerController itemLocalizationKey](self, "itemLocalizationKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v4, v10);
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v6, v4, CFSTR("Localized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "name");
  else
    -[CNPickerController titleForPickerItem:](self, "titleForPickerItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (id)titleForPickerItem:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v3 = a3;
  if (!_useSiriLocalization)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/OldFramework/Sources/ContactsUI_Internal.m", 126, 4, CFSTR("You tried to use Siri localization but SiriUI is not loaded."), v6, v7, v8, v9, v13);
    goto LABEL_6;
  }
  if (!_useSiriLocalization)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0C97200], "localizedStringForKey:", v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  ABAddressBookBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "siriUILocalizedStringForKey:table:", v3, CFSTR("Localized"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (id)titleForAddCustomItem
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ADD_CUSTOM_LABEL_BUTTON"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForSupplementalItems
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ALL_LABELS"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)cancelPicker:(id)a3
{
  id v4;

  -[CNPickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerDidCancel:", self);

}

- (void)doneInlineEditing:(id)a3
{
  void *v4;

  -[CNPickerController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", 0);

  -[CNPickerController _updateRightButtonItem](self, "_updateRightButtonItem");
}

- (void)donePicker:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  -[CNPickerController customEditingItem](self, "customEditingItem", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[CNPickerController customTextField](self, "customTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFirstResponder");

    if (v7)
    {
      -[CNPickerController customEditingItem](self, "customEditingItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPickerController setSelectedItem:](self, "setSelectedItem:", v8);

    }
  }
  -[CNPickerController delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPickerController selectedItem](self, "selectedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "picker:didPickItem:", self, v9);

}

- (void)presentExtendedPicker
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc((Class)objc_opt_class());
  -[CNPickerController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "initWithStyle:", objc_msgSend(v4, "style"));

  objc_msgSend(v8, "setDelegate:", self);
  -[CNPickerController remainderSupplementalItems](self, "remainderSupplementalItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBuiltinItems:", v5);

  -[CNPickerController promotedSupplementalItems](self, "promotedSupplementalItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPromotedItems:", v6);

  objc_msgSend(v8, "setAllowsCustomItems:", 0);
  -[CNPickerController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushViewController:animated:", v8, 1);

}

- (void)customLabelUpdated:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController setCustomTextField:](self, "setCustomTextField:", v4);

  -[CNPickerController customTextField](self, "customTextField");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController setCustomEditingItem:](self, "setCustomEditingItem:", v5);

}

- (BOOL)isAddCustomItemIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  _BOOL4 v6;

  v4 = a3;
  if (-[CNPickerController allowsCustomItems](self, "allowsCustomItems")
    && (v5 = objc_msgSend(v4, "section"), v5 == -[CNPickerController customItemsSection](self, "customItemsSection"))
    && !objc_msgSend(v4, "row"))
  {
    v6 = !-[CNPickerController isSearchControllerActive](self, "isSearchControllerActive");
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isSupplementalDisclosureItemIndexPath:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 == -[CNPickerController builtinItemsSection](self, "builtinItemsSection"))
  {
    v6 = objc_msgSend(v4, "row");
    -[CNPickerController filteredBuiltinItems](self, "filteredBuiltinItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 >= objc_msgSend(v7, "count");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  objc_super v34;
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)CNPickerController;
  -[CNPickerController viewWillAppear:](&v34, sel_viewWillAppear_, a3);
  -[CNPickerController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cnui_applyContactStyle");

  -[CNPickerController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cnui_applyContactStyle");

  if (-[UIViewController ab_shouldShowNavBarButtons](self, "ab_shouldShowNavBarButtons"))
  {
    -[CNPickerController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPicker_);
      -[CNPickerController navigationItem](self, "navigationItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    }
  }
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBackgroundColor:", v12);

    -[CNPickerController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSectionIndexBackgroundColor:", v15);

  }
  if (-[CNPickerController allowsCustomItems](self, "allowsCustomItems"))
  {
    -[CNPickerController selectedItem](self, "selectedItem");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      -[CNPickerController discoveredItems](self, "discoveredItems");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNPickerController selectedItem](self, "selectedItem");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "containsObject:", v20))
        goto LABEL_9;
      -[CNPickerController builtinItems](self, "builtinItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __37__CNPickerController_viewWillAppear___block_invoke;
      v33[3] = &unk_1E204E1D8;
      v33[4] = self;
      if ((objc_msgSend(v21, "_cn_any:", v33) & 1) != 0)
      {
        v23 = 0;
      }
      else
      {
        -[CNPickerController promotedItems](self, "promotedItems");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v22;
        v32[1] = 3221225472;
        v32[2] = __37__CNPickerController_viewWillAppear___block_invoke_2;
        v32[3] = &unk_1E204E1D8;
        v32[4] = self;
        if ((objc_msgSend(v24, "_cn_any:", v32) & 1) != 0)
        {
          v23 = 0;
        }
        else
        {
          -[CNPickerController customItems](self, "customItems");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v31[0] = v22;
          v31[1] = 3221225472;
          v31[2] = __37__CNPickerController_viewWillAppear___block_invoke_3;
          v31[3] = &unk_1E204E1D8;
          v31[4] = self;
          v23 = objc_msgSend(v25, "_cn_any:", v31) ^ 1;

        }
      }

      if (v23)
      {
        -[CNPickerController supplementalItems](self, "supplementalItems");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __37__CNPickerController_viewWillAppear___block_invoke_4;
        v30[3] = &unk_1E204E1D8;
        v30[4] = self;
        v27 = objc_msgSend(v26, "_cn_any:", v30);

        if (v27)
        {
          -[CNPickerController builtinItems](self, "builtinItems");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPickerController selectedItem](self, "selectedItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "arrayByAddingObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPickerController setBuiltinItems:](self, "setBuiltinItems:", v20);
        }
        else
        {
          -[CNPickerController customItems](self, "customItems");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v29)
          {
            -[CNPickerController selectedItem](self, "selectedItem");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = v18;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNPickerController setCustomItems:](self, "setCustomItems:", v19);
            goto LABEL_10;
          }
          -[CNPickerController customItems](self, "customItems");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPickerController selectedItem](self, "selectedItem");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "arrayByAddingObject:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[CNPickerController setCustomItems:](self, "setCustomItems:", v20);
        }
LABEL_9:

LABEL_10:
      }
    }
  }
  if (-[UIViewController ab_shouldShowNavBarButtons](self, "ab_shouldShowNavBarButtons"))
    -[CNPickerController _updateRightButtonItem](self, "_updateRightButtonItem");
  -[CNPickerController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "reloadData");

}

- (void)_updateRightButtonItem
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (-[CNPickerController allowsCustomItems](self, "allowsCustomItems")
    && (-[CNPickerController customItems](self, "customItems"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "count"),
        v3,
        v4))
  {
    -[CNPickerController editButtonItem](self, "editButtonItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[CNPickerController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v6);

  }
  else
  {
    -[CNPickerController navigationItem](self, "navigationItem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", 0);
  }

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CNPickerController;
  -[CNPickerController setEditing:animated:](&v13, sel_setEditing_animated_, a3, a4);
  -[CNPickerController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");
  if (a3)
  {
    v7 = 0;
  }
  else
  {
    -[CNPickerController searchController](self, "searchController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CNPickerController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSearchController:", v7);

  if (!a3)
  {

    objc_msgSend(v6, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "tableView:didEndEditingRowAtIndexPath:", v6, v12);

    }
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  -[CNPickerController setDiscoveredItemsSection:](self, "setDiscoveredItemsSection:", -1);
  -[CNPickerController setBuiltinItemsSection:](self, "setBuiltinItemsSection:", -1);
  -[CNPickerController setPromotedItemsSection:](self, "setPromotedItemsSection:", -1);
  -[CNPickerController setCustomItemsSection:](self, "setCustomItemsSection:", -1);
  if ((-[CNPickerController isEditing](self, "isEditing") & 1) != 0)
    return 1;
  if (-[CNPickerController allowsDiscoveredItems](self, "allowsDiscoveredItems"))
  {
    -[CNPickerController setDiscoveredItemsSection:](self, "setDiscoveredItemsSection:", 0);
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  -[CNPickerController promotedItems](self, "promotedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
    -[CNPickerController setPromotedItemsSection:](self, "setPromotedItemsSection:", v5++);
  -[CNPickerController setBuiltinItemsSection:](self, "setBuiltinItemsSection:", v5);
  v4 = v5 + 1;
  if (-[CNPickerController allowsCustomItems](self, "allowsCustomItems"))
  {
    -[CNPickerController setCustomItemsSection:](self, "setCustomItemsSection:", v5 + 1);
    return v5 + 2;
  }
  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  _BOOL4 v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = -[CNPickerController isSearching](self, "isSearching", a3);
  if (-[CNPickerController isEditing](self, "isEditing"))
  {
    -[CNPickerController customItems](self, "customItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v8 = v7;
    v9 = objc_msgSend(v7, "count");
    goto LABEL_8;
  }
  if (-[CNPickerController discoveredItemsSection](self, "discoveredItemsSection") == a4)
  {
    -[CNPickerController filteredDiscoveredItems](self, "filteredDiscoveredItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[CNPickerController promotedItemsSection](self, "promotedItemsSection") == a4)
  {
    -[CNPickerController filteredPromotedItems](self, "filteredPromotedItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (-[CNPickerController builtinItemsSection](self, "builtinItemsSection") == a4)
  {
    -[CNPickerController supplementalItems](self, "supplementalItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    -[CNPickerController filteredBuiltinItems](self, "filteredBuiltinItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "count");
    LODWORD(v14) = !v6;
    if (v12)
      v14 = v14;
    else
      v14 = 0;
    v9 = v13 + v14;
  }
  else
  {
    -[CNPickerController filteredCustomItems](self, "filteredCustomItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v8, "count");
    v9 = v15 + (-[CNPickerController isSearching](self, "isSearching") ^ 1);
  }
LABEL_8:

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v21;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ABPickerItemCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNumberOfLines:", 2);

  v21 = 0;
  -[CNPickerController _itemAtIndexPath:isPlaceholder:](self, "_itemAtIndexPath:isPlaceholder:", v6, &v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController _titleForPickerItem:](self, "_titleForPickerItem:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v7, "setPlaceholder:", v21);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[CNPickerController selectedItem](self, "selectedItem"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v13,
        (isKindOfClass & 1) != 0))
  {
    -[CNPickerController selectedItem](self, "selectedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "_cn_caseInsensitiveIsEqual:", v15);
  }
  else
  {
    -[CNPickerController selectedItem](self, "selectedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "isEqual:", v15);
  }
  v17 = v16;

  if (-[CNPickerController isSupplementalDisclosureItemIndexPath:](self, "isSupplementalDisclosureItemIndexPath:", v6))
  {
    v18 = v7;
    v19 = 1;
LABEL_10:
    objc_msgSend(v18, "setAccessoryType:", v19);
    goto LABEL_11;
  }
  v18 = v7;
  if (!v17)
  {
    v19 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v7, "setAccessoryType:", 3);
  -[CNPickerController setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
LABEL_11:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
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
  id v17;

  v17 = a3;
  v6 = a4;
  if (-[CNPickerController isSupplementalDisclosureItemIndexPath:](self, "isSupplementalDisclosureItemIndexPath:", v6))
  {
    -[CNPickerController presentExtendedPicker](self, "presentExtendedPicker");
  }
  else if (-[CNPickerController isAddCustomItemIndexPath:](self, "isAddCustomItemIndexPath:", v6))
  {
    objc_msgSend(v17, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", self);

    objc_msgSend(v7, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTextColor:", v10);

    objc_msgSend(v7, "beginEditing");
    objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v6, 1);

  }
  else
  {
    -[CNPickerController setSelectedIndexPath:](self, "setSelectedIndexPath:", v6);
    -[CNPickerController _itemAtIndexPath:isPlaceholder:](self, "_itemAtIndexPath:isPlaceholder:", v6, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController setSelectedItem:](self, "setSelectedItem:", v12);

    -[CNPickerController searchController](self, "searchController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setActive:", 0);

    -[CNPickerController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController selectedItem](self, "selectedItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "picker:didPickItem:", self, v15);

    -[CNPickerController selectedItem](self, "selectedItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController pickedItem:](self, "pickedItem:", v16);

    objc_msgSend(v17, "deselectRowAtIndexPath:animated:", v6, 1);
  }

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  objc_msgSend(v7, "_cnui_applyContactStyle");
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers")|| (objc_msgSend(v14, "backgroundColor"), v8 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E0DC3658], "clearColor"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "isEqual:", v9), v9, v8, v10))
  {
    -[CNPickerController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!CNUIIsWatchCompanion() && !CNUIIsActivity())
    {
      +[CNUIColorRepository contactStyleDefaultBackgroundColor](CNUIColorRepository, "contactStyleDefaultBackgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBackgroundColor:", v12);
      goto LABEL_8;
    }
    objc_msgSend(v7, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v11, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v13);

LABEL_8:
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "_cnui_applyContactStyle", a3);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return -[CNPickerController _indexForCustomItemAtIndexPath:](self, "_indexForCustomItemAtIndexPath:", a4) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (a4 == 1)
  {
    if (-[CNPickerController isSearching](self, "isSearching"))
      -[CNPickerController filteredCustomItems](self, "filteredCustomItems");
    else
      -[CNPickerController customItems](self, "customItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", -[CNPickerController _indexForCustomItemAtIndexPath:](self, "_indexForCustomItemAtIndexPath:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController removeCustomItem:](self, "removeCustomItem:", v9);
    -[CNPickerController selectedItem](self, "selectedItem");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[CNPickerController selectedItem](self, "selectedItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", v9);

      if (v13)
        -[CNPickerController setSelectedItem:](self, "setSelectedItem:", 0);
    }
    -[CNPickerController customItems](self, "customItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "removeObject:", v9);
    -[CNPickerController setCustomItems:](self, "setCustomItems:", v15);
    if (-[CNPickerController isSearching](self, "isSearching"))
    {
      -[CNPickerController filteredCustomItems](self, "filteredCustomItems");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");

      objc_msgSend(v17, "removeObject:", v9);
      -[CNPickerController setFilteredCustomItems:](self, "setFilteredCustomItems:", v17);

    }
    -[CNPickerController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deleteRowsAtIndexPaths:withRowAnimation:", v19, 100);

  }
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CNPickerController_updateSearchResultsForSearchController___block_invoke;
  v9[3] = &unk_1E204A8A0;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v6, 3, v9);
  -[CNPickerController setFilterTokens:](self, "setFilterTokens:", v8);

}

- (void)willPresentSearchController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!-[CNPickerController isSearching](self, "isSearching", a3))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (-[CNPickerController customItemsSection](self, "customItemsSection") != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CNPickerController isAddCustomItemIndexPath:](self, "isAddCustomItemIndexPath:", v4))
        objc_msgSend(v11, "addObject:", v4);

    }
    if (-[CNPickerController builtinItemsSection](self, "builtinItemsSection") != -1)
    {
      -[CNPickerController supplementalItems](self, "supplementalItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        v7 = (void *)MEMORY[0x1E0CB36B0];
        -[CNPickerController builtinItems](self, "builtinItems");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "indexPathForRow:inSection:", objc_msgSend(v8, "count"), -[CNPickerController builtinItemsSection](self, "builtinItemsSection"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "addObject:", v9);
      }
    }
    -[CNPickerController setSearchControllerActive:](self, "setSearchControllerActive:", 1);
    -[CNPickerController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "deleteRowsAtIndexPaths:withRowAnimation:", v11, 0);

  }
}

- (void)didDismissSearchController:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (-[CNPickerController customItemsSection](self, "customItemsSection") != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[CNPickerController isAddCustomItemIndexPath:](self, "isAddCustomItemIndexPath:", v4))
      objc_msgSend(v11, "addObject:", v4);

  }
  if (-[CNPickerController builtinItemsSection](self, "builtinItemsSection") != -1)
  {
    -[CNPickerController supplementalItems](self, "supplementalItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB36B0];
      -[CNPickerController builtinItems](self, "builtinItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "indexPathForRow:inSection:", objc_msgSend(v8, "count"), -[CNPickerController builtinItemsSection](self, "builtinItemsSection"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "addObject:", v9);
    }
  }
  -[CNPickerController setSearchControllerActive:](self, "setSearchControllerActive:", 0);
  -[CNPickerController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertRowsAtIndexPaths:withRowAnimation:", v11, 0);

}

- (void)setFilterTokens:(id)a3
{
  id v5;
  BOOL v6;
  void (**v7)(void *, void *);
  id v8;
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
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  CNPickerController *v27;
  id v28;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
    v6 = 0;
  else
    v6 = -[NSArray count](self->_filterTokens, "count") == 0;
  objc_storeStrong((id *)&self->_filterTokens, a3);
  if (!objc_msgSend(v5, "count"))
  {
    -[CNPickerController setFilteredDiscoveredItems:](self, "setFilteredDiscoveredItems:", 0);
    -[CNPickerController setFilteredCustomItems:](self, "setFilteredCustomItems:", 0);
    -[CNPickerController setFilteredBuiltinItems:](self, "setFilteredBuiltinItems:", 0);
    -[CNPickerController setFilteredPromotedItems:](self, "setFilteredPromotedItems:", 0);
    if (v6)
      goto LABEL_11;
    goto LABEL_10;
  }
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __38__CNPickerController_setFilterTokens___block_invoke;
  v26 = &unk_1E204A8F0;
  v27 = self;
  v28 = v5;
  v7 = (void (**)(void *, void *))_Block_copy(&v23);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[CNPickerController searchIncludesSupplementalItems](self, "searchIncludesSupplementalItems", v23, v24, v25, v26, v27)&& (-[CNPickerController supplementalItems](self, "supplementalItems"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    v10 = (void *)MEMORY[0x1E0C99E10];
    -[CNPickerController supplementalItems](self, "supplementalItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "orderedSetWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPickerController supplementalItems](self, "supplementalItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v13);

    objc_msgSend(v12, "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArray:", v14);

  }
  else
  {
    -[CNPickerController builtinItems](self, "builtinItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setArray:", v12);
  }

  -[CNPickerController discoveredItems](self, "discoveredItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController setFilteredDiscoveredItems:](self, "setFilteredDiscoveredItems:", v16);

  -[CNPickerController customItems](self, "customItems");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController setFilteredCustomItems:](self, "setFilteredCustomItems:", v18);

  -[CNPickerController promotedItems](self, "promotedItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController setFilteredPromotedItems:](self, "setFilteredPromotedItems:", v20);

  v7[2](v7, v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController setFilteredBuiltinItems:](self, "setFilteredBuiltinItems:", v21);

  if (!v6)
  {
LABEL_10:
    -[CNPickerController tableView](self, "tableView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "reloadData");

  }
LABEL_11:

}

- (BOOL)isSearching
{
  BOOL v3;
  void *v4;

  if (-[CNPickerController isSearchControllerActive](self, "isSearchControllerActive"))
    return 1;
  -[CNPickerController filterTokens](self, "filterTokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0DC34F0];
  v5 = a3;
  v8 = (id)objc_msgSend([v4 alloc], "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePicker_);
  -[CNPickerController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_customLabelUpdated_, *MEMORY[0x1E0DC54D0], v5);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController setSelectedItem:](self, "setSelectedItem:", v7);

  }
  objc_msgSend(v4, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  -[CNPickerController donePicker:](self, "donePicker:", v4);
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPickerController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endEditing");
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  uint64_t v5;
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
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D13848];
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController customItems](self, "customItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPickerController setCustomItems:](self, "setCustomItems:", v10);

    -[CNPickerController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cellForRowAtIndexPath:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPickerController customEditingItem](self, "customEditingItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    objc_msgSend(v13, "setTextFieldHidden:", 1);
    objc_msgSend(v13, "setPlaceholder:", 0);
    -[CNPickerController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, -[CNPickerController customItemsSection](self, "customItemsSection"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertRowsAtIndexPaths:withRowAnimation:", v18, 100);

  }
  -[CNPickerController _updateRightButtonItem](self, "_updateRightButtonItem");

}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneInlineEditing_);
  -[CNPickerController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", v6);

}

- (void)pickerDidCancel:(id)a3
{
  id v3;
  id v4;

  -[CNPickerController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CNPickerController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "picker:didPickItem:", self, v5);

}

- (void)picker:(id)a3 didDeleteItem:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[CNPickerController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CNPickerController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "picker:didDeleteItem:", self, v8);

  }
}

- (unint64_t)_indexForCustomItemAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "row");
  if ((-[CNPickerController isEditing](self, "isEditing") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "section");
    if (v6 == -[CNPickerController discoveredItemsSection](self, "discoveredItemsSection")
      || (v7 = objc_msgSend(v4, "section"),
          v7 == -[CNPickerController promotedItemsSection](self, "promotedItemsSection"))
      || (v8 = objc_msgSend(v4, "section"), v8 == -[CNPickerController builtinItemsSection](self, "builtinItemsSection"))
      || !v5 && !-[CNPickerController isSearching](self, "isSearching"))
    {
      v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v5 -= -[CNPickerController isSearching](self, "isSearching") ^ 1;
    }
  }

  return v5;
}

- (id)_itemAtIndexPath:(id)a3 isPlaceholder:(BOOL *)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v21;

  v6 = a3;
  v7 = -[CNPickerController _indexForCustomItemAtIndexPath:](self, "_indexForCustomItemAtIndexPath:", v6);
  v8 = v7;
  if (a4)
    *a4 = 0;
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = objc_msgSend(v6, "section");
    if (v9 == -[CNPickerController discoveredItemsSection](self, "discoveredItemsSection"))
    {
      -[CNPickerController filteredDiscoveredItems](self, "filteredDiscoveredItems");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = objc_msgSend(v6, "section");
      if (v14 != -[CNPickerController promotedItemsSection](self, "promotedItemsSection"))
      {
        v15 = objc_msgSend(v6, "section");
        if (v15 == -[CNPickerController builtinItemsSection](self, "builtinItemsSection"))
        {
          v16 = objc_msgSend(v6, "indexAtPosition:", 1);
          -[CNPickerController filteredBuiltinItems](self, "filteredBuiltinItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "count");

          if (v16 < v18)
          {
            -[CNPickerController filteredBuiltinItems](self, "filteredBuiltinItems");
            v10 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          }
          -[CNPickerController titleForSupplementalItems](self, "titleForSupplementalItems");
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (a4)
            *a4 = 1;
          -[CNPickerController titleForAddCustomItem](self, "titleForAddCustomItem");
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v19 = (void *)v21;
        goto LABEL_14;
      }
      -[CNPickerController filteredPromotedItems](self, "filteredPromotedItems");
      v10 = objc_claimAutoreleasedReturnValue();
    }
LABEL_12:
    v12 = (void *)v10;
    v13 = objc_msgSend(v6, "row");
    v11 = v12;
    goto LABEL_13;
  }
  -[CNPickerController filteredCustomItems](self, "filteredCustomItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = v8;
LABEL_13:
  objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v19;
}

- (NSArray)filteredCustomItems
{
  NSArray *filteredCustomItems;

  filteredCustomItems = self->_filteredCustomItems;
  if (filteredCustomItems)
    return filteredCustomItems;
  -[CNPickerController customItems](self, "customItems");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)filteredPromotedItems
{
  NSArray *filteredPromotedItems;

  filteredPromotedItems = self->_filteredPromotedItems;
  if (filteredPromotedItems)
    return filteredPromotedItems;
  -[CNPickerController promotedItems](self, "promotedItems");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)filteredDiscoveredItems
{
  NSArray *filteredDiscoveredItems;

  filteredDiscoveredItems = self->_filteredDiscoveredItems;
  if (filteredDiscoveredItems)
    return filteredDiscoveredItems;
  -[CNPickerController discoveredItems](self, "discoveredItems");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)filteredBuiltinItems
{
  NSArray *filteredBuiltinItems;

  filteredBuiltinItems = self->_filteredBuiltinItems;
  if (filteredBuiltinItems)
    return filteredBuiltinItems;
  -[CNPickerController builtinItems](self, "builtinItems");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)selectedItem
{
  return self->_selectedItem;
}

- (void)setSelectedItem:(id)a3
{
  objc_storeStrong(&self->_selectedItem, a3);
}

- (CNPickerControllerDelegate)delegate
{
  return (CNPickerControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)discoveredItems
{
  return self->_discoveredItems;
}

- (void)setDiscoveredItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (BOOL)allowsDiscoveredItems
{
  return self->_allowsDiscoveredItems;
}

- (void)setAllowsDiscoveredItems:(BOOL)a3
{
  self->_allowsDiscoveredItems = a3;
}

- (NSArray)promotedItems
{
  return self->_promotedItems;
}

- (void)setPromotedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (NSArray)builtinItems
{
  return self->_builtinItems;
}

- (void)setBuiltinItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1056);
}

- (NSArray)supplementalItems
{
  return self->_supplementalItems;
}

- (void)setSupplementalItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1064);
}

- (NSArray)promotedSupplementalItems
{
  return self->_promotedSupplementalItems;
}

- (void)setPromotedSupplementalItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (NSArray)remainderSupplementalItems
{
  return self->_remainderSupplementalItems;
}

- (void)setRemainderSupplementalItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (BOOL)searchIncludesSupplementalItems
{
  return self->_searchIncludesSupplementalItems;
}

- (void)setSearchIncludesSupplementalItems:(BOOL)a3
{
  self->_searchIncludesSupplementalItems = a3;
}

- (NSArray)customItems
{
  return self->_customItems;
}

- (void)setCustomItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (BOOL)allowsCustomItems
{
  return self->_allowsCustomItems;
}

- (void)setAllowsCustomItems:(BOOL)a3
{
  self->_allowsCustomItems = a3;
}

- (NSString)itemLocalizationKey
{
  return self->_itemLocalizationKey;
}

- (void)setItemLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (id)itemLocalizationBlock
{
  return self->_itemLocalizationBlock;
}

- (void)setItemLocalizationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (int64_t)discoveredItemsSection
{
  return self->_discoveredItemsSection;
}

- (void)setDiscoveredItemsSection:(int64_t)a3
{
  self->_discoveredItemsSection = a3;
}

- (int64_t)promotedItemsSection
{
  return self->_promotedItemsSection;
}

- (void)setPromotedItemsSection:(int64_t)a3
{
  self->_promotedItemsSection = a3;
}

- (int64_t)builtinItemsSection
{
  return self->_builtinItemsSection;
}

- (void)setBuiltinItemsSection:(int64_t)a3
{
  self->_builtinItemsSection = a3;
}

- (int64_t)customItemsSection
{
  return self->_customItemsSection;
}

- (void)setCustomItemsSection:(int64_t)a3
{
  self->_customItemsSection = a3;
}

- (NSString)customEditingItem
{
  return self->_customEditingItem;
}

- (void)setCustomEditingItem:(id)a3
{
  objc_storeStrong((id *)&self->_customEditingItem, a3);
}

- (UITextField)customTextField
{
  return self->_customTextField;
}

- (void)setCustomTextField:(id)a3
{
  objc_storeStrong((id *)&self->_customTextField, a3);
}

- (NSArray)filterTokens
{
  return self->_filterTokens;
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (void)setFilteredDiscoveredItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (void)setFilteredPromotedItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1192);
}

- (void)setFilteredBuiltinItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (void)setFilteredCustomItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1208);
}

- (BOOL)isSearchControllerActive
{
  return self->_searchControllerActive;
}

- (void)setSearchControllerActive:(BOOL)a3
{
  self->_searchControllerActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredCustomItems, 0);
  objc_storeStrong((id *)&self->_filteredBuiltinItems, 0);
  objc_storeStrong((id *)&self->_filteredPromotedItems, 0);
  objc_storeStrong((id *)&self->_filteredDiscoveredItems, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_filterTokens, 0);
  objc_storeStrong((id *)&self->_customTextField, 0);
  objc_storeStrong((id *)&self->_customEditingItem, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong(&self->_itemLocalizationBlock, 0);
  objc_storeStrong((id *)&self->_itemLocalizationKey, 0);
  objc_storeStrong((id *)&self->_customItems, 0);
  objc_storeStrong((id *)&self->_remainderSupplementalItems, 0);
  objc_storeStrong((id *)&self->_promotedSupplementalItems, 0);
  objc_storeStrong((id *)&self->_supplementalItems, 0);
  objc_storeStrong((id *)&self->_builtinItems, 0);
  objc_storeStrong((id *)&self->_promotedItems, 0);
  objc_storeStrong((id *)&self->_discoveredItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_selectedItem, 0);
}

id __38__CNPickerController_setFilterTokens___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v2;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v32;
    v3 = MEMORY[0x1E0C809B0];
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
        {
          v5 = v4;
          objc_enumerationMutation(obj);
          v4 = v5;
        }
        v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v4);
        v20 = v4;
        objc_msgSend(*(id *)(a1 + 32), "_titleForPickerItem:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v7 = *(id *)(a1 + 40);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v8)
        {
          v9 = *(_QWORD *)v28;
          while (2)
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v28 != v9)
                objc_enumerationMutation(v7);
              v11 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v10);
              v23 = 0;
              v24 = &v23;
              v25 = 0x2020000000;
              v26 = 0;
              v12 = objc_msgSend(v6, "length");
              v22[0] = v3;
              v22[1] = 3221225472;
              v22[2] = __38__CNPickerController_setFilterTokens___block_invoke_2;
              v22[3] = &unk_1E204A8C8;
              v22[4] = v11;
              v22[5] = &v23;
              objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v12, 3, v22);
              LODWORD(v11) = *((unsigned __int8 *)v24 + 24);
              _Block_object_dispose(&v23, 8);
              if (!(_DWORD)v11)
              {

                goto LABEL_16;
              }
              ++v10;
            }
            while (v8 != v10);
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v8)
              continue;
            break;
          }
        }

        objc_msgSend(v15, "addObject:", v19);
LABEL_16:

        v4 = v20 + 1;
      }
      while (v20 + 1 != v18);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v18);
  }

  v13 = (void *)objc_msgSend(v15, "copy");
  return v13;
}

uint64_t __38__CNPickerController_setFilterTokens___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(a2, "_cn_hasPrefix:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

uint64_t __61__CNPickerController_updateSearchResultsForSearchController___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

uint64_t __37__CNPickerController_viewWillAppear___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", v4);

  return v5;
}

@end
