@implementation EKCalendarItemEditor

- (EKCalendarItemEditor)init
{
  EKCalendarItemEditor *v2;
  EKCalendarItemEditor *v3;
  void *v4;
  uint64_t v5;
  NSMutableSet *editItemsDisablingDoneButton;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)EKCalendarItemEditor;
  v2 = -[EKCalendarItemEditor initWithStyle:](&v13, sel_initWithStyle_, 2);
  v3 = v2;
  if (v2)
  {
    -[EKCalendarItemEditor preferredTitle](v2, "preferredTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemEditor setTitle:](v3, "setTitle:", v4);

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 1);
    editItemsDisablingDoneButton = v3->_editItemsDisablingDoneButton;
    v3->_editItemsDisablingDoneButton = (NSMutableSet *)v5;

    v3->_needsFirstResponderSet = 1;
    objc_initWeak(&location, v3);
    v14[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __28__EKCalendarItemEditor_init__block_invoke;
    v10[3] = &unk_1E6018610;
    objc_copyWeak(&v11, &location);
    v8 = (id)-[EKCalendarItemEditor registerForTraitChanges:withHandler:](v3, "registerForTraitChanges:withHandler:", v7, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__EKCalendarItemEditor_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "resetBackgroundColor");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_editItems)
  {
    -[EKCalendarItemEditor _editItems](self, "_editItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);

  }
  -[EKUIRecurrenceAlertController cancelAnimated:](self->_recurrenceAlertController, "cancelAnimated:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor dealloc](&v5, sel_dealloc);
}

- (void)setStore:(id)a3
{
  EKEventStore *v5;
  EKEventStore **p_store;
  EKEventStore *store;
  void *v8;
  void *v9;
  EKEventStore *v10;

  v5 = (EKEventStore *)a3;
  p_store = &self->_store;
  store = self->_store;
  v10 = v5;
  if (store != v5)
  {
    if (store && -[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0CA9F88], *p_store);

    }
    objc_storeStrong((id *)&self->_store, a3);
    if (*p_store && -[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_storeChanged_, *MEMORY[0x1E0CA9F88], *p_store);

    }
  }

}

- (void)setCalendarItem:(id)a3
{
  EKCalendarItem **p_calendarItem;
  void *v6;
  EKChangeSet *v7;
  EKChangeSet *originalChangeSet;
  EKCalendarItem *v9;

  p_calendarItem = &self->_calendarItem;
  v9 = (EKCalendarItem *)a3;
  if (*p_calendarItem != v9)
  {
    objc_storeStrong((id *)&self->_calendarItem, a3);
    if (-[EKCalendarItem isNew](*p_calendarItem, "isNew"))
    {
      -[EKCalendarItem changeSet](v9, "changeSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (EKChangeSet *)objc_msgSend(v6, "copy");
      originalChangeSet = self->_originalChangeSet;
      self->_originalChangeSet = v7;

    }
    if (-[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded"))
      -[EKCalendarItemEditor setupForEvent](self, "setupForEvent");
  }

}

- (void)setShouldOverrideAuthorizationStatus:(BOOL)a3 withRemoteUIStatus:(int64_t)a4
{
  self->_shouldOverrideAuthorizationStatus = a3;
  -[EKCalendarItemEditor _updateAccessDeniedViewWithNewStatus:](self, "_updateAccessDeniedViewWithNewStatus:", a4);
  self->_lastAuthorizationStatus = a4;
}

- (void)setDefaultCalendar:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarItemEditor calendarItem](self, "calendarItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendar:", v4);

}

- (unint64_t)tableSectionForEditItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_orderedEditItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "containsObject:", v4, (_QWORD)v13) & 1) != 0)
        {
          v11 = v8 + v10;
          goto LABEL_12;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (int64_t)firstTableRowForEditItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_orderedEditItems;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v11, "containsObject:", v4))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
LABEL_9:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              v17 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * v16);
              if (v17 == v4)
                break;
              v8 += objc_msgSend(v17, "numberOfSubitems");
              if (v14 == ++v16)
              {
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
                if (v14)
                  goto LABEL_9;
                break;
              }
            }
          }

        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadView
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  EKCalendarItemEditorTableView *v11;

  v3 = MEMORY[0x1E0C9D648];
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[EKCalendarItemEditor _popoverController](self, "_popoverController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = EKUIContainedControllerIdealWidth();
  else
    v8 = *(double *)(v3 + 16);
  v11 = -[EKCalendarItemEditorTableView initWithFrame:style:]([EKCalendarItemEditorTableView alloc], "initWithFrame:style:", 2, v4, v5, v8, v6);
  -[EKCalendarItemEditorTableView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
  -[EKCalendarItemEditorTableView setDelegate:](v11, "setDelegate:", self);
  -[EKCalendarItemEditorTableView setDataSource:](v11, "setDataSource:", self);
  -[EKCalendarItemEditorTableView setKeyboardDismissMode:](v11, "setKeyboardDismissMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lineHeight");
  -[EKCalendarItemEditorTableView setEstimatedRowHeight:](v11, "setEstimatedRowHeight:");

  if (EKUIUnscaledCatalyst())
  {
    -[EKCalendarItemEditorTableView setSeparatorStyle:](v11, "setSeparatorStyle:", 1);
    -[EKCalendarItemEditorTableView setRowHeight:](v11, "setRowHeight:", EKUIUnscaledCatalystTableRowHeightDefault());
    v10 = *MEMORY[0x1E0DC4918];
    -[EKCalendarItemEditorTableView setMinimumContentSizeCategory:](v11, "setMinimumContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    -[EKCalendarItemEditorTableView setMaximumContentSizeCategory:](v11, "setMaximumContentSizeCategory:", v10);
  }
  -[EKCalendarItemEditor setView:](self, "setView:", v11);
  -[EKCalendarItemEditor resetBackgroundColor](self, "resetBackgroundColor");
  -[EKCalendarItemEditor setResponderToRestoreOnAppearence:](self, "setResponderToRestoreOnAppearence:", 0);

}

- (void)resetBackgroundColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (-[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover")
    && (-[EKCalendarItemEditor popoverPresentationController](self, "popoverPresentationController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[EKCalendarItemEditor tableView](self, "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKCalendarItemEditor tableView](self, "tableView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor viewWillAppear:](&v18, sel_viewWillAppear_, a3);
  if (-[EKCalendarItemEditor visibleSectionToRestoreOnAppearence](self, "visibleSectionToRestoreOnAppearence"))
  {
    v4 = -[EKCalendarItemEditor visibleSectionToRestoreOnAppearence](self, "visibleSectionToRestoreOnAppearence");
    -[EKCalendarItemEditor tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfSections") - 1;

    if (v4 >= v6)
      v7 = v6;
    else
      v7 = v4;
    v19[0] = v7;
    v19[1] = 0;
    -[EKCalendarItemEditor tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v19, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 2, 0);

    -[EKCalendarItemEditor setVisibleSectionToRestoreOnAppearence:](self, "setVisibleSectionToRestoreOnAppearence:", 0);
  }
  -[EKCalendarItemEditor calendarItem](self, "calendarItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isNew");
  v12 = (void *)objc_opt_class();
  if ((v11 & 1) != 0)
    objc_msgSend(v12, "_addLocalizedString");
  else
    objc_msgSend(v12, "_doneLocalizedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setTitle:](self->_doneButton, "setTitle:", v13);

  -[EKCalendarItemEditor _updateDoneButtonState](self, "_updateDoneButtonState");
  if (!self->_accessDeniedView)
  {
    -[EKCalendarItemEditor transitionCoordinator](self, "transitionCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if (objc_msgSend(v14, "isAnimated"))
      {
        -[EKCalendarItemEditor transitionCoordinator](self, "transitionCoordinator");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __39__EKCalendarItemEditor_viewWillAppear___block_invoke;
        v17[3] = &unk_1E601C3C8;
        v17[4] = self;
        objc_msgSend(v16, "animateAlongsideTransition:completion:", v17, 0);

      }
    }

  }
}

uint64_t __39__EKCalendarItemEditor_viewWillAppear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupFirstResponder");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (!self->_accessDeniedView)
    -[EKCalendarItemEditor _setupFirstResponder](self, "_setupFirstResponder");
  self->_hasAppeared = 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  objc_super v8;

  v3 = a3;
  self->_hasAppeared = 0;
  if (!a3)
  {
    if (-[EKCalendarItemEditor _isPinningInputViews](self, "_isPinningInputViews"))
    {
      if (UIKeyboardAutomaticIsOnScreen())
      {
        -[EKCalendarItemEditor view](self, "view");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isRotating");

        if ((v7 & 1) == 0)
          -[EKCalendarItemEditor _pinKeyboard:](self, "_pinKeyboard:", 0);
      }
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKCalendarItemEditor _editItems](self, "_editItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isInline"))
          objc_msgSend(v10, "endInlineEditing");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  v11.receiver = self;
  v11.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor viewDidDisappear:](&v11, sel_viewDidDisappear_, v3);
}

- (void)_setupFirstResponder
{
  void *v3;
  void *v4;

  if (self->_needsFirstResponderSet)
  {
    if (self->_giveTitleCellKeyboardFocus)
    {
      -[EKCalendarItemEditor focus:select:](self, "focus:select:", 1, 0);
      self->_giveTitleCellKeyboardFocus = 0;
    }
    else
    {
      -[EKCalendarItemEditor responderToRestoreOnAppearence](self, "responderToRestoreOnAppearence");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
      {
        -[EKCalendarItemEditor responderToRestoreOnAppearence](self, "responderToRestoreOnAppearence");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "becomeFirstResponder");

      }
    }
    self->_needsFirstResponderSet = 0;
  }
}

- (void)updateNavButtonsWithSpacing
{
  UIBarButtonItem *v3;
  UIBarButtonItem *cancelButton;
  char v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *doneButton;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIBarButtonItem *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!self->_cancelButton)
  {
    v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancel_);
    cancelButton = self->_cancelButton;
    self->_cancelButton = v3;

    -[UIBarButtonItem setAccessibilityIdentifier:](self->_cancelButton, "setAccessibilityIdentifier:", CFSTR("cancel-button"));
  }
  if (!self->_doneButton)
  {
    v5 = -[EKCalendarItem isNew](self->_calendarItem, "isNew");
    v6 = (void *)objc_opt_class();
    if ((v5 & 1) != 0)
      objc_msgSend(v6, "_addLocalizedString");
    else
      objc_msgSend(v6, "_doneLocalizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 2, self, sel_done_);
    doneButton = self->_doneButton;
    self->_doneButton = v8;

    if (-[EKCalendarItem isNew](self->_calendarItem, "isNew"))
      v10 = CFSTR("add-button");
    else
      v10 = CFSTR("done-button");
    -[UIBarButtonItem setAccessibilityIdentifier:](self->_doneButton, "setAccessibilityIdentifier:", v10);
    -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);

  }
  v16[0] = self->_cancelButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItems:", v11);

  v15 = self->_doneButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItems:", v13);

}

- (void)viewDidLoad
{
  uint64_t lastAuthorizationStatus;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor viewDidLoad](&v14, sel_viewDidLoad);
  -[EKCalendarItemEditor updateNavButtonsWithSpacing](self, "updateNavButtonsWithSpacing");
  if (self->_calendarItem)
    -[EKCalendarItemEditor setupForEvent](self, "setupForEvent");
  if (self->_shouldOverrideAuthorizationStatus)
  {
    lastAuthorizationStatus = self->_lastAuthorizationStatus;
  }
  else
  {
    lastAuthorizationStatus = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", -[EKCalendarItemEditor entityType](self, "entityType"));
    self->_lastAuthorizationStatus = lastAuthorizationStatus;
  }
  if (lastAuthorizationStatus <= 2)
    -[EKCalendarItemEditor _updateAccessDeniedViewWithNewStatus:](self, "_updateAccessDeniedViewWithNewStatus:");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKCalendarItemEditor notificationNamesForLocaleChange](self, "notificationNamesForLocaleChange", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__localeChanged, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillHide, *MEMORY[0x1E0DC4FE0], 0);
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__keyboardWillChangeFrame_, *MEMORY[0x1E0DC4FD8], 0);
  if (self->_store)
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_storeChanged_, *MEMORY[0x1E0CA9F88]);

}

