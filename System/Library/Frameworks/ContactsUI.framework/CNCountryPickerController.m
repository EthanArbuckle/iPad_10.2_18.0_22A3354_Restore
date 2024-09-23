@implementation CNCountryPickerController

- (CNCountryPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  CNCountryPickerController *v4;
  uint64_t v5;
  UITableViewController *tableViewController;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNCountryPickerController;
  v4 = -[CNCountryPickerController initWithNibName:bundle:](&v23, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithNibName:bundle:", 0, 0);
    tableViewController = v4->_tableViewController;
    v4->_tableViewController = (UITableViewController *)v5;

    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("EDIT_COUNTRY_FORMAT"), &stru_1E20507A8, CFSTR("Localized"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController setTitle:](v4->_tableViewController, "setTitle:", v8);

    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v4);

    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSource:", v4);

    v11 = *MEMORY[0x1E0DC53D8];
    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRowHeight:", v11);

    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lineHeight");
    v15 = v14 * 1.5;
    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setEstimatedRowHeight:", v15);

    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSeparatorInsetReference:", 1);

    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ABCountryNameCell"));

    -[CNCountryPickerController navigationBar](v4, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_cnui_applyContactStyle");

    -[UITableViewController tableView](v4->_tableViewController, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_cnui_applyContactStyle");

  }
  return v4;
}

- (void)cancelPicker:(id)a3
{
  id v4;

  -[CNCountryPickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryPickerDidCancel:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNCountryPickerController;
  -[CNCountryPickerController viewDidLoad](&v5, sel_viewDidLoad);
  -[CNCountryPickerController _loadCountryCodes](self, "_loadCountryCodes");
  -[CNCountryPickerController tableViewController](self, "tableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v3 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNCountryPickerController;
  -[CNCountryPickerController viewWillAppear:](&v21, sel_viewWillAppear_);
  if (-[UIViewController ab_shouldShowNavBarButtons](self, "ab_shouldShowNavBarButtons"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPicker_);
    -[CNCountryPickerController tableViewController](self, "tableViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v5);

  }
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSectionIndexBackgroundColor:", v11);

  }
  -[CNCountryPickerController viewControllers](self, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    -[CNCountryPickerController tableViewController](self, "tableViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNCountryPickerController pushViewController:animated:](self, "pushViewController:animated:", v15, 0);

    -[CNCountryPickerController selectedIndexPath](self, "selectedIndexPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "row");

    if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[UITableViewController tableView](self->_tableViewController, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCountryPickerController selectedIndexPath](self, "selectedIndexPath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scrollToRowAtIndexPath:atScrollPosition:animated:", v19, 2, v3);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_windowDidRotate_, *MEMORY[0x1E0DC5620], 0);

  }
}

- (void)windowDidRotate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[CNCountryPickerController selectedIndexPath](self, "selectedIndexPath", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "row");

  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CNCountryPickerController selectedIndexPath](self, "selectedIndexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 2, 1);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNCountryPickerController;
  -[CNCountryPickerController dealloc](&v4, sel_dealloc);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[CNCountryPickerController collation](self, "collation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[CNCountryPickerController sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;

  if (-[CNCountryPickerController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3) < 1)
  {
    v8 = 0;
  }
  else
  {
    -[CNCountryPickerController collation](self, "collation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionTitles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ABCountryNameCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCountryPickerController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);

  objc_msgSend(v10, "countryName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  -[CNCountryPickerController selectedIndexPath](self, "selectedIndexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "compare:", v14);

  if (v15)
  {
    objc_msgSend(v7, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setImage:", 0);
  }
  else
  {
    objc_msgSend(v7, "_checkmarkImage:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setImage:", v16);

  }
  objc_msgSend(v7, "separatorInset");
  objc_msgSend(v7, "setSeparatorInset:");

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a4;
  v7 = a3;
  -[CNCountryPickerController sections](self, "sections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "row");
  objc_msgSend(v14, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCountryPickerController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "countryPicker:didPickCountryCode:", self, v12);

  objc_msgSend(v7, "indexPathForSelectedRow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v13, 1);

}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  void *v3;
  void *v4;

  -[CNCountryPickerController collation](self, "collation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionIndexTitles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  void *v6;
  int64_t v7;

  -[CNCountryPickerController collation](self, "collation", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sectionForSectionIndexTitleAtIndex:", a5);

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  objc_msgSend(v7, "_cnui_applyContactStyle");
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    objc_msgSend(v9, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

  }
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "_cnui_applyContactStyle", a3);
}

- (void)_loadCountryCodes
{
  CFArrayRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ABCountry *v14;
  BOOL v15;
  void *v16;
  const __CFArray *v17;
  CNCountryPickerController *v18;
  const __CFArray *obj;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = CFLocaleCopyISOCountryCodes();
  if (v3)
  {
    v18 = self;
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[__CFArray count](v3, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v3;
    obj = v3;
    v4 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v4)
    {
      v5 = v4;
      v23 = *(_QWORD *)v25;
      v21 = *MEMORY[0x1E0D138A0];
      v20 = *MEMORY[0x1E0D138A8];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v25 != v23)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "lowercaseString");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D13B08], "addressFormats");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v9, "objectForKey:", v21);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D13B08], "localizedStringForPostalAddressString:returningNilIfNotFound:", v10, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectForKey:", v20);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D13B08], "localizedStringForPostalAddressString:returningNilIfNotFound:", v12, 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_alloc_init(ABCountry);
            -[ABCountry setCountryCode:](v14, "setCountryCode:", v7);
            -[ABCountry setCountryName:](v14, "setCountryName:", v11);
            if (v13)
              v15 = v12 == v13;
            else
              v15 = 1;
            if (v15)
              v16 = v11;
            else
              v16 = v13;
            -[ABCountry setPhoneticCountryName:](v14, "setPhoneticCountryName:", v16);
            objc_msgSend(v22, "addObject:", v14);

          }
        }
        v5 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v5);
    }

    self = v18;
    -[CNCountryPickerController setCountries:](v18, "setCountries:", v22);

    v3 = v17;
  }
  -[CNCountryPickerController _configureSections](self, "_configureSections");

}

