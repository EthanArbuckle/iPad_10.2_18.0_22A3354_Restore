@implementation CBSPaneViewController

- (void)viewDidLoad
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  CheckerBoardLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F698000, v3, OS_LOG_TYPE_DEFAULT, "Created an alternating colored square", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)CBSPaneViewController;
  -[CBSTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[CBSPaneViewController _setupPrimaryButton](self, "_setupPrimaryButton");
  -[CBSPaneViewController _setupSecondaryButton](self, "_setupSecondaryButton");
}

- (void)_setupPrimaryButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
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
  id v23;

  -[CBSPaneViewController primaryButtonText](self, "primaryButtonText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController setPrimaryButton:](self, "setPrimaryButton:", v5);

    v6 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = 24.0;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v9 = 26.0;
    objc_msgSend(v6, "_lightSystemFontOfSize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v10);

    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 1);

    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController primaryButtonText](self, "primaryButtonText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v18, 0);

    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAutoresizingMask:", 5);

    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeToFit");

    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_primaryButtonTapped_, 64);

    -[CBSTableViewController tableView](self, "tableView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v22);

  }
}

- (void)_setupSecondaryButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
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
  id v23;

  -[CBSPaneViewController secondaryButtonText](self, "secondaryButtonText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController setSecondaryButton:](self, "setSecondaryButton:", v5);

    v6 = (void *)MEMORY[0x24BEBB520];
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    v9 = 17.0;
    if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v9 = 20.0;
    objc_msgSend(v6, "systemFontOfSize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v10);

    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAdjustsFontSizeToFitWidth:", 1);

    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextAlignment:", 1);

    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController secondaryButtonText](self, "secondaryButtonText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:forState:", v18, 0);

    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAutoresizingMask:", 5);

    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sizeToFit");

    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addTarget:action:forControlEvents:", self, sel_secondaryButtonTapped_, 64);

    -[CBSTableViewController tableView](self, "tableView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v22);

  }
}

- (void)viewDidLayoutSubviews
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  objc_super v62;
  uint8_t buf[16];
  CGRect v64;
  CGRect v65;

  CheckerBoardLogHandleForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22F698000, v3, OS_LOG_TYPE_DEFAULT, "View has just laid out its subview", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v62.receiver = self;
  v62.super_class = (Class)CBSPaneViewController;
  -[CBSPaneViewController viewDidLayoutSubviews](&v62, sel_viewDidLayoutSubviews);
  -[CBSTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BE85900], "sharedStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "edgeInsetsForTable:", v12);
  v14 = v13;
  v16 = v15;

  objc_msgSend(MEMORY[0x24BE85900], "sharedStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBSPaneViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "horizontalMarginForView:", v18);
  v20 = -(v14 - v19 * 2.0) - v16;

  v21 = v8 - fmax(v20, 0.0);
  -[CBSPaneViewController primaryButton](self, "primaryButton");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v23 = 184.0;
    else
      v23 = 112.0;
    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "titleLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sizeThatFits:", v21, 1.79769313e308);
    v27 = v26;
    v29 = v28;

    if (v21 < v27)
      v27 = v21;
    UIRoundToViewScale();
    v31 = v30;
    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_firstLineBaselineOffsetFromBoundsTop");
    v35 = v10 - v34;
    -[CBSTableViewController tableView](self, "tableView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "contentInset");
    v38 = v35 - v37 - v23;

    -[CBSTableViewController headerView](self, "headerView");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "frame");
    v40 = CGRectGetMaxY(v64) + 14.0;

    if (v38 < v40)
      v38 = v40;
    -[CBSPaneViewController primaryButton](self, "primaryButton");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setFrame:", v31, v38, v27, v29);

  }
  else
  {
    v31 = *MEMORY[0x24BDBF090];
    v38 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v27 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v29 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  -[CBSPaneViewController secondaryButton](self, "secondaryButton");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "sizeThatFits:", v21, 1.79769313e308);
    v45 = v29;
    v46 = v10;
    v48 = v47;
    v61 = v49;

    if (v21 < v48)
      v48 = v21;
    UIRoundToViewScale();
    v51 = v50;
    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "titleLabel");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "_firstLineBaselineOffsetFromBoundsTop");
    v55 = v46 - v54;
    -[CBSTableViewController tableView](self, "tableView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "contentInset");
    v58 = v55 - v57 + -24.0;

    v65.origin.x = v31;
    v65.origin.y = v38;
    v65.size.width = v27;
    v65.size.height = v45;
    v59 = CGRectGetMaxY(v65) + 4.0;
    if (v58 < v59)
      v58 = v59;
    -[CBSPaneViewController secondaryButton](self, "secondaryButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setFrame:", v51, v58, v48, v61);

  }
}

- (id)primaryButtonText
{
  return 0;
}

- (id)secondaryButtonText
{
  return 0;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return (id)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("cellIdentifier"), a4);
}

- (UIButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_primaryButton, a3);
}

- (UIButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
}

@end
