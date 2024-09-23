@implementation EKEventAttendeeCommentsEditViewController

- (EKEventAttendeeCommentsEditViewController)initWithEKEvent:(id)a3
{
  id v5;
  EKEventAttendeeCommentsEditViewController *v6;
  EKEventAttendeeCommentsEditViewController *v7;
  NSDateFormatter *v8;
  NSDateFormatter *headerDateFormatter;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)EKEventAttendeeCommentsEditViewController;
  v6 = -[EKEventAttendeeCommentsEditViewController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    headerDateFormatter = v7->_headerDateFormatter;
    v7->_headerDateFormatter = v8;

    -[NSDateFormatter setTimeStyle:](v7->_headerDateFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](v7->_headerDateFormatter, "setDateStyle:", 2);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v7->_headerDateFormatter, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__localeChanged, *MEMORY[0x1E0D0CA70], 0);

    -[EKEventAttendeeCommentsEditViewController _createTableData](v7, "_createTableData");
  }

  return v7;
}

- (void)_createTableData
{
  NSMutableArray *v3;
  NSMutableArray *tableData;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  tableData = self->_tableData;
  self->_tableData = v3;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[EKEvent attendees](self->_event, "attendees");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "comment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D0CD90], "stringWithAutoCommentRemoved:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "length"))
        {
          objc_msgSend(v10, "commentLastModifiedDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v10, "commentLastModifiedDate");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "startOfDayForDate:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);
            }
            objc_msgSend(v16, "addObject:", v10);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v18);

            }
            objc_msgSend(v15, "addObject:", v10);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", 0, 0);
  v40 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingDescriptors:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = v22;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sortUsingComparator:", &__block_literal_global_42);
        -[NSMutableArray addObject:](self->_tableData, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v25);
  }

}

uint64_t __61__EKEventAttendeeCommentsEditViewController__createTableData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "commentLastModifiedDate");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commentLastModifiedDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!(v6 | v7) || (v9 = objc_msgSend((id)v7, "compare:", v6)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D0CD10], "displayNameForIdentity:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CD10], "displayNameForIdentity:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "caseInsensitiveCompare:", v11);

  }
  return v9;
}

- (void)viewDidLoad
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
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
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)EKEventAttendeeCommentsEditViewController;
  -[EKEventAttendeeCommentsEditViewController viewDidLoad](&v30, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3D48]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[UITableView setTranslatesAutoresizingMaskIntoConstraints:](self->_tableView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITableView setAllowsSelection:](self->_tableView, "setAllowsSelection:", 0);
  -[EKEventAttendeeCommentsEditViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_tableView);

  v22 = (void *)MEMORY[0x1E0CB3718];
  -[UITableView leadingAnchor](self->_tableView, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeeCommentsEditViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v26;
  -[UITableView trailingAnchor](self->_tableView, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeeCommentsEditViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v21;
  -[UITableView topAnchor](self->_tableView, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeeCommentsEditViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v10;
  -[UITableView bottomAnchor](self->_tableView, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeeCommentsEditViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v15);

  if (-[EKEventAttendeeCommentsEditViewController _canEditAnyParticipantComment](self, "_canEditAnyParticipantComment"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__edit);
    -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setRightBarButtonItem:", v16);

  }
  EventKitUIBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Comments"), &stru_1E601DFA8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTitle:", v19);

}

- (void)_localeChanged
{
  -[EKEventAttendeeCommentsEditViewController _createTableData](self, "_createTableData");
  -[UITableView reloadData](self->_tableView, "reloadData");
}

- (void)_edit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", 1, 1);
  -[UITableView beginUpdates](self->_tableView, "beginUpdates");
  -[UITableView endUpdates](self->_tableView, "endUpdates");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel);
  -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v6);

}

- (void)_done:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  EKEvent *event;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD aBlock[4];
  id v22;
  EKEventAttendeeCommentsEditViewController *v23;

  v4 = a3;
  if (-[EKEvent hasChanges](self->_event, "hasChanges"))
  {
    -[UIResponder EKUI_editor](self, "EKUI_editor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__EKEventAttendeeCommentsEditViewController__done___block_invoke;
    aBlock[3] = &unk_1E601B2D8;
    v7 = v5;
    v22 = v7;
    v23 = self;
    v8 = _Block_copy(aBlock);
    if (-[EKEvent isOrWasPartOfRecurringSeries](self->_event, "isOrWasPartOfRecurringSeries"))
    {
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = __Block_byref_object_copy__14;
      v19 = __Block_byref_object_dispose__14;
      v20 = 0;
      event = self->_event;
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __51__EKEventAttendeeCommentsEditViewController__done___block_invoke_33;
      v12[3] = &unk_1E601B300;
      v12[4] = self;
      v13 = v8;
      v14 = &v15;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", 0, self, v4, event, v12);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v16[5];
      v16[5] = v10;

      _Block_object_dispose(&v15, 8);
    }
    else
    {
      (*((void (**)(void *, EKEvent *, _QWORD))v8 + 2))(v8, self->_event, 0);
      -[EKEventAttendeeCommentsEditViewController _transitionTableViewOutOfEditingMode](self, "_transitionTableViewOutOfEditingMode");
      if (!-[UITableView numberOfSections](self->_tableView, "numberOfSections"))
        -[EKEventAttendeeCommentsEditViewController _popViewControllerAnimated:](self, "_popViewControllerAnimated:", 1);
    }

  }
  else
  {
    -[EKEventAttendeeCommentsEditViewController _transitionTableViewOutOfEditingMode](self, "_transitionTableViewOutOfEditingMode");
  }

}

