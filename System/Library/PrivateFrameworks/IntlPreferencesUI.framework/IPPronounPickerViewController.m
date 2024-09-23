@implementation IPPronounPickerViewController

+ (id)pronounPickerViewControllerWithDelegate:(id)a3
{
  id v3;
  IPPronounPickerViewController *v4;
  void *v5;

  v3 = a3;
  v4 = -[IPPronounPickerViewController initWithDelegate:]([IPPronounPickerViewController alloc], "initWithDelegate:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v4);
  return v5;
}

+ (BOOL)canDisplayPronounPicker
{
  return +[IPPronounValidator canDisplayPronounPicker](IPPronounValidator, "canDisplayPronounPicker");
}

+ (BOOL)shouldDisplayPronounPickerByDefault
{
  return +[IPPronounValidator shouldDisplayPronounPickerByDefault](IPPronounValidator, "shouldDisplayPronounPickerByDefault");
}

- (IPPronounPickerViewController)initWithDelegate:(id)a3
{
  id v4;
  IPPronounPickerViewController *v5;
  IPPronounPickerViewController *v6;
  void *v7;
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
  IPPronounValidator *v18;
  void *v19;
  void *v20;
  void *v21;
  IPPronounValidator *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IPPronounPickerViewController;
  v5 = -[IPPronounPickerViewController initWithStyle:](&v24, sel_initWithStyle_, 1);
  v6 = v5;
  if (v5)
  {
    -[IPPronounPickerViewController navigationItem](v5, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Pronouns"), &stru_24F9E0D40, CFSTR("PronounPicker"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel_handleCancel);
    objc_msgSend(v7, "setLeftBarButtonItem:", v10);

    v11 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Add"), &stru_24F9E0D40, CFSTR("PronounPicker"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 2, v6, sel_handleDone);
    objc_msgSend(v7, "setRightBarButtonItem:", v14);

    objc_msgSend(v7, "rightBarButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setEnabled:", 0);

    -[IPPronounPickerViewController setDelegate:](v6, "setDelegate:", v4);
    v16 = (void *)0x24F9E0000;
    +[IPPronounValidator initialPronounPickerLanguage](IPPronounValidator, "initialPronounPickerLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerViewController setCurrentLanguage:](v6, "setCurrentLanguage:", v17);

    v18 = [IPPronounValidator alloc];
    -[IPPronounPickerViewController currentLanguage](v6, "currentLanguage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = (void *)MEMORY[0x24BDBCEA0];
      -[IPPronounPickerViewController currentLanguage](v6, "currentLanguage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localeWithLocaleIdentifier:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    v22 = -[IPPronounValidator initWithLocale:](v18, "initWithLocale:", v21);
    -[IPPronounPickerViewController setPronounValidator:](v6, "setPronounValidator:", v22);

    if (v19)
    {

    }
    -[IPPronounPickerViewController setViewHasChangedSize:](v6, "setViewHasChangedSize:", 0);
    -[IPPronounPickerViewController initializePronounInfos](v6, "initializePronounInfos");

  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IPPronounPickerViewController;
  -[IPPronounPickerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[IPPronounPickerViewController setViewHasChangedSize:](self, "setViewHasChangedSize:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChange_, *MEMORY[0x24BDF7670], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IPPronounPickerViewController;
  -[IPPronounPickerViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "becomeFirstResponder");

  }
}

- (void)viewDidLayoutSubviews
{
  if (-[IPPronounPickerViewController viewHasChangedSize](self, "viewHasChangedSize"))
  {
    -[IPPronounPickerViewController setViewHasChangedSize:](self, "setViewHasChangedSize:", 0);
    -[IPPronounPickerViewController setUpTableHeaderAndFooter](self, "setUpTableHeaderAndFooter");
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;

  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5 + -[IPPronounPickerViewController shouldShowLanguagePopup](self, "shouldShowLanguagePopup");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  int64_t v5;
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
  uint64_t v22;
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
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  IPPronounPickerViewController *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  int64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _QWORD v93[7];
  _QWORD v94[6];
  _QWORD v95[6];

  v95[4] = *MEMORY[0x24BDAC8D0];
  v5 = -[IPPronounPickerViewController pronounInfoIndexFromSectionIndex:](self, "pronounInfoIndexFromSectionIndex:", objc_msgSend(a4, "section", a3));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, 0);
  v7 = v6;
  if (v5 < 0)
  {
    objc_msgSend(v6, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Language"), &stru_24F9E0D40, CFSTR("PronounPicker"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v30);

    v26 = v27;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFont:", v31);

    objc_msgSend(v28, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v27, "addSubview:", v28);
    -[IPPronounPickerViewController createLanguageMenuButton](self, "createLanguageMenuButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v32);
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v28, "intrinsicContentSize");
    v34 = v33;
    objc_msgSend(v32, "intrinsicContentSize");
    v36 = v34 + v35 + 50.0;
    -[IPPronounPickerViewController tableView](self, "tableView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "frame");
    v39 = v38;

    if (v36 <= v39)
    {
      v92 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v32, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trailingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:constant:", -20.0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v87;
      objc_msgSend(v32, "topAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v59;
      objc_msgSend(v59, "constraintEqualToAnchor:constant:", 12.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v81;
      objc_msgSend(v32, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bottomAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v60;
      objc_msgSend(v60, "constraintEqualToAnchor:constant:", -12.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v94[2] = v75;
      objc_msgSend(v28, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leadingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v61;
      objc_msgSend(v61, "constraintEqualToAnchor:constant:", 20.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v94[3] = v69;
      objc_msgSend(v28, "trailingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "leadingAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v62;
      objc_msgSend(v62, "constraintEqualToAnchor:constant:", -10.0);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v94[4] = v50;
      objc_msgSend(v28, "firstBaselineAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstBaselineAnchor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "constraintEqualToAnchor:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v94[5] = v53;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 6);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "activateConstraints:", v54);
    }
    else
    {
      v91 = v7;
      objc_msgSend(v32, "intrinsicContentSize");
      v41 = v40;
      -[IPPronounPickerViewController tableView](self, "tableView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "frame");
      v44 = v43 + -50.0;

      if (v41 > v44)
      {
        -[IPPronounPickerViewController tableView](self, "tableView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "frame");
        v41 = v46 + -50.0;

      }
      v65 = (void *)MEMORY[0x24BDD1628];
      objc_msgSend(v28, "leadingAnchor");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "leadingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "constraintEqualToAnchor:constant:", 20.0);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = v87;
      objc_msgSend(v28, "trailingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trailingAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v47;
      objc_msgSend(v47, "constraintEqualToAnchor:constant:", -20.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v93[1] = v81;
      objc_msgSend(v28, "topAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "topAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = v48;
      objc_msgSend(v48, "constraintEqualToAnchor:constant:", 12.0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v93[2] = v75;
      objc_msgSend(v32, "trailingAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "trailingAnchor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v49;
      objc_msgSend(v49, "constraintEqualToAnchor:constant:", -20.0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v93[3] = v69;
      objc_msgSend(v32, "widthAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToConstant:", v41);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v93[4] = v66;
      objc_msgSend(v32, "topAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "bottomAnchor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, 10.0);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v93[5] = v52;
      objc_msgSend(v32, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bottomAnchor");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -12.0);
      v55 = v26;
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v93[6] = v56;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 7);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "activateConstraints:", v57);

      v26 = v55;
      v58 = v64;
      v7 = v91;
    }

    objc_msgSend(v7, "setSelectionStyle:", 0);
  }
  else
  {
    -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v5);
    v88 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryField");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "setDelegate:", self);
    v70 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v10, "leadingAnchor");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "constraintEqualToAnchor:constant:", v82, 20.0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v80;
    objc_msgSend(v10, "trailingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "trailingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:constant:", v72, -20.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v68;
    objc_msgSend(v10, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v78 = self;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14, 11.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v95[2] = v15;
    objc_msgSend(v10, "bottomAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v90 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18, -11.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v95[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "activateConstraints:", v20);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *MEMORY[0x24BDF7F58];
    -[IPPronounPickerViewController pronounInfos](v78, "pronounInfos");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", v88);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "entryField");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    objc_msgSend(v21, "addObserver:selector:name:object:", v78, sel_pronounFieldContentDidChange_, v22, v25);

    v7 = v90;
    objc_msgSend(v90, "setSelectionStyle:", 0);
  }

  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v5 = -[IPPronounPickerViewController pronounInfoIndexFromSectionIndex:](self, "pronounInfoIndexFromSectionIndex:", a4);
  if (v5 < 0)
    return 0;
  v6 = v5;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "exampleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "generateExampleLabelText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAttributedText:", v12);

  v13 = objc_alloc(MEMORY[0x24BDF6F90]);
  v14 = (void *)objc_msgSend(v13, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v14, "addSubview:", v9);
  v26 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v9, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:constant:", v31, 20.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v30;
  objc_msgSend(v9, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, -20.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v25;
  objc_msgSend(v9, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "topAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:constant:", v16, 7.33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[2] = v17;
  objc_msgSend(v9, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaLayoutGuide");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = v21;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "activateConstraints:", v22);

  return v14;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  -[IPPronounPickerViewController setViewHasChangedSize:](self, "setViewHasChangedSize:", 1, a3.width, a3.height);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[IPPronounPickerViewController pronounInfoForEntryField:](self, "pronounInfoForEntryField:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "indexOfObject:", v7);

    -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", (v9 + 1) % (unint64_t)objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entryField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "becomeFirstResponder");

  }
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;

  -[IPPronounPickerViewController pronounInfoForEntryField:](self, "pronounInfoForEntryField:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_handlePronounFieldContentDidChange_, v4);
    -[IPPronounPickerViewController handlePronounFieldContentDidChange:](self, "handlePronounFieldContentDidChange:", v5);
    v4 = v5;
  }

}

- (void)handleDone
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
      objc_msgSend(v8, "entryField");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isFirstResponder");

      if ((v10 & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_handlePronounFieldContentDidChange_, v8);
    -[IPPronounPickerViewController handlePronounFieldContentDidChange:](self, "handlePronounFieldContentDidChange:", v8);
    -[IPPronounPickerViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightBarButtonItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEnabled");

    if (!v13)
      return;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v29 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        v21 = objc_alloc(MEMORY[0x24BDD1680]);
        objc_msgSend(v20, "value");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "morphology");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v21, "initWithPronoun:morphology:dependentMorphology:", v22, v23, 0);
        objc_msgSend(v14, "addObject:", v24);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v17);
  }

  v25 = (void *)MEMORY[0x24BDD17E0];
  -[IPPronounPickerViewController currentLanguage](self, "currentLanguage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedForLanguageIdentifier:withPronouns:", v26, v14);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPPronounPickerViewController sendResultToDelegate:](self, "sendResultToDelegate:", v27);
}

- (void)handleCancel
{
  -[IPPronounPickerViewController sendResultToDelegate:](self, "sendResultToDelegate:", 0);
}

- (void)pronounFieldContentDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPronounPickerViewController pronounInfoForEntryField:](self, "pronounInfoForEntryField:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_handlePronounFieldContentDidChange_, v5);
  -[IPPronounPickerViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_handlePronounFieldContentDidChange_, v5, 0.5);

}

- (BOOL)shouldShowLanguagePopup
{
  return 1;
}

- (int64_t)pronounInfoIndexFromSectionIndex:(int64_t)a3
{
  return a3 - -[IPPronounPickerViewController shouldShowLanguagePopup](self, "shouldShowLanguagePopup");
}

- (void)sendResultToDelegate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rememberUserEntry:", v6);

    -[IPPronounPickerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pronounPickerViewController:didFinishWithTermOfAddress:", self, v6);
  }
  else
  {
    -[IPPronounPickerViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pronounPickerViewControllerDidCancel:", self);
  }

}

- (void)handlePronounFieldContentDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "entryField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "markedTextRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || objc_msgSend(v5, "isEmpty"))
  {
    objc_msgSend(v14, "entryField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entryFieldContentDidChange:validator:userEntered:", v7, v8, 1);

    -[IPPronounPickerViewController autofillEmptyFields](self, "autofillEmptyFields");
    -[IPPronounPickerViewController updateDoneButton](self, "updateDoneButton");
    -[IPPronounPickerViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD15E0];
    v11 = -[IPPronounPickerViewController shouldShowLanguagePopup](self, "shouldShowLanguagePopup");
    -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexSetWithIndexesInRange:", v11, objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_reloadSectionHeaderFooters:withRowAnimation:", v13, 5);

  }
}

- (void)autofillEmptyFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v37;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v8);
      if (!objc_msgSend(v9, "textWasEnteredByUser"))
        break;
      if ((objc_msgSend(v9, "hasValue") & 1) == 0)
      {
        if (!objc_msgSend(v9, "hasErrorMessage"))
        {

          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          -[IPPronounPickerViewController pronounInfos](self, "pronounInfos", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v33 != v29)
                  objc_enumerationMutation(v14);
                v31 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                if ((objc_msgSend(v31, "hasValue") & 1) != 0
                  || (objc_msgSend(v31, "hasErrorMessage") & 1) != 0
                  || !objc_msgSend(v31, "textWasEnteredByUser"))
                {
                  if ((objc_msgSend(v31, "textWasEnteredByUser") & 1) == 0)
                    objc_msgSend(v31, "autofillValue:", &stru_24F9E0D40);
                }
                else
                {
                  objc_msgSend(v31, "setTextWasEnteredByUser:", 0);
                }
              }
              v28 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v28);
          }
          goto LABEL_37;
        }
        v11 = v3;
        v12 = CFSTR("???");
        goto LABEL_12;
      }
      objc_msgSend(v9, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

LABEL_13:
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_15;
      }
    }
    v11 = v3;
    v12 = &stru_24F9E0D40;
LABEL_12:
    objc_msgSend(v11, "addObject:", v12);
    goto LABEL_13;
  }
LABEL_15:

  -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "autofillPronouns:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    v17 = 0;
    do
    {
      -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndexedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "textWasEnteredByUser");

      if ((v20 & 1) == 0)
      {
        -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v14)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "autofillValue:", v24);

        }
        else
        {
          objc_msgSend(v22, "autofillValue:", &stru_24F9E0D40);
        }

      }
      ++v17;
      -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

    }
    while (v17 < v26);
  }
LABEL_37:

}

- (void)updateDoneButton
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "hasValidValue"))
        {
          v8 = 0;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  -[IPPronounPickerViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v8);

}

- (id)pronounInfoForEntryField:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "entryField");
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          v12 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v13 = v12;

  return v13;
}

- (id)createLanguageMenuButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  IPPronounPickerViewController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
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
  void *v51;
  void *v52;
  id v53;
  id v54;
  IPPronounPickerViewController *obj;
  id obja;
  void *v57;
  void *v58;
  _QWORD v59[4];
  IPPronounPickerViewController *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[4];
  IPPronounPickerViewController *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6888], "plainButtonConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBaseForegroundColor:", v4);

  objc_msgSend(v3, "setContentInsets:", *MEMORY[0x24BDF65E8], *(double *)(MEMORY[0x24BDF65E8] + 8), *(double *)(MEMORY[0x24BDF65E8] + 16), *(double *)(MEMORY[0x24BDF65E8] + 24));
  v52 = v3;
  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithConfiguration:primaryAction:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setChangesSelectionAsPrimaryAction:", 1);
  v51 = v5;
  objc_msgSend(v5, "setShowsMenuAsPrimaryAction:", 1);
  obj = self;
  -[IPPronounPickerViewController currentLanguage](self, "currentLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPPronounValidator preferredPronounLocalizationForLanguage:](IPPronounValidator, "preferredPronounLocalizationForLanguage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v76 != v12)
          objc_enumerationMutation(v9);
        +[IPPronounValidator preferredPronounLocalizationForLanguage:](IPPronounValidator, "preferredPronounLocalizationForLanguage:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 && (objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v75, v82, 16);
    }
    while (v11);
  }

  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  +[IPPronounValidator supportedPronounLocalizations](IPPronounValidator, "supportedPronounLocalizations");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v72 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
        +[IPPronounValidator preferredPronounLocalizationForLanguage:](IPPronounValidator, "preferredPronounLocalizationForLanguage:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21
          && (objc_msgSend(v8, "containsObject:", v20) & 1) == 0
          && (objc_msgSend(v53, "containsObject:", v20) & 1) == 0)
        {
          objc_msgSend(v53, "addObject:", v21);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v17);
  }

  objc_msgSend(v53, "sortUsingComparator:", &__block_literal_global);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = obj;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obja = v8;
  v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v68;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v68 != v25)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * k);
        v28 = (void *)MEMORY[0x24BDF67B8];
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForLocaleIdentifier:", v27);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = MEMORY[0x24BDAC760];
        v65[1] = 3221225472;
        v65[2] = __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_2;
        v65[3] = &unk_24F9E0BA0;
        v66 = v22;
        objc_msgSend(v28, "actionWithTitle:image:identifier:handler:", v30, 0, v27, v65);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 && objc_msgSend(v27, "isEqualToString:", v7))
          objc_msgSend(v31, "setState:", 1);
        objc_msgSend(v58, "addObject:", v31);

      }
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v67, v80, 16);
    }
    while (v24);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v54 = v53;
  v32 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v62;
    do
    {
      for (m = 0; m != v33; ++m)
      {
        if (*(_QWORD *)v62 != v34)
          objc_enumerationMutation(v54);
        v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * m);
        v37 = (void *)MEMORY[0x24BDF67B8];
        objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "localizedStringForLocaleIdentifier:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_3;
        v59[3] = &unk_24F9E0BA0;
        v60 = v22;
        objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v39, 0, v36, v59);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 && objc_msgSend(v36, "isEqualToString:", v7))
          objc_msgSend(v40, "setState:", 1);
        objc_msgSend(v57, "addObject:", v40);

      }
      v33 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v61, v79, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPronounPickerViewController currentLanguage](v22, "currentLanguage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    v43 = (void *)MEMORY[0x24BDF67B8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Select"), &stru_24F9E0D40, CFSTR("PronounPicker"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "actionWithTitle:image:identifier:handler:", v45, 0, 0, &__block_literal_global_50);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "setAttributes:", 1);
    objc_msgSend(v46, "setState:", 1);
    objc_msgSend(v41, "addObject:", v46);

  }
  if (objc_msgSend(v58, "count"))
  {
    objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:image:identifier:options:children:", &stru_24F9E0D40, 0, 0, 1, v58);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v47);

  }
  if (objc_msgSend(v57, "count"))
  {
    objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithTitle:image:identifier:options:children:", &stru_24F9E0D40, 0, 0, 1, v57);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v48);

  }
  objc_msgSend(MEMORY[0x24BDF6BA8], "menuWithChildren:", v41);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setMenu:", v49);

  return v51;
}

