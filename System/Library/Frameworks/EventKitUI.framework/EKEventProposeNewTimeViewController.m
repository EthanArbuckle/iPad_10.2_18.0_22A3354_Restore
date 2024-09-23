@implementation EKEventProposeNewTimeViewController

- (EKEventProposeNewTimeViewController)initWithEvent:(id)a3 model:(id)a4
{
  id v6;
  id v7;
  EKEventProposeNewTimeViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id from;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)EKEventProposeNewTimeViewController;
  v8 = -[EKEventProposeNewTimeViewController initWithNibName:bundle:](&v27, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    EventKitUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Propose New Time"), &stru_1E601DFA8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController setTitle:](v8, "setTitle:", v10);

    objc_msgSend(v6, "proposedStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[EKEventProposeNewTimeViewController setOriginalDate:](v8, "setOriginalDate:", v11);
    }
    else
    {
      objc_msgSend(v6, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventProposeNewTimeViewController setOriginalDate:](v8, "setOriginalDate:", v12);

    }
    objc_msgSend(v6, "proposedStartDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController setProposedStartDate:](v8, "setProposedStartDate:", v13);

    -[EKEventProposeNewTimeViewController setEvent:](v8, "setEvent:", v6);
    -[EKEventProposeNewTimeViewController setResetConflictResolutionSections:](v8, "setResetConflictResolutionSections:", 1);
    objc_storeStrong((id *)&v8->_model, a4);
    objc_initWeak(&location, v8);
    v14 = objc_alloc(MEMORY[0x1E0CAA0A0]);
    v15 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke;
    v24[3] = &unk_1E6018A48;
    objc_copyWeak(&v25, &location);
    v16 = (void *)objc_msgSend(v14, "initWithStateChangedCallback:", v24);
    -[EKEventProposeNewTimeViewController setAvailabilitySearcher:](v8, "setAvailabilitySearcher:", v16);

    -[EKEventProposeNewTimeViewController availabilitySearcher](v8, "availabilitySearcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNoConflictRequired:", 1);

    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&from, v8);
    v21[0] = v15;
    v21[1] = 3221225472;
    v21[2] = __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_3;
    v21[3] = &unk_1E6018610;
    objc_copyWeak(&v22, &from);
    v19 = (id)-[EKEventProposeNewTimeViewController registerForTraitChanges:withHandler:](v8, "registerForTraitChanges:withHandler:", v18, v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_2;
  v3[3] = &unk_1E6018A20;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(v4);
}

void __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_searcherStateChanged:", *(_QWORD *)(a1 + 40));

}

void __59__EKEventProposeNewTimeViewController_initWithEvent_model___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;

  v16 = a2;
  v5 = a3;
  objc_msgSend(v16, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_presentationSemanticContext");
  v8 = objc_msgSend(v5, "_presentationSemanticContext");

  if (v7 != v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "resetBackgroundColor");

  }
  v10 = objc_msgSend(v5, "horizontalSizeClass");
  objc_msgSend(v16, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == objc_msgSend(v11, "horizontalSizeClass"))
  {
    v12 = objc_msgSend(v5, "verticalSizeClass");
    objc_msgSend(v16, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "verticalSizeClass");

    if (v12 == v14)
      goto LABEL_8;
  }
  else
  {

  }
  v15 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v15, "_updateStatusButtons");

LABEL_8:
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CA9F70];
  -[EKEventProposeNewTimeViewController event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, v4, v5);

  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);
  v6.receiver = self;
  v6.super_class = (Class)EKEventProposeNewTimeViewController;
  -[EKEventProposeNewTimeViewController dealloc](&v6, sel_dealloc);
}

- (id)_statusButtons
{
  return &unk_1E606F8C0;
}

- (EKUIEventStatusButtonsView)statusButtonsView
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
    -[EKEventProposeNewTimeViewController _statusButtons](self, "_statusButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[EKUIEventStatusButtonsView initWithFrame:actions:delegate:options:](v4, "initWithFrame:actions:delegate:options:", v5, self, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v7 = self->_statusButtonsView;
    self->_statusButtonsView = v6;

    -[EKUIEventStatusButtonsView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusButtonsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKUIEventStatusButtonsView setDisableButtonHighlights:](self->_statusButtonsView, "setDisableButtonHighlights:", 0);
    -[EKUIEventStatusButtonsView setTextSizeMode:](self->_statusButtonsView, "setTextSizeMode:", 1);
    statusButtonsView = self->_statusButtonsView;
  }
  return statusButtonsView;
}

- (SingleToolbarItemContainerView)statusButtonsContainerView
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

    statusButtonsContainerView = self->_statusButtonsContainerView;
  }
  return statusButtonsContainerView;
}

- (void)_updateStatusButtons
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
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
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
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
  _QWORD v42[5];

  v42[4] = *MEMORY[0x1E0C80C00];
  -[EKEventProposeNewTimeViewController _statusButtons](self, "_statusButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController setStatusButtonsViewCachedFontSize:](self, "setStatusButtonsViewCachedFontSize:", 0.0);
  -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToolbarHidden:", 0);

    -[EKEventProposeNewTimeViewController toolbarItems](self, "toolbarItems");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6
      || (v7 = (void *)v6,
          -[EKEventProposeNewTimeViewController statusButtonsContainerView](self, "statusButtonsContainerView"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          !v8))
    {
      -[EKEventProposeNewTimeViewController statusButtonsContainerView](self, "statusButtonsContainerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventProposeNewTimeViewController statusButtonsView](self, "statusButtonsView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", v10);
      v34 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v10, "leadingAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "leadingAnchor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v38);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = v37;
      objc_msgSend(v10, "trailingAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "trailingAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v35);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = v33;
      objc_msgSend(v10, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topAnchor");
      v40 = v3;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v42[2] = v13;
      objc_msgSend(v10, "bottomAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bottomAnchor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToAnchor:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42[3] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "activateConstraints:", v17);

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v9);
      v41 = v18;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventProposeNewTimeViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v19, 1);

      v3 = v40;
    }
    -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "toolbar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[EKEventProposeNewTimeViewController statusButtonsContainerView](self, "statusButtonsContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBoundsWithToolbar:", v21);

    -[EKEventProposeNewTimeViewController statusButtonsContainerView](self, "statusButtonsContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    -[EKEventProposeNewTimeViewController statusButtonsContainerView](self, "statusButtonsContainerView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v28 = v27;

    -[EKEventProposeNewTimeViewController statusButtonsView](self, "statusButtonsView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFrame:", 0.0, 0.0, v25, v28);

    -[EKEventProposeNewTimeViewController statusButtonsView](self, "statusButtonsView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setActions:", v3);

  }
  else
  {
    -[EKEventProposeNewTimeViewController toolbarItems](self, "toolbarItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setToolbarHidden:", 1);

      -[EKEventProposeNewTimeViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", 0, 1);
    }
  }

}

