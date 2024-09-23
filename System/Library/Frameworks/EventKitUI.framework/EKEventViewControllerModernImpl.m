@implementation EKEventViewControllerModernImpl

- (EKEventViewControllerModernImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventViewControllerModernImpl;
  return -[EKEventViewControllerModernImpl init](&v3, sel_init);
}

- (id)viewControllerManager
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D0CD70]), "initWithDelegate:", self);
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
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)EKEventViewControllerModernImpl;
  -[EKEventViewControllerModernImpl loadView](&v26, sel_loadView);
  -[EKEventViewControllerModernImpl viewControllerManager](self, "viewControllerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v4;
  -[EKEventViewControllerModernImpl addChildViewController:](self, "addChildViewController:", v4);
  objc_msgSend(v4, "didMoveToParentViewController:", self);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventViewControllerModernImpl view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventViewControllerModernImpl view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v21;
  -[EKEventViewControllerModernImpl view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v16;
  -[EKEventViewControllerModernImpl view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v10;
  -[EKEventViewControllerModernImpl view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v15);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerModernImpl;
  -[EKEventViewControllerModernImpl viewDidLoad](&v5, sel_viewDidLoad);
  -[EKEventViewControllerModernImpl viewTitle](self, "viewTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

}

- (id)viewTitle
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Event Details"), &stru_1E601DFA8, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)EKEventViewControllerModernImpl;
  -[EKEventViewControllerModernImpl viewDidAppear:](&v12, sel_viewDidAppear_, a3);
  self->_didAppear = 1;
  if (self->_autoPop)
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
  if (!self->_countedAppearance)
  {
    self->_countedAppearance = 1;
    -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp");

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0D0C428], "trackPseudoEventDetailsOpened");
        v9 = (void *)MEMORY[0x1E0D0C430];
        -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logEventShowedDetailsWithUniqueKey:", v11);

      }
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventViewControllerModernImpl;
  -[EKEventViewControllerModernImpl viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKEventViewControllerModernImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  -[EKEventViewControllerModernImpl _updateResponse](self, "_updateResponse");
  -[EKEventViewControllerModernImpl _updateNavBarAnimated:](self, "_updateNavBarAnimated:", 0);
  -[EKEventViewControllerModernImpl _updateResponseVisibility](self, "_updateResponseVisibility");
}

- (BOOL)_shouldShowEditButton
{
  _BOOL4 v3;

  v3 = -[EKEventViewControllerModernImpl allowsEditing](self, "allowsEditing");
  if (v3)
    LOBYTE(v3) = -[EKEventViewControllerModernImpl _backingEventAllowsEditing](self, "_backingEventAllowsEditing");
  return v3;
}

- (BOOL)_backingEventAllowsEditing
{
  void *v3;
  void *v4;
  int v5;

  if (-[EKEvent isEditable](self->_event, "isEditable"))
  {
    -[EKEvent eventStore](self->_event, "eventStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[EKEvent calendar](self->_event, "calendar");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isSuggestedEventCalendar") ^ 1;

    }
    else
    {
      LOBYTE(v5) = 0;
    }

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)_updateNavBarAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[EKEvent title](self->_event, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackButtonTitle:", v5);

  if (-[EKEventViewControllerModernImpl _shouldShowEditButton](self, "_shouldShowEditButton"))
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editEvent);
    if (-[EKEventViewControllerModernImpl _shouldDisplayDoneButton](self, "_shouldDisplayDoneButton"))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonPressed_);
      -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItem:animated:", v11, v3);

      -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRightBarButtonItem:animated:", v7, v3);

    }
    else
    {
      -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRightBarButtonItem:animated:", v11, v3);
    }

  }
  else if (-[EKEventViewControllerModernImpl _shouldDisplayDoneButton](self, "_shouldDisplayDoneButton"))
  {
    v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonPressed_);
    -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRightBarButtonItem:animated:", v11, v3);

  }
  else
  {
    -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:animated:", 0, v3);
  }

}

- (void)_doneButtonPressed:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v4 = a3;
  v5 = v4;
  if (!self->_recurrenceAlertController)
  {
    v7 = v4;
    if (!-[EKEvent hasChanges](self->_event, "hasChanges"))
    {
      -[EKEventViewControllerModernImpl completeWithAction:](self, "completeWithAction:", 0);
      goto LABEL_10;
    }
    if (!-[EKEvent requiresDetach](self->_event, "requiresDetach"))
    {
      -[EKEventViewControllerModernImpl _performSave:animated:](self, "_performSave:animated:", 0, 1);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[EKEventViewControllerModernImpl _presentDetachSheetFromBarButtonItem:](self, "_presentDetachSheetFromBarButtonItem:", v7);
LABEL_10:
      v5 = v7;
      goto LABEL_11;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v5 = v7;
    if ((isKindOfClass & 1) != 0)
    {
      -[EKEventViewControllerModernImpl _presentDetachSheetFromView:](self, "_presentDetachSheetFromView:", v7);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (BOOL)_shouldDisplayDoneButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[EKEventViewControllerModernImpl navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_showsDoneButton)
    goto LABEL_7;
  if ((objc_msgSend(v3, "hidesBackButton") & 1) == 0 && (!v4 || !objc_msgSend(v4, "systemItem")))
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndex:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 != v8)
      {
LABEL_7:
        v9 = 0;
        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  if (!objc_msgSend(v4, "systemItem"))
    objc_msgSend(v3, "setLeftBarButtonItem:", 0);
  v9 = 1;
LABEL_12:

  return v9;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  objc_super v11;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "performSelector:withObject:", sel_eventViewControllerWillDisappear_, self);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)EKEventViewControllerModernImpl;
  -[EKEventViewControllerModernImpl viewWillDisappear:](&v11, sel_viewWillDisappear_, v3);
}

