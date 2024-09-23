@implementation EKAbstractCalendarEditor

- (EKAbstractCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6
{
  return -[EKAbstractCalendarEditor initWithCalendar:eventStore:entityType:limitedToSource:enableDoneInitially:](self, "initWithCalendar:eventStore:entityType:limitedToSource:enableDoneInitially:", a3, a4, a5, a6, 0);
}

- (EKAbstractCalendarEditor)initWithCalendar:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 limitedToSource:(id)a6 enableDoneInitially:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  EKAbstractCalendarEditor *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EKAbstractCalendarEditor;
  v15 = -[EKAbstractCalendarEditor initWithStyle:](&v24, sel_initWithStyle_, 2);
  v15->_enableDoneInitially = a7;
  v15->_isNewCalendar = 0;
  -[EKAbstractCalendarEditor setModalInPresentation:](v15, "setModalInPresentation:", 1);
  -[EKAbstractCalendarEditor setHidesBottomBarWhenPushed:](v15, "setHidesBottomBarWhenPushed:", 1);
  objc_storeStrong((id *)&v15->_eventStore, a4);
  if (v12)
  {
    -[EKAbstractCalendarEditor setCalendar:](v15, "setCalendar:", v12);
    v15->_isNewCalendar = 0;
  }
  else
  {
    v15->_isNewCalendar = 1;
    objc_msgSend((id)objc_opt_class(), "createNewCalendarForEntityType:inEventStore:", a5, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAbstractCalendarEditor setCalendar:](v15, "setCalendar:", v16);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", v15, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  objc_initWeak(&location, v15);
  v25[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __103__EKAbstractCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource_enableDoneInitially___block_invoke;
  v21[3] = &unk_1E6018610;
  objc_copyWeak(&v22, &location);
  v19 = (id)-[EKAbstractCalendarEditor registerForTraitChanges:withHandler:](v15, "registerForTraitChanges:withHandler:", v18, v21);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v15;
}

void __103__EKAbstractCalendarEditor_initWithCalendar_eventStore_entityType_limitedToSource_enableDoneInitially___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
}

+ (id)createNewCalendarForEntityType:(unint64_t)a3 inEventStore:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CA9FF0], "calendarForEntityType:eventStore:", a3, a4);
}

- (void)setEventStore:(id)a3
{
  EKEventStore *v5;
  EKEventStore *v6;
  EKEventStore **p_eventStore;
  EKEventStore *eventStore;
  void *v9;
  int v10;
  void *v11;
  EKEventStore *v12;

  v5 = (EKEventStore *)a3;
  v6 = v5;
  p_eventStore = &self->_eventStore;
  eventStore = self->_eventStore;
  if (eventStore != v5)
  {
    v12 = v5;
    if (eventStore && -[EKAbstractCalendarEditor isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F88], *p_eventStore);

    }
    objc_storeStrong((id *)&self->_eventStore, a3);
    v10 = -[EKAbstractCalendarEditor isViewLoaded](self, "isViewLoaded");
    v6 = v12;
    if (v10)
    {
      if (*p_eventStore)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:selector:name:object:", self, sel__eventStoreChanged_, *MEMORY[0x1E0CA9F88], *p_eventStore);

      }
      -[EKAbstractCalendarEditor _eventStoreChanged:](self, "_eventStoreChanged:", 0);
      v6 = v12;
    }
  }

}

- (void)_eventStoreChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar"))
  {
    objc_msgSend(v4, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CA9F90]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v27 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            -[EKAbstractCalendarEditor calendar](self, "calendar");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectID");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v12) = objc_msgSend(v12, "isEqual:", v14);

            if ((v12 & 1) != 0)
            {

              goto LABEL_13;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
          if (v9)
            continue;
          break;
        }
      }
    }
    else
    {
LABEL_13:
      -[EKAbstractCalendarEditor calendar](self, "calendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "eventStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        -[EKAbstractCalendarEditor editItems](self, "editItems", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v23 != v20)
                objc_enumerationMutation(v17);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "reset");
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v19);
        }

        -[EKAbstractCalendarEditor tableView](self, "tableView");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reloadData");
      }
      else
      {
        -[EKAbstractCalendarEditor delegate](self, "delegate");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "calendarEditor:didCompleteWithAction:", self, 2);
      }
    }

  }
}