uint64_t __51__EKEventAttendeeCommentsEditViewController__done___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveEvent:span:error:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 968), a3, 0);
}

uint64_t __51__EKEventAttendeeCommentsEditViewController__done___block_invoke_33(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((unint64_t)(a2 - 3) >= 3)
  {
    v2 = result;
    (*(void (**)(void))(*(_QWORD *)(result + 40) + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    objc_msgSend(*(id *)(v2 + 32), "_transitionTableViewOutOfEditingMode");
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 976), "numberOfSections");
    if (!result)
      return objc_msgSend(*(id *)(v2 + 32), "_popViewControllerAnimated:", 1);
  }
  return result;
}

- (void)_transitionTableViewOutOfEditingMode
{
  void *v3;
  void *v4;
  id v5;

  -[UITableView setEditing:animated:](self->_tableView, "setEditing:animated:", 0, 1);
  -[UITableView beginUpdates](self->_tableView, "beginUpdates");
  -[UITableView endUpdates](self->_tableView, "endUpdates");
  if (-[EKEventAttendeeCommentsEditViewController _canEditAnyParticipantComment](self, "_canEditAnyParticipantComment"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__edit);
    -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRightBarButtonItem:", v3);

  }
  else
  {
    -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRightBarButtonItem:", 0);
  }

  -[EKEventAttendeeCommentsEditViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", 0);

}

- (void)_cancel
{
  if (-[EKEvent hasChanges](self->_event, "hasChanges"))
  {
    -[EKEvent rollback](self->_event, "rollback");
    -[EKEventAttendeeCommentsEditViewController _createTableData](self, "_createTableData");
    -[UITableView reloadData](self->_tableView, "reloadData");
  }
  -[EKEventAttendeeCommentsEditViewController _transitionTableViewOutOfEditingMode](self, "_transitionTableViewOutOfEditingMode");
}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  -[EKEventAttendeeCommentsEditViewController navigationDelegate](self, "navigationDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[EKEventAttendeeCommentsEditViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "popViewControllerAnimated:", v3);

}

- (BOOL)_canEditAnyParticipantComment
{
  void *v3;
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[EKEvent isEditable](self->_event, "isEditable"))
  {
    if ((-[EKEvent allowsClearingCommentsAsOrganizer](self->_event, "allowsClearingCommentsAsOrganizer") & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0D0CDE0], "sharedPreferences"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v4) = objc_msgSend(v3, "forceAllowClearComments"),
          v3,
          (_DWORD)v4))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v5 = self->_tableData;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            v16 = 0u;
            v17 = 0u;
            v18 = 0u;
            v19 = 0u;
            v4 = v10;
            v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v17;
              while (2)
              {
                for (j = 0; j != v12; ++j)
                {
                  if (*(_QWORD *)v17 != v13)
                    objc_enumerationMutation(v4);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "participantType") == 2)
                  {

                    LOBYTE(v4) = 0;
                    goto LABEL_23;
                  }
                }
                v12 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
                if (v12)
                  continue;
                break;
              }
            }

          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          LOBYTE(v4) = 1;
        }
        while (v7);
      }
      else
      {
        LOBYTE(v4) = 1;
      }
LABEL_23:

    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_tableData, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[NSMutableArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSMutableArray *tableData;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EKAttendeeCommentsTableViewCell *v9;

  tableData = self->_tableData;
  v5 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[EKAttendeeCommentsTableViewCell initWithParticipant:]([EKAttendeeCommentsTableViewCell alloc], "initWithParticipant:", v8);
  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__EKEventAttendeeCommentsEditViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke;
  v11[3] = &unk_1E6018660;
  v11[4] = self;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v9, "performBatchUpdates:completion:", v11, &__block_literal_global_42);

}

void __92__EKEventAttendeeCommentsEditViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setComment:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 40), "section"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));
  v5 = *(void **)(a1 + 48);
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteRowsAtIndexPaths:withRowAnimation:", v6, 100);

  if (!objc_msgSend(v4, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    v7 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(*(id *)(a1 + 40), "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteSections:withRowAnimation:", v8, 100);

  }
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  NSMutableArray *tableData;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  tableData = self->_tableData;
  v6 = a4;
  -[NSMutableArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "row");

  objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "participantType") == 2)
    v10 = 0;
  else
    v10 = -[EKEvent isEditable](self->_event, "isEditable");

  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSDateFormatter *headerDateFormatter;
  void *v9;
  void *v10;

  -[NSMutableArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "commentLastModifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    headerDateFormatter = self->_headerDateFormatter;
    objc_msgSend(v6, "commentLastModifiedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](headerDateFormatter, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return objc_msgSend(a3, "isEditing");
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  return (EKUIViewControllerNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_headerDateFormatter, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
