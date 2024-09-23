@implementation AKTextAttributesViewController

- (AKTextAttributesViewController)initWithController:(id)a3
{
  id v4;
  AKTextAttributesViewController *v5;
  AKTextAttributesViewController *v6;
  AKFontListController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKTextAttributesViewController;
  v5 = -[AKTextAttributesViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[AKTextAttributesViewController setController:](v5, "setController:", v4);
    v7 = -[AKFontListController initWithController:]([AKFontListController alloc], "initWithController:", v4);
    -[AKTextAttributesViewController setPresetFontController:](v6, "setPresetFontController:", v7);

    -[AKTextAttributesViewController _commonInit](v6, "_commonInit");
  }

  return v6;
}

- (void)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setPreferredContentSize:](self, "setPreferredContentSize:", 247.0, (double)(unint64_t)(44 * objc_msgSend(v4, "count") + 88));

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 12.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "familyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setCurrentFontFamilyName:](self, "setCurrentFontFamilyName:", v6);

  -[AKTextAttributesViewController setCurrentFontSize:](self, "setCurrentFontSize:", &unk_24F1CFED0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setCurrentFontColor:](self, "setCurrentFontColor:", v7);

  v8 = (void *)objc_opt_new();
  -[AKTextAttributesViewController setFontUIItemDelegate:](self, "setFontUIItemDelegate:", v8);

  -[AKTextAttributesViewController fontUIItemDelegate](self, "fontUIItemDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setParentController:", self);

  v10 = (void *)objc_opt_new();
  -[AKTextAttributesViewController setTextAttributesUIItemDelegate:](self, "setTextAttributesUIItemDelegate:", v10);

  -[AKTextAttributesViewController textAttributesUIItemDelegate](self, "textAttributesUIItemDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setParentController:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AKTextAttributesViewController;
  -[AKTextAttributesViewController viewDidLoad](&v19, sel_viewDidLoad);
  -[AKTextAttributesViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlwaysBounceVertical:", 0);

  -[AKTextAttributesViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRowHeight:", 44.0);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  -[AKTextAttributesViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD15D8];
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fonts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForRow:inSection:", objc_msgSend(v10, "count"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AKTextAttributesViewController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v7, v11);

  -[AKTextAttributesViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDD15D8];
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fonts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "indexPathForRow:inSection:", objc_msgSend(v16, "count") + 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AKTextAttributesViewController tableView:cellForRowAtIndexPath:](self, "tableView:cellForRowAtIndexPath:", v13, v17);

  -[AKTextAttributesViewController validateUserInterfaceItems](self, "validateUserInterfaceItems");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[AKTextAttributesViewController presetFontController](self, "presetFontController", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fonts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + 2;

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fonts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v8 == v11)
  {
    -[AKTextAttributesViewController createRowFontSizeCell](self, "createRowFontSizeCell");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_msgSend(v7, "row");
    -[AKTextAttributesViewController presetFontController](self, "presetFontController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fonts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count") + 1;

    if (v13 == v16)
    {
      -[AKTextAttributesViewController createRowAlignmentCell](self, "createRowAlignmentCell");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSeparatorStyle:", 0);
    }
    else
    {
      -[AKTextAttributesViewController presetFontController](self, "presetFontController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "fonts");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectAtIndex:", objc_msgSend(v7, "row"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AKTextAttributesFontRowIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AKTextAttributesFontRowIdentifier"));
      +[AKFontListController attributedStringForFont:](AKFontListController, "attributedStringForFont:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAttributedText:", v20);

      objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("checkmark"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "imageWithRenderingMode:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setImage:", v23);

      objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "imageView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setTintColor:", v25);

      if (!v19)
        goto LABEL_11;
      -[AKTextAttributesViewController currentFontFamilyName](self, "currentFontFamilyName");
      v27 = objc_claimAutoreleasedReturnValue();
      if (!v27)
        goto LABEL_11;
      v28 = (void *)v27;
      objc_msgSend(v19, "familyName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[AKTextAttributesViewController currentFontFamilyName](self, "currentFontFamilyName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "containsString:", v30);

      if (v31)
      {
        objc_msgSend(v12, "imageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = 0;
      }
      else
      {
LABEL_11:
        objc_msgSend(v12, "imageView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        v34 = 1;
      }
      objc_msgSend(v32, "setHidden:", v34);

    }
  }
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v35);

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  v20 = a4;
  v7 = a5;
  v8 = *MEMORY[0x24BDF7718];
  v9 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v10 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v11 = *(double *)(MEMORY[0x24BDF7718] + 24);
  objc_msgSend(v20, "setSeparatorInset:", *MEMORY[0x24BDF7718], v9, v10, v11);
  objc_msgSend(v20, "setPreservesSuperviewLayoutMargins:", 0);
  objc_msgSend(v20, "setLayoutMargins:", v8, v9, v10, v11);
  v12 = objc_msgSend(v7, "row");
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fonts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count") - 1;

  if (v12 < v15)
    objc_msgSend(v20, "setSeparatorInset:", 0.0, 16.0, 0.0, 0.0);
  v16 = objc_msgSend(v7, "row");
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fonts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") + 1;

  if (v16 == v19)
    objc_msgSend(v20, "setSeparatorStyle:", 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "row");
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fonts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v7 < v10)
  {
    objc_msgSend(v23, "deselectRowAtIndexPath:animated:", v6, 1);
    -[AKTextAttributesViewController presetFontController](self, "presetFontController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fonts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v6, "row"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[AKTextAttributesViewController didSelectFont:](self, "didSelectFont:", v13);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextAttributesViewController presetFontController](self, "presetFontController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fonts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 >= 1)
    {
      v18 = 0;
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v19);

        ++v18;
        -[AKTextAttributesViewController presetFontController](self, "presetFontController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "fonts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

      }
      while (v18 < v22);
    }
    objc_msgSend(v23, "reloadRowsAtIndexPaths:withRowAnimation:", v14, 0);

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fonts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == objc_msgSend(v8, "count"))
  {

LABEL_4:
    v13 = 0;
    goto LABEL_5;
  }
  v9 = objc_msgSend(v5, "row");
  -[AKTextAttributesViewController presetFontController](self, "presetFontController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fonts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count") + 1;

  v13 = v5;
  if (v9 == v12)
    goto LABEL_4;
LABEL_5:

  return v13;
}

- (id)createRowFontSizeCell
{
  void *v3;
  void *v4;
  AKFontSizePicker *v5;
  void *v6;
  AKFontSizePicker *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  -[AKTextAttributesViewController sizeTableCell](self, "sizeTableCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AKTextAttributesRowFontSizeIdentifier"));
    v5 = [AKFontSizePicker alloc];
    objc_msgSend(v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[AKFontSizePicker initWithFrame:style:](v5, "initWithFrame:style:", 3);

    -[AKFontSizePicker setTag:](v7, "setTag:", 1001);
    -[AKFontSizePicker setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[AKTextAttributesViewController currentFontSize](self, "currentFontSize");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[AKFontSizePicker setValue:](v7, "setValue:");

    -[AKFontSizePicker addTarget:action:forControlEvents:](v7, "addTarget:action:forControlEvents:", self, sel__sizeStepperValueChanged_, 4096);
    objc_msgSend(v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v7);

    objc_msgSend(v4, "setPreservesSuperviewLayoutMargins:", 1);
    -[AKFontSizePicker setPreservesSuperviewLayoutMargins:](v7, "setPreservesSuperviewLayoutMargins:", 1);
    -[AKTextAttributesViewController controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v10);

    v11 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = sub_229074BE4;
    v23[3] = &unk_24F1A77E0;
    objc_copyWeak(&v24, &location);
    -[AKFontSizePicker setWillBeginTrackingUpdates:](v7, "setWillBeginTrackingUpdates:", v23);
    v18 = v11;
    v19 = 3221225472;
    v20 = sub_229074C38;
    v21 = &unk_24F1A77E0;
    objc_copyWeak(&v22, &location);
    -[AKFontSizePicker setDidEndTrackingUpdates:](v7, "setDidEndTrackingUpdates:", &v18);
    _NSDictionaryOfVariableBindings(CFSTR("sizePicker"), v7, 0, v18, v19, v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[sizePicker]|"), 0, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v14);

    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[sizePicker]-(1)-|"), 0, 0, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

    -[AKTextAttributesViewController setSizeTableCell:](self, "setSizeTableCell:", v4);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  -[AKTextAttributesViewController sizeTableCell](self, "sizeTableCell");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createRowAlignmentCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  AKSegmentedCtrl *v8;
  void *v9;
  AKSegmentedCtrl *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  -[AKTextAttributesViewController alignmentTableCell](self, "alignmentTableCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AKTextAttributesRowAlignmentIdentifier"));
    objc_msgSend(v4, "setAccessoryType:", 0);
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("text.alignleft"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("text.aligncenter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("text.alignright"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("text.justify"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [AKSegmentedCtrl alloc];
    v19[0] = v18;
    v19[1] = v5;
    v19[2] = v6;
    v19[3] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AKSegmentedCtrl initWithImages:](v8, "initWithImages:", v9);

    -[AKSegmentedCtrl addTarget:action:forControlEvents:](v10, "addTarget:action:forControlEvents:", self, sel__alignmentSegmentChanged_, 4096);
    -[AKSegmentedCtrl setSelectionType:](v10, "setSelectionType:", 0);
    -[AKSegmentedCtrl setTag:](v10, "setTag:", 1001);
    -[AKSegmentedCtrl setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v10);

    -[AKSegmentedCtrl setTag:forSegment:](v10, "setTag:forSegment:", 0, 0);
    -[AKSegmentedCtrl setTag:forSegment:](v10, "setTag:forSegment:", 1, 1);
    -[AKSegmentedCtrl setTag:forSegment:](v10, "setTag:forSegment:", 2, 2);
    -[AKSegmentedCtrl setTag:forSegment:](v10, "setTag:forSegment:", 3, 3);
    _NSDictionaryOfVariableBindings(CFSTR("segmentedControl"), v10, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[segmentedControl]|"), 0, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v14);

    v15 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[segmentedControl]|"), 0, 0, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

    -[AKTextAttributesViewController setAlignmentTableCell:](self, "setAlignmentTableCell:", v4);
  }
  -[AKTextAttributesViewController alignmentTableCell](self, "alignmentTableCell");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_sizeStepperValueChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  float v12;
  id v13;

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "value");
  objc_msgSend(v4, "numberWithDouble:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setCurrentFontSize:](self, "setCurrentFontSize:", v13);
  objc_msgSend((id)objc_opt_class(), "fontSizeNumberFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKTextAttributesViewController sizeTableCell](self, "sizeTableCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailTextLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v6);

  -[AKTextAttributesViewController sizeTableCell](self, "sizeTableCell");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewWithTag:", 1001);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "floatValue");
  objc_msgSend(v11, "setValue:", v12);
  -[AKTextAttributesViewController setLastActionID:](self, "setLastActionID:", 3);
  -[AKTextAttributesViewController setLastActionValue:](self, "setLastActionValue:", v13);
  -[AKTextAttributesViewController _sendFontAction](self, "_sendFontAction");

}

- (void)_styleSegmentChanged:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "selectedSegment");
  v5 = objc_msgSend(v14, "segmentCount");
  v6 = objc_msgSend(v14, "selectedSegment") << 24;
  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      v8 = objc_msgSend(v14, "isSelectedForSegment:", i);
      v9 = 1 << i;
      if (!v8)
        v9 = 0;
      v6 |= v9;
    }
  }
  -[AKTextAttributesViewController setLastActionID:](self, "setLastActionID:", 4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setLastActionValue:](self, "setLastActionValue:", v10);

  if (v4 > 1)
  {
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
      -[AKTextAttributesViewController _sendTextAttributesAction](self, "_sendTextAttributesAction");
  }
  else
  {
    -[AKTextAttributesViewController _sendFontAction](self, "_sendFontAction");
    -[AKTextAttributesViewController controller](self, "controller");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "actionController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKTextAttributesViewController fontUIItemDelegate](self, "fontUIItemDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "validateSender:", v13);

  }
}