- (void)_localeChanged
{
  id v2;

  -[EKAbstractCalendarEditor tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKAbstractCalendarEditor;
  -[EKAbstractCalendarEditor loadView](&v5, sel_loadView);
  -[EKAbstractCalendarEditor tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEstimatedRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedSectionFooterHeight:", 0.0);
  objc_msgSend(v3, "setEstimatedSectionHeaderHeight:", 0.0);
  -[EKAbstractCalendarEditor resetBackgroundColor](self, "resetBackgroundColor");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__localeChanged, *MEMORY[0x1E0D0CA70], 0);

}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  -[EKAbstractCalendarEditor tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 enableDoneInitially;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EKAbstractCalendarEditor;
  -[EKAbstractCalendarEditor viewDidLoad](&v14, sel_viewDidLoad);
  if (self->_eventStore)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__eventStoreChanged_, *MEMORY[0x1E0CA9F88], self->_eventStore);

  }
  -[EKAbstractCalendarEditor leftButton](self, "leftButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v4);

  v6 = !self->_enableDoneInitially;
  -[EKAbstractCalendarEditor navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v6);

  -[EKAbstractCalendarEditor rightButton](self, "rightButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRightBarButtonItem:", v9);

  enableDoneInitially = self->_enableDoneInitially;
  -[EKAbstractCalendarEditor navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", enableDoneInitially);

  -[EKAbstractCalendarEditor setupForCalendar](self, "setupForCalendar");
}

- (id)leftButton
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("cancel-button"));
  return v2;
}

- (id)rightButton
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_done_);
  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("done-button"));
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKAbstractCalendarEditor;
  -[EKAbstractCalendarEditor viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  -[EKAbstractCalendarEditor tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

  -[EKAbstractCalendarEditor updatePreferredContentSize](self, "updatePreferredContentSize");
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
  v6.super_class = (Class)EKAbstractCalendarEditor;
  -[EKAbstractCalendarEditor viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)setupForCalendar
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EKAbstractCalendarEditor editItems](self, "editItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        -[EKAbstractCalendarEditor calendar](self, "calendar");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setCalendar:store:", v9, self->_eventStore);

        objc_msgSend(v8, "setDelegate:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[EKAbstractCalendarEditor tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reloadData");

}

- (id)loadEditItems
{
  return 0;
}

- (id)reconfiguredEditItems
{
  return 0;
}

- (void)reconfigureAndReloadEditItems
{
  void *v3;
  NSMutableArray *v4;
  NSMutableArray *editItems;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_editItems)
  {
    -[EKAbstractCalendarEditor reconfiguredEditItems](self, "reconfiguredEditItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
    editItems = self->_editItems;
    self->_editItems = v4;

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[EKAbstractCalendarEditor editItems](self, "editItems", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "reloadData");
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[EKAbstractCalendarEditor tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

  }
}

- (void)_presentValidationAlert:(id)a3
{
  PresentValidationAlert(self, a3);
}

- (void)cancel:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  -[EKAbstractCalendarEditor calendar](self, "calendar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasChanges");

  if (v5)
  {
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rollback");

  }
  -[EKAbstractCalendarEditor delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[EKAbstractCalendarEditor delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[EKAbstractCalendarEditor delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "calendarEditor:didCompleteWithAction:", self, 0);

    }
  }
}

- (void)done:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  EKAbstractCalendarEditor *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  if (-[EKAbstractCalendarEditor isNewCalendar](self, "isNewCalendar", a3))
    v4 = 3;
  else
    v4 = 1;
  v28 = 0uLL;
  v29 = 0uLL;
  -[EKAbstractCalendarEditor editItems](self, "editItems", (_QWORD)v26);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[EKAbstractCalendarEditor calendar](self, "calendar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "saveStateToCalendar:", v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasChanges");

  if (v13)
  {
    -[EKAbstractCalendarEditor saveCalendar](self, "saveCalendar");
    -[EKAbstractCalendarEditor delegate](self, "delegate");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[EKAbstractCalendarEditor delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        -[EKAbstractCalendarEditor delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = self;
        v21 = v4;
LABEL_18:
        objc_msgSend(v18, "calendarEditor:didCompleteWithAction:", v20, v21);

      }
    }
  }
  else
  {
    -[EKAbstractCalendarEditor delegate](self, "delegate");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      -[EKAbstractCalendarEditor delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        -[EKAbstractCalendarEditor delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = self;
        v21 = 0;
        goto LABEL_18;
      }
    }
  }
}

- (void)saveChanges
{
  -[EKAbstractCalendarEditor done:](self, "done:", 0);
}

- (void)saveCalendar
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[EKAbstractCalendarEditor calendar](self, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEFAULT, "Saving Calendar: %@", buf, 0xCu);

  }
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor willSaveCalendar:](self, "willSaveCalendar:", v6);

  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v9 = objc_msgSend(v7, "saveCalendar:error:", v8, &v16);
  v10 = v16;

  if ((v9 & 1) == 0)
  {
    v11 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "Calendar unable to save: %@", buf, 0xCu);
    }
    -[EKAbstractCalendarEditor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__presentValidationAlert_, v10, 0.0);
  }
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKAbstractCalendarEditor didSaveCalendar:](self, "didSaveCalendar:", v12);

  v13 = (void *)MEMORY[0x1E0CAA090];
  -[EKAbstractCalendarEditor calendar](self, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __40__EKAbstractCalendarEditor_saveCalendar__block_invoke;
  v15[3] = &unk_1E6018638;
  v15[4] = self;
  objc_msgSend(v13, "isFamilyCalendar:completion:", v14, v15);

}

