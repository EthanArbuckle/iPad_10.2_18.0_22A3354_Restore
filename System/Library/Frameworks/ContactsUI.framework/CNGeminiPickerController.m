@implementation CNGeminiPickerController

- (CNGeminiPickerController)initWithGeminiResult:(id)a3
{
  id v4;
  CNGeminiPickerController *v5;
  uint64_t v6;
  UITableViewController *tableViewController;
  void *v8;
  void *v9;
  CNGeminiPickerController *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNGeminiPickerController;
  v5 = -[CNGeminiPickerController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D60]), "initWithStyle:", 1);
    tableViewController = v5->_tableViewController;
    v5->_tableViewController = (UITableViewController *)v6;

    -[UITableViewController tableView](v5->_tableViewController, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v5);
    objc_msgSend(v8, "setDataSource:", v5);
    -[CNGeminiPickerController setGeminiResult:reload:](v5, "setGeminiResult:reload:", v4, 0);
    -[CNGeminiPickerController tableViewController](v5, "tableViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerController pushViewController:animated:](v5, "pushViewController:animated:", v9, 0);

    v10 = v5;
  }

  return v5;
}

- (void)setGeminiResult:(id)a3
{
  -[CNGeminiPickerController setGeminiResult:reload:](self, "setGeminiResult:reload:", a3, 1);
}