- (void)_localeChanged
{
  id v2;

  -[EKCalendarItemEditor tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (void)_keyboardWillHide
{
  void *v3;
  void *v4;
  char v5;

  -[EKCalendarItemEditor view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRotating");

  if ((v5 & 1) == 0)
    -[EKCalendarItemEditor setResponderToRestoreOnAppearence:](self, "setResponderToRestoreOnAppearence:", 0);
}

- (void)_keyboardWillChangeFrame:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  CGRect v18;
  CGRect v19;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", *MEMORY[0x1E0DC4E90]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[EKCalendarItemEditor view](self, "view");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isRotating"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    v16 = CGRectIntersectsRect(v18, v19);

    if (!v16)
      -[EKCalendarItemEditor setResponderToRestoreOnAppearence:](self, "setResponderToRestoreOnAppearence:", 0);
  }
}

- (void)storeChanged:(id)a3
{
  _QWORD block[5];

  if (!self->_shouldOverrideAuthorizationStatus)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__EKCalendarItemEditor_storeChanged___block_invoke;
    block[3] = &unk_1E6018688;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

_QWORD *__37__EKCalendarItemEditor_storeChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;

  v2 = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", objc_msgSend(*(id *)(a1 + 32), "entityType"));
  objc_msgSend(*(id *)(a1 + 32), "_updateAccessDeniedViewWithNewStatus:", v2);
  result = *(_QWORD **)(a1 + 32);
  if ((unint64_t)(v2 - 3) <= 1 && (unint64_t)(result[131] - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(result, "_refreshDataAndDismissViewControllerIfDeleted");
    result = *(_QWORD **)(a1 + 32);
  }
  result[131] = v2;
  return result;
}

- (void)applicationDidResume
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKCalendarItemEditor;
  -[EKCalendarItemEditor applicationDidResume](&v4, sel_applicationDidResume);
  -[EKCalendarItemEditor _editItems](self, "_editItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_applicationDidResume);

}

- (unint64_t)supportedInterfaceOrientations
{
  void *v3;
  void *v4;
  _BOOL4 IsRegularInViewHierarchy;
  unint64_t v6;

  -[UIViewController EKUI_viewHierarchy](self, "EKUI_viewHierarchy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  EKUIPushFallbackSizingContextWithViewHierarchy(v3);
  -[EKCalendarItemEditor view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsRegularInViewHierarchy = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v4);

  EKUIPopFallbackSizingContextWithViewHierarchy(v3);
  if (IsRegularInViewHierarchy)
    v6 = 30;
  else
    v6 = 26;

  return v6;
}

- (void)cancel:(id)a3
{
  -[EKCalendarItemEditor cancelEditingWithDelegateNotification:forceCancel:](self, "cancelEditingWithDelegateNotification:forceCancel:", 1, 0);
}

- (void)cancelEditingWithDelegateNotification:(BOOL)a3 forceCancel:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  id v7;
  int v8;
  int v9;
  void *v10;

  v4 = a3;
  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      v8 = objc_msgSend(v7, "editor:shouldCompleteWithAction:", self, 0);

      if (!v8)
        return;
    }
    else
    {

    }
  }
  v9 = -[EKCalendarItemEditor _isPinningInputViews](self, "_isPinningInputViews");
  -[EKCalendarItemEditor firstResponder](self, "firstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resignFirstResponder");

  -[EKCalendarItemEditor _revertEvent](self, "_revertEvent");
  -[EKCalendarItemEditor _completeWithAction:animated:notify:](self, "_completeWithAction:animated:notify:", 0, 1, v4);
  if (v9)
  {
    if (UIKeyboardAutomaticIsOnScreen())
      UIKeyboardOrderOutAutomatic();
  }
}

- (void)done:(id)a3
{
  -[EKCalendarItemEditor done:withContinueBlock:](self, "done:withContinueBlock:", a3, 0);
}

