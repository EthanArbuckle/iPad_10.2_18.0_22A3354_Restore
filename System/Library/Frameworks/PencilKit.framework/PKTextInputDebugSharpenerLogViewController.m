@implementation PKTextInputDebugSharpenerLogViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)canLoadFromFileAtURL:(id)a3
{
  return +[PKTextInputDebugSharpenerLog canLoadFromFileAtURL:](PKTextInputDebugSharpenerLog, "canLoadFromFileAtURL:", a3);
}

- (PKTextInputDebugSharpenerLogViewController)initWithSharpenerLogURL:(id)a3 error:(id *)a4
{
  id v6;
  PKTextInputDebugSharpenerLog *v7;
  PKTextInputDebugSharpenerLogViewController *v8;
  NSURL *v9;

  v6 = a3;
  v7 = -[PKTextInputDebugSharpenerLog initWithContentsOfURL:error:]([PKTextInputDebugSharpenerLog alloc], "initWithContentsOfURL:error:", v6, a4);
  if (v7)
  {
    v8 = -[PKTextInputDebugSharpenerLogViewController initWithSharpenerLog:](self, "initWithSharpenerLog:", v7);
    v9 = (NSURL *)v6;
    self = (PKTextInputDebugSharpenerLogViewController *)v8->_sharpenerLogURL;
    v8->_sharpenerLogURL = v9;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKTextInputDebugSharpenerLogViewController)initWithSharpenerLog:(id)a3
{
  id v5;
  PKTextInputDebugSharpenerLogViewController *v6;
  PKTextInputDebugSharpenerLogViewController *v7;
  uint64_t v8;
  NSMutableDictionary *rerunResultsBySection;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKTextInputDebugSharpenerLogViewController;
  v6 = -[PKTextInputDebugSharpenerLogViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sharpenerLog, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    rerunResultsBySection = v7->__rerunResultsBySection;
    v7->__rerunResultsBySection = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
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
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[4];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)PKTextInputDebugSharpenerLogViewController;
  -[PKTextInputDebugSharpenerLogViewController viewDidLoad](&v34, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_storeStrong((id *)&self->__mainTableView, v4);
  objc_msgSend(v4, "setDataSource:", self);
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "setAllowsSelection:", 0);
  -[PKTextInputDebugSharpenerLogViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v4);

  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("EntryCellText"));
  objc_msgSend(v4, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("EntryCellDrawing"));
  v6 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PKTextInputDebugSharpenerLogViewController set_tableHeaderLabel:](self, "set_tableHeaderLabel:", v6);
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFont:", v7);

  objc_msgSend(v6, "setNumberOfLines:", 0);
  objc_msgSend(v6, "setLineBreakMode:", 0);
  -[PKTextInputDebugSharpenerLogViewController _tableHeaderText](self, "_tableHeaderText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v9);

  v33 = v6;
  objc_msgSend(v4, "setTableHeaderView:", v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDoneButton_);
  v36[0] = v10;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__handleActionButton_);
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputDebugSharpenerLogViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItems:", v12);

  -[PKTextInputDebugSharpenerLogViewController sharpenerLogURL](self, "sharpenerLogURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[PKTextInputDebugSharpenerLogViewController sharpenerLogURL](self, "sharpenerLogURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputDebugSharpenerLogViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v16);

  }
  else
  {
    -[PKTextInputDebugSharpenerLogViewController navigationItem](self, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", CFSTR("Pencil Sharpener Log"));
  }

  -[PKTextInputDebugSharpenerLogViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v30;
  objc_msgSend(v4, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v20;
  objc_msgSend(v4, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v23;
  objc_msgSend(v4, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v27);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKTextInputDebugSharpenerLogViewController;
  -[PKTextInputDebugSharpenerLogViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[PKTextInputDebugSharpenerLogViewController _tableHeaderLabel](self, "_tableHeaderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;

  -[PKTextInputDebugSharpenerLogViewController _tableHeaderLabel](self, "_tableHeaderLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;

  -[PKTextInputDebugSharpenerLogViewController _tableHeaderLabel](self, "_tableHeaderLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sizeThatFits:", v11, v13);
  v16 = v15;

  -[PKTextInputDebugSharpenerLogViewController _tableHeaderLabel](self, "_tableHeaderLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v5, v7, v11, v16);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[PKTextInputDebugSharpenerLogViewController _rerunResultsBySection](self, "_rerunResultsBySection", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 3;
  else
    return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  v7 = a3;
  -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEntries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "row"))
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("EntryCellText"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[PKTextInputDebugSharpenerLogViewController _rerunResultsBySection](self, "_rerunResultsBySection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "row") == 1 && v14)
    {
      -[PKTextInputDebugSharpenerLogViewController _configureCell:withTitle:details:](self, "_configureCell:withTitle:details:", v11, CFSTR("Rerun Result"), v14);
    }
    else
    {
      objc_msgSend(v10, "mediumDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugSharpenerLogViewController _configureCell:withTitle:details:](self, "_configureCell:withTitle:details:", v11, 0, v19);

    }
  }
  else
  {
    objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("EntryCellDrawing"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3518];
    v17 = (void *)MEMORY[0x1E0DC3870];
    v11 = v15;
    objc_msgSend(v17, "systemImageNamed:", CFSTR("arrow.clockwise.circle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "systemButtonWithImage:target:action:", v18, self, sel__handleRerunButton_);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setTag:", objc_msgSend(v6, "section"));
    objc_msgSend(v11, "setAccessoryView:", v14);
    -[PKTextInputDebugSharpenerLogViewController _configureCell:asDrawingDisplayForEntry:](self, "_configureCell:asDrawingDisplayForEntry:", v11, v10);

  }
  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entry %ld"), a4);
}

- (void)_configureCell:(id)a3 withTitle:(id)a4 details:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = (void *)MEMORY[0x1E0DC1350];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "boldSystemFontOfSize:", 12.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v9);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 10.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v14);

  objc_msgSend(v10, "detailTextLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNumberOfLines:", 0);

  objc_msgSend(v10, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLineBreakMode:", 0);

  objc_msgSend(v10, "detailTextLabel");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setText:", v8);
}

- (void)_configureCell:(id)a3 asDrawingDisplayForEntry:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a4, "inputDrawing");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDrawing:", v6);

}

- (id)_tableHeaderText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadataDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if ((unint64_t)objc_msgSend(v5, "length") >= 5)
  {
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{\n"), &stru_1E777DEE8, 0, 0, 2);
    objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n}"), &stru_1E777DEE8, 0, objc_msgSend(v5, "length") - 2, 2);
  }
  objc_msgSend(v5, "insertString:atIndex:", CFSTR("\n"), 0);
  return v5;
}

- (void)_handleActionButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  PKTextInputDebugSharpenerLogViewController *v28;
  id v29;
  id v30;
  _QWORD v31[10];
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEntries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v7, "writeLogToTemporaryDirectoryWithContentLevel:excludeEntyIndexes:error:", 2, 0, &v30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v30;

    if (v8)
    {
      v10 = objc_alloc(MEMORY[0x1E0CEA2D8]);
      v32[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithActivityItems:applicationActivities:", v11, 0);

      v13 = *MEMORY[0x1E0CEB208];
      v31[0] = *MEMORY[0x1E0CEB1F0];
      v31[1] = v13;
      v14 = *MEMORY[0x1E0CEB1B8];
      v31[2] = *MEMORY[0x1E0CEB218];
      v31[3] = v14;
      v15 = *MEMORY[0x1E0CEB1A8];
      v31[4] = *MEMORY[0x1E0CEB228];
      v31[5] = v15;
      v16 = *MEMORY[0x1E0CEB210];
      v31[6] = *MEMORY[0x1E0CEB1F8];
      v31[7] = v16;
      v17 = *MEMORY[0x1E0CEB1E8];
      v31[8] = *MEMORY[0x1E0CEB200];
      v31[9] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 10);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setExcludedActivityTypes:", v18);

      objc_msgSend(v12, "setModalPresentationStyle:", 7);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "popoverPresentationController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setBarButtonItem:", v4);

      }
      -[PKTextInputDebugSharpenerLogViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __66__PKTextInputDebugSharpenerLogViewController__handleActionButton___block_invoke;
      v26[3] = &unk_1E7777FF8;
      v27 = v9;
      v28 = self;
      v29 = v8;
      objc_msgSend(v12, "setCompletionWithItemsHandler:", v26);

    }
    else
    {
      v20 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(v9, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error Saving Log Data"), v21, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)MEMORY[0x1E0DC3448];
      _PencilKitBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 1, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v25);

      -[PKTextInputDebugSharpenerLogViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
    }

  }
}

void __66__PKTextInputDebugSharpenerLogViewController__handleActionButton___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error Sharing File"), v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3448];
    _PencilKitBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v12);

    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeItemAtURL:error:", *(_QWORD *)(a1 + 48), 0);

}