- (void)_configureSections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  CNCountryPickerController *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  CNCountryPickerController *v32;
  void *v33;
  uint64_t v34;
  id obj;
  void *v36;
  CNCountryPickerController *v37;
  char v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCountryPickerController setCollation:](self, "setCollation:", v3);

  v37 = self;
  -[CNCountryPickerController collation](self, "collation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    do
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "addObject:", v9);

      --v8;
    }
    while (v8);
  }
  v10 = *MEMORY[0x1E0D13848];
  v11 = self;
  -[CNCountryPickerController selectedCountryCode](self, "selectedCountryCode", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v12);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[CNCountryPickerController countries](self, "countries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  v36 = v7;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v41;
    v16 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v41 != v15)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        -[CNCountryPickerController collation](v11, "collation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "sectionForObject:collationStringSelector:", v18, sel_phoneticCountryName);

        objc_msgSend(v7, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v18);
        if ((v38 & 1) == 0)
        {
          -[CNCountryPickerController selectedCountryCode](v11, "selectedCountryCode");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "countryCode");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v23);

          v25 = v24 == 0;
          v7 = v36;
          v11 = v37;
          if (!v25)
            v16 = v20;
        }

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v14);
  }
  else
  {
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v34)
  {
    v26 = 0;
    v27 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      objc_msgSend(v36, "objectAtIndexedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNCountryPickerController collation](v11, "collation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "sortedArrayFromArray:collationStringSelector:", v28, sel_phoneticCountryName);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        objc_msgSend(v36, "setObject:atIndexedSubscript:", v30, v26);
      v31 = v38;
      if (v16 != v26)
        v31 = 1;
      v11 = v37;
      if ((v31 & 1) == 0)
      {
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __47__CNCountryPickerController__configureSections__block_invoke;
        v39[3] = &unk_1E2049830;
        v39[4] = v37;
        v27 = objc_msgSend(v30, "_cn_indexOfFirstObjectPassingTest:", v39);
      }

      ++v26;
    }
    while (v34 != v26);
  }
  else
  {
    v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v27, v16);
  v32 = v11;
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCountryPickerController setSelectedIndexPath:](v32, "setSelectedIndexPath:", v33);

  -[CNCountryPickerController setSections:](v32, "setSections:", v36);
}

- (NSString)selectedCountryCode
{
  return self->_selectedCountryCode;
}

- (void)setSelectedCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1408);
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (UILocalizedIndexedCollation)collation
{
  return self->_collation;
}

- (void)setCollation:(id)a3
{
  objc_storeStrong((id *)&self->_collation, a3);
}

- (NSArray)countries
{
  return self->_countries;
}

- (void)setCountries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1432);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1440);
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setSelectedIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_countries, 0);
  objc_storeStrong((id *)&self->_collation, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_selectedCountryCode, 0);
}

uint64_t __47__CNCountryPickerController__configureSections__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

@end