- (void)_alignmentSegmentChanged:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "tagForSegment:", objc_msgSend(v4, "selectedSegment"));

  -[AKTextAttributesViewController setLastActionID:](self, "setLastActionID:", 6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setLastActionValue:](self, "setLastActionValue:", v6);

  -[AKTextAttributesViewController _sendTextAttributesAction](self, "_sendTextAttributesAction");
}

- (void)_sendFontAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKTextAttributesViewController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController fontUIItemDelegate](self, "fontUIItemDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:to:from:forEvent:", sel_performActionForSender_, v4, v5, 0);

}

- (void)_sendTextAttributesAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[AKTextAttributesViewController controller](self, "controller");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController textAttributesUIItemDelegate](self, "textAttributesUIItemDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:to:from:forEvent:", sel_performActionForSender_, v4, v5, 0);

}

- (BOOL)validateUserInterfaceItems
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[AKTextAttributesViewController controller](self, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController fontUIItemDelegate](self, "fontUIItemDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "validateSender:", v5);

  objc_msgSend(v3, "actionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController textAttributesUIItemDelegate](self, "textAttributesUIItemDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v6 | objc_msgSend(v7, "validateSender:", v8);

  return (char)v5;
}

- (void)didSelectFont:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController setCurrentFontFamilyName:](self, "setCurrentFontFamilyName:", v5);

  -[AKTextAttributesViewController setLastActionID:](self, "setLastActionID:", 1);
  -[AKTextAttributesViewController setLastActionValue:](self, "setLastActionValue:", v4);

  -[AKTextAttributesViewController _sendFontAction](self, "_sendFontAction");
}