- (void)_handleDoneButton:(id)a3
{
  -[PKTextInputDebugSharpenerLogViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_handleRerunButton:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PKTextInputDebugSharpenerLogViewController _currentEntryRerun](self, "_currentEntryRerun");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[PKTextInputDebugSharpenerLogViewController _rerunRecognitionForEntryAtIndex:](self, "_rerunRecognitionForEntryAtIndex:", objc_msgSend(v5, "tag"));

}

- (void)_rerunRecognitionForEntryAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  PKTextInputDebugArchivedLogEntry *v11;
  id v12;
  PKTextInputDebugLogEntryRerun *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[6];
  id v22;

  if ((a3 & 0x8000000000000000) == 0)
  {
    -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 > a3)
    {
      -[PKTextInputDebugSharpenerLogViewController sharpenerLog](self, "sharpenerLog");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = 0;
        v11 = -[PKTextInputDebugArchivedLogEntry initWithRecordingLogEntry:error:]([PKTextInputDebugArchivedLogEntry alloc], "initWithRecordingLogEntry:error:", v10, &v22);
        v12 = v22;
        if (!v11)
          goto LABEL_10;
LABEL_8:
        v13 = -[PKTextInputDebugLogEntryRerun initWithLogEntry:]([PKTextInputDebugLogEntryRerun alloc], "initWithLogEntry:", v11);
        -[PKTextInputDebugSharpenerLogViewController set_currentEntryRerun:](self, "set_currentEntryRerun:", v13);

        -[PKTextInputDebugSharpenerLogViewController _currentEntryRerun](self, "_currentEntryRerun");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __79__PKTextInputDebugSharpenerLogViewController__rerunRecognitionForEntryAtIndex___block_invoke;
        v21[3] = &unk_1E7778070;
        v21[4] = self;
        v21[5] = a3;
        objc_msgSend(v14, "runWithCompletion:", v21);

LABEL_11:
        return;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;
        v12 = 0;
        if (v11)
          goto LABEL_8;
      }
      else
      {
        v12 = 0;
      }
