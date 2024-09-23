@implementation HUItemTableOBWelcomeController

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6 itemTableViewController:(id)a7
{
  id v13;
  HUItemTableOBWelcomeController *v14;
  HUItemTableOBWelcomeController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSLayoutConstraint *itemTableViewHeightConstraint;
  objc_super v21;

  v13 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HUItemTableOBWelcomeController;
  v14 = -[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v21, sel_initWithTitle_detailText_icon_contentLayout_, a3, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_itemTableViewController, a7);
    -[HUItemTableViewController tableView](v15->_itemTableViewController, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToConstant:", 1.0);
    v18 = objc_claimAutoreleasedReturnValue();
    itemTableViewHeightConstraint = v15->_itemTableViewHeightConstraint;
    v15->_itemTableViewHeightConstraint = (NSLayoutConstraint *)v18;

  }
  return v15;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableOBWelcomeController.m"), 47, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableOBWelcomeController.m"), 54, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:icon:]",
    v8);

  return 0;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableOBWelcomeController.m"), 61, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:symbolName:]",
    v8);

  return 0;
}

- (HUItemTableOBWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTitle_detailText_icon_contentLayout_itemTableViewController_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUItemTableOBWelcomeController.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUItemTableOBWelcomeController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
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
  objc_super v47;
  _QWORD v48[7];

  v48[5] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)HUItemTableOBWelcomeController;
  -[OBBaseWelcomeController viewDidLoad](&v47, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWantsPreferredContentSize:", 1);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEnabled:", 0);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setShouldUseAlternateCellColor:", 1);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", 0.0, 1.0, 0.0, 1.0);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSectionContentInsetFollowsLayoutMargins:", 1);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController addChildViewController:](self, "addChildViewController:", v13);

  -[HUItemTableOBWelcomeController contentView](self, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v16);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v35 = (void *)MEMORY[0x1E0CB3718];
  -[HUItemTableOBWelcomeController contentView](self, "contentView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "topAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "tableView");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "topAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v41;
  -[HUItemTableOBWelcomeController contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "tableView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v34;
  -[HUItemTableOBWelcomeController contentView](self, "contentView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v19;
  -[HUItemTableOBWelcomeController contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v25;
  -[HUItemTableOBWelcomeController itemTableViewHeightConstraint](self, "itemTableViewHeightConstraint");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v27);

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "didMoveToParentViewController:", self);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUItemTableOBWelcomeController;
  -[HUItemTableOBWelcomeController viewWillLayoutSubviews](&v4, sel_viewWillLayoutSubviews);
  -[HUItemTableOBWelcomeController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)updateViewConstraints
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  objc_super v7;

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  -[HUItemTableOBWelcomeController itemTableViewHeightConstraint](self, "itemTableViewHeightConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setConstant:", v5);

  v7.receiver = self;
  v7.super_class = (Class)HUItemTableOBWelcomeController;
  -[HUItemTableOBWelcomeController updateViewConstraints](&v7, sel_updateViewConstraints);
}

- (id)hu_preloadContent
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HUItemTableOBWelcomeController itemTableViewController](self, "itemTableViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hu_preloadContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (HUItemTableViewController)itemTableViewController
{
  return self->_itemTableViewController;
}

- (void)setItemTableViewController:(id)a3
{
  objc_storeStrong((id *)&self->_itemTableViewController, a3);
}

- (NSLayoutConstraint)itemTableViewHeightConstraint
{
  return self->_itemTableViewHeightConstraint;
}

- (void)setItemTableViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_itemTableViewHeightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemTableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_itemTableViewController, 0);
}

@end