- (id)convertFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = a3;
  objc_msgSend(v4, "fontDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[AKTextAttributesViewController lastActionID](self, "lastActionID"))
  {
    case 1:
      -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "familyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fontDescriptorWithFamily:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 2:
      -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fontName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fontDescriptorWithFace:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v10 = (void *)v8;

      goto LABEL_14;
    case 3:
      -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      objc_msgSend(v4, "fontWithSize:");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 4:
      -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "integerValue");

      if (v13 >> 24)
        v14 = 1;
      else
        v14 = 2;
      v15 = objc_msgSend(v5, "symbolicTraits");
      if ((v13 & (1 << SBYTE3(v13))) != 0)
        v16 = v15 | v14;
      else
        v16 = v15 & ~v14;
      objc_msgSend(v5, "fontDescriptorWithSymbolicTraits:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:
      objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v10, 0.0);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v9 = (void *)v11;

      break;
    default:
      v9 = 0;
      break;
  }
  if (v9)
    v17 = v9;
  else
    v17 = v4;
  v18 = v17;

  return v18;
}

- (void)syncFontsToUI:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  id v24;
  AKTextAttributesViewController *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      v12 = v8;
      v13 = v9;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
        v9 = v4;
        if (v13 != v4)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v11), "familyName");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v13)
          {
            if (v13 != v15 && (objc_msgSend(v13, "isEqual:", v15) & 1) == 0)
            {
              v17 = v4;

              v13 = v17;
            }
          }
          else
          {
            v13 = v15;
          }

          v9 = v13;
        }
        v8 = v4;
        if (v12 != v4)
        {
          v18 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v14, "pointSize");
          objc_msgSend(v18, "numberWithDouble:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v12)
          {
            objc_msgSend(v12, "doubleValue");
            v22 = v21;
            objc_msgSend(v20, "doubleValue");
            if (vabdd_f64(v22, v23) >= 0.0005)
            {
              v24 = v4;

              v12 = v24;
            }
          }
          else
          {
            v12 = v19;
          }

          v8 = v12;
        }
        ++v11;
        v12 = v8;
        v13 = v9;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  if (v9 == v4)
  {
    +[AKController akBundle](AKController, "akBundle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Multiple Fonts"), &stru_24F1A83D0, CFSTR("AKTextAttributesViewController_iOS"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = self;
    -[AKTextAttributesViewController setCurrentFontFamilyName:](self, "setCurrentFontFamilyName:", v27);

  }
  else
  {
    v25 = self;
    -[AKTextAttributesViewController setCurrentFontFamilyName:](self, "setCurrentFontFamilyName:", v9);
  }
  if (v8 != v4)
  {
    -[AKTextAttributesViewController setCurrentFontSize:](v25, "setCurrentFontSize:", v8);
    -[AKTextAttributesViewController sizeTableCell](v25, "sizeTableCell");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contentView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "viewWithTag:", 1001);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v30, "setValue:");

  }
}