- (id)_statusButtonsView
{
  EKUIEventStatusButtonsView *statusButtonsView;
  EKUIEventStatusButtonsView *v4;
  void *v5;
  EKUIEventStatusButtonsView *v6;
  EKUIEventStatusButtonsView *v7;

  statusButtonsView = self->_statusButtonsView;
  if (!statusButtonsView)
  {
    v4 = [EKUIEventStatusButtonsView alloc];
    -[EKEventViewControllerModernImpl statusButtons](self, "statusButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    -[EKUIEventStatusButtonsView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIEventStatusButtonsView setDisableButtonHighlights:](self->_statusButtonsView, "setDisableButtonHighlights:", -[EKEventViewControllerModernImpl _isDisplayingInvitation](self, "_isDisplayingInvitation") ^ 1);
    -[EKUIEventStatusButtonsView setTextSizeMode:](self->_statusButtonsView, "setTextSizeMode:", 1);
    statusButtonsView = self->_statusButtonsView;
  }
  return statusButtonsView;
}

- (id)_statusButtonsContainerView
{
  SingleToolbarItemContainerView *statusButtonsContainerView;
  SingleToolbarItemContainerView *v4;
  SingleToolbarItemContainerView *v5;
  SingleToolbarItemContainerView *v6;

  statusButtonsContainerView = self->_statusButtonsContainerView;
  if (!statusButtonsContainerView)
  {
    v4 = [SingleToolbarItemContainerView alloc];
    v5 = -[SingleToolbarItemContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_statusButtonsContainerView;
    self->_statusButtonsContainerView = v5;

    -[SingleToolbarItemContainerView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    statusButtonsContainerView = self->_statusButtonsContainerView;
  }
  return statusButtonsContainerView;
}

- (void)_updateStatusButtonsActions
{
  id v3;

  -[EKEventViewControllerModernImpl statusButtons](self, "statusButtons");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIEventStatusButtonsView setActions:](self->_statusButtonsView, "setActions:", v3);

}

- (BOOL)_shouldDisplayStatusButtons
{
  void *v2;
  BOOL v3;

  -[EKEventViewControllerModernImpl statusButtons](self, "statusButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)_isDisplayingInvitation
{
  int v3;

  v3 = -[EKEventViewControllerModernImpl allowsInviteResponses](self, "allowsInviteResponses");
  if (v3)
    LOBYTE(v3) = -[EKEvent allowsParticipationStatusModifications](self->_event, "allowsParticipationStatusModifications");
  return v3;
}

- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage
{
  return -[EKEventViewControllerModernImpl showsOutOfDateMessage](self, "showsOutOfDateMessage")
      || -[EKEventViewControllerModernImpl showsDelegatorMessage](self, "showsDelegatorMessage")
      || -[EKEventViewControllerModernImpl showsDelegateMessage](self, "showsDelegateMessage");
}

- (BOOL)_isDisplayingSuggestion
{
  void *v2;
  BOOL v3;

  -[EKEvent calendar](self->_event, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 5;

  return v3;
}

- (BOOL)_isDisplayingDeletableEvent
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  id v5;
  char v6;
  id v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED6910) & 1) == 0)
  {

    goto LABEL_5;
  }
  v5 = objc_loadWeakRetained((id *)p_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
LABEL_5:
    v9 = 1;
    goto LABEL_6;
  }
  v7 = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_msgSend(v7, "eventViewControllerShouldHideDeleteButton");

  v9 = v8 ^ 1;
LABEL_6:
  -[EKEvent calendar](self->_event, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "allowsContentModifications")
    && (-[EKEvent isPrivateEventSharedToMe](self->_event, "isPrivateEventSharedToMe") & 1) == 0)
  {
    if (self->_minimalMode)
      v9 = 0;

    if ((v9 & 1) != 0)
      return 1;
  }
  else
  {

  }
  if (-[EKEvent status](self->_event, "status") != EKEventStatusCanceled)
    return 0;
  -[EKEvent calendar](self->_event, "calendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "source");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isDelegate"))
  {
    -[EKEvent calendar](self->_event, "calendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isWritable");

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (int64_t)_actionsMask
{
  int64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[EKEventViewControllerModernImpl _shouldDisplayDelegateOrOutOfDateMessage](self, "_shouldDisplayDelegateOrOutOfDateMessage"))
  {
    return 0;
  }
  if (!-[EKEventViewControllerModernImpl _isDisplayingInvitation](self, "_isDisplayingInvitation"))
  {
    if (-[EKEventViewControllerModernImpl isICSPreview](self, "isICSPreview"))
    {
      if (-[EKEventViewControllerModernImpl showsAddToCalendarForICSPreview](self, "showsAddToCalendarForICSPreview"))
      {
        v3 = 8;
        goto LABEL_13;
      }
      v4 = !-[EKEventViewControllerModernImpl showsUpdateCalendarForICSPreview](self, "showsUpdateCalendarForICSPreview");
      v5 = 2048;
    }
    else
    {
      v4 = !-[EKEventViewControllerModernImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion");
      v5 = 136;
    }
    if (v4)
      v3 = 0;
    else
      v3 = v5;
LABEL_13:
    if (-[EKEventViewControllerModernImpl _isDisplayingDeletableEvent](self, "_isDisplayingDeletableEvent")
      && (!-[EKEventViewControllerModernImpl isICSPreview](self, "isICSPreview")
       || -[EKEventViewControllerModernImpl showsDeleteForICSPreview](self, "showsDeleteForICSPreview")))
    {
      v3 |= 0x10uLL;
    }
    goto LABEL_17;
  }
  v3 = 7;
LABEL_17:
  -[EKEventViewControllerModernImpl event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isSubscribed")
    && (objc_msgSend(v7, "isSubscribedHolidayCalendar") & 1) == 0
    && objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
  {
    v3 |= 0x40000uLL;
  }

  return v3;
}

+ (id)_orderedActionsForMask:(int64_t)a3
{
  void *v4;
  uint64_t i;
  void *v6;

  v4 = (void *)objc_opt_new();
  for (i = 0; i != 14; ++i)
  {
    if ((_orderedActionsForMask__actionOrder_1[i] & a3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  return v4;
}

- (id)statusButtons
{
  return (id)objc_msgSend((id)objc_opt_class(), "_orderedActionsForMask:", -[EKEventViewControllerModernImpl _actionsMask](self, "_actionsMask"));
}

- (void)invokeAction:(int64_t)a3 eventStatusButtonsView:(id)a4
{
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "buttonForAction:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_DEBUG, "EKEventViewController invoking action: %ld", (uint8_t *)&v10, 0xCu);
  }
  if (a3 <= 4095)
  {
    if (a3 <= 15)
    {
      v8 = 2;
      switch(a3)
      {
        case 1:
          goto LABEL_21;
        case 2:
          v8 = 4;
          goto LABEL_21;
        case 4:
          v8 = 3;
LABEL_21:
          -[EKEventViewControllerModernImpl _saveStatus:sourceViewForPopover:](self, "_saveStatus:sourceViewForPopover:", v8, v6);
          break;
        case 8:
          goto LABEL_15;
        default:
          goto LABEL_28;
      }
      goto LABEL_28;
    }
    if (a3 != 16)
    {
      if (a3 == 128)
      {
        -[EKEventViewControllerModernImpl _deleteSuggestionTapped:](self, "_deleteSuggestionTapped:", self);
      }
      else if (a3 == 2048)
      {
LABEL_15:
        -[EKEventViewControllerModernImpl _addToCalendarClicked:](self, "_addToCalendarClicked:", self);
      }
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  if (a3 >= 0x10000)
  {
    if (a3 == 0x10000)
    {
      PresentJunkAlertControllerForEvent(self->_event, self);
      goto LABEL_28;
    }
    if (a3 == 0x40000)
    {
      -[EKEventViewControllerModernImpl _statusButtonsView](self, "_statusButtonsView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerModernImpl _unsubscribeClicked:](self, "_unsubscribeClicked:", v9);
      goto LABEL_27;
    }
    if (a3 != 0x80000)
      goto LABEL_28;
LABEL_19:
    -[EKEventViewControllerModernImpl _statusButtonsView](self, "_statusButtonsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerModernImpl _deleteClicked:](self, "_deleteClicked:", v9);
LABEL_27:

    goto LABEL_28;
  }
  switch(a3)
  {
    case 0x1000:
      -[EKEventViewControllerModernImpl _acceptProposedTimeWithSourceViewForPopover:](self, "_acceptProposedTimeWithSourceViewForPopover:", v6);
      break;
    case 0x2000:
      -[EKEventViewControllerModernImpl _rejectProposedTime](self, "_rejectProposedTime");
      break;
    case 0x8000:
      -[EKEventViewControllerModernImpl _cancelProposedTime](self, "_cancelProposedTime");
      break;
  }
LABEL_28:

}

- (id)_proposedDate
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[EKEventViewControllerModernImpl event](self, "event", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "proposedStartDateStatus") == 1
            || !objc_msgSend(v10, "proposedStartDateStatus"))
          {
            -[EKEventViewControllerModernImpl event](self, "event");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "proposedStartDateForEvent:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {

              goto LABEL_15;
            }
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_15:

  return v12;
}

- (void)_acceptProposedTimeWithSourceViewForPopover:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  EKUIRecurrenceAlertController *v20;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEventViewControllerModernImpl _proposedDate](self, "_proposedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEventViewControllerModernImpl event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDateUnadjustedForLegacyClients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;

    objc_msgSend(v6, "setStartDate:", v5);
    objc_msgSend(v5, "dateByAddingTimeInterval:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndDateUnadjustedForLegacyClients:", v11);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v6, "attendees");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v18 = v17;
            objc_msgSend(v18, "setCommentChanged:", 0);
            objc_msgSend(v18, "setStatusChanged:", 0);
            objc_msgSend(v18, "setProposedStartDateChanged:", 0);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(v6, "dismissAcceptedProposeNewTimeNotification");
    if (objc_msgSend(v6, "isOrWasPartOfRecurringSeries"))
    {
      -[EKEventViewControllerModernImpl presentationSourceViewController](self, "presentationSourceViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __79__EKEventViewControllerModernImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke;
      v22[3] = &unk_1E60197E8;
      v22[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v4, v6, v22);
      v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v20;

    }
    else
    {
      -[EKEventViewControllerModernImpl _performSave:animated:](self, "_performSave:animated:", 0, 0);
    }

  }
}

void __79__EKEventViewControllerModernImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if ((unint64_t)(a2 - 3) >= 3)
  {
    if (a2 == 2)
      v5 = 2;
    else
      v5 = a2 == 1;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 992);
    *(_QWORD *)(v6 + 992) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_performSave:animated:", v5, 0);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 992);
    *(_QWORD *)(v3 + 992) = 0;

  }
}

- (void)_rejectProposedTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[EKEventViewControllerModernImpl event](self, "event", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attendees");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "setCommentChanged:", 0);
          objc_msgSend(v10, "setStatusChanged:", 0);
          objc_msgSend(v10, "setProposedStartDateChanged:", 0);
          objc_msgSend(v10, "setProposedStartDateStatus:", 3);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[EKEventViewControllerModernImpl event](self, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isOrWasPartOfRecurringSeries"))
    v12 = 4;
  else
    v12 = 0;

  -[EKEventViewControllerModernImpl _performSave:animated:](self, "_performSave:animated:", v12, 0);
}

- (void)_cancelProposedTime
{
  void *v3;

  -[EKEventViewControllerModernImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProposedStartDate:", 0);

  -[EKEventViewControllerModernImpl _performSave:animated:](self, "_performSave:animated:", 0, 0);
}

- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  if (a3)
  {
    v8 = v6;
    if ((-[EKEvent responseMustApplyToAll](self->_event, "responseMustApplyToAll") & 1) != 0)
    {
      v7 = 4;
    }
    else
    {
      if (-[EKEvent isOrWasPartOfRecurringSeries](self->_event, "isOrWasPartOfRecurringSeries"))
      {
        self->_pendingStatus = a3;
        -[EKEventViewControllerModernImpl _presentDetachSheetFromView:](self, "_presentDetachSheetFromView:", v8);
LABEL_8:
        v6 = v8;
        goto LABEL_9;
      }
      v7 = 0;
    }
    -[EKEventViewControllerModernImpl _saveStatus:span:](self, "_saveStatus:span:", a3, v7);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4
{
  -[EKEvent setParticipationStatus:](self->_event, "setParticipationStatus:", a3);
  -[EKEvent setInvitationStatus:](self->_event, "setInvitationStatus:", 0);
  -[EKEventViewControllerModernImpl _performSave:animated:](self, "_performSave:animated:", a4, 1);
}

- (void)_presentDetachSheetFromBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  EKUIRecurrenceAlertController *v6;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  id v8;

  v4 = a3;
  -[EKEventViewControllerModernImpl _detachSheetHandler](self, "_detachSheetHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerModernImpl presentationSourceViewController](self, "presentationSourceViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:barButtonItem:forEvent:withCompletionHandler:", 0, v5, v4, self->_event, v8);
  v6 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v6;

}

- (void)_presentDetachSheetFromView:(id)a3
{
  id v4;
  void *v5;
  EKUIRecurrenceAlertController *v6;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  id v8;

  v4 = a3;
  -[EKEventViewControllerModernImpl _detachSheetHandler](self, "_detachSheetHandler");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerModernImpl presentationSourceViewController](self, "presentationSourceViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v5, v4, self->_event, v8);
  v6 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v6;

}

- (id)_detachSheetHandler
{
  BOOL v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  BOOL v7;

  v2 = self->_pendingStatus != 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__EKEventViewControllerModernImpl__detachSheetHandler__block_invoke;
  v6[3] = &unk_1E601A878;
  v6[4] = self;
  v7 = v2;
  v3 = _Block_copy(v6);
  v4 = _Block_copy(v3);

  return v4;
}

void __54__EKEventViewControllerModernImpl__detachSheetHandler__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  switch(a2)
  {
    case 1:
    case 2:
      goto LABEL_3;
    case 3:
      objc_msgSend(*(id *)(a1 + 32), "_updateResponse");
      goto LABEL_7;
    case 4:
    case 5:
      return;
    default:
      a2 = 0;
LABEL_3:
      v3 = *(_QWORD **)(a1 + 32);
      if (*(_BYTE *)(a1 + 40))
        objc_msgSend(v3, "_saveStatus:span:", v3[125], a2);
      else
        objc_msgSend(v3, "_performSave:animated:", a2, 1);
LABEL_7:
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 992);
      *(_QWORD *)(v4 + 992) = 0;

      return;
  }
}

- (void)_updateResponseVisibility
{
  void *v3;
  void *v4;
  SingleToolbarItemContainerView *statusButtonsContainerView;
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
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  if (-[EKEventViewControllerModernImpl _shouldDisplayStatusButtons](self, "_shouldDisplayStatusButtons"))
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToolbarHidden:", 0);

    -[EKEventViewControllerModernImpl toolbarItems](self, "toolbarItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v4, !statusButtonsContainerView))
    {
      -[EKEventViewControllerModernImpl _statusButtonsContainerView](self, "_statusButtonsContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerModernImpl _statusButtonsView](self, "_statusButtonsView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", v7);
      v20 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v7, "leadingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "leadingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v23;
      objc_msgSend(v7, "trailingAnchor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trailingAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "constraintEqualToAnchor:", v21);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v19;
      objc_msgSend(v7, "topAnchor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v10;
      objc_msgSend(v7, "bottomAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bottomAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "activateConstraints:", v14);

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v6);
      v26 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerModernImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", v16, 1);

    }
  }
  else
  {
    -[EKEventViewControllerModernImpl toolbarItems](self, "toolbarItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setToolbarHidden:", 1);

      -[EKEventViewControllerModernImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", 0, 1);
    }
  }
}

- (void)_updateResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  -[EKEventViewControllerModernImpl _statusButtonsView](self, "_statusButtonsView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEvent calendar](self->_event, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "statusesAreAccurate");

    v8 = -[EKEvent participationStatus](self->_event, "participationStatus");
    if ((v7 & 1) == 0 && !-[EKEvent isStatusDirty](self->_event, "isStatusDirty"))
      goto LABEL_9;
  }
  else
  {
    v8 = -[EKEvent participationStatus](self->_event, "participationStatus");
  }
  if (-[EKEventViewControllerModernImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion")
    || (unint64_t)(v8 - 2) > 2)
  {
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v9 = qword_1AFA13B50[v8 - 2];
LABEL_10:
  objc_msgSend(v10, "setSelectedAction:", v9);

}

- (void)_deleteClicked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id WeakRetained;
  id v12;
  void *v13;
  int v14;
  EKUIRecurrenceAlertController *v15;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  void *v17;
  void *v18;
  void *v19;
  EKUIRecurrenceAlertController *v20;
  _QWORD aBlock[5];
  id v22;
  BOOL v23;

  v4 = a3;
  -[EKEventViewControllerModernImpl event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EKEventViewControllerModernImpl__deleteClicked___block_invoke;
  aBlock[3] = &unk_1E601A850;
  aBlock[4] = self;
  v23 = v6 == 3;
  if (v6 == 3)
    v8 = 5;
  else
    v8 = 4;
  v9 = v7;
  v22 = v9;
  v10 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "eventViewDelegateShouldHandlePresentationOfDeleteAlert:", v13);

    if (v14)
    {
      +[EKUIRecurrenceAlertController deleteAlertWithOptions:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "deleteAlertWithOptions:forEvent:stringForDeleteButton:withCompletionHandler:", v8, self->_event, 0, v10);
      v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v15;

      v17 = objc_loadWeakRetained((id *)&self->_delegate);
      -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKUIRecurrenceAlertController alertController](self->_recurrenceAlertController, "alertController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventViewController:requestsDisplayOfDeleteAlert:", v18, v19);
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[EKEventViewControllerModernImpl presentationSourceViewController](self, "presentationSourceViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "buttonForAction:", 16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v18, "bounds");
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", v8, v17, v18, self->_event, 0, v10);
  v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  v19 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v20;
LABEL_12:

}

void __50__EKEventViewControllerModernImpl__deleteClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  switch(a2)
  {
    case 2:
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v3 = 2;
      goto LABEL_7;
    case 1:
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v3 = 1;
      goto LABEL_7;
    case 0:
      v3 = 2 * *(unsigned __int8 *)(a1 + 48);
      v4 = *(void **)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
LABEL_7:
      objc_msgSend(v4, "_performDelete:editor:", v3, v5);
      break;
  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 992);
  *(_QWORD *)(v6 + 992) = 0;

}

- (void)_unsubscribeClicked:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  void *v8;
  int v9;
  EKUIRecurrenceAlertController *v10;
  EKUIRecurrenceAlertController *v11;
  void *v12;
  void *v13;
  void *recurrenceAlertController;
  EKUIRecurrenceAlertController *v15;
  _QWORD aBlock[5];

  v4 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__EKEventViewControllerModernImpl__unsubscribeClicked___block_invoke;
  aBlock[3] = &unk_1E60197E8;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "eventViewDelegateShouldHandlePresentationOfDeleteAlert:", v8);

  if (!v9)
  {
LABEL_5:
    -[EKEventViewControllerModernImpl presentationSourceViewController](self, "presentationSourceViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buttonForAction:", 0x40000);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounds");
    +[EKUIRecurrenceAlertController presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:](EKUIRecurrenceAlertController, "presentUnsubscribeAlertWithOptions:viewController:sourceView:sourceRect:withCompletionHandler:", 4, v12, v13, v5);
    v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
    recurrenceAlertController = self->_recurrenceAlertController;
    self->_recurrenceAlertController = v15;
    goto LABEL_6;
  }
  +[EKUIRecurrenceAlertController unsubscribeAlertWithOptions:withCompletionHandler:](EKUIRecurrenceAlertController, "unsubscribeAlertWithOptions:withCompletionHandler:", 4, v5);
  v10 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  v11 = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v10;

  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIRecurrenceAlertController alertController](self->_recurrenceAlertController, "alertController");
  recurrenceAlertController = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "eventViewController:requestsDisplayOfDeleteAlert:", v13, recurrenceAlertController);
LABEL_6:

}

void __55__EKEventViewControllerModernImpl__unsubscribeClicked___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2 != 3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "calendar");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = kEKUILogHandle;
    v5 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_DEFAULT);
    if (a2 == 5)
    {
      if (v5)
      {
        v6 = 138412290;
        v7 = v3;
        _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details, and reporting it as junk", (uint8_t *)&v6, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D0CE18], "unsubscribeFromCalendar:reportAsJunk:", v3, 1);
    }
    else
    {
      if (v5)
      {
        v6 = 138412290;
        v7 = v3;
        _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEFAULT, "Removing calendar %@ because the user unsubscribed from event details", (uint8_t *)&v6, 0xCu);
      }
      objc_msgSend(MEMORY[0x1E0D0CE18], "unsubscribeFromCalendar:", v3);
    }

  }
}