- (void)done:(id)a3 withContinueBlock:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;
  int v8;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  EKUIRecurrenceAlertController *v10;
  int v11;
  void *v12;
  EKCalendarItemEditItem *currentEditItem;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  int v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  _QWORD v27[5];
  void (**v28)(_QWORD);
  _QWORD aBlock[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_editorDelegate);
    v8 = objc_msgSend(v7, "editor:shouldCompleteWithAction:", self, 1);

    if (!v8)
      goto LABEL_41;
  }
  else
  {

  }
  recurrenceAlertController = self->_recurrenceAlertController;
  if (recurrenceAlertController)
  {
    if (-[EKUIRecurrenceAlertController isCurrentlyShowingAlert](recurrenceAlertController, "isCurrentlyShowingAlert"))
      goto LABEL_41;
    recurrenceAlertController = self->_recurrenceAlertController;
  }
  -[EKUIRecurrenceAlertController cancelAnimated:](recurrenceAlertController, "cancelAnimated:", 0);
  v10 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = 0;

  v11 = -[EKCalendarItemEditor _isPinningInputViews](self, "_isPinningInputViews");
  -[EKCalendarItemEditor firstResponder](self, "firstResponder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resignFirstResponder");

  currentEditItem = self->_currentEditItem;
  if (!currentEditItem
    || -[EKCalendarItemEditItem saveAndDismissWithForce:](currentEditItem, "saveAndDismissWithForce:", 0))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = self->_currentItems;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(v19, "isInline")
            && objc_msgSend(v19, "conformsToProtocol:", &unk_1EEE78A10))
          {
            v20 = v19;
            if (objc_msgSend(v20, "isSaveable"))
              objc_msgSend(v20, "saveAndDismissWithForce:", 0);

          }
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

    if (!-[EKCalendarItemEditor hasUnsavedChanges](self, "hasUnsavedChanges")
      && !-[EKCalendarItem isNew](self->_calendarItem, "isNew"))
    {
      -[EKCalendarItemEditor completeWithAction:animated:](self, "completeWithAction:animated:", 0, 1);
      if (!v11)
        goto LABEL_41;
LABEL_39:
      if (UIKeyboardAutomaticIsOnScreen())
        UIKeyboardOrderOutAutomatic();
      goto LABEL_41;
    }
    v21 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke;
    aBlock[3] = &unk_1E6018838;
    aBlock[4] = self;
    v30 = v5;
    v22 = (void (**)(_QWORD))_Block_copy(aBlock);
    v23 = -[EKCalendarItem isDetached](self->_calendarItem, "isDetached");
    v24 = -[EKCalendarItemEditor hasAttachmentChanges](self, "hasAttachmentChanges");
    if (-[EKCalendarItemEditor hasModifiedAttendeesFromSuggestion](self, "hasModifiedAttendeesFromSuggestion"))
    {
      v27[0] = v21;
      v27[1] = 3221225472;
      v27[2] = __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke_2;
      v27[3] = &unk_1E601C3F0;
      v27[4] = self;
      v28 = v22;
      v25 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:viewController:withCompletionHandler:](EKUISendInviteAlertController, "presentInviteAlertWithOptions:viewController:withCompletionHandler:", 16, self, v27);

      goto LABEL_38;
    }
    if ((-[EKCalendarItem isNew](self->_calendarItem, "isNew") & 1) != 0
      || !-[EKCalendarItem isOrWasPartOfRecurringSeries](self->_calendarItem, "isOrWasPartOfRecurringSeries"))
    {
      goto LABEL_37;
    }
    if ((v23 & v24) == 1)
      goto LABEL_36;
    if (((-[EKCalendarItem requiresDetach](self->_calendarItem, "requiresDetach") & 1) != 0
       || -[EKCalendarItem isOrWasPartOfRecurringSeries](self->_calendarItem, "isOrWasPartOfRecurringSeries"))&& -[EKCalendarItem allowsSpansOtherThanThisEvent](self->_calendarItem, "allowsSpansOtherThanThisEvent"))
    {
      -[EKCalendarItemEditor _presentDetachSheetForEvent:saveAttachments:withContinueBlock:](self, "_presentDetachSheetForEvent:saveAttachments:withContinueBlock:", self->_calendarItem, -[EKCalendarItemEditor attachmentsModifiedOnRecurrence](self, "attachmentsModifiedOnRecurrence"), v22);
      goto LABEL_38;
    }
    if (-[EKCalendarItemEditor attachmentsModifiedOnRecurrence](self, "attachmentsModifiedOnRecurrence"))
    {
LABEL_36:
      -[EKCalendarItemEditor attachmentsModifiedEvent](self, "attachmentsModifiedEvent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKCalendarItemEditor _presentAttachmentRecurrenceSheetForEvent:withContinueBlock:](self, "_presentAttachmentRecurrenceSheetForEvent:withContinueBlock:", v26, v22);

    }
    else
    {
LABEL_37:
      -[EKCalendarItemEditor _performSave:animated:](self, "_performSave:animated:", 0, 1);
      v22[2](v22);
    }
LABEL_38:

    if (!v11)
      goto LABEL_41;
    goto LABEL_39;
  }
LABEL_41:

}

uint64_t __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "attemptDisplayReviewPrompt");
}

uint64_t __47__EKCalendarItemEditor_done_withContinueBlock___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;

  if (!a2)
  {
    v2 = result;
    objc_msgSend(*(id *)(result + 32), "_performSave:animated:", 0, 1);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  return result;
}

- (void)completeAndSave
{
  -[EKCalendarItemEditor done:](self, "done:", 0);
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  -[EKCalendarItemEditor done:withContinueBlock:](self, "done:withContinueBlock:", 0, a3);
}

- (BOOL)willPresentDialogOnSave
{
  return -[EKCalendarItem requiresDetach](self->_calendarItem, "requiresDetach")
      && (-[EKCalendarItem allowsSpansOtherThanThisEvent](self->_calendarItem, "allowsSpansOtherThanThisEvent") & 1) != 0
      || -[EKCalendarItem isOrWasPartOfRecurringSeries](self->_calendarItem, "isOrWasPartOfRecurringSeries")&& ((-[UIBarButtonItem isEnabled](self->_doneButton, "isEnabled") & 1) != 0|| -[EKCalendarItemEditor isTextEditing](self, "isTextEditing"));
}

- (BOOL)hasUnsavedChanges
{
  int v3;
  EKCalendarItem *calendarItem;
  void *v5;
  int v6;
  void *v8;
  void *v9;

  v3 = -[EKCalendarItem isNew](self->_calendarItem, "isNew");
  calendarItem = self->_calendarItem;
  if (!v3)
    return -[EKCalendarItem hasUnsavedChanges](calendarItem, "hasUnsavedChanges");
  -[EKCalendarItem title](calendarItem, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    -[EKCalendarItem location](self->_calendarItem, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      LOBYTE(v6) = 1;
    }
    else
    {
      -[EKCalendarItem changeSet](self->_calendarItem, "changeSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "isEffectivelyEqual:", self->_originalChangeSet) ^ 1;

    }
  }

  return v6;
}

- (void)resignCurrentEditItemFirstResponder
{
  id v2;

  -[EKCalendarItemEditItem selectedResponder](self->_currentEditItem, "selectedResponder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resignFirstResponder");

}

- (BOOL)saveWithSpan:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  EKCalendarItemEditItem *currentEditItem;

  v4 = a4;
  currentEditItem = self->_currentEditItem;
  if (currentEditItem)
    -[EKCalendarItemEditItem saveAndDismissWithForce:](currentEditItem, "saveAndDismissWithForce:", 1);
  return -[EKCalendarItemEditor _performSave:animated:](self, "_performSave:animated:", a3, v4);
}

- (void)completeWithAction:(int64_t)a3 animated:(BOOL)a4
{
  -[EKCalendarItemEditor _completeWithAction:animated:notify:](self, "_completeWithAction:animated:notify:", a3, a4, 1);
}

- (void)_completeWithAction:(int64_t)a3 animated:(BOOL)a4 notify:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id WeakRetained;
  char v10;
  id v11;
  void *v12;
  EKUIRecurrenceAlertController *recurrenceAlertController;

  v5 = a5;
  v6 = a4;
  -[EKCalendarItemEditor _pinKeyboard:](self, "_pinKeyboard:", 0);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      objc_msgSend(v11, "editor:didCompleteWithAction:", self, a3);

    }
  }
  -[EKCalendarItemEditor _editItems](self, "_editItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);

  -[EKUIRecurrenceAlertController cancelAnimated:](self->_recurrenceAlertController, "cancelAnimated:", v6);
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = 0;

}

- (BOOL)shouldDisplayEditItem:(id)a3
{
  return objc_msgSend(a3, "shouldAppear");
}

- (void)_configureVisibleItems
{
  void *v3;
  NSArray *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  NSArray *currentItems;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItemEditor _editItems](self, "_editItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[EKCalendarItemEditor shouldDisplayEditItem:](self, "shouldDisplayEditItem:", v10, (_QWORD)v14))
        {
          -[EKCalendarItem calendar](self->_calendarItem, "calendar");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "configureForCalendarConstraints:", v11);

          if (v12)
            -[NSArray addObject:](v4, "addObject:", v10);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  currentItems = self->_currentItems;
  self->_currentItems = v4;

}