uint64_t __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForLocaleIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForLocaleIdentifier:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "localizedCaseInsensitiveCompare:", v10);
  return v11;
}

void __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userChangedLanguage:", v3);

}

void __57__IPPronounPickerViewController_createLanguageMenuButton__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userChangedLanguage:", v3);

}

- (void)userChangedLanguage:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  IPPronounValidator *v14;
  void *v15;
  IPPronounValidator *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "entryField");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isFirstResponder");

        if (v12)
        {
          objc_msgSend(v10, "entryField");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "resignFirstResponder");

          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  -[IPPronounPickerViewController setCurrentLanguage:](self, "setCurrentLanguage:", v4);
  v14 = [IPPronounValidator alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[IPPronounValidator initWithLocale:](v14, "initWithLocale:", v15);
  -[IPPronounPickerViewController setPronounValidator:](self, "setPronounValidator:", v16);

  -[IPPronounPickerViewController initializePronounInfos](self, "initializePronounInfos");
  -[IPPronounPickerViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTableFooterView:", 0);

  -[IPPronounPickerViewController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "reloadData");

  -[IPPronounPickerViewController updateDoneButton](self, "updateDoneButton");
  -[IPPronounPickerViewController pronounInfos](self, "pronounInfos");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entryField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "becomeFirstResponder");

}