- (void)loadView
{
  EKUIEventInviteesView *v3;
  EKUIEventInviteesView *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__eventModified_, *MEMORY[0x1E0CA9F70], self->_event);
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__fontSizeDefinitionsChanged_, *MEMORY[0x1E0DC48E8], 0);
  v3 = [EKUIEventInviteesView alloc];
  v4 = -[EKUIEventInviteesView initWithFrame:style:](v3, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[EKUIEventInviteesView setDelegate:](v4, "setDelegate:", self);
  -[EKUIEventInviteesView setDataSource:](v4, "setDataSource:", self);
  -[EKEventProposeNewTimeViewController setTableView:](self, "setTableView:", v4);
  -[EKEventProposeNewTimeViewController resetBackgroundColor](self, "resetBackgroundColor");

}

- (void)resetBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  id v5;

  v3 = -[UIViewController isPresentedInsidePopover](self, "isPresentedInsidePopover");
  -[EKEventProposeNewTimeViewController tableView](self, "tableView");
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
  EKEventDateEditItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EKUIInviteesViewOriginalConflictSection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  EKUIInviteesViewAllInviteesCanAttendSection *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  EKUIInviteesViewSomeInviteesCanAttendSection *v30;
  void *v31;
  void *v32;
  EKUIInviteesViewAvailabilitySection *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t j;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[4];
  id v102;
  id v103;
  _QWORD v104[4];
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD v123[4];
  id v124;
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[5];
  id v129;
  _QWORD v130[4];
  id v131;
  _QWORD aBlock[4];
  id v133;
  id v134;
  _QWORD v135[4];
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  id location;
  objc_super v142;
  _QWORD v143[2];
  uint8_t v144[128];
  uint8_t buf[4];
  void *v146;
  _QWORD v147[3];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v142.receiver = self;
  v142.super_class = (Class)EKEventProposeNewTimeViewController;
  -[EKEventProposeNewTimeViewController viewDidLoad](&v142, sel_viewDidLoad);
  objc_initWeak(&location, self);
  v3 = objc_alloc_init(EKEventDateEditItem);
  -[EKEventProposeNewTimeViewController setProposeTimeItem:](self, "setProposeTimeItem:", v3);

  -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProposedTime:", 1);

  -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "eventStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCalendarItem:store:", v6, v8);

  -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEventDateEditItemDelegate:", self);

  v11 = objc_alloc_init(EKUIInviteesViewOriginalConflictSection);
  -[EKEventProposeNewTimeViewController setOriginalConflictSection:](self, "setOriginalConflictSection:", v11);

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "clearCheckmark");

  -[EKEventProposeNewTimeViewController event](self, "event");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimeZone:", v14);

  EventKitUIBundle();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Original Time"), &stru_1E601DFA8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTitle:", v17);

  v19 = objc_alloc_init(EKUIInviteesViewAllInviteesCanAttendSection);
  -[EKEventProposeNewTimeViewController setAllInviteesCanAttendSection:](self, "setAllInviteesCanAttendSection:", v19);

  -[EKEventProposeNewTimeViewController event](self, "event");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "startTimeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimeZone:", v21);

  -[EKEventProposeNewTimeViewController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICatalyst())
    objc_msgSend(v23, "setSeparatorStyle:", 1);
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  -[EKEventProposeNewTimeViewController event](self, "event");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "attendees");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v138;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v138 != v27)
          objc_enumerationMutation(v25);
        v29 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * i);
        if ((objc_msgSend(v29, "isCurrentUser") & 1) == 0 && objc_msgSend(v29, "participantRole") != 3)
        {

          v30 = objc_alloc_init(EKUIInviteesViewSomeInviteesCanAttendSection);
          -[EKEventProposeNewTimeViewController setSomeInviteesCanAttendSection:](self, "setSomeInviteesCanAttendSection:", v30);

          -[EKEventProposeNewTimeViewController event](self, "event");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "startTimeZone");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setTimeZone:", v31);

          v93 = 1;
          goto LABEL_14;
        }
      }
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v137, v148, 16);
      if (v26)
        continue;
      break;
    }
  }
  v93 = 0;
