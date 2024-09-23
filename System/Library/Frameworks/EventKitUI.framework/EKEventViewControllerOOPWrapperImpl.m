@implementation EKEventViewControllerOOPWrapperImpl

+ (void)setDefaultDatesForEvent:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKGetDefaultStartAndEndTimeForDate();
  v6 = 0;
  v7 = 0;
  objc_msgSend(v4, "setStartDate:", v6);
  objc_msgSend(v4, "setEndDateUnadjustedForLegacyClients:", v7);

}

- (EKEventViewControllerOOPWrapperImpl)init
{
  EKEventViewControllerOOPWrapperImpl *v2;
  _TtC10EventKitUI28EKEventViewControllerOOPImpl *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  v2 = -[EKEventViewControllerOOPWrapperImpl init](&v5, sel_init);
  v3 = objc_alloc_init(_TtC10EventKitUI28EKEventViewControllerOOPImpl);
  -[EKEventViewControllerOOPWrapperImpl setVc:](v2, "setVc:", v3);

  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
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
  SingleToolbarItemContainerView *statusButtonsContainerView;
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
  objc_super v47;
  _QWORD v48[4];

  v48[3] = *MEMORY[0x1E0C80C00];
  v47.receiver = self;
  v47.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  -[EKEventViewControllerOOPWrapperImpl viewDidLoad](&v47, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  EventKitUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Event Details"), &stru_1E601DFA8, 0);
  v6 = objc_claimAutoreleasedReturnValue();

  -[EKEventViewControllerOOPWrapperImpl setTitle:](self, "setTitle:", v6);
  -[EKEventViewControllerOOPWrapperImpl parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)v6;
  objc_msgSend(v7, "setTitle:", v6);

  -[EKEventViewControllerOOPWrapperImpl _updateNavBarAnimated:](self, "_updateNavBarAnimated:", 0);
  v8 = -[EKEventViewControllerOOPWrapperImpl hasInProcessNavBar](self, "hasInProcessNavBar");
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHasInProcessNavBar:", v8);

  -[EKEventViewControllerOOPWrapperImpl _setupStatusToolbarButtons](self, "_setupStatusToolbarButtons");
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl addChildViewController:](self, "addChildViewController:", v10);

  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v13);

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didMoveToParentViewController:", self);

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v37 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v40;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "view");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "topAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v18;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "activateConstraints:", v25);

  statusButtonsContainerView = self->_statusButtonsContainerView;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (statusButtonsContainerView)
  {
    objc_msgSend(v30, "safeAreaLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "bottomAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setActive:", 1);

  }
  else
  {
    objc_msgSend(v30, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setActive:", 1);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  -[EKEventViewControllerOOPWrapperImpl viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[EKEventViewControllerOOPWrapperImpl _updateStatusButtonsActions](self, "_updateStatusButtonsActions");
  -[EKEventViewControllerOOPWrapperImpl _updateResponse](self, "_updateResponse");
  v4 = -[EKEventViewControllerOOPWrapperImpl _shouldDisplayStatusButtons](self, "_shouldDisplayStatusButtons") ^ 1;
  -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:", v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EKEventViewControllerOOPWrapperImpl;
  -[EKEventViewControllerOOPWrapperImpl viewWillDisappear:](&v10, sel_viewWillDisappear_, a3);
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performSelector:withObject:", sel_eventViewControllerWillDisappear_, self);

    }
  }
  -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setToolbarHidden:", 1);

}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
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
  void *v11;
  id v12;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackButtonTitle:", v6);

  if (-[EKEventViewControllerOOPWrapperImpl _shouldShowEditButton](self, "_shouldShowEditButton"))
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editButtonTapped);
    if (-[EKEventViewControllerOOPWrapperImpl _shouldDisplayDoneButton](self, "_shouldDisplayDoneButton"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped);
      -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setLeftBarButtonItem:animated:", v12, v3);

      -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRightBarButtonItem:animated:", v8, v3);

    }
    else
    {
      -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItem:animated:", v12, v3);
    }

  }
  else if (-[EKEventViewControllerOOPWrapperImpl _shouldDisplayDoneButton](self, "_shouldDisplayDoneButton"))
  {
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_doneButtonTapped);
    -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRightBarButtonItem:animated:", v12, v3);

  }
  else
  {
    -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRightBarButtonItem:animated:", 0, v3);
  }

}