- (void)_setCalendarItemOnEditItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[EKCalendarItemEditor _editItems](self, "_editItems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setCalendarItem:store:", self->_calendarItem, self->_store);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)prepareEditItems
{
  void *v3;
  id v4;

  -[EKCalendarItemEditor _editItems](self, "_editItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, self);

  -[EKCalendarItemEditor _setCalendarItemOnEditItems](self, "_setCalendarItemOnEditItems");
  -[EKCalendarItemEditor _configureVisibleItems](self, "_configureVisibleItems");
  -[EKCalendarItemEditor tableView](self, "tableView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadData");

}

- (void)attemptDisplayReviewPrompt
{
  EKCalendarItemEditorDelegate **p_editorDelegate;
  id WeakRetained;
  char v4;
  id v5;

  p_editorDelegate = &self->_editorDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_editorDelegate);
    objc_msgSend(v5, "attemptDisplayReviewPrompt");

  }
}

- (id)preferredTitle
{
  return 0;
}

+ (id)defaultTitleForCalendarItem
{
  return 0;
}

- (void)setupForEvent
{
  EKCalendarItemEditorDelegate **p_editorDelegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  p_editorDelegate = &self->_editorDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)p_editorDelegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)p_editorDelegate);
      objc_msgSend(v8, "editor:prepareCalendarItemForEdit:", self, self->_calendarItem);

    }
  }
  -[EKCalendarItemEditor prepareEditItems](self, "prepareEditItems");
  -[EKCalendarItem isNew](self->_calendarItem, "isNew");
  v9 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[EKCalendarItemEditor tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v11 = (void *)objc_msgSend(v9, "initWithFrame:", 0.0, 0.0);
  -[EKCalendarItemEditor tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTableFooterView:", v11);

  -[EKCalendarItemEditor _copyEventForPossibleRevert](self, "_copyEventForPossibleRevert");
  if (-[EKCalendarItem isNew](self->_calendarItem, "isNew"))
  {
    -[EKCalendarItem title](self->_calendarItem, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (!v14)
    {
      if (self->_hasAppeared)
      {
        if (!self->_accessDeniedView)
          -[EKCalendarItemEditor focus:select:](self, "focus:select:", 1, 0);
      }
      else
      {
        self->_giveTitleCellKeyboardFocus = 1;
      }
    }
  }
}

- (void)_refreshDataAndDismissViewControllerIfDeleted
{
  int v3;

  if (self->_calendarItem)
  {
    v3 = -[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded");
    if ((-[EKCalendarItem isNew](self->_calendarItem, "isNew") & 1) != 0
      || (-[EKCalendarItem refreshIfRefreshableAndNotify:](self->_calendarItem, "refreshIfRefreshableAndNotify:", 1) & 1) != 0)
    {
      if (v3)
      {
        if (-[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded"))
          -[EKCalendarItemEditor setupForEvent](self, "setupForEvent");
      }
    }
    else
    {
      -[EKCalendarItemEditor cancelEditingWithDelegateNotification:forceCancel:](self, "cancelEditingWithDelegateNotification:forceCancel:", 1, 1);
    }
  }
}

- (void)_updateAccessDeniedViewWithNewStatus:(int64_t)a3
{
  int64_t lastAuthorizationStatus;
  _UIAccessDeniedView *accessDeniedView;
  _UIAccessDeniedView *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  if (-[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded"))
  {
    lastAuthorizationStatus = a3;
    if (self->_shouldOverrideAuthorizationStatus)
      lastAuthorizationStatus = self->_lastAuthorizationStatus;
    accessDeniedView = self->_accessDeniedView;
    if ((unint64_t)(lastAuthorizationStatus - 3) > 1)
    {
      if (!accessDeniedView)
      {
        -[EKCalendarItemEditor firstResponder](self, "firstResponder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resignFirstResponder");

        -[EKCalendarItemEditor view](self, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemEditor accessDeniedView](self, "accessDeniedView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v12);

        -[EKCalendarItemEditor view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemEditor accessDeniedView](self, "accessDeniedView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bringSubviewToFront:", v14);

        if (a3 == 1)
        {
          -[EKCalendarItemEditor accessDeniedView](self, "accessDeniedView");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setMessage:", CFSTR(" "));

        }
        -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", 0);
        -[EKCalendarItemEditor navigationController](self, "navigationController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v16, "popToRootViewControllerAnimated:", 1);

        -[EKCalendarItemEditor contentScrollView](self, "contentScrollView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v8;
        v9 = 0;
        goto LABEL_12;
      }
    }
    else if (accessDeniedView)
    {
      -[_UIAccessDeniedView removeFromSuperview](accessDeniedView, "removeFromSuperview");
      v7 = self->_accessDeniedView;
      self->_accessDeniedView = 0;

      -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", -[EKCalendarItemEditor _canEnableDoneButton](self, "_canEnableDoneButton"));
      -[EKCalendarItemEditor contentScrollView](self, "contentScrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v8;
      v9 = 1;
LABEL_12:
      objc_msgSend(v8, "setScrollEnabled:", v9);

    }
  }
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  CGSize result;

  -[EKCalendarItemEditor tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeThatFits:", 2147483650.0, 2147483650.0);
  v5 = v4;
  v7 = v6;

  -[EKCalendarItemEditor navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[EKCalendarItemEditor view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v12);

  if ((_DWORD)v8)
    v5 = EKUIContainedControllerIdealWidth();
  v13 = v7 + v11;
  v14 = v5;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_pinKeyboard:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  -[EKCalendarItemEditor _popoverController](self, "_popoverController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v3)
      -[EKCalendarItemEditor _beginPinningInputViews](self, "_beginPinningInputViews");
    else
      -[EKCalendarItemEditor _endPinningInputViews](self, "_endPinningInputViews");
  }
}

- (_UIAccessDeniedView)accessDeniedView
{
  id v3;
  void *v4;
  _UIAccessDeniedView *v5;
  _UIAccessDeniedView *accessDeniedView;
  unint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  if (!self->_accessDeniedView)
  {
    v3 = objc_alloc(MEMORY[0x1E0DC3FE0]);
    -[EKCalendarItemEditor view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v5 = (_UIAccessDeniedView *)objc_msgSend(v3, "initWithFrame:");
    accessDeniedView = self->_accessDeniedView;
    self->_accessDeniedView = v5;

    -[_UIAccessDeniedView setAutoresizingMask:](self->_accessDeniedView, "setAutoresizingMask:", 18);
    v7 = -[EKCalendarItemEditor entityType](self, "entityType");
    EventKitUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 1)
      v10 = CFSTR("This app does not have access to your reminders.");
    else
      v10 = CFSTR("This app does not have access to your calendars.");
    objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E601DFA8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIAccessDeniedView setTitle:](self->_accessDeniedView, "setTitle:", v11);

  }
  return self->_accessDeniedView;
}

- (void)_setWantsToEnableDoneButton:(BOOL)a3
{
  if (a3)
    *(_QWORD *)&a3 = -[EKCalendarItemEditor _canEnableDoneButton](self, "_canEnableDoneButton");
  -[UIBarButtonItem setEnabled:](self->_doneButton, "setEnabled:", a3);
}

- (id)_viewHierarchy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[EKCalendarItemEditor isViewLoaded](self, "isViewLoaded"))
  {
    -[EKCalendarItemEditor view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_5;
  }
  -[EKCalendarItemEditor presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_5:
    -[EKCalendarItemEditor view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[EKCalendarItemEditor presentingViewController](self, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)_addLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Add"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_doneLocalizedString
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)editItemDidStartEditing:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_currentEditItem, a3);
  if (-[EKCalendarItemEditItem isInline](self->_currentEditItem, "isInline"))
  {
    objc_msgSend(v5, "selectedResponder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemEditor setResponderToRestoreOnAppearence:](self, "setResponderToRestoreOnAppearence:", v6);

    -[EKCalendarItemEditor setVisibleSectionToRestoreOnAppearence:](self, "setVisibleSectionToRestoreOnAppearence:", -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", v5));
    -[EKCalendarItemEditor _pinKeyboard:](self, "_pinKeyboard:", -[EKCalendarItemEditItem shouldPinKeyboard](self->_currentEditItem, "shouldPinKeyboard"));
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[EKCalendarItemEditor _editItems](self, "_editItems", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "editor:didStartEditingItem:", self, v5);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)editItem:(id)a3 didSaveFromDetailViewController:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  v6 = objc_msgSend(v10, "onSaveEditorReloadBehavior");
  if (v6 == 1)
    -[EKCalendarItemEditor _configureVisibleItems](self, "_configureVisibleItems");
  v7 = objc_msgSend(v10, "onSaveEditItemsToRefresh");
  v8 = v7;
  if ((v7 & 1) != 0)
  {
    -[EKCalendarItemEditor refreshStartAndEndDates](self, "refreshStartAndEndDates");
    if ((v8 & 2) == 0)
    {
LABEL_5:
      if ((v8 & 4) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_5;
  }
  -[EKCalendarItemEditor refreshInvitees](self, "refreshInvitees");
  if ((v8 & 4) == 0)
  {
LABEL_6:
    if ((v8 & 8) == 0)
      goto LABEL_7;
    goto LABEL_20;
  }
LABEL_19:
  -[EKCalendarItemEditor refreshLocation](self, "refreshLocation");
  if ((v8 & 8) == 0)
  {
LABEL_7:
    if ((v8 & 0x10) == 0)
      goto LABEL_8;
    goto LABEL_21;
  }
LABEL_20:
  -[EKCalendarItemEditor refreshURL](self, "refreshURL");
  if ((v8 & 0x10) == 0)
  {
LABEL_8:
    if ((v8 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_21:
  -[EKCalendarItemEditor refreshRecurrence](self, "refreshRecurrence");
  if ((v8 & 0x20) != 0)
LABEL_9:
    -[EKCalendarItemEditor refreshAttachments](self, "refreshAttachments");
LABEL_10:
  if (v6 == 1)
  {
LABEL_15:
    -[EKCalendarItemEditor tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

    goto LABEL_16;
  }
  if (!v6 && (v8 || v4))
  {
    -[EKCalendarItemEditor _configureVisibleItems](self, "_configureVisibleItems");
    goto LABEL_15;
  }
LABEL_16:
  -[EKCalendarItemEditor _updateDoneButtonState](self, "_updateDoneButtonState");

}

- (void)_updateDoneButtonState
{
  -[EKCalendarItemEditor _setWantsToEnableDoneButton:](self, "_setWantsToEnableDoneButton:", -[EKCalendarItemEditor hasUnsavedChanges](self, "hasUnsavedChanges"));
}

- (void)editItemDidEndEditing:(id)a3
{
  EKCalendarItemEditItem *v4;

  v4 = (EKCalendarItemEditItem *)a3;
  if (-[EKCalendarItemEditItem isInline](v4, "isInline"))
    -[EKCalendarItemEditItem saveAndDismissWithForce:](v4, "saveAndDismissWithForce:", 0);
  if (self->_currentEditItem == v4)
  {
    self->_currentEditItem = 0;

  }
  -[EKCalendarItemEditor setIsTextEditing:](self, "setIsTextEditing:", 0);

}

- (void)editItemTextChanged:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEE78A10)
    && objc_msgSend(v4, "isSaveable"))
  {
    -[EKCalendarItemEditor _setWantsToEnableDoneButton:](self, "_setWantsToEnableDoneButton:", 1);
  }
  else
  {
    -[EKCalendarItemEditor _updateDoneButtonState](self, "_updateDoneButtonState");
  }
  -[EKCalendarItemEditor setIsTextEditing:](self, "setIsTextEditing:", 1);

}

- (void)editItemWantsInjectableViewControllerToBeShown:(id)a3
{
  objc_msgSend(a3, "editor:requestsInjectableViewControllerToBeShownForSubitem:", self, 0);
}

- (void)editItem:(id)a3 wantsKeyboardPinned:(BOOL)a4
{
  -[EKCalendarItemEditor _pinKeyboard:](self, "_pinKeyboard:", a4);
}

- (BOOL)_canEnableDoneButton
{
  _UIAccessDeniedView *accessDeniedView;
  void *v4;
  BOOL result;

  accessDeniedView = self->_accessDeniedView;
  result = (!accessDeniedView
         || (-[_UIAccessDeniedView superview](accessDeniedView, "superview"),
             v4 = (void *)objc_claimAutoreleasedReturnValue(),
             v4,
             !v4))
        && -[NSMutableSet count](self->_editItemsDisablingDoneButton, "count") == 0;
  return result;
}

- (void)editItem:(id)a3 wantsDoneButtonDisabled:(BOOL)a4
{
  id v6;
  NSMutableSet *editItemsDisablingDoneButton;
  EKCalendarItemEditor *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  editItemsDisablingDoneButton = self->_editItemsDisablingDoneButton;
  v10 = v6;
  if (a4)
  {
    -[NSMutableSet addObject:](editItemsDisablingDoneButton, "addObject:", v6);
    v8 = self;
    v9 = 0;
LABEL_7:
    -[EKCalendarItemEditor _setWantsToEnableDoneButton:](v8, "_setWantsToEnableDoneButton:", v9);
    goto LABEL_8;
  }
  if (-[NSMutableSet containsObject:](editItemsDisablingDoneButton, "containsObject:", v6))
    -[NSMutableSet removeObject:](self->_editItemsDisablingDoneButton, "removeObject:", v10);
  if (!-[NSMutableSet count](self->_editItemsDisablingDoneButton, "count"))
  {
    v8 = self;
    v9 = 1;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_tableViewWillUpdateHeights
{
  self->_isIgnoringCellHeightChange = 1;
}

- (void)_tableViewDidUpdateHeights
{
  if (self->_needsCellHeightChange)
    -[EKCalendarItemEditor performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__reallyHandleCellHeightChange, 0, 0.0);
  self->_isIgnoringCellHeightChange = 0;
}

- (void)_reallyHandleCellHeightChange
{
  id WeakRetained;
  char v4;
  id v5;
  _QWORD v6[5];

  if (self->_isIgnoringCellHeightChange)
  {
    self->_needsCellHeightChange = 1;
  }
  else
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __53__EKCalendarItemEditor__reallyHandleCellHeightChange__block_invoke;
    v6[3] = &unk_1E6018688;
    v6[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);
    self->_needsCellHeightChange = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      v5 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      objc_msgSend(v5, "editor:didChangeHeightAnimated:", self, 0);

    }
  }
}

void __53__EKCalendarItemEditor__reallyHandleCellHeightChange__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endUpdates");

}

- (void)editItem:(id)a3 performActionsOnCellAtSubitem:(unint64_t)a4 actions:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  unint64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (void (**)(id, void *))a5;
  v9 = a3;
  v10 = -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", v9);
  v11 = -[EKCalendarItemEditor firstTableRowForEditItem:](self, "firstTableRowForEditItem:", v9);

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11 + a4, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cellForRowAtIndexPath:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v13);
}

- (void)editItemWantsFooterTitlesToReload:(id)a3
{
  void *v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[EKCalendarItemEditor tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  if (v5 >= 1)
  {
    for (i = 0; i != v5; ++i)
    {
      if (-[NSArray count](self->_orderedEditItems, "count") <= i)
      {
        v9 = 0;
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_orderedEditItems, "objectAtIndexedSubscript:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "footerTitle");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v9 = 0;
        }

      }
      -[EKCalendarItemEditor tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "footerViewForSection:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v9);

    }
  }
}

- (void)editItem:(id)a3 wantsRowReload:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", a3);
  v8 = (void *)MEMORY[0x1E0CB36B0];
  v9 = objc_msgSend(v6, "row");
  v10 = objc_msgSend(v6, "section");

  objc_msgSend(v8, "indexPathForRow:inSection:", v9, v10 + v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendarItemEditor tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadRowsAtIndexPaths:withRowAnimation:", v13, 0);

}

- (int64_t)rowNumberForEditItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  NSArray *obj;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_orderedEditItems;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v16[0] = 0;
        v16[1] = v16;
        v16[2] = 0x2020000000;
        v16[3] = 0;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __45__EKCalendarItemEditor_rowNumberForEditItem___block_invoke;
        v12[3] = &unk_1E601C418;
        v12[4] = self;
        v13 = v4;
        v14 = &v21;
        v15 = v16;
        objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

        _Block_object_dispose(v16, 8);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v5);
  }

  v9 = v22[3];
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __45__EKCalendarItemEditor_rowNumberForEditItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDisplayEditItem:"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1152), "calendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "configureForCalendarConstraints:", v6);

    if (v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = *(_QWORD *)(v8 + 24);
      if (*(id *)(a1 + 40) == v10)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
        *a4 = 1;
      }
      else
      {
        *(_QWORD *)(v8 + 24) = v9 + 1;
      }
    }
  }

}

- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5
{
  -[EKCalendarItemEditor editItem:wantsRowInsertions:rowDeletions:rowReloads:](self, "editItem:wantsRowInsertions:rowDeletions:rowReloads:", a3, a4, a5, 0);
}

- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5 rowReloads:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id WeakRetained;
  char v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  int64_t v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  int64_t v33;
  unint64_t v34;
  _QWORD v35[4];
  id v36;
  int64_t v37;
  unint64_t v38;

  v26 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[EKCalendarItemEditor tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isReloading") & 1) == 0)
  {
    v14 = -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", v26);
    v15 = -[EKCalendarItemEditor firstTableRowForEditItem:](self, "firstTableRowForEditItem:", v26);
    -[EKCalendarItemEditor _tableViewWillUpdateHeights](self, "_tableViewWillUpdateHeights");
    objc_msgSend(v13, "beginUpdates");
    v16 = 0x1E0C99000;
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke;
      v35[3] = &unk_1E601C440;
      v37 = v15;
      v38 = v14;
      v36 = v17;
      v18 = v17;
      objc_msgSend(v10, "enumerateIndexesUsingBlock:", v35);
      objc_msgSend(v13, "insertRowsAtIndexPaths:withRowAnimation:", v18, 0);

      v16 = 0x1E0C99000uLL;
    }
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(*(id *)(v16 + 3560), "arrayWithCapacity:", objc_msgSend(v11, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_2;
      v31[3] = &unk_1E601C440;
      v33 = v15;
      v34 = v14;
      v32 = v19;
      v20 = v19;
      objc_msgSend(v11, "enumerateIndexesUsingBlock:", v31);
      objc_msgSend(v13, "deleteRowsAtIndexPaths:withRowAnimation:", v20, 0);

    }
    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(*(id *)(v16 + 3560), "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_3;
      v27[3] = &unk_1E601C440;
      v29 = v15;
      v30 = v14;
      v28 = v21;
      v22 = v21;
      objc_msgSend(v12, "enumerateIndexesUsingBlock:", v27);
      objc_msgSend(v13, "reloadRowsAtIndexPaths:withRowAnimation:", v22, 0);

    }
    objc_msgSend(v13, "endUpdates");
    -[EKCalendarItemEditor _tableViewDidUpdateHeights](self, "_tableViewDidUpdateHeights");
    WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      v25 = objc_loadWeakRetained((id *)&self->_editorDelegate);
      objc_msgSend(v25, "editor:didChangeHeightAnimated:", self, 1);

    }
  }

}

void __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40) + a2, *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40) + a2, *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __76__EKCalendarItemEditor_editItem_wantsRowInsertions_rowDeletions_rowReloads___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 40) + a2, *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)editItem:(id)a3 wantsRowsScrolledToVisible:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  unint64_t v11;
  int64_t v12;
  __int128 v13;
  double height;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CGRect *v24;
  _QWORD v25[8];
  uint64_t v26;
  CGRect *v27;
  uint64_t v28;
  const char *v29;
  __int128 v30;
  __int128 v31;

  v6 = a3;
  v7 = a4;
  -[EKCalendarItemEditor tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentInset");
  v10 = v9;

  if (v10 == 0.0)
  {
    v11 = -[EKCalendarItemEditor tableSectionForEditItem:](self, "tableSectionForEditItem:", v6);
    v12 = -[EKCalendarItemEditor firstTableRowForEditItem:](self, "firstTableRowForEditItem:", v6);
    v26 = 0;
    v27 = (CGRect *)&v26;
    v28 = 0x4010000000;
    v29 = "";
    v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v30 = *MEMORY[0x1E0C9D648];
    v31 = v13;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __60__EKCalendarItemEditor_editItem_wantsRowsScrolledToVisible___block_invoke;
    v25[3] = &unk_1E601C468;
    v25[6] = v12;
    v25[7] = v11;
    v25[4] = self;
    v25[5] = &v26;
    objc_msgSend(v7, "enumerateIndexesUsingBlock:", v25);
    if (!CGRectIsEmpty(v27[1]))
    {
      height = v27[1].size.height;
      -[EKCalendarItemEditor tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;
      -[EKCalendarItemEditor tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contentInset");
      v19 = height + 20.0;
      v21 = v17 - v20;

      if (v19 <= v21)
      {
        v24 = v27;
        v27[1].size.height = v19;
        v24[1].origin.y = v24[1].origin.y + -10.0;
        -[EKCalendarItemEditor tableView](self, "tableView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "scrollRectToVisible:animated:", 1, v27[1].origin.x, v27[1].origin.y, v27[1].size.width, v27[1].size.height);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", objc_msgSend(v7, "firstIndex") + v12, v11);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarItemEditor tableView](self, "tableView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "scrollToRowAtIndexPath:atScrollPosition:animated:", v22, 1, 1);

      }
    }
    _Block_object_dispose(&v26, 8);
  }

}

void __60__EKCalendarItemEditor_editItem_wantsRowsScrolledToVisible___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  double v4;
  CGFloat x;
  double v6;
  CGFloat y;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  CGFloat *v12;
  id v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", *(_QWORD *)(a1 + 48) + a2, *(_QWORD *)(a1 + 56));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rectForRowAtIndexPath:", v13);
  x = v4;
  y = v6;
  width = v8;
  height = v10;

  if (!CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32)))
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v15 = CGRectUnion(v14, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
    x = v15.origin.x;
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
  }
  v12 = *(CGFloat **)(*(_QWORD *)(a1 + 40) + 8);
  v12[4] = x;
  v12[5] = y;
  v12[6] = width;
  v12[7] = height;

}

- (void)editItemRequiresHeightChange:(id)a3
{
  if (self->_isIgnoringCellHeightChange)
    self->_needsCellHeightChange = 1;
  else
    -[EKCalendarItemEditor _reallyHandleCellHeightChange](self, "_reallyHandleCellHeightChange", a3);
}

- (void)editItemRequiresPopoverSizeUpdate:(id)a3
{
  EKCalendarItemEditorDelegate **p_editorDelegate;
  id WeakRetained;
  char v6;
  id v7;

  p_editorDelegate = &self->_editorDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editorDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_editorDelegate);
    objc_msgSend(v7, "editor:didChangeHeightAnimated:", self, 1);

  }
}