LABEL_10:
      NSLog(CFSTR("Error loading entry data: %@"), v12);
      v15 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(v12, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error Loading Archived Entry Data"), v16, 1);
      v11 = (PKTextInputDebugArchivedLogEntry *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0DC3448];
      _PencilKitBundle();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKTextInputDebugArchivedLogEntry addAction:](v11, "addAction:", v20);

      -[PKTextInputDebugSharpenerLogViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
      goto LABEL_11;
    }
  }
}

void __79__PKTextInputDebugSharpenerLogViewController__rerunRecognitionForEntryAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[6];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          +[PKTextInputDebugLogEntry mediumDescriptionForResultQueryItem:](PKTextInputDebugLogEntry, "mediumDescriptionForResultQueryItem:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_rerunResultsBySection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

    objc_msgSend(*(id *)(a1 + 32), "_mainTableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "reloadData");

    v19 = dispatch_time(0, 50000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PKTextInputDebugSharpenerLogViewController__rerunRecognitionForEntryAtIndex___block_invoke_2;
    block[3] = &unk_1E7778048;
    v20 = *(_QWORD *)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v20;
    dispatch_after(v19, MEMORY[0x1E0C80D38], block);

  }
  else
  {
    NSLog(CFSTR("Error re-running recognition for entry: %@"), v6);
    v21 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v7, "localizedDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Error Re-Running Recognition"), v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (void *)MEMORY[0x1E0DC3448];
    _PencilKitBundle();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Done"), CFSTR("Done"), CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v26);

    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v8, 1, 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "set_currentEntryRerun:", 0);
}

void __79__PKTextInputDebugSharpenerLogViewController__rerunRecognitionForEntryAtIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_mainTableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 1, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cellForRowAtIndexPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.850980392, 0.949019608, 1.0, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__PKTextInputDebugSharpenerLogViewController__rerunRecognitionForEntryAtIndex___block_invoke_3;
  v8[3] = &unk_1E7778020;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "animateWithDuration:animations:", v8, 2.0);

}

void __79__PKTextInputDebugSharpenerLogViewController__rerunRecognitionForEntryAtIndex___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

}

- (NSURL)sharpenerLogURL
{
  return self->_sharpenerLogURL;
}

- (UITableView)_mainTableView
{
  return self->__mainTableView;
}

- (void)set_mainTableView:(id)a3
{
  objc_storeStrong((id *)&self->__mainTableView, a3);
}

- (UILabel)_tableHeaderLabel
{
  return self->__tableHeaderLabel;
}

- (void)set_tableHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->__tableHeaderLabel, a3);
}

- (PKTextInputDebugLogEntryRerun)_currentEntryRerun
{
  return self->__currentEntryRerun;
}

- (void)set_currentEntryRerun:(id)a3
{
  objc_storeStrong((id *)&self->__currentEntryRerun, a3);
}

- (NSMutableDictionary)_rerunResultsBySection
{
  return self->__rerunResultsBySection;
}

- (PKTextInputDebugSharpenerLog)sharpenerLog
{
  return self->_sharpenerLog;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharpenerLog, 0);
  objc_storeStrong((id *)&self->__rerunResultsBySection, 0);
  objc_storeStrong((id *)&self->__currentEntryRerun, 0);
  objc_storeStrong((id *)&self->__tableHeaderLabel, 0);
  objc_storeStrong((id *)&self->__mainTableView, 0);
  objc_storeStrong((id *)&self->_sharpenerLogURL, 0);
}

@end