- (BOOL)_shouldShowEditButton
{
  return -[EKEventViewControllerOOPWrapperImpl allowsEditing](self, "allowsEditing")
      && -[EKEventViewControllerOOPWrapperImpl _backingEventAllowsEditing](self, "_backingEventAllowsEditing")
      && -[EKEventViewControllerOOPWrapperImpl canShowRealContent](self, "canShowRealContent");
}

- (BOOL)_backingEventAllowsEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEditable"))
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "calendar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isSuggestedEventCalendar") ^ 1;

    }
    else
    {
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_shouldDisplayDoneButton
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[EKEventViewControllerOOPWrapperImpl navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leftBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[EKEventViewControllerOOPWrapperImpl showsDoneButton](self, "showsDoneButton"))
  {
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "hidesBackButton") & 1) != 0 || v4 && objc_msgSend(v4, "systemItem"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v8 == v9;

    }
    else
    {
      v5 = 1;
    }

    if (!v5)
      goto LABEL_15;
  }
  if (v4)
  {
    if (!objc_msgSend(v4, "systemItem"))
      objc_msgSend(v3, "setLeftBarButtonItem:", 0);
    LOBYTE(v5) = 1;
  }
LABEL_15:

  return v5;
}

- (void)doneButtonTapped
{
  void *v3;
  id v4;

  if (-[EKEventViewControllerOOPWrapperImpl canShowRealContent](self, "canShowRealContent"))
  {
    -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doneButtonTapped");
  }
  else
  {
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventViewController:didCompleteWithAction:", v3, 0);

  }
}

- (void)editButtonTapped
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  EKEventEditViewController *v22;
  void *v23;
  void *v24;
  void *v25;

  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (-[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "eventViewControllerEditButtonTemporarilyDisabled:", v8),
        v8,
        v7,
        (v9 & 1) == 0))
  {
LABEL_4:
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "performSelector:withObject:", sel_eventViewControllerWillBeginEditingEvent_, self);

      }
    }
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_10;
    v16 = (void *)v15;
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0
      || (-[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v19, "eventViewDelegateShouldCreateOwnEditViewController:", v20),
          v20,
          v19,
          (v21 & 1) == 0))
    {
LABEL_10:
      v22 = objc_alloc_init(EKEventEditViewController);
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventEditViewController setEvent:](v22, "setEvent:", v23);

      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "eventStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventEditViewController setEventStore:](v22, "setEventStore:", v25);

      -[EKEventViewControllerOOPWrapperImpl setActiveEventEditor:](self, "setActiveEventEditor:", v22);
    }
    -[EKEventViewControllerOOPWrapperImpl presentEditorAnimated:](self, "presentEditorAnimated:", 1);
  }
}

- (BOOL)hasInProcessNavBar
{
  void *v2;
  void *v3;
  int v4;

  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "isNavigationBarHidden") ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_updateResponse
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;

  -[EKEventViewControllerOOPWrapperImpl _statusButtonsView](self, "_statusButtonsView");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "constraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "statusesAreAccurate") ^ 1;

  }
  else
  {
    v7 = 0;
  }
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "participationStatus");

  if (v7
    && (-[EKEventViewControllerOOPWrapperImpl event](self, "event"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isStatusDirty"),
        v10,
        !v11)
    || (unint64_t)(v9 - 2) > 2)
  {
    v12 = 0;
  }
  else
  {
    v12 = qword_1AFA134A0[v9 - 2];
  }
  objc_msgSend(v13, "setSelectedAction:", v12);

}