- (void)_addToCalendarClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id WeakRetained;

  if (-[EKEventViewControllerModernImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion", a3))
  {
    -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChangedFields:", 0);

    -[EKEvent eventStore](self->_event, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acceptSuggestedEvent:", self->_event);

    v6 = (void *)MEMORY[0x1E0D0C430];
    -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEventConfirmedDetailsWithUniqueKey:", v8);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventViewController:didCompleteWithAction:", v9, 0);

LABEL_6:
    return;
  }
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10)
  {
    v11 = v10;
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "performSelector:withObject:", sel_eventViewControllerDidRequestAddToCalendar_, self);
      goto LABEL_6;
    }
  }
}

- (void)_deleteSuggestionTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  if (-[EKEventViewControllerModernImpl _isDisplayingSuggestion](self, "_isDisplayingSuggestion", a3))
  {
    -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChangedFields:", 0);

    v5 = (void *)MEMORY[0x1E0D0C430];
    -[EKEvent suggestionInfo](self->_event, "suggestionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logEventRejectedDetailsWithUniqueKey:", v7);

    -[EKEvent eventStore](self->_event, "eventStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteSuggestedEvent:", self->_event);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "eventViewController:didCompleteWithAction:", v9, 2);

  }
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  EKEvent *event;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[UIResponder EKUI_editor](self, "EKUI_editor", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  v14 = 0;
  v8 = objc_msgSend(v6, "saveEvent:span:error:", event, a3, &v14);
  v9 = v14;
  if ((v8 & 1) == 0)
  {
    v10 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_ERROR, "EKEventViewController failed to save event: %@", buf, 0xCu);
    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != (void *)*MEMORY[0x1E0CA9E60])
      goto LABEL_7;
    v12 = objc_msgSend(v9, "code");

    if (v12 == 1010)
    {
      -[EKEvent eventStore](self->_event, "eventStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rollback");
LABEL_7:

    }
  }
  -[EKEventViewControllerModernImpl completeWithAction:](self, "completeWithAction:", 1);

  return 1;
}

