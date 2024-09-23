@implementation HKInfographicViewController

- (HKInfographicViewController)initWithItems:(id)a3
{
  return -[HKInfographicViewController initWithItems:tableViewStyle:](self, "initWithItems:tableViewStyle:", a3, 2);
}

- (HKInfographicViewController)initWithItems:(id)a3 tableViewStyle:(int64_t)a4
{
  id v6;
  HKInfographicViewController *v7;
  HKInfographicViewController *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKInfographicViewController;
  v7 = -[HKInfographicViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0, 0);
  v8 = v7;
  if (v7)
  {
    v7->_tableViewStyle = a4;
    -[HKInfographicViewController setItems:](v7, "setItems:", v6);
  }

  return v8;
}

- (void)viewDidLoad
{
  id v3;
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
  double v18;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  objc_super v50;

  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", self->_tableViewStyle, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKInfographicViewController setTableView:](self, "setTableView:", v4);

  HKUIJoinStringsForAutomationIdentifier(&unk_1E9CE9EF0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v5);

  -[HKInfographicViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  if (self->_tableViewStyle)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInfographicViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  -[HKInfographicViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDataSource:", self);

  -[HKInfographicViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAllowsSelection:", 0);

  -[HKInfographicViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSeparatorStyle:", 0);

  -[HKInfographicViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEstimatedRowHeight:", 50.0);

  -[HKInfographicViewController _updateTableViewTopPadding](self, "_updateTableViewTopPadding");
  v18 = *MEMORY[0x1E0DC53D8];
  -[HKInfographicViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setRowHeight:", v18);

  -[HKInfographicViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HKInfographicViewControllerTextViewCell"));

  -[HKInfographicViewController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HKInfographicViewControllerLinkedTextViewCell"));

  -[HKInfographicViewController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HKInfographicButtonCell"));

  -[HKInfographicViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HKInfographicViewControllerContentViewCell"));

  -[HKInfographicViewController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HKInfographicViewControllerTableViewCell"));

  -[HKInfographicViewController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("HKInfographicTitleDetailOptionalButtonCell"));

  -[HKInfographicViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController tableView](self, "tableView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  -[HKInfographicViewController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setActive:", 1);

  -[HKInfographicViewController tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController view](self, "view");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setActive:", 1);

  -[HKInfographicViewController tableView](self, "tableView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "safeAreaLayoutGuide");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setActive:", 1);

  -[HKInfographicViewController tableView](self, "tableView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController view](self, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bottomAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setActive:", 1);

  -[HKInfographicViewController tableView](self, "tableView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "reloadData");

  v50.receiver = self;
  v50.super_class = (Class)HKInfographicViewController;
  -[HKInfographicViewController viewDidLoad](&v50, sel_viewDidLoad);
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKInfographicViewController;
  -[HKInfographicViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[HKInfographicViewController _updateTableViewTopPadding](self, "_updateTableViewTopPadding");
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v6 = a3;
  v7 = a4;
  -[HKInfographicViewController items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HKInfographicViewControllerLinkedTextViewCell"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v18);

      objc_msgSend(v10, "descriptionString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInfographicViewController traitCollection](self, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInfographicViewController _updateAttributedString:withTraitCollection:](self, "_updateAttributedString:withTraitCollection:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "descriptionLabel");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAttributedText:", v21);

      objc_msgSend(v10, "didTapLinkedText");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDidTapLinkedText:", v23);

      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = v9;
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HKInfographicButtonCell"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setBackgroundColor:", v27);

      objc_msgSend(v26, "configuration");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "buttonTapHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setConfiguration:buttonTapHandler:", v28, v29);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HKInfographicViewControllerContentViewCell"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBackgroundColor:", v31);

        objc_msgSend(v10, "titleString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInfographicViewController traitCollection](self, "traitCollection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInfographicViewController _updateAttributedString:withTraitCollection:](self, "_updateAttributedString:withTraitCollection:", v12, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "titleLabel");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setAttributedText:", v33);

        goto LABEL_3;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HKInfographicViewControllerTableViewCell"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSeparatorHidden:", objc_msgSend(v10, "separatorHidden"));
        objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBackgroundColor:", v35);

        objc_msgSend(v10, "titleString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInfographicViewController traitCollection](self, "traitCollection");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInfographicViewController _updateAttributedString:withTraitCollection:](self, "_updateAttributedString:withTraitCollection:", v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "titleLabel");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setAttributedText:", v38);

        objc_msgSend(v10, "valueString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInfographicViewController traitCollection](self, "traitCollection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInfographicViewController _updateAttributedString:withTraitCollection:](self, "_updateAttributedString:withTraitCollection:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valueLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v42 = objc_alloc(MEMORY[0x1E0DC3D50]);
        v11 = (void *)objc_msgSend(v42, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
        goto LABEL_8;
      }
      v26 = v9;
      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HKInfographicTitleDetailOptionalButtonCell"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "titleString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "detailString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "buttonTextString");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "buttonAction");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "populateWithTitle:detail:buttonText:buttonAction:", v28, v29, v40, v41);

    }
    objc_msgSend(v26, "baseIdentifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "updateAutomationIdentifiersWith:", v30);
    goto LABEL_8;
  }
  v10 = v9;
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("HKInfographicViewControllerTextViewCell"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v12);
LABEL_3:

  objc_msgSend(v10, "descriptionString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInfographicViewController _updateAttributedString:withTraitCollection:](self, "_updateAttributedString:withTraitCollection:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "descriptionLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  v17 = v16;
  objc_msgSend(v16, "setAttributedText:", v15);

LABEL_7:
  objc_msgSend(v10, "baseIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updateAutomationIdentifiersWith:", v24);
LABEL_8:

  return v11;
}

- (id)_updateAttributedString:(id)a3 withTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t, uint64_t);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    v8 = objc_msgSend(v7, "length");
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __75__HKInfographicViewController__updateAttributedString_withTraitCollection___block_invoke;
    v15 = &unk_1E9C41EF8;
    v16 = v6;
    v17 = v7;
    v9 = v7;
    objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, &v12);
    v10 = (id)objc_msgSend(v9, "copy", v12, v13, v14, v15);

  }
  else
  {
    v10 = v5;
  }

  return v10;
}

void __75__HKInfographicViewController__updateAttributedString_withTraitCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = *MEMORY[0x1E0DC1138];
  v8 = a2;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0DC10F8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "_fontAdjustedForContentSizeCategoryCompatibleWithTraitCollection:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v7, a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v7, v11, a3, a4);

  }
  if (v10)
  {
    objc_msgSend(v10, "image");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "configurationWithTraitCollection:", *(_QWORD *)(a1 + 32));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v9, a3, a4);
        objc_msgSend(v13, "imageWithConfiguration:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setImage:", v17);
        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v9, v10, a3, a4);

      }
    }

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[HKInfographicViewController items](self, "items", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (void)_updateTableViewTopPadding
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[HKInfographicViewController tableView](self, "tableView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sectionContentInset");
  v4 = v3;
  -[HKInfographicViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTopPadding:", v4);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
