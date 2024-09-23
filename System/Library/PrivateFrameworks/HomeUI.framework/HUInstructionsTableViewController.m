@implementation HUInstructionsTableViewController

- (HUInstructionsTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithInstructionsItem_contentViewController_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUInstructionsTableViewController.m"), 42, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUInstructionsTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (HUInstructionsTableViewController)initWithItemManager:(id)a3 instructionsItem:(id)a4 contentViewController:(id)a5
{
  id v9;
  id v10;
  HUInstructionsTableViewController *v11;
  HUInstructionsTableViewController *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUInstructionsTableViewController;
  v11 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v14, sel_initWithItemManager_tableViewStyle_, a3, 1);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_instructionsItem, a4);
    objc_storeStrong((id *)&v12->_contentViewController, a5);
  }

  return v12;
}

- (HUInstructionsTableViewController)initWithInstructionsItem:(id)a3 contentViewController:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HUInstructionsTableViewController *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0D31810];
  v8 = a4;
  v9 = [v7 alloc];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __84__HUInstructionsTableViewController_initWithInstructionsItem_contentViewController___block_invoke;
  v20 = &unk_1E6F50358;
  v21 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v9, "initWithDelegate:itemProvidersCreator:", self, &v17);
  v12 = (void *)MEMORY[0x1E0D319D0];
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2, v17, v18, v19, v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "comparatorWithSortedClasses:secondaryComparator:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemComparator:", v14);

  v15 = -[HUInstructionsTableViewController initWithItemManager:instructionsItem:contentViewController:](self, "initWithItemManager:instructionsItem:contentViewController:", v11, v10, v8);
  return v15;
}

id __84__HUInstructionsTableViewController_initWithInstructionsItem_contentViewController___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D31840]);
  v3 = (void *)objc_msgSend(v2, "initWithResults:", MEMORY[0x1E0C9AA70]);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "na_safeAddObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "na_safeAddObject:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HUInstructionsTableViewController)initWithItemManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUInstructionsTableViewController;
  return -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v4, sel_initWithItemManager_tableViewStyle_, a3, 1);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUInstructionsTableViewController;
  -[HUItemTableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[HUInstructionsTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSeparatorStyle:", 0);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  return (Class)(id)objc_opt_class();
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0CEA478];
    v14 = v10;
    objc_msgSend(v13, "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v16);

    -[HUInstructionsTableViewController contentViewController](self, "contentViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setViewController:", v18);

  }
  v19.receiver = self;
  v19.super_class = (Class)HUInstructionsTableViewController;
  -[HUItemTableViewController updateCell:forItem:indexPath:animated:](&v19, sel_updateCell_forItem_indexPath_animated_, v10, v11, v12, v6);

}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  void *v4;

  -[HUItemTableViewController itemManager](self, "itemManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "numberOfSections") - 1 > (unint64_t)a3;

  return a3;
}

- (id)childViewControllersToPreload
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[HUInstructionsTableViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_arrayWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HUInstructionsItem)instructionsItem
{
  return self->_instructionsItem;
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_instructionsItem, 0);
}

@end