- (BOOL)_shouldDisplayStatusButtons
{
  void *v2;
  BOOL v3;

  -[EKEventViewControllerOOPWrapperImpl statusButtons](self, "statusButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_setupStatusToolbarButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SingleToolbarItemContainerView *statusButtonsContainerView;
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
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  if (-[EKEventViewControllerOOPWrapperImpl _shouldDisplayStatusButtons](self, "_shouldDisplayStatusButtons"))
  {
    -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToolbarHidden:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toolbar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v4);

    -[EKEventViewControllerOOPWrapperImpl toolbarItems](self, "toolbarItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7
      || (statusButtonsContainerView = self->_statusButtonsContainerView, v7, !statusButtonsContainerView))
    {
      -[EKEventViewControllerOOPWrapperImpl _statusButtonsContainerView](self, "_statusButtonsContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerOOPWrapperImpl _statusButtonsView](self, "_statusButtonsView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);
      v23 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v10, "leadingAnchor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "constraintEqualToAnchor:", v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v26;
      objc_msgSend(v10, "trailingAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "constraintEqualToAnchor:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v22;
      objc_msgSend(v10, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v13;
      objc_msgSend(v10, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "activateConstraints:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
      v29 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerOOPWrapperImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", v19, 1);

    }
  }
  else
  {
    -[EKEventViewControllerOOPWrapperImpl toolbarItems](self, "toolbarItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setToolbarHidden:", 1);

      -[EKEventViewControllerOOPWrapperImpl setToolbarItems:animated:](self, "setToolbarItems:animated:", 0, 1);
    }
  }
}

- (id)statusButtons
{
  return (id)objc_msgSend((id)objc_opt_class(), "_orderedActionsForMask:", -[EKEventViewControllerOOPWrapperImpl _actionsMask](self, "_actionsMask"));
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
    -[EKEventViewControllerOOPWrapperImpl statusButtons](self, "statusButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    -[EKUIEventStatusButtonsView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIEventStatusButtonsView setDisableButtonHighlights:](self->_statusButtonsView, "setDisableButtonHighlights:", -[EKEventViewControllerOOPWrapperImpl _isDisplayingInvitation](self, "_isDisplayingInvitation") ^ 1);
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

  -[EKEventViewControllerOOPWrapperImpl statusButtons](self, "statusButtons");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EKUIEventStatusButtonsView setActions:](self->_statusButtonsView, "setActions:", v3);

}

- (BOOL)canShowRealContent
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;

  v3 = objc_msgSend(MEMORY[0x1E0CAA078], "realAuthorizationStatusForEntityType:", 0);
  if (v3 == 4)
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isCurrentProcessCreatorOfEvent:", v6);

    if (v7)
      v3 = 4;
    else
      v3 = 2;
  }
  v8 = v3 - 3;
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 < 2 && v9 != 0;
}

- (BOOL)_shouldDisplayDelegateOrOutOfDateMessage
{
  return -[EKEventViewControllerOOPWrapperImpl showsOutOfDateMessage](self, "showsOutOfDateMessage")
      || -[EKEventViewControllerOOPWrapperImpl showsDelegatorMessage](self, "showsDelegatorMessage")
      || -[EKEventViewControllerOOPWrapperImpl showsDelegateMessage](self, "showsDelegateMessage");
}