LABEL_14:

  v33 = objc_alloc_init(EKUIInviteesViewAvailabilitySection);
  -[EKEventProposeNewTimeViewController setViewAvailabilitySection:](self, "setViewAvailabilitySection:", v33);

  -[EKEventProposeNewTimeViewController viewAvailabilitySection](self, "viewAvailabilitySection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setIsForAttendeeProposedTime:", 1);

  -[EKEventProposeNewTimeViewController viewAvailabilitySection](self, "viewAvailabilitySection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController event](self, "event");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "updateWithEvent:", v36);

  v37 = MEMORY[0x1E0C809B0];
  v135[0] = MEMORY[0x1E0C809B0];
  v135[1] = 3221225472;
  v135[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke;
  v135[3] = &unk_1E6018A70;
  objc_copyWeak(&v136, &location);
  -[EKEventProposeNewTimeViewController viewAvailabilitySection](self, "viewAvailabilitySection");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setViewAvailabilityTapped:", v135);

  aBlock[0] = v37;
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2;
  aBlock[3] = &unk_1E6018A98;
  objc_copyWeak(&v134, &location);
  v39 = v23;
  v133 = v39;
  v40 = _Block_copy(aBlock);
  v130[0] = v37;
  v130[1] = 3221225472;
  v130[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_42;
  v130[3] = &unk_1E6018AC0;
  objc_copyWeak(&v131, &location);
  v41 = _Block_copy(v130);
  v128[0] = v37;
  v128[1] = 3221225472;
  v128[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_45;
  v128[3] = &unk_1E6018AE8;
  objc_copyWeak(&v129, &location);
  v128[4] = self;
  v42 = _Block_copy(v128);
  v126[0] = v37;
  v126[1] = 3221225472;
  v126[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_47;
  v126[3] = &unk_1E6018B10;
  v43 = v39;
  v127 = v43;
  v95 = _Block_copy(v126);
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController availabilitySearcher](self, "availabilitySearcher");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAvailabilitySearcher:", v45);

  v123[0] = v37;
  v123[1] = 3221225472;
  v123[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_49;
  v123[3] = &unk_1E6018B38;
  objc_copyWeak(&v125, &location);
  v46 = v41;
  v124 = v46;
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setShowPreviewOfEventAtTime:", v123);

  v120[0] = v37;
  v120[1] = 3221225472;
  v120[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2_51;
  v120[3] = &unk_1E6018B60;
  v48 = v40;
  v121 = v48;
  objc_copyWeak(&v122, &location);
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setTableViewCellHook:", v120);

  v117[0] = v37;
  v117[1] = 3221225472;
  v117[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_3;
  v117[3] = &unk_1E6018B88;
  v50 = v42;
  v118 = v50;
  objc_copyWeak(&v119, &location);
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setNewTimeChosen:", v117);

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController availabilitySearcher](self, "availabilitySearcher");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAvailabilitySearcher:", v53);

  v115[0] = v37;
  v115[1] = 3221225472;
  v115[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_4;
  v115[3] = &unk_1E6018BB0;
  v90 = v46;
  v116 = v90;
  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setShowPreviewOfEventAtTime:", v115);

  v112[0] = v37;
  v112[1] = 3221225472;
  v112[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_5;
  v112[3] = &unk_1E6018B60;
  v89 = v48;
  v113 = v89;
  objc_copyWeak(&v114, &location);
  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setTableViewCellHook:", v112);

  v109[0] = v37;
  v109[1] = 3221225472;
  v109[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_6;
  v109[3] = &unk_1E6018B88;
  v88 = v50;
  v110 = v88;
  objc_copyWeak(&v111, &location);
  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setNewTimeChosen:", v109);

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setShowMoreAlternativeTimesTapped:", v95);

  if (v93)
  {
    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController availabilitySearcher](self, "availabilitySearcher");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setAvailabilitySearcher:", v59);

    v107[0] = v37;
    v107[1] = 3221225472;
    v107[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_7;
    v107[3] = &unk_1E6018BB0;
    v108 = v90;
    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setShowPreviewOfEventAtTime:", v107);

    v104[0] = v37;
    v104[1] = 3221225472;
    v104[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_8;
    v104[3] = &unk_1E6018B60;
    v105 = v89;
    objc_copyWeak(&v106, &location);
    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setTableViewCellHook:", v104);

    v101[0] = v37;
    v101[1] = 3221225472;
    v101[2] = __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_9;
    v101[3] = &unk_1E6018B88;
    v102 = v88;
    objc_copyWeak(&v103, &location);
    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setNewTimeChosen:", v101);

    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setShowMoreAlternativeTimesTapped:", v95);

    objc_destroyWeak(&v103);
    objc_destroyWeak(&v106);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController viewAvailabilitySection](self, "viewAvailabilitySection");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v64;
  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v65;
  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v66;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v147, 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "addObjectsFromArray:", v67);

  if (v93)
  {
    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "addObject:", v68);

  }
  -[EKEventProposeNewTimeViewController setSections:](self, "setSections:", v96);
  v69 = (id)kEKUILogInviteesHandle;
  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
  {
    -[EKEventProposeNewTimeViewController sections](self, "sections");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v146 = v70;
    _os_log_impl(&dword_1AF84D000, v69, OS_LOG_TYPE_DEBUG, "Set up sections: [%@].", buf, 0xCu);

  }
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[EKEventProposeNewTimeViewController sections](self, "sections");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v97, v144, 16);
  if (v72)
  {
    v73 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v72; ++j)
      {
        if (*(_QWORD *)v98 != v73)
          objc_enumerationMutation(v71);
        objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * j), "reloadAndRegisterReusableCellsWithTableView:", v43);
      }
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v97, v144, 16);
    }
    while (v72);
  }

  -[EKEventProposeNewTimeViewController _updateStatusButtons](self, "_updateStatusButtons");
  v75 = objc_alloc_init(MEMORY[0x1E0DC3438]);
  -[EKEventProposeNewTimeViewController setAvailabilitySearcherRunningSpinner:](self, "setAvailabilitySearcherRunningSpinner:", v75);

  -[EKEventProposeNewTimeViewController availabilitySearcherRunningSpinner](self, "availabilitySearcherRunningSpinner");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[EKEventProposeNewTimeViewController view](self, "view");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController availabilitySearcherRunningSpinner](self, "availabilitySearcherRunningSpinner");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "addSubview:", v78);

  v87 = (void *)MEMORY[0x1E0CB3718];
  -[EKEventProposeNewTimeViewController availabilitySearcherRunningSpinner](self, "availabilitySearcherRunningSpinner");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "centerXAnchor");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController view](self, "view");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "centerXAnchor");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "constraintEqualToAnchor:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v80;
  -[EKEventProposeNewTimeViewController availabilitySearcherRunningSpinner](self, "availabilitySearcherRunningSpinner");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "centerYAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController view](self, "view");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "centerYAnchor");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "constraintEqualToAnchor:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v85;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v143, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "activateConstraints:", v86);

  -[EKEventProposeNewTimeViewController _refreshIfNeeded](self, "_refreshIfNeeded");
  objc_destroyWeak(&v111);

  objc_destroyWeak(&v114);
  objc_destroyWeak(&v119);

  objc_destroyWeak(&v122);
  objc_destroyWeak(&v125);

  objc_destroyWeak(&v129);
  objc_destroyWeak(&v131);

  objc_destroyWeak(&v134);
  objc_destroyWeak(&v136);

  objc_destroyWeak(&location);
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "viewAvailabilityTapped");

}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (a3 < 0)
  {
    v11 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)MEMORY[0x1E0CB37E8];
      v13 = v11;
      objc_msgSend(v12, "numberWithInteger:", a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v14;
      _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_ERROR, "Invalid row index given: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v5, "sectionShouldBeShown"))
  {
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_msgSend(WeakRetained, "_indexForSection:", v6);

  if (v8 == -1)
  {
    v15 = (void *)kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)MEMORY[0x1E0CB37E8];
      v17 = v15;
      objc_msgSend(v16, "numberWithInteger:", -1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v18;
      _os_log_impl(&dword_1AF84D000, v17, OS_LOG_TYPE_ERROR, "Invalid section index found: [%@].  Will not attempt to acquire a cell.", (uint8_t *)&v20, 0xCu);

    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cellForRowAtIndexPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v10;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_42(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  NSObject *v11;
  EKDayPreviewController *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412802;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_1AF84D000, v11, OS_LOG_TYPE_DEBUG, "Showing preview of event.  Date to show: [%@].  Overridden start date: [%@]  Overridden start date: [%@]", (uint8_t *)&v13, 0x20u);
    }
    v12 = -[EKDayPreviewController initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:]([EKDayPreviewController alloc], "initWithDate:event:overriddenEventStartDate:overriddenEventEndDate:model:", v7, WeakRetained[134], v8, v9, WeakRetained[127]);
    -[EKDayPreviewController setStyle:](v12, "setStyle:", 2);
    objc_msgSend(WeakRetained, "_pushViewController:animated:", v12, 1);

  }
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_45(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id WeakRetained;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    v20 = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    _os_log_impl(&dword_1AF84D000, v13, OS_LOG_TYPE_DEBUG, "Setting selected date.  Start date:[%@]  End date: [%@].", (uint8_t *)&v20, 0x16u);
  }
  objc_msgSend(v11, "clearCheckmark");
  objc_msgSend(v12, "clearCheckmark");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setProposedStartDate:", v9);

  v15 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v15, "proposeTimeItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPendingProposedTime:", v9);

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v17, "proposeTimeItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "refreshFromCalendarItemAndStore");

  v19 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v19, "updateCustomBackButton");

  objc_msgSend(*(id *)(a1 + 32), "_updateStatusButtons");
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_47(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a2;
  v4 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF84D000, v4, OS_LOG_TYPE_DEBUG, "'Show more alternative times' tapped.", v5, 2u);
  }
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "reloadData");

}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_49(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v15 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isStartDateDirty"))
    v9 = v15;
  else
    v9 = 0;
  v10 = v9;

  v11 = objc_loadWeakRetained(v5);
  objc_msgSend(v11, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEndDateDirty"))
    v13 = v6;
  else
    v13 = 0;
  v14 = v13;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_2_51(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "originalConflictSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "allInviteesCanAttendSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "someInviteesCanAttendSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, void *))(v4 + 16))(v4, v7, v6, v8, v10);

}

uint64_t __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "allInviteesCanAttendSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "originalConflictSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "someInviteesCanAttendSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, void *))(v4 + 16))(v4, v7, v6, v8, v10);

}

uint64_t __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id WeakRetained;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "someInviteesCanAttendSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v3 + 16))(v3, v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __50__EKEventProposeNewTimeViewController_viewDidLoad__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "originalConflictSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v5);
  objc_msgSend(v9, "allInviteesCanAttendSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, void *, void *))(v4 + 16))(v4, v7, v6, v8, v10);

}