- (void)initializePronounInfos
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  IPPronounPickerPronounInfo *v12;
  void *v13;
  void *v14;
  void *v15;
  IPPronounPickerPronounInfo *v16;
  id v17;

  -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exampleStrings");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "examplePlaceholders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayedMorphologies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPPronounPickerViewController pronounValidator](self, "pronounValidator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    do
    {
      v12 = [IPPronounPickerPronounInfo alloc];
      objc_msgSend(v17, "objectAtIndexedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[IPPronounPickerPronounInfo initWithExampleText:examplePlaceholder:morphology:language:](v12, "initWithExampleText:examplePlaceholder:morphology:language:", v13, v14, v15, v9);
      objc_msgSend(v10, "addObject:", v16);

      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }
  -[IPPronounPickerViewController setPronounInfos:](self, "setPronounInfos:", v10);

}

- (void)setUpTableHeaderAndFooter
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[IPPronounPickerViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;

  +[IPPronounPickerViewController pronounPickerHeaderText](IPPronounPickerViewController, "pronounPickerHeaderText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[IPPronounPickerViewController viewForExplanatoryText:width:](IPPronounPickerViewController, "viewForExplanatoryText:width:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPPronounPickerViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTableHeaderView:", v8);

  -[IPPronounPickerViewController currentLanguage](self, "currentLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[IPPronounPickerViewController unsupportedLanguageFooterText](IPPronounPickerViewController, "unsupportedLanguageFooterText");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    +[IPPronounPickerViewController viewForExplanatoryText:width:](IPPronounPickerViewController, "viewForExplanatoryText:width:", v13, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPPronounPickerViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTableFooterView:", v11);

  }
}

+ (id)viewForExplanatoryText:(id)a3 width:(double)a4
{
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
  double v16;
  double v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setAttributedText:", v25);
  objc_msgSend(v5, "setNumberOfLines:", 0);
  objc_msgSend(v5, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextColor:", v6);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "addSubview:", v5);
  v20 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v5, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v22, 20.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  objc_msgSend(v5, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:constant:", v9, -20.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(v5, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13, 20.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "activateConstraints:", v15);

  objc_msgSend(a1, "heightForExplanatoryText:width:", v25, a4);
  v17 = v16;

  objc_msgSend(v7, "setFrame:", 0.0, 0.0, a4, v17);
  return v7;
}

+ (double)heightForExplanatoryText:(id)a3 width:(double)a4
{
  double v4;

  objc_msgSend(a3, "boundingRectWithSize:options:context:", 3, 0, a4 + -40.0, 1.79769313e308);
  return v4 + 20.0 + 20.0;
}

+ (id)pronounPickerHeaderText
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PRONOUN PICKER HEADER"), &stru_24F9E0D40, CFSTR("PronounPicker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithString:attributes:", v4, v6);

  return v7;
}

+ (id)unsupportedLanguageFooterText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEBB498], "defaultParagraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "setAlignment:", 1);
  v4 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNSUPPORTED LANGUAGE FOOTER"), &stru_24F9E0D40, CFSTR("PronounPicker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = *MEMORY[0x24BEBB360];
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = *MEMORY[0x24BEBB3A8];
  v12[0] = v7;
  v12[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "initWithString:attributes:", v6, v8);

  return v9;
}

- (IPPronounPickerViewControllerDelegate)delegate
{
  return (IPPronounPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IPPronounValidator)pronounValidator
{
  return self->_pronounValidator;
}

- (void)setPronounValidator:(id)a3
{
  objc_storeStrong((id *)&self->_pronounValidator, a3);
}

- (NSArray)pronounInfos
{
  return self->_pronounInfos;
}

- (void)setPronounInfos:(id)a3
{
  objc_storeStrong((id *)&self->_pronounInfos, a3);
}

- (NSString)currentLanguage
{
  return self->_currentLanguage;
}

- (void)setCurrentLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_currentLanguage, a3);
}

- (BOOL)viewHasChangedSize
{
  return self->_viewHasChangedSize;
}

- (void)setViewHasChangedSize:(BOOL)a3
{
  self->_viewHasChangedSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  objc_storeStrong((id *)&self->_pronounInfos, 0);
  objc_storeStrong((id *)&self->_pronounValidator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
