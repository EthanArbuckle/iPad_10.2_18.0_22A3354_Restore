@implementation EKEventEditViewControllerModernImpl

- (EKEventEditViewControllerModernImpl)init
{
  EKEventEditViewControllerModernImpl *v2;
  uint64_t v3;
  CUIKEventEditViewControllerManager *vcManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventEditViewControllerModernImpl;
  v2 = -[EKEventEditViewControllerModernImpl init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D0CD60]), "initWithDelegate:", v2);
    vcManager = v2->_vcManager;
    v2->_vcManager = (CUIKEventEditViewControllerManager *)v3;

  }
  return v2;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
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
  objc_super v24;
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)EKEventEditViewControllerModernImpl;
  -[EKEventEditViewControllerModernImpl loadView](&v24, sel_loadView);
  -[CUIKEventEditViewControllerManager viewController](self->_vcManager, "viewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerModernImpl addChildViewController:](self, "addChildViewController:", v23);
  objc_msgSend(v23, "didMoveToParentViewController:", self);
  objc_msgSend(v23, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventEditViewControllerModernImpl view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  v15 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventEditViewControllerModernImpl view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v19;
  -[EKEventEditViewControllerModernImpl view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v14;
  -[EKEventEditViewControllerModernImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v8;
  -[EKEventEditViewControllerModernImpl view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bottomAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v13);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventEditViewControllerModernImpl;
  -[EKEventEditViewControllerModernImpl viewDidLoad](&v3, sel_viewDidLoad);
  -[EKEventEditViewControllerModernImpl _updateNavButtonsWithSpacing](self, "_updateNavButtonsWithSpacing");
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

- (void)_updateNavButtonsWithSpacing
{
  UIBarButtonItem *v3;
  UIBarButtonItem *cancelButton;
  char v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *doneButton;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!self->_cancelButton)
  {
    v3 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel);
    cancelButton = self->_cancelButton;
    self->_cancelButton = v3;

  }
  if (!self->_doneButton)
  {
    v5 = -[EKEvent isNew](self->_event, "isNew");
    v6 = (void *)objc_opt_class();
    if ((v5 & 1) != 0)
      objc_msgSend(v6, "_addLocalizedString");
    else
      objc_msgSend(v6, "_doneLocalizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", v7, 2, self, sel__done);
    doneButton = self->_doneButton;
    self->_doneButton = v8;

  }
  v15[0] = self->_cancelButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerModernImpl navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLeftBarButtonItems:", v10);

  v14 = self->_doneButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerModernImpl navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItems:", v12);

}

- (void)_cancel
{
  EKEventEditViewDelegate **p_editViewDelegate;
  id WeakRetained;
  char v5;
  void *v6;
  id v7;

  p_editViewDelegate = &self->_editViewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_editViewDelegate);
    -[EKEventEditViewControllerModernImpl _ekEventEditViewController](self, "_ekEventEditViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventEditViewController:didCompleteWithAction:", v6, 0);

  }
}

- (void)_done
{
  EKEventEditViewDelegate **p_editViewDelegate;
  id WeakRetained;
  char v5;
  void *v6;
  id v7;

  p_editViewDelegate = &self->_editViewDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editViewDelegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)p_editViewDelegate);
    -[EKEventEditViewControllerModernImpl _ekEventEditViewController](self, "_ekEventEditViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventEditViewController:didCompleteWithAction:", v6, 1);

  }
}

- (id)_eventEditorForTestingOnly
{
  return 0;
}

- (id)confirmDismissAlertController
{
  return 0;
}

- (BOOL)hasUnsavedChanges
{
  return 0;
}

- (BOOL)willPresentDialogOnSave
{
  return 0;
}

- (void)setEvent:(id)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_storeStrong((id *)&self->_event, a3);
  if (v9 && !objc_msgSend(v9, "isNew"))
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Edit Event");
  }
  else
  {
    EventKitUIBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("New Event");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E601DFA8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventEditViewControllerModernImpl setTitle:](self, "setTitle:", v8);

}

- (BOOL)shouldRecordPrecommitEvent
{
  return 0;
}

- (id)precommitSerializedEvent
{
  return 0;
}

- (EKEvent)eventForViewControllerManager
{
  return self->_event;
}

- (void)requestLocationOrVideoCallPresentation
{
  EKLocationEditItemViewController *v3;
  EKLocationEditItemViewController *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = [EKLocationEditItemViewController alloc];
  v4 = -[EKLocationEditItemViewController initWithFrame:calendarItem:eventStore:](v3, "initWithFrame:calendarItem:eventStore:", self->_event, self->_eventStore, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[EKEditItemViewController setEditDelegate:](v4, "setEditDelegate:", self);
  -[EKEditItemViewController setModal:](v4, "setModal:", 1);
  -[EKEditItemViewController setShowsDoneButton:](v4, "setShowsDoneButton:", 0);
  -[EKLocationEditItemViewController setSupportedSearchTypes:](v4, "setSupportedSearchTypes:", 2047);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v4, sel_cancel);
  v6 = objc_alloc(MEMORY[0x1E0DC3500]);
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBarButtonItems:representativeItem:", v7, 0);

  -[EKLocationEditItemViewController navigationItem](v4, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_dci_setFixedTrailingGroup:", v8);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  -[EKEventEditViewControllerModernImpl presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  -[EKEventEditViewControllerModernImpl dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "needsSave"))
    {
      objc_msgSend(v5, "selectedLocation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEvent setStructuredLocation:](self->_event, "setStructuredLocation:", v6);
      -[UIResponder EKUI_editor](self, "EKUI_editor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "saveEvent:span:error:", self->_event, 0, 0);

    }
  }

  return 1;
}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (UIColor)editorBackgroundColor
{
  return self->editorBackgroundColor;
}

- (void)setEditorBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->editorBackgroundColor, a3);
}

- (EKEvent)event
{
  return self->_event;
}

- (EKEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (NSString)suggestionKey
{
  return self->suggestionKey;
}

- (void)setSuggestionKey:(id)a3
{
  objc_storeStrong((id *)&self->suggestionKey, a3);
}

- (EKEventEditViewDelegate)editViewDelegate
{
  return (EKEventEditViewDelegate *)objc_loadWeakRetained((id *)&self->_editViewDelegate);
}

- (void)setEditViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editViewDelegate, a3);
}

- (unint64_t)eventCreationMethod
{
  return self->eventCreationMethod;
}

- (void)setEventCreationMethod:(unint64_t)a3
{
  self->eventCreationMethod = a3;
}

- (BOOL)ignoreUnsavedChanges
{
  return self->ignoreUnsavedChanges;
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  self->ignoreUnsavedChanges = a3;
}

- (BOOL)timeImplicitlySet
{
  return self->timeImplicitlySet;
}

- (void)setTimeImplicitlySet:(BOOL)a3
{
  self->timeImplicitlySet = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editViewDelegate);
  objc_storeStrong((id *)&self->suggestionKey, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->editorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_vcManager, 0);
}

@end