- (BOOL)proposedTimeChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;

  -[EKEventProposeNewTimeViewController event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proposedStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[EKEventProposeNewTimeViewController event](self, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proposedStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToDate:", v7);
  }
  else
  {
    -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v10 = 0;
      goto LABEL_6;
    }
    -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController event](self, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToDate:", v9);

  }
  v10 = v8 ^ 1;

LABEL_6:
  return v10;
}

- (void)updateCustomBackButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[EKEventProposeNewTimeViewController proposedTimeChanged](self, "proposedTimeChanged"))
  {
    v3 = objc_alloc(MEMORY[0x1E0DC34F0]);
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Done"), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v5, 0, self, sel__dismiss_);

    -[EKEventProposeNewTimeViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    +[EKRemoteUIButtonAction Done](_TtC10EventKitUI22EKRemoteUIButtonAction, "Done");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v8);

  }
  -[EKEventProposeNewTimeViewController remoteUIDelegate](self, "remoteUIDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController:didChangeLeftBarButtons:rightBarButtons:", self, v10, MEMORY[0x1E0C9AA60]);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventProposeNewTimeViewController;
  -[EKEventProposeNewTimeViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[EKEventProposeNewTimeViewController updateCustomBackButton](self, "updateCustomBackButton");
  -[EKEventProposeNewTimeViewController _refreshIfNeeded](self, "_refreshIfNeeded");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[EKEventProposeNewTimeViewController setViewIsVisible:](self, "setViewIsVisible:", 1);
  v5.receiver = self;
  v5.super_class = (Class)EKEventProposeNewTimeViewController;
  -[EKEventProposeNewTimeViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKEventProposeNewTimeViewController;
  -[EKEventProposeNewTimeViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[EKEventProposeNewTimeViewController setViewIsVisible:](self, "setViewIsVisible:", 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[EKEventProposeNewTimeViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (EKUICurrentWidthSizeClassIsCompactInViewHierarchy(v2))
    v3 = 26;
  else
    v3 = 30;

  return v3;
}

- (void)viewAvailabilityTapped
{
  void *v3;
  void *v4;
  void *v5;
  EKUIAvailabilityViewController *v6;
  void *v7;
  EKUIAvailabilityViewController *v8;
  EKUIAvailabilityNavigationController *v9;
  id v10;

  -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController event](self, "event");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = [EKUIAvailabilityViewController alloc];
  -[EKEventProposeNewTimeViewController event](self, "event");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EKUIAvailabilityViewController initWithEvent:isAttendeeProposeTime:proposedStartDate:proposedEndDate:](v6, "initWithEvent:isAttendeeProposeTime:proposedStartDate:proposedEndDate:", v7, 1, v10, v5);

  -[EKEditItemViewController setEditDelegate:](v8, "setEditDelegate:", self);
  -[EKUIAvailabilityViewController setFromDetail:](v8, "setFromDetail:", 0);
  v9 = -[EKUIAvailabilityNavigationController initWithRootViewController:]([EKUIAvailabilityNavigationController alloc], "initWithRootViewController:", v8);
  -[EKUIAvailabilityViewController preferredContentSize](v8, "preferredContentSize");
  -[EKUIAvailabilityNavigationController setPreferredContentSize:](v9, "setPreferredContentSize:");
  -[EKEventProposeNewTimeViewController _presentViewController:](self, "_presentViewController:", v9);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_sections;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sectionShouldBeShown", (_QWORD)v10);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  if (a4)
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfRows");
  }
  else
  {
    -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfSubitems");
  }
  v6 = v5;

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4)
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "headerTitle");
  }
  else
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Proposed Start Time"), &stru_1E601DFA8, 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForIndexPath:inTableView:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "row");

    objc_msgSend(v8, "cellForSubitemAtIndex:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (EKUICatalyst())
  {
    objc_msgSend(v6, "backgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v11);

  }
  return v9;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canEditRow:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void *v7;
  id v8;

  v8 = a5;
  if (objc_msgSend(v8, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v8, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "commitEditingStyle:forRow:", a4, v8);

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "estimatedHeightForRow:", v5);
    v8 = v7;

  }
  else
  {
    v8 = *MEMORY[0x1E0DC53D8];
  }

  return v8;
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
  double v15;
  double v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "rowHeight");
  v9 = v8;
  if (!objc_msgSend(v7, "section"))
  {
    objc_msgSend(v6, "bounds");
    v11 = v10;
    objc_msgSend(v6, "_backgroundInset");
    v13 = v11 + v12 * -2.0;
    -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "defaultCellHeightForSubitemAtIndex:forWidth:", objc_msgSend(v7, "row"), v13);
    v16 = v15;

    if (v16 > 0.0)
      v9 = v16;
    if (EKUIUnscaledCatalyst())
      v9 = EKUIUnscaledCatalystTableRowHeightDefault();
  }

  return v9;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "canSelectRow:", v5);
    v8 = v5;
    if ((v7 & 1) == 0)
    {

      v8 = 0;
    }
    v9 = v8;

    v10 = v9;
  }
  else
  {
    -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "editor:canSelectSubitem:", 0, objc_msgSend(v5, "row"));

    v10 = 0;
    v9 = v5;
    if (v12)
    {
      v9 = v5;
      v10 = v9;
    }
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v6, "section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectRow:", v6);
  }
  else
  {
    objc_msgSend(v12, "cellForRowAtIndexPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "selectionStyle"))
    {
      objc_msgSend(v12, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);
      -[EKEventProposeNewTimeViewController _popoverController](self, "_popoverController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "selectedResponder");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resignFirstResponder");

      }
      -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "editor:didSelectSubitem:", 0, objc_msgSend(v6, "row"));

    }
  }
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "editor:didDeselectSubitem:", 0, objc_msgSend(v6, "row"));

  }
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    -[EKEventProposeNewTimeViewController _sectionForIndex:](self, "_sectionForIndex:", objc_msgSend(v5, "section"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "editingStyleForRow:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)editItemViewController:(id)a3 didCompleteWithAction:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4)
  {
    v8 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
    {
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1AF84D000, v8, OS_LOG_TYPE_DEBUG, "The user cancelled out from this controller: [%@]", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "modifiedStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController availabilityDateChangedTo:](self, "availabilityDateChangedTo:", v7);

LABEL_7:
    -[EKEventProposeNewTimeViewController _dismissPresentedViewControllerAnimated:](self, "_dismissPresentedViewControllerAnimated:", 1);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  v9 = kEKUILogInviteesHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_1AF84D000, v9, OS_LOG_TYPE_ERROR, "Unrecognized controller completed: [%@]", (uint8_t *)&v10, 0xCu);
  }
LABEL_8:

}

- (void)availabilityDateChangedTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKEventProposeNewTimeViewController dateChangedTo:](self, "dateChangedTo:", v4);
  -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateStartDateToDate:", v4);

}

