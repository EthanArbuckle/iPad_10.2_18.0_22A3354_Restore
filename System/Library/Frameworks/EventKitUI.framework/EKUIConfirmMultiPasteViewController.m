@implementation EKUIConfirmMultiPasteViewController

- (EKUIConfirmMultiPasteViewController)initWithSearchResult:(id)a3 pasteboardManager:(id)a4 eventStore:(id)a5 dateForPaste:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EKUIConfirmMultiPasteViewController *v15;
  EKUIConfirmMultiPasteViewController *v16;
  uint64_t v17;
  EKCalendar *selectedCalendar;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)EKUIConfirmMultiPasteViewController;
  v15 = -[EKUIConfirmMultiPasteViewController init](&v30, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_searchResult, a3);
    objc_storeStrong((id *)&v16->_pasteboardManager, a4);
    objc_storeStrong((id *)&v16->_eventStore, a5);
    objc_msgSend(v12, "calendarToPasteTo");
    v17 = objc_claimAutoreleasedReturnValue();
    selectedCalendar = v16->_selectedCalendar;
    v16->_selectedCalendar = (EKCalendar *)v17;

    objc_storeStrong((id *)&v16->_dateForPaste, a6);
    EventKitUIBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Paste Multiple Events"), &stru_1E601DFA8, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIConfirmMultiPasteViewController navigationItem](v16, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v20);

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v16, sel__cancel_);
    -[EKUIConfirmMultiPasteViewController navigationItem](v16, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLeftBarButtonItem:", v22);

    v24 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Paste - confirmation nav bar button"), CFSTR("Paste"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v24, "initWithTitle:style:target:action:", v26, 2, v16, sel__done_);
    -[EKUIConfirmMultiPasteViewController navigationItem](v16, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setRightBarButtonItem:", v27);

  }
  return v16;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKUIConfirmMultiPasteViewController;
  -[EKUIConfirmMultiPasteViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[EKUIConfirmMultiPasteViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UILabel *v5;
  UILabel *descriptionLabel;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UITableView *v13;
  UITableView *tableView;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD v52[9];

  v52[7] = *MEMORY[0x1E0C80C00];
  v51.receiver = self;
  v51.super_class = (Class)EKUIConfirmMultiPasteViewController;
  -[EKUIConfirmMultiPasteViewController viewDidLoad](&v51, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("paste_x_events_calendar_selection"), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAutocompleteSearchResult pasteboardResults](self->_searchResult, "pasteboardResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_descriptionLabel, "setText:", v11);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->_descriptionLabel);

  v13 = (UITableView *)objc_alloc_init(MEMORY[0x1E0DC3D48]);
  tableView = self->_tableView;
  self->_tableView = v13;

  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", self->_tableView);

  v36 = (void *)MEMORY[0x1E0CB3718];
  -[UILabel leadingAnchor](self->_descriptionLabel, "leadingAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "layoutMarginsGuide");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v47);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v46;
  -[UILabel trailingAnchor](self->_descriptionLabel, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "layoutMarginsGuide");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v42);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v41;
  -[UILabel topAnchor](self->_descriptionLabel, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "layoutMarginsGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v37);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v35;
  -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "layoutMarginsGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v30;
  -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "layoutMarginsGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v16;
  -[UITableView topAnchor](self->_tableView, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel bottomAnchor](self->_descriptionLabel, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v18, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v19;
  -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIConfirmMultiPasteViewController view](self, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "layoutMarginsGuide");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "activateConstraints:", v25);

}

- (void)_cancel:(id)a3
{
  id v4;

  -[EKUIConfirmMultiPasteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[EKUIConfirmMultiPasteViewController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmMultiPasteViewController:finishedWithCancel:", self, 1);

}

- (void)_done:(id)a3
{
  -[CUIKPasteboardManager setCalendarForPaste:](self->_pasteboardManager, "setCalendarForPaste:", self->_selectedCalendar);
  -[CUIKPasteboardManager setDateForPaste:](self->_pasteboardManager, "setDateForPaste:", self->_dateForPaste);
  -[CUIKPasteboardManager pasteEventsWithDateMode:delegate:](self->_pasteboardManager, "pasteEventsWithDateMode:delegate:", 0, self);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 1);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  EKUIPopupTableViewCell *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD *v20;
  id v21;
  id location;
  _QWORD v23[5];
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = -[EKUIPopupTableViewCell initWithStyle:reuseIdentifier:]([EKUIPopupTableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICatalyst())
  {
    -[EKUIConfirmMultiPasteViewController popupMenu:](self, "popupMenu:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell setPopupMenu:](v8, "setPopupMenu:", v10);

  }
  else
  {
    +[EKUICalendarMenu placeholderMenuForCalendar:backgroundColor:](EKUICalendarMenu, "placeholderMenuForCalendar:backgroundColor:", self->_selectedCalendar, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKUIPopupTableViewCell setPopupMenu:](v8, "setPopupMenu:", v11);

    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = __Block_byref_object_copy__20;
    v23[4] = __Block_byref_object_dispose__20;
    v24 = 0;
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __71__EKUIConfirmMultiPasteViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v18[3] = &unk_1E6019950;
    objc_copyWeak(&v21, &location);
    v20 = v23;
    v19 = v9;
    -[EKUIPopupTableViewCell setPopupMenuProvider:](v8, "setPopupMenuProvider:", v18);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    _Block_object_dispose(v23, 8);

  }
  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Calendar"), &stru_1E601DFA8, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v8, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIPopupTableViewCell textLabel](v8, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextColor:", v15);

  return v8;
}

id __71__EKUIConfirmMultiPasteViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(WeakRetained, "popupMenu:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

  return v7;
}

- (id)popupMenu:(id)a3
{
  id v4;
  void *v5;
  EKEventStore *eventStore;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D0CD28], "calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvent:entityType:inEventStore:", 0, 2, 0, 0, 0, self->_eventStore);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  eventStore = self->_eventStore;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke;
  v12[3] = &unk_1E6019978;
  objc_copyWeak(&v13, &location);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke_2;
  v10[3] = &unk_1E60199A0;
  objc_copyWeak(&v11, &location);
  +[EKUICalendarMenu calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:](EKUICalendarMenu, "calendarMenuWithCalendars:eventStore:backgroundColor:setupActionHandler:selectionHandler:", v5, eventStore, v4, v12, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained && objc_msgSend(v5, "isEqual:", *((_QWORD *)WeakRetained + 126)))
    objc_msgSend(v8, "setState:", 1);

}

void __49__EKUIConfirmMultiPasteViewController_popupMenu___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id *v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained + 126;
    if (v5[126] != v7)
    {
      objc_storeStrong(v6, a2);
      objc_msgSend(v5[122], "reloadData");
    }
  }

}

- (void)pasteboardManager:(id)a3 presentAlert:(id)a4
{
  objc_msgSend(a4, "presentFromSource:", self);
}

- (void)pasteboardManager:(id)a3 didFinishPasteWithResult:(unint64_t)a4 willOpenEditor:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint64_t v11;
  uint64_t v12;

  if (!a4)
  {
    v11 = v5;
    v12 = v6;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __97__EKUIConfirmMultiPasteViewController_pasteboardManager_didFinishPasteWithResult_willOpenEditor___block_invoke;
    v9[3] = &unk_1E6019F18;
    v10 = a5;
    v9[4] = self;
    -[EKUIConfirmMultiPasteViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v9);
    -[EKUIConfirmMultiPasteViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "confirmMultiPasteViewController:finishedWithCancel:", self, 0);

  }
}

void __97__EKUIConfirmMultiPasteViewController_pasteboardManager_didFinishPasteWithResult_willOpenEditor___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  if (!*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attemptDisplayReviewPrompt");

    }
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  -[EKUIConfirmMultiPasteViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "confirmMultiPasteViewController:finishedWithCancel:", self, 1);

}

- (EKUIConfirmMultiPasteViewControllerDelegate)delegate
{
  return (EKUIConfirmMultiPasteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dateForPaste, 0);
  objc_storeStrong((id *)&self->_selectedCalendar, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_pasteboardManager, 0);
  objc_storeStrong((id *)&self->_searchResult, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
}

@end
