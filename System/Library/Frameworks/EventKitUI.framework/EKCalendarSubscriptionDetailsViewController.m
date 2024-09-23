@implementation EKCalendarSubscriptionDetailsViewController

- (EKCalendarSubscriptionDetailsViewController)initWithCalendar:(id)a3 store:(id)a4
{
  id v6;
  EKCalendarSubscriptionDetailsViewController *v7;
  EKCalendarSubscriptionURLEditItem *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSArray *sections;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  EKCalendarRemoveExtraInfoEditItem *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  id v36;
  id v37;
  objc_super v38;
  uint64_t v39;
  _BYTE v40[128];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v6 = a4;
  v38.receiver = self;
  v38.super_class = (Class)EKCalendarSubscriptionDetailsViewController;
  v7 = -[EKCalendarSubscriptionDetailsViewController initWithStyle:](&v38, sel_initWithStyle_, 2);
  if (v7)
  {
    v8 = objc_alloc_init(EKCalendarSubscriptionURLEditItem);
    -[EKCalendarSubscriptionURLEditItem setEditable:](v8, "setEditable:", 0);
    v26 = objc_alloc_init(EKCalendarRemoveExtraInfoEditItem);
    v41[0] = v8;
    v41[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3880];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke;
    v35[3] = &unk_1E601C280;
    v10 = v27;
    v36 = v10;
    v11 = v6;
    v37 = v11;
    objc_msgSend(v9, "predicateWithBlock:", v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "filteredArrayUsingPredicate:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    sections = v7->_sections;
    v7->_sections = (NSArray *)v13;

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v15 = v7->_sections;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v19, "setCalendar:store:", v10, v11);
          objc_msgSend(v19, "setDelegate:", v7);
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v16);
    }

    EventKitUIBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Subscription Details"), &stru_1E601DFA8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarSubscriptionDetailsViewController setTitle:](v7, "setTitle:", v21);

    objc_initWeak(&location, v7);
    v39 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke_2;
    v28[3] = &unk_1E6018610;
    objc_copyWeak(&v29, &location);
    v23 = (id)-[EKCalendarSubscriptionDetailsViewController registerForTraitChanges:withHandler:](v7, "registerForTraitChanges:withHandler:", v22, v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v7;
}

uint64_t __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "configureWithCalendar:store:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __70__EKCalendarSubscriptionDetailsViewController_initWithCalendar_store___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKCalendarSubscriptionDetailsViewController;
  -[EKCalendarSubscriptionDetailsViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[EKCalendarSubscriptionDetailsViewController resetBackgroundColor](self, "resetBackgroundColor");
}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  -[EKCalendarSubscriptionDetailsViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarSubscriptionDetailsViewController;
  -[EKCalendarSubscriptionDetailsViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[EKCalendarSubscriptionDetailsViewController _tableHeaderView](self, "_tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarSubscriptionDetailsViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTableHeaderView:", v4);

}

- (id)_tableHeaderView
{
  EKSubscribedCalendarDescriptionHeader *tableHeaderView;
  EKSubscribedCalendarDescriptionHeader *v4;
  void *v5;
  EKSubscribedCalendarDescriptionHeader *v6;
  EKSubscribedCalendarDescriptionHeader *v7;
  CGRect v9;

  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = [EKSubscribedCalendarDescriptionHeader alloc];
    -[EKCalendarSubscriptionDetailsViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = -[EKSubscribedCalendarDescriptionHeader initWithParentWidth:](v4, "initWithParentWidth:", CGRectGetWidth(v9));
    v7 = self->_tableHeaderView;
    self->_tableHeaderView = v6;

    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (void)viewWillLayoutSubviews
{
  EKSubscribedCalendarDescriptionHeader *tableHeaderView;
  id v3;
  CGRect v4;

  tableHeaderView = self->_tableHeaderView;
  -[EKCalendarSubscriptionDetailsViewController tableView](self, "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[EKSubscribedCalendarDescriptionHeader updateLayoutForWidth:](tableHeaderView, "updateLayoutForWidth:", CGRectGetWidth(v4));

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSubitems");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  sections = self->_sections;
  v5 = a4;
  -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "cellForSubitemAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "calendarEditor:didSelectSubitem:", 0, v7);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v5;
  void *v6;
  uint64_t v7;

  sections = self->_sections;
  v5 = a4;
  -[NSArray objectAtIndexedSubscript:](sections, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  LOBYTE(v5) = objc_msgSend(v6, "calendarEditor:shouldSelectSubitem:", 0, v7);
  return (char)v5;
}

- (void)calendarItemStartedEditing:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarSubscriptionDetailsViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarItemStartedEditing:", v4);

}

- (int)sectionForCalendarEditItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  if (-[NSArray count](self->_sections, "count"))
  {
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v4)
        break;
      if (-[NSArray count](self->_sections, "count") <= ++v5)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    LODWORD(v5) = -1;
  }

  return v5;
}

- (BOOL)isNewCalendar
{
  void *v2;
  char v3;

  -[EKCalendarSubscriptionDetailsViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNewCalendar");

  return v3;
}

- (BOOL)enableDoneInitially
{
  void *v2;
  char v3;

  -[EKCalendarSubscriptionDetailsViewController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "enableDoneInitially");

  return v3;
}

- (EKCalendarEditItemDelegate)delegate
{
  return (EKCalendarEditItemDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
}

@end