- (void)_performDelete:(int64_t)a3 editor:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  EKEvent *event;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CAA068];
  v7 = a4;
  objc_msgSend(v6, "sharedInstance");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "handleEventDeletion:", self->_event);

  event = self->_event;
  v14 = 0;
  LOBYTE(v8) = objc_msgSend(v7, "deleteEvent:span:error:", event, a3, &v14);

  v10 = v14;
  if ((v8 & 1) == 0)
  {
    v11 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_ERROR, "EKEventViewController failed to delete event: %@", buf, 0xCu);
    }
    objc_msgSend(v10, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != (void *)*MEMORY[0x1E0CA9E60])
      goto LABEL_7;
    v13 = objc_msgSend(v10, "code");

    if (v13 == 1010)
    {
      -[EKEvent eventStore](self->_event, "eventStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rollback");
LABEL_7:

    }
  }
  -[EKEventViewControllerModernImpl completeWithAction:](self, "completeWithAction:", 2);

}

- (id)presentationSourceViewController
{
  void *v3;
  EKEventViewControllerModernImpl *v4;

  -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v4 = (EKEventViewControllerModernImpl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (void)completeWithAction:(int64_t)a3
{
  EKUIRecurrenceAlertController *recurrenceAlertController;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;
  id v13;

  if (a3 == 2)
  {
    recurrenceAlertController = self->_recurrenceAlertController;
    if (recurrenceAlertController)
    {
      -[EKUIRecurrenceAlertController alertController](recurrenceAlertController, "alertController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

    }
  }
  -[EKEventViewControllerModernImpl _dismissEditor:deleted:](self, "_dismissEditor:deleted:", 0, a3 == 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = -[EKEventViewControllerModernImpl _shouldPopSelf](self, "_shouldPopSelf");

      if (!v11)
      {
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "eventViewController:didCompleteWithAction:", v12, a3);

        return;
      }
    }
    else
    {

    }
  }
  -[EKEventViewControllerModernImpl _pop](self, "_pop");
}

- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4
{
  EKEventEditViewController *activeEventEditor;
  _BOOL8 v6;
  id WeakRetained;
  void *v8;
  id v9;
  int v10;
  id v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  EKEventEditViewController *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;

  activeEventEditor = self->_activeEventEditor;
  if (activeEventEditor)
  {
    v6 = a4;
    if ((-[EKEventEditViewController isBeingDismissed](activeEventEditor, "isBeingDismissed", a3) & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained
        && (v8 = WeakRetained,
            v9 = objc_loadWeakRetained((id *)&self->_delegate),
            v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EEED63E8),
            v9,
            v8,
            v10))
      {
        v11 = objc_loadWeakRetained((id *)&self->_delegate);
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0)
        {
          v13 = objc_loadWeakRetained((id *)&self->_delegate);
          -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "eventViewControllerWillFinishEditingEvent:deleted:", v14, v6);

        }
        v15 = objc_loadWeakRetained((id *)&self->_delegate);
        v16 = objc_opt_respondsToSelector();

        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        if ((v16 & 1) != 0)
        {
          -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventViewController:requestsDismissalOfEditViewController:", v18, self->_activeEventEditor);

        }
        else
        {
          v20 = objc_opt_respondsToSelector();

          if ((v20 & 1) != 0)
          {
            v21 = objc_loadWeakRetained((id *)&self->_delegate);
            -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "eventViewController:willDismissEditViewController:deleted:", v22, self->_activeEventEditor, v6);

          }
          -[EKEventEditViewController presentingViewController](self->_activeEventEditor, "presentingViewController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerModernImpl editorHideTransition](self, "editorHideTransition"), 0);

          v24 = objc_loadWeakRetained((id *)&self->_delegate);
          v25 = objc_opt_respondsToSelector();

          if ((v25 & 1) == 0)
            goto LABEL_12;
          v17 = objc_loadWeakRetained((id *)&self->_delegate);
          -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventViewController:didDismissEditViewController:deleted:", v26, self->_activeEventEditor, v6);

        }
      }
      else
      {
        -[EKEventEditViewController presentingViewController](self->_activeEventEditor, "presentingViewController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerModernImpl editorHideTransition](self, "editorHideTransition"), 0);
      }

LABEL_12:
      -[EKEventEditViewController setEditViewDelegate:](self->_activeEventEditor, "setEditViewDelegate:", 0);
      v19 = self->_activeEventEditor;
      self->_activeEventEditor = 0;

    }
  }
}