- (BOOL)_isDisplayingInvitation
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[EKEventViewControllerOOPWrapperImpl allowsInviteResponses](self, "allowsInviteResponses");
  if (v3)
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsParticipationStatusModifications");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_isDisplayingDeletableEvent
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "allowsContentModifications") & 1) != 0)
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPrivateEventSharedToMe");

    if (!v6)
      return 1;
  }
  else
  {

  }
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "status") == 3)
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "calendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isDelegate"))
    {
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "calendar");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "source");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v14, "isWritable");

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)_actionsMask
{
  int64_t v3;

  if (-[EKEventViewControllerOOPWrapperImpl _shouldDisplayDelegateOrOutOfDateMessage](self, "_shouldDisplayDelegateOrOutOfDateMessage")|| !-[EKEventViewControllerOOPWrapperImpl canShowRealContent](self, "canShowRealContent"))
  {
    return 0;
  }
  if (-[EKEventViewControllerOOPWrapperImpl _isDisplayingInvitation](self, "_isDisplayingInvitation"))
    return 7;
  if (-[EKEventViewControllerOOPWrapperImpl isICSPreview](self, "isICSPreview"))
  {
    if (-[EKEventViewControllerOOPWrapperImpl showsAddToCalendarForICSPreview](self, "showsAddToCalendarForICSPreview"))
    {
      v3 = 8;
    }
    else if (-[EKEventViewControllerOOPWrapperImpl showsUpdateCalendarForICSPreview](self, "showsUpdateCalendarForICSPreview"))
    {
      v3 = 2048;
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 0;
  }
  if (-[EKEventViewControllerOOPWrapperImpl _isDisplayingDeletableEvent](self, "_isDisplayingDeletableEvent")
    && (!-[EKEventViewControllerOOPWrapperImpl isICSPreview](self, "isICSPreview")
     || -[EKEventViewControllerOOPWrapperImpl showsDeleteForICSPreview](self, "showsDeleteForICSPreview")))
  {
    return v3 | 0x10;
  }
  return v3;
}

+ (id)_orderedActionsForMask:(int64_t)a3
{
  void *v4;
  uint64_t i;
  void *v6;

  v4 = (void *)objc_opt_new();
  for (i = 0; i != 10; ++i)
  {
    if ((_orderedActionsForMask__actionOrder[i] & a3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
  return v4;
}

- (void)_prepareEventForEdit:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "calendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(v7, "eventStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "defaultCalendarForNewEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCalendar:", v5);

  }
  objc_msgSend(v7, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend((id)objc_opt_class(), "setDefaultDatesForEvent:", v7);

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
  if (a3 > 2047)
  {
    if (a3 < 0x2000)
    {
      if (a3 == 2048)
      {
LABEL_14:
        -[EKEventViewControllerOOPWrapperImpl _addToCalendarClicked:](self, "_addToCalendarClicked:", self);
      }
      else if (a3 == 4096)
      {
        -[EKEventViewControllerOOPWrapperImpl _acceptProposedTimeWithSourceViewForPopover:](self, "_acceptProposedTimeWithSourceViewForPopover:", v6);
      }
    }
    else
    {
      switch(a3)
      {
        case 0x2000:
          -[EKEventViewControllerOOPWrapperImpl _rejectProposedTime](self, "_rejectProposedTime");
          break;
        case 0x8000:
          -[EKEventViewControllerOOPWrapperImpl _cancelProposedTime](self, "_cancelProposedTime");
          break;
        case 0x80000:
LABEL_16:
          -[EKEventViewControllerOOPWrapperImpl _statusButtonsView](self, "_statusButtonsView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventViewControllerOOPWrapperImpl _deleteClicked:](self, "_deleteClicked:", v9);

          break;
      }
    }
  }
  else
  {
    v8 = 2;
    switch(a3)
    {
      case 1:
        goto LABEL_18;
      case 2:
        v8 = 4;
        goto LABEL_18;
      case 3:
      case 5:
      case 6:
      case 7:
        break;
      case 4:
        v8 = 3;
LABEL_18:
        -[EKEventViewControllerOOPWrapperImpl _saveStatus:sourceViewForPopover:](self, "_saveStatus:sourceViewForPopover:", v8, v6);
        break;
      case 8:
        goto LABEL_14;
      default:
        if (a3 == 16)
          goto LABEL_16;
        break;
    }
  }

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
  -[EKEventViewControllerOOPWrapperImpl event](self, "event", 0);
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
            -[EKEventViewControllerOOPWrapperImpl event](self, "event");
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
  -[EKEventViewControllerOOPWrapperImpl _proposedDate](self, "_proposedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
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
    if (objc_msgSend(v6, "hasRecurrenceRules"))
    {
      -[EKEventViewControllerOOPWrapperImpl presentationSourceViewController](self, "presentationSourceViewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __83__EKEventViewControllerOOPWrapperImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke;
      v22[3] = &unk_1E60197E8;
      v22[4] = self;
      +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v19, v4, v6, v22);
      v20 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
      recurrenceAlertController = self->_recurrenceAlertController;
      self->_recurrenceAlertController = v20;

    }
    else
    {
      -[EKEventViewControllerOOPWrapperImpl _performSave:animated:](self, "_performSave:animated:", 0, 0);
    }

  }
}

void __83__EKEventViewControllerOOPWrapperImpl__acceptProposedTimeWithSourceViewForPopover___block_invoke(uint64_t a1, uint64_t a2)
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
  -[EKEventViewControllerOOPWrapperImpl event](self, "event", 0);
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

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "hasRecurrenceRules"))
    v12 = 4;
  else
    v12 = 0;

  -[EKEventViewControllerOOPWrapperImpl _performSave:animated:](self, "_performSave:animated:", v12, 0);
}

- (void)_cancelProposedTime
{
  void *v3;

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProposedStartDate:", 0);

  -[EKEventViewControllerOOPWrapperImpl _performSave:animated:](self, "_performSave:animated:", 0, 0);
}

- (void)_saveStatus:(int64_t)a3 sourceViewForPopover:(id)a4
{
  id v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v6 = a4;
  if (a3)
  {
    v13 = v6;
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "responseMustApplyToAll");

    if ((v8 & 1) != 0)
    {
      v9 = 4;
    }
    else
    {
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasRecurrenceRules");

      if ((v11 & 1) != 0)
      {
        self->_pendingStatus = a3;
        -[EKEventViewControllerOOPWrapperImpl _presentDetachSheetFromView:](self, "_presentDetachSheetFromView:", v13);
LABEL_8:
        v6 = v13;
        goto LABEL_9;
      }
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "isDetached");

      v9 = 0;
    }
    -[EKEventViewControllerOOPWrapperImpl _saveStatus:span:](self, "_saveStatus:span:", a3, v9);
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_saveStatus:(int64_t)a3 span:(int64_t)a4
{
  void *v7;
  void *v8;

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setParticipationStatus:", a3);

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInvitationStatus:", 0);

  -[EKEventViewControllerOOPWrapperImpl _performSave:animated:](self, "_performSave:animated:", a4, 1);
}