void __40__EKAbstractCalendarEditor_saveCalendar__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      v5 = v3;
      objc_msgSend(v4, "calendar");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_DEFAULT, "Sending out save family calendar darwin notification. %@", (uint8_t *)&v8, 0xCu);

    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x1E0CA9F98], 0, 0, 1u);
  }
}

- (id)editItems
{
  NSMutableArray *editItems;
  void *v4;
  NSMutableArray *v5;
  NSMutableArray *v6;

  editItems = self->_editItems;
  if (!editItems)
  {
    -[EKAbstractCalendarEditor loadEditItems](self, "loadEditItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableArray *)objc_msgSend(v4, "mutableCopy");
    v6 = self->_editItems;
    self->_editItems = v5;

    -[EKAbstractCalendarEditor setupForCalendar](self, "setupForCalendar");
    editItems = self->_editItems;
  }
  return editItems;
}

- (BOOL)isModalInPresentation
{
  void *v2;
  void *v3;
  char v4;

  -[EKAbstractCalendarEditor navigationItem](self, "navigationItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rightBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  return v4;
}

- (CGSize)preferredContentSize
{
  CGSize *p_preferredContentSize;
  double width;
  double height;
  CGSize result;

  p_preferredContentSize = &self->_preferredContentSize;
  width = self->_preferredContentSize.width;
  height = self->_preferredContentSize.height;
  if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[EKAbstractCalendarEditor calculatePreferredContentSize](self, "calculatePreferredContentSize");
    p_preferredContentSize->width = width;
    p_preferredContentSize->height = height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (void)updatePreferredContentSize
{
  double v3;
  double v4;
  void *v6;
  id v7;

  -[EKAbstractCalendarEditor calculatePreferredContentSize](self, "calculatePreferredContentSize");
  if (v3 != self->_preferredContentSize.width || v4 != self->_preferredContentSize.height)
  {
    self->_preferredContentSize.width = v3;
    self->_preferredContentSize.height = v4;
    -[EKAbstractCalendarEditor navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredContentSizeDidChangeForChildContentContainer:", v7);

  }
}

- (CGSize)calculatePreferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKAbstractCalendarEditor tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1100.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (int)sectionForCalendarEditItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v4 = a3;
  -[EKAbstractCalendarEditor editItems](self, "editItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqual:", v7);

      if ((v8 & 1) != 0)
        break;
      if (objc_msgSend(v5, "count") <= (unint64_t)++v6)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    LODWORD(v6) = -1;
  }

  return v6;
}

- (BOOL)isNewCalendar
{
  return self->_isNewCalendar;
}

- (BOOL)enableDoneInitially
{
  return self->_enableDoneInitially;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[EKAbstractCalendarEditor editItems](self, "editItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[EKAbstractCalendarEditor editItems](self, "editItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfSubitems");

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[EKAbstractCalendarEditor editItems](self, "editItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (EKUICatalyst())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      objc_msgSend(v10, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setBackgroundColor:", v8);
    }
  }

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[EKAbstractCalendarEditor editItems](self, "editItems", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "footerTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  -[EKAbstractCalendarEditor editItems](self, "editItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "row");
  objc_msgSend(v7, "cellForSubitemAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;

  v6 = a4;
  v7 = a3;
  -[EKAbstractCalendarEditor editItems](self, "editItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  v11 = v10;
  objc_msgSend(v7, "_backgroundInset");
  v13 = v12;

  v14 = objc_msgSend(v6, "row");
  objc_msgSend(v9, "defaultCellHeightForSubitemAtIndex:forWidth:", v14, v11 + v13 * -2.0);
  v16 = v15;
  if (v15 > 0.0)
  {
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v15);
    v16 = v17;
  }

  return v16;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a4;
  -[EKAbstractCalendarEditor editItems](self, "editItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "row");
  LOBYTE(self) = objc_msgSend(v7, "calendarEditor:shouldSelectSubitem:", self, v8);

  return (char)self;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "cellForRowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "selectionStyle"))
  {
    objc_msgSend(v10, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
    -[EKAbstractCalendarEditor editItems](self, "editItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "calendarEditor:didSelectSubitem:", self, objc_msgSend(v6, "row"));
  }

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  _BOOL4 IsCompactInViewHierarchy;
  id v6;

  -[EKAbstractCalendarEditor view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsCompactInViewHierarchy = EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v4);

  if (IsCompactInViewHierarchy)
  {
    -[EKAbstractCalendarEditor firstResponder](self, "firstResponder");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

  }
}

- (EKCalendarEditorDelegate)delegate
{
  return (EKCalendarEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editItems, 0);
}

@end