- (BOOL)_shouldPopSelf
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  char v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    return 0;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
    return 0;
  v8 = objc_loadWeakRetained((id *)p_delegate);
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "eventViewControllerShouldDismissSelf:", v9);

  return v10;
}

- (void)_pop
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t v13[16];

  v3 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1AF84D000, v3, OS_LOG_TYPE_INFO, "EKEventViewController is dismissing itself; clients of this class should ideally handle their own dismissal by imp"
      "lementing the delegate method eventViewController:didCompleteWithAction:",
      v13,
      2u);
  }
  if (self->_didAppear)
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "popToViewController:animated:", v5, 0);

    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9 < 2)
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      v12 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

  }
  else
  {
    self->_autoPop = 1;
  }
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  -[EKEventViewControllerModernImpl invokeAction:eventStatusButtonsView:](self, "invokeAction:eventStatusButtonsView:", a4, a3, a5, a6);
}

- (double)eventStatusButtonsViewButtonFontSize:(id)a3
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_statusButtonsViewCachedFontSize = a4;
}

- (void)setActiveEventEditor:(id)a3
{
  EKEventEditViewController *v4;
  void *v5;
  void *v6;
  _BOOL4 IsRegular;
  void *v8;
  char v9;
  id WeakRetained;
  EKEventEditViewController *activeEventEditor;

  v4 = (EKEventEditViewController *)a3;
  -[EKEventEditViewController setEditViewDelegate:](v4, "setEditViewDelegate:", self);
  -[EKEventViewControllerModernImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
  {
    -[EKEventViewControllerModernImpl view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

    if (IsRegular)
      -[EKEventEditViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
  }
  else
  {

  }
  -[EKEventViewControllerModernImpl delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventEditViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", objc_msgSend(WeakRetained, "editorPresentationStyle"));

  }
  activeEventEditor = self->_activeEventEditor;
  self->_activeEventEditor = v4;

}

- (void)presentEditorAnimated:(BOOL)a3
{
  uint64_t v3;
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  id v17;
  EKEventEditViewController *v18;

  v3 = a3;
  v18 = self->_activeEventEditor;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EEED63E8))
    goto LABEL_6;
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "eventViewDelegateShouldHandlePresentationOfEditViewController:", v9);

  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "eventViewController:requestsDisplayOfEditViewController:animated:", v12, v18, v3);