- (id)convertTextAttributes:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a3;
  v5 = -[AKTextAttributesViewController lastActionID](self, "lastActionID");
  if (v5 == 4)
  {
    -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "integerValue");

    v13 = *MEMORY[0x24BDF66D8];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF66D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x24BDF6658];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF6658]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12 & 8;
    if (((v12 >> 2) & 1) == (objc_msgSend(v9, "integerValue") == 1))
    {
      v10 = 0;
    }
    else
    {
      v18 = v12 & 4;
      if (v4)
      {
        v19 = (void *)objc_msgSend(v4, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v19;
      if (v18)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v21, v13);

      }
      else
      {
        objc_msgSend(v19, "removeObjectForKey:", v13);
      }
    }
    if ((v16 >> 3) == (objc_msgSend(v15, "integerValue") == 1))
      goto LABEL_39;
    if (v10)
    {
      if (!v16)
      {
LABEL_30:
        objc_msgSend(v10, "removeObjectForKey:", v14);
        goto LABEL_39;
      }
    }
    else
    {
      if (v4)
      {
        v22 = objc_msgSend(v4, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v10 = (void *)v22;
      if (!v16)
        goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v23, v14);

    goto LABEL_39;
  }
  if (v5 == 5)
  {
    -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BDF6600];
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF6600]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if ((objc_msgSend(v15, "akIsEqualToColor:", v9) & 1) == 0)
    {
      if (v4)
      {
        v17 = (void *)objc_msgSend(v4, "mutableCopy");
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = v17;
      v20 = v9;
      goto LABEL_33;
    }
    v10 = 0;
LABEL_39:

    goto LABEL_40;
  }
  if (v5 != 6)
  {
    v10 = 0;
    goto LABEL_41;
  }
  -[AKTextAttributesViewController lastActionValue](self, "lastActionValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  v8 = *MEMORY[0x24BDF6628];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDF6628]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "alignment") != v7)
  {
    v15 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v15, "setAlignment:", v7);
    if (v4)
    {
      v17 = (void *)objc_msgSend(v4, "mutableCopy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v17;
    v20 = v15;
LABEL_33:
    objc_msgSend(v17, "setObject:forKey:", v20, v8);
    goto LABEL_39;
  }
  v10 = 0;
LABEL_40:

LABEL_41:
  if (v10)
    v24 = v10;
  else
    v24 = v4;
  v25 = v24;

  return v25;
}

- (void)syncTextAttributesToUI:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v26 = *(_QWORD *)v29;
    v9 = *MEMORY[0x24BDF6628];
    v25 = *MEMORY[0x24BDF6600];
    do
    {
      v10 = 0;
      v11 = v7;
      v12 = v8;
      do
      {
        if (*(_QWORD *)v29 != v26)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v10);
        objc_msgSend(v13, "objectForKey:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v8 = v4;
        if (v12 != v4)
        {
          v27 = 0;
          +[AKTextAnnotationAttributeHelper resolvedAlignmentAndDirection:locale:alignment:direction:](AKTextAnnotationAttributeHelper, "resolvedAlignmentAndDirection:locale:alignment:direction:", v14, 0, &v27, 0);
          if (v12)
          {
            v15 = objc_msgSend(v12, "unsignedIntegerValue");
            if (v15 != v27)
            {
              v16 = v4;

              v12 = v16;
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v27);
            v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          v8 = v12;
        }
        v7 = v4;
        if (v11 != v4)
        {
          objc_msgSend(v13, "objectForKey:", v25);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v11)
          {
            if (v11 != v17 && (objc_msgSend(v11, "akIsEqualToColor:", v17) & 1) == 0)
            {
              v19 = v4;

              v11 = v19;
            }
          }
          else
          {
            v11 = v17;
          }

          v7 = v11;
        }

        ++v10;
        v11 = v7;
        v12 = v8;
      }
      while (v6 != v10);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  -[AKTextAttributesViewController alignmentTableCell](self, "alignmentTableCell");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contentView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewWithTag:", 1001);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "deselectAllSegments");
  if (v8 != v4)
    objc_msgSend(v22, "selectSegmentWithTag:", objc_msgSend(v8, "unsignedIntegerValue"));

}

+ (id)fontSizeNumberFormatter
{
  if (qword_255A27210 != -1)
    dispatch_once(&qword_255A27210, &unk_24F1A7298);
  return (id)qword_255A27208;
}

- (UITableViewCell)sizeTableCell
{
  return self->_sizeTableCell;
}

- (void)setSizeTableCell:(id)a3
{
  objc_storeStrong((id *)&self->_sizeTableCell, a3);
}

- (UITableViewCell)alignmentTableCell
{
  return self->_alignmentTableCell;
}

- (void)setAlignmentTableCell:(id)a3
{
  objc_storeStrong((id *)&self->_alignmentTableCell, a3);
}

- (UIColor)currentFontColor
{
  return self->_currentFontColor;
}

- (void)setCurrentFontColor:(id)a3
{
  objc_storeStrong((id *)&self->_currentFontColor, a3);
}

- (NSString)currentFontFamilyName
{
  return self->_currentFontFamilyName;
}

- (void)setCurrentFontFamilyName:(id)a3
{
  objc_storeStrong((id *)&self->_currentFontFamilyName, a3);
}

- (NSNumber)currentFontSize
{
  return self->_currentFontSize;
}

- (void)setCurrentFontSize:(id)a3
{
  objc_storeStrong((id *)&self->_currentFontSize, a3);
}

- (id)currentAlignment
{
  return self->_currentAlignment;
}

- (void)setCurrentAlignment:(id)a3
{
  self->_currentAlignment = a3;
}

- (id)currentStyle
{
  return self->_currentStyle;
}

- (void)setCurrentStyle:(id)a3
{
  self->_currentStyle = a3;
}

- (AKController)controller
{
  return (AKController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (AKFontListController)presetFontController
{
  return self->_presetFontController;
}

- (void)setPresetFontController:(id)a3
{
  objc_storeStrong((id *)&self->_presetFontController, a3);
}

- (int64_t)lastActionID
{
  return self->_lastActionID;
}

- (void)setLastActionID:(int64_t)a3
{
  self->_lastActionID = a3;
}

- (id)lastActionValue
{
  return objc_getProperty(self, a2, 1096, 1);
}

- (void)setLastActionValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1096);
}

- (AKFontChooserUIItemDelegate)fontUIItemDelegate
{
  return self->_fontUIItemDelegate;
}

- (void)setFontUIItemDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_fontUIItemDelegate, a3);
}

- (AKTextAttributesUIItemDelegate)textAttributesUIItemDelegate
{
  return self->_textAttributesUIItemDelegate;
}

- (void)setTextAttributesUIItemDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_textAttributesUIItemDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAttributesUIItemDelegate, 0);
  objc_storeStrong((id *)&self->_fontUIItemDelegate, 0);
  objc_storeStrong(&self->_lastActionValue, 0);
  objc_storeStrong((id *)&self->_presetFontController, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_currentFontSize, 0);
  objc_storeStrong((id *)&self->_currentFontFamilyName, 0);
  objc_storeStrong((id *)&self->_currentFontColor, 0);
  objc_storeStrong((id *)&self->_alignmentTableCell, 0);
  objc_storeStrong((id *)&self->_sizeTableCell, 0);
}

@end
