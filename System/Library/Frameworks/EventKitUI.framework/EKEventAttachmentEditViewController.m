@implementation EKEventAttachmentEditViewController

- (EKEventAttachmentEditViewController)initWithFrame:(CGRect)a3 attachments:(id)a4 sourceIsManaged:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  id v11;
  EKEventAttachmentEditViewController *v12;
  uint64_t v13;
  UITableView *table;
  uint64_t v15;
  NSArray *cellControllers;
  void *v17;
  void *v18;
  objc_super v20;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v20.receiver = self;
  v20.super_class = (Class)EKEventAttachmentEditViewController;
  v12 = -[EKEditItemViewController initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 2, x, y, width, height);
    table = v12->_table;
    v12->_table = (UITableView *)v13;

    +[EKEventAttachmentCellController cellControllersForAttachments:givenExistingControllers:sourceIsManaged:](EKEventAttachmentCellController, "cellControllersForAttachments:givenExistingControllers:sourceIsManaged:", v11, 0, v5);
    v15 = objc_claimAutoreleasedReturnValue();
    cellControllers = v12->_cellControllers;
    v12->_cellControllers = (NSArray *)v15;

    -[NSArray makeObjectsPerformSelector:withObject:](v12->_cellControllers, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, v12);
    EventKitUIBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Attachments"), &stru_1E601DFA8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventAttachmentEditViewController setTitle:](v12, "setTitle:", v18);

  }
  return v12;
}

- (void)loadView
{
  UITableView *v3;
  UITableView *table;

  v3 = (UITableView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 2, self->super._initialFrame.origin.x, self->super._initialFrame.origin.y, self->super._initialFrame.size.width, self->super._initialFrame.size.height);
  table = self->_table;
  self->_table = v3;

  -[UITableView setDataSource:](self->_table, "setDataSource:", self);
  -[UITableView setDelegate:](self->_table, "setDelegate:", self);
  -[UITableView setAutoresizingMask:](self->_table, "setAutoresizingMask:", 18);
  -[EKEventAttachmentEditViewController setView:](self, "setView:", self->_table);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKEventAttachmentEditViewController;
  -[EKEditItemViewController viewDidLoad](&v7, sel_viewDidLoad);
  if (self->super._modal)
  {
    -[EKEventAttachmentEditViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLeftBarButtonItem:", 0);

    -[EKEventAttachmentEditViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidesBackButton:", 1);

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_saveAndDismiss);
    -[EKEventAttachmentEditViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRightBarButtonItem:", v5);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_cellControllers, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  if (v6 >= -[NSArray count](self->_cellControllers, "count")
    || (-[NSArray objectAtIndex:](self->_cellControllers, "objectAtIndex:", objc_msgSend(v5, "row")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "cell"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, void *);
  void *v20;
  EKEventAttachmentEditViewController *v21;
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v30 = objc_msgSend(v7, "row");
  v8 = v28[3];
  if ((v8 & 0x8000000000000000) != 0 || v8 >= -[NSArray count](self->_cellControllers, "count"))
  {
    v15 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0DC36C8];
    EventKitUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Remove attachment"), CFSTR("Remove"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __100__EKEventAttachmentEditViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
    v20 = &unk_1E601A0F0;
    objc_copyWeak(&v25, &location);
    v24 = &v27;
    v21 = self;
    v22 = v6;
    v23 = v7;
    objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v11, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3D08];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v12, v17, v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configurationWithActions:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setPerformsFirstActionWithFullSwipe:", 0);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  _Block_object_dispose(&v27, 8);

  return v15;
}

void __100__EKEventAttachmentEditViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void (**v5)(id, uint64_t);
  id *WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained[132], "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", WeakRetained[132]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  objc_msgSend(v7, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "owningEventForAttachmentEditViewController:", *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v13, "removeAttachment:", v9);
  objc_storeStrong(WeakRetained + 132, v8);
  v14 = *(void **)(a1 + 40);
  v18[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "deleteRowsAtIndexPaths:withRowAnimation:", v15, 0);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attachmentEditViewController:attachmentDidChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));

  }
  v5[2](v5, 1);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = objc_msgSend(v7, "row");
  if (v5 < -[NSArray count](self->_cellControllers, "count"))
  {
    -[NSArray objectAtIndex:](self->_cellControllers, "objectAtIndex:", objc_msgSend(v7, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cellSelected");

  }
  -[UITableView selectRowAtIndexPath:animated:scrollPosition:](self->_table, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);

}

- (id)owningEventForAttachmentCellController:(id)a3
{
  EKEventAttachmentEditViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v6;
  id v7;
  void *v8;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "owningEventForAttachmentEditViewController:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (EKEventAttachmentEditViewControllerDelegate)delegate
{
  return (EKEventAttachmentEditViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cellControllers, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

@end