- (BOOL)editItemViewControllerShouldShowDetachAlert
{
  return 0;
}

- (id)editItemEventToDetach
{
  return 0;
}

- (void)eventStatusButtonsView:(id)a3 didSelectAction:(int64_t)a4 appliesToAll:(BOOL)a5 ifCancelled:(id)a6
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  -[EKEventProposeNewTimeViewController event](self, "event", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProposedStartDate:", 0);

  -[UIResponder EKUI_editor](self, "EKUI_editor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController event](self, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saveEvent:span:error:", v8, 0, 0);

  -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "popViewControllerAnimated:", 1);

}

- (void)doneButtonTapped
{
  -[EKEventProposeNewTimeViewController _dismiss:](self, "_dismiss:", 0);
}

- (void)_dismiss:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  char v11;

  if (-[EKEventProposeNewTimeViewController proposedTimeChanged](self, "proposedTimeChanged", a3))
  {
    -[EKEventProposeNewTimeViewController event](self, "event");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "serverSupportedProposeNewTime");

    -[EKEventProposeNewTimeViewController event](self, "event");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__EKEventProposeNewTimeViewController__dismiss___block_invoke;
    v9[3] = &unk_1E6018C00;
    v11 = v5;
    v9[4] = self;
    v10 = v6;
    v7 = v6;
    v8 = +[EKUISendInviteAlertController presentInviteAlertWithOptions:viewController:withCompletionHandler:](EKUISendInviteAlertController, "presentInviteAlertWithOptions:viewController:withCompletionHandler:", 8, self, v9);

  }
  else
  {
    -[EKEventProposeNewTimeViewController _popViewControllerAnimated:](self, "_popViewControllerAnimated:", 1);
  }
}

void __48__EKEventProposeNewTimeViewController__dismiss___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
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
  EKUIEmailCompositionManager *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id from;
  id location;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "rollback");
    objc_msgSend(*(id *)(a1 + 32), "_popViewControllerAnimated:", 1);
    return;
  }
  if (a2)
    return;
  objc_msgSend(*(id *)(a1 + 32), "proposedStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(unsigned __int8 *)(a1 + 48);

    if (!v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "organizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
      v43 = (id)objc_claimAutoreleasedReturnValue();

      if (+[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", *(_QWORD *)(a1 + 40), v43))
      {
        EventKitUIBundle();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("NEW TIME PROPOSAL:"), &stru_1E601DFA8, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = (void *)MEMORY[0x1E0CB3940];
        EventKitUIBundle();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Can we move this event to <b>%@</b>?"), &stru_1E601DFA8, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x1E0D0C2B0];
        objc_msgSend(*(id *)(a1 + 32), "proposedStartDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "event");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeZone");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "longStringForDateAndTime:inTimeZone:", v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "localizedStringWithFormat:", v23, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = -[EKUIEmailCompositionManager initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:]([EKUIEmailCompositionManager alloc], "initWithEvent:participantRecipients:subjectPrefix:bodyPrefix:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072), v43, v42, v29);
        objc_msgSend(*(id *)(a1 + 32), "setMessageSendingManager:", v30);

        objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v32);

        objc_initWeak(&from, *(id *)(a1 + 32));
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __48__EKEventProposeNewTimeViewController__dismiss___block_invoke_2;
        v45[3] = &unk_1E6018BD8;
        objc_copyWeak(&v48, &location);
        objc_copyWeak(&v49, &from);
        v46 = *(id *)(a1 + 40);
        v33 = v31;
        v47 = v33;
        objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setMessageSendingComplete:", v45);

        objc_msgSend(*(id *)(a1 + 32), "messageSendingManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "viewController");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setModalPresentationStyle:", 2);

        v37 = *(void **)(a1 + 32);
        objc_msgSend(v37, "messageSendingManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "viewController");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "_presentViewController:", v39);

        objc_destroyWeak(&v49);
        objc_destroyWeak(&v48);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "rollback");
        objc_msgSend(*(id *)(a1 + 32), "_popViewControllerAnimated:", 1);
      }

      return;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "participationStatus") == 2)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "participationStatus");

  if (v7 != 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInvitationStatus:", 0);

    objc_msgSend(*(id *)(a1 + 32), "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setParticipationStatus:", 4);
LABEL_8:

  }
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "proposedStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9 == 0;
    v11 = (void *)MEMORY[0x1E0D0CD90];
    objc_msgSend(*(id *)(a1 + 32), "event");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "responseComment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v11, "stringWithAutoCommentRemoved:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "event");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setResponseComment:", v14);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "proposedStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "event");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeZone");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "comment:withInsertedAutoCommentForDate:timeZone:", v13, v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "event");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setResponseComment:", v17);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "proposedStartDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "event");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setProposedStartDate:", v40);

  objc_msgSend(*(id *)(a1 + 32), "EKUI_editor");
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "saveEvent:span:error:", *(_QWORD *)(a1 + 40), 0, 0);
  objc_msgSend(*(id *)(a1 + 32), "_popViewControllerAnimated:", 1);

}