LABEL_12:
    goto LABEL_13;
  }
LABEL_7:
  if (v18)
  {
    if ((_DWORD)v3
      && (v3 = -[EKEventViewControllerModernImpl editorShowTransition](self, "editorShowTransition"), (_DWORD)v3 == 8))
    {
      -[EKEventViewControllerModernImpl _viewControllerForEditorPresentation](self, "_viewControllerForEditorPresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentViewController:animated:completion:", v18, 1, 0);
    }
    else
    {
      -[EKEventViewControllerModernImpl _viewControllerForEditorPresentation](self, "_viewControllerForEditorPresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentModalViewController:withTransition:", v18, v3);
    }
    goto LABEL_12;
  }
LABEL_13:
  v13 = objc_loadWeakRetained((id *)p_delegate);
  if (v13)
  {
    v14 = v13;
    v15 = objc_loadWeakRetained((id *)p_delegate);
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v17, "performSelector:withObject:", sel_eventViewControllerDidBeginEditingEventWithEditViewController_, v18);

    }
  }

}

- (id)_viewControllerForEditorPresentation
{
  void *v3;
  EKEventViewControllerModernImpl *v4;

  -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v4 = (EKEventViewControllerModernImpl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (void)doneButtonTapped
{
  id v3;

  -[EKEventViewControllerModernImpl view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerModernImpl _doneButtonPressed:](self, "_doneButtonPressed:", v3);

}

- (void)editEvent
{
  EKEventViewDelegate **p_delegate;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v20;
  char v21;
  EKEventEditViewController *v22;
  void *v23;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!WeakRetained)
    goto LABEL_4;
  v5 = WeakRetained;
  v6 = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0
    || (v8 = objc_loadWeakRetained((id *)p_delegate),
        -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "eventViewControllerEditButtonTemporarilyDisabled:", v9),
        v9,
        v8,
        (v10 & 1) == 0))
  {
LABEL_4:
    v11 = objc_loadWeakRetained((id *)p_delegate);
    if (v11)
    {
      v12 = v11;
      v13 = objc_loadWeakRetained((id *)p_delegate);
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        v15 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v15, "performSelector:withObject:", sel_eventViewControllerWillBeginEditingEvent_, self);

      }
    }
    v16 = objc_loadWeakRetained((id *)p_delegate);
    if ((objc_msgSend(v16, "conformsToProtocol:", &unk_1EEED63E8) & 1) != 0)
    {
      v17 = objc_loadWeakRetained((id *)p_delegate);
      v18 = objc_opt_respondsToSelector();

      if ((v18 & 1) != 0)
      {
        v19 = objc_loadWeakRetained((id *)p_delegate);
        -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "eventViewDelegateShouldCreateOwnEditViewController:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_13;
      }
    }
    else
    {

    }
    v22 = objc_alloc_init(EKEventEditViewController);
    -[EKEventEditViewController setEvent:](v22, "setEvent:", self->_event);
    -[EKEvent eventStore](self->_event, "eventStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditViewController setEventStore:](v22, "setEventStore:", v23);

    -[EKEventViewControllerModernImpl setActiveEventEditor:](self, "setActiveEventEditor:", v22);
LABEL_13:
    -[EKEventViewControllerModernImpl presentEditorAnimated:](self, "presentEditorAnimated:", 1);
  }
}