- (id)cellWithReuseIdentifier:(id)a3 forEditItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[EKCalendarItemEditor tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)editItem:(id)a3 wantsViewControllerPresented:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[EKEditItemViewController preferredViewControllerForPresentationsFromViewController:](EKEditItemViewController, "preferredViewControllerForPresentationsFromViewController:", self);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)editItem:(id)a3 wantsViewControllerPushed:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[EKCalendarItemEditor navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v5, 1);

}

- (void)editItemWantsFirstResponderResigned:(id)a3
{
  id v3;

  -[EKCalendarItemEditor firstResponder](self, "firstResponder", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (id)_editItemAtIndexPath:(id)a3 firstRowIndex:(int64_t *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  id v14;
  int64_t *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", objc_msgSend(v5, "section"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
LABEL_3:
    v11 = 0;
    v12 = v9;
    while (1)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
      if (-[NSArray containsObject:](self->_currentItems, "containsObject:", v13))
      {
        v9 = objc_msgSend(v13, "numberOfSubitems") + v12;
        if (objc_msgSend(v5, "row") < v9)
        {
          v14 = v13;
          v15 = a4;
          *a4 = v12;

          if (v14)
            goto LABEL_18;
          goto LABEL_17;
        }
      }
      else
      {
        v9 = v12;
      }
      ++v11;
      v12 = v9;
      if (v8 == v11)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
  }
  v9 = 0;
LABEL_16:

  v12 = v9;
  v15 = a4;
LABEL_17:
  objc_msgSend(v6, "lastObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  *v15 = v12;
LABEL_18:

  return v14;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t v3;
  NSObject *v4;
  int v6;
  int64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[NSArray count](self->_orderedEditItems, "count", a3);
  v4 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "Number of sections: [%ld]", (uint8_t *)&v6, 0xCu);
  }
  return v3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  int64_t v20;
  __int16 v21;
  int64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[NSArray containsObject:](self->_currentItems, "containsObject:", v12))
          v9 += objc_msgSend(v12, "numberOfSubitems");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v13 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v20 = a4;
    v21 = 2048;
    v22 = v9;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Number of rows in section [%ld]: [%ld]", buf, 0x16u);
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v6 = a3;
  v13 = 0;
  v7 = a4;
  -[EKCalendarItemEditor _editItemAtIndexPath:firstRowIndex:](self, "_editItemAtIndexPath:firstRowIndex:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "row");

  objc_msgSend(v8, "cellForSubitemAtIndex:inEditor:", v9 - v13, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

  }
  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "rowHeight");
  v9 = v8;
  objc_msgSend(v7, "bounds");
  v11 = v10;
  objc_msgSend(v7, "_backgroundInset");
  v13 = v12;

  v18 = 0;
  -[EKCalendarItemEditor _editItemAtIndexPath:firstRowIndex:](self, "_editItemAtIndexPath:firstRowIndex:", v6, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "row");

  objc_msgSend(v14, "defaultCellHeightForSubitemAtIndex:forWidth:", v15 - v18, v11 + v13 * -2.0);
  if (v16 > 0.0)
    v9 = v16;

  return v9;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v11;

  v5 = a4;
  v11 = 0;
  -[EKCalendarItemEditor _editItemAtIndexPath:firstRowIndex:](self, "_editItemAtIndexPath:firstRowIndex:", v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");
  v8 = objc_msgSend(v6, "editor:canSelectSubitem:", self, v7 - v11);
  v9 = 0;
  if (v8)
    v9 = v5;

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EKCalendarItemEditItem *v9;
  uint64_t v10;
  uint64_t v11;
  EKCalendarItemEditItem *currentEditItem;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);
  objc_msgSend(v6, "cellForRowAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "selectionStyle"))
  {
    v16 = 0;
    -[EKCalendarItemEditor _editItemAtIndexPath:firstRowIndex:](self, "_editItemAtIndexPath:firstRowIndex:", v7, &v16);
    v9 = (EKCalendarItemEditItem *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "row");
    v11 = v10 - v16;
    currentEditItem = self->_currentEditItem;
    if (currentEditItem)
      v13 = v9 == currentEditItem;
    else
      v13 = 1;
    if (v13)
    {
      if (-[EKCalendarItemEditItem editor:shouldClearSelectionFromSubitem:](v9, "editor:shouldClearSelectionFromSubitem:", self, v11))
      {
        objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
      }
    }
    else if (!-[EKCalendarItemEditItem saveAndDismissWithForce:](currentEditItem, "saveAndDismissWithForce:", 0))
    {
      objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);

      goto LABEL_14;
    }
    -[EKCalendarItemEditor _popoverController](self, "_popoverController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[EKCalendarItemEditItem selectedResponder](self->_currentEditItem, "selectedResponder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "resignFirstResponder");

    }
    -[EKCalendarItemEditItem editor:didSelectSubitem:](v9, "editor:didSelectSubitem:", self, v11);

  }
  -[EKCalendarItemEditor setResponderToRestoreOnAppearence:](self, "setResponderToRestoreOnAppearence:", 0);