- (BOOL)_performSave:(int64_t)a3 animated:(BOOL)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v14;

  -[UIResponder EKUI_editor](self, "EKUI_editor", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v6, "saveEvent:span:error:", v7, a3, &v14);
  v9 = v14;

  if ((v8 & 1) == 0 && v9)
  {
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != (void *)*MEMORY[0x1E0CA9E60])
    {
LABEL_6:

      goto LABEL_7;
    }
    v11 = objc_msgSend(v9, "code");

    if (v11 == 1010)
    {
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "eventStore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "rollback");

      goto LABEL_6;
    }
  }
LABEL_7:
  -[EKEventViewControllerOOPWrapperImpl completeWithAction:](self, "completeWithAction:", 1);

  return 1;
}

- (void)_deleteClicked:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  EKUIRecurrenceAlertController *v22;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  _QWORD aBlock[5];
  id v25;
  BOOL v26;

  v4 = a3;
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__EKEventViewControllerOOPWrapperImpl__deleteClicked___block_invoke;
  aBlock[3] = &unk_1E601A850;
  aBlock[4] = self;
  v26 = v6 == 3;
  v8 = v7;
  v25 = v8;
  v9 = _Block_copy(aBlock);
  -[EKEventViewControllerOOPWrapperImpl presentationSourceViewController](self, "presentationSourceViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "buttonForAction:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (v6 == 3)
    v12 = 5;
  else
    v12 = 4;
  objc_msgSend(v11, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIRecurrenceAlertController presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDeleteAlertWithOptions:viewController:sourceView:sourceRect:forEvent:stringForDeleteButton:withCompletionHandler:", v12, v10, v11, v21, 0, v9, v14, v16, v18, v20);
  v22 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();
  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v22;

}

void __54__EKEventViewControllerOOPWrapperImpl__deleteClicked___block_invoke(uint64_t a1, uint64_t a2)
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

- (void)_performDelete:(int64_t)a3 editor:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = (void *)MEMORY[0x1E0CAA068];
  v7 = a4;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleEventDeletion:", v9);

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  LOBYTE(v9) = objc_msgSend(v7, "deleteEvent:span:error:", v10, a3, &v15);

  v11 = v15;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 != (void *)*MEMORY[0x1E0CA9E60])
    {
LABEL_5:

      goto LABEL_6;
    }
    v13 = objc_msgSend(v11, "code");

    if (v13 == 1010)
    {
      -[EKEventViewControllerOOPWrapperImpl event](self, "event");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "eventStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rollback");

      goto LABEL_5;
    }
  }
LABEL_6:
  -[EKEventViewControllerOOPWrapperImpl completeWithAction:](self, "completeWithAction:", 2);

}

- (void)_addToCalendarClicked:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performSelector:withObject:", sel_eventViewControllerDidRequestAddToCalendar_, self);

    }
  }
}

- (void)_presentDetachSheetFromView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  EKUIRecurrenceAlertController *v15;
  EKUIRecurrenceAlertController *recurrenceAlertController;
  id v17;

  v4 = a3;
  -[EKEventViewControllerOOPWrapperImpl _detachSheetHandler](self, "_detachSheetHandler");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl presentationSourceViewController](self, "presentationSourceViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKUIRecurrenceAlertController presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:](EKUIRecurrenceAlertController, "presentDetachAlertWithOptions:viewController:sourceView:sourceRect:forEvent:withCompletionHandler:", 0, v5, v4, v14, v17, v7, v9, v11, v13);
  v15 = (EKUIRecurrenceAlertController *)objc_claimAutoreleasedReturnValue();

  recurrenceAlertController = self->_recurrenceAlertController;
  self->_recurrenceAlertController = v15;

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
  v6[2] = __58__EKEventViewControllerOOPWrapperImpl__detachSheetHandler__block_invoke;
  v6[3] = &unk_1E601A878;
  v6[4] = self;
  v7 = v2;
  v3 = _Block_copy(v6);
  v4 = _Block_copy(v3);

  return v4;
}

void __58__EKEventViewControllerOOPWrapperImpl__detachSheetHandler__block_invoke(uint64_t a1, uint64_t a2)
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
        objc_msgSend(v3, "_saveStatus:span:", v3[122], a2);
      else
        objc_msgSend(v3, "_performSave:animated:", a2, 1);