void __48__EKEventProposeNewTimeViewController__dismiss___block_invoke_2(id *a1, char a2)
{
  id *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v4 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v4);

    if (v6)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(a1[5], "saveEvent:span:error:", a1[4], 0, 0);
      else
        objc_msgSend(a1[4], "rollback");
      objc_msgSend(WeakRetained, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

      objc_msgSend(v5, "_popViewControllerAnimated:", 1);
    }
  }

}

- (void)_eventModified:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__EKEventProposeNewTimeViewController__eventModified___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __54__EKEventProposeNewTimeViewController__eventModified___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setResetConflictResolutionSections:", 1);
  result = objc_msgSend(*(id *)(a1 + 32), "viewIsVisible");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_refreshIfNeeded");
  return result;
}

- (void)_fontSizeDefinitionsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__EKEventProposeNewTimeViewController__fontSizeDefinitionsChanged___block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __67__EKEventProposeNewTimeViewController__fontSizeDefinitionsChanged___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reloadAndRegisterReusableCellsWithTableView:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)_popViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "popViewControllerAnimated:", v3);

}

- (void)_pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v4 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "pushViewController:animated:", v10, v4);

}

- (void)_presentViewController:(id)a3
{
  EKUIViewControllerNavigationDelegate **p_navigationDelegate;
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  id v9;

  p_navigationDelegate = &self->_navigationDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_navigationDelegate);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[EKEventProposeNewTimeViewController _viewControllerForPresentingViewControllers](self, "_viewControllerForPresentingViewControllers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_dismissPresentedViewControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationDelegate);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
  }
  else
  {
    -[EKEventProposeNewTimeViewController _viewControllerForPresentingViewControllers](self, "_viewControllerForPresentingViewControllers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", v3, 0);
}

- (id)_viewControllerForPresentingViewControllers
{
  void *v2;
  void *v3;
  id v4;

  -[EKEventProposeNewTimeViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(v2, "parentViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
      v4 = v2;
  }

  return v4;
}

+ (id)_participantsInArray:(id)a3 thatAreNotInArray:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5 != v6)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v26;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v6;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v22;
            while (2)
            {
              v17 = 0;
              do
              {
                if (*(_QWORD *)v22 != v16)
                  objc_enumerationMutation(v13);
                if ((objc_msgSend(v12, "isEqualToParticipant:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v17), v19) & 1) != 0)
                {

                  goto LABEL_17;
                }
                ++v17;
              }
              while (v15 != v17);
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v15)
                continue;
              break;
            }
          }

          objc_msgSend(v20, "addObject:", v12);
LABEL_17:
          ++v11;
        }
        while (v11 != v9);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v9);
    }

    v5 = v19;
  }

  return v20;
}

- (int64_t)_indexForSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t i;
  id v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[8];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[EKEventProposeNewTimeViewController sections](self, "sections", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      v9 = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v11 = *(id *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v11, "sectionShouldBeShown"))
          {
            if (v11 == v4)
              goto LABEL_13;
            ++v9;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v7);
    }
    v9 = -1;
LABEL_13:

  }
  else
  {
    v12 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF84D000, v12, OS_LOG_TYPE_ERROR, "No section given.  Will not try to find an index.", buf, 2u);
    }
    v9 = -1;
  }

  return v9;
}

- (id)_sectionForIndex:(unint64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
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
  v4 = self->_sections;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "sectionShouldBeShown", (_QWORD)v13))
        {
          if (v8 == a3)
          {
            v11 = v10;
            goto LABEL_13;
          }
          ++v8;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)_refreshIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[EKEventProposeNewTimeViewController resetConflictResolutionSections](self, "resetConflictResolutionSections"))
  {
    -[EKEventProposeNewTimeViewController setResetConflictResolutionSections:](self, "setResetConflictResolutionSections:", 0);
    -[EKEventProposeNewTimeViewController event](self, "event");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "calendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ownerAddresses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anyObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[EKEventProposeNewTimeViewController availabilitySearcher](self, "availabilitySearcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventProposeNewTimeViewController event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resetWithEvent:organizerAddressForNewlyScheduledEvent:", v8, v9);

  }
}