LABEL_14:

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = 0;
  v5 = a4;
  -[EKCalendarItemEditor _editItemAtIndexPath:firstRowIndex:](self, "_editItemAtIndexPath:firstRowIndex:", v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "editor:didDeselectSubitem:", self, v7 - v8);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  _BOOL4 v5;
  double result;

  if (-[EKCalendarItemEditor tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3, a4) <= 0)
    v4 = 0.0;
  else
    v4 = *MEMORY[0x1E0DC53D8];
  v5 = EKUIUnscaledCatalyst();
  result = 5.0;
  if (!v5)
    return v4;
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (-[EKCalendarItemEditor tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3, a4))
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D78]), "initWithReuseIdentifier:", CFSTR("Default"));
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
  {
    v10 = 0;
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (-[NSArray containsObject:](self->_currentItems, "containsObject:", v13))
      {
        v14 = v13;

        v10 = v14;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v9);
  if (!v10)
    goto LABEL_13;
  objc_msgSend(v10, "headerTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v15;
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

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v9 = 0.0;
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[NSArray containsObject:](self->_currentItems, "containsObject:", v14))
        {
          v15 = v14;

          v11 = v15;
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
    if (v11)
    {
      objc_msgSend(v6, "bounds");
      objc_msgSend(v11, "footerHeightForWidth:", v16);
      if (v17 == 0.0)
        v9 = *MEMORY[0x1E0DC53D8];
      else
        v9 = v17;
    }
  }
  else
  {
    v11 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
  {
    v10 = 0;
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (-[NSArray containsObject:](self->_currentItems, "containsObject:", v13))
      {
        v14 = v13;

        v10 = v14;
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v9);
  if (!v10)
    goto LABEL_13;
  objc_msgSend(v10, "footerTitle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v15;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (EKUICatalyst())
  {
    objc_msgSend(v9, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSArray objectAtIndex:](self->_orderedEditItems, "objectAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (-[NSArray containsObject:](self->_currentItems, "containsObject:", v13))
        {
          v14 = v13;

          v10 = v14;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }
  v15 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  if (v10)
  {
    objc_msgSend(v10, "footerView");
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v16;
  }
  if (v15 && EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBackgroundColor:", v17);

  }
  return v15;
}

- (void)deleteClicked:(id)a3
{
  id v4;
  EKCalendarItem *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  EKUIRecurrenceAlertController *v17;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD v19[5];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = self->_calendarItem;
  else
    v5 = 0;
  objc_msgSend(v4, "sourceViewForPopover");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceViewForPopover");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[EKCalendarItemEditor _nameForDeleteButton](self, "_nameForDeleteButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __38__EKCalendarItemEditor_deleteClicked___block_invoke;
  v19[3] = &unk_1E60197E8;
  v19[4] = self;
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", 0, self, v6, v5, v16, v19, v9, v11, v13, v15);
  v17 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v17;

}

void __38__EKCalendarItemEditor_deleteClicked___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2 <= 2)
    objc_msgSend(*(id *)(a1 + 32), "_performDelete:", a2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1072);
  *(_QWORD *)(v3 + 1072) = 0;

}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v12 = 0;
  v5 = a4;
  -[EKCalendarItemEditor _editItemAtIndexPath:firstRowIndex:](self, "_editItemAtIndexPath:firstRowIndex:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "trailingSwipeActionsConfigurationForRowAtIndex:", v7 - v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0DC3D08];
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithActions:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_performDelete:(int64_t)a3
{
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  EKEventStore *store;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[EKCalendarItemEditor calendarItem](self, "calendarItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CAA068], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemEditor calendarItem](self, "calendarItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleEventDeletion:", v9);

    -[EKCalendarItemEditor editorDelegate](self, "editorDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "editorForCalendarItemEditor:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKCalendarItemEditor calendarItem](self, "calendarItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v13 = objc_msgSend(v11, "deleteEvent:span:error:", v12, a3, &v24);
    v14 = v24;

    if ((v13 & 1) != 0)
      goto LABEL_13;
    goto LABEL_7;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemEditor.m"), 1530, CFSTR("Span should never be anything but 'this' for reminders"));

  }
  store = self->_store;
  -[EKCalendarItemEditor calendarItem](self, "calendarItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v17 = -[EKEventStore removeReminder:commit:error:](store, "removeReminder:commit:error:", v16, 1, &v23);
  v14 = v23;

  if (!v17)
  {
LABEL_7:
    v18 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v14;
      _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_ERROR, "Remove failed: %@", buf, 0xCu);
    }
    objc_msgSend(v14, "domain");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 == (void *)*MEMORY[0x1E0CA9E60])
    {
      v21 = objc_msgSend(v14, "code");

      if (v21 == 1010)
        -[EKEventStore rollback](self->_store, "rollback");
    }
    else
    {

    }
  }
LABEL_13:
  -[EKCalendarItemEditor completeWithAction:animated:](self, "completeWithAction:animated:", 2, 1);

}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  if (!-[EKCalendarItemEditor hasUnsavedChanges](self, "hasUnsavedChanges")
    && !-[EKCalendarItem isNew](self->_calendarItem, "isNew"))
  {
    goto LABEL_7;
  }
  -[EKCalendarItemEditor calendarItem](self, "calendarItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    objc_msgSend((id)objc_opt_class(), "defaultTitleForCalendarItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarItemEditor calendarItem](self, "calendarItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

  }
  v24 = 0;
  v14 = -[EKCalendarItemEditor saveCalendarItemWithSpan:error:](self, "saveCalendarItemWithSpan:error:", a3, &v24);
  v15 = v24;
  v16 = v15;
  if (v14)
  {

LABEL_7:
    v17 = 1;
    -[EKCalendarItemEditor completeWithAction:animated:](self, "completeWithAction:animated:", 1, v4);
    return v17;
  }
  v18 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v16;
    _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_ERROR, "Calendar: unable to save: %@", buf, 0xCu);
  }
  if (!v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[EKCalendarItemEditor defaultAlertTitle](self, "defaultAlertTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PresentValidationAlertWithDefaultTitle(self, v16, v19);

    objc_msgSend(v16, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20 == (void *)*MEMORY[0x1E0CA9E60])
    {
      v22 = objc_msgSend(v16, "code");

      if (v22 == 1010)
        -[EKEventStore rollback](self->_store, "rollback");
    }
    else
    {

    }
  }

  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_editItems;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "tableViewDidScroll", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_presentAttachmentRecurrenceSheetForEvent:(id)a3 withContinueBlock:(id)a4
{
  id v6;
  id v7;
  UIBarButtonItem *doneButton;
  id v9;
  id v10;
  EKUIRecurrenceAlertController *v11;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  doneButton = self->_doneButton;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__EKCalendarItemEditor__presentAttachmentRecurrenceSheetForEvent_withContinueBlock___block_invoke;
  v13[3] = &unk_1E601C490;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  +[EKUIRecurrenceAlertController presentAttachmentAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentAttachmentAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", 0, self, doneButton, v10, v13);
  v11 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v11;

}

void __84__EKCalendarItemEditor__presentAttachmentRecurrenceSheetForEvent_withContinueBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  if (a2 == 2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1072);
    *(_QWORD *)(v3 + 1072) = 0;

    objc_msgSend(*(id *)(a1 + 32), "editorDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editorForCalendarItemEditor:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "saveEvent:span:error:", *(_QWORD *)(a1 + 40), 1, 0);
    objc_msgSend(*(id *)(a1 + 32), "_performSave:animated:", 0, 1);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 1072);
  *(_QWORD *)(v7 + 1072) = 0;

}

- (void)_presentDetachSheetForEvent:(id)a3 saveAttachments:(BOOL)a4 withContinueBlock:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  UIBarButtonItem *doneButton;
  id v13;
  EKUIRecurrenceAlertController *v14;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendarItemEditor.m"), 1629, CFSTR("Trying to detach something that's not an event: %@"), v9);

  }
  if (v6)
    v11 = 8;
  else
    v11 = 0;
  doneButton = self->_doneButton;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke;
  v17[3] = &unk_1E601C4E0;
  v18 = v10;
  v19 = v11;
  v17[4] = self;
  v13 = v10;
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", v11, self, doneButton, v9, v17);
  v14 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v14;

}