LABEL_7:
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 992);
      *(_QWORD *)(v4 + 992) = 0;

      return;
  }
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  -[EKEventViewControllerOOPWrapperImpl invokeAction:eventStatusButtonsView:](self, "invokeAction:eventStatusButtonsView:", a4, a3, a5, a6);
}

- (double)eventStatusButtonsViewButtonFontSize:(id)a3
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)eventStatusButtonsView:(id)a3 calculatedFontSizeToFit:(double)a4
{
  self->_statusButtonsViewCachedFontSize = a4;
}

- (void)setEvent:(id)a3
{
  id v4;
  EKEventStore *v5;
  EKEventStore *eventStore;
  id v7;

  v4 = a3;
  -[EKEventViewControllerOOPWrapperImpl _prepareEventForEdit:](self, "_prepareEventForEdit:", v4);
  objc_msgSend(v4, "eventStore");
  v5 = (EKEventStore *)objc_claimAutoreleasedReturnValue();
  eventStore = self->_eventStore;
  self->_eventStore = v5;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEvent:", v4);

}

- (EKEvent)event
{
  void *v2;
  void *v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEvent *)v3;
}

- (void)setAllowsEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsEditing:", v3);

}

- (BOOL)allowsEditing
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsEditing");

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (EKEventViewDelegate)delegate
{
  void *v2;
  void *v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EKEventViewDelegate *)v3;
}

- (void)setAllowsCalendarPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsCalendarPreview:", v3);

}

- (BOOL)allowsCalendarPreview
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsCalendarPreview");

  return v3;
}

- (void)setCalendarPreviewIsInlineDayView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendarPreviewIsInlineDayView:", v3);

}

- (BOOL)calendarPreviewIsInlineDayView
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "calendarPreviewIsInlineDayView");

  return v3;
}

- (void)setInlineDayViewRespectsSelectedCalendarsFilter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInlineDayViewRespectsSelectedCalendarsFilter:", v3);

}

- (BOOL)inlineDayViewRespectsSelectedCalendarsFilter
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inlineDayViewRespectsSelectedCalendarsFilter");

  return v3;
}

- (void)setICSPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setICSPreview:", v3);

}

- (BOOL)isICSPreview
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ICSPreview");

  return v3;
}

- (void)setAllowsInviteResponses:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsInviteResponses:", v3);

}

- (BOOL)allowsInviteResponses
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsInviteResponses");

  return v3;
}

- (void)setShowsAddToCalendarForICSPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsAddToCalendarForICSPreview:", v3);

}

- (BOOL)showsAddToCalendarForICSPreview
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsAddToCalendarForICSPreview");

  return v3;
}

- (void)setShowsUpdateCalendarForICSPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsUpdateCalendarForICSPreview:", v3);

}

- (BOOL)showsUpdateCalendarForICSPreview
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsUpdateCalendarForICSPreview");

  return v3;
}

- (void)setShowsDeleteForICSPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDeleteForICSPreview:", v3);

}

- (BOOL)showsDeleteForICSPreview
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDeleteForICSPreview");

  return v3;
}

- (void)setAllowsSubitems:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsSubitems:", v3);

}

- (BOOL)allowsSubitems
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsSubitems");

  return v3;
}

- (void)setShowsDoneButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDoneButton:", v3);

}

- (BOOL)showsDoneButton
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDoneButton");

  return v3;
}

- (void)setShowsOutOfDateMessage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsOutOfDateMessage:", v3);

}

- (BOOL)showsOutOfDateMessage
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsOutOfDateMessage");

  return v3;
}

- (void)setShowsDelegatorMessage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDelegatorMessage:", v3);

}

- (BOOL)showsDelegatorMessage
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDelegatorMessage");

  return v3;
}

- (void)setShowsDelegateMessage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDelegateMessage:", v3);

}

- (BOOL)showsDelegateMessage
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDelegateMessage");

  return v3;
}

- (void)setShowsDetectedConferenceItem:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsDetectedConferenceItem:", v3);

}

- (BOOL)showsDetectedConferenceItem
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsDetectedConferenceItem");

  return v3;
}

- (void)setMinimalMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimalMode:", v3);

}

- (BOOL)minimalMode
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "minimalMode");

  return v3;
}

- (void)setNoninteractivePlatterMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNoninteractivePlatterMode:", v3);

}

- (BOOL)noninteractivePlatterMode
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "noninteractivePlatterMode");

  return v3;
}

- (void)setIsLargeDayView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsLargeDayView:", v3);

}

- (BOOL)isLargeDayView
{
  void *v2;
  char v3;

  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLargeDayView");

  return v3;
}