- (void)requestAttendeesDetailPresentation
{
  EKUIEventInviteesViewController *v3;
  void *v4;
  void *v5;
  id v6;

  -[NSDictionary objectForKeyedSubscript:](self->context, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_ModelKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[EKUIEventInviteesViewController initWithEvent:fromDetail:model:]([EKUIEventInviteesViewController alloc], "initWithEvent:fromDetail:model:", self->_event, 1, v6);
  -[EKEventViewControllerModernImpl navigationDelegate](self, "navigationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUIEventInviteesViewController setNavigationDelegate:](v3, "setNavigationDelegate:", v4);

  -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v3, 1);

}

- (void)requestOrganizerDetailPresentation
{
  EKIdentityViewController *v3;
  void *v4;
  void *v5;
  EKIdentityViewController *v6;

  v3 = [EKIdentityViewController alloc];
  -[EKEvent organizer](self->_event, "organizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKIdentityViewController initWithIdentity:](v3, "initWithIdentity:", v4);

  -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarItems:", v4);

}

- (id)toolbarItems
{
  void *v2;
  void *v3;

  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toolbarItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setToolbarItems:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarItems:animated:", v6, v4);

}

- (id)navigationItem
{
  void *v2;
  void *v3;

  -[EKEventViewControllerModernImpl _ekEventViewController](self, "_ekEventViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  EKUIViewControllerNavigationDelegate **p_navigationDelegate;
  id WeakRetained;
  void *v5;

  p_navigationDelegate = &self->_navigationDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_navigationDelegate);
  }
  else
  {
    -[EKEventViewControllerModernImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (EKUIViewControllerNavigationDelegate *)v5;
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  if (a4 == 2)
  {
    -[EKEventViewControllerModernImpl completeWithAction:](self, "completeWithAction:", 2);
  }
  else
  {
    -[EKEventViewControllerModernImpl setNeedsReload](self, "setNeedsReload", a3);
    -[EKEventViewControllerModernImpl _dismissEditor:deleted:](self, "_dismissEditor:deleted:", 1, 0);
  }
}

- (id)pasteboardManagerForEventEditViewController:(id)a3
{
  void *v4;
  char v5;
  id WeakRetained;
  void *v7;

  -[EKEventViewControllerModernImpl delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "pasteboardManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)calendarModel
{
  return -[NSDictionary objectForKeyedSubscript:](self->context, "objectForKeyedSubscript:", CFSTR("EKUIEventDetailsContext_ModelKey"));
}

- (BOOL)eventEditViewPresented
{
  return self->eventEditViewPresented;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  self->eventEditViewPresented = a3;
}

- (BOOL)allowsCalendarPreview
{
  return self->allowsCalendarPreview;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  self->allowsCalendarPreview = a3;
}

- (BOOL)showsUpdateCalendarForICSPreview
{
  return self->showsUpdateCalendarForICSPreview;
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  self->showsUpdateCalendarForICSPreview = a3;
}

- (BOOL)allowsEditing
{
  return self->allowsEditing;
}

- (void)setAllowsEditing:(BOOL)a3
{
  self->allowsEditing = a3;
}

- (BOOL)allowsInviteResponses
{
  return self->allowsInviteResponses;
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  self->allowsInviteResponses = a3;
}

- (BOOL)allowsSubitems
{
  return self->allowsSubitems;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  self->allowsSubitems = a3;
}

- (BOOL)calendarPreviewIsInlineDayView
{
  return self->calendarPreviewIsInlineDayView;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  self->calendarPreviewIsInlineDayView = a3;
}

- (NSDictionary)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->context, a3);
}

- (EKEventViewDelegate)delegate
{
  return (EKEventViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)editorHideTransition
{
  return self->editorHideTransition;
}

- (void)setEditorHideTransition:(int)a3
{
  self->editorHideTransition = a3;
}

- (int)editorShowTransition
{
  return self->editorShowTransition;
}

- (void)setEditorShowTransition:(int)a3
{
  self->editorShowTransition = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (UIScrollView)eventDetailsScrollView
{
  return self->eventDetailsScrollView;
}

- (UIViewController)eventDetailsViewController
{
  return self->eventDetailsViewController;
}

- (BOOL)isICSPreview
{
  return self->ICSPreview;
}

- (void)setICSPreview:(BOOL)a3
{
  self->ICSPreview = a3;
}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  return self->inlineDayViewRespectsSelectedCalendarsFilter;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  self->inlineDayViewRespectsSelectedCalendarsFilter = a3;
}

- (BOOL)isLargeDayView
{
  return self->isLargeDayView;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  self->isLargeDayView = a3;
}

- (BOOL)minimalMode
{
  return self->_minimalMode;
}

- (void)setMinimalMode:(BOOL)a3
{
  self->_minimalMode = a3;
}

- (BOOL)noninteractivePlatterMode
{
  return self->noninteractivePlatterMode;
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  self->noninteractivePlatterMode = a3;
}

- (BOOL)showsAddToCalendarForICSPreview
{
  return self->showsAddToCalendarForICSPreview;
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  self->showsAddToCalendarForICSPreview = a3;
}

- (BOOL)showsDelegateMessage
{
  return self->showsDelegateMessage;
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  self->showsDelegateMessage = a3;
}

- (BOOL)showsDelegatorMessage
{
  return self->showsDelegatorMessage;
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  self->showsDelegatorMessage = a3;
}

- (BOOL)showsDeleteForICSPreview
{
  return self->showsDeleteForICSPreview;
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  self->showsDeleteForICSPreview = a3;
}

- (BOOL)showsDetectedConferenceItem
{
  return self->showsDetectedConferenceItem;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  self->showsDetectedConferenceItem = a3;
}

- (BOOL)showsDoneButton
{
  return self->_showsDoneButton;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  self->_showsDoneButton = a3;
}

- (BOOL)showsOutOfDateMessage
{
  return self->showsOutOfDateMessage;
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  self->showsOutOfDateMessage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->eventDetailsViewController, 0);
  objc_storeStrong((id *)&self->eventDetailsScrollView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->context, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_activeEventEditor, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
}

@end