void __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke(_QWORD *a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD aBlock[5];
  id v11;
  uint64_t v12;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[2] = __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke_2;
  aBlock[3] = &unk_1E601C4B8;
  v4 = (void *)a1[5];
  v5 = a1[4];
  v12 = a1[6];
  aBlock[4] = v5;
  aBlock[1] = 3221225472;
  v11 = v4;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (a2 <= 2)
    (*((void (**)(void *, unint64_t))v6 + 2))(v6, a2);
  v8 = a1[4];
  v9 = *(void **)(v8 + 1072);
  *(_QWORD *)(v8 + 1072) = 0;

}

uint64_t __86__EKCalendarItemEditor__presentDetachSheetForEvent_saveAttachments_withContinueBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  if ((*(_BYTE *)(a1 + 48) & 8) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "editorDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "editorForCalendarItemEditor:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "attachmentsModifiedEvent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "saveEvent:span:error:", v6, 1, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "_performSave:animated:", a2, 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)canPerformSaveKeyCommand
{
  return -[UIBarButtonItem isEnabled](self->_doneButton, "isEnabled");
}

- (void)handleCloseKeyCommand
{
  -[EKCalendarItemEditor cancel:](self, "cancel:", 0);
}

- (void)handleSaveKeyCommand
{
  if (-[EKCalendarItemEditor canPerformSaveKeyCommand](self, "canPerformSaveKeyCommand"))
    -[EKCalendarItemEditor done:](self, "done:", 0);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  objc_super v5;

  if (sel_handleSaveKeyCommand == a3)
    return -[EKCalendarItemEditor canPerformSaveKeyCommand](self, "canPerformSaveKeyCommand");
  v5.receiver = self;
  v5.super_class = (Class)EKCalendarItemEditor;
  return -[EKCalendarItemEditor canPerformAction:withSender:](&v5, sel_canPerformAction_withSender_);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)navigationItem
{
  void *v2;
  void *v3;

  -[EKCalendarItemEditor parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)title
{
  void *v2;
  void *v3;

  -[EKCalendarItemEditor parentViewController](self, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendarItemEditor parentViewController](self, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (EKCalendarItemEditorDelegate)editorDelegate
{
  return (EKCalendarItemEditorDelegate *)objc_loadWeakRetained((id *)&self->_editorDelegate);
}

- (void)setEditorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editorDelegate, a3);
}

- (EKEventStore)store
{
  return self->_store;
}

- (EKCalendarItem)calendarItem
{
  return self->_calendarItem;
}

- (UIResponder)responderToRestoreOnAppearence
{
  return self->_responderToRestoreOnAppearence;
}

- (void)setResponderToRestoreOnAppearence:(id)a3
{
  objc_storeStrong((id *)&self->_responderToRestoreOnAppearence, a3);
}

- (unint64_t)visibleSectionToRestoreOnAppearence
{
  return self->_visibleSectionToRestoreOnAppearence;
}

- (void)setVisibleSectionToRestoreOnAppearence:(unint64_t)a3
{
  self->_visibleSectionToRestoreOnAppearence = a3;
}

- (BOOL)showsTimeZone
{
  return self->_showsTimeZone;
}

- (void)setShowsTimeZone:(BOOL)a3
{
  self->_showsTimeZone = a3;
}

- (EKCalendarItemEditItem)currentEditItem
{
  return (EKCalendarItemEditItem *)objc_getProperty(self, a2, 1080, 1);
}

- (BOOL)timeImplicitlySet
{
  return self->_timeImplicitlySet;
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  self->_timeImplicitlySet = a3;
}

- (BOOL)isTextEditing
{
  return self->_isTextEditing;
}

- (void)setIsTextEditing:(BOOL)a3
{
  self->_isTextEditing = a3;
}

- (BOOL)pendingVideoConference
{
  return self->_pendingVideoConference;
}

- (void)setPendingVideoConference:(BOOL)a3
{
  self->_pendingVideoConference = a3;
}

- (BOOL)hasModifiedAttendeesFromSuggestion
{
  return self->_hasModifiedAttendeesFromSuggestion;
}

- (void)setHasModifiedAttendeesFromSuggestion:(BOOL)a3
{
  self->_hasModifiedAttendeesFromSuggestion = a3;
}

- (unint64_t)calendarItemCreationMethod
{
  return self->_calendarItemCreationMethod;
}

- (void)setCalendarItemCreationMethod:(unint64_t)a3
{
  self->_calendarItemCreationMethod = a3;
}

- (void)setAccessDeniedView:(id)a3
{
  objc_storeStrong((id *)&self->_accessDeniedView, a3);
}

- (EKChangeSet)originalChangeSet
{
  return self->_originalChangeSet;
}

- (void)setOriginalChangeSet:(id)a3
{
  objc_storeStrong((id *)&self->_originalChangeSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalChangeSet, 0);
  objc_storeStrong((id *)&self->_accessDeniedView, 0);
  objc_storeStrong((id *)&self->_responderToRestoreOnAppearence, 0);
  objc_storeStrong((id *)&self->_calendarItem, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_editorDelegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_editItemsDisablingDoneButton, 0);
  objc_storeStrong((id *)&self->_currentEditItem, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_currentItems, 0);
  objc_storeStrong(&self->_revertState, 0);
  objc_storeStrong((id *)&self->_orderedEditItems, 0);
  objc_storeStrong((id *)&self->_editItems, 0);
}

- (id)_editItems
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)_orderedEditItems
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (BOOL)saveCalendarItemWithSpan:(int64_t)a3 error:(id *)a4
{
  BOOL result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (BOOL)attachmentsModifiedOnRecurrence
{
  BOOL result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)attachmentsModifiedEvent
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (BOOL)hasAttachmentChanges
{
  BOOL result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)defaultAlertTitle
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)notificationNamesForLocaleChange
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (unint64_t)entityType
{
  unint64_t result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (void)_copyEventForPossibleRevert
{
  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
}

- (void)_revertEvent
{
  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
}

- (id)_nameForDeleteButton
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

- (id)_viewForSheet
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2();
  return result;
}

@end