- (void)_searcherStateChanged:(int64_t)a3
{
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
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
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
  int v43;
  void *v44;
  int v45;
  int v46;
  int64_t v47;
  int64_t v48;
  unsigned int v49;
  uint64_t v50;
  int64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  int64_t v56;
  unsigned int v57;
  unsigned int v58;
  _QWORD aBlock[5];

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v5, "sectionShouldBeShown");

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v6, "sectionShouldBeShown");

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v7, "sectionShouldBeShown");

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = -[EKEventProposeNewTimeViewController _indexForSection:](self, "_indexForSection:", v8);

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = -[EKEventProposeNewTimeViewController _indexForSection:](self, "_indexForSection:", v9);

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[EKEventProposeNewTimeViewController _indexForSection:](self, "_indexForSection:", v10);

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v11, "numberOfRows");

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v12, "numberOfRows");

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v13, "numberOfRows");

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "availabilitySearcherChangedState:", a3);

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "availabilitySearcherChangedState:", a3);

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = a3;
  objc_msgSend(v16, "availabilitySearcherChangedState:", a3);

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "sectionShouldBeShown");

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "sectionShouldBeShown");

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v21, "sectionShouldBeShown");

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[EKEventProposeNewTimeViewController _indexForSection:](self, "_indexForSection:", v22);

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[EKEventProposeNewTimeViewController _indexForSection:](self, "_indexForSection:", v24);

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[EKEventProposeNewTimeViewController _indexForSection:](self, "_indexForSection:", v26);

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "numberOfRows");

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "numberOfRows");

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "numberOfRows");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__EKEventProposeNewTimeViewController__searcherStateChanged___block_invoke;
  aBlock[3] = &unk_1E6018C28;
  aBlock[4] = self;
  v33 = _Block_copy(aBlock);
  -[EKEventProposeNewTimeViewController tableView](self, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "beginUpdates");

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, void *, _QWORD, int64_t, uint64_t, uint64_t, int64_t, uint64_t, _BYTE))v33
   + 2))(v33, v35, v57, v55, v53, v18, v23, v28, 0);

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v45) = 1;
  (*((void (**)(void *, void *, _QWORD, int64_t, uint64_t, uint64_t, int64_t, uint64_t, int))v33
   + 2))(v33, v36, v58, v56, v54, v20, v25, v30, v45);

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v46) = 1;
    (*((void (**)(void *, void *, _QWORD, int64_t, uint64_t, _QWORD, int64_t, uint64_t, int))v33
     + 2))(v33, v38, v52, v51, v50, v49, v48, v32, v46);

  }
  -[EKEventProposeNewTimeViewController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "endUpdates");

  -[EKEventProposeNewTimeViewController updateCheckmark](self, "updateCheckmark");
  -[EKEvent calendar](self->_event, "calendar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "source");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraints");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "supportsAvailabilityRequests");

  if (v43)
  {
    if (v47)
    {
      -[EKEventProposeNewTimeViewController _cancelAvailabilitySpinnerTimer](self, "_cancelAvailabilitySpinnerTimer");
      -[EKEventProposeNewTimeViewController availabilitySearcherRunningSpinner](self, "availabilitySearcherRunningSpinner");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stopAnimating");

    }
    else
    {
      -[EKEventProposeNewTimeViewController _scheduleAvailabilitySpinnerTimer](self, "_scheduleAvailabilitySpinnerTimer");
    }
  }

}

void __61__EKEventProposeNewTimeViewController__searcherStateChanged___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8)
{
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v16 = v15;
  if (a3 != a6)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v18, OS_LOG_TYPE_DEBUG, "Deleting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "deleteSections:withRowAnimation:", v17, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a7);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v22 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v22, OS_LOG_TYPE_DEBUG, "Inserting sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertSections:withRowAnimation:", v17, 0);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (a5 != a8 && a6)
  {
    if (objc_msgSend(v15, "injectNewRowsBeforeLastExistingRow"))
    {
      v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (a5 - 1 < a8 - 1)
      {
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a5 - 1, a7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v20);

          ++a5;
        }
        while (a8 != a5);
      }
      v21 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v21, OS_LOG_TYPE_DEBUG, "Inserting rows at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "insertRowsAtIndexPaths:withRowAnimation:", v17, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a7);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v23 = kEKUILogInviteesHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138412290;
        v25 = v17;
        _os_log_impl(&dword_1AF84D000, v23, OS_LOG_TYPE_DEBUG, "Reloading sections at index paths: [%@]", (uint8_t *)&v24, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "tableView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "reloadSections:withRowAnimation:", v17, 0);
    }
    goto LABEL_20;
  }
LABEL_21:

}

- (void)_scheduleAvailabilitySpinnerTimer
{
  void *v3;
  _QWORD v4[5];

  -[EKEventProposeNewTimeViewController _cancelAvailabilitySpinnerTimer](self, "_cancelAvailabilitySpinnerTimer");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__EKEventProposeNewTimeViewController__scheduleAvailabilitySpinnerTimer__block_invoke;
  v4[3] = &unk_1E6018C50;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v4, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController setAvailabilitySearcherRunningSpinnerTimer:](self, "setAvailabilitySearcherRunningSpinnerTimer:", v3);

}

void __72__EKEventProposeNewTimeViewController__scheduleAvailabilitySpinnerTimer__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "availabilitySearcherRunningSpinner");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startAnimating");

}

- (void)_cancelAvailabilitySpinnerTimer
{
  void *v3;

  -[EKEventProposeNewTimeViewController availabilitySearcherRunningSpinnerTimer](self, "availabilitySearcherRunningSpinnerTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[EKEventProposeNewTimeViewController setAvailabilitySearcherRunningSpinnerTimer:](self, "setAvailabilitySearcherRunningSpinnerTimer:", 0);
}

- (void)updateCheckmark
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
  char v12;
  id v13;

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearCheckmark");

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCheckmark");

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCheckmark");

  -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshCellsAfterStateChange");

  -[EKEventProposeNewTimeViewController allInviteesCanAttendSection](self, "allInviteesCanAttendSection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "refreshCellsAfterStateChange");

  -[EKEventProposeNewTimeViewController someInviteesCanAttendSection](self, "someInviteesCanAttendSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "refreshCellsAfterStateChange");

  -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventProposeNewTimeViewController event](self, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqualToDate:", v11);

  if ((v12 & 1) == 0)
  {
    -[EKEventProposeNewTimeViewController originalConflictSection](self, "originalConflictSection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clearCheckmark");

  }
}

- (void)dateChangedTo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EKEventProposeNewTimeViewController proposedStartDate](self, "proposedStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = kEKUILogInviteesHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogInviteesHandle, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1AF84D000, v7, OS_LOG_TYPE_INFO, "Proposed time has not changed. Do nothing. Date: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    -[EKEventProposeNewTimeViewController setProposedStartDate:](self, "setProposedStartDate:", v4);
    -[EKEventProposeNewTimeViewController updateCustomBackButton](self, "updateCustomBackButton");
    -[EKEventProposeNewTimeViewController _updateStatusButtons](self, "_updateStatusButtons");
    -[EKEventProposeNewTimeViewController updateCheckmark](self, "updateCheckmark");
    -[EKEventProposeNewTimeViewController proposeTimeItem](self, "proposeTimeItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPendingProposedTime:", 0);

  }
}

- (void)editItem:(id)a3 wantsRowInsertions:(id)a4 rowDeletions:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  EKEventProposeNewTimeViewController *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[EKEventProposeNewTimeViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke;
  v12[3] = &unk_1E6018660;
  v13 = v7;
  v14 = self;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  objc_msgSend(v9, "performBatchUpdates:completion:", v12, &__block_literal_global_4);

}

