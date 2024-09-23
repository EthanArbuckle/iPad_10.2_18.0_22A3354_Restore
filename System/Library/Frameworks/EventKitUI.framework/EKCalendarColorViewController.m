@implementation EKCalendarColorViewController

- (EKCalendarColorViewController)init
{
  EKCalendarColorViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)EKCalendarColorViewController;
  v2 = -[EKCalendarColorViewController initWithStyle:](&v11, sel_initWithStyle_, 2);
  if (v2)
  {
    EventKitUIBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calendar Color"), &stru_1E601DFA8, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarColorViewController setTitle:](v2, "setTitle:", v4);

    objc_initWeak(&location, v2);
    v12[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__EKCalendarColorViewController_init__block_invoke;
    v8[3] = &unk_1E6018610;
    objc_copyWeak(&v9, &location);
    v6 = (id)-[EKCalendarColorViewController registerForTraitChanges:withHandler:](v2, "registerForTraitChanges:withHandler:", v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __37__EKCalendarColorViewController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)viewDidLoad
{
  objc_super v3;

  -[EKCalendarColorViewController resetBackgroundColor](self, "resetBackgroundColor");
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarColorViewController;
  -[EKCalendarColorViewController viewDidLoad](&v3, sel_viewDidLoad);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarColorViewController;
  -[EKCalendarColorViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarColorViewController;
  -[EKCalendarColorViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[EKCalendarColorEditItem reset](self->_editItem, "reset", a3);
  -[EKCalendarColorViewController tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  -[EKCalendarColorViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[EKCalendarColorEditItem numberOfSubitems](self->_editItem, "numberOfSubitems", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return -[EKCalendarColorEditItem cellForSubitemAtIndex:](self->_editItem, "cellForSubitemAtIndex:", objc_msgSend(a4, "row", a3));
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "selectionStyle"))
    objc_msgSend(v8, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
  -[EKCalendarColorEditItem calendarEditor:didSelectSubitem:](self->_editItem, "calendarEditor:didSelectSubitem:", 0, objc_msgSend(v6, "row"));

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[EKCalendarColorEditItem headerTitle](self->_editItem, "headerTitle", a3, a4);
}

- (CGSize)preferredContentSize
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = EKUIContainedControllerIdealWidth();
  -[EKCalendarColorViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sizeThatFits:", v3, 1100.0);
  v6 = v5;

  v7 = v3;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (EKCalendarColorEditItem)editItem
{
  return self->_editItem;
}

- (void)setEditItem:(id)a3
{
  objc_storeStrong((id *)&self->_editItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editItem, 0);
}

@end