- (int)editorShowTransition
{
  return 8;
}

- (int)editorHideTransition
{
  return 9;
}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4 waitUntil:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a5;
  objc_msgSend(a3, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl setEvent:](self, "setEvent:", v8);

  if (a4 == 2)
  {
    -[EKEventViewControllerOOPWrapperImpl completeWithAction:](self, "completeWithAction:", 2);
  }
  else
  {
    -[EKEventViewControllerOOPWrapperImpl event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eventIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerOOPWrapperImpl reloadRemoteViewWithUpdatedEventID:waitUntil:](self, "reloadRemoteViewWithUpdatedEventID:waitUntil:", v10, v11);

    -[EKEventViewControllerOOPWrapperImpl _dismissEditor:deleted:](self, "_dismissEditor:deleted:", 1, 0);
  }

}

- (id)activeEventEditor
{
  return self->_activeEventEditor;
}

- (void)setActiveEventEditor:(id)a3
{
  EKEventEditViewController *v4;
  void *v5;
  void *v6;
  _BOOL4 IsRegular;
  void *v8;
  char v9;
  void *v10;
  EKEventEditViewController *activeEventEditor;

  v4 = (EKEventEditViewController *)a3;
  -[EKEventEditViewController setEditViewDelegate:](v4, "setEditViewDelegate:", self);
  -[EKEventViewControllerOOPWrapperImpl view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsRegularInViewHierarchy(v5))
  {
    -[EKEventViewControllerOOPWrapperImpl view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsRegular = EKUICurrentHeightSizeClassIsRegular(v6);

    if (IsRegular)
      -[EKEventEditViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 3);
  }
  else
  {

  }
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventEditViewController setModalPresentationStyle:](v4, "setModalPresentationStyle:", objc_msgSend(v10, "editorPresentationStyle"));

  }
  activeEventEditor = self->_activeEventEditor;
  self->_activeEventEditor = v4;

}

- (void)presentEditorAnimated:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  EKEventEditViewController *v18;

  v3 = a3;
  v18 = self->_activeEventEditor;
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1EEED63E8))
    goto LABEL_6;
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "eventViewDelegateShouldHandlePresentationOfEditViewController:", v8);

  if (v9)
  {
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "eventViewController:requestsDisplayOfEditViewController:animated:", v11, v18, v3);

LABEL_12:
    goto LABEL_13;
  }
LABEL_7:
  if (v18)
  {
    if ((_DWORD)v3
      && (v3 = -[EKEventViewControllerOOPWrapperImpl editorShowTransition](self, "editorShowTransition"), (_DWORD)v3 == 8))
    {
      -[EKEventViewControllerOOPWrapperImpl _viewControllerForEditorPresentation](self, "_viewControllerForEditorPresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentViewController:animated:completion:", v18, 1, 0);
    }
    else
    {
      -[EKEventViewControllerOOPWrapperImpl _viewControllerForEditorPresentation](self, "_viewControllerForEditorPresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentModalViewController:withTransition:", v18, v3);
    }
    goto LABEL_12;
  }
LABEL_13:
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "performSelector:withObject:", sel_eventViewControllerDidBeginEditingEventWithEditViewController_, v18);

    }
  }
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "eventEditViewPresented:", 1);

}

- (id)_viewControllerForEditorPresentation
{
  void *v3;
  EKEventViewControllerOOPWrapperImpl *v4;

  -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
    v4 = (EKEventViewControllerOOPWrapperImpl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (void)_dismissEditor:(BOOL)a3 deleted:(BOOL)a4
{
  EKEventEditViewController *activeEventEditor;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  EKEventEditViewController *v27;
  id v28;

  activeEventEditor = self->_activeEventEditor;
  if (activeEventEditor)
  {
    v6 = a4;
    if ((-[EKEventEditViewController isBeingDismissed](activeEventEditor, "isBeingDismissed", a3) & 1) == 0)
    {
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EEED63E8);

        if (v10)
        {
          -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_opt_respondsToSelector();

          if ((v12 & 1) != 0)
          {
            -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "eventViewControllerWillFinishEditingEvent:deleted:", v14, v6);

          }
          -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_opt_respondsToSelector();

          -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v16 & 1) != 0)
          {
            -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "eventViewController:requestsDismissalOfEditViewController:", v18, self->_activeEventEditor);
            goto LABEL_19;
          }
          v19 = objc_opt_respondsToSelector();

          if ((v19 & 1) != 0)
          {
            -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "eventViewController:willDismissEditViewController:deleted:", v21, self->_activeEventEditor, v6);

          }
          v10 = 1;
        }
      }
      else
      {
        v10 = 0;
      }
      v22 = -[EKEventViewControllerOOPWrapperImpl editorHideTransition](self, "editorHideTransition");
      -[EKEventEditViewController presentingViewController](self->_activeEventEditor, "presentingViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22 == 9)
        objc_msgSend(v23, "dismissViewControllerAnimated:completion:", 1, 0);
      else
        objc_msgSend(v23, "dismissViewControllerWithTransition:completion:", -[EKEventViewControllerOOPWrapperImpl editorHideTransition](self, "editorHideTransition"), 0);

      if (!v10)
        goto LABEL_20;
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_opt_respondsToSelector();

      if ((v26 & 1) == 0)
        goto LABEL_20;
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "eventViewController:didDismissEditViewController:deleted:", v18, self->_activeEventEditor, v6);
LABEL_19:

LABEL_20:
      -[EKEventEditViewController setEditViewDelegate:](self->_activeEventEditor, "setEditViewDelegate:", 0);
      v27 = self->_activeEventEditor;
      self->_activeEventEditor = 0;

    }
  }
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc", a3, a4);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "eventEditViewPresented:", 0);

}

- (BOOL)_shouldPopSelf
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "eventViewControllerShouldDismissSelf:", v8);

  return v9;
}

- (void)completeWithAction:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;

  -[EKEventViewControllerOOPWrapperImpl _dismissEditor:deleted:](self, "_dismissEditor:deleted:", 0, a3 == 2);
  -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v8 = (id)v5;
    -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = -[EKEventViewControllerOOPWrapperImpl _shouldPopSelf](self, "_shouldPopSelf");

      if (v7)
        return;
      -[EKEventViewControllerOOPWrapperImpl delegate](self, "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "eventViewController:didCompleteWithAction:", v6, a3);
    }

  }
}

- (void)setNeedsReload
{
  void *v3;
  id v4;

  -[EKEventViewControllerOOPWrapperImpl event](self, "event");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl reloadRemoteViewWithUpdatedEventID:waitUntil:](self, "reloadRemoteViewWithUpdatedEventID:waitUntil:", v3, 0);

}

- (void)fullReloadWithNewEvent:(id)a3
{
  id v4;

  objc_msgSend(a3, "eventIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventViewControllerOOPWrapperImpl reloadRemoteViewWithUpdatedEventID:waitUntil:](self, "reloadRemoteViewWithUpdatedEventID:waitUntil:", v4, 0);

}

- (void)reloadRemoteViewWithUpdatedEventID:(id)a3 waitUntil:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[EKEventViewControllerOOPWrapperImpl vc](self, "vc");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "eventEditViewCompletedWith:eventID:waitUntil:", 1, v7, v6);

}

- (void)performAddToCalendar
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF84D000, v2, OS_LOG_TYPE_ERROR, "performAddToCalendar not permitted on out-of-process EKEventViewController.", v3, 2u);
  }
}

- (id)presentationSourceViewController
{
  void *v3;
  EKEventViewControllerOOPWrapperImpl *v4;

  -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[EKEventViewControllerOOPWrapperImpl navigationController](self, "navigationController");
    v4 = (EKEventViewControllerOOPWrapperImpl *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self;
  }
  return v4;
}

- (void)setToolbarItems:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarItems:", v4);

}

- (id)toolbarItems
{
  void *v2;
  void *v3;

  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
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
  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToolbarItems:animated:", v6, v4);

}

- (id)navigationItem
{
  void *v2;
  void *v3;

  -[EKEventViewControllerOOPWrapperImpl _ekEventViewController](self, "_ekEventViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)eventEditViewPresented
{
  return self->_eventEditViewPresented;
}

- (void)setEventEditViewPresented:(BOOL)a3
{
  self->_eventEditViewPresented = a3;
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (UIScrollView)eventDetailsScrollView
{
  return self->eventDetailsScrollView;
}

- (UIViewController)eventDetailsViewController
{
  return self->eventDetailsViewController;
}

- (_TtC10EventKitUI28EKEventViewControllerOOPImpl)vc
{
  return self->_vc;
}

- (void)setVc:(id)a3
{
  objc_storeStrong((id *)&self->_vc, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->eventDetailsViewController, 0);
  objc_storeStrong((id *)&self->eventDetailsScrollView, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_recurrenceAlertController, 0);
  objc_storeStrong((id *)&self->_activeEventEditor, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

@end