void __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v15[0] = v3;
    v15[1] = 3221225472;
    v15[2] = __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_2;
    v15[3] = &unk_1E6018C78;
    v16 = v4;
    v6 = v4;
    objc_msgSend(v5, "enumerateIndexesUsingBlock:", v15);
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertRowsAtIndexPaths:withRowAnimation:", v6, 0);

  }
  v8 = *(void **)(a1 + 48);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 48);
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_3;
    v13[3] = &unk_1E6018C78;
    v14 = v9;
    v12 = v9;
    objc_msgSend(v10, "enumerateIndexesUsingBlock:", v13);
    objc_msgSend(*(id *)(a1 + 40), "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 0);

  }
}

void __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __80__EKEventProposeNewTimeViewController_editItem_wantsRowInsertions_rowDeletions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a2, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)editItemRequiresHeightChange:(id)a3
{
  void *v4;
  id v5;

  -[EKEventProposeNewTimeViewController tableView](self, "tableView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginUpdates");

  -[EKEventProposeNewTimeViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endUpdates");

}

- (id)defaultAlertTitleForEditItem:(id)a3
{
  void *v3;
  void *v4;

  EventKitUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Cannot Save Event"), &stru_1E601DFA8, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (EKUIViewControllerNavigationDelegate)navigationDelegate
{
  return (EKUIViewControllerNavigationDelegate *)objc_loadWeakRetained((id *)&self->_navigationDelegate);
}

- (void)setNavigationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_navigationDelegate, a3);
}

- (NSDate)selectedStartDate
{
  return self->_selectedStartDate;
}

- (NSDate)selectedEndDate
{
  return self->_selectedEndDate;
}

- (EKViewControllerRemoteUIDelegate)remoteUIDelegate
{
  return (EKViewControllerRemoteUIDelegate *)objc_loadWeakRetained((id *)&self->_remoteUIDelegate);
}

- (void)setRemoteUIDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteUIDelegate, a3);
}

- (NSDate)originalDate
{
  return self->_originalDate;
}

- (void)setOriginalDate:(id)a3
{
  objc_storeStrong((id *)&self->_originalDate, a3);
}

- (BOOL)resetConflictResolutionSections
{
  return self->_resetConflictResolutionSections;
}

- (void)setResetConflictResolutionSections:(BOOL)a3
{
  self->_resetConflictResolutionSections = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void)setStatusButtonsView:(id)a3
{
  objc_storeStrong((id *)&self->_statusButtonsView, a3);
}

- (void)setStatusButtonsContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_statusButtonsContainerView, a3);
}

- (double)statusButtonsViewCachedFontSize
{
  return self->_statusButtonsViewCachedFontSize;
}

- (void)setStatusButtonsViewCachedFontSize:(double)a3
{
  self->_statusButtonsViewCachedFontSize = a3;
}

- (NSDate)proposedStartDate
{
  return self->_proposedStartDate;
}

- (void)setProposedStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_proposedStartDate, a3);
}

- (UIActivityIndicatorView)availabilitySearcherRunningSpinner
{
  return self->_availabilitySearcherRunningSpinner;
}

- (void)setAvailabilitySearcherRunningSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcherRunningSpinner, a3);
}

- (NSTimer)availabilitySearcherRunningSpinnerTimer
{
  return self->_availabilitySearcherRunningSpinnerTimer;
}

- (void)setAvailabilitySearcherRunningSpinnerTimer:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcherRunningSpinnerTimer, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (EKEventDateEditItem)proposeTimeItem
{
  return self->_proposeTimeItem;
}

- (void)setProposeTimeItem:(id)a3
{
  objc_storeStrong((id *)&self->_proposeTimeItem, a3);
}

- (EKUIInviteesViewOriginalConflictSection)originalConflictSection
{
  return self->_originalConflictSection;
}

- (void)setOriginalConflictSection:(id)a3
{
  objc_storeStrong((id *)&self->_originalConflictSection, a3);
}

- (EKUIInviteesViewSomeInviteesCanAttendSection)someInviteesCanAttendSection
{
  return self->_someInviteesCanAttendSection;
}

- (void)setSomeInviteesCanAttendSection:(id)a3
{
  objc_storeStrong((id *)&self->_someInviteesCanAttendSection, a3);
}

- (EKUIInviteesViewAllInviteesCanAttendSection)allInviteesCanAttendSection
{
  return self->_allInviteesCanAttendSection;
}

- (void)setAllInviteesCanAttendSection:(id)a3
{
  objc_storeStrong((id *)&self->_allInviteesCanAttendSection, a3);
}

- (EKUIInviteesViewAvailabilitySection)viewAvailabilitySection
{
  return self->_viewAvailabilitySection;
}

- (void)setViewAvailabilitySection:(id)a3
{
  objc_storeStrong((id *)&self->_viewAvailabilitySection, a3);
}

- (EKInviteeAlternativeTimeSearcher)availabilitySearcher
{
  return self->_availabilitySearcher;
}

- (void)setAvailabilitySearcher:(id)a3
{
  objc_storeStrong((id *)&self->_availabilitySearcher, a3);
}

- (EKUIEmailCompositionManager)messageSendingManager
{
  return self->_messageSendingManager;
}

- (void)setMessageSendingManager:(id)a3
{
  objc_storeStrong((id *)&self->_messageSendingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageSendingManager, 0);
  objc_storeStrong((id *)&self->_availabilitySearcher, 0);
  objc_storeStrong((id *)&self->_viewAvailabilitySection, 0);
  objc_storeStrong((id *)&self->_allInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_someInviteesCanAttendSection, 0);
  objc_storeStrong((id *)&self->_originalConflictSection, 0);
  objc_storeStrong((id *)&self->_proposeTimeItem, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_availabilitySearcherRunningSpinnerTimer, 0);
  objc_storeStrong((id *)&self->_availabilitySearcherRunningSpinner, 0);
  objc_storeStrong((id *)&self->_proposedStartDate, 0);
  objc_storeStrong((id *)&self->_statusButtonsContainerView, 0);
  objc_storeStrong((id *)&self->_statusButtonsView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_destroyWeak((id *)&self->_remoteUIDelegate);
  objc_storeStrong((id *)&self->_selectedEndDate, 0);
  objc_storeStrong((id *)&self->_selectedStartDate, 0);
  objc_destroyWeak((id *)&self->_navigationDelegate);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
