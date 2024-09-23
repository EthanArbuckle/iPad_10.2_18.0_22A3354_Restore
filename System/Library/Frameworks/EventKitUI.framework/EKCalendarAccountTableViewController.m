@implementation EKCalendarAccountTableViewController

- (EKCalendarAccountTableViewController)initWithCalendar:(id)a3 andStore:(id)a4
{
  id v6;
  id v7;
  EKCalendarAccountTableViewController *v8;
  EKCalendarAccountTableViewController *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EKCalendarAccountTableViewController;
  v8 = -[EKCalendarAccountTableViewController initWithStyle:](&v16, sel_initWithStyle_, 2);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_eventStore, v7);
    objc_storeWeak((id *)&v9->_calendar, v6);
    objc_initWeak(&location, v9);
    v17[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__EKCalendarAccountTableViewController_initWithCalendar_andStore___block_invoke;
    v13[3] = &unk_1E6018610;
    objc_copyWeak(&v14, &location);
    v11 = (id)-[EKCalendarAccountTableViewController registerForTraitChanges:withHandler:](v9, "registerForTraitChanges:withHandler:", v10, v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __66__EKCalendarAccountTableViewController_initWithCalendar_andStore___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKCalendarAccountTableViewController;
  -[EKCalendarAccountTableViewController loadView](&v6, sel_loadView);
  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Accounts - Account Picker"), CFSTR("Accounts"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarAccountTableViewController setTitle:](self, "setTitle:", v4);

  -[EKCalendarAccountTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("EKCalendarAccountCell"));

  -[EKCalendarAccountTableViewController resetBackgroundColor](self, "resetBackgroundColor");
}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  -[EKCalendarAccountTableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (NSMutableArray)accounts
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (void *)accounts_accounts;
  if (!accounts_accounts)
  {
    v4 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)&self->_eventStore);
    objc_msgSend(WeakRetained, "sources", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v7)
      goto LABEL_20;
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = objc_loadWeakRetained((id *)&self->_calendar);
        v13 = objc_msgSend(v12, "isSubscribed");

        if (v13)
        {
          if ((objc_msgSend(v11, "isDelegate") & 1) != 0)
            goto LABEL_15;
          objc_msgSend(v11, "constraints");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "supportsSubscribedCalendars"))
          {

LABEL_14:
            objc_msgSend(v4, "addObject:", v11);
            goto LABEL_15;
          }
          v15 = objc_msgSend(v11, "sourceType");

          if (v15 == 4)
            goto LABEL_14;
        }
        else if (objc_msgSend(v11, "supportsCalendarCreation")
               && objc_msgSend(v11, "sourceType") != 4
               && (objc_msgSend(v11, "isDelegate") & 1) == 0)
        {
          goto LABEL_14;
        }
LABEL_15:
        ++v10;
      }
      while (v8 != v10);
      v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v8 = v16;
      if (!v16)
      {
LABEL_20:

        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = (void *)accounts_accounts;
        accounts_accounts = v17;

        v3 = (void *)accounts_accounts;
        return (NSMutableArray *)v3;
      }
    }
  }
  return (NSMutableArray *)v3;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[EKCalendarAccountTableViewController accounts](self, "accounts", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("EKCalendarAccountCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarAccountTableViewController accounts](self, "accounts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CalDisplayedTitleForSourceAsCalendarTarget(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  -[EKCalendarAccountTableViewController currentSourceIdentifier](self, "currentSourceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "isEqualToString:", v14);

  if ((_DWORD)v12)
    v15 = 3;
  else
    v15 = 0;
  objc_msgSend(v7, "setAccessoryType:", v15);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  -[EKCalendarAccountTableViewController accounts](self, "accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_calendar);
  objc_msgSend(WeakRetained, "setSource:", v14);

  v9 = objc_loadWeakRetained((id *)&self->_calendar);
  objc_msgSend(v9, "setDisplayOrder:", objc_msgSend(v14, "displayOrderForNewCalendar"));

  objc_msgSend(v14, "sourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarAccountTableViewController setCurrentSourceIdentifier:](self, "setCurrentSourceIdentifier:", v10);

  -[EKCalendarAccountTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

  -[EKCalendarAccountTableViewController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(WeakRetained) = objc_opt_respondsToSelector();

  if ((WeakRetained & 1) != 0)
  {
    -[EKCalendarAccountTableViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountTableViewController:selectedSourceChanged:", self, v14);

  }
}

- (EKCalendarAccountTableViewControllerDelegate)delegate
{
  return (EKCalendarAccountTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)currentSourceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setCurrentSourceIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (EKEventStore)eventStore
{
  return (EKEventStore *)objc_loadWeakRetained((id *)&self->_eventStore);
}

- (void)setEventStore:(id)a3
{
  objc_storeWeak((id *)&self->_eventStore, a3);
}

- (EKCalendar)calendar
{
  return (EKCalendar *)objc_loadWeakRetained((id *)&self->_calendar);
}

- (void)setCalendar:(id)a3
{
  objc_storeWeak((id *)&self->_calendar, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_calendar);
  objc_destroyWeak((id *)&self->_eventStore);
  objc_storeStrong((id *)&self->_currentSourceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