- (void)setGeminiResult:(id)a3 reload:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *geminiChannels;
  uint64_t v10;
  void *v11;
  CNGeminiChannel **p_preferredGeminiChannel;
  void *v13;
  NSIndexPath *v14;
  NSIndexPath *selectedIndexPath;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v18 = a3;
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v18, "availableChannels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  geminiChannels = self->_geminiChannels;
  self->_geminiChannels = v8;

  v10 = objc_msgSend(v18, "usage");
  if (v10 == 1)
  {
    objc_msgSend(v18, "channel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  p_preferredGeminiChannel = &self->_preferredGeminiChannel;
  objc_storeStrong((id *)&self->_preferredGeminiChannel, v11);
  if (v10 == 1)

  if (*p_preferredGeminiChannel && (-[CNGeminiChannel isAvailable](*p_preferredGeminiChannel, "isAvailable") & 1) == 0)
    -[NSMutableArray addObject:](self->_geminiChannels, "addObject:", *p_preferredGeminiChannel);
  -[CNGeminiPickerController preferredGeminiChannel](self, "preferredGeminiChannel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGeminiPickerController indexPathForGeminiChannel:](self, "indexPathForGeminiChannel:", v13);
  v14 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v14;

  if (v4)
  {
    -[CNGeminiPickerController tableViewController](self, "tableViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadData");

  }
}

- (void)didPickItem
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[CNGeminiPickerController selectedIndexPath](self, "selectedIndexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGeminiPickerController geminiChannelForIndexPath:](self, "geminiChannelForIndexPath:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 && !objc_msgSend(v6, "isAvailable"))
  {
    -[CNGeminiPickerController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickerDidCancel:", self);
  }
  else
  {
    -[CNGeminiPickerController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "senderIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "picker:didPickItem:", self, v5);

  }
}

- (void)cancelPicker:(id)a3
{
  id v4;

  -[CNGeminiPickerController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pickerDidCancel:", self);

}

- (id)indexPathForGeminiChannel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];

  if (a3)
  {
    -[CNGeminiPickerController geminiChannels](self, "geminiChannels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__CNGeminiPickerController_indexPathForGeminiChannel___block_invoke;
    v9[3] = &unk_1E20486D8;
    v9[4] = self;
    v5 = (void *)objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", v9);

    v6 = (void *)MEMORY[0x1E0CB36B0];
    if (v5 != (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = v5;
      v7 = 1;
      goto LABEL_7;
    }
    a3 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB36B0];
  }
  v7 = 0;
LABEL_7:
  objc_msgSend(v6, "indexPathForRow:inSection:", a3, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)geminiChannelForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "section") == 1)
  {
    -[CNGeminiPickerController geminiChannels](self, "geminiChannels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)prepareCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
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
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  int64_t v30;
  uint64_t v31;
  id v32;

  v32 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    -[CNGeminiPickerController geminiChannelForIndexPath:](self, "geminiChannelForIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAvailable");
    v9 = CFSTR("PREFERRED_LINE_PICKER_ALWAYS_USE_LABEL_UNAVAILABLE-%@");
    if (v8)
      v9 = CFSTR("PREFERRED_LINE_PICKER_ALWAYS_USE_LABEL-%@");
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = v9;
    CNContactsUIBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized-GEMINI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0C97398];
    objc_msgSend(v7, "handle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "phoneNumberWithStringValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "formattedInternationalStringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized-GEMINI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localizedBadgeLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v25 = v32;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v26 = v25;
    else
      v26 = 0;
    v27 = v26;

    objc_msgSend(v27, "setText:detailText:badgeText:", v15, v19, v24);
  }
  else
  {
    CNContactsUIBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PREFERRED_LINE_PICKER_LAST_USED_VALUE"), &stru_1E20507A8, CFSTR("Localized-GEMINI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v15);
  }

  -[CNGeminiPickerController tableViewController](self, "tableViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[CNGeminiPickerController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v29, objc_msgSend(v6, "section"));
  v31 = objc_msgSend(v6, "row") + 1;

  if (v30 == v31)
    objc_msgSend(v32, "setSeparatorInset:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[CNGeminiPickerController geminiChannels](self, "geminiChannels", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  if (!a4)
    return 1;
  -[CNGeminiPickerController geminiChannels](self, "geminiChannels", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    CNContactsUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PREFERRED_LINE_PICKER_ALWAYS_USE_HEADER"), &stru_1E20507A8, CFSTR("Localized-GEMINI"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a4)
    v7 = CFSTR("PREFERRED_LINE_PICKER_ALWAYS_USE_FOOTER");
  else
    v7 = CFSTR("PREFERRED_LINE_PICKER_LAST_USED_FOOTER");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E20507A8, CFSTR("Localized-GEMINI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  Class *v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = objc_msgSend(v5, "section");
  if (v6)
    v7 = 3;
  else
    v7 = 0;
  v8 = (Class *)0x1E0DC3D50;
  if (v6)
    v8 = (Class *)&off_1E203F1C8;
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithStyle:reuseIdentifier:", v7, 0);
  -[CNGeminiPickerController prepareCell:atIndexPath:](self, "prepareCell:atIndexPath:", v9, v5);
  -[CNGeminiPickerController selectedIndexPath](self, "selectedIndexPath");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v5)
    objc_msgSend(v9, "setAccessoryType:", 3);
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
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

  v17 = a4;
  v6 = a3;
  if (-[UIViewController ab_shouldShowNavBarButtons](self, "ab_shouldShowNavBarButtons"))
  {
    -[CNGeminiPickerController selectedIndexPath](self, "selectedIndexPath");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v17)
    {
      -[CNGeminiPickerController tableViewController](self, "tableViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGeminiPickerController selectedIndexPath](self, "selectedIndexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cellForRowAtIndexPath:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAccessoryType:", 0);

      -[CNGeminiPickerController tableViewController](self, "tableViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cellForRowAtIndexPath:", v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAccessoryType:", 3);

      -[CNGeminiPickerController setSelectedIndexPath:](self, "setSelectedIndexPath:", v17);
    }
    objc_msgSend(v6, "indexPathForSelectedRow");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v15, 0);

  }
  else
  {
    -[CNGeminiPickerController setSelectedIndexPath:](self, "setSelectedIndexPath:", v17);
    -[CNGeminiPickerController didPickItem](self, "didPickItem");
    objc_msgSend(v6, "indexPathForSelectedRow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v16, 0);

    -[CNGeminiPickerController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
    -[CNGeminiPickerController tableViewController](self, "tableViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v13);

  }
  else
  {
    +[CNUIColorRepository contactStyleDefaultBackgroundColor](CNUIColorRepository, "contactStyleDefaultBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v11);
  }

}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  objc_msgSend(a4, "_cnui_applyContactStyle", a3);
}

- (void)viewWillAppear:(BOOL)a3
{
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
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)CNGeminiPickerController;
  -[CNGeminiPickerController viewWillAppear:](&v23, sel_viewWillAppear_, a3);
  -[CNGeminiPickerController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cnui_applyContactStyle");

  -[UITableViewController tableView](self->_tableViewController, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cnui_applyContactStyle");

  CNContactsUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PREFERRED_LINE_PICKER_TITLE"), &stru_1E20507A8, CFSTR("Localized-GEMINI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewController navigationItem](self->_tableViewController, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTitle:", v7);

  -[UITableViewController navigationItem](self->_tableViewController, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);

  if (-[UIViewController ab_shouldShowNavBarButtons](self, "ab_shouldShowNavBarButtons"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelPicker_);
    -[UITableViewController navigationItem](self->_tableViewController, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLeftBarButtonItem:", v10);

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_donePicker_);
    -[UITableViewController navigationItem](self->_tableViewController, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);

  }
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers"))
  {
    +[CNUIColorRepository popoverBackgroundColor](CNUIColorRepository, "popoverBackgroundColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerController tableViewController](self, "tableViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v14);

    -[UITableViewController tableView](self->_tableViewController, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNGeminiPickerController tableViewController](self, "tableViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSectionIndexBackgroundColor:", v18);

  }
  -[CNGeminiPickerController tableViewController](self, "tableViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "reloadData");

}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewController, a3);
}

- (NSMutableArray)geminiChannels
{
  return self->_geminiChannels;
}

- (void)setGeminiChannels:(id)a3
{
  objc_storeStrong((id *)&self->_geminiChannels, a3);
}

- (CNGeminiChannel)preferredGeminiChannel
{
  return self->_preferredGeminiChannel;
}

- (void)setPreferredGeminiChannel:(id)a3
{
  objc_storeStrong((id *)&self->_preferredGeminiChannel, a3);
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
  objc_storeStrong((id *)&self->_preferredGeminiChannel, 0);
  objc_storeStrong((id *)&self->_geminiChannels, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
}

uint64_t __54__CNGeminiPickerController_indexPathForGeminiChannel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "channelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "preferredGeminiChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "channelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  return v6;
}

@end
