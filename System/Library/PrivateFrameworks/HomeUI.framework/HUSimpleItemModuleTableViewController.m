@implementation HUSimpleItemModuleTableViewController

- (HUSimpleItemModuleTableViewController)initWithTableViewStyle:(int64_t)a3 moduleCreator:(id)a4 moduleControllerBuilder:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  HUSimpleItemModuleTableViewController *v13;
  HUSimpleItemModuleTableViewController *v14;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSimpleItemModuleTableViewController.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleCreator"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSimpleItemModuleTableViewController.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleControllerBuilder"));

LABEL_3:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31810]), "initWithDelegate:", 0);
  objc_msgSend(v12, "setItemModuleCreator:", v9);
  v18.receiver = self;
  v18.super_class = (Class)HUSimpleItemModuleTableViewController;
  v13 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v18, sel_initWithItemManager_tableViewStyle_, v12, a3);
  v14 = v13;
  if (v13)
    -[HUSimpleItemModuleTableViewController setModuleControllerBuilder:](v13, "setModuleControllerBuilder:", v11);

  return v14;
}

- (HUSimpleItemModuleTableViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithTableViewStyle_moduleCreator_moduleControllerBuilder_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSimpleItemModuleTableViewController.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSimpleItemModuleTableViewController initWithItemManager:tableViewStyle:]",
    v7);

  return 0;
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[HUSimpleItemModuleTableViewController moduleControllerBuilder](self, "moduleControllerBuilder");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unint64_t)updateMode
{
  return 1;
}

- (void)_updateTitle
{
  void *v3;
  id v4;

  -[HUSimpleItemModuleTableViewController title](self, "title");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSimpleItemModuleTableViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUSimpleItemModuleTableViewController;
  -[HUItemTableViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (-[HUItemTableViewController wantsPreferredContentSize](self, "wantsPreferredContentSize"))
  {
    -[HUSimpleItemModuleTableViewController tableView](self, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentSize");
    -[HUSimpleItemModuleTableViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUSimpleItemModuleTableViewController;
  -[HUItemTableViewController tableView:cellForRowAtIndexPath:](&v11, sel_tableView_cellForRowAtIndexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "messageTextView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
  return v6;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HUItemTableSectionHeaderFooterView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributedFooterTitleForSection:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("footerReuseIdentifier"));
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v9 = -[HUItemTableSectionHeaderFooterView initWithReuseIdentifier:]([HUItemTableSectionHeaderFooterView alloc], "initWithReuseIdentifier:", CFSTR("footerReuseIdentifier"));
    -[HUItemTableViewController itemManager](self, "itemManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayedSectionIdentifierForSectionIndex:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIdentifier:", v11);

    -[HUItemTableSectionHeaderFooterView messageTextView](v9, "messageTextView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[HUItemTableSectionHeaderFooterView setType:](v9, "setType:", 1);
    -[HUItemTableSectionHeaderFooterView setMessage:](v9, "setMessage:", v8);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HUSimpleItemModuleTableViewController;
    -[HUItemTableViewController tableView:viewForFooterInSection:](&v15, sel_tableView_viewForFooterInSection_, v6, a4);
    v9 = (HUItemTableSectionHeaderFooterView *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v12;
  HUSimpleItemModuleTableViewController *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v12, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31600], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "openURL:", v7);

  return 1;
}

- (void)dismissTextViewController
{
  uint64_t v3;
  void *v4;
  HUSimpleItemModuleTableViewController *v5;
  HUSimpleItemModuleTableViewController *v6;

  -[HUSimpleItemModuleTableViewController navigationController](self, "navigationController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (HUSimpleItemModuleTableViewController *)v3;
  else
    v5 = self;
  v6 = v5;

  -[HUSimpleItemModuleTableViewController dismissViewControllerAnimated:completion:](v6, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (NSArray)moduleControllers
{
  return self->_moduleControllers;
}

- (id)moduleControllerBuilder
{
  return self->_moduleControllerBuilder;
}

- (void)setModuleControllerBuilder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_moduleControllerBuilder, 0);
  objc_storeStrong((id *)&self->_moduleControllers, 0);
}

@end
